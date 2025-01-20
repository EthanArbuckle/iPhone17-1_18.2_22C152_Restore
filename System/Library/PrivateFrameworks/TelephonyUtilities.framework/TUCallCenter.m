@interface TUCallCenter
+ (BOOL)isSimultaneousVoiceAndDataSupportedForDialRequest:(id)a3;
+ (BOOL)supportsJoiningConversationWithRequest:(id)a3;
+ (TUCallCenter)callCenterWithQueue:(id)a3;
+ (TUCallCenter)callCenterWithQueue:(id)a3 server:(id)a4 shouldRegister:(BOOL)a5;
+ (TUCallCenter)sharedInstance;
+ (id)sharedContactStore;
+ (id)sharedInstanceWithQueue:(id)a3 server:(id)a4 shouldRegister:(BOOL)a5;
- (BOOL)_canDialWithRequest:(id)a3 shouldUseRelay:(BOOL *)a4;
- (BOOL)_existingCallsAllowDialRequest:(id)a3 allowVoiceWithData:(BOOL)a4;
- (BOOL)_isCallingAvailableOnSecondaryDeviceWithRelayCallingAvailability:(int)a3 isProviderAvailable:(BOOL)a4 isRelayAllowed:(BOOL)a5 isEmergency:(BOOL)a6 supportsBasebandCalling:(BOOL)a7 shouldUseRelay:(BOOL *)a8 isTelephonyProvider:(BOOL)a9;
- (BOOL)_isEmergencyDialRequest:(id)a3;
- (BOOL)_shouldPreferRelayOverDirectSecondaryCallingForRelayingCallingAvailability:(int)a3 isRelayCallingSupported:(BOOL)a4 isEmergencyCallbackPossible:(BOOL)a5 provider:(id)a6;
- (BOOL)_shouldRelayJoinConversationRequest:(id)a3;
- (BOOL)allCallsAreOfService:(int)a3;
- (BOOL)allCallsPassTest:(id)a3;
- (BOOL)anyCallIsEndpointOnCurrentDevice;
- (BOOL)anyCallIsHostedOnCurrentDevice;
- (BOOL)anyCallPassesTest:(id)a3;
- (BOOL)autoPunchOutBehaviorRequiredForFrontmostCall;
- (BOOL)canDialWithRequest:(id)a3;
- (BOOL)canGroupCall:(id)a3 withCall:(id)a4;
- (BOOL)canMergeCalls;
- (BOOL)continueHandoffForConversationWithEligibility:(id)a3;
- (BOOL)existingCallsHaveMultipleProviders;
- (BOOL)handleMediaRemoteCommandForBargeCalls:(unsigned int)a3;
- (BOOL)handleWiredHeadsetFlashButtonForBargeCalls;
- (BOOL)hasCurrentAudioCalls;
- (BOOL)hasCurrentCalls;
- (BOOL)hasCurrentVideoCalls;
- (BOOL)isAddCallAllowed;
- (BOOL)isAmbiguous;
- (BOOL)isDirectCallingCurrentlyAvailableForProvider:(id)a3 isVideo:(BOOL)a4;
- (BOOL)isEndAndAnswerAllowed;
- (BOOL)isHardPauseAvailable;
- (BOOL)isHoldAllowed;
- (BOOL)isHoldAndAnswerAllowed;
- (BOOL)isMergeable;
- (BOOL)isRelayCallingSupportedForProvider:(id)a3 isVideo:(BOOL)a4;
- (BOOL)isSendToVoicemailAllowed;
- (BOOL)isSwappable;
- (BOOL)isTakingCallsPrivateAllowed;
- (BOOL)launchAppForJoinRequest:(id)a3;
- (BOOL)shouldPreferRelayOverDirectSecondaryCallingForProvider:(id)a3 isVideo:(BOOL)a4;
- (BOOL)shouldPullRelayingCalls;
- (CGSize)localLandscapeAspectRatio;
- (CGSize)localPortraitAspectRatio;
- (CNContactStore)contactStore;
- (FBSDisplayLayoutMonitor)monitor;
- (NSArray)bargeCalls;
- (NSArray)callGroupsOnDefaultPairedDevice;
- (NSArray)callsHostedElsewhere;
- (NSArray)callsHostedOrAnEndpointElsewhere;
- (NSArray)callsOnDefaultPairedDevice;
- (NSArray)callsWithAnEndpointElsewhere;
- (NSArray)conferenceParticipantCalls;
- (NSArray)currentAudioAndVideoCallGroups;
- (NSArray)currentAudioAndVideoCalls;
- (NSArray)currentCallGroups;
- (NSArray)currentCalls;
- (NSArray)currentVideoCalls;
- (NSArray)displayedAudioAndVideoCalls;
- (NSArray)displayedCalls;
- (NSArray)incomingCalls;
- (NSString)debugDescription;
- (OS_dispatch_queue)queue;
- (TUAudioDeviceController)audioDeviceController;
- (TUCall)activeVideoCall;
- (TUCall)currentVideoCall;
- (TUCall)frontmostBargeCall;
- (TUCall)incomingCall;
- (TUCall)incomingVideoCall;
- (TUCall)screeningCall;
- (TUCallCenter)init;
- (TUCallCenter)initWithQueue:(id)a3;
- (TUCallCenter)initWithQueue:(id)a3 wantsCallNotifications:(BOOL)a4;
- (TUCallCenter)initWithQueue:(id)a3 wantsCallNotifications:(BOOL)a4 featureFlags:(id)a5;
- (TUCallCenterDelegate)delegateController;
- (TUCallContainerPrivate)callContainer;
- (TUCallFilterController)callFilterController;
- (TUCallProviderManager)providerManager;
- (TUCallServicesInterface)callServicesInterface;
- (TUConversationManager)conversationManager;
- (TUFeatureFlags)featureFlags;
- (TUNeighborhoodActivityConduit)neighborhoodActivityConduit;
- (TURouteController)pairedHostDeviceRouteController;
- (TURouteController)routeController;
- (TUUIDataSource)uiDataSource;
- (TUVideoDeviceController)videoDeviceController;
- (id)_allCalls;
- (id)_dialWithRequest:(id)a3 completion:(id)a4;
- (id)_splitSessionErrorWithCode:(int64_t)a3 underlyingError:(id)a4;
- (id)activeConversationForCall:(id)a3;
- (id)activeConversationForCall:(id)a3 backedByGroupSession:(BOOL)a4;
- (id)audioAndVideoCallsWithStatus:(int)a3;
- (id)audioOrVideoCallWithStatus:(int)a3;
- (id)bargeCallWithUniqueProxyIdentifier:(id)a3;
- (id)bargeCallsPassingTest:(id)a3;
- (id)callForConversationWithGroupUUID:(id)a3;
- (id)callMatchingConversationRequest:(id)a3;
- (id)callPassingTest:(id)a3;
- (id)callPassingTest:(id)a3 sortedUsingComparator:(id)a4;
- (id)callServicesClientCapabilities;
- (id)callWithCallUUID:(id)a3;
- (id)callWithStatus:(int)a3;
- (id)callWithUniqueProxyIdentifier:(id)a3;
- (id)callsPassingTest:(id)a3;
- (id)callsWithGroupUUID:(id)a3;
- (id)callsWithStatus:(int)a3;
- (id)conferenceCall;
- (id)customGreetingForAccountUUID:(id)a3;
- (id)defaultGreeting;
- (id)dialWithRequest:(id)a3;
- (id)disconnectCallPreflight;
- (id)displayedCall;
- (id)displayedCallFromCalls:(id)a3;
- (id)fetchCurrentCallUpdates;
- (id)frontmostAudioOrVideoCall;
- (id)frontmostCall;
- (id)isOnenessActiveBlock;
- (id)joinConversationWithConversationRequest:(id)a3;
- (id)lastDaemonConnectTime;
- (id)launchAppForJoinRequestBlock;
- (id)videoCallWithStatus:(int)a3;
- (os_unfair_lock_s)accessorLock;
- (unint64_t)_callGroupCountForCall:(id)a3 withCall:(id)a4;
- (unint64_t)callCountOnDefaultPairedDevice;
- (unint64_t)countOfCallsPassingTest:(id)a3;
- (unint64_t)currentAudioAndVideoCallCount;
- (unint64_t)currentCallCount;
- (unint64_t)currentVideoCallCount;
- (void)_handleReceivedCallDTMFUpdate:(id)a3 forCall:(id)a4;
- (void)_preflightDisconnectForCalls:(id)a3 withCompletion:(id)a4;
- (void)activateInCallUIWithActivityContinuationIdentifier:(id)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)answerCall:(id)a3;
- (void)answerCall:(id)a3 withSourceIdentifier:(id)a4;
- (void)answerCall:(id)a3 withSourceIdentifier:(id)a4 wantsHoldMusic:(BOOL)a5;
- (void)answerCallWithHoldMusic:(id)a3;
- (void)answerOrJoinCall:(id)a3;
- (void)answerWithRequest:(id)a3;
- (void)applicationWillLaunchForStartCallInteraction:(id)a3;
- (void)continueHandoffEligibleConversation;
- (void)createSplitSessionWithDeviceMediaRouteIdentifier:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteCustomGreetingForAccountUUID:(id)a3;
- (void)dialWithRequest:(id)a3 completion:(id)a4;
- (void)disconnectAllCalls;
- (void)disconnectAllCallsWithNoPreflight;
- (void)disconnectCall:(id)a3;
- (void)disconnectCall:(id)a3 withReason:(int)a4;
- (void)disconnectCurrentCallAndActivateHeld;
- (void)disconnectDeviceFromSplitSessionUsingMediaRouteIdentifier:(id)a3 completion:(id)a4;
- (void)endActiveAndAnswerCall:(id)a3;
- (void)endActiveAndAnswerWithRequest:(id)a3;
- (void)endActiveOrHeldAndAnswerCall:(id)a3;
- (void)endActiveOrHeldAndAnswerWithRequest:(id)a3;
- (void)endHeldAndAnswerCall:(id)a3;
- (void)endHeldAndAnswerWithRequest:(id)a3;
- (void)enteredBackgroundForAllCalls;
- (void)enteredForegroundForCall:(id)a3;
- (void)fetchAnonymousXPCEndpoint:(id)a3;
- (void)fetchCurrentCalls;
- (void)fetchTUUIXPCDataSource;
- (void)groupCall:(id)a3 withOtherCall:(id)a4;
- (void)handleActionForWiredHeadsetMiddleButtonLongPress;
- (void)handleActionForWiredHeadsetMiddleButtonPress;
- (void)handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier:(id)a3 allowBluetoothAnswerWithoutDowngrade:(BOOL)a4 shouldForceDowngradeToAudio:(BOOL)a5;
- (void)handleHeadsetButtonPressForActiveCalls;
- (void)handleMediaRemoteCommand:(unsigned int)a3 completion:(id)a4;
- (void)handleMediaRemoteCommand:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5;
- (void)handleRedialCommandWhileScreening:(id)a3;
- (void)holdActiveAndAnswerCall:(id)a3;
- (void)holdActiveAndAnswerWithRequest:(id)a3;
- (void)holdAndAnswerIfNeeded:(id)a3;
- (void)holdCall:(id)a3;
- (void)joinConversationWithRequest:(id)a3;
- (void)launchAppForDialRequest:(id)a3 completion:(id)a4;
- (void)performRecordingRequest:(id)a3 completion:(id)a4;
- (void)pickRouteForRapportDeviceWithMediaSystemIdentifier:(id)a3 effectiveIdentifier:(id)a4;
- (void)pullCallFromClientUsingHandoffActivityUserInfo:(id)a3 completion:(id)a4;
- (void)pullHostedCallsFromPairedHostDevice;
- (void)pullPersistedChannel:(id)a3;
- (void)pullRelayingCallsFromClient;
- (void)pullRelayingGFTCallsFromClientIfNecessary;
- (void)pushHostedCallsToDestination:(id)a3;
- (void)pushRelayingCallsToHost;
- (void)pushRelayingCallsToHostWithSourceIdentifier:(id)a3;
- (void)registerAnonymousXPCEndpoint:(id)a3;
- (void)registerWithCompletionHandler:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)reportLocalPreviewStoppedForCall:(id)a3;
- (void)requestVideoUpgradeForCall:(id)a3;
- (void)requestVideoUpgradeForCall:(id)a3 originatingUIType:(int)a4;
- (void)saveCustomGreeting:(id)a3 forAccountUUID:(id)a4;
- (void)screenWithRequest:(id)a3;
- (void)sendFieldModeDigits:(id)a3 forProvider:(id)a4;
- (void)sendUserScoreToRTCReporting:(id)a3 withScore:(int)a4;
- (void)setAudioDeviceController:(id)a3;
- (void)setCallFilterController:(id)a3;
- (void)setCallServicesInterface:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setConversationManager:(id)a3;
- (void)setDisconnectCallPreflight:(id)a3;
- (void)setIsOnenessActiveBlock:(id)a3;
- (void)setLaunchAppForJoinRequestBlock:(id)a3;
- (void)setLiveVoicemailUnavailableReason:(int64_t)a3 forCall:(id)a4;
- (void)setLocalLandscapeAspectRatio:(CGSize)a3;
- (void)setLocalPortraitAspectRatio:(CGSize)a3;
- (void)setNeighborhoodActivityConduit:(id)a3;
- (void)setPairedHostDeviceRouteController:(id)a3;
- (void)setProviderManager:(id)a3;
- (void)setRouteController:(id)a3;
- (void)setTTYType:(int)a3 forCall:(id)a4;
- (void)setUiDataSource:(id)a3;
- (void)setVideoDeviceController:(id)a3;
- (void)shouldAllowRingingCallStatusIndicator:(BOOL)a3;
- (void)shouldSuppressInCallStatusBar:(BOOL)a3;
- (void)startTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4;
- (void)stopTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4;
- (void)swapCalls;
- (void)ungroupCall:(id)a3;
- (void)unholdCall:(id)a3;
- (void)updateCall:(id)a3 withAnswerRequest:(id)a4;
- (void)willEnterBackgroundForAllCalls;
@end

@implementation TUCallCenter

+ (id)sharedInstanceWithQueue:(id)a3 server:(id)a4 shouldRegister:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__TUCallCenter_sharedInstanceWithQueue_server_shouldRegister___block_invoke;
  v15[3] = &unk_1E58E8918;
  id v17 = v9;
  id v18 = a1;
  id v16 = v8;
  BOOL v19 = a5;
  uint64_t v10 = sharedInstanceWithQueue_server_shouldRegister__pred;
  id v11 = v9;
  id v12 = v8;
  if (v10 != -1) {
    dispatch_once(&sharedInstanceWithQueue_server_shouldRegister__pred, v15);
  }
  id v13 = (id)sharedInstanceWithQueue_server_shouldRegister__sharedInstance;

  return v13;
}

- (void)registerWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = self;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "for %@", buf, 0xCu);
  }

  v6 = [(TUCallCenter *)self callServicesInterface];
  [v6 requestCurrentStateWithCompletionHandler:v4];

  v7 = [(TUCallCenter *)self callServicesInterface];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__TUCallCenter_registerWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E58E5BE0;
  v8[4] = self;
  [v7 performBlockOnQueue:v8];
}

- (unint64_t)countOfCallsPassingTest:(id)a3
{
  id v4 = a3;
  v5 = [(TUCallCenter *)self callContainer];
  unint64_t v6 = [v5 countOfCallsPassingTest:v4];

  return v6;
}

- (unint64_t)currentCallCount
{
  v2 = [(TUCallCenter *)self callContainer];
  unint64_t v3 = [v2 currentCallCount];

  return v3;
}

- (TUCall)activeVideoCall
{
  v2 = [(TUCallCenter *)self callContainer];
  unint64_t v3 = [v2 activeVideoCall];

  return (TUCall *)v3;
}

- (TUCallContainerPrivate)callContainer
{
  v2 = [(TUCallCenter *)self callServicesInterface];
  unint64_t v3 = [v2 callContainer];

  return (TUCallContainerPrivate *)v3;
}

- (TUCallServicesInterface)callServicesInterface
{
  return self->_callServicesInterface;
}

+ (TUCallCenter)sharedInstance
{
  return (TUCallCenter *)[a1 sharedInstanceWithQueue:0 server:0 shouldRegister:1];
}

uint64_t __62__TUCallCenter_sharedInstanceWithQueue_server_shouldRegister___block_invoke(uint64_t a1)
{
  sharedInstanceWithQueue_server_shouldRegister__sharedInstance = [*(id *)(a1 + 48) callCenterWithQueue:*(void *)(a1 + 32) server:*(void *)(a1 + 40) shouldRegister:*(unsigned __int8 *)(a1 + 56)];

  return MEMORY[0x1F41817F8]();
}

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    objc_msgSend(MEMORY[0x1E4F1B980], "tu_contactStore");
    id v4 = (CNContactStore *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

+ (TUCallCenter)callCenterWithQueue:(id)a3 server:(id)a4 shouldRegister:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithQueue:v9];

  uint64_t v11 = [v10 callServicesInterface];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__TUCallCenter_callCenterWithQueue_server_shouldRegister___block_invoke;
  v17[3] = &unk_1E58E6DB0;
  id v12 = v10;
  id v18 = v12;
  id v19 = v8;
  BOOL v20 = a5;
  id v13 = v8;
  [v11 performBlockOnQueue:v17];

  v14 = v19;
  v15 = (TUCallCenter *)v12;

  return v15;
}

- (TUCallCenter)initWithQueue:(id)a3 wantsCallNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(TUFeatureFlags);
  id v8 = [(TUCallCenter *)self initWithQueue:v6 wantsCallNotifications:v4 featureFlags:v7];

  return v8;
}

- (TUCallCenter)initWithQueue:(id)a3 wantsCallNotifications:(BOOL)a4 featureFlags:(id)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v36.receiver = self;
  v36.super_class = (Class)TUCallCenter;
  uint64_t v10 = [(TUCallCenter *)&v36 init];
  if (v10)
  {
    uint64_t v11 = TUDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v10;
      _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "Initializing TUCallCenter %@", buf, 0xCu);
    }

    v10->_accessorLock._os_unfair_lock_opaque = 0;
    if (v8)
    {
      id v12 = (OS_dispatch_queue *)v8;
      queue = v10->_queue;
      v10->_queue = v12;
    }
    else
    {
      v14 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v15 = MEMORY[0x1E4F14428];
      queue = v10->_queue;
      v10->_queue = v14;
    }

    objc_storeStrong((id *)&v10->_featureFlags, a5);
    id v16 = objc_alloc_init(TUDelegateController);
    delegateController = v10->_delegateController;
    v10->_delegateController = (TUCallCenterDelegate *)v16;

    +[TUCallCapabilities initializeCachedValues];
    id v18 = [[TUCallServicesInterface alloc] initWithQueue:v10->_queue callCenter:v10 wantsCallNotifications:v6];
    callServicesInterface = v10->_callServicesInterface;
    v10->_callServicesInterface = v18;

    objc_initWeak(&location, v10);
    BOOL v20 = (void *)CUTWeakLinkClass();
    v21 = (void *)CUTWeakLinkClass();
    v22 = [v20 configurationForContinuityDisplay];
    [v22 setNeedsUserInteractivePriority:1];
    [v22 setTransitionHandler:&__block_literal_global_154];
    uint64_t v23 = [v21 monitorWithConfiguration:v22];
    monitor = v10->_monitor;
    v10->_monitor = (FBSDisplayLayoutMonitor *)v23;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__TUCallCenter_initWithQueue_wantsCallNotifications_featureFlags___block_invoke_155;
    aBlock[3] = &unk_1E58E8960;
    objc_copyWeak(&v34, &location);
    v25 = _Block_copy(aBlock);
    id launchAppForJoinRequestBlock = v10->_launchAppForJoinRequestBlock;
    v10->_id launchAppForJoinRequestBlock = v25;

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __66__TUCallCenter_initWithQueue_wantsCallNotifications_featureFlags___block_invoke_158;
    v31[3] = &unk_1E58E8988;
    objc_copyWeak(&v32, &location);
    v27 = _Block_copy(v31);
    id isOnenessActiveBlock = v10->_isOnenessActiveBlock;
    v10->_id isOnenessActiveBlock = v27;

    v29 = TUDefaultLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v10;
      _os_log_impl(&dword_19C496000, v29, OS_LOG_TYPE_DEFAULT, "Initialized TUCallCenter %@", buf, 0xCu);
    }

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);

    objc_destroyWeak(&location);
  }

  return v10;
}

void __58__TUCallCenter_callCenterWithQueue_server_shouldRegister___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  unint64_t v3 = [*(id *)(a1 + 32) callServicesInterface];
  [v3 setServer:v2];

  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v4 = *(void **)(a1 + 32);
    [v4 registerWithCompletionHandler:0];
  }
}

uint64_t __46__TUCallCenter_registerWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchTUUIXPCDataSource];
}

- (TUCallCenter)initWithQueue:(id)a3
{
  return [(TUCallCenter *)self initWithQueue:a3 wantsCallNotifications:1];
}

- (void)fetchTUUIXPCDataSource
{
  unint64_t v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "register for UI data source", buf, 2u);
  }

  BOOL v4 = [(TUCallCenter *)self callServicesInterface];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__TUCallCenter_fetchTUUIXPCDataSource__block_invoke;
  v5[3] = &unk_1E58E88F0;
  v5[4] = self;
  [v4 fetchAnonymousXPCEndpoint:v5];
}

- (TURouteController)routeController
{
  unint64_t v3 = [(TUCallCenter *)self callServicesInterface];
  BOOL v4 = [v3 localRouteController];

  if (!v4)
  {
    v5 = [TURouteController alloc];
    BOOL v6 = [(TUCallCenter *)self callServicesInterface];
    v7 = [(TUCallCenter *)self queue];
    id v8 = [(TURouteController *)v5 initWithActionsDelegate:v6 serialQueue:v7];
    id v9 = [(TUCallCenter *)self callServicesInterface];
    [v9 setLocalRouteController:v8];
  }
  uint64_t v10 = [(TUCallCenter *)self callServicesInterface];
  uint64_t v11 = [v10 localRouteController];

  return (TURouteController *)v11;
}

- (TUAudioDeviceController)audioDeviceController
{
  audioDeviceController = self->_audioDeviceController;
  if (!audioDeviceController)
  {
    BOOL v4 = [TUAudioDeviceController alloc];
    v5 = [(TUCallCenter *)self callServicesInterface];
    BOOL v6 = [(TUCallCenter *)self queue];
    v7 = [(TUAudioDeviceController *)v4 initWithActionsDelegate:v5 serialQueue:v6];
    id v8 = self->_audioDeviceController;
    self->_audioDeviceController = v7;

    audioDeviceController = self->_audioDeviceController;
  }

  return audioDeviceController;
}

- (TUVideoDeviceController)videoDeviceController
{
  videoDeviceController = self->_videoDeviceController;
  if (!videoDeviceController)
  {
    BOOL v4 = [TUVideoDeviceController alloc];
    v5 = [(TUCallCenter *)self queue];
    BOOL v6 = [(TUVideoDeviceController *)v4 initWithSerialQueue:v5];
    v7 = self->_videoDeviceController;
    self->_videoDeviceController = v6;

    videoDeviceController = self->_videoDeviceController;
  }

  return videoDeviceController;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (TUCallCenter)callCenterWithQueue:(id)a3
{
  return (TUCallCenter *)[a1 callCenterWithQueue:a3 server:0 shouldRegister:1];
}

- (NSArray)displayedCalls
{
  uint64_t v2 = [(TUCallCenter *)self callContainer];
  unint64_t v3 = [v2 displayedCalls];

  return (NSArray *)v3;
}

void __66__TUCallCenter_initWithQueue_wantsCallNotifications_featureFlags___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__TUCallCenter_initWithQueue_wantsCallNotifications_featureFlags___block_invoke_2;
  v5[3] = &unk_1E58E5BE0;
  id v6 = v3;
  id v4 = v3;
  TUDispatchMainIfNecessary(v5);
}

void __38__TUCallCenter_fetchTUUIXPCDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    TUDefaultLog();
    v7 = (TUUIXPCClientConnection *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
      __38__TUCallCenter_fetchTUUIXPCDataSource__block_invoke_cold_1((uint64_t)v6, &v7->super);
    }
  }
  else
  {
    TUDefaultLog();
    v7 = (TUUIXPCClientConnection *)objc_claimAutoreleasedReturnValue();
    BOOL v8 = os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_19C496000, &v7->super, OS_LOG_TYPE_DEFAULT, "Received UI data source", v9, 2u);
      }

      v7 = [[TUUIXPCClientConnection alloc] initWithListenerEndpoint:v5 callCenter:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) setUiDataSource:v7];
    }
    else if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, &v7->super, OS_LOG_TYPE_DEFAULT, "No UIDataSource is stored in callservicesd", buf, 2u);
    }
  }
}

- (void)setUiDataSource:(id)a3
{
}

- (TUConversationManager)conversationManager
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  conversationManager = self->_conversationManager;
  if (!conversationManager)
  {
    id v5 = objc_alloc_init(TUConversationManager);
    id v6 = self->_conversationManager;
    self->_conversationManager = v5;

    conversationManager = self->_conversationManager;
  }
  v7 = conversationManager;
  os_unfair_lock_unlock(p_accessorLock);

  return v7;
}

void __66__TUCallCenter_initWithQueue_wantsCallNotifications_featureFlags___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Layout monitor changed: layout: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (NSArray)bargeCalls
{
  uint64_t v2 = [(TUCallCenter *)self callContainer];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 bargeCalls];
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (v3) {
    int v4 = v3;
  }
  else {
    int v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)bargeCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUCallCenter *)self callContainer];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 bargeCallWithUniqueProxyIdentifier:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)bargeCallsPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUCallCenter *)self callContainer];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 bargeCallsPassingTest:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (v6) {
    v7 = v6;
  }
  else {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  return v8;
}

- (TUCall)frontmostBargeCall
{
  uint64_t v2 = [(TUCallCenter *)self callContainer];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 frontmostBargeCall];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (TUCall *)v3;
}

- (BOOL)handleWiredHeadsetFlashButtonForBargeCalls
{
  uint64_t v3 = [(TUCallCenter *)self frontmostBargeCall];
  if (![v3 accessoryButtonEventsEnabled]) {
    goto LABEL_7;
  }
  if ([v3 transmissionMode] == 2) {
    goto LABEL_3;
  }
  if (!v3)
  {
LABEL_7:
    BOOL v4 = 0;
    goto LABEL_8;
  }
  if ([v3 isSendingTransmission])
  {
    BOOL v4 = 1;
    [(TUCallCenter *)self stopTransmissionForBargeCall:v3 sourceIsHandsfreeAccessory:1];
    goto LABEL_8;
  }
  if (([v3 isOnHold] & 1) != 0
    || [v3 isReceivingTransmission] && !objc_msgSend(v3, "transmissionMode"))
  {
    BOOL v4 = 1;
    [(TUCallCenter *)self startTransmissionForBargeCall:v3 sourceIsHandsfreeAccessory:1];
    goto LABEL_8;
  }
LABEL_3:
  BOOL v4 = 1;
LABEL_8:

  return v4;
}

- (BOOL)handleMediaRemoteCommandForBargeCalls:(unsigned int)a3
{
  return 0;
}

+ (id)sharedContactStore
{
  if (sharedContactStore_onceToken != -1) {
    dispatch_once(&sharedContactStore_onceToken, &__block_literal_global_57);
  }
  uint64_t v2 = (void *)sharedContactStore_gSharedContactStore;

  return v2;
}

uint64_t __34__TUCallCenter_sharedContactStore__block_invoke()
{
  sharedContactStore_gSharedContactStore = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (TUCallCenter)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUCallCenter.m", 264, @"%s is not available. Use a designated initializer instead.", "-[TUCallCenter init]");

  return 0;
}

BOOL __66__TUCallCenter_initWithQueue_wantsCallNotifications_featureFlags___block_invoke_155(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[TUCallCenter supportsJoiningConversationWithRequest:v3];
  if (v4)
  {
    uint64_t v5 = [v3 activity];
    if (v5)
    {

LABEL_8:
      TUOpenUserActivityForConversationRequest(v3);
      goto LABEL_9;
    }
    if ([v3 hasAnySiriDisplayNames]) {
      goto LABEL_8;
    }
    id v8 = [v3 provider];
    int v9 = [v8 isDefaultProvider];

    if (v9)
    {
      WeakRetained = [v3 URL];
      TUOpenURL(WeakRetained);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      id v10 = (id)[WeakRetained joinConversationWithConversationRequest:v3];
    }
  }
  else
  {
    WeakRetained = TUDefaultLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_19C496000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[WARN] Device does not support multiway", v11, 2u);
    }
  }

LABEL_9:
  return v4;
}

BOOL __66__TUCallCenter_initWithQueue_wantsCallNotifications_featureFlags___block_invoke_158(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained monitor];
  id v3 = [v2 currentLayout];

  return v3 != 0;
}

- (NSString)debugDescription
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@\n", self];
  BOOL v4 = [(TUCallCenter *)self callServicesInterface];
  uint64_t v5 = [v4 debugDescription];
  [v3 appendFormat:@"Call services interface: %@\n", v5];

  uint64_t v6 = [(TUCallCenter *)self audioDeviceController];
  v7 = [v6 debugDescription];
  [v3 appendFormat:@"Audio device controller: %@\n", v7];

  id v8 = [(TUCallCenter *)self providerManager];
  int v9 = [v8 debugDescription];
  [v3 appendFormat:@"Provider manager: %@\n", v9];

  return (NSString *)v3;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = self;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "for %@", buf, 0xCu);
  }

  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  [(FBSDisplayLayoutMonitor *)self->_monitor invalidate];
  uint64_t v5 = [(TUCallCenter *)self callServicesInterface];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __23__TUCallCenter_dealloc__block_invoke;
  v8[3] = &unk_1E58E5BE0;
  id v9 = v5;
  id v6 = v5;
  [v6 performBlockOnQueue:v8];

  v7.receiver = self;
  v7.super_class = (Class)TUCallCenter;
  [(TUCallCenter *)&v7 dealloc];
}

uint64_t __23__TUCallCenter_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) tearDownXPCConnection];
}

- (void)fetchCurrentCalls
{
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Fetching current calls", v5, 2u);
  }

  BOOL v4 = [(TUCallCenter *)self callServicesInterface];
  [v4 fetchCurrentCalls];
}

- (id)fetchCurrentCallUpdates
{
  uint64_t v2 = [(TUCallCenter *)self callServicesInterface];
  id v3 = [v2 fetchCurrentCallUpdates];

  return v3;
}

- (void)screenWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self callServicesInterface];
  [v5 screenWithRequest:v4];
}

- (void)saveCustomGreeting:(id)a3 forAccountUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [[TUSandboxExtendedURL alloc] initWithURL:v7 withExtensionType:0];

  id v8 = [(TUCallCenter *)self callServicesInterface];
  [v8 saveCustomGreeting:v9 forAccountUUID:v6];
}

- (id)customGreetingForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self callServicesInterface];
  id v6 = [v5 customGreetingForAccountUUID:v4];

  return v6;
}

- (void)deleteCustomGreetingForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self callServicesInterface];
  [v5 deleteCustomGreetingForAccountUUID:v4];
}

- (id)defaultGreeting
{
  uint64_t v2 = [(TUCallCenter *)self callServicesInterface];
  id v3 = [v2 defaultGreeting];

  return v3;
}

- (id)callServicesClientCapabilities
{
  uint64_t v2 = [(TUCallCenter *)self callServicesInterface];
  id v3 = [v2 callServicesClientCapabilities];

  return v3;
}

- (TURouteController)pairedHostDeviceRouteController
{
  id v3 = [(TUCallCenter *)self callServicesInterface];
  id v4 = [v3 pairedHostDeviceRouteController];

  if (!v4)
  {
    id v5 = [TURouteController alloc];
    id v6 = [(TUCallCenter *)self callServicesInterface];
    id v7 = [(TUCallCenter *)self queue];
    id v8 = [(TURouteController *)v5 initWithActionsDelegate:v6 serialQueue:v7];
    id v9 = [(TUCallCenter *)self callServicesInterface];
    [v9 setPairedHostDeviceRouteController:v8];
  }
  id v10 = [(TUCallCenter *)self callServicesInterface];
  uint64_t v11 = [v10 pairedHostDeviceRouteController];

  return (TURouteController *)v11;
}

- (TUCallFilterController)callFilterController
{
  callFilterController = self->_callFilterController;
  if (!callFilterController)
  {
    id v4 = [TUCallFilterController alloc];
    id v5 = [(TUCallCenter *)self callServicesInterface];
    id v6 = [(TUCallCenter *)self queue];
    id v7 = [(TUCallFilterController *)v4 initWithActionsDelegate:v5 serialQueue:v6];
    id v8 = self->_callFilterController;
    self->_callFilterController = v7;

    callFilterController = self->_callFilterController;
  }

  return callFilterController;
}

- (TUNeighborhoodActivityConduit)neighborhoodActivityConduit
{
  neighborhoodActivityConduit = self->_neighborhoodActivityConduit;
  if (!neighborhoodActivityConduit)
  {
    id v4 = [TUNeighborhoodActivityConduit alloc];
    id v5 = [(TUCallCenter *)self conversationManager];
    id v6 = [(TUNeighborhoodActivityConduit *)v4 initWithConversationManager:v5];
    id v7 = self->_neighborhoodActivityConduit;
    self->_neighborhoodActivityConduit = v6;

    neighborhoodActivityConduit = self->_neighborhoodActivityConduit;
  }

  return neighborhoodActivityConduit;
}

- (TUCallProviderManager)providerManager
{
  providerManager = self->_providerManager;
  if (!providerManager)
  {
    id v4 = objc_alloc_init(TUCallProviderManager);
    id v5 = self->_providerManager;
    self->_providerManager = v4;

    providerManager = self->_providerManager;
  }

  return providerManager;
}

- (id)lastDaemonConnectTime
{
  uint64_t v2 = [(TUCallCenter *)self callServicesInterface];
  id v3 = [v2 lastDaemonConnectTime];

  return v3;
}

- (BOOL)shouldPullRelayingCalls
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(TUCallCenter *)self currentAudioAndVideoCalls];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isHostedOnCurrentDevice]
          && ([v8 isEndpointOnCurrentDevice] & 1) == 0)
        {
          v5 |= (int)[v8 status] < 5;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

- (BOOL)isRelayCallingSupportedForProvider:(id)a3 isVideo:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  char v5 = (__CFString *)a3;
  if ([(__CFString *)v5 isTelephonyProvider])
  {
    BOOL v6 = +[TUCallCapabilities supportsTelephonyRelayCalling];
    id v7 = TUDefaultLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_26:

      goto LABEL_27;
    }
    BOOL v8 = +[TUCallCapabilities supportsTelephonyRelayCalling];
    id v9 = @"NO";
    if (v8) {
      id v9 = @"YES";
    }
    int v22 = 138412290;
    uint64_t v23 = v9;
    long long v10 = "isRelayCallingSupportedForProvider: TUCallCapabilities.supportsTelephonyRelayCalling: %@";
    long long v11 = v7;
    uint32_t v12 = 12;
LABEL_25:
    _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, v12);
    goto LABEL_26;
  }
  if (([(__CFString *)v5 isFaceTimeProvider] & 1) != 0
    || [(__CFString *)v5 isTinCanProvider])
  {
    if (v4) {
      BOOL v13 = +[TUCallCapabilities supportsFaceTimeVideoRelayCalling];
    }
    else {
      BOOL v13 = +[TUCallCapabilities supportsFaceTimeAudioRelayCalling];
    }
    BOOL v6 = v13;
    id v7 = TUDefaultLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    if ([(__CFString *)v5 isFaceTimeProvider]) {
      v14 = @"YES";
    }
    else {
      v14 = @"NO";
    }
    if (v4) {
      uint64_t v15 = @"YES";
    }
    else {
      uint64_t v15 = @"NO";
    }
    if (+[TUCallCapabilities supportsFaceTimeVideoRelayCalling])
    {
      id v16 = @"YES";
    }
    else
    {
      id v16 = @"NO";
    }
    int v22 = 138413058;
    if (+[TUCallCapabilities supportsFaceTimeAudioRelayCalling])
    {
      id v17 = @"YES";
    }
    else
    {
      id v17 = @"NO";
    }
    uint64_t v23 = v14;
    __int16 v24 = 2112;
    v25 = v15;
    __int16 v26 = 2112;
    v27 = v16;
    __int16 v28 = 2112;
    v29 = v17;
    long long v10 = "isFaceTimeProvider: %@, isVideo: %@, supportsFaceTimeVideoRelayCalling: %@, supportsFaceTimeAudioRelayCalling: %@";
    long long v11 = v7;
    uint32_t v12 = 42;
    goto LABEL_25;
  }
  BOOL v6 = 0;
LABEL_27:
  id v18 = TUDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = @"NO";
    if (v6) {
      BOOL v20 = @"YES";
    }
    else {
      BOOL v20 = @"NO";
    }
    int v22 = 138412802;
    uint64_t v23 = v20;
    __int16 v24 = 2112;
    v25 = v5;
    if (v4) {
      id v19 = @"YES";
    }
    __int16 v26 = 2112;
    v27 = v19;
    _os_log_impl(&dword_19C496000, v18, OS_LOG_TYPE_DEFAULT, "isRelayCallingSupported: %@, provider: %@, isVideo: %@", (uint8_t *)&v22, 0x20u);
  }

  return v6;
}

- (BOOL)isDirectCallingCurrentlyAvailableForProvider:(id)a3 isVideo:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 isTelephonyProvider])
  {
    char SuperboxProvider = +[TUCallCapabilities isDirectTelephonyCallingCurrentlyAvailable];
  }
  else if ([v5 isFaceTimeProvider])
  {
    if (v4) {
      char SuperboxProvider = +[TUCallCapabilities isDirectFaceTimeVideoCallingCurrentlyAvailable];
    }
    else {
      char SuperboxProvider = +[TUCallCapabilities isDirectFaceTimeAudioCallingCurrentlyAvailable];
    }
  }
  else
  {
    if (![v5 isSuperboxProvider])
    {
      BOOL v7 = 1;
      goto LABEL_10;
    }
    char SuperboxProvider = TUShouldCreateSuperboxProvider();
  }
  BOOL v7 = SuperboxProvider;
LABEL_10:

  return v7;
}

- (BOOL)shouldPreferRelayOverDirectSecondaryCallingForProvider:(id)a3 isVideo:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  LOBYTE(v4) = [(TUCallCenter *)self _shouldPreferRelayOverDirectSecondaryCallingForRelayingCallingAvailability:+[TUCallCapabilities relayCallingAvailability](TUCallCapabilities, "relayCallingAvailability") isRelayCallingSupported:[(TUCallCenter *)self isRelayCallingSupportedForProvider:v6 isVideo:v4] isEmergencyCallbackPossible:+[TUCallCapabilities isEmergencyCallbackPossible] provider:v6];

  return v4;
}

- (BOOL)_shouldPreferRelayOverDirectSecondaryCallingForRelayingCallingAvailability:(int)a3 isRelayCallingSupported:(BOOL)a4 isEmergencyCallbackPossible:(BOOL)a5 provider:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v9 = -[TUCallCenter anyCallPassesTest:](self, "anyCallPassesTest:", &__block_literal_global_192, a4, a5, a6);
  long long v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    long long v11 = @"NO";
    if (v6) {
      uint32_t v12 = @"YES";
    }
    else {
      uint32_t v12 = @"NO";
    }
    int v18 = 138413314;
    id v19 = v12;
    if (v7) {
      BOOL v13 = @"YES";
    }
    else {
      BOOL v13 = @"NO";
    }
    __int16 v20 = 2112;
    v21 = v13;
    if (v9) {
      v14 = @"YES";
    }
    else {
      v14 = @"NO";
    }
    __int16 v22 = 1024;
    int v23 = a3;
    if (a3 == 2) {
      long long v11 = @"YES";
    }
    __int16 v24 = 2112;
    v25 = v14;
    __int16 v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "isEmergencyCallbackPossible: %@, isRelayCallingSupported: %@, relayCallingAvailability: %d, isAnyCallHostedElsewhere: %@, preferRelay: %@", (uint8_t *)&v18, 0x30u);
  }

  char v15 = a3 == 2 || v9;
  char v16 = v15 & ~v6;
  if (v7) {
    return v16;
  }
  else {
    return 0;
  }
}

uint64_t __152__TUCallCenter__shouldPreferRelayOverDirectSecondaryCallingForRelayingCallingAvailability_isRelayCallingSupported_isEmergencyCallbackPossible_provider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [v2 isHostedOnCurrentDevice];
    id v5 = @"NO";
    if (v4) {
      id v5 = @"YES";
    }
    int v8 = 138412546;
    BOOL v9 = v5;
    __int16 v10 = 2112;
    id v11 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "call.isHostedOnCurrentDevice: %@, call: %@", (uint8_t *)&v8, 0x16u);
  }

  int v6 = [v2 isHostedOnCurrentDevice];
  return v6 ^ 1u;
}

- (id)_allCalls
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 _allCalls];

  return v3;
}

- (NSArray)currentCalls
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 currentCalls];

  return (NSArray *)v3;
}

- (NSArray)currentVideoCalls
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 currentVideoCalls];

  return (NSArray *)v3;
}

- (NSArray)currentAudioAndVideoCalls
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 currentAudioAndVideoCalls];

  return (NSArray *)v3;
}

- (NSArray)incomingCalls
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 incomingCalls];

  return (NSArray *)v3;
}

- (NSArray)displayedAudioAndVideoCalls
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 displayedAudioAndVideoCalls];

  return (NSArray *)v3;
}

- (NSArray)conferenceParticipantCalls
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 conferenceParticipantCalls];

  return (NSArray *)v3;
}

- (NSArray)callsHostedElsewhere
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 callsHostedElsewhere];

  return (NSArray *)v3;
}

- (NSArray)callsWithAnEndpointElsewhere
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 callsWithAnEndpointElsewhere];

  return (NSArray *)v3;
}

- (NSArray)callsHostedOrAnEndpointElsewhere
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 callsHostedOrAnEndpointElsewhere];

  return (NSArray *)v3;
}

- (NSArray)callsOnDefaultPairedDevice
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 callsOnDefaultPairedDevice];

  return (NSArray *)v3;
}

- (id)callsPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self callContainer];
  int v6 = [v5 callsPassingTest:v4];

  return v6;
}

- (id)callsWithStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(TUCallCenter *)self callContainer];
  id v5 = [v4 callsWithStatus:v3];

  return v5;
}

- (id)audioAndVideoCallsWithStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(TUCallCenter *)self callContainer];
  id v5 = [v4 audioAndVideoCallsWithStatus:v3];

  return v5;
}

- (id)callsWithGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self callContainer];
  int v6 = [v5 callsWithGroupUUID:v4];

  return v6;
}

- (TUCall)incomingCall
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 incomingCall];

  return (TUCall *)v3;
}

- (TUCall)incomingVideoCall
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 incomingVideoCall];

  return (TUCall *)v3;
}

- (TUCall)currentVideoCall
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 currentVideoCall];

  return (TUCall *)v3;
}

- (id)displayedCall
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 displayedCall];

  return v3;
}

- (id)conferenceCall
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 conferenceCall];

  return v3;
}

- (id)frontmostCall
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 frontmostCall];

  return v3;
}

- (id)frontmostAudioOrVideoCall
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 frontmostAudioOrVideoCall];

  return v3;
}

- (TUCall)screeningCall
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 screeningCall];

  return (TUCall *)v3;
}

- (id)callPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self callContainer];
  int v6 = [v5 callPassingTest:v4];

  return v6;
}

- (id)callPassingTest:(id)a3 sortedUsingComparator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(TUCallCenter *)self callContainer];
  BOOL v9 = [v8 callPassingTest:v7 sortedUsingComparator:v6];

  return v9;
}

- (id)callWithStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(TUCallCenter *)self callContainer];
  id v5 = [v4 callWithStatus:v3];

  return v5;
}

- (id)videoCallWithStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(TUCallCenter *)self callContainer];
  id v5 = [v4 videoCallWithStatus:v3];

  return v5;
}

- (id)audioOrVideoCallWithStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(TUCallCenter *)self callContainer];
  id v5 = [v4 audioOrVideoCallWithStatus:v3];

  return v5;
}

- (id)callWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self callContainer];
  id v6 = [v5 callWithUniqueProxyIdentifier:v4];

  return v6;
}

- (id)callWithCallUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self callContainer];
  id v6 = [v5 callWithCallUUID:v4];

  return v6;
}

- (id)displayedCallFromCalls:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self callContainer];
  id v6 = [v5 displayedCallFromCalls:v4];

  return v6;
}

- (unint64_t)currentVideoCallCount
{
  id v2 = [(TUCallCenter *)self callContainer];
  unint64_t v3 = [v2 currentVideoCallCount];

  return v3;
}

- (unint64_t)currentAudioAndVideoCallCount
{
  id v2 = [(TUCallCenter *)self callContainer];
  unint64_t v3 = [v2 currentAudioAndVideoCallCount];

  return v3;
}

- (unint64_t)callCountOnDefaultPairedDevice
{
  id v2 = [(TUCallCenter *)self callContainer];
  unint64_t v3 = [v2 callCountOnDefaultPairedDevice];

  return v3;
}

- (BOOL)hasCurrentCalls
{
  id v2 = [(TUCallCenter *)self callContainer];
  char v3 = [v2 hasCurrentCalls];

  return v3;
}

- (BOOL)hasCurrentAudioCalls
{
  id v2 = [(TUCallCenter *)self callContainer];
  char v3 = [v2 hasCurrentAudioCalls];

  return v3;
}

- (BOOL)hasCurrentVideoCalls
{
  id v2 = [(TUCallCenter *)self callContainer];
  char v3 = [v2 hasCurrentVideoCalls];

  return v3;
}

- (BOOL)anyCallIsHostedOnCurrentDevice
{
  id v2 = [(TUCallCenter *)self callContainer];
  char v3 = [v2 anyCallIsHostedOnCurrentDevice];

  return v3;
}

- (BOOL)anyCallIsEndpointOnCurrentDevice
{
  id v2 = [(TUCallCenter *)self callContainer];
  char v3 = [v2 anyCallIsEndpointOnCurrentDevice];

  return v3;
}

- (BOOL)existingCallsHaveMultipleProviders
{
  id v2 = [(TUCallCenter *)self callContainer];
  char v3 = [v2 existingCallsHaveMultipleProviders];

  return v3;
}

- (BOOL)anyCallPassesTest:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self callContainer];
  char v6 = [v5 anyCallPassesTest:v4];

  return v6;
}

- (BOOL)allCallsPassTest:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self callContainer];
  char v6 = [v5 allCallsPassTest:v4];

  return v6;
}

- (BOOL)allCallsAreOfService:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(TUCallCenter *)self callContainer];
  LOBYTE(v3) = [v4 allCallsAreOfService:v3];

  return v3;
}

- (NSArray)currentCallGroups
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 currentCallGroups];

  return (NSArray *)v3;
}

- (NSArray)currentAudioAndVideoCallGroups
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 currentAudioAndVideoCallGroups];

  return (NSArray *)v3;
}

- (NSArray)callGroupsOnDefaultPairedDevice
{
  id v2 = [(TUCallCenter *)self callContainer];
  uint64_t v3 = [v2 callGroupsOnDefaultPairedDevice];

  return (NSArray *)v3;
}

- (BOOL)_existingCallsAllowDialRequest:(id)a3 allowVoiceWithData:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(TUCallCenter *)self anyCallPassesTest:&__block_literal_global_194];
  int v8 = [v6 provider];
  if ([v8 isTelephonyProvider])
  {
    BOOL v9 = [v6 handle];
    __int16 v10 = [v9 value];
    LODWORD(v29) = [v10 destinationIdIsCallControlCode] ^ 1;
  }
  else
  {
    LODWORD(v29) = 1;
  }

  if ([v6 isVideo])
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v12 = [(TUCallCenter *)self currentCallGroups];
    BOOL v11 = (unint64_t)[v12 count] > 1;
  }
  BOOL v13 = -[TUCallCenter anyCallPassesTest:](self, "anyCallPassesTest:", &__block_literal_global_196, v29);
  BOOL v31 = v11;
  BOOL v14 = v13 && [v6 dialType] == 2;
  BOOL v15 = [(TUCallCenter *)self anyCallPassesTest:&__block_literal_global_198];
  BOOL v16 = [(TUCallCenter *)self anyCallPassesTest:&__block_literal_global_200];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __66__TUCallCenter__existingCallsAllowDialRequest_allowVoiceWithData___block_invoke_5;
  v32[3] = &unk_1E58E6B48;
  id v17 = v6;
  id v33 = v17;
  uint64_t v18 = [(TUCallCenter *)self anyCallPassesTest:v32];
  id v19 = TUDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    [v17 provider];
    v21 = BOOL v20 = v7;
    int v22 = [v21 isTelephonyProvider];
    *(_DWORD *)buf = 67110144;
    int v35 = v18;
    __int16 v36 = 1024;
    int v37 = v4;
    __int16 v38 = 1024;
    BOOL v39 = v16;
    __int16 v40 = 1024;
    BOOL v41 = v15;
    __int16 v42 = 1024;
    int v43 = v22;
    _os_log_impl(&dword_19C496000, v19, OS_LOG_TYPE_DEFAULT, "isVideoUpgrade: %d, allowVoiceWithData: %d, nonTelephonyCallExists: %d, telephonyBasebandCallExists: %d, dialRequest.provider.isTelephonyProvider: %d", buf, 0x20u);

    BOOL v7 = v20;
  }

  if (((v18 | v4) & 1) == 0)
  {
    if (v16)
    {
      uint64_t v18 = [v17 provider];
      int v23 = [(id)v18 isTelephonyProvider];
      if ((v23 & 1) != 0 || !v15)
      {
LABEL_19:

        goto LABEL_21;
      }
LABEL_18:
      __int16 v24 = [v17 provider];
      int v23 = [v24 isTelephonyProvider] ^ 1;

      if (!v16) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
    if (v15) {
      goto LABEL_18;
    }
  }
  int v23 = 0;
LABEL_21:
  int v25 = [v17 isSOS];
  BOOL v26 = [(TUCallCenter *)self anyCallPassesTest:&__block_literal_global_203];
  v27 = TUDefaultLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110400;
    int v35 = v25;
    __int16 v36 = 1024;
    int v37 = v7 & v30;
    __int16 v38 = 1024;
    BOOL v39 = v31;
    __int16 v40 = 1024;
    BOOL v41 = v14;
    __int16 v42 = 1024;
    int v43 = v23;
    __int16 v44 = 1024;
    BOOL v45 = v26;
    _os_log_impl(&dword_19C496000, v27, OS_LOG_TYPE_DEFAULT, "isOutgoingCallSOS: %d outgoingCallCreatesMultipleSendingCalls: %d outgoingCallBreaksCallGroupLimit: %d outgoingCallCreatesMultipleVoicemailCalls: %d outgoingCallMixesVoiceWithData: %d emergencyCallExists: %d", buf, 0x26u);
  }

  if (((v25 | v7 & v30 | (v31 || v14)) & 1) == 0) {
    LOBYTE(v25) = (v23 | v26) ^ 1;
  }

  return v25;
}

uint64_t __66__TUCallCenter__existingCallsAllowDialRequest_allowVoiceWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 3)
  {
    if ([v2 isHostedOnCurrentDevice]) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = [v2 isEndpointOnCurrentDevice];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __66__TUCallCenter__existingCallsAllowDialRequest_allowVoiceWithData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isVoicemail])
  {
    if ([v2 isHostedOnCurrentDevice]) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = [v2 isEndpointOnCurrentDevice];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

BOOL __66__TUCallCenter__existingCallsAllowDialRequest_allowVoiceWithData___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 provider];
  BOOL v4 = [v3 isTelephonyProvider]
    && [v2 isUsingBaseband]
    && [v2 status] != 5;

  return v4;
}

BOOL __66__TUCallCenter__existingCallsAllowDialRequest_allowVoiceWithData___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 provider];
  BOOL v4 = ([v3 isTelephonyProvider] & 1) == 0 && objc_msgSend(v2, "status") != 5;

  return v4;
}

uint64_t __66__TUCallCenter__existingCallsAllowDialRequest_allowVoiceWithData___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 isDialRequestVideoUpgrade:*(void *)(a1 + 32)];
}

uint64_t __66__TUCallCenter__existingCallsAllowDialRequest_allowVoiceWithData___block_invoke_201(uint64_t a1, void *a2)
{
  return [a2 isEmergency];
}

- (BOOL)_isCallingAvailableOnSecondaryDeviceWithRelayCallingAvailability:(int)a3 isProviderAvailable:(BOOL)a4 isRelayAllowed:(BOOL)a5 isEmergency:(BOOL)a6 supportsBasebandCalling:(BOOL)a7 shouldUseRelay:(BOOL *)a8 isTelephonyProvider:(BOOL)a9
{
  BOOL v34 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  BOOL v15 = TUDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v32 = v12;
    id v33 = a8;
    if (v12) {
      BOOL v16 = @"YES";
    }
    else {
      BOOL v16 = @"NO";
    }
    if (v11) {
      id v17 = @"YES";
    }
    else {
      id v17 = @"NO";
    }
    if (v10) {
      uint64_t v18 = @"YES";
    }
    else {
      uint64_t v18 = @"NO";
    }
    if (v34) {
      id v19 = @"YES";
    }
    else {
      id v19 = @"NO";
    }
    int v30 = v19;
    BOOL v31 = v18;
    BOOL v20 = [(TUCallCenter *)self callsHostedElsewhere];
    int v21 = [v20 count];
    *(_DWORD *)buf = 67110658;
    if (a9) {
      int v22 = @"YES";
    }
    else {
      int v22 = @"NO";
    }
    int v36 = a3;
    __int16 v37 = 2112;
    __int16 v38 = v16;
    a8 = v33;
    __int16 v39 = 2112;
    __int16 v40 = v17;
    BOOL v12 = v32;
    __int16 v41 = 2112;
    __int16 v42 = v31;
    __int16 v43 = 2112;
    __int16 v44 = v30;
    __int16 v45 = 1024;
    int v46 = v21;
    __int16 v47 = 2112;
    v48 = v22;
    _os_log_impl(&dword_19C496000, v15, OS_LOG_TYPE_DEFAULT, "relayCallingAvailability: %d isProviderAvailable: %@ isRelayAllowed: %@ isEmergency: %@ supportsBasebandCalling: %@, callsHostedElsewhere count: %d, isTelephonyProvider: %@", buf, 0x40u);
  }
  int v23 = [(TUCallCenter *)self callsHostedElsewhere];
  uint64_t v24 = [v23 count];

  BOOL v25 = a3 == 2 && v11;
  int v26 = 1;
  if (v25 || v10)
  {
LABEL_29:
    if (!a8) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v24) {
    BOOL v27 = v11;
  }
  else {
    BOOL v27 = 0;
  }
  if (v12 && !v27)
  {
    BOOL v25 = 0;
    goto LABEL_29;
  }
  BOOL v25 = a3 == 1 && v11;
  int v26 = v25 || v34;
  if (!a8) {
    goto LABEL_31;
  }
LABEL_30:
  *a8 = v25;
LABEL_31:
  uint64_t v28 = TUDefaultLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v36 = v26;
    __int16 v37 = 1024;
    LODWORD(v38) = v25;
    _os_log_impl(&dword_19C496000, v28, OS_LOG_TYPE_DEFAULT, "performDial: %d useRelay: %d", buf, 0xEu);
  }

  return v26;
}

- (BOOL)_shouldRelayJoinConversationRequest:(id)a3
{
  BOOL v4 = [(TUCallCenter *)self providerManager];
  id v5 = [v4 faceTimeProvider];

  char v14 = 0;
  BOOL v6 = [(TUCallCenter *)self isDirectCallingCurrentlyAvailableForProvider:v5 isVideo:1];
  BOOL v7 = [(TUCallCenter *)self isRelayCallingSupportedForProvider:v5 isVideo:1];
  char v8 = 0;
  if (!+[TUCallCapabilities supportsPrimaryCalling])
  {
    uint64_t v9 = +[TUCallCapabilities relayCallingAvailability];
    BOOL v10 = +[TUCallCapabilities supportsBasebandCalling];
    LOBYTE(v13) = [v5 isTelephonyProvider];
    [(TUCallCenter *)self _isCallingAvailableOnSecondaryDeviceWithRelayCallingAvailability:v9 isProviderAvailable:v6 isRelayAllowed:v7 isEmergency:0 supportsBasebandCalling:v10 shouldUseRelay:&v14 isTelephonyProvider:v13];
    if (v14)
    {
      BOOL v11 = [(TUCallCenter *)self featureFlags];
      char v8 = [v11 gftOnWatch];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_canDialWithRequest:(id)a3 shouldUseRelay:(BOOL *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v21 = [v5 isValid];
  BOOL v6 = -[TUCallCenter _existingCallsAllowDialRequest:allowVoiceWithData:](self, "_existingCallsAllowDialRequest:allowVoiceWithData:", v5, [(id)objc_opt_class() isSimultaneousVoiceAndDataSupportedForDialRequest:v5]);
  BOOL v7 = [(TUCallCenter *)self _isEmergencyDialRequest:v5];
  char v8 = [v5 provider];
  BOOL v9 = -[TUCallCenter isDirectCallingCurrentlyAvailableForProvider:isVideo:](self, "isDirectCallingCurrentlyAvailableForProvider:isVideo:", v8, [v5 isVideo]);

  BOOL v10 = [v5 provider];
  BOOL v11 = -[TUCallCenter isRelayCallingSupportedForProvider:isVideo:](self, "isRelayCallingSupportedForProvider:isVideo:", v10, [v5 isVideo]);

  BOOL v12 = [v5 provider];
  char v13 = [v12 isTelephonyProvider];

  if (v7)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    BOOL v15 = [(TUCallCenter *)self callFilterController];
    int v14 = [v15 shouldRestrictDialRequest:v5 performSynchronously:0] ^ 1;
  }
  if (+[TUCallCapabilities supportsPrimaryCalling])
  {
    BOOL v16 = 1;
  }
  else
  {
    LOBYTE(v19) = v13;
    BOOL v16 = [(TUCallCenter *)self _isCallingAvailableOnSecondaryDeviceWithRelayCallingAvailability:+[TUCallCapabilities relayCallingAvailability](TUCallCapabilities, "relayCallingAvailability") isProviderAvailable:v9 isRelayAllowed:v11 isEmergency:v7 supportsBasebandCalling:+[TUCallCapabilities supportsBasebandCalling] shouldUseRelay:a4 isTelephonyProvider:v19];
  }
  id v17 = TUDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    int v23 = v21;
    __int16 v24 = 1024;
    BOOL v25 = v6;
    __int16 v26 = 1024;
    BOOL v27 = v16;
    _os_log_impl(&dword_19C496000, v17, OS_LOG_TYPE_DEFAULT, "isDialRequestValid: %d existingCallsAllowOutgoingCall: %d isCallingAvailable: %d", buf, 0x14u);
  }

  return v21 & v6 & v16 & v14;
}

- (BOOL)_isEmergencyDialRequest:(id)a3
{
  id v3 = a3;
  if ([v3 dialType] == 1)
  {
    char v4 = 1;
  }
  else
  {
    id v5 = objc_alloc_init(TUSenderIdentityClient);
    BOOL v6 = [v3 handle];
    BOOL v7 = [v6 value];
    char v8 = [v3 localSenderIdentityUUID];
    if ([(TUSenderIdentityClient *)v5 isEmergencyNumberForDigits:v7 senderIdentityUUID:v8])
    {
      char v4 = 1;
    }
    else
    {
      BOOL v9 = [v3 handle];
      BOOL v10 = [v9 value];
      BOOL v11 = [v3 localSenderIdentityUUID];
      char v4 = [(TUSenderIdentityClient *)v5 isWhitelistedEmergencyNumberForDigits:v10 senderIdentityUUID:v11];
    }
  }

  return v4;
}

- (BOOL)canDialWithRequest:(id)a3
{
  return [(TUCallCenter *)self _canDialWithRequest:a3 shouldUseRelay:0];
}

- (id)dialWithRequest:(id)a3
{
  id v3 = [(TUCallCenter *)self _dialWithRequest:a3 completion:0];
  if (!v3)
  {
    char v4 = TUDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[TUCallCenter dialWithRequest:]();
    }
  }

  return v3;
}

- (void)dialWithRequest:(id)a3 completion:(id)a4
{
  id v4 = [(TUCallCenter *)self _dialWithRequest:a3 completion:a4];
}

- (id)_dialWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (TUJoinConversationRequest *)a3;
  BOOL v7 = (void (**)(id, void))a4;
  char v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v40 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "for dial request %@", buf, 0xCu);
  }

  BOOL v9 = [MEMORY[0x1E4F1C9C8] date];
  [(TUJoinConversationRequest *)v6 setDateDialed:v9];

  TUDialAssistedDialRequest(v6);
  BOOL v10 = (TUJoinConversationRequest *)objc_claimAutoreleasedReturnValue();

  if (![(TUJoinConversationRequest *)v10 originatingUIType])
  {
    BOOL v11 = TUDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[TUCallCenter _dialWithRequest:completion:]((uint64_t)v10, v11);
    }
  }
  if ([(TUJoinConversationRequest *)v10 dialType]
    || ([(TUJoinConversationRequest *)v10 handle],
        BOOL v12 = objc_claimAutoreleasedReturnValue(),
        [v12 value],
        char v13 = objc_claimAutoreleasedReturnValue(),
        BOOL v14 = TUIsMMIOrUSSDNumber(v13),
        v13,
        v12,
        !v14))
  {
    char v38 = 0;
    if (![(TUCallCenter *)self _canDialWithRequest:v10 shouldUseRelay:&v38])
    {
      BOOL v16 = TUDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19C496000, v16, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot satisfy dial request. Returning nil call", buf, 2u);
      }
      goto LABEL_22;
    }
    [(TUJoinConversationRequest *)v10 setHostOnCurrentDevice:v38 == 0];
    id v17 = [(TUJoinConversationRequest *)v10 provider];
    if ([v17 isFaceTimeProvider]
      && ![(TUJoinConversationRequest *)v10 isVideo]
      && [(TUJoinConversationRequest *)v10 endpointOnCurrentDevice])
    {
      uint64_t v18 = [(TUJoinConversationRequest *)v10 endpointIDSDestination];
      if (!v18)
      {
        BOOL v22 = +[TUConversationManager supportsConversations];

        if (v22)
        {
          id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          __int16 v24 = [(TUJoinConversationRequest *)v10 handle];

          if (v24)
          {
            BOOL v25 = [TUConversationMember alloc];
            __int16 v26 = [(TUJoinConversationRequest *)v10 handle];
            BOOL v27 = [(TUConversationMember *)v25 initWithHandle:v26];

            [v23 addObject:v27];
          }
          uint64_t v28 = [[TUJoinConversationRequest alloc] initWithRemoteMembers:v23];
          id v29 = objc_alloc(MEMORY[0x1E4F29128]);
          int v30 = [(TUJoinConversationRequest *)v10 uniqueProxyIdentifier];
          BOOL v31 = (void *)[v29 initWithUUIDString:v30];

          if (v31) {
            [(TUJoinConversationRequest *)v28 setUUID:v31];
          }
          [(TUJoinConversationRequest *)v28 setVideo:0];
          [(TUJoinConversationRequest *)v28 setAvMode:1];
          [(TUJoinConversationRequest *)v28 setVideoEnabled:0];
          BOOL v32 = [(TUJoinConversationRequest *)v10 localSenderIdentityUUID];

          if (v32)
          {
            id v33 = [(TUJoinConversationRequest *)v10 localSenderIdentity];
            BOOL v34 = [v33 handle];
            [(TUJoinConversationRequest *)v28 setCallerID:v34];
          }
          int v35 = +[TUConversationProvider expanseProvider];
          [(TUJoinConversationRequest *)v28 setProvider:v35];

          int v36 = [(TUJoinConversationRequest *)v10 audioSourceIdentifier];
          [(TUJoinConversationRequest *)v28 setAudioSourceIdentifier:v36];

          __int16 v37 = TUDefaultLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v40 = v28;
            _os_log_impl(&dword_19C496000, v37, OS_LOG_TYPE_DEFAULT, "Upgrading dialRequest to joinRequest with expanseProvider since it is a 1:1 FTA %@", buf, 0xCu);
          }

          [(TUCallCenter *)self launchAppForJoinRequest:v28];
          goto LABEL_24;
        }
LABEL_19:
        [(TUJoinConversationRequest *)v10 setHostOnCurrentDevice:v38 == 0];
        [(TUCallCenter *)self localLandscapeAspectRatio];
        -[TUJoinConversationRequest setLocalLandscapeAspectRatio:](v10, "setLocalLandscapeAspectRatio:");
        [(TUCallCenter *)self localPortraitAspectRatio];
        -[TUJoinConversationRequest setLocalPortraitAspectRatio:](v10, "setLocalPortraitAspectRatio:");
        uint64_t v19 = [(TUCallCenter *)self callServicesInterface];
        BOOL v20 = [v19 dialWithRequest:v10 completion:v7];

        goto LABEL_25;
      }
    }
    goto LABEL_19;
  }
  BOOL v15 = TUDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v40 = v10;
    _os_log_impl(&dword_19C496000, v15, OS_LOG_TYPE_DEFAULT, "Dial request with normal type appears to contain an MMI/USSD code: %@", buf, 0xCu);
  }

  BOOL v16 = [(TUCallCenter *)self callServicesInterface];
  [v16 sendMMIOrUSSDCodeWithRequest:v10];
LABEL_22:

  if (v7) {
    v7[2](v7, 0);
  }
LABEL_24:
  BOOL v20 = 0;
LABEL_25:

  return v20;
}

- (void)applicationWillLaunchForStartCallInteraction:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "interaction: %@", (uint8_t *)&v9, 0xCu);
  }

  BOOL v6 = [(TUCallCenter *)self providerManager];
  BOOL v7 = [v4 intent];
  char v8 = objc_msgSend(v7, "_intents_bundleIdForLaunching");
  [v6 donateUserIntentForProviderWithIdentifier:v8];
}

- (void)launchAppForDialRequest:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "dialRequest: %@", buf, 0xCu);
  }

  int v9 = [(TUCallCenter *)self providerManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__TUCallCenter_launchAppForDialRequest_completion___block_invoke;
  v11[3] = &unk_1E58E6788;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 launchAppForDialRequest:v6 completion:v11];
}

void __51__TUCallCenter_launchAppForDialRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) callServicesInterface];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__TUCallCenter_launchAppForDialRequest_completion___block_invoke_2;
    v5[3] = &unk_1E58E6760;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    [v4 performBlockOnQueue:v5];
  }
}

uint64_t __51__TUCallCenter_launchAppForDialRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (BOOL)isSimultaneousVoiceAndDataSupportedForDialRequest:(id)a3
{
  id v3 = [a3 localSenderIdentityUUID];
  if (v3) {
    BOOL v4 = +[TUCallCapabilities isSimultaneousVoiceAndDataSupportedForSIMWithUUID:v3];
  }
  else {
    BOOL v4 = +[TUCallCapabilities supportsSimultaneousVoiceAndData];
  }
  BOOL v5 = v4;

  return v5;
}

- (void)sendFieldModeDigits:(id)a3 forProvider:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "sendFieldModeDigits: %@ for provider: %@", (uint8_t *)&v12, 0x16u);
  }

  int v9 = [[TUDialRequest alloc] initWithProvider:v7];
  id v10 = [[TUHandle alloc] initWithType:2 value:v6];
  [(TUDialRequest *)v9 setHandle:v10];

  [(TUDialRequest *)v9 setOriginatingUIType:40];
  uint64_t v11 = [(TUCallCenter *)self callServicesInterface];
  [v11 sendMMIOrUSSDCodeWithRequest:v9];
}

- (void)answerCall:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "answerCall: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [[TUAnswerRequest alloc] initWithCall:v4];
  [(TUCallCenter *)self answerWithRequest:v6];
}

- (void)holdAndAnswerIfNeeded:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(TUCallCenter *)self isHoldAndAnswerAllowed];
  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = @"NO";
    if (v5) {
      int v7 = @"YES";
    }
    int v15 = 138412546;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "holdAndAnswerIfNeeded, isHoldAndAnswerAllowed: %@ for call: %@", (uint8_t *)&v15, 0x16u);
  }

  id v8 = (void *)CFPreferencesCopyValue(@"CleethorpesEnabled", @"com.apple.InCallService", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & v5) == 1) {
    int v10 = [v8 BOOLValue];
  }
  else {
    int v10 = v5 & ~isKindOfClass;
  }
  uint64_t v11 = [(TUCallCenter *)self featureFlags];
  if (([v11 incomingBannerOverSixUpEnabled] & 1) == 0)
  {
    int v12 = [(TUCallCenter *)self featureFlags];
    if ([v12 embedSwapBannerEnabled])
    {

      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      id v13 = [(TUCallCenter *)self featureFlags];
      int v14 = [v13 callManagerEnabled];

      if (v14 & v10) {
        goto LABEL_10;
      }
    }
LABEL_15:
    [(TUCallCenter *)self answerCall:v4];
    goto LABEL_16;
  }

  if (!v10) {
    goto LABEL_15;
  }
LABEL_10:
  [(TUCallCenter *)self holdActiveAndAnswerCall:v4];
LABEL_16:
}

- (void)answerOrJoinCall:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "answerOrJoinCall: %@", (uint8_t *)&v19, 0xCu);
  }

  if ([v4 status] == 6 || objc_msgSend(v4, "status") == 5)
  {
    id v6 = TUDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[TUCallCenter answerOrJoinCall:]();
    }
  }
  else if ([v4 isConversation] {
         && ([(TUCallCenter *)self activeConversationForCall:v4],
  }
             int v7 = objc_claimAutoreleasedReturnValue(),
             v7,
             v7))
  {
    id v8 = [(TUCallCenter *)self activeConversationForCall:v4];
    uint64_t v9 = [v8 link];
    if (v9 && (int v10 = (void *)v9, v11 = [v8 letMeInRequestState], v10, v11 == 1))
    {
      int v12 = [TUJoinConversationRequest alloc];
      id v13 = [v8 link];
      int v14 = [MEMORY[0x1E4F1CAD0] set];
      int v15 = [(TUJoinConversationRequest *)v12 initWithConversationLink:v13 otherInvitedHandles:v14 sendLetMeInRequest:1];
    }
    else
    {
      int v15 = [[TUJoinConversationRequest alloc] initWithConversation:v8 originatingUIType:36];
    }
    uint64_t v16 = [v4 uniqueProxyIdentifierUUID];
    [(TUJoinConversationRequest *)v15 setUUID:v16];

    -[TUJoinConversationRequest setVideoEnabled:](v15, "setVideoEnabled:", [v4 isSendingVideo]);
    if ([v8 avMode])
    {
      uint64_t v17 = [v8 avMode];
    }
    else if ([v4 isSendingVideo])
    {
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v17 = 1;
    }
    [(TUJoinConversationRequest *)v15 setAvMode:v17];
    id v18 = [(TUCallCenter *)self joinConversationWithConversationRequest:v15];
  }
  else
  {
    [(TUCallCenter *)self holdAndAnswerIfNeeded:v4];
  }
}

- (void)answerCall:(id)a3 withSourceIdentifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "call: %@ sourceIdentifier: %@", (uint8_t *)&v9, 0x16u);
  }

  [(TUCallCenter *)self answerCall:v6 withSourceIdentifier:v7 wantsHoldMusic:0];
}

- (void)answerCallWithHoldMusic:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "answerCallWithHoldMusic: %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUCallCenter *)self answerCall:v4 withSourceIdentifier:0 wantsHoldMusic:1];
}

- (void)answerCall:(id)a3 withSourceIdentifier:(id)a4 wantsHoldMusic:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 1024;
    BOOL v17 = v5;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "call: %@ sourceIdentifier: %@ wantsHoldMusic: %d", (uint8_t *)&v12, 0x1Cu);
  }

  __int16 v11 = [[TUAnswerRequest alloc] initWithCall:v8];
  [(TUAnswerRequest *)v11 setSourceIdentifier:v9];
  [(TUAnswerRequest *)v11 setWantsHoldMusic:v5];
  [(TUCallCenter *)self answerWithRequest:v11];
}

- (void)holdActiveAndAnswerCall:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "holdActiveAndAnswerCall: %@", (uint8_t *)&v7, 0xCu);
  }

  int v6 = [[TUAnswerRequest alloc] initWithCall:v4];
  [(TUCallCenter *)self holdActiveAndAnswerWithRequest:v6];
}

- (void)holdActiveAndAnswerWithRequest:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "holdActiveAndAnswerWithRequest: %@", (uint8_t *)&v6, 0xCu);
  }

  [v4 setBehavior:2];
  [(TUCallCenter *)self answerWithRequest:v4];
}

- (void)endActiveAndAnswerCall:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "endActiveAndAnswerCall: %@", (uint8_t *)&v7, 0xCu);
  }

  int v6 = [[TUAnswerRequest alloc] initWithCall:v4];
  [(TUCallCenter *)self endActiveAndAnswerWithRequest:v6];
}

- (void)endActiveAndAnswerWithRequest:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "endActiveAndAnswerWithRequest: %@", (uint8_t *)&v6, 0xCu);
  }

  [v4 setBehavior:0];
  [(TUCallCenter *)self answerWithRequest:v4];
}

- (void)endHeldAndAnswerCall:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "endHeldAndAnswerCall: %@", (uint8_t *)&v7, 0xCu);
  }

  int v6 = [[TUAnswerRequest alloc] initWithCall:v4];
  [(TUCallCenter *)self endHeldAndAnswerWithRequest:v6];
}

- (void)endHeldAndAnswerWithRequest:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "endHeldAndAnswerWithRequest: %@", (uint8_t *)&v6, 0xCu);
  }

  [v4 setBehavior:1];
  [(TUCallCenter *)self answerWithRequest:v4];
}

- (void)endActiveOrHeldAndAnswerCall:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "endActiveOrHeldAndAnswerCall: %@", (uint8_t *)&v7, 0xCu);
  }

  int v6 = [[TUAnswerRequest alloc] initWithCall:v4];
  [(TUCallCenter *)self endActiveOrHeldAndAnswerWithRequest:v6];
}

- (void)endActiveOrHeldAndAnswerWithRequest:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "endActiveOrHeldAndAnswerWithRequest: %@", (uint8_t *)&v7, 0xCu);
  }

  int v6 = [(TUCallCenter *)self audioOrVideoCallWithStatus:1];

  if (v6) {
    [(TUCallCenter *)self endActiveAndAnswerWithRequest:v4];
  }
  else {
    [(TUCallCenter *)self endHeldAndAnswerWithRequest:v4];
  }
}

- (void)reportLocalPreviewStoppedForCall:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "reportLocalPreviewStoppedForCall: %@", (uint8_t *)&v8, 0xCu);
  }

  int v6 = [(TUCallCenter *)self callServicesInterface];
  int v7 = [v4 uniqueProxyIdentifier];
  [v6 reportLocalPreviewStoppedForCallWithUniqueProxyIdentifier:v7];
}

- (void)answerWithRequest:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(TUCallCenter *)self _allCalls];
    *(_DWORD *)buf = 138412546;
    id v62 = v4;
    __int16 v63 = 2112;
    v64 = v6;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "answerRequest: %@ - Current calls are %@", buf, 0x16u);
  }
  int v7 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setDateAnswered:v7];

  int v8 = [v4 uniqueProxyIdentifier];
  id v9 = [(TUCallCenter *)self callWithUniqueProxyIdentifier:v8];

  if ([v4 behavior] == 4)
  {
    [v9 isVideo];
    int v10 = 1;
  }
  else
  {
    int v11 = [v4 downgradeToAudio];
    int v12 = [v9 isVideo];
    int v10 = v12 | v11;
    if (v12 && (v11 & 1) == 0)
    {
      if (([v4 allowBluetoothAnswerWithoutDowngrade] & 1) == 0)
      {
        uint64_t v13 = [v4 sourceIdentifier];
        if (v13)
        {
          __int16 v14 = (void *)v13;
          id v15 = [(TUCallCenter *)self routeController];
          __int16 v16 = [v4 sourceIdentifier];
          BOOL v17 = [v15 routeWithSourceIdentifier:v16];
          int v18 = [v17 isBluetooth];

          if (v18)
          {
            int v19 = TUDefaultLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v62 = v9;
              _os_log_impl(&dword_19C496000, v19, OS_LOG_TYPE_DEFAULT, "We are asked to answer with bluetooth route for a video call - Ignoring to answer %@", buf, 0xCu);
            }

            id v20 = (void *)MEMORY[0x1E4F1CB10];
            uint64_t v21 = [v4 sourceIdentifier];
            BOOL v22 = [v20 faceTimeAnswerURLWithSourceIdentifier:v21];

            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = __34__TUCallCenter_answerWithRequest___block_invoke;
            v57[3] = &unk_1E58E89B0;
            id v58 = v22;
            id v59 = v9;
            id v23 = v22;
            TUOpenURLWithCompletion(v23, v57);

            goto LABEL_42;
          }
        }
      }
      int v10 = 0;
    }
  }
  if (v9)
  {
    int v39 = v10;
    __int16 v42 = v4;
    uint64_t v41 = [(TUCallCenter *)self audioAndVideoCallsWithStatus:1];
    __int16 v40 = [(TUCallCenter *)self audioAndVideoCallsWithStatus:2];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    __int16 v24 = [(TUCallCenter *)self _allCalls];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v54 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          if ([v29 status] == 4 && (objc_msgSend(v29, "isEqualToCall:", v9) & 1) == 0)
          {
            int v30 = TUDefaultLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v62 = v29;
              _os_log_impl(&dword_19C496000, v30, OS_LOG_TYPE_DEFAULT, "Another ringing call exists while we are trying to answer this call. Declining the other ringing call: %@", buf, 0xCu);
            }

            [(TUCallCenter *)self disconnectCall:v29 withReason:2];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v53 objects:v60 count:16];
      }
      while (v26);
    }

    [(TUCallCenter *)self localLandscapeAspectRatio];
    id v4 = v42;
    objc_msgSend(v42, "setLocalLandscapeAspectRatio:");
    [(TUCallCenter *)self localPortraitAspectRatio];
    objc_msgSend(v42, "setLocalPortraitAspectRatio:");
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __34__TUCallCenter_answerWithRequest___block_invoke_225;
    v51[3] = &unk_1E58E6B48;
    id v31 = v9;
    id v52 = v31;
    if (((![(TUCallCenter *)self anyCallPassesTest:v51] | v39) & 1) == 0)
    {
      BOOL v32 = TUDefaultLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19C496000, v32, OS_LOG_TYPE_DEFAULT, "Overriding answer behavior to video upgrade", buf, 2u);
      }

      [v42 setBehavior:3];
    }
    uint64_t v33 = [v42 behavior];
    if ((unint64_t)(v33 - 2) < 3)
    {
      BOOL v34 = [(TUCallCenter *)self callServicesInterface];
      [v34 answerCallWithRequest:v42];

      int v35 = [v42 endpointIDSDestination];

      int v36 = v40;
      id v23 = v41;
      if (!v35) {
        [(TUCallCenter *)self updateCall:v31 withAnswerRequest:v42];
      }
      goto LABEL_41;
    }
    int v36 = v40;
    id v23 = v41;
    if (v33 == 1)
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __34__TUCallCenter_answerWithRequest___block_invoke_2;
      v43[3] = &unk_1E58E89D8;
      v43[4] = self;
      id v44 = v42;
      id v45 = v40;
      id v46 = v31;
      [(TUCallCenter *)self _preflightDisconnectForCalls:v45 withCompletion:v43];

      char v38 = v44;
    }
    else
    {
      if (v33)
      {
LABEL_41:

        goto LABEL_42;
      }
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __34__TUCallCenter_answerWithRequest___block_invoke_226;
      v47[3] = &unk_1E58E89D8;
      v47[4] = self;
      id v48 = v42;
      uint64_t v49 = v41;
      id v50 = v31;
      [(TUCallCenter *)self _preflightDisconnectForCalls:v49 withCompletion:v47];

      char v38 = v48;
    }

    goto LABEL_41;
  }
  id v23 = TUDefaultLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v37 = [v4 uniqueProxyIdentifier];
    *(_DWORD *)buf = 138412290;
    id v62 = v37;
    _os_log_impl(&dword_19C496000, v23, OS_LOG_TYPE_DEFAULT, "[WARN] No call found to answer for uniqueProxyIdentifier %@", buf, 0xCu);
  }
LABEL_42:
}

void __34__TUCallCenter_answerWithRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "TUOpenURLWithCompletion result: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v6)
  {
    int v8 = TUDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __34__TUCallCenter_answerWithRequest___block_invoke_cold_1(a1, v8);
    }
  }
}

uint64_t __34__TUCallCenter_answerWithRequest___block_invoke_225(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isVideoUpgradeFromCall:a2];
}

void __34__TUCallCenter_answerWithRequest___block_invoke_226(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) callServicesInterface];
    [v3 answerCallWithRequest:*(void *)(a1 + 40)];

    id v4 = [*(id *)(a1 + 40) endpointIDSDestination];

    if (!v4)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = *(id *)(a1 + 48);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setTransitionStatus:", 5, (void)v10);
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }

      [*(id *)(a1 + 32) updateCall:*(void *)(a1 + 56) withAnswerRequest:*(void *)(a1 + 40)];
    }
  }
}

void __34__TUCallCenter_answerWithRequest___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) callServicesInterface];
    [v3 answerCallWithRequest:*(void *)(a1 + 40)];

    id v4 = [*(id *)(a1 + 40) endpointIDSDestination];

    if (!v4)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = *(id *)(a1 + 48);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setTransitionStatus:", 5, (void)v10);
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }

      [*(id *)(a1 + 32) updateCall:*(void *)(a1 + 56) withAnswerRequest:*(void *)(a1 + 40)];
    }
  }
}

- (void)updateCall:(id)a3 withAnswerRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 callNotificationManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__TUCallCenter_updateCall_withAnswerRequest___block_invoke;
  v10[3] = &unk_1E58E5C08;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 deferNotificationsUntilAfterPerformingBlock:v10];
}

uint64_t __45__TUCallCenter_updateCall_withAnswerRequest___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTransitionStatus:1];
  id v2 = [*(id *)(a1 + 40) sourceIdentifier];
  [*(id *)(a1 + 32) setSourceIdentifier:v2];

  objc_msgSend(*(id *)(a1 + 32), "setWantsHoldMusic:", objc_msgSend(*(id *)(a1 + 40), "wantsHoldMusic"));
  objc_msgSend(*(id *)(a1 + 32), "setScreening:", objc_msgSend(*(id *)(a1 + 40), "sendToScreening"));
  if ([*(id *)(a1 + 40) pauseVideoToStart]) {
    [*(id *)(a1 + 32) setIsSendingVideo:0];
  }
  if ([*(id *)(a1 + 40) behavior] == 4
    || (uint64_t result = [*(id *)(a1 + 40) downgradeToAudio], result))
  {
    [*(id *)(a1 + 32) setIsSendingVideo:0];
    uint64_t result = [*(id *)(a1 + 32) isConversation];
    if ((result & 1) == 0)
    {
      id v4 = *(void **)(a1 + 32);
      return [v4 setVideo:0];
    }
  }
  return result;
}

- (void)holdCall:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(TUCallCenter *)self _allCalls];
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "call: %@ - Current calls are %@", (uint8_t *)&v9, 0x16u);
  }
  if (v4 && ([v4 isOnHold] & 1) == 0)
  {
    [v4 setProvisionalHoldStatus:1];
    uint64_t v7 = [(TUCallCenter *)self callServicesInterface];
    id v8 = [v4 uniqueProxyIdentifier];
    [v7 holdCallWithUniqueProxyIdentifier:v8];
  }
}

- (void)requestVideoUpgradeForCall:(id)a3 originatingUIType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6 && ([v6 isVideo] & 1) == 0 && objc_msgSend(v7, "status") == 1)
  {
    if (![v7 isConversation])
    {
      id v10 = [TUDialRequest alloc];
      __int16 v11 = [(TUCallCenter *)self providerManager];
      id v12 = [v11 faceTimeProvider];
      uint64_t v13 = [(TUDialRequest *)v10 initWithProvider:v12];

      __int16 v14 = [v7 handle];
      [(TUDialRequest *)v13 setHandle:v14];

      uint64_t v15 = [v7 contactIdentifier];
      [(TUDialRequest *)v13 setContactIdentifier:v15];

      [(TUDialRequest *)v13 setVideo:1];
      [(TUDialRequest *)v13 setPerformDialAssist:0];
      [(TUDialRequest *)v13 setOriginatingUIType:v4];
      __int16 v16 = [(TUDialRequest *)v13 URL];
      TUOpenURL(v16);

      goto LABEL_9;
    }
    id v8 = [(TUCallCenter *)self callServicesInterface];
    int v9 = [v7 uniqueProxyIdentifier];
    [v8 requestVideoUpgradeForCallWithUniqueProxyIdentifier:v9];
  }
  else
  {
    id v8 = TUDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      int v18 = v7;
      _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Failing call: %@ to upgrade", (uint8_t *)&v17, 0xCu);
    }
  }

LABEL_9:
}

- (void)requestVideoUpgradeForCall:(id)a3
{
}

- (void)unholdCall:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(TUCallCenter *)self _allCalls];
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "call: %@ - Current calls are %@", (uint8_t *)&v9, 0x16u);
  }
  if (v4 && [v4 isOnHold])
  {
    [v4 setProvisionalHoldStatus:2];
    uint64_t v7 = [(TUCallCenter *)self callServicesInterface];
    id v8 = [v4 uniqueProxyIdentifier];
    [v7 unholdCallWithUniqueProxyIdentifier:v8];
  }
}

- (void)swapCalls
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(TUCallCenter *)self _allCalls];
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "- Current calls are %@", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(TUCallCenter *)self callServicesInterface];
  [v5 swapCalls];
}

- (void)groupCall:(id)a3 withOtherCall:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "call: %@ otherCall: %@", (uint8_t *)&v12, 0x16u);
  }

  int v9 = [(TUCallCenter *)self callServicesInterface];
  id v10 = [v6 uniqueProxyIdentifier];
  __int16 v11 = [v7 uniqueProxyIdentifier];
  [v9 groupCallWithUniqueProxyIdentifier:v10 withOtherCallWithUniqueProxyIdentifier:v11];
}

- (void)ungroupCall:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "call: %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(TUCallCenter *)self callServicesInterface];
  id v7 = [v4 uniqueProxyIdentifier];
  [v6 ungroupCallWithUniqueProxyIdentifier:v7];
}

- (void)_preflightDisconnectForCalls:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(TUCallCenter *)self disconnectCallPreflight];

  if (v8)
  {
    id v9 = [(TUCallCenter *)self disconnectCallPreflight];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__TUCallCenter__preflightDisconnectForCalls_withCompletion___block_invoke;
    v10[3] = &unk_1E58E8A00;
    id v11 = v6;
    id v12 = v7;
    ((void (**)(void, id, void *))v9)[2](v9, v11, v10);
  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

uint64_t __60__TUCallCenter__preflightDisconnectForCalls_withCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    id v3 = TUDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Calls %@ not allowed to disconnect", (uint8_t *)&v6, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)disconnectCall:(id)a3
{
}

- (void)disconnectCall:(id)a3 withReason:(int)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(TUCallCenter *)self _allCalls];
    *(_DWORD *)buf = 138412802;
    id v16 = v6;
    __int16 v17 = 1024;
    int v18 = a4;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "disconnectCall: %@ reason: %d - Current calls are %@", buf, 0x1Cu);
  }
  if (v6)
  {
    id v14 = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__TUCallCenter_disconnectCall_withReason___block_invoke;
    v11[3] = &unk_1E58E8A28;
    id v12 = v6;
    int v13 = a4;
    [(TUCallCenter *)self _preflightDisconnectForCalls:v9 withCompletion:v11];

    uint64_t v10 = v12;
  }
  else
  {
    uint64_t v10 = TUDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring disconnectCall request because provided call was nil", buf, 2u);
    }
  }
}

uint64_t __42__TUCallCenter_disconnectCall_withReason___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) disconnectWithReason:*(unsigned int *)(result + 40)];
  }
  return result;
}

- (void)disconnectCurrentCallAndActivateHeld
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(TUCallCenter *)self _allCalls];
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "- Current calls are %@", buf, 0xCu);
  }
  id v5 = [(TUCallCenter *)self audioOrVideoCallWithStatus:3];
  id v6 = [(TUCallCenter *)self audioAndVideoCallsWithStatus:1];
  uint64_t v7 = [(TUCallCenter *)self audioAndVideoCallsWithStatus:2];
  if (v5)
  {
    id v12 = v5;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  }
  else if ([v6 count])
  {
    id v8 = v6;
  }
  else
  {
    id v8 = v7;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__TUCallCenter_disconnectCurrentCallAndActivateHeld__block_invoke;
  v10[3] = &unk_1E58E8A50;
  void v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(TUCallCenter *)self _preflightDisconnectForCalls:v9 withCompletion:v10];
}

void __52__TUCallCenter_disconnectCurrentCallAndActivateHeld__block_invoke(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) callServicesInterface];
    [v3 disconnectCurrentCallAndActivateHeld];

    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setTransitionStatus:", 5, (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)disconnectAllCalls
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(TUCallCenter *)self _allCalls];
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "- Current calls are %@", buf, 0xCu);
  }
  uint64_t v5 = [(TUCallCenter *)self currentCalls];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__TUCallCenter_disconnectAllCalls__block_invoke;
  v6[3] = &unk_1E58E8A78;
  v6[4] = self;
  [(TUCallCenter *)self _preflightDisconnectForCalls:v5 withCompletion:v6];
}

uint64_t __34__TUCallCenter_disconnectAllCalls__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) disconnectAllCallsWithNoPreflight];
  }
  return result;
}

- (void)disconnectAllCallsWithNoPreflight
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Proceeding to disconnect all calls", buf, 2u);
  }

  id v4 = [(TUCallCenter *)self callServicesInterface];
  [v4 disconnectAllCalls];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(TUCallCenter *)self currentCalls];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setTransitionStatus:5];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)handleActionForWiredHeadsetMiddleButtonPress
{
}

- (void)handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier:(id)a3 allowBluetoothAnswerWithoutDowngrade:(BOOL)a4 shouldForceDowngradeToAudio:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (__CFString *)a3;
  uint64_t v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = [(TUCallCenter *)self _allCalls];
    *(_DWORD *)buf = 138412290;
    BOOL v34 = v10;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "- Current calls are %@", buf, 0xCu);
  }
  long long v11 = [(TUCallCenter *)self audioOrVideoCallWithStatus:4];
  long long v12 = [(TUCallCenter *)self screeningCall];
  long long v13 = [(TUCallCenter *)self callWithStatus:1];
  uint64_t v14 = [(TUCallCenter *)self callWithStatus:2];
  uint64_t v15 = [(TUCallCenter *)self audioOrVideoCallWithStatus:1];
  uint64_t v28 = [(TUCallCenter *)self activeConversationForCall:v15];
  if (v11)
  {
    uint64_t v16 = [[TUAnswerRequest alloc] initWithCall:v11];
    __int16 v17 = v16;
    if (v8) {
      int v18 = v8;
    }
    else {
      int v18 = @"TUCallSourceIdentifierMikeyRoute";
    }
    -[TUAnswerRequest setSourceIdentifier:](v16, "setSourceIdentifier:", v18, v28);
    [(TUAnswerRequest *)v17 setAllowBluetoothAnswerWithoutDowngrade:v6];
    if (v13 && v14 && ([v11 isVideo] & 1) == 0)
    {
      [(TUAnswerRequest *)v17 setBehavior:1];
    }
    else if ([(TUCallCenter *)self isHoldAndAnswerAllowed])
    {
      [(TUAnswerRequest *)v17 setBehavior:2];
    }
    else
    {
      if (![(TUCallCenter *)self isEndAndAnswerAllowed])
      {

        __int16 v17 = 0;
        if (!v5)
        {
LABEL_14:
          if (v17)
          {
LABEL_15:
            [(TUCallCenter *)self answerWithRequest:v17];
LABEL_25:

            goto LABEL_33;
          }
LABEL_24:
          [(TUCallCenter *)self disconnectAllCalls];
          goto LABEL_25;
        }
LABEL_13:
        [(TUAnswerRequest *)v17 setBehavior:4];
        goto LABEL_14;
      }
      [(TUAnswerRequest *)v17 setBehavior:0];
    }
    if (!v5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v12)
  {
    __int16 v19 = [[TUAnswerRequest alloc] initWithCall:v12];
    __int16 v17 = v19;
    if (v8) {
      id v20 = v8;
    }
    else {
      id v20 = @"TUCallSourceIdentifierMikeyRoute";
    }
    -[TUAnswerRequest setSourceIdentifier:](v19, "setSourceIdentifier:", v20, v28);
    if (v17) {
      goto LABEL_15;
    }
    goto LABEL_24;
  }
  if ([v28 hasJoinedActivitySession])
  {
    uint64_t v21 = (objc_class *)CUTWeakLinkClass();
    BOOL v22 = (void *)CUTWeakLinkClass();
    id v23 = [v21 alloc];
    __int16 v24 = [v22 localOrigin];
    uint64_t v25 = (void *)[v23 initWithOrigin:v24];

    objc_initWeak((id *)buf, self);
    id v26 = MEMORY[0x1E4F14428];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __146__TUCallCenter_handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier_allowBluetoothAnswerWithoutDowngrade_shouldForceDowngradeToAudio___block_invoke;
    v29[3] = &unk_1E58E8AA0;
    objc_copyWeak(&v32, (id *)buf);
    id v30 = v28;
    id v27 = v25;
    id v31 = v27;
    [v27 nowPlayingPlayerPathOnQueue:MEMORY[0x1E4F14428] completion:v29];

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(TUCallCenter *)self handleHeadsetButtonPressForActiveCalls];
  }
LABEL_33:
}

void __146__TUCallCenter_handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier_allowBluetoothAnswerWithoutDowngrade_shouldForceDowngradeToAudio___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    BOOL v5 = [v3 client];
    BOOL v6 = [v5 bundleIdentifier];
    uint64_t v7 = [a1[4] joinedActivitySession];
    uint64_t v8 = [v7 activity];
    uint64_t v9 = [v8 bundleIdentifier];
    int v10 = [v6 isEqualToString:v9];

    if (v10)
    {
      long long v11 = TUDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v12 = 0;
        _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "Forwarding headset button press to MediaRemote because an activity session is controlling media playback", v12, 2u);
      }

      [a1[5] sendCommand:2 options:0 queue:MEMORY[0x1E4F14428] completion:0];
    }
    else
    {
      [WeakRetained handleHeadsetButtonPressForActiveCalls];
    }
  }
}

- (void)handleHeadsetButtonPressForActiveCalls
{
  id v4 = [(TUCallCenter *)self callWithStatus:1];
  id v3 = [(TUCallCenter *)self callWithStatus:2];
  if (v4 && v3)
  {
    [(TUCallCenter *)self swapCalls];
  }
  else if ([v4 isScreening])
  {
    [(TUCallCenter *)self answerCall:v4];
  }
  else
  {
    [(TUCallCenter *)self disconnectCurrentCallAndActivateHeld];
  }
}

- (void)handleActionForWiredHeadsetMiddleButtonLongPress
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(TUCallCenter *)self _allCalls];
    int v8 = 138412290;
    uint64_t v9 = v4;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "current calls are %@", (uint8_t *)&v8, 0xCu);
  }
  BOOL v5 = [(TUCallCenter *)self audioOrVideoCallWithStatus:4];
  uint64_t v6 = [(TUCallCenter *)self callWithStatus:1];
  uint64_t v7 = (void *)v6;
  if (v5)
  {
    [(TUCallCenter *)self disconnectCall:v5 withReason:2];
  }
  else if (v6 && [(TUCallCenter *)self currentCallCount] >= 2)
  {
    [(TUCallCenter *)self disconnectCurrentCallAndActivateHeld];
  }
}

- (void)activateInCallUIWithActivityContinuationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self callServicesInterface];
  [v5 activateInCallUIWithActivityContinuationIdentifier:v4];
}

- (void)setTTYType:(int)a3 forCall:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v8 = [(TUCallCenter *)self callServicesInterface];
  uint64_t v7 = [v6 uniqueProxyIdentifier];

  [v8 setTTYType:v4 forCallWithUniqueProxyIdentifier:v7];
}

- (void)setLiveVoicemailUnavailableReason:(int64_t)a3 forCall:(id)a4
{
  id v6 = a4;
  id v8 = [(TUCallCenter *)self callServicesInterface];
  uint64_t v7 = [v6 uniqueProxyIdentifier];

  [v8 setLiveVoicemailUnavailableReason:a3 forCallWithUniqueProxyIdentifier:v7];
}

- (void)pullCallFromClientUsingHandoffActivityUserInfo:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "userInfo: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(TUCallCenter *)self callServicesInterface];
  [v9 pullCallFromClientUsingHandoffActivityUserInfo:v6 completion:v7];
}

- (void)pullPersistedChannel:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self callServicesInterface];
  [v5 pullPersistedChannel:v4];
}

- (void)startTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isPTT])
  {
    if ([v6 transmissionMode] == 2)
    {
      id v7 = TUDefaultLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        goto LABEL_12;
      }
      __int16 v12 = 0;
      id v8 = "Could not start transmission because barge call was in simplex mode.";
      uint64_t v9 = (uint8_t *)&v12;
    }
    else
    {
      if (![v6 isReceivingTransmission] || !objc_msgSend(v6, "transmissionMode"))
      {
        int v10 = [(TUCallCenter *)self callServicesInterface];
        [v10 startTransmissionForBargeCall:v6 sourceIsHandsfreeAccessory:v4];

        goto LABEL_12;
      }
      id v7 = TUDefaultLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      __int16 v11 = 0;
      id v8 = "Could not start transmission because barge call was receiving a transmission and does not support full-duplex mode.";
      uint64_t v9 = (uint8_t *)&v11;
    }
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_10;
  }
LABEL_12:
}

- (void)stopTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([v7 isPTT])
  {
    id v6 = [(TUCallCenter *)self callServicesInterface];
    [v6 stopTransmissionForBargeCall:v7 sourceIsHandsfreeAccessory:v4];
  }
}

- (void)pushRelayingCallsToHost
{
}

- (void)pushRelayingCallsToHostWithSourceIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(TUCallCenter *)self _allCalls];
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "sourceIdentifier: %@ - Current calls are %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(TUCallCenter *)self callServicesInterface];
  [v7 pushRelayingCallsToHostWithSourceIdentifier:v4];
}

- (void)pullRelayingCallsFromClient
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(TUCallCenter *)self _allCalls];
    int v6 = 136315394;
    id v7 = "-[TUCallCenter pullRelayingCallsFromClient]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "%s: - Current calls are %@", (uint8_t *)&v6, 0x16u);
  }
  if ([(TUCallCenter *)self shouldPullRelayingCalls])
  {
    id v5 = [(TUCallCenter *)self callServicesInterface];
    [v5 pullRelayingCallsFromClient];
  }
}

- (void)pullRelayingGFTCallsFromClientIfNecessary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(TUCallCenter *)self _allCalls];
    int v6 = 136315394;
    id v7 = "-[TUCallCenter pullRelayingGFTCallsFromClientIfNecessary]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "%s: - Current calls are %@", (uint8_t *)&v6, 0x16u);
  }
  if ([(TUCallCenter *)self shouldPullRelayingCalls])
  {
    id v5 = [(TUCallCenter *)self callServicesInterface];
    [v5 pullRelayingGFTCallsFromClientIfNecessary];
  }
}

- (void)pushHostedCallsToDestination:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(TUCallCenter *)self _allCalls];
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "destination: %@ - Current calls are %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(TUCallCenter *)self callServicesInterface];
  [v7 pushHostedCallsToDestination:v4];
}

- (void)pullHostedCallsFromPairedHostDevice
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(TUCallCenter *)self _allCalls];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "- Current calls are %@", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(TUCallCenter *)self callServicesInterface];
  [v5 pullHostedCallsFromPairedHostDevice];
}

- (void)pickRouteForRapportDeviceWithMediaSystemIdentifier:(id)a3 effectiveIdentifier:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TUCallCenter *)self routeController];
  id v9 = [v8 routes];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v25 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * v14);
      uint64_t v16 = objc_msgSend(v15, "uniqueIdentifier", (void)v24);
      if ([v6 length] && objc_msgSend(v6, "isEqualToString:", v16))
      {
        __int16 v17 = TUDefaultLog();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 138412546;
        id v29 = v6;
        __int16 v30 = 2112;
        id v31 = v15;
        int v18 = "Found route matching rapportMediaSystemIdentifier=\"%@\", route=%@";
        goto LABEL_17;
      }
      if ([v7 length] && objc_msgSend(v7, "isEqualToString:", v16)) {
        break;
      }

      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    __int16 v17 = TUDefaultLog();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412546;
    id v29 = v7;
    __int16 v30 = 2112;
    id v31 = v15;
    int v18 = "Found route matching rapportEffectiveIdentifier=\"%@\", route=%@";
LABEL_17:
    _os_log_impl(&dword_19C496000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);
LABEL_18:

    id v19 = v15;
    if (!v19) {
      goto LABEL_20;
    }
    id v20 = [(TUCallCenter *)self routeController];
    [v20 pickRoute:v19];
  }
  else
  {
LABEL_12:

LABEL_20:
    uint64_t v21 = TUDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v29 = v6;
      __int16 v30 = 2112;
      id v31 = v7;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl(&dword_19C496000, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find any routes matching rapportMediaSystemIdentifier %@ or rapportEffectiveIdentifier %@ among availableRoutes %@, attempting to pick route when available...", buf, 0x20u);
    }

    BOOL v22 = [(TUCallCenter *)self routeController];
    id v19 = v22;
    if (v6) {
      id v23 = v6;
    }
    else {
      id v23 = v7;
    }
    objc_msgSend(v22, "pickRouteWhenAvailableWithUniqueIdentifier:", v23, (void)v24);
  }
}

- (void)joinConversationWithRequest:(id)a3
{
  id v4 = a3;
  if (+[TUConversationManager supportsConversations]) {
    [(TUCallCenter *)self launchAppForJoinRequest:v4];
  }
}

- (BOOL)launchAppForJoinRequest:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(TUCallCenter *)self launchAppForJoinRequestBlock];
  char v7 = ((uint64_t (**)(void, id))v6)[2](v6, v4);

  return v7;
}

- (BOOL)autoPunchOutBehaviorRequiredForFrontmostCall
{
  id v3 = [(TUCallCenter *)self currentAudioAndVideoCalls];

  if (!v3) {
    return 0;
  }
  id v4 = [(TUCallCenter *)self frontmostAudioOrVideoCall];

  if (!v4) {
    return 0;
  }
  id v5 = [(TUCallCenter *)self frontmostAudioOrVideoCall];
  id v6 = [v5 provider];

  char v7 = [(TUCallCenter *)self currentAudioAndVideoCalls];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    while (1)
    {
      id v10 = [(TUCallCenter *)self currentAudioAndVideoCalls];
      uint64_t v11 = [v10 objectAtIndexedSubscript:v9];

      uint64_t v12 = [v11 provider];
      char v13 = [v12 isEqualToCallProvider:v6];

      if ((v13 & 1) == 0) {
        break;
      }
      ++v9;
      uint64_t v14 = [(TUCallCenter *)self currentAudioAndVideoCalls];
      unint64_t v15 = [v14 count];

      if (v15 <= v9) {
        goto LABEL_7;
      }
    }
    BOOL v19 = 0;
  }
  else
  {
LABEL_7:
    char v16 = [v6 isSystemProvider];
    __int16 v17 = [(TUCallCenter *)self audioOrVideoCallWithStatus:4];
    BOOL v18 = v17 == 0;

    BOOL v19 = v18 & ~v16;
  }

  return v19;
}

- (void)continueHandoffEligibleConversation
{
  id v3 = [(TUCallCenter *)self featureFlags];
  int v4 = [v3 conversationHandoffEnabled];

  if (v4)
  {
    [(TUCallCenter *)self continueHandoffForConversationWithEligibility:0];
  }
}

- (BOOL)continueHandoffForConversationWithEligibility:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallCenter *)self featureFlags];
  int v6 = [v5 conversationHandoffEnabled];

  if (v6)
  {
    char v7 = [(TUCallCenter *)self conversationManager];
    uint64_t v8 = [v7 joinRequestForApplicableConversationWithHandoffEligibility:v4];

    unint64_t v9 = TUDefaultLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        int v15 = 138412290;
        char v16 = v8;
        _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Handing off conversation to this device using %@", (uint8_t *)&v15, 0xCu);
      }

      BOOL v11 = [(TUCallCenter *)self launchAppForJoinRequest:v8];
    }
    else
    {
      if (v10)
      {
        uint64_t v12 = [(TUCallCenter *)self conversationManager];
        char v13 = [v12 activeConversations];
        int v15 = 138412290;
        char v16 = v13;
        _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Cannot continue handoff as could not find conversation with active handoff eligibility, or a conversation was already in non-waiting state. All conversations: %@", (uint8_t *)&v15, 0xCu);
      }
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsJoiningConversationWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(TUFeatureFlags);
  if ([(TUFeatureFlags *)v4 greenTeaLinksEnabled])
  {
    id v5 = [v3 remoteMembers];
    if ((unint64_t)[v5 count] > 1)
    {
      BOOL v7 = 0;
    }
    else
    {
      int v6 = [v3 conversationLink];
      BOOL v7 = v6 != 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  if (([v3 isOneToOne] & 1) == 0 && !v7)
  {
    BOOL v8 = +[TUConversationManager supportsConversations];
LABEL_12:
    LOBYTE(v9) = v8;
    goto LABEL_13;
  }
  if ([v3 avMode] == 2)
  {
    BOOL v8 = +[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls];
    goto LABEL_12;
  }
  if (+[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls])
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    BOOL v11 = [v3 provider];
    int v9 = [v11 isDefaultProvider] ^ 1;
  }
LABEL_13:

  return v9;
}

- (id)joinConversationWithConversationRequest:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v92 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "joinConversationWithConversationRequest - request: %@", buf, 0xCu);
  }

  if (+[TUCallCenter supportsJoiningConversationWithRequest:v4])
  {
    int v6 = [v4 provider];
    if ([v6 supportsLinks])
    {
      uint64_t v7 = [v4 conversationLink];
      if (!v7)
      {

LABEL_14:
        uint64_t v12 = [(TUCallCenter *)self conversationManager];
        char v13 = [v4 remoteMembers];
        uint64_t v14 = [v4 conversationLink];
        BOOL v10 = [v12 activeConversationWithRemoteMembers:v13 andLink:v14];

        goto LABEL_15;
      }
      BOOL v8 = (void *)v7;
      int v9 = [v4 isJoiningConversationWithLink];

      if (v9) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    uint64_t v12 = [(TUCallCenter *)self conversationManager];
    char v13 = [v4 conversationLink];
    BOOL v10 = [v12 pendingConversationWithLink:v13];
LABEL_15:

    int v15 = [v4 provider];
    int v16 = [v15 supportsLinks];

    uint64_t v17 = [(TUCallCenter *)self callFilterController];
    BOOL v18 = v17;
    if (v16 && v10)
    {
      int v19 = 1;
      char v20 = [v17 shouldRestrictConversation:v10 performSynchronously:1];

      if ((v20 & 1) == 0) {
        goto LABEL_23;
      }
    }
    else
    {
      int v19 = 1;
      int v21 = [v17 shouldRestrictJoinConversationRequest:v4 performSynchronously:1];

      if (!v21) {
        goto LABEL_23;
      }
    }
    BOOL v22 = TUDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v22, OS_LOG_TYPE_DEFAULT, "Not joining conversation because Screen Time has restricted this join request", buf, 2u);
    }

    int v19 = 0;
LABEL_23:
    int v75 = v19;
    id v23 = [MEMORY[0x1E4F1CA80] set];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v24 = [v4 remoteMembers];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v85 objects:v90 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v86 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = [*(id *)(*((void *)&v85 + 1) + 8 * i) handle];
          [v23 addObject:v29];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v85 objects:v90 count:16];
      }
      while (v26);
    }

    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __56__TUCallCenter_joinConversationWithConversationRequest___block_invoke;
    v82[3] = &unk_1E58E8AC8;
    id v30 = v4;
    id v83 = v30;
    id v31 = v23;
    id v84 = v31;
    __int16 v32 = [(TUCallCenter *)self callPassingTest:v82];
    if (v32)
    {
      id v33 = TUDefaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v92 = v32;
        _os_log_impl(&dword_19C496000, v33, OS_LOG_TYPE_DEFAULT, "Found a matching call with staging area for join request: %@", buf, 0xCu);
      }

      BOOL v34 = [v32 uniqueProxyIdentifierUUID];
      [v30 setUUID:v34];
    }
    uint64_t v35 = [v30 provider];
    char v36 = [v35 supportsAVMode:2];

    if ((v36 & 1) == 0)
    {
      __int16 v37 = TUDefaultLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19C496000, v37, OS_LOG_TYPE_DEFAULT, "Conversation provider does not support video, setting wantsStagingArea to NO", buf, 2u);
      }

      [v30 setWantsStagingArea:0];
    }
    if ([v30 sendToScreening])
    {
      char v38 = [v30 conversationLink];

      if (v38)
      {
        int v39 = TUDefaultLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19C496000, v39, OS_LOG_TYPE_DEFAULT, "Cannot screen a conversation that contains a link", buf, 2u);
        }

        int v75 = 0;
      }
    }
    __int16 v40 = [v30 provider];
    v74 = v32;
    if ([v40 supportsLinks])
    {
      uint64_t v41 = [v30 conversationLink];

      if (v41)
      {
        id v72 = v31;
        id v73 = v4;
        __int16 v42 = TUDefaultLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v43 = [v30 conversationLink];
          *(_DWORD *)buf = 138412290;
          id v92 = v43;
          _os_log_impl(&dword_19C496000, v42, OS_LOG_TYPE_DEFAULT, "Bypassing checks for remote members, join request has conversation link: %@", buf, 0xCu);
        }
        id v44 = [(TUCallCenter *)self conversationManager];
        id v45 = [v44 activeConversations];
        uint64_t v46 = [v45 count];

        if (!v46)
        {
          if (v75) {
            goto LABEL_80;
          }
          goto LABEL_89;
        }
        __int16 v47 = v10;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        v71 = self;
        id v48 = [(TUCallCenter *)self conversationManager];
        id v49 = [v48 activeConversations];

        uint64_t v50 = [v49 countByEnumeratingWithState:&v78 objects:v89 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v79;
          while (2)
          {
            for (uint64_t j = 0; j != v51; ++j)
            {
              if (*(void *)v79 != v52) {
                objc_enumerationMutation(v49);
              }
              long long v54 = *(void **)(*((void *)&v78 + 1) + 8 * j);
              long long v55 = [v54 link];
              long long v56 = [v30 conversationLink];
              if ([v55 isEquivalentToConversationLink:v56]
                && [v54 state] == 3)
              {
                char v57 = [v47 isPendingConversation];

                if ((v57 & 1) == 0)
                {
                  v68 = TUDefaultLog();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v92 = v54;
                    _os_log_impl(&dword_19C496000, v68, OS_LOG_TYPE_DEFAULT, "Join request is asking to join a link that matches the currently-joined conversation, proceeding back to that conversation: %@", buf, 0xCu);
                  }

                  BOOL v11 = 0;
                  BOOL v10 = v47;
                  id v31 = v72;
                  id v4 = v73;
                  goto LABEL_93;
                }
              }
              else
              {
              }
            }
            uint64_t v51 = [v49 countByEnumeratingWithState:&v78 objects:v89 count:16];
            if (v51) {
              continue;
            }
            break;
          }
        }

        BOOL v10 = v47;
        id v31 = v72;
        id v4 = v73;
        self = v71;
LABEL_79:
        if (v75)
        {
LABEL_80:
          if ([v30 avMode]
            || ([(TUCallCenter *)self featureFlags],
                v66 = objc_claimAutoreleasedReturnValue(),
                int v67 = [v66 avLessSharePlayEnabled],
                v66,
                !v67))
          {
            id v49 = [(TUCallCenter *)self callServicesInterface];
            BOOL v11 = [v49 joinConversationWithRequest:v30];
          }
          else
          {
            id v49 = [(TUCallCenter *)self conversationManager];
            [v49 joinConversationWithRequest:v30];
            BOOL v11 = 0;
          }
LABEL_93:

          goto LABEL_94;
        }
LABEL_89:
        BOOL v11 = 0;
LABEL_94:

        goto LABEL_95;
      }
    }
    else
    {
    }
    id v58 = [v30 remoteMembers];
    if (![v58 count])
    {
      char v59 = [v30 prefersAddingRemoteMembersAfterHandoff];

      if (v59)
      {
LABEL_68:
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __56__TUCallCenter_joinConversationWithConversationRequest___block_invoke_239;
        v76[3] = &unk_1E58E6B48;
        id v60 = v30;
        id v77 = v60;
        if ([(TUCallCenter *)self anyCallPassesTest:v76])
        {
          v61 = TUDefaultLog();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
            -[TUCallCenter joinConversationWithConversationRequest:]();
          }

          LOBYTE(v75) = 0;
        }
        id v62 = [(TUCallCenter *)self callMatchingConversationRequest:v60];
        if (v62 && [v60 avMode])
        {
          int v63 = [v62 status];
          v64 = TUDefaultLog();
          uint64_t v65 = v64;
          if (v63 == 4)
          {
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19C496000, v65, OS_LOG_TYPE_DEFAULT, "Identical call for this request exists and is ringing, answering it", buf, 2u);
            }

            [(TUCallCenter *)self holdAndAnswerIfNeeded:v62];
          }
          else
          {
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
              -[TUCallCenter joinConversationWithConversationRequest:]();
            }
          }
          BOOL v11 = 0;
          id v49 = v77;
          goto LABEL_93;
        }

        goto LABEL_79;
      }
      id v58 = TUDefaultLog();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        -[TUCallCenter joinConversationWithConversationRequest:]();
      }
      LOBYTE(v75) = 0;
    }

    goto LABEL_68;
  }
  BOOL v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Device does not support multiway", buf, 2u);
  }
  BOOL v11 = 0;
LABEL_95:

  return v11;
}

uint64_t __56__TUCallCenter_joinConversationWithConversationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isConversation] && objc_msgSend(v3, "wantsStagingArea"))
  {
    id v4 = [v3 remoteParticipantHandles];
    uint64_t v5 = [v4 count];
    int v6 = [*(id *)(a1 + 32) remoteMembers];
    if (v5 == [v6 count])
    {
      uint64_t v7 = [v3 remoteParticipantHandles];
      uint64_t v8 = [v7 isSubsetOfSet:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __56__TUCallCenter_joinConversationWithConversationRequest___block_invoke_239(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status] == 3)
  {
    id v4 = [v3 uniqueProxyIdentifierUUID];
    uint64_t v5 = [*(id *)(a1 + 32) UUID];
    if ([v4 isEqual:v5])
    {
      uint64_t v6 = 0;
    }
    else if ([v3 isHostedOnCurrentDevice])
    {
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = [v3 isEndpointOnCurrentDevice];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)callMatchingConversationRequest:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v4 remoteMembers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = [*(id *)(*((void *)&v19 + 1) + 8 * i) handle];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__TUCallCenter_callMatchingConversationRequest___block_invoke;
  v16[3] = &unk_1E58E8AC8;
  id v17 = v4;
  id v18 = v5;
  id v12 = v5;
  id v13 = v4;
  uint64_t v14 = [(TUCallCenter *)self callPassingTest:v16];

  return v14;
}

uint64_t __48__TUCallCenter_callMatchingConversationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status] == 3 || !objc_msgSend(v3, "isConversation"))
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v4 = [v3 remoteParticipantHandles];
    uint64_t v5 = [v4 count];
    uint64_t v6 = [*(id *)(a1 + 32) remoteMembers];
    if (v5 == [v6 count])
    {
      uint64_t v7 = [v3 remoteParticipantHandles];
      uint64_t v8 = [v7 isEqualToSet:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  return v8;
}

- (void)enteredForegroundForCall:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "for call %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = [(TUCallCenter *)self callServicesInterface];
  uint64_t v7 = [v4 uniqueProxyIdentifier];
  [v6 enteredForegroundForCallWithUniqueProxyIdentifier:v7];
}

- (void)willEnterBackgroundForAllCalls
{
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "", v5, 2u);
  }

  id v4 = [(TUCallCenter *)self callServicesInterface];
  [v4 willEnterBackgroundForAllCalls];
}

- (void)enteredBackgroundForAllCalls
{
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "", v5, 2u);
  }

  id v4 = [(TUCallCenter *)self callServicesInterface];
  [v4 enteredBackgroundForAllCalls];
}

- (id)callForConversationWithGroupUUID:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__TUCallCenter_callForConversationWithGroupUUID___block_invoke;
  v9[3] = &unk_1E58E6B48;
  id v10 = v4;
  id v5 = v4;
  uint64_t v6 = [(TUCallCenter *)self callsPassingTest:v9];
  uint64_t v7 = [v6 firstObject];

  return v7;
}

uint64_t __49__TUCallCenter_callForConversationWithGroupUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 callGroupUUID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)activeConversationForCall:(id)a3
{
  id v4 = a3;
  id v5 = -[TUCallCenter activeConversationForCall:backedByGroupSession:](self, "activeConversationForCall:backedByGroupSession:", v4, [v4 isConversation]);

  return v5;
}

- (id)activeConversationForCall:(id)a3 backedByGroupSession:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v4) {
    goto LABEL_5;
  }
  int v8 = [v6 callGroupUUID];

  if (!v8) {
    goto LABEL_5;
  }
  id v9 = [(TUCallCenter *)self conversationManager];
  id v10 = [v7 callGroupUUID];
  BOOL v11 = [v9 activeConversationWithGroupUUID:v10];

  if (!v11)
  {
LABEL_5:
    id v12 = [(TUCallCenter *)self conversationManager];
    id v13 = +[TUConversationManager remoteMembersForCall:v7];
    BOOL v11 = objc_msgSend(v12, "activeConversationWithRemoteMembers:andLink:matchingVideo:backedByGroupSession:", v13, 0, objc_msgSend(v7, "isVideo"), v4);

    if (v4 && !v11)
    {
      uint64_t v14 = [(TUCallCenter *)self conversationManager];
      BOOL v11 = [v14 activeConversationWithLinkForCall:v7];
    }
  }

  return v11;
}

- (void)shouldSuppressInCallStatusBar:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (v3) {
      id v6 = @"YES";
    }
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "TUCallCenter shouldSuppressInCallStatusBar: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(TUCallCenter *)self callServicesInterface];
  [v7 shouldSuppressInCallStatusBar:v3];
}

- (void)shouldAllowRingingCallStatusIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (v3) {
      id v6 = @"YES";
    }
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "TUCallCenter shouldAllowRingingCallStatusIndicator: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(TUCallCenter *)self callServicesInterface];
  [v7 shouldAllowRingingCallStatusIndicator:v3];
}

- (void)sendUserScoreToRTCReporting:(id)a3 withScore:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 length];
  int v8 = TUDefaultLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 1024;
      int v13 = v4;
      _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "TUCallCenter: sendUserScoreToRTCReporting: %@ for score: %d", (uint8_t *)&v10, 0x12u);
    }

    int v8 = [(TUCallCenter *)self callServicesInterface];
    [v8 sendUserScoreToRTCReporting:v6 withScore:v4];
  }
  else if (v9)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "sendUserScoreToRTCReporting: NULL UUID", (uint8_t *)&v10, 2u);
  }
}

- (void)handleMediaRemoteCommand:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  uint64_t v7 = [(TUCallCenter *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__TUCallCenter_handleMediaRemoteCommand_completion___block_invoke;
  v9[3] = &unk_1E58E8AF0;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  unsigned int v12 = a3;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __52__TUCallCenter_handleMediaRemoteCommand_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained callContainer];
    id v5 = [v4 screeningCall];

    if (v5)
    {
      id v6 = [v3 uiDataSource];

      if (v6)
      {
        uint64_t v7 = [v3 uiDataSource];
        [v7 shouldHostHandleMRCommand:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 32)];

        goto LABEL_11;
      }
      id v8 = TUDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        BOOL v9 = "Not handling media remote command because data source is nil";
        id v10 = (uint8_t *)&v11;
        goto LABEL_9;
      }
    }
    else
    {
      id v8 = TUDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        BOOL v9 = "Not handling media remote command because there is no screening call active";
        id v10 = (uint8_t *)&v12;
LABEL_9:
        _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  }
LABEL_11:
}

- (void)handleMediaRemoteCommand:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(TUCallCenter *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__TUCallCenter_handleMediaRemoteCommand_sourceIdentifier_completion___block_invoke;
  v13[3] = &unk_1E58E8B18;
  id v14 = v8;
  id v15 = v9;
  unsigned int v16 = a3;
  v13[4] = self;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

void __69__TUCallCenter_handleMediaRemoteCommand_sourceIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callContainer];
  BOOL v3 = [v2 screeningCall];

  if (!v3)
  {
    id v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v6 = "Not handling media remote command because there is no screening call active";
      uint64_t v7 = (uint8_t *)&v10;
LABEL_10:
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
LABEL_11:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    return;
  }
  uint64_t v4 = [*(id *)(a1 + 32) uiDataSource];

  if (!v4)
  {
    id v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "Not handling media remote command because data source is nil";
      uint64_t v7 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v8 = [*(id *)(a1 + 32) uiDataSource];
  [v8 shouldHostHandleMRCommand:*(unsigned int *)(a1 + 56) sourceIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)handleRedialCommandWhileScreening:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__TUCallCenter_handleRedialCommandWhileScreening___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__TUCallCenter_handleRedialCommandWhileScreening___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callContainer];
  BOOL v3 = [v2 screeningCall];

  if (!v3)
  {
    id v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v6 = "Not handling redial because there is no call in screening";
      uint64_t v7 = (uint8_t *)&v10;
LABEL_10:
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
LABEL_11:

    return;
  }
  id v4 = [*(id *)(a1 + 32) uiDataSource];

  if (!v4)
  {
    id v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "No UI data source, dropping dial request for redial";
      uint64_t v7 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v8 = [*(id *)(a1 + 32) uiDataSource];
  [v8 handleRedialCommandWhileScreening:*(void *)(a1 + 40)];
}

- (BOOL)isSwappable
{
  id v2 = [(TUCallCenter *)self displayedCalls];
  BOOL v3 = [v2 firstObject];
  id v4 = [v3 model];
  char v5 = [v4 supportsHolding];

  return v5;
}

- (BOOL)isMergeable
{
  id v2 = [(TUCallCenter *)self displayedCalls];
  BOOL v3 = [v2 firstObject];
  id v4 = [v3 model];
  char v5 = [v4 supportsGrouping];

  return v5;
}

- (BOOL)isHoldAllowed
{
  id v2 = [(TUCallCenter *)self displayedCalls];
  BOOL v3 = [v2 firstObject];
  id v4 = [v3 model];
  char v5 = [v4 supportsHolding];

  return v5;
}

- (BOOL)isTakingCallsPrivateAllowed
{
  id v2 = [(TUCallCenter *)self displayedCalls];
  BOOL v3 = [v2 firstObject];
  id v4 = [v3 model];
  char v5 = [v4 supportsUngrouping];

  return v5;
}

- (BOOL)isHardPauseAvailable
{
  return 1;
}

- (BOOL)isSendToVoicemailAllowed
{
  id v2 = [(TUCallCenter *)self displayedCalls];
  BOOL v3 = [v2 firstObject];
  id v4 = [v3 model];
  char v5 = [v4 supportsSendingToVoicemail];

  return v5;
}

- (BOOL)canMergeCalls
{
  if (![(TUCallCenter *)self isMergeable]) {
    return 0;
  }
  BOOL v3 = [(TUCallCenter *)self displayedCalls];
  if ([v3 count] == 2)
  {
    id v4 = [(TUCallCenter *)self displayedCalls];
    char v5 = [v4 objectAtIndex:0];
    if ([v5 status] == 2)
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v7 = [(TUCallCenter *)self displayedCalls];
      id v8 = [v7 objectAtIndex:1];
      BOOL v6 = [v8 status] == 2;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isAddCallAllowed
{
  id v2 = [(TUCallCenter *)self currentCallGroups];
  BOOL v3 = [v2 firstObject];
  id v4 = [v3 calls];
  char v5 = [v4 firstObject];

  if ([v2 count] == 1 && objc_msgSend(v5, "status") != 3)
  {
    uint64_t v7 = [v5 provider];
    unint64_t v8 = [v7 maximumCallGroups];
    if (v8 > 1
      || ([v5 model],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v4 supportsHolding]))
    {
      id v9 = [v5 model];
      if ([v9 supportsAddCall])
      {
        int v6 = [v5 isEmergency] ^ 1;

        if (v8 >= 2) {
          goto LABEL_13;
        }
      }
      else
      {

        LOBYTE(v6) = 0;
        if (v8 > 1) {
          goto LABEL_13;
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }

LABEL_13:
    goto LABEL_14;
  }
  LOBYTE(v6) = 0;
LABEL_14:

  return v6;
}

- (BOOL)isAmbiguous
{
  return [(TUCallCenter *)self countOfCallsPassingTest:&__block_literal_global_241] > 1;
}

uint64_t __27__TUCallCenter_isAmbiguous__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = [v2 model];
    uint64_t v3 = [v4 supportsUnambiguousMultiPartyState] ^ 1;
  }
  return v3;
}

- (BOOL)isEndAndAnswerAllowed
{
  uint64_t v3 = [(TUCallCenter *)self incomingCall];
  id v4 = [(TUCallCenter *)self audioOrVideoCallWithStatus:1];
  char v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(TUCallCenter *)self audioOrVideoCallWithStatus:2];
  }
  uint64_t v7 = v6;

  unint64_t v8 = [v3 model];
  if ([v8 supportsUnambiguousMultiPartyState])
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    __int16 v10 = [v7 model];
    if ([v10 supportsUnambiguousMultiPartyState])
    {
      LOBYTE(v9) = 1;
    }
    else
    {
      id v11 = [v3 provider];
      id v12 = [v7 provider];
      int v9 = [v11 isEqualToCallProvider:v12] ^ 1;
    }
  }

  return v9;
}

- (BOOL)isHoldAndAnswerAllowed
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TUCallCenter *)self incomingCall];
  id v4 = [(TUCallCenter *)self callWithStatus:1];
  char v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(TUCallCenter *)self callWithStatus:2];
  }
  uint64_t v7 = v6;

  unint64_t v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v42 = v3;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "isHoldAndAnswerAllowed: incomingCall: %@", buf, 0xCu);
  }

  int v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v42 = v7;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "isHoldAndAnswerAllowed: currentCall: %@", buf, 0xCu);
  }

  __int16 v10 = [(__CFString *)v7 provider];
  id v11 = [v10 identifier];
  id v12 = [(__CFString *)v3 provider];
  int v13 = [v12 identifier];
  int v14 = [v11 isEqualToString:v13];

  if (v14)
  {
    id v15 = [(__CFString *)v7 provider];
    if ((unint64_t)[v15 maximumCallGroups] <= 1) {
      int v16 = [(__CFString *)v7 isHostedOnCurrentDevice] ^ 1;
    }
    else {
      int v16 = 1;
    }
  }
  else
  {
    id v15 = [(__CFString *)v7 model];
    int v16 = [v15 supportsHolding];
  }

  int v17 = [(__CFString *)v3 isHostedOnCurrentDevice];
  int v18 = [(__CFString *)v7 isHostedOnCurrentDevice];
  if ([(__CFString *)v7 supportsSimultaneousVoiceAndData])
  {
    int v19 = 0;
    goto LABEL_24;
  }
  long long v20 = [(__CFString *)v3 provider];
  if ([v20 isTelephonyProvider]
    && [(__CFString *)v3 isUsingBaseband])
  {
    int v39 = [(__CFString *)v7 provider];
    int v21 = 1;
    int v19 = 1;
    if (![v39 isTelephonyProvider]) {
      goto LABEL_22;
    }
  }
  else
  {
    int v21 = 0;
  }
  long long v22 = [(__CFString *)v3 provider];
  if (([v22 isTelephonyProvider] & 1) == 0)
  {
    char v40 = v21;
    char v38 = [(__CFString *)v7 provider];
    if ([v38 isTelephonyProvider])
    {
      int v19 = [(__CFString *)v7 isUsingBaseband];
    }
    else
    {

      int v19 = 0;
    }
    if ((v40 & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

  int v19 = 0;
  if (v21) {
LABEL_22:
  }

LABEL_23:
LABEL_24:
  int v23 = v17 ^ v18;
  BOOL v24 = [(TUCallCenter *)self anyCallPassesTest:&__block_literal_global_243];
  uint64_t v25 = [(TUCallCenter *)self callWithStatus:3];

  int v26 = [(__CFString *)v7 isScreening];
  uint64_t v27 = TUDefaultLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = @"NO";
    if (v16) {
      id v29 = @"YES";
    }
    else {
      id v29 = @"NO";
    }
    if (v19) {
      id v30 = @"YES";
    }
    else {
      id v30 = @"NO";
    }
    *(_DWORD *)buf = 138413570;
    __int16 v42 = v29;
    if (v23) {
      id v31 = @"YES";
    }
    else {
      id v31 = @"NO";
    }
    __int16 v43 = 2112;
    id v44 = v30;
    if (v24) {
      __int16 v32 = @"YES";
    }
    else {
      __int16 v32 = @"NO";
    }
    __int16 v45 = 2112;
    uint64_t v46 = v31;
    if (v25) {
      id v33 = @"YES";
    }
    else {
      id v33 = @"NO";
    }
    __int16 v47 = 2112;
    id v48 = v32;
    if (v26) {
      uint64_t v28 = @"YES";
    }
    __int16 v49 = 2112;
    uint64_t v50 = v33;
    __int16 v51 = 2112;
    uint64_t v52 = v28;
    _os_log_impl(&dword_19C496000, v27, OS_LOG_TYPE_DEFAULT, "isHoldAndAnswerAllowed: callsSupportHoldAndAnswer: %@, callsMixCDMAAndNonCDMA: %@, callsMixHostedAndNonHosted: %@, anyCallIsRTTOrTTY: %@, anyCallIsSending: %@, callIsScreening: %@", buf, 0x3Eu);
  }

  if (v7) {
    BOOL v34 = v3 == 0;
  }
  else {
    BOOL v34 = 1;
  }
  int v35 = v16 ^ 1;
  if (v34) {
    int v35 = 1;
  }
  if ((v35 | v19 | v23 | v24))
  {
    char v36 = 0;
  }
  else if (v25)
  {
    char v36 = 0;
  }
  else
  {
    char v36 = v26 ^ 1;
  }

  return v36;
}

uint64_t __38__TUCallCenter_isHoldAndAnswerAllowed__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEndpointOnCurrentDevice]) {
    uint64_t v3 = [v2 isTTY];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)canGroupCall:(id)a3 withCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 == v7)
  {
    BOOL v10 = 0;
  }
  else
  {
    unint64_t v8 = [v6 callGroupUUID];
    int v9 = [v7 callGroupUUID];
    if ([v8 isEqual:v9])
    {
      BOOL v10 = 0;
    }
    else
    {
      id v11 = [v6 model];
      if ([v11 supportsGrouping])
      {
        id v12 = [v7 model];
        if ([v12 supportsGrouping])
        {
          int v13 = [v6 provider];
          int v14 = [v13 identifier];
          long long v20 = [v7 provider];
          id v15 = [v20 identifier];
          if ([v14 isEqualToString:v15])
          {
            unint64_t v16 = [(TUCallCenter *)self _callGroupCountForCall:v6 withCall:v7];
            [v6 provider];
            int v17 = v19 = v13;
            BOOL v10 = v16 <= [v17 maximumCallsPerCallGroup];

            int v13 = v19;
          }
          else
          {
            BOOL v10 = 0;
          }
        }
        else
        {
          BOOL v10 = 0;
        }
      }
      else
      {
        BOOL v10 = 0;
      }
    }
  }

  return v10;
}

- (unint64_t)_callGroupCountForCall:(id)a3 withCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 callGroupUUID];
  if (v8)
  {
    int v9 = [v6 callGroupUUID];
    BOOL v10 = [(TUCallCenter *)self callsWithGroupUUID:v9];
    uint64_t v11 = [v10 count];
  }
  else
  {
    uint64_t v11 = 1;
  }

  id v12 = [v7 callGroupUUID];
  if (v12)
  {
    int v13 = [v7 callGroupUUID];
    int v14 = [(TUCallCenter *)self callsWithGroupUUID:v13];
    uint64_t v15 = [v14 count];
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15 + v11;
}

- (void)createSplitSessionWithDeviceMediaRouteIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(TUCallCenter *)self featureFlags];
  char v9 = [v8 expanseEnabled];

  if (v9)
  {
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x3032000000;
    BOOL v24 = __Block_byref_object_copy__14;
    uint64_t v25 = __Block_byref_object_dispose__14;
    id v26 = 0;
    BOOL v10 = [(TUCallCenter *)self conversationManager];
    uint64_t v11 = [v10 activeConversations];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __76__TUCallCenter_createSplitSessionWithDeviceMediaRouteIdentifier_completion___block_invoke;
    v20[3] = &unk_1E58E8B40;
    v20[4] = &v21;
    [v11 enumerateObjectsUsingBlock:v20];

    if (v22[5])
    {
      id v12 = [[TUNearbyDeviceHandle alloc] initWithType:1 identifier:v6 name:0];
      objc_initWeak(&location, self);
      int v13 = [(TUCallCenter *)self neighborhoodActivityConduit];
      int v14 = [(id)v22[5] UUID];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __76__TUCallCenter_createSplitSessionWithDeviceMediaRouteIdentifier_completion___block_invoke_2;
      v16[3] = &unk_1E58E8B68;
      id v17 = v7;
      objc_copyWeak(&v18, &location);
      [v13 inviteTVDevice:v12 toConversation:v14 completion:v16];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      id v12 = [(TUCallCenter *)self _splitSessionErrorWithCode:-100 underlyingError:0];
      (*((void (**)(id, void, TUNearbyDeviceHandle *))v7 + 2))(v7, 0, v12);
    }

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    uint64_t v15 = [(TUCallCenter *)self _splitSessionErrorWithCode:-2 underlyingError:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
  }
}

void __76__TUCallCenter_createSplitSessionWithDeviceMediaRouteIdentifier_completion___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 state] == 3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __76__TUCallCenter_createSplitSessionWithDeviceMediaRouteIdentifier_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = [WeakRetained _splitSessionErrorWithCode:-200 underlyingError:v7];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)disconnectDeviceFromSplitSessionUsingMediaRouteIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [[TUNearbyDeviceHandle alloc] initWithType:1 identifier:v6 name:0];
  objc_initWeak(&location, self);
  char v9 = [(TUCallCenter *)self neighborhoodActivityConduit];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__TUCallCenter_disconnectDeviceFromSplitSessionUsingMediaRouteIdentifier_completion___block_invoke;
  v11[3] = &unk_1E58E8B68;
  id v10 = v7;
  id v12 = v10;
  objc_copyWeak(&v13, &location);
  [v9 disconnectTVDevice:v8 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __85__TUCallCenter_disconnectDeviceFromSplitSessionUsingMediaRouteIdentifier_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = [WeakRetained _splitSessionErrorWithCode:-201 underlyingError:v7];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_splitSessionErrorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v5;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    id v7 = 0;
  }
  unint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TUSplitSessionErrorDomain" code:a3 userInfo:v7];

  return v8;
}

- (void)registerAnonymousXPCEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self callServicesInterface];
  [v5 registerAnonymousXPCEndpoint:v4];
}

- (void)fetchAnonymousXPCEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self callServicesInterface];
  [v5 fetchAnonymousXPCEndpoint:v4];
}

- (void)performRecordingRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  unint64_t v8 = [(TUCallCenter *)self featureFlags];
  int v9 = [v8 callRecordingEnabled];

  if (v9)
  {
    uint64_t v10 = [(TUCallCenter *)self callServicesInterface];
    [v10 performRecordingRequest:v6 completion:v7];
  }
  else
  {
    uint64_t v11 = TUDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[TUCallCenter performRecordingRequest:completion:]();
    }

    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TUStartRecordingErrorDomain" code:0 userInfo:0];
    v7[2](v7, v10);
  }
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUCallCenter *)self delegateController];
  [v8 addDelegate:v7 queue:v6];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCenter *)self delegateController];
  [v5 removeDelegate:v4];
}

- (void)_handleReceivedCallDTMFUpdate:(id)a3 forCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUCallCenter *)self delegateController];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __54__TUCallCenter__handleReceivedCallDTMFUpdate_forCall___block_invoke;
  v11[3] = &unk_1E58E8B90;
  void v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 enumerateDelegatesUsingBlock:v11];
}

void __54__TUCallCenter__handleReceivedCallDTMFUpdate_forCall___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__TUCallCenter__handleReceivedCallDTMFUpdate_forCall___block_invoke_2;
    v10[3] = &unk_1E58E63D8;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    id v13 = v9;
    id v14 = *(id *)(a1 + 48);
    dispatch_async(v6, v10);
  }
}

uint64_t __54__TUCallCenter__handleReceivedCallDTMFUpdate_forCall___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) callCenter:*(void *)(a1 + 40) reportedCall:*(void *)(a1 + 48) receivedDTMFUpdate:*(void *)(a1 + 56)];
}

- (void)setContactStore:(id)a3
{
}

- (void)setProviderManager:(id)a3
{
}

- (void)setConversationManager:(id)a3
{
}

- (TUCallCenterDelegate)delegateController
{
  return self->_delegateController;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setCallServicesInterface:(id)a3
{
}

- (void)setAudioDeviceController:(id)a3
{
}

- (void)setVideoDeviceController:(id)a3
{
}

- (void)setRouteController:(id)a3
{
}

- (void)setPairedHostDeviceRouteController:(id)a3
{
}

- (void)setCallFilterController:(id)a3
{
}

- (void)setNeighborhoodActivityConduit:(id)a3
{
}

- (CGSize)localLandscapeAspectRatio
{
  double width = self->_localLandscapeAspectRatio.width;
  double height = self->_localLandscapeAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLocalLandscapeAspectRatio:(CGSize)a3
{
  self->_localLandscapeAspectRatio = a3;
}

- (CGSize)localPortraitAspectRatio
{
  double width = self->_localPortraitAspectRatio.width;
  double height = self->_localPortraitAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3
{
  self->_localPortraitAspectRatio = a3;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (id)disconnectCallPreflight
{
  return self->_disconnectCallPreflight;
}

- (void)setDisconnectCallPreflight:(id)a3
{
}

- (FBSDisplayLayoutMonitor)monitor
{
  return self->_monitor;
}

- (id)launchAppForJoinRequestBlock
{
  return self->_launchAppForJoinRequestBlock;
}

- (void)setLaunchAppForJoinRequestBlock:(id)a3
{
}

- (id)isOnenessActiveBlock
{
  return self->_isOnenessActiveBlock;
}

- (void)setIsOnenessActiveBlock:(id)a3
{
}

- (TUUIDataSource)uiDataSource
{
  return self->_uiDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiDataSource, 0);
  objc_storeStrong(&self->_isOnenessActiveBlock, 0);
  objc_storeStrong(&self->_launchAppForJoinRequestBlock, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong(&self->_disconnectCallPreflight, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_neighborhoodActivityConduit, 0);
  objc_storeStrong((id *)&self->_callFilterController, 0);
  objc_storeStrong((id *)&self->_pairedHostDeviceRouteController, 0);
  objc_storeStrong((id *)&self->_routeController, 0);
  objc_storeStrong((id *)&self->_videoDeviceController, 0);
  objc_storeStrong((id *)&self->_audioDeviceController, 0);
  objc_storeStrong((id *)&self->_callServicesInterface, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_delegateController, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);
  objc_storeStrong((id *)&self->_providerManager, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

void __38__TUCallCenter_fetchTUUIXPCDataSource__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch UIDataSource endpoint due to error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)dialWithRequest:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19C496000, v0, v1, "Dial attempt is returning a nil call", v2, v3, v4, v5, v6);
}

- (void)_dialWithRequest:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19C496000, a2, OS_LOG_TYPE_FAULT, "Dial request has an unspecified originating UI type: %@", (uint8_t *)&v2, 0xCu);
}

- (void)answerOrJoinCall:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19C496000, v0, v1, "Not joining call since call is disconnecting/disconnected", v2, v3, v4, v5, v6);
}

void __34__TUCallCenter_answerWithRequest___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Encountered error while opening answer URL: %@ for call: %@", (uint8_t *)&v4, 0x16u);
}

- (void)joinConversationWithConversationRequest:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19C496000, v0, v1, "Identical call for this request exists and isn't ringing, not creating a new call", v2, v3, v4, v5, v6);
}

- (void)joinConversationWithConversationRequest:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19C496000, v0, v1, "Cannot launch join request, another sending call already exists", v2, v3, v4, v5, v6);
}

- (void)joinConversationWithConversationRequest:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19C496000, v0, v1, "No remote members found for join request", v2, v3, v4, v5, v6);
}

- (void)performRecordingRequest:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19C496000, v0, v1, "Call Recording feature flag is not enabled, cannot perform recording request", v2, v3, v4, v5, v6);
}

@end