@interface CSDProviderCall
- (AVAudioSession)proxyAVAudioSession;
- (BOOL)accessoryButtonEventsEnabled;
- (BOOL)hasBeenRedirected;
- (BOOL)hasConnected;
- (BOOL)hasEnded;
- (BOOL)hasStartedConnecting;
- (BOOL)ignoresBluetoothDeviceUID;
- (BOOL)isBlocked;
- (BOOL)isConversation;
- (BOOL)isDomestic;
- (BOOL)isDownlinkMuted;
- (BOOL)isEmergency;
- (BOOL)isExpanseProvider;
- (BOOL)isFailureExpected;
- (BOOL)isHeld;
- (BOOL)isInjectingAudio;
- (BOOL)isInternational;
- (BOOL)isMutuallyExclusiveCall;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isOutgoing;
- (BOOL)isReRing;
- (BOOL)isRemoteUplinkMuted;
- (BOOL)isSendingVideo;
- (BOOL)isSharingScreen;
- (BOOL)isThirdPartyVideo;
- (BOOL)isUnderlyingLinksConnected;
- (BOOL)isUnderlyingUplinkMuted;
- (BOOL)isUplinkMuted;
- (BOOL)isUsingBaseband;
- (BOOL)isVideo;
- (BOOL)mayRequireBreakBeforeMake;
- (BOOL)mediaPlaybackOnExternalDevice;
- (BOOL)mixesVoiceWithMedia;
- (BOOL)needsManualInCallSounds;
- (BOOL)prefersExclusiveAccessToCellularNetwork;
- (BOOL)prefersToPlayDuringWombat;
- (BOOL)sendingVideo;
- (BOOL)shouldAcceptDateConnectedProviderUpdates;
- (BOOL)shouldSuppressInCallUI;
- (BOOL)supportsEmergencyFallback;
- (BOOL)supportsScreening;
- (BOOL)supportsTTYWithVoice;
- (BOOL)usesSystemMuting;
- (BOOL)wantsStagingArea;
- (CSDPauseDigitsQueue)pauseDigitsQueue;
- (CSDProviderCall)initWithHandoffContext:(id)a3 backingCallSource:(id)a4;
- (CSDProviderCall)initWithUniqueProxyIdentifier:(id)a3 configuration:(id)a4;
- (CSDProviderCall)initWithUniqueProxyIdentifier:(id)a3 endpointOnCurrentDevice:(BOOL)a4;
- (CSDProviderCallDelegate)providerCallDelegate;
- (CSDProviderDisplayMonitor)providerDisplayMonitor;
- (CXAbstractProviderSource)providerSource;
- (CXCallFailureContext)failureContext;
- (CXCallSource)backingCallSource;
- (CXCallUpdate)mergedCallUpdate;
- (LSApplicationRecord)applicationRecord;
- (NSDictionary)silencingUserInfo;
- (NSNotificationCenter)defaultNotificationCenter;
- (NSString)providerIdentifier;
- (NSUUID)callGroupUUID;
- (TUCallCenter)callCenter;
- (TUDynamicCallDisplayContext)dynamicDisplayContext;
- (TUFeatureFlags)featureFlags;
- (TUParticipant)activeRemoteParticipant;
- (TUUserConfiguration)userConfiguration;
- (id)_dialDelayForRequest:(id)a3;
- (id)activeRemoteParticipantForCallUpdate:(id)a3;
- (id)activeRemoteParticipants;
- (id)announceProviderIdentifier;
- (id)audioCategory;
- (id)audioMode;
- (id)callHistoryIdentifier;
- (id)callerNameFromNetwork;
- (id)conversationID;
- (id)cxScreenShareAttributesForCallAttributes:(id)a3;
- (id)dialDelayForRequest;
- (id)endedReasonUserInfo;
- (id)handle;
- (id)handoffActivityUserInfo;
- (id)handoffDynamicIdentifier;
- (id)hardPauseDigits;
- (id)imageURLForCXSandboxExtendedURL:(id)a3;
- (id)initIncomingWithBackingCallSource:(id)a3 UUID:(id)a4 update:(id)a5;
- (id)initOutgoingWithDialRequest:(id)a3;
- (id)initOutgoingWithDialRequest:(id)a3 configuration:(id)a4;
- (id)initOutgoingWithJoinConversationRequest:(id)a3;
- (id)initOutgoingWithRequestedStartCallAction:(id)a3 backingCallSource:(id)a4;
- (id)initOutgoingWithUniqueProxyIdentifier:(id)a3 backingCallSourceIdentifier:(id)a4 callUpdate:(id)a5 isVideo:(BOOL)a6 endpointOnCurrentDevice:(BOOL)a7 originatingUIType:(int)a8;
- (id)initOutgoingWithUniqueProxyIdentifier:(id)a3 backingCallSourceIdentifier:(id)a4 callUpdate:(id)a5 isVideo:(BOOL)a6 endpointOnCurrentDevice:(BOOL)a7 originatingUIType:(int)a8 configuration:(id)a9;
- (id)initOutgoingWithUpdate:(id)a3 callUUID:(id)a4 backingCallSource:(id)a5 isExpanseProvider:(BOOL)a6;
- (id)initiator;
- (id)isCallRecordingEnabled;
- (id)isoCountryCode;
- (id)localMemberHandleValue;
- (id)localSenderIdentityAccountUUID;
- (id)localSenderIdentityUUID;
- (id)provider;
- (id)providerContext;
- (id)recordingAllowedError;
- (id)recordingDisabledError;
- (id)remoteParticipantHandles;
- (id)screenShareAttributes;
- (id)startCallActionWithDialRequest:(id)a3;
- (id)startCallBlock;
- (id)systemControllerSetUplinkMutedBlock;
- (id)systemControllerUplinkMutedBlock;
- (id)tokens;
- (id)tuScreenShareAttributesForScreenAttributes:(id)a3;
- (id)usesSystemMutingBlock;
- (int)_switchFromFailureReasonToDisconnectedReason:(int64_t)a3;
- (int)callStatusFromUnderlyingSource;
- (int)hardPauseDigitsState;
- (int)originatingUIType;
- (int)ttyType;
- (int64_t)_switchToCXCallFailureReasonFromTUCallDisconnectedReason:(int)a3;
- (int64_t)audioInterruptionOperationMode;
- (int64_t)audioInterruptionProviderType;
- (int64_t)bluetoothAudioFormat;
- (int64_t)endedReason;
- (int64_t)inputAudioPowerSpectrumToken;
- (int64_t)outputAudioPowerSpectrumToken;
- (int64_t)providerEndedReason;
- (int64_t)providerErrorCode;
- (int64_t)screenSharingIntention;
- (int64_t)serviceStatus;
- (int64_t)soundRegion;
- (int64_t)transmissionMode;
- (int64_t)videoStreamToken;
- (unint64_t)initialLinkType;
- (unint64_t)screenSharingType;
- (void)_sendDTMFDigits:(id)a3 type:(int64_t)a4;
- (void)_sendSoftPauseDigitsIfNecessary;
- (void)_setIsOnHold:(BOOL)a3;
- (void)answerWithRequest:(id)a3;
- (void)askProviderToAllowAudioInjection:(BOOL)a3;
- (void)dealloc;
- (void)dequeueNextPauseDigits;
- (void)dialWithRequest:(id)a3 displayContext:(id)a4;
- (void)disconnectWithReason:(int)a3;
- (void)donateHandles:(id)a3;
- (void)groupWithOtherCall:(id)a3;
- (void)handleAudioSessionActivationStateChangedTo:(id)a3;
- (void)hold;
- (void)joinConversationWithRequest:(id)a3;
- (void)pauseDigitsQueueChanged:(id)a3;
- (void)performUplinkMuted:(BOOL)a3;
- (void)playRemoteDTMFToneForKey:(unsigned __int8)a3;
- (void)sendHardPauseDigits;
- (void)setActiveRemoteParticipant:(id)a3;
- (void)setBackingCallSource:(id)a3;
- (void)setBluetoothAudioFormat:(int64_t)a3;
- (void)setCallCenter:(id)a3;
- (void)setCallGroupUUID:(id)a3;
- (void)setConversation:(BOOL)a3;
- (void)setDateConnected:(id)a3;
- (void)setDefaultNotificationCenter:(id)a3;
- (void)setDialDelayForRequest:(id)a3;
- (void)setDownlinkMuted:(BOOL)a3;
- (void)setDynamicDisplayContext:(id)a3;
- (void)setEndedReason:(int64_t)a3;
- (void)setEndpointOnCurrentDevice:(BOOL)a3;
- (void)setFailureContext:(id)a3;
- (void)setHeld:(BOOL)a3;
- (void)setInjectingAudio:(BOOL)a3;
- (void)setIsCallRecordingEnabled:(id)a3;
- (void)setIsSendingVideo:(BOOL)a3;
- (void)setIsUnderlyingLinksConnected:(BOOL)a3;
- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3;
- (void)setMergedCallUpdate:(id)a3;
- (void)setMixesVoiceWithMedia:(BOOL)a3;
- (void)setOutgoing:(BOOL)a3;
- (void)setPauseDigitsQueue:(id)a3;
- (void)setProviderCallDelegate:(id)a3;
- (void)setProviderFailureReasonIfNecessary:(int64_t)a3;
- (void)setProviderSource:(id)a3;
- (void)setRemoteVideoPresentationSize:(CGSize)a3;
- (void)setRemoteVideoPresentationState:(int)a3;
- (void)setScreenShareAttributes:(id)a3;
- (void)setScreenSharingType:(unint64_t)a3;
- (void)setScreening:(BOOL)a3;
- (void)setSendingVideo:(BOOL)a3;
- (void)setSharingScreen:(BOOL)a3;
- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4;
- (void)setShouldAcceptDateConnectedProviderUpdates:(BOOL)a3;
- (void)setSilencingUserInfo:(id)a3;
- (void)setStartCallBlock:(id)a3;
- (void)setSystemControllerSetUplinkMutedBlock:(id)a3;
- (void)setSystemControllerUplinkMutedBlock:(id)a3;
- (void)setTtyType:(int)a3;
- (void)setUnderlyingUplinkMuted:(BOOL)a3;
- (void)setUnderlyingUplinkMuted:(BOOL)a3 bottomUpMute:(BOOL)a4;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setUsesSystemMutingBlock:(id)a3;
- (void)setVideo:(BOOL)a3;
- (void)setWantsStagingArea:(BOOL)a3;
- (void)systemMuteStatusChanged:(id)a3;
- (void)ungroup;
- (void)unhold;
- (void)updateForDisconnection;
- (void)updateWithCallUpdate:(id)a3;
- (void)updateWithCallUpdate:(id)a3 notifyDelegate:(BOOL)a4;
@end

@implementation CSDProviderCall

- (CSDProviderCall)initWithUniqueProxyIdentifier:(id)a3 endpointOnCurrentDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(CSDProviderCallConfiguration);
  [(CSDProviderCallConfiguration *)v7 setEndpointOnCurrentDevice:v4];
  id v8 = objc_alloc_init((Class)TUFeatureFlags);
  [(CSDProviderCallConfiguration *)v7 setFeatureFlags:v8];

  v9 = [(CSDProviderCall *)self initWithUniqueProxyIdentifier:v6 configuration:v7];
  return v9;
}

- (CSDProviderCall)initWithUniqueProxyIdentifier:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)CSDProviderCall;
  id v8 = [(CSDCall *)&v43 initWithUniqueProxyIdentifier:v6 configuration:v7];
  if (v8)
  {
    uint64_t v9 = [v7 featureFlags];
    featureFlags = v8->_featureFlags;
    v8->_featureFlags = (TUFeatureFlags *)v9;

    v8->_held = [v7 isHeld];
    objc_initWeak(&location, v8);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100057BCC;
    v40[3] = &unk_100505A18;
    objc_copyWeak(&v41, &location);
    v11 = objc_retainBlock(v40);
    id dialDelayForRequest = v8->_dialDelayForRequest;
    v8->_id dialDelayForRequest = v11;

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100057C44;
    v38[3] = &unk_100505A40;
    id v13 = v7;
    id v39 = v13;
    v14 = objc_retainBlock(v38);
    id isCallRecordingEnabled = v8->_isCallRecordingEnabled;
    v8->_id isCallRecordingEnabled = v14;

    v8->_isUnderlyingLinksConnected = 1;
    uint64_t v16 = +[CXCallUpdate callUpdateWithDefaultValuesSet];
    mergedCallUpdate = v8->_mergedCallUpdate;
    v8->_mergedCallUpdate = (CXCallUpdate *)v16;

    v8->_outgoing = [v13 isOutgoing];
    v18 = [v13 providerIdentifier];
    v19 = (NSString *)[v18 copy];
    providerIdentifier = v8->_providerIdentifier;
    v8->_providerIdentifier = v19;

    uint64_t v21 = [v13 providerSource];
    providerSource = v8->_providerSource;
    v8->_providerSource = (CXAbstractProviderSource *)v21;

    v23 = (TUUserConfiguration *)objc_alloc_init((Class)TUUserConfiguration);
    userConfiguration = v8->_userConfiguration;
    v8->_userConfiguration = v23;

    v8->_prefersToPlayDuringWombat = 1;
    if ([v13 transmissionMode]) {
      -[CXCallUpdate setTransmissionMode:](v8->_mergedCallUpdate, "setTransmissionMode:", [v13 transmissionMode]);
    }
    if ([v13 accessoryButtonEventsEnabled]) {
      -[CXCallUpdate setAccessoryButtonEventsEnabled:](v8->_mergedCallUpdate, "setAccessoryButtonEventsEnabled:", [v13 accessoryButtonEventsEnabled]);
    }
    if (v8->_providerSource)
    {
      v25 = [CSDProviderDisplayMonitor alloc];
      v26 = [(CXAbstractProviderSource *)v8->_providerSource bundleIdentifier];
      v27 = [(CSDProviderDisplayMonitor *)v25 initWithBundleIdentifier:v26 pid:[(CXAbstractProviderSource *)v8->_providerSource processIdentifier]];
      providerDisplayMonitor = v8->_providerDisplayMonitor;
      v8->_providerDisplayMonitor = v27;
    }
    if ([(TUFeatureFlags *)v8->_featureFlags nameAndPhotoEnabled])
    {
      v29 = +[IMDaemonController sharedInstance];
      uint64_t v30 = TUBundleIdentifierCallServicesDaemon;
      unsigned __int8 v31 = [v29 hasListenerForID:TUBundleIdentifierCallServicesDaemon];

      if ((v31 & 1) == 0)
      {
        v32 = sub_100008DCC();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v37 = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Connecting to IMDaemonController...", v37, 2u);
        }

        v33 = +[IMDaemonController sharedInstance];
        [v33 addListenerID:v30 capabilities:kFZListenerCapAccounts];
      }
    }
    v34 = [v13 defaultNotificationCenter];
    v35 = v34;
    if (!v34)
    {
      v35 = +[NSNotificationCenter defaultCenter];
    }
    objc_storeStrong((id *)&v8->_defaultNotificationCenter, v35);
    if (!v34) {

    }
    [(NSNotificationCenter *)v8->_defaultNotificationCenter addObserver:v8 selector:"systemMuteStatusChanged:" name:TUAudioSystemUplinkMuteStatusChangedNotification object:0];
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (id)initIncomingWithBackingCallSource:(id)a3 UUID:(id)a4 update:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  v12 = [CSDProviderCallConfiguration alloc];
  id v13 = [v9 identifier];
  v14 = [(CSDProviderCallConfiguration *)v12 initWithProviderIdentifier:v13];

  [(CSDProviderCallConfiguration *)v14 setEndpointOnCurrentDevice:1];
  id v15 = objc_alloc_init((Class)TUFeatureFlags);
  [(CSDProviderCallConfiguration *)v14 setFeatureFlags:v15];

  uint64_t v16 = [v11 UUIDString];

  v17 = [(CSDProviderCall *)self initWithUniqueProxyIdentifier:v16 configuration:v14];
  if (v17)
  {
    objc_storeStrong((id *)&v17->_backingCallSource, a3);
    v17->_video = [v10 hasVideo];
    id v21 = [v10 hasSet];
    LODWORD(v22) = v18;
    if ((v18 & 8) == 0) {
      v17->_sendingVideo = v17->_video;
    }
    v19 = objc_msgSend(v10, "sanitizedCallUpdate", v21, v22);
    [(CSDProviderCall *)v17 updateWithCallUpdate:v19];
  }
  return v17;
}

- (id)initOutgoingWithUniqueProxyIdentifier:(id)a3 backingCallSourceIdentifier:(id)a4 callUpdate:(id)a5 isVideo:(BOOL)a6 endpointOnCurrentDevice:(BOOL)a7 originatingUIType:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[CSDProviderCallConfiguration alloc] initWithProviderIdentifier:v15];
  [(CSDProviderCallConfiguration *)v17 setEndpointOnCurrentDevice:v9];
  id v18 = objc_alloc_init((Class)TUFeatureFlags);
  [(CSDProviderCallConfiguration *)v17 setFeatureFlags:v18];

  id v19 = [(CSDProviderCall *)self initOutgoingWithUniqueProxyIdentifier:v16 backingCallSourceIdentifier:v15 callUpdate:v14 isVideo:v10 endpointOnCurrentDevice:v9 originatingUIType:v8 configuration:v17];
  return v19;
}

- (id)initOutgoingWithUniqueProxyIdentifier:(id)a3 backingCallSourceIdentifier:(id)a4 callUpdate:(id)a5 isVideo:(BOOL)a6 endpointOnCurrentDevice:(BOOL)a7 originatingUIType:(int)a8 configuration:(id)a9
{
  id v14 = a4;
  id v15 = a5;
  id v16 = [(CSDProviderCall *)self initWithUniqueProxyIdentifier:a3 configuration:a9];
  v17 = (id *)v16;
  if (v16)
  {
    v16->_outgoing = 1;
    v16->_video = a6;
    v16->_sendingVideo = a6;
    v16->_originatingUIType = a8;
    id v18 = [v15 remoteHandle];
    id v19 = [v18 value];

    if (v19)
    {
      v20 = [CSDPauseDigitsQueue alloc];
      id v21 = [v15 remoteHandle];
      uint64_t v22 = [v21 value];
      v23 = [(CSDPauseDigitsQueue *)v20 initWithDestinationID:v22];
      id v24 = v17[55];
      v17[55] = v23;

      [v17[55] setDelegate:v17];
      v25 = sub_100008DCC();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = v17[55];
        int v46 = 138412290;
        id v47 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Created pause digits queue: %@", (uint8_t *)&v46, 0xCu);
      }

      id v27 = objc_alloc((Class)CXHandle);
      v28 = [v15 remoteHandle];
      id v29 = [v28 type];
      uint64_t v30 = [v17[55] baseDestinationID];
      unsigned __int8 v31 = [v15 remoteHandle];
      v32 = [v31 siriDisplayName];
      id v33 = [v27 initWithType:v29 value:v30 siriDisplayName:v32];
      [v15 setRemoteHandle:v33];
    }
    v34 = [v15 sanitizedCallUpdate];
    [v17 updateWithCallUpdate:v34];

    if ([v14 isEqualToString:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider"])
    {
      v35 = [v17 featureFlags];
      unsigned int v36 = [v35 offrampEnabled];

      if (v36)
      {
        uint64_t v37 = [v15 remoteParticipantHandles];
        if (v37)
        {
          v38 = (void *)v37;
          id v39 = [v15 remoteParticipantHandles];
          id v40 = [v39 count];

          if ((unint64_t)v40 >= 2)
          {
            id v41 = [v15 remoteParticipantHandles];
            v42 = +[CXHandle tuHandlesWithHandles:v41];
            [v17 donateHandles:v42];
LABEL_13:

            goto LABEL_14;
          }
        }
        objc_super v43 = [v15 remoteHandle];

        if (v43)
        {
          id v41 = [v15 remoteHandle];
          v42 = [v41 tuHandle];
          v44 = +[NSSet setWithObject:v42];
          [v17 donateHandles:v44];

          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:

  return v17;
}

- (id)initOutgoingWithUpdate:(id)a3 callUUID:(id)a4 backingCallSource:(id)a5 isExpanseProvider:(BOOL)a6
{
  id v11 = a5;
  id v12 = a3;
  id v13 = [a4 UUIDString];
  id v14 = [v11 identifier];
  id v15 = -[CSDProviderCall initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:originatingUIType:](self, "initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:originatingUIType:", v13, v14, v12, [v12 hasVideo], 1, 0);

  if (v15)
  {
    *((unsigned char *)v15 + 237) = a6;
    objc_storeStrong((id *)v15 + 44, a5);
  }

  return v15;
}

- (id)initOutgoingWithDialRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)CXCallUpdate) initWithDialRequest:v4];
  id v6 = [v4 uniqueProxyIdentifier];
  id v7 = [v4 provider];
  uint64_t v8 = [v7 identifier];
  id v9 = [v4 isVideo];
  id v10 = [v4 endpointOnCurrentDevice];
  id v11 = [v4 originatingUIType];

  id v12 = [(CSDProviderCall *)self initOutgoingWithUniqueProxyIdentifier:v6 backingCallSourceIdentifier:v8 callUpdate:v5 isVideo:v9 endpointOnCurrentDevice:v10 originatingUIType:v11];
  return v12;
}

- (id)initOutgoingWithDialRequest:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)CXCallUpdate) initWithDialRequest:v7];
  id v9 = [v7 uniqueProxyIdentifier];
  id v10 = [v7 provider];
  id v11 = [v10 identifier];
  id v12 = [v7 isVideo];
  id v13 = [v7 endpointOnCurrentDevice];
  id v14 = [v7 originatingUIType];

  id v15 = [(CSDProviderCall *)self initOutgoingWithUniqueProxyIdentifier:v9 backingCallSourceIdentifier:v11 callUpdate:v8 isVideo:v12 endpointOnCurrentDevice:v13 originatingUIType:v14 configuration:v6];
  return v15;
}

- (id)initOutgoingWithRequestedStartCallAction:(id)a3 backingCallSource:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)CXCallUpdate) initWithStartCallAction:v8];
  id v10 = [v8 callUUID];
  id v11 = [v10 UUIDString];
  id v12 = [v7 identifier];
  id v13 = [v8 isVideo];
  unsigned int v14 = [v8 isRelay];

  id v15 = [(CSDProviderCall *)self initOutgoingWithUniqueProxyIdentifier:v11 backingCallSourceIdentifier:v12 callUpdate:v9 isVideo:v13 endpointOnCurrentDevice:v14 ^ 1 originatingUIType:0];
  if (v15) {
    objc_storeStrong(v15 + 44, a4);
  }

  return v15;
}

- (id)initOutgoingWithJoinConversationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)CXCallUpdate) initWithJoinConversationRequest:v4];
  id v6 = [v4 UUID];
  id v7 = [v6 UUIDString];
  id v8 = -[CSDProviderCall initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:originatingUIType:](self, "initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:originatingUIType:", v7, @"com.apple.telephonyutilities.callservicesd.FaceTimeProvider", v5, 1, [v4 endpointOnCurrentDevice], objc_msgSend(v4, "originatingUIType"));

  if (v8)
  {
    *((unsigned char *)v8 + 245) = [v4 isVideoEnabled];
    id v9 = [v4 remoteMembers];
    if ([v9 count] == (id)1)
    {
      id v10 = [v4 conversationLink];
      if (v10)
      {
        [*((id *)v8 + 54) setConversation:1];
      }
      else
      {
        id v11 = [v4 otherInvitedHandles];
        if ([v11 count])
        {
          [*((id *)v8 + 54) setConversation:1];
        }
        else
        {
          id v12 = [v4 provider];
          if ([v12 isDefaultProvider])
          {
            id v13 = [v4 participantAssociation];
            [*((id *)v8 + 54) setConversation:v13 != 0];
          }
          else
          {
            [*((id *)v8 + 54) setConversation:1];
          }
        }
      }
    }
    else
    {
      [*((id *)v8 + 54) setConversation:1];
    }

    unsigned int v14 = [v4 provider];
    id v15 = +[TUConversationProvider expanseProvider];
    *((unsigned char *)v8 + 237) = [v14 isEqual:v15];
  }
  return v8;
}

- (CSDProviderCall)initWithHandoffContext:(id)a3 backingCallSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDProviderCall *)self init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_backingCallSource, a4);
    id v10 = [v6 remoteHandle];
    [(CXCallUpdate *)v9->_mergedCallUpdate setRemoteHandle:v10];

    v9->_outgoing = [v6 isOutgoing];
    id v11 = [v7 identifier];
    id v12 = (NSString *)[v11 copy];
    providerIdentifier = v9->_providerIdentifier;
    v9->_providerIdentifier = v12;
  }
  return v9;
}

- (void)dealloc
{
  [(NSNotificationCenter *)self->_defaultNotificationCenter removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)CSDProviderCall;
  [(CSDCall *)&v3 dealloc];
}

- (NSNotificationCenter)defaultNotificationCenter
{
  defaultNotificationCenter = self->_defaultNotificationCenter;
  if (!defaultNotificationCenter)
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    id v5 = self->_defaultNotificationCenter;
    self->_defaultNotificationCenter = v4;

    defaultNotificationCenter = self->_defaultNotificationCenter;
  }

  return defaultNotificationCenter;
}

- (void)performUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asked to perform uplinkMuted: %d", (uint8_t *)v6, 8u);
  }

  [(CSDProviderCall *)self setUplinkMuted:v3];
}

- (void)systemMuteStatusChanged:(id)a3
{
  id v4 = [(CSDProviderCall *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058B78;
  block[3] = &unk_100504EC0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (TUCallCenter)callCenter
{
  callCenter = self->_callCenter;
  if (!callCenter)
  {
    id v4 = +[TUCallCenter sharedInstance];
    id v5 = self->_callCenter;
    self->_callCenter = v4;

    callCenter = self->_callCenter;
  }

  return callCenter;
}

- (id)usesSystemMutingBlock
{
  id usesSystemMutingBlock = self->_usesSystemMutingBlock;
  if (!usesSystemMutingBlock)
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100058F08;
    v8[3] = &unk_100505280;
    objc_copyWeak(&v9, &location);
    id v4 = objc_retainBlock(v8);
    id v5 = self->_usesSystemMutingBlock;
    self->_id usesSystemMutingBlock = v4;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    id usesSystemMutingBlock = self->_usesSystemMutingBlock;
  }
  id v6 = objc_retainBlock(usesSystemMutingBlock);

  return v6;
}

- (id)systemControllerUplinkMutedBlock
{
  id systemControllerUplinkMutedBlock = self->_systemControllerUplinkMutedBlock;
  if (!systemControllerUplinkMutedBlock)
  {
    self->_id systemControllerUplinkMutedBlock = &stru_100505A60;

    id systemControllerUplinkMutedBlock = self->_systemControllerUplinkMutedBlock;
  }
  id v4 = objc_retainBlock(systemControllerUplinkMutedBlock);

  return v4;
}

- (id)systemControllerSetUplinkMutedBlock
{
  id systemControllerSetUplinkMutedBlock = self->_systemControllerSetUplinkMutedBlock;
  if (!systemControllerSetUplinkMutedBlock)
  {
    self->_id systemControllerSetUplinkMutedBlock = &stru_100505AA0;

    id systemControllerSetUplinkMutedBlock = self->_systemControllerSetUplinkMutedBlock;
  }
  id v4 = objc_retainBlock(systemControllerSetUplinkMutedBlock);

  return v4;
}

- (void)updateWithCallUpdate:(id)a3
{
}

- (void)updateWithCallUpdate:(id)a3 notifyDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 sanitizedCallUpdate];
  [(CSDCall *)self setTemporaryRequireInCallSounds:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100059170;
  v10[3] = &unk_100504FE0;
  id v11 = v7;
  id v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v10];
  if (v4) {
    [(CSDCall *)self propertiesChanged];
  }
}

- (int)_switchFromFailureReasonToDisconnectedReason:(int64_t)a3
{
  if (unint64_t)a3 < 0x1A && ((0x3FFDFFFu >> a3))
  {
    unsigned int v5 = dword_10048D740[a3];
  }
  else
  {
    BOOL v4 = sub_100008DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      int64_t v9 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Set disconnect reason to dial failed, failure reason: %ld", (uint8_t *)&v8, 0xCu);
    }

    unsigned int v5 = 17;
  }
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    int64_t v9 = a3;
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "failure reason: %ld, disconnected reason: %ld", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (void)updateForDisconnection
{
  v58.receiver = self;
  v58.super_class = (Class)CSDProviderCall;
  [(CSDCall *)&v58 updateForDisconnection];
  if (![(CSDProviderCall *)self isOutgoing] || [(CSDCall *)self hasStartedOutgoing])
  {
    uint64_t v3 = [(CSDProviderCall *)self endedReason];
    if (v3 > 101)
    {
      if (v3 == 102)
      {
        id v29 = sub_100008DCC();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v30 = [(CSDProviderCall *)self endedReason];
          *(_DWORD *)buf = 134217984;
          int64_t v60 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Setting disconnected reason to handed off because ended reason is %ld", buf, 0xCu);
        }

        v20 = self;
        uint64_t v21 = 7;
        goto LABEL_43;
      }
      if (v3 == 103)
      {
        unsigned __int8 v31 = sub_100008DCC();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v32 = [(CSDProviderCall *)self endedReason];
          *(_DWORD *)buf = 134217984;
          int64_t v60 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Setting disconnected reason to user busy because ended reason is %ld", buf, 0xCu);
        }

        v20 = self;
        uint64_t v21 = 15;
        goto LABEL_43;
      }
      if (v3 != 104) {
        return;
      }
      __int16 v10 = sub_100008DCC();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      int64_t v11 = [(CSDProviderCall *)self endedReason];
      *(_DWORD *)buf = 134217984;
      int64_t v60 = v11;
      id v12 = "Setting disconnected reason to remote hangup because ended reason is %ld";
    }
    else
    {
      switch(v3)
      {
        case 1:
          BOOL v4 = [(CSDProviderCall *)self failureContext];

          if (v4)
          {
            unsigned int v5 = [(CSDProviderCall *)self failureContext];
            id v6 = [v5 failureReason];

            switch((unint64_t)v6)
            {
              case 0uLL:
                id v7 = sub_100008DCC();
                if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
                  sub_1003A7ADC(self);
                }

                [(CSDCall *)self setDisconnectedReason:14];
                int v8 = self;
                uint64_t v9 = 510;
                goto LABEL_52;
              case 1uLL:
                id v39 = sub_100008DCC();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                  sub_1003A7B64(self);
                }

                v20 = self;
                uint64_t v21 = 18;
                goto LABEL_43;
              case 2uLL:
                id v40 = sub_100008DCC();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
                  sub_1003A7BEC(self);
                }

                v20 = self;
                uint64_t v21 = 19;
                goto LABEL_43;
              case 3uLL:
                id v41 = sub_100008DCC();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                  sub_1003A7C74(self);
                }

                v20 = self;
                uint64_t v21 = 22;
                goto LABEL_43;
              case 4uLL:
                v42 = sub_100008DCC();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                  sub_1003A7CFC(self);
                }

                v20 = self;
                uint64_t v21 = 23;
                goto LABEL_43;
              case 5uLL:
                objc_super v43 = sub_100008DCC();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
                  sub_1003A7D84(self);
                }

                v20 = self;
                uint64_t v21 = 24;
                goto LABEL_43;
              case 6uLL:
                v44 = sub_100008DCC();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                  sub_1003A7E0C(self);
                }

                v20 = self;
                uint64_t v21 = 16;
                goto LABEL_43;
              case 7uLL:
                v45 = sub_100008DCC();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                  sub_1003A7E94(self);
                }

                v20 = self;
                uint64_t v21 = 26;
                goto LABEL_43;
              case 8uLL:
                int v46 = sub_100008DCC();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
                  sub_1003A7F1C(self);
                }

                v20 = self;
                uint64_t v21 = 27;
                goto LABEL_43;
              case 9uLL:
                id v47 = sub_100008DCC();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
                  sub_1003A7FA4(self);
                }

                v20 = self;
                uint64_t v21 = 28;
                goto LABEL_43;
              case 0xAuLL:
                v48 = sub_100008DCC();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
                  sub_1003A802C(self);
                }

                v20 = self;
                uint64_t v21 = 29;
                goto LABEL_43;
              case 0xBuLL:
                v49 = sub_100008DCC();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                  sub_1003A80B4(self);
                }

                v20 = self;
                uint64_t v21 = 30;
                goto LABEL_43;
              case 0xCuLL:
                v50 = sub_100008DCC();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
                  sub_1003A80B4(self);
                }

                v20 = self;
                uint64_t v21 = 32;
                goto LABEL_43;
              case 0xDuLL:
                v51 = sub_100008DCC();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
                  sub_1003A7D84(self);
                }

                v20 = self;
                uint64_t v21 = 33;
                goto LABEL_43;
              case 0xEuLL:
                v52 = sub_100008DCC();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
                  sub_1003A813C(self);
                }

                v20 = self;
                uint64_t v21 = 35;
                goto LABEL_43;
              case 0xFuLL:
                v53 = sub_100008DCC();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
                  sub_1003A81C4(self);
                }

                v20 = self;
                uint64_t v21 = 37;
                goto LABEL_43;
              case 0x10uLL:
                v54 = sub_100008DCC();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
                  sub_1003A824C(self);
                }

                v20 = self;
                uint64_t v21 = 38;
                goto LABEL_43;
              case 0x14uLL:
                v56 = sub_100008DCC();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
                  sub_1003A82D4(self);
                }

                v20 = self;
                uint64_t v21 = 42;
                goto LABEL_43;
              case 0x15uLL:
                v57 = sub_100008DCC();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
                  sub_1003A835C(self);
                }

                v20 = self;
                uint64_t v21 = 43;
                goto LABEL_43;
              default:
                v55 = sub_100008DCC();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
                  sub_1003A7ADC(self);
                }

                v20 = self;
                uint64_t v21 = 14;
                goto LABEL_43;
            }
          }
          uint64_t v37 = sub_100008DCC();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            sub_1003A7A64(self);
          }

          [(CSDCall *)self setDisconnectedReason:14];
          int v8 = self;
          uint64_t v9 = 511;
LABEL_52:
          [(CSDProviderCall *)v8 setProviderFailureReasonIfNecessary:v9];
          return;
        case 2:
          uint64_t v22 = sub_100008DCC();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v23 = [(CSDProviderCall *)self endedReason];
            *(_DWORD *)buf = 134217984;
            int64_t v60 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Setting disconnected reason to remote hangup because ended reason is %ld", buf, 0xCu);
          }

          [(CSDCall *)self setDisconnectedReason:6];
          goto LABEL_25;
        case 3:
LABEL_25:
          if ([(CSDProviderCall *)self hasStartedConnecting])
          {
            __int16 v10 = sub_100008DCC();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_29;
            }
            int64_t v24 = [(CSDProviderCall *)self endedReason];
            *(_DWORD *)buf = 134217984;
            int64_t v60 = v24;
            id v12 = "Setting disconnected reason to remote hangup because call has started connecting and ended reason is %ld";
          }
          else
          {
            if (![(CSDProviderCall *)self isOutgoing]) {
              return;
            }
            id v33 = [(CSDProviderCall *)self provider];
            unsigned int v34 = [v33 isTelephonyProvider];

            __int16 v10 = sub_100008DCC();
            BOOL v35 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
            if (!v34)
            {
              if (v35)
              {
                int64_t v38 = [(CSDProviderCall *)self endedReason];
                *(_DWORD *)buf = 134217984;
                int64_t v60 = v38;
                _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting disconnected reason to remote unavailable because outgoing call has not started connecting and ended reason is %ld", buf, 0xCu);
              }

              v20 = self;
              uint64_t v21 = 5;
              goto LABEL_43;
            }
            if (!v35) {
              goto LABEL_29;
            }
            int64_t v36 = [(CSDProviderCall *)self endedReason];
            *(_DWORD *)buf = 134217984;
            int64_t v60 = v36;
            id v12 = "Setting disconnected reason to remote hangup because outgoing call has not started connecting and ende"
                  "d reason is %ld but call is a telephony call";
          }
          break;
        case 4:
          v25 = sub_100008DCC();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v26 = [(CSDProviderCall *)self endedReason];
            *(_DWORD *)buf = 134217984;
            int64_t v60 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Setting disconnected reason to answered elsewhere because ended reason is %ld", buf, 0xCu);
          }

          v20 = self;
          uint64_t v21 = 1;
          goto LABEL_43;
        case 5:
          id v27 = sub_100008DCC();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v28 = [(CSDProviderCall *)self endedReason];
            *(_DWORD *)buf = 134217984;
            int64_t v60 = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Setting disconnected reason to declined elsewhere because ended reason is %ld", buf, 0xCu);
          }

          v20 = self;
          uint64_t v21 = 3;
          goto LABEL_43;
        default:
          return;
      }
    }
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
LABEL_29:

LABEL_30:
    v20 = self;
    uint64_t v21 = 6;
    goto LABEL_43;
  }
  id v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [(CSDProviderCall *)self failureContext];
    int64_t v15 = [(CSDProviderCall *)self endedReason];
    *(_DWORD *)buf = 138412546;
    int64_t v60 = (int64_t)v14;
    __int16 v61 = 2048;
    int64_t v62 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "updateForDisconnection failureContext: %@, endedReason: %ld", buf, 0x16u);
  }
  id v16 = [(CSDProviderCall *)self failureContext];

  if (v16)
  {
    v17 = [(CSDProviderCall *)self failureContext];
    -[CSDCall setDisconnectedReason:](self, "setDisconnectedReason:", -[CSDProviderCall _switchFromFailureReasonToDisconnectedReason:](self, "_switchFromFailureReasonToDisconnectedReason:", [v17 failureReason]));

    return;
  }
  if ((id)[(CSDProviderCall *)self endedReason] == (id)2)
  {
    id v18 = [(CSDProviderCall *)self provider];
    unsigned int v19 = [v18 isFaceTimeProvider];

    if (v19) {
      goto LABEL_30;
    }
  }
  v20 = self;
  uint64_t v21 = 17;
LABEL_43:
  [(CSDCall *)v20 setDisconnectedReason:v21];
}

- (id)endedReasonUserInfo
{
  uint64_t v3 = [(CSDProviderCall *)self failureContext];
  BOOL v4 = [v3 endedReasonUserInfoForCall:self];

  return v4;
}

- (int64_t)providerErrorCode
{
  v2 = [(CSDProviderCall *)self failureContext];
  id v3 = [v2 providerErrorCode];

  return (int64_t)v3;
}

- (int64_t)providerEndedReason
{
  v2 = [(CSDProviderCall *)self failureContext];
  id v3 = [v2 providerEndedReason];

  return (int64_t)v3;
}

- (id)announceProviderIdentifier
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  id v3 = [v2 announceProviderIdentifier];

  return v3;
}

- (id)callerNameFromNetwork
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  id v3 = [v2 localizedCallerName];

  return v3;
}

- (NSUUID)callGroupUUID
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  id v3 = [v2 participantGroupUUID];

  return (NSUUID *)v3;
}

- (BOOL)hasBeenRedirected
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 hasBeenRedirected];

  return v3;
}

- (id)callHistoryIdentifier
{
  if ([(CSDProviderCall *)self isConversation])
  {
    v10.receiver = self;
    v10.super_class = (Class)CSDProviderCall;
    unsigned __int8 v3 = [(CSDProviderCall *)&v10 callHistoryIdentifier];
  }
  else
  {
    BOOL v4 = [(CSDProviderCall *)self mergedCallUpdate];
    unsigned int v5 = [v4 crossDeviceIdentifier];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)CSDProviderCall;
      id v7 = [(CSDProviderCall *)&v9 callHistoryIdentifier];
    }
    unsigned __int8 v3 = v7;
  }

  return v3;
}

- (id)handle
{
  unsigned __int8 v3 = [(CSDProviderCall *)self mergedCallUpdate];
  BOOL v4 = [v3 remoteHandle];

  unsigned int v5 = [v4 value];

  if (!v5)
  {
    id v13 = 0;
    goto LABEL_16;
  }
  id v6 = [(CSDProviderCall *)self pauseDigitsQueue];
  id v7 = [v4 value];
  if (v6)
  {
    int v8 = [(CSDProviderCall *)self pauseDigitsQueue];
    objc_super v9 = [v8 originalPauseDigitsString];
    uint64_t v10 = [v7 stringByAppendingString:v9];

    id v7 = (void *)v10;
  }

  id v11 = [v4 type];
  if (v11 == (id)1)
  {
    uint64_t v12 = +[TUHandle normalizedGenericHandleForValue:v7];
  }
  else
  {
    if (v11 == (id)2)
    {
      unsigned int v14 = [(CSDProviderCall *)self isoCountryCode];
      id v13 = +[TUHandle normalizedPhoneNumberHandleForValue:v7 isoCountryCode:v14];

      goto LABEL_12;
    }
    if (v11 != (id)3)
    {
      id v13 = 0;
      goto LABEL_15;
    }
    uint64_t v12 = +[TUHandle normalizedEmailAddressHandleForValue:v7];
  }
  id v13 = (void *)v12;
LABEL_12:

  if (!v13) {
    goto LABEL_16;
  }
  id v7 = [v4 siriDisplayName];
  [v13 setSiriDisplayName:v7];
LABEL_15:

LABEL_16:

  return v13;
}

- (BOOL)isUsingBaseband
{
  v2 = self;
  unsigned __int8 v3 = [(CSDProviderCall *)self mergedCallUpdate];
  id v7 = [v3 hasSet];
  LODWORD(v8) = v4;
  if (((unsigned __int16)v7 & 0x100) != 0)
  {
    unsigned int v5 = [(CSDProviderCall *)v2 mergedCallUpdate];
    LOBYTE(v2) = [v5 isUsingBaseband];
  }
  else if ([(CSDProviderCall *)v2 service] == 1)
  {
    LODWORD(v2) = +[TUCallCapabilities isWiFiCallingCurrentlyAvailable] ^ 1;
  }
  else
  {
    LOBYTE(v2) = 0;
  }

  return (char)v2;
}

- (BOOL)isBlocked
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 isBlocked];

  return v3;
}

- (BOOL)isVideo
{
  unsigned __int8 v3 = [(CSDProviderCall *)self provider];
  if ([v3 isSystemProvider]) {
    BOOL video = self->_video;
  }
  else {
    BOOL video = 0;
  }

  return video;
}

- (BOOL)isThirdPartyVideo
{
  unsigned __int8 v3 = [(CSDProviderCall *)self provider];
  if ([v3 isSystemProvider])
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    unsigned int v5 = [(CSDProviderCall *)self mergedCallUpdate];
    unsigned __int8 v4 = [v5 hasVideo];
  }
  return v4;
}

- (int64_t)videoStreamToken
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  id v3 = [v2 videoStreamToken];

  return (int64_t)v3;
}

- (id)initiator
{
  id v3 = [(CSDProviderCall *)self mergedCallUpdate];
  unint64_t v10 = (unint64_t)[v3 hasSet];
  LODWORD(v11) = v4;

  if ((v10 & 0x800000000) != 0)
  {
    id v6 = [(CSDProviderCall *)self mergedCallUpdate];
    id v7 = [v6 initiator];
  }
  else
  {
    if ([(CSDProviderCall *)self service] != 1
      || [(CSDProviderCall *)self isOutgoing])
    {
      unsigned int v5 = 0;
      goto LABEL_8;
    }
    id v6 = [(CSDProviderCall *)self mergedCallUpdate];
    id v7 = [v6 remoteHandle];
  }
  uint64_t v8 = v7;
  unsigned int v5 = [v7 tuHandle];

LABEL_8:

  return v5;
}

- (BOOL)isRemoteUplinkMuted
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 isRemoteUplinkMuted];

  return v3;
}

- (id)isoCountryCode
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 ISOCountryCode];

  return v3;
}

- (id)localSenderIdentityUUID
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 localSenderIdentityUUID];

  return v3;
}

- (id)localSenderIdentityAccountUUID
{
  unsigned __int8 v3 = [(CSDProviderCall *)self mergedCallUpdate];
  int v4 = [v3 localSenderIdentityAccountUUID];

  if (!v4)
  {
    unsigned int v5 = [(CSDProviderCall *)self localSenderIdentityUUID];
    if (v5)
    {
      id v6 = [(CSDProviderCall *)self provider];
      id v7 = [v6 senderIdentityForUUID:v5];
      int v4 = [v7 accountUUID];
    }
    else
    {
      int v4 = 0;
    }
  }

  return v4;
}

- (id)activeRemoteParticipants
{
  unsigned __int8 v3 = [(CSDProviderCall *)self mergedCallUpdate];
  int v4 = [v3 activeRemoteParticipantHandles];
  if (v4)
  {
    unsigned int v5 = [(CSDProviderCall *)self mergedCallUpdate];
    id v6 = [v5 activeRemoteParticipantHandles];
    id v7 = +[CXHandle tuHandlesWithHandles:v6];
  }
  else
  {
    id v7 = +[NSSet set];
  }

  return v7;
}

- (int64_t)audioInterruptionProviderType
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  id v3 = [v2 audioInterruptionProvider];

  if (v3 == (id)1) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)audioInterruptionOperationMode
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  id v3 = (char *)[v2 audioInterruptionOperationMode];

  if ((unint64_t)(v3 - 1) >= 3) {
    return 0;
  }
  else {
    return (int64_t)v3;
  }
}

- (AVAudioSession)proxyAVAudioSession
{
  id v3 = [(CSDProviderCall *)self provider];
  if ([v3 isSystemProvider])
  {
    int v4 = 0;
LABEL_5:

    goto LABEL_7;
  }
  int64_t v5 = [(CSDProviderCall *)self audioInterruptionProviderType];

  if (v5 == 1)
  {
    id v3 = [(CSDProviderCall *)self provider];
    int v4 = +[AVAudioSession retrieveSessionWithID:](AVAudioSession, "retrieveSessionWithID:", [v3 audioSessionID]);
    goto LABEL_5;
  }
  int v4 = 0;
LABEL_7:

  return (AVAudioSession *)v4;
}

- (id)audioCategory
{
  id v3 = [(CSDProviderCall *)self mergedCallUpdate];
  int v4 = [v3 audioCategory];

  int64_t v5 = [(CSDProviderCall *)self proxyAVAudioSession];

  if (v5)
  {
    id v6 = [(CSDProviderCall *)self proxyAVAudioSession];
    uint64_t v7 = [v6 category];

    int v4 = (void *)v7;
  }

  return v4;
}

- (int64_t)screenSharingIntention
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  int64_t v3 = sub_1000BF27C((uint64_t)[v2 screenSharingIntention]);

  return v3;
}

- (id)audioMode
{
  int64_t v3 = [(CSDProviderCall *)self mergedCallUpdate];
  int v4 = [v3 audioMode];

  int64_t v5 = [(CSDProviderCall *)self proxyAVAudioSession];

  if (v5)
  {
    id v6 = [(CSDProviderCall *)self proxyAVAudioSession];
    uint64_t v7 = [v6 mode];

    int v4 = (void *)v7;
  }

  return v4;
}

- (BOOL)needsManualInCallSounds
{
  if ([(CSDCall *)self temporaryRequireInCallSounds]) {
    return 1;
  }
  int v4 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v5 = [v4 requiresInCallSounds];

  return v5;
}

- (int64_t)soundRegion
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  int64_t v3 = (char *)[v2 inCallSoundRegion];

  if ((unint64_t)(v3 - 1) >= 5) {
    return 0;
  }
  else {
    return (int64_t)v3;
  }
}

- (BOOL)mixesVoiceWithMedia
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 mixesVoiceWithMedia];

  return v3;
}

- (BOOL)ignoresBluetoothDeviceUID
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 ignoresBluetoothDeviceUID];

  return v3;
}

- (id)providerContext
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 context];

  return v3;
}

- (BOOL)isOneToOneModeEnabled
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 isOneToOneModeEnabled];

  return v3;
}

- (int)ttyType
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  int v3 = sub_1000BF250((uint64_t)[v2 ttyType]);

  return v3;
}

- (BOOL)supportsTTYWithVoice
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 supportsTTYWithVoice];

  return v3;
}

- (int64_t)bluetoothAudioFormat
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  int64_t v3 = sub_1000BF244((uint64_t)[v2 bluetoothAudioFormat]);

  return v3;
}

- (BOOL)isEmergency
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 isEmergency];

  return v3;
}

- (BOOL)isFailureExpected
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 isFailureExpected];

  return v3;
}

- (BOOL)supportsEmergencyFallback
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 supportsEmergencyFallback];

  return v3;
}

- (id)handoffDynamicIdentifier
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 handoffContext];
  int v4 = [v3 handoffIdentifier];

  return v4;
}

- (id)handoffActivityUserInfo
{
  unsigned __int8 v3 = [(CSDProviderCall *)self mergedCallUpdate];
  int v4 = [v3 handoffContext];
  unsigned __int8 v5 = [v4 handoffActivityUserInfo];
  id v6 = [v5 mutableCopy];

  uint64_t v7 = [(CSDProviderCall *)self provider];
  uint64_t v8 = [v7 identifier];
  [v6 setObject:v8 forKeyedSubscript:TUCallUserActivityProviderIdentifierKey];

  id v9 = [v6 copy];

  return v9;
}

- (id)remoteParticipantHandles
{
  unsigned __int8 v3 = [(CSDProviderCall *)self mergedCallUpdate];
  int v4 = [v3 remoteParticipantHandles];

  if (v4)
  {
    unsigned __int8 v5 = [(CSDProviderCall *)self mergedCallUpdate];
    id v6 = [v5 remoteParticipantHandles];
    uint64_t v7 = +[CXHandle tuHandlesWithHandles:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CSDProviderCall;
    uint64_t v7 = [(CSDProviderCall *)&v9 remoteParticipantHandles];
  }

  return v7;
}

- (BOOL)mayRequireBreakBeforeMake
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 mayRequireBreakBeforeMake];

  return v3;
}

- (BOOL)prefersExclusiveAccessToCellularNetwork
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 prefersExclusiveAccessToCellularNetwork];

  return v3;
}

- (BOOL)shouldSuppressInCallUI
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 shouldSuppressInCallUI];

  return v3;
}

- (BOOL)isMutuallyExclusiveCall
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 isMutuallyExclusiveCall];

  return v3;
}

- (BOOL)isConversation
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 isConversation];

  return v3;
}

- (id)conversationID
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 conversationID];

  return v3;
}

- (LSApplicationRecord)applicationRecord
{
  v2 = [(CSDProviderCall *)self providerIdentifier];
  unsigned __int8 v3 = +[LSApplicationRecord csd_applicationRecordForApplicationIdentifier:v2];

  return (LSApplicationRecord *)v3;
}

- (id)provider
{
  unsigned __int8 v3 = [(CSDProviderCall *)self providerCallDelegate];
  int v4 = [(CSDProviderCall *)self providerIdentifier];
  unsigned __int8 v5 = [v3 providerWithIdentifier:v4];

  return v5;
}

- (int)callStatusFromUnderlyingSource
{
  if ([(CSDProviderCall *)self hasEnded]) {
    return 6;
  }
  if ([(CSDProviderCall *)self isHeld]) {
    return 2;
  }
  if ([(CSDProviderCall *)self hasConnected]
    || [(CSDProviderCall *)self isIncoming]
    && [(CSDProviderCall *)self hasStartedConnecting])
  {
    return 1;
  }
  if ([(CSDProviderCall *)self isOutgoing]) {
    return 3;
  }
  return 4;
}

- (BOOL)hasStartedConnecting
{
  v2 = [(CSDProviderCall *)self dateStartedConnecting];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasConnected
{
  v2 = [(CSDProviderCall *)self dateConnected];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasEnded
{
  v2 = [(CSDProviderCall *)self dateEnded];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)hardPauseDigits
{
  BOOL v3 = [(CSDProviderCall *)self pauseDigitsQueue];
  int v4 = [v3 nextPauseDigits];
  if ([v4 isHardPause])
  {
    unsigned __int8 v5 = [(CSDProviderCall *)self pauseDigitsQueue];
    id v6 = [v5 nextPauseDigits];
    uint64_t v7 = [v6 digits];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (int)hardPauseDigitsState
{
  BOOL v3 = [(CSDProviderCall *)self pauseDigitsQueue];
  int v4 = [v3 nextPauseDigits];
  unsigned __int8 v5 = [v4 isHardPause];

  if (v5) {
    return 2;
  }
  uint64_t v7 = [(CSDProviderCall *)self pauseDigitsQueue];
  int v6 = [v7 hasQueuedHardPauseDigits];

  return v6;
}

- (BOOL)isInternational
{
  BOOL v3 = [(CSDProviderCall *)self providerIdentifier];
  if (TUStringsAreCaseInsensitiveEqual())
  {
    unsigned __int8 v4 = [(CSDProviderCall *)self isIncoming];

    if (v4)
    {
      unsigned __int8 v5 = [(CSDProviderCall *)self mergedCallUpdate];
      int v6 = [v5 account];
      uint64_t v7 = [v6 isoCountryCode];

      if ([v7 length])
      {
        uint64_t v8 = [(CSDProviderCall *)self isoCountryCode];
        if ([v8 length])
        {
          int v9 = TUStringsAreCaseInsensitiveEqual();
          if (TUStringsAreCaseInsensitiveEqual() & 1) != 0 || (TUStringsAreCaseInsensitiveEqual()) {
            int v10 = 1;
          }
          else {
            int v10 = TUStringsAreCaseInsensitiveEqual();
          }
          id v13 = [(CSDProviderCall *)self userConfiguration];
          unsigned int v14 = [v13 simulateInternationalCall];

          BOOL v11 = 0;
          if (TUStringsAreCaseInsensitiveEqual() && v9 | v10 | v14)
          {
            int64_t v15 = [(CSDProviderCall *)self remoteParticipantHandles];
            id v16 = [v15 anyObject];

            v17 = [v16 value];
            if ([v17 length])
            {
              id v18 = (void *)_PNCopyInternationalPrefix();
              BOOL v11 = [v18 length] != 0;
            }
            else
            {
              BOOL v11 = 0;
            }
          }
          goto LABEL_23;
        }
        uint64_t v12 = sub_100008DCC();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "International status is false; celluar network ISO country code is not available.",
            v20,
            2u);
        }
      }
      else
      {
        uint64_t v8 = sub_100008DCC();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "International status is false; service provider ISO country code is not available.",
            buf,
            2u);
        }
      }
      BOOL v11 = 0;
LABEL_23:

      return v11;
    }
  }
  else
  {
  }
  return 0;
}

- (BOOL)isDomestic
{
  BOOL v3 = [(CSDProviderCall *)self handle];
  id v4 = [v3 type];

  if (v4 != (id)2) {
    return 0;
  }
  unsigned __int8 v5 = [(CSDProviderCall *)self mergedCallUpdate];
  int v6 = [v5 account];
  uint64_t v7 = [v6 isoCountryCode];

  uint64_t v8 = (void *)_PNCopyInternationalCodeForCountry();
  long long v15 = INIT_DECOMPOSED_PHONE_NUMBER;
  int v9 = [(CSDProviderCall *)self handle];
  int v10 = [v9 value];

  id v11 = v10;
  [v11 UTF8String];
  if (PNDecomposeForCountry() && (void)v15)
  {
    uint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
    unsigned __int8 v13 = [v8 isEqualToString:v12];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (BOOL)isSendingVideo
{
  return [(CSDProviderCall *)self sendingVideo];
}

- (BOOL)isUplinkMuted
{
  BOOL v3 = [(CSDProviderCall *)self provider];
  unsigned __int8 v4 = [v3 isTinCanProvider];

  unsigned __int8 v5 = [(CSDProviderCall *)self isUnderlyingUplinkMuted];
  if (v4 & 1) != 0 || (v5) {
    return v4 ^ 1 | v5;
  }
  int v6 = +[TUAudioSystemController sharedAudioSystemController];
  unsigned __int8 v7 = [v6 isUplinkMuted];

  return v7;
}

- (BOOL)isDownlinkMuted
{
  v2 = +[TUAudioSystemController sharedAudioSystemController];
  unsigned __int8 v3 = [v2 isDownlinkMuted];

  return v3;
}

- (unint64_t)initialLinkType
{
  unsigned __int8 v3 = [(CSDProviderCall *)self providerContext];
  unsigned __int8 v4 = [v3 objectForKeyedSubscript:@"CSDIDSInitialLinkTypeKey"];
  if (v4)
  {
    unsigned __int8 v5 = [(CSDProviderCall *)self providerContext];
    int v6 = [v5 objectForKeyedSubscript:@"CSDIDSInitialLinkTypeKey"];
    id v7 = [v6 unsignedIntegerValue];
  }
  else
  {
    id v7 = 0;
  }

  return (unint64_t)v7;
}

- (int64_t)inputAudioPowerSpectrumToken
{
  unsigned __int8 v3 = [(CSDProviderCall *)self providerContext];
  unsigned __int8 v4 = [v3 objectForKeyedSubscript:@"CSDIDSInputAudioPowerSpectrumTokenKey"];
  if (v4)
  {
    unsigned __int8 v5 = [(CSDProviderCall *)self providerContext];
    int v6 = [v5 objectForKeyedSubscript:@"CSDIDSInputAudioPowerSpectrumTokenKey"];
    id v7 = [v6 unsignedIntegerValue];
  }
  else
  {
    id v7 = 0;
  }

  return (int64_t)v7;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  unsigned __int8 v3 = [(CSDProviderCall *)self providerContext];
  unsigned __int8 v4 = [v3 objectForKeyedSubscript:@"CSDIDSOutputAudioPowerSpectrumTokenKey"];
  if (v4)
  {
    unsigned __int8 v5 = [(CSDProviderCall *)self providerContext];
    int v6 = [v5 objectForKeyedSubscript:@"CSDIDSOutputAudioPowerSpectrumTokenKey"];
    id v7 = [v6 unsignedIntegerValue];
  }
  else
  {
    id v7 = 0;
  }

  return (int64_t)v7;
}

- (int64_t)serviceStatus
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  id v3 = [v2 serviceStatus];

  if (v3 == (id)1) {
    return 1;
  }
  else {
    return 2 * (v3 == (id)2);
  }
}

- (int64_t)transmissionMode
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  id v3 = [v2 transmissionMode];

  if (v3 == (id)1) {
    return 1;
  }
  else {
    return 2 * (v3 == (id)2);
  }
}

- (BOOL)accessoryButtonEventsEnabled
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 accessoryButtonEventsEnabled];

  return v3;
}

- (BOOL)usesSystemMuting
{
  v2 = [(CSDProviderCall *)self provider];
  unsigned __int8 v3 = [v2 isSystemProvider];

  return v3;
}

- (id)recordingDisabledError
{
  unsigned __int8 v3 = [(CSDProviderCall *)self featureFlags];
  unsigned __int8 v4 = [v3 callRecordingEnabled];

  if ((v4 & 1) == 0)
  {
    id v8 = objc_alloc((Class)NSError);
    uint64_t v9 = TUStartRecordingErrorDomain;
    uint64_t v10 = 2;
LABEL_27:
    id v21 = [v8 initWithDomain:v9 code:v10 userInfo:0];
    goto LABEL_28;
  }
  unsigned __int8 v5 = [(CSDProviderCall *)self isCallRecordingEnabled];
  char v6 = v5[2]();

  if ((v6 & 1) == 0)
  {
    id v8 = objc_alloc((Class)NSError);
    uint64_t v9 = TUStartRecordingErrorDomain;
    uint64_t v10 = 14;
    goto LABEL_27;
  }
  id v7 = [(CSDProviderCall *)self provider];
  if ([v7 isTelephonyProvider])
  {

    goto LABEL_8;
  }
  id v11 = [(CSDProviderCall *)self provider];
  unsigned __int8 v12 = [v11 isFaceTimeProvider];

  if ((v12 & 1) == 0)
  {
    id v8 = objc_alloc((Class)NSError);
    uint64_t v9 = TUStartRecordingErrorDomain;
    uint64_t v10 = 3;
    goto LABEL_27;
  }
LABEL_8:
  unsigned __int8 v13 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v14 = [v13 supportsRecording];

  if ((v14 & 1) == 0)
  {
    id v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Provider reports this call does not support recording", buf, 2u);
    }

    id v8 = objc_alloc((Class)NSError);
    uint64_t v9 = TUStartRecordingErrorDomain;
    uint64_t v10 = 4;
    goto LABEL_27;
  }
  if ([(CSDProviderCall *)self isEmergency])
  {
    long long v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Recording is not allowed for emergency calls", v23, 2u);
    }

    id v8 = objc_alloc((Class)NSError);
    uint64_t v9 = TUStartRecordingErrorDomain;
    uint64_t v10 = 11;
    goto LABEL_27;
  }
  if ([(CSDProviderCall *)self isVideo])
  {
    id v8 = objc_alloc((Class)NSError);
    uint64_t v9 = TUStartRecordingErrorDomain;
    uint64_t v10 = 6;
    goto LABEL_27;
  }
  v17 = [(CSDCall *)self delegate];
  unsigned int v18 = [v17 multipleCallsActiveOrHeld];

  if (v18)
  {
    id v8 = objc_alloc((Class)NSError);
    uint64_t v9 = TUStartRecordingErrorDomain;
    uint64_t v10 = 13;
    goto LABEL_27;
  }
  unsigned int v19 = [(CSDProviderCall *)self provider];
  if ([v19 isFaceTimeProvider])
  {
    unsigned __int8 v20 = [(CSDProviderCall *)self isOneToOneModeEnabled];

    if ((v20 & 1) == 0)
    {
      id v8 = objc_alloc((Class)NSError);
      uint64_t v9 = TUStartRecordingErrorDomain;
      uint64_t v10 = 7;
      goto LABEL_27;
    }
  }
  else
  {
  }
  if ([(CSDProviderCall *)self isScreening])
  {
    id v8 = objc_alloc((Class)NSError);
    uint64_t v9 = TUStartRecordingErrorDomain;
    uint64_t v10 = 15;
    goto LABEL_27;
  }
  id v21 = 0;
LABEL_28:

  return v21;
}

- (id)recordingAllowedError
{
  unsigned __int8 v3 = [(CSDProviderCall *)self recordingDisabledError];
  unsigned __int8 v4 = v3;
  if (v3)
  {
    id v5 = v3;
LABEL_12:
    uint64_t v10 = v5;
    goto LABEL_13;
  }
  if ([(CSDProviderCall *)self status] != 1)
  {
    id v7 = objc_alloc((Class)NSError);
    uint64_t v8 = TUStartRecordingErrorDomain;
    uint64_t v9 = 5;
LABEL_11:
    id v5 = [v7 initWithDomain:v8 code:v9 userInfo:0];
    goto LABEL_12;
  }
  if (([(CSDProviderCall *)self isEndpointOnCurrentDevice] & 1) == 0)
  {
    id v7 = objc_alloc((Class)NSError);
    uint64_t v8 = TUStartRecordingErrorDomain;
    uint64_t v9 = 8;
    goto LABEL_11;
  }
  if ([(CSDProviderCall *)self isConferenced])
  {
    char v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Recording is not allowed for conference calls", v12, 2u);
    }

    id v7 = objc_alloc((Class)NSError);
    uint64_t v8 = TUStartRecordingErrorDomain;
    uint64_t v9 = 10;
    goto LABEL_11;
  }
  uint64_t v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)supportsScreening
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 supportsScreening];

  return v3;
}

- (void)setHeld:(BOOL)a3
{
  if (self->_held != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10005C84C;
    v4[3] = &unk_100505030;
    v4[4] = self;
    BOOL v5 = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setOutgoing:(BOOL)a3
{
  if (self->_outgoing != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10005C8FC;
    v4[3] = &unk_100505030;
    v4[4] = self;
    BOOL v5 = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setSendingVideo:(BOOL)a3
{
  if (self->_sendingVideo != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10005C9AC;
    v4[3] = &unk_100505030;
    v4[4] = self;
    BOOL v5 = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setVideo:(BOOL)a3
{
  if (self->_video != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10005CA5C;
    v4[3] = &unk_100505030;
    v4[4] = self;
    BOOL v5 = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setFailureContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDProviderCall *)self failureContext];
  char v6 = TUObjectsAreEqualOrNil();

  if ((v6 & 1) == 0)
  {
    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    uint64_t v9 = sub_10005CB40;
    uint64_t v10 = &unk_100504F10;
    id v11 = self;
    id v12 = v4;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:&v7];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setCallGroupUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDProviderCall *)self mergedCallUpdate];
  char v6 = [v5 participantGroupUUID];
  char v7 = TUObjectsAreEqualOrNil();

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    uint64_t v10 = sub_10005CC38;
    id v11 = &unk_100504F10;
    id v12 = self;
    id v13 = v4;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:&v8];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setDateConnected:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSDProviderCall;
  [(CSDCall *)&v4 setDateConnected:a3];
  [(CSDProviderCall *)self setFailureContext:0];
  [(CSDProviderCall *)self _sendSoftPauseDigitsIfNecessary];
}

- (void)setProviderSource:(id)a3
{
  BOOL v5 = (CXAbstractProviderSource *)a3;
  if (self->_providerSource != v5)
  {
    uint64_t v10 = v5;
    objc_storeStrong((id *)&self->_providerSource, a3);
    if (v10)
    {
      char v6 = [CSDProviderDisplayMonitor alloc];
      char v7 = [(CXAbstractProviderSource *)v10 bundleIdentifier];
      uint64_t v8 = [(CSDProviderDisplayMonitor *)v6 initWithBundleIdentifier:v7 pid:[(CXAbstractProviderSource *)v10 processIdentifier]];
      providerDisplayMonitor = self->_providerDisplayMonitor;
      self->_providerDisplayMonitor = v8;
    }
    else
    {
      char v7 = self->_providerDisplayMonitor;
      self->_providerDisplayMonitor = 0;
    }

    BOOL v5 = v10;
  }
}

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CSDProviderCall *)self isEndpointOnCurrentDevice];
  v10.receiver = self;
  v10.super_class = (Class)CSDProviderCall;
  [(CSDCall *)&v10 setEndpointOnCurrentDevice:v3];
  if (v5 != v3)
  {
    id v6 = objc_alloc((Class)CXSetRelayingCallAction);
    char v7 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
    id v8 = [v6 initWithCallUUID:v7 relaying:v3 ^ 1];

    uint64_t v9 = [(CSDProviderCall *)self providerCallDelegate];
    [v9 performCallAction:v8 forCall:self];
  }
}

- (void)setScreening:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CSDProviderCall *)self isScreening];
  v11.receiver = self;
  v11.super_class = (Class)CSDProviderCall;
  [(CSDCall *)&v11 setScreening:v3];
  if (v5 != v3)
  {
    if (!v3)
    {
      id v6 = +[NSDate now];
      [(CSDProviderCall *)self setDateScreeningEnded:v6];
    }
    id v7 = objc_alloc((Class)CXSetScreeningCallAction);
    id v8 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
    id v9 = [v7 initWithCallUUID:v8 screening:v3];

    objc_super v10 = [(CSDProviderCall *)self providerCallDelegate];
    [v10 performCallAction:v9 forCall:self];
  }
}

- (void)setInjectingAudio:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CSDProviderCall *)self isInjectingAudio] != a3)
  {
    self->_injectingAudio = v3;
    unsigned int v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 67109120;
      unsigned int v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setting injecting audio to %d", (uint8_t *)&v9, 8u);
    }

    id v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [(CSDProviderCall *)self isInjectingAudio];
      int v9 = 67109378;
      unsigned int v10 = v7;
      __int16 v11 = 2112;
      id v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Posting notification injecting audio changed: %d %@", (uint8_t *)&v9, 0x12u);
    }

    id v8 = [(CSDProviderCall *)self notificationCenter];
    [v8 postNotificationName:@"CSDCallInjectingAudioChangedNotification" object:self];
  }
}

- (void)askProviderToAllowAudioInjection:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CSDProviderCall *)self isInjectingAudio] != a3)
  {
    unsigned int v5 = [(CSDProviderCall *)self provider];
    unsigned int v6 = [v5 isFaceTimeProvider];

    if (v6)
    {
      id v7 = objc_alloc((Class)CXSetAllowUplinkAudioInjectionAction);
      id v8 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
      id v12 = [v7 initWithCallUUID:v8 willInject:v3];

      int v9 = [(CSDProviderCall *)self providerCallDelegate];
      [v9 performCallAction:v12 forCall:self];
    }
    else
    {
      unsigned int v10 = [(CSDProviderCall *)self provider];
      unsigned int v11 = [v10 isTelephonyProvider];

      if (v11)
      {
        [(CSDProviderCall *)self setInjectingAudio:v3];
      }
    }
  }
}

- (void)setBluetoothAudioFormat:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSDProviderCall;
  -[CSDProviderCall setBluetoothAudioFormat:](&v6, "setBluetoothAudioFormat:");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005D28C;
  v5[3] = &unk_100504EE8;
  v5[4] = self;
  v5[5] = a3;
  [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
  [(CSDCall *)self propertiesChanged];
}

- (void)setMixesVoiceWithMedia:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSDProviderCall;
  -[CSDProviderCall setMixesVoiceWithMedia:](&v7, "setMixesVoiceWithMedia:");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005D394;
  v5[3] = &unk_100505030;
  v5[4] = self;
  BOOL v6 = a3;
  [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
  [(CSDCall *)self propertiesChanged];
}

- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSDProviderCall;
  -[CSDProviderCall setMediaPlaybackOnExternalDevice:](&v7, "setMediaPlaybackOnExternalDevice:");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005D454;
  v5[3] = &unk_100505030;
  v5[4] = self;
  BOOL v6 = a3;
  [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
  [(CSDCall *)self propertiesChanged];
}

- (id)startCallActionWithDialRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CSDProviderCall *)self callCenter];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10005D6E8;
  v21[3] = &unk_1005051A8;
  v21[4] = self;
  id v6 = [v5 anyCallPassesTest:v21];

  objc_super v7 = [(CSDProviderCall *)self mergedCallUpdate];
  id v8 = [v7 remoteHandle];
  int v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = [objc_alloc((Class)CXHandle) initWithType:2];
  }
  unsigned int v11 = v10;

  id v12 = objc_alloc((Class)CXStartCallAction);
  id v13 = objc_alloc((Class)NSUUID);
  unsigned __int8 v14 = [(CSDProviderCall *)self uniqueProxyIdentifier];
  id v15 = [v13 initWithUUIDString:v14];
  id v16 = [v12 initWithCallUUID:v15 handle:v11];

  objc_msgSend(v16, "setVideo:", -[CSDProviderCall isVideo](self, "isVideo"));
  objc_msgSend(v16, "setRelay:", -[CSDProviderCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice") ^ 1);
  v17 = [v4 contactIdentifier];
  [v16 setContactIdentifier:v17];

  [v16 setUpgrade:v6];
  objc_msgSend(v16, "setRetry:", objc_msgSend(v4, "isRedial"));
  unsigned int v18 = [v4 localSenderIdentityUUID];
  [v16 setLocalSenderIdentityUUID:v18];

  objc_msgSend(v16, "setShouldSuppressInCallUI:", objc_msgSend(v4, "shouldSuppressInCallUI"));
  [v4 localLandscapeAspectRatio];
  objc_msgSend(v16, "setLocalLandscapeAspectRatio:");
  [v4 localPortraitAspectRatio];
  objc_msgSend(v16, "setLocalPortraitAspectRatio:");
  if ((char *)[v4 ttyType] - 1 <= (char *)2) {
    objc_msgSend(v16, "setTTYType:");
  }
  id v19 = [v4 dialType];
  if (v19 == (id)2)
  {
    [v16 setVoicemail:1];
  }
  else if (v19 == (id)1)
  {
    [v16 setEmergency:1];
  }

  return v16;
}

- (void)dialWithRequest:(id)a3 displayContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CSDProviderCall;
  [(CSDCall *)&v31 dialWithRequest:v6 displayContext:v7];
  id v8 = [(CSDProviderCall *)self providerCallDelegate];
  int v9 = [v8 callSourceForDialRequest:v6];
  if (v9)
  {
    [(CSDProviderCall *)self setBackingCallSource:v9];
    id v10 = [(CSDProviderCall *)self startCallActionWithDialRequest:v6];
    unsigned int v11 = [v6 handle];
    id v12 = [v11 siriDisplayName];
    id v13 = [v10 handle];
    [v13 setSiriDisplayName:v12];

    objc_initWeak(&location, self);
    int64_t v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_10005DA5C;
    int64_t v26 = &unk_100505AC8;
    objc_copyWeak(&v29, &location);
    id v27 = v8;
    id v14 = v10;
    id v28 = v14;
    dispatch_block_t v15 = dispatch_block_create((dispatch_block_flags_t)0, &v23);
    -[CSDProviderCall setStartCallBlock:](self, "setStartCallBlock:", v15, v23, v24, v25, v26);

    id v16 = [(CSDProviderCall *)self dialDelayForRequest];
    v17 = ((void (**)(void, id))v16)[2](v16, v6);

    if (v17)
    {
      unsigned int v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v33 = "-[CSDProviderCall dialWithRequest:displayContext:]";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "CSDProviderCall %s: Delaying dial due to Low Power Mode", buf, 0xCu);
      }

      dispatch_time_t v19 = dispatch_time(0, 1000000000 * (void)[v17 unsignedIntegerValue]);
      uint64_t v20 = [(CSDProviderCall *)self queue];
      id v21 = [(CSDProviderCall *)self startCallBlock];
      dispatch_after(v19, (dispatch_queue_t)v20, v21);
    }
    else
    {
      uint64_t v20 = [(CSDProviderCall *)self startCallBlock];
      (*(void (**)(void))(v20 + 16))();
    }

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v22 = sub_100008DCC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1003A83E4();
    }

    [(CSDCall *)self setDisconnectedReason:17];
    [(CSDCall *)self propertiesChanged];
  }
}

- (id)_dialDelayForRequest:(id)a3
{
  return 0;
}

- (void)joinConversationWithRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CSDProviderCall joinConversationWithRequest: %@", buf, 0xCu);
  }

  id v6 = [(CSDProviderCall *)self providerCallDelegate];
  id v7 = [v6 callSourceForJoinConversationRequest:v4];
  [(CSDProviderCall *)self setBackingCallSource:v7];

  if ([(CSDCall *)self callStatus] == 4)
  {
    [(CSDProviderCall *)self setShouldAcceptDateConnectedProviderUpdates:1];
    id v8 = +[NSDate date];
    [(CSDCall *)self setDateStartedConnecting:v8];
  }
  if (![v4 originatingUIType])
  {
    int v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_1003A8458();
    }
  }
  [(CSDCall *)self setIsSendingAudio:1];
  -[CSDProviderCall setWantsStagingArea:](self, "setWantsStagingArea:", [v4 wantsStagingArea]);
  id v10 = [v4 conversationLink];
  [(CSDCall *)self setJoinedFromLink:v10 != 0];

  unsigned int v11 = [v4 audioSourceIdentifier];
  [(CSDProviderCall *)self setSourceIdentifier:v11];

  [(CSDProviderCall *)self setIsUnderlyingLinksConnected:1];
  id v12 = [v4 joinCallAction];
  uint64_t v13 = [v4 conversationLink];
  if (v13
    && (id v14 = (void *)v13,
        unsigned int v15 = [(CSDProviderCall *)self lockdownModeEnabled],
        v14,
        v15))
  {
    [(CSDCall *)self setDisconnectedReason:29];
    id v16 = 0;
    v17 = 0;
    unsigned int v18 = 0;
  }
  else
  {
    uint64_t v19 = [v4 conversationLink];
    if (v19
      && (uint64_t v20 = (void *)v19,
          unsigned __int8 v21 = [v4 isJoiningConversationWithLink],
          v20,
          (v21 & 1) == 0))
    {
      int v46 = +[CSDFaceTimeMultiwayIDSService sharedInstance];
      uint64_t v24 = [v46 callerID];
      v25 = +[TUHandle normalizedHandleWithDestinationID:v24];
      unsigned int v18 = +[CXHandle handleWithTUHandle:v25];
      int64_t v26 = sub_100008DCC();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v48 = v18;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "LMI: callerID is: %@", buf, 0xCu);
      }

      id v27 = [v4 conversationLink];
      v17 = [v27 pseudonym];

      id v28 = [v4 conversationLink];
      id v16 = [v28 publicKey];
    }
    else
    {
      uint64_t v22 = [v4 callerID];
      if (v22)
      {
        int64_t v23 = [v4 callerID];
        unsigned int v18 = +[CXHandle handleWithTUHandle:v23];
      }
      else
      {
        unsigned int v18 = 0;
      }

      v17 = [v4 conversationLink];
      if (v17)
      {
        unsigned int v29 = [v4 isJoiningConversationWithLink];

        if (v29)
        {
          int64_t v30 = [v4 conversationLink];
          v17 = [v30 pseudonym];

          objc_super v31 = [v4 conversationLink];
          id v16 = [v31 publicKey];
        }
        else
        {
          id v16 = 0;
          v17 = 0;
        }
      }
      else
      {
        id v16 = 0;
      }
    }
  }
  [v12 setCallerID:v18];
  [v12 setPseudonym:v17];
  [v12 setPublicKey:v16];
  [v12 setScreenShareRequestType:0];
  int64_t v32 = [(CSDProviderCall *)self featureFlags];
  unsigned int v33 = [v32 usesModernScreenSharingFromMessages];

  if (v33)
  {
    if ([v4 requestToShareScreen])
    {
      uint64_t v34 = 1;
    }
    else
    {
      if (![v4 requestToShareMyScreen])
      {
LABEL_31:
        objc_msgSend(v12, "setShouldSendLegacyScreenSharingInvite:", objc_msgSend(v4, "shouldSendLegacyScreenSharingInvite"));
        goto LABEL_32;
      }
      uint64_t v34 = 2;
    }
    [v12 setScreenShareRequestType:v34];
    goto LABEL_31;
  }
LABEL_32:
  BOOL v35 = [(CSDProviderCall *)self featureFlags];
  if ([v35 conversationHandoffEnabled])
  {
    int64_t v36 = [v4 participantAssociation];

    if (v36)
    {
      uint64_t v37 = [v4 participantAssociation];
      int64_t v38 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v37 identifier]);
      [v12 setAssociationIdentifier:v38];

      id v39 = [v4 participantAssociation];
      id v40 = [v39 avcIdentifier];
      [v12 setAssociationAVCIdentifier:v40];

      [(CSDCall *)self setStartAsHandoff:1];
    }
  }
  else
  {
  }
  id v41 = [v4 invitationPreferences];
  id v42 = [v41 count];

  if (v42)
  {
    objc_super v43 = sub_100008DCC();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = [v4 invitationPreferences];
      *(_DWORD *)buf = 138412290;
      id v48 = v44;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Join request specifies invitation preferences: %@", buf, 0xCu);
    }
    v45 = [v4 notificationStylesByHandleType];
    [v12 setNotificationStylesByHandleType:v45];
  }
  [v6 performCallAction:v12 forCall:self];
  -[CSDProviderCall setUplinkMuted:](self, "setUplinkMuted:", [v4 isUplinkMuted]);
  -[CSDProviderCall setIsSendingVideo:](self, "setIsSendingVideo:", [v4 isVideoEnabled]);
  [(CSDCall *)self propertiesChanged];
}

- (void)answerWithRequest:(id)a3
{
  id v4 = a3;
  if ([(CSDProviderCall *)self isScreening]
    && ([v4 sendToScreening] & 1) == 0
    && [(CSDCall *)self callStatus] == 1)
  {
    [(CSDProviderCall *)self setScreening:0];
    id v5 = [v4 sourceIdentifier];
    [(CSDProviderCall *)self setSourceIdentifier:v5];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CSDProviderCall;
    [(CSDProviderCall *)&v11 answerWithRequest:v4];
    id v6 = +[NSDate date];
    [(CSDCall *)self setDateStartedConnecting:v6];

    if ([v4 pauseVideoToStart]) {
      [(CSDProviderCall *)self setIsSendingVideo:0];
    }
    id v7 = objc_alloc((Class)CXAnswerCallAction);
    id v8 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
    id v5 = [v7 initWithCallUUID:v8];

    if ([v4 behavior] == (id)4 || objc_msgSend(v4, "downgradeToAudio"))
    {
      [(CSDProviderCall *)self setIsSendingVideo:0];
      if (![(CSDProviderCall *)self isConversation]) {
        [(CSDProviderCall *)self setVideo:0];
      }
      [v5 setDowngradeToAudio:1];
    }
    if ([v4 pauseVideoToStart]) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = [(CSDProviderCall *)self isSendingVideo] ^ 1;
    }
    [v5 setPauseVideoToStart:v9];
    [v4 localLandscapeAspectRatio];
    objc_msgSend(v5, "setLocalLandscapeAspectRatio:");
    [v4 localPortraitAspectRatio];
    objc_msgSend(v5, "setLocalPortraitAspectRatio:");
    objc_msgSend(v5, "setScreening:", objc_msgSend(v4, "sendToScreening"));
    id v10 = [(CSDProviderCall *)self providerCallDelegate];
    [v10 performCallAction:v5 forCall:self];
  }
}

- (void)hold
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10005E38C;
  v2[3] = &unk_100504EC0;
  v2[4] = self;
  [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v2];
}

- (void)unhold
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10005E44C;
  v2[3] = &unk_100504EC0;
  v2[4] = self;
  [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v2];
}

- (void)_setIsOnHold:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(CSDProviderCall *)self isPTT] & 1) == 0)
  {
    id v5 = objc_alloc((Class)CXSetHeldCallAction);
    id v6 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
    id v10 = [v5 initWithCallUUID:v6 onHold:v3];

    if ([(CSDProviderCall *)self status] == 1 && v3)
    {
      id v7 = [(CSDProviderCall *)self pauseDigitsQueue];
      id v8 = [v7 dequeueAllPauseDigits];
    }
    uint64_t v9 = [(CSDProviderCall *)self providerCallDelegate];
    [v9 performCallAction:v10 forCall:self];
  }
}

- (void)groupWithOtherCall:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CSDProviderCall;
  id v4 = a3;
  [(CSDProviderCall *)&v10 groupWithOtherCall:v4];
  id v5 = objc_alloc((Class)CXSetGroupCallAction);
  id v6 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
  id v7 = [v4 uniqueProxyIdentifierUUID];

  id v8 = [v5 initWithCallUUID:v6 callUUIDToGroupWith:v7];
  uint64_t v9 = [(CSDProviderCall *)self providerCallDelegate];
  [v9 performCallAction:v8 forCall:self];
}

- (void)ungroup
{
  v7.receiver = self;
  v7.super_class = (Class)CSDProviderCall;
  [(CSDProviderCall *)&v7 ungroup];
  id v3 = objc_alloc((Class)CXSetGroupCallAction);
  id v4 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
  id v5 = [v3 initWithCallUUID:v4 callUUIDToGroupWith:0];

  id v6 = [(CSDProviderCall *)self providerCallDelegate];
  [v6 performCallAction:v5 forCall:self];
}

- (void)disconnectWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v22.receiver = self;
  v22.super_class = (Class)CSDProviderCall;
  -[CSDProviderCall disconnectWithReason:](&v22, "disconnectWithReason:");
  if (([(CSDProviderCall *)self isPTT] & 1) == 0)
  {
    id v5 = [(CSDProviderCall *)self startCallBlock];

    if (v5)
    {
      id v6 = sub_100008DCC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Asked to disconnect call while it is in low power mode delay- cancelling start call block and marking disconnected", buf, 2u);
      }

      objc_super v7 = [(CSDProviderCall *)self startCallBlock];
      dispatch_block_cancel(v7);

      [(CSDProviderCall *)self setStartCallBlock:0];
      id v8 = objc_alloc_init((Class)CXCallFailureContext);
      [(CSDProviderCall *)self setFailureContext:v8];

      uint64_t v9 = [(CSDProviderCall *)self failureContext];
      [v9 setFailureReason:0];

      objc_super v10 = +[NSDate date];
      [(CSDCall *)self setDateEnded:v10];

      [(CSDCall *)self propertiesChanged];
    }
    else
    {
      objc_super v11 = [(CSDProviderCall *)self failureContext];

      if (!v11)
      {
        id v12 = objc_alloc_init((Class)CXCallFailureContext);
        [(CSDProviderCall *)self setFailureContext:v12];
      }
      int64_t v13 = [(CSDProviderCall *)self _switchToCXCallFailureReasonFromTUCallDisconnectedReason:v3];
      id v14 = [(CSDProviderCall *)self failureContext];
      [v14 setFailureReason:v13];

      unsigned int v15 = sub_100008DCC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [(CSDProviderCall *)self failureContext];
        id v17 = [v16 failureReason];
        *(_DWORD *)buf = 134217984;
        id v24 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "disconnectWithReason: set failureReason to %lu", buf, 0xCu);
      }
      id v18 = objc_alloc((Class)CXEndCallAction);
      uint64_t v19 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
      id v20 = [v18 initWithCallUUID:v19];

      unsigned __int8 v21 = [(CSDProviderCall *)self providerCallDelegate];
      [v21 performCallAction:v20 forCall:self];
    }
  }
}

- (void)setProviderFailureReasonIfNecessary:(int64_t)a3
{
  id v5 = [(CSDProviderCall *)self failureContext];

  if (!v5)
  {
    id v6 = objc_alloc_init((Class)CXCallFailureContext);
    [(CSDProviderCall *)self setFailureContext:v6];
  }
  objc_super v7 = [(CSDProviderCall *)self failureContext];
  id v8 = [v7 providerEndedReason];

  if (!v8)
  {
    id v9 = [(CSDProviderCall *)self failureContext];
    [v9 setProviderEndedReason:a3];
  }
}

- (void)setIsSendingVideo:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CSDProviderCall *)self isVideo])
  {
    id v5 = objc_alloc((Class)CXSetSendingVideoCallAction);
    id v6 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
    id v8 = [v5 initWithCallUUID:v6 sendingVideo:v3];

    objc_super v7 = [(CSDProviderCall *)self providerCallDelegate];
    [v7 performCallAction:v8 forCall:self];
  }
}

- (void)setScreenShareAttributes:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "attributes: %@", buf, 0xCu);
  }

  id v6 = [(CSDProviderCall *)self cxScreenShareAttributesForCallAttributes:v4];
  id v7 = objc_alloc((Class)CXSetScreenShareAttributesCallAction);
  id v8 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
  id v9 = [v7 initWithCallUUID:v8 attributes:v6];

  objc_super v10 = [(CSDProviderCall *)self providerCallDelegate];
  [v10 performCallAction:v9 forCall:self];

  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_10005ECCC;
  unsigned int v15 = &unk_100504F10;
  id v16 = self;
  id v17 = v4;
  id v11 = v4;
  [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:&v12];
  [(CSDCall *)self propertiesChanged];
}

- (void)setSharingScreen:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSDProviderCall;
  -[CSDProviderCall setSharingScreen:](&v13, "setSharingScreen:");
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setSharingScreen: %d", buf, 8u);
  }

  id v6 = objc_alloc((Class)CXSetSharingScreenCallAction);
  id v7 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
  id v8 = [v6 initWithCallUUID:v7 sharingScreen:v3];

  id v9 = [(CSDProviderCall *)self providerCallDelegate];
  [v9 performCallAction:v8 forCall:self];

  self->_sharingScreen = v3;
  unsigned int v10 = +[AVCScreenCapture captureCapabilities];
  if (v3 && v10 == 1) {
    self->_sendingVideo = 0;
  }
  if (!v3)
  {
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Clearing _screenShareAttributes", buf, 2u);
    }

    screenShareAttributes = self->_screenShareAttributes;
    self->_screenShareAttributes = 0;
  }
  [(CSDCall *)self propertiesChanged];
}

- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)CSDProviderCall;
  [(CSDProviderCall *)&v24 setSharingScreen:v4];
  id v7 = objc_alloc((Class)CXSetSharingScreenCallAction);
  id v8 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
  id v9 = [v7 initWithCallUUID:v8 sharingScreen:v4];

  id v10 = objc_alloc_init((Class)CXScreenShareAttributes);
  objc_msgSend(v10, "setDeviceFamily:", objc_msgSend(v6, "deviceFamily"));
  objc_msgSend(v10, "setDeviceHomeButtonType:", objc_msgSend(v6, "deviceHomeButtonType"));
  objc_msgSend(v10, "setStyle:", objc_msgSend(v6, "style"));
  id v11 = [v6 displayID];
  [v10 setDisplayID:v11];

  id v12 = [v6 frameRate];
  [v10 setFrameRate:v12];

  objc_msgSend(v10, "setWindowed:", objc_msgSend(v6, "isWindowed"));
  objc_super v13 = [v6 windowUUID];
  [v10 setWindowUUID:v13];

  id v14 = [v6 displayScale];
  [v10 setDisplayScale:v14];

  BOOL v15 = [v6 cornerRadius];
  [v10 setCornerRadius:v15];

  id v16 = [v6 scaleFactor];
  [v10 setScaleFactor:v16];

  id v17 = [v6 systemRootLayerTransform];
  [v10 setSystemRootLayerTransform:v17];

  id v18 = [v6 originalResolution];
  id v19 = [v18 copy];
  [v10 setOriginalResolution:v19];

  [v9 setAttributes:v10];
  id v20 = [(CSDProviderCall *)self providerCallDelegate];
  [v20 performCallAction:v9 forCall:self];

  self->_sharingScreen = v4;
  screenShareAttributes = self->_screenShareAttributes;
  self->_screenShareAttributes = (TUCallScreenShareAttributes *)v6;
  id v22 = v6;

  unsigned int v23 = +[AVCScreenCapture captureCapabilities];
  if (v4 && v23 == 1) {
    self->_sendingVideo = 0;
  }
  [(CSDCall *)self propertiesChanged];
}

- (void)setUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSDProviderCall;
  -[CSDCall setUplinkMuted:](&v9, "setUplinkMuted:");
  if ([(CSDProviderCall *)self isUplinkMuted] != v3)
  {
    [(CSDProviderCall *)self setUnderlyingUplinkMuted:v3];
    if (([(CSDProviderCall *)self isPTT] & 1) == 0)
    {
      id v5 = objc_alloc((Class)CXSetMutedCallAction);
      id v6 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
      id v7 = [v5 initWithCallUUID:v6 muted:v3];

      id v8 = [(CSDProviderCall *)self providerCallDelegate];
      [v8 performCallAction:v7 forCall:self];
    }
    [(CSDCall *)self updateUplinkMuted:v3];
  }
}

- (void)setTtyType:(int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CSDProviderCall;
  -[CSDProviderCall setTtyType:](&v9, "setTtyType:");
  if ([(CSDProviderCall *)self ttyType] != a3)
  {
    id v5 = objc_alloc((Class)CXSetTTYTypeCallAction);
    id v6 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
    id v7 = [v5 initWithCallUUID:v6 ttyType:sub_1000BF22C(a3)];

    id v8 = [(CSDProviderCall *)self providerCallDelegate];
    [v8 performCallAction:v7 forCall:self];
  }
}

- (void)setUnderlyingUplinkMuted:(BOOL)a3
{
}

- (void)setUnderlyingUplinkMuted:(BOOL)a3 bottomUpMute:(BOOL)a4
{
  BOOL v5 = a3;
  id v7 = [(CSDProviderCall *)self provider];
  unsigned int v8 = [v7 isTinCanProvider];

  if (!a4)
  {
    if (v5)
    {
      objc_super v9 = [(CSDProviderCall *)self provider];
      unsigned int v10 = [v9 isTelephonyProvider];

      if ((v10 ^ 1 | v8)) {
        goto LABEL_7;
      }
    }
    else if (v8)
    {
      goto LABEL_7;
    }
    id v11 = [(CSDProviderCall *)self systemControllerSetUplinkMutedBlock];
    v11[2](v11, v5);
  }
LABEL_7:
  if (self->_underlyingUplinkMuted != v5)
  {
    self->_underlyingUplinkMuted = v5;
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v13 = [(CSDProviderCall *)self proxyAVAudioSession];
      *(_DWORD *)buf = 67109378;
      BOOL v19 = v5;
      __int16 v20 = 2112;
      unsigned __int8 v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AVAudioSession muteSessionInput: %d for %@", buf, 0x12u);
    }
    id v14 = [(CSDProviderCall *)self proxyAVAudioSession];
    id v17 = 0;
    [v14 muteSessionInput:v5 error:&v17];
    id v15 = v17;

    if (v15)
    {
      id v16 = sub_100008DCC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1003A84CC();
      }
    }
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setDownlinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[TUAudioSystemController sharedAudioSystemController];
  [v4 setDownlinkMuted:v3];
}

- (void)sendHardPauseDigits
{
  BOOL v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CSDProviderCall *)self pauseDigitsQueue];
    int v9 = 138412546;
    unsigned int v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "for call: %@ pauseDigitsQueue: %@", (uint8_t *)&v9, 0x16u);
  }
  BOOL v5 = [(CSDProviderCall *)self pauseDigitsQueue];
  id v6 = [v5 nextPauseDigits];

  if (!v6)
  {
    id v7 = sub_100008DCC();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v9) = 0;
    unsigned int v8 = "[WARN] No next pause digits exist";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 2u);
    goto LABEL_11;
  }
  if (![v6 isHardPause])
  {
    id v7 = sub_100008DCC();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v9) = 0;
    unsigned int v8 = "[WARN] Next pause digits are not hard pause";
    goto LABEL_10;
  }
  id v7 = [v6 digits];
  [(CSDProviderCall *)self _sendDTMFDigits:v7 type:3];
LABEL_11:
}

- (void)playRemoteDTMFToneForKey:(unsigned __int8)a3
{
  int v3 = a3;
  BOOL v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    unsigned int v10 = self;
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "for call: %@ key: %d", (uint8_t *)&v9, 0x12u);
  }

  id v6 = [(CSDProviderCall *)self pauseDigitsQueue];
  id v7 = [v6 dequeueAllPauseDigits];

  LOWORD(v9) = v3;
  unsigned int v8 = +[NSString stringWithCharacters:&v9 length:1];
  [(CSDProviderCall *)self _sendDTMFDigits:v8 type:1];
}

- (void)setRemoteVideoPresentationSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16.double width = width;
    v16.double height = height;
    id v7 = NSStringFromSize(v16);
    int v12 = 138412546;
    objc_super v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "for call: %@ remoteVideoPresentationSize: %@", (uint8_t *)&v12, 0x16u);
  }
  id v8 = objc_alloc((Class)CXSetVideoPresentationSizeCallAction);
  int v9 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
  id v10 = objc_msgSend(v8, "initWithCallUUID:videoPresentationSize:", v9, width, height);

  __int16 v11 = [(CSDProviderCall *)self providerCallDelegate];
  [v11 performCallAction:v10 forCall:self];
}

- (void)setRemoteVideoPresentationState:(int)a3
{
  BOOL v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    int v12 = self;
    __int16 v13 = 1024;
    int v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "for call: %@ remoteVideoPresentationState: %d", (uint8_t *)&v11, 0x12u);
  }

  if (a3 == 2) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = a3 == 1;
  }
  id v7 = objc_alloc((Class)CXSetVideoPresentationStateCallAction);
  id v8 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
  id v9 = [v7 initWithCallUUID:v8 videoPresentationState:v6];

  id v10 = [(CSDProviderCall *)self providerCallDelegate];
  [v10 performCallAction:v9 forCall:self];
}

- (void)dequeueNextPauseDigits
{
  int v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dequeueing next pause digits", v6, 2u);
  }

  id v4 = [(CSDProviderCall *)self pauseDigitsQueue];
  id v5 = [v4 dequeueNextPauseDigits];

  [(CSDProviderCall *)self _sendSoftPauseDigitsIfNecessary];
}

- (void)donateHandles:(id)a3
{
  id v3 = a3;
  id v6 = +[CSDFaceTimeMultiwayIDSService sharedInstance];
  id v4 = [v3 allObjects];

  id v5 = +[NSDate date];
  [v6 addFirewallEntriesForHandles:v4 lastSeenDate:v5];
}

- (id)cxScreenShareAttributesForCallAttributes:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)CXScreenShareAttributes);
  objc_msgSend(v4, "setDeviceFamily:", objc_msgSend(v3, "deviceFamily"));
  objc_msgSend(v4, "setDeviceHomeButtonType:", objc_msgSend(v3, "deviceHomeButtonType"));
  objc_msgSend(v4, "setStyle:", objc_msgSend(v3, "style"));
  id v5 = [v3 displayID];
  [v4 setDisplayID:v5];

  id v6 = [v3 frameRate];
  [v4 setFrameRate:v6];

  objc_msgSend(v4, "setWindowed:", objc_msgSend(v3, "isWindowed"));
  id v7 = [v3 windowUUID];
  [v4 setWindowUUID:v7];

  id v8 = [v3 displayScale];
  [v4 setDisplayScale:v8];

  id v9 = [v3 cornerRadius];
  [v4 setCornerRadius:v9];

  id v10 = [v3 scaleFactor];
  [v4 setScaleFactor:v10];

  int v11 = [v3 systemRootLayerTransform];
  [v4 setSystemRootLayerTransform:v11];

  int v12 = [v3 originalResolution];

  id v13 = [v12 copy];
  [v4 setOriginalResolution:v13];

  return v4;
}

- (id)tuScreenShareAttributesForScreenAttributes:(id)a3
{
  if (self->_screenShareAttributes)
  {
    id v4 = a3;
    id v5 = [v4 windowUUID];

    [(TUCallScreenShareAttributes *)self->_screenShareAttributes setWindowUUID:v5];
    id v6 = self->_screenShareAttributes;
  }
  else
  {
    id v7 = a3;
    id v6 = (TUCallScreenShareAttributes *)objc_alloc_init((Class)TUCallScreenShareAttributes);
    -[TUCallScreenShareAttributes setDeviceFamily:](v6, "setDeviceFamily:", [v7 deviceFamily]);
    -[TUCallScreenShareAttributes setDeviceHomeButtonType:](v6, "setDeviceHomeButtonType:", [v7 deviceHomeButtonType]);
    -[TUCallScreenShareAttributes setStyle:](v6, "setStyle:", [v7 style]);
    id v8 = [v7 displayID];
    [(TUCallScreenShareAttributes *)v6 setDisplayID:v8];

    id v9 = [v7 frameRate];
    [(TUCallScreenShareAttributes *)v6 setFrameRate:v9];

    -[TUCallScreenShareAttributes setWindowed:](v6, "setWindowed:", [v7 isWindowed]);
    id v10 = [v7 windowUUID];
    [(TUCallScreenShareAttributes *)v6 setWindowUUID:v10];

    int v11 = [v7 displayScale];
    [(TUCallScreenShareAttributes *)v6 setDisplayScale:v11];

    int v12 = [v7 scaleFactor];
    [(TUCallScreenShareAttributes *)v6 setScaleFactor:v12];

    id v13 = [v7 systemRootLayerTransform];
    [(TUCallScreenShareAttributes *)v6 setSystemRootLayerTransform:v13];

    int v14 = [v7 originalResolution];

    id v15 = [v14 copy];
    [(TUCallScreenShareAttributes *)v6 setOriginalResolution:v15];
  }

  return v6;
}

- (void)_sendDTMFDigits:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2048;
    int64_t v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending DTMF digits: %@ type: %ld", (uint8_t *)&v12, 0x16u);
  }

  id v8 = objc_alloc((Class)CXPlayDTMFCallAction);
  id v9 = [(CSDProviderCall *)self uniqueProxyIdentifierUUID];
  id v10 = [v8 initWithCallUUID:v9 digits:v6 type:a4];

  int v11 = [(CSDProviderCall *)self providerCallDelegate];
  [v11 performCallAction:v10 forCall:self];
}

- (void)_sendSoftPauseDigitsIfNecessary
{
  id v3 = [(CSDProviderCall *)self pauseDigitsQueue];
  id v4 = [v3 nextPauseDigits];

  if ([(CSDProviderCall *)self isConnected]
    && v4
    && ([v4 isHardPause] & 1) == 0)
  {
    id v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 digits];
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found queued soft pause digits: %@", (uint8_t *)&v8, 0xCu);
    }
    id v7 = [v4 digits];
    [(CSDProviderCall *)self _sendDTMFDigits:v7 type:2];
  }
}

- (int64_t)_switchToCXCallFailureReasonFromTUCallDisconnectedReason:(int)a3
{
  if a3 < 0x34 && ((0xA33EA7DCD0001uLL >> a3))
  {
    int64_t v5 = qword_10048D7A8[a3];
  }
  else
  {
    id v4 = sub_100008DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Set failure reason CXCallFailureReasonGenericError, disconnect reason: %ld", (uint8_t *)&v8, 0xCu);
    }

    int64_t v5 = 0;
  }
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    uint64_t v9 = a3;
    __int16 v10 = 2048;
    int64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "disconnect reason: %ld, failureReason: %ld", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (void)pauseDigitsQueueChanged:(id)a3
{
  id v4 = a3;
  int64_t v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "for pauseDigitsQueue: %@", (uint8_t *)&v6, 0xCu);
  }

  [(CSDCall *)self propertiesChanged];
}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSDProviderCall;
  id v4 = a3;
  [(CSDCall *)&v6 handleAudioSessionActivationStateChangedTo:v4];
  int64_t v5 = [(CSDProviderCall *)self backingCallSource];
  [v5 handleAudioSessionActivationStateChangedTo:v4];
}

- (id)activeRemoteParticipantForCallUpdate:(id)a3
{
  id v4 = [a3 activeRemoteParticipant];
  int64_t v5 = [v4 name];
  if ([v5 length])
  {
    objc_super v6 = [v4 sandboxExtendedImageURL];
    if (v6)
    {
      id v7 = [(CSDProviderCall *)self imageURLForCXSandboxExtendedURL:v6];
    }
    else
    {
      id v7 = 0;
    }
    id v8 = [objc_alloc((Class)TUMutableParticipant) initWithName:v5];
    [v8 setImageURL:v7];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v8 copy];

  return v9;
}

- (id)imageURLForCXSandboxExtendedURL:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    objc_super v6 = 0;
    goto LABEL_36;
  }
  if (objc_msgSend(v3, "csd_isSymbolicLink"))
  {
    int64_t v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v26 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Symbolic link found for URL %@", buf, 0xCu);
    }
    objc_super v6 = 0;
    goto LABEL_35;
  }
  id v7 = [v4 URL];
  id v8 = [v7 lastPathComponent];
  if (![v8 length])
  {
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v26 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Could not determine source file for URL %@", buf, 0xCu);
    }

    int v12 = 0;
    int64_t v5 = 0;
    objc_super v6 = 0;
    goto LABEL_34;
  }
  id v9 = [v7 relativePath];
  unsigned int v10 = [v9 isEqualToString:@"/stock"];

  if (v10)
  {
    int64_t v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Not copying generic image", buf, 2u);
    }

    objc_super v6 = [objc_alloc((Class)NSURL) initFileURLWithPath:@"/stock"];
    int v12 = 0;
    int64_t v5 = 0;
    goto LABEL_34;
  }
  id v14 = v8;
  if ([v14 length])
  {
    id v24 = 0;
    int64_t v15 = [[CSDSandboxExtensionDirectory alloc] initWithName:@"Images" error:&v24];
    id v16 = v24;
    int v12 = v16;
    if (v15)
    {
      id v23 = v16;
      id v17 = [(CSDSandboxExtensionDirectory *)v15 createLinkIfNecessaryWithFilename:v14 toURL:v7 error:&v23];
      id v18 = v23;

      if (!v17)
      {
        BOOL v19 = sub_100008DCC();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          int64_t v26 = v7;
          __int16 v27 = 2112;
          id v28 = v14;
          __int16 v29 = 2112;
          id v30 = v18;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Copying URL '%@' to filename '%@'failed with error %@", buf, 0x20u);
        }
      }
      if ((uint64_t)[v4 sandboxExtensionHandle] >= 1)
      {
        __int16 v20 = sub_100008DCC();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Releasing sandbox extension handle", buf, 2u);
        }

        sandbox_extension_release();
      }
      int64_t v5 = v17;
      int v12 = v18;
      goto LABEL_33;
    }
    unsigned __int8 v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1003A8540();
    }
  }
  else
  {
    sub_100008DCC();
    int64_t v15 = (CSDSandboxExtensionDirectory *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v26 = v4;
      _os_log_impl((void *)&_mh_execute_header, &v15->super, OS_LOG_TYPE_DEFAULT, "[WARN] Could not determine destination file for URL %@", buf, 0xCu);
    }
    int v12 = 0;
  }
  int64_t v5 = 0;
LABEL_33:

  objc_super v6 = v5;
LABEL_34:

LABEL_35:
LABEL_36:

  return v6;
}

- (BOOL)isReRing
{
  v2 = [(CSDProviderCall *)self mergedCallUpdate];
  unsigned __int8 v3 = [v2 isReRing];

  return v3;
}

- (TUParticipant)activeRemoteParticipant
{
  return self->_activeRemoteParticipant;
}

- (void)setActiveRemoteParticipant:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BOOL)isOutgoing
{
  return self->_outgoing;
}

- (BOOL)wantsStagingArea
{
  return self->_wantsStagingArea;
}

- (void)setWantsStagingArea:(BOOL)a3
{
  self->_wantsStagingArea = a3;
}

- (void)setConversation:(BOOL)a3
{
  self->_conversation = a3;
}

- (BOOL)isSharingScreen
{
  return self->_sharingScreen;
}

- (id)screenShareAttributes
{
  return self->_screenShareAttributes;
}

- (id)tokens
{
  return self->_tokens;
}

- (BOOL)isExpanseProvider
{
  return self->_expanseProvider;
}

- (int)originatingUIType
{
  return self->_originatingUIType;
}

- (BOOL)mediaPlaybackOnExternalDevice
{
  return self->_mediaPlaybackOnExternalDevice;
}

- (NSDictionary)silencingUserInfo
{
  return self->_silencingUserInfo;
}

- (void)setSilencingUserInfo:(id)a3
{
}

- (BOOL)isUnderlyingUplinkMuted
{
  return self->_underlyingUplinkMuted;
}

- (BOOL)prefersToPlayDuringWombat
{
  return self->_prefersToPlayDuringWombat;
}

- (void)setCallCenter:(id)a3
{
}

- (BOOL)isInjectingAudio
{
  return self->_injectingAudio;
}

- (id)localMemberHandleValue
{
  return self->_localMemberHandleValue;
}

- (unint64_t)screenSharingType
{
  return self->_screenSharingType;
}

- (void)setScreenSharingType:(unint64_t)a3
{
  self->_screenSharingType = a3;
}

- (BOOL)isUnderlyingLinksConnected
{
  return self->_isUnderlyingLinksConnected;
}

- (void)setIsUnderlyingLinksConnected:(BOOL)a3
{
  self->_isUnderlyingLinksConnected = a3;
}

- (CSDProviderCallDelegate)providerCallDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerCallDelegate);

  return (CSDProviderCallDelegate *)WeakRetained;
}

- (void)setProviderCallDelegate:(id)a3
{
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (CXCallSource)backingCallSource
{
  return self->_backingCallSource;
}

- (void)setBackingCallSource:(id)a3
{
}

- (CXAbstractProviderSource)providerSource
{
  return self->_providerSource;
}

- (BOOL)isHeld
{
  return self->_held;
}

- (int64_t)endedReason
{
  return self->_endedReason;
}

- (void)setEndedReason:(int64_t)a3
{
  self->_endedReason = a3;
}

- (BOOL)sendingVideo
{
  return self->_sendingVideo;
}

- (BOOL)shouldAcceptDateConnectedProviderUpdates
{
  return self->_shouldAcceptDateConnectedProviderUpdates;
}

- (void)setShouldAcceptDateConnectedProviderUpdates:(BOOL)a3
{
  self->_shouldAcceptDateConnectedProviderUpdates = a3;
}

- (CXCallFailureContext)failureContext
{
  return self->_failureContext;
}

- (CSDProviderDisplayMonitor)providerDisplayMonitor
{
  return self->_providerDisplayMonitor;
}

- (void)setUsesSystemMutingBlock:(id)a3
{
}

- (void)setSystemControllerUplinkMutedBlock:(id)a3
{
}

- (void)setSystemControllerSetUplinkMutedBlock:(id)a3
{
}

- (id)dialDelayForRequest
{
  return self->_dialDelayForRequest;
}

- (void)setDialDelayForRequest:(id)a3
{
}

- (id)isCallRecordingEnabled
{
  return self->_isCallRecordingEnabled;
}

- (void)setIsCallRecordingEnabled:(id)a3
{
}

- (CXCallUpdate)mergedCallUpdate
{
  return self->_mergedCallUpdate;
}

- (void)setMergedCallUpdate:(id)a3
{
}

- (CSDPauseDigitsQueue)pauseDigitsQueue
{
  return self->_pauseDigitsQueue;
}

- (void)setPauseDigitsQueue:(id)a3
{
}

- (TUUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (void)setDefaultNotificationCenter:(id)a3
{
}

- (TUDynamicCallDisplayContext)dynamicDisplayContext
{
  return self->_dynamicDisplayContext;
}

- (void)setDynamicDisplayContext:(id)a3
{
}

- (id)startCallBlock
{
  return self->_startCallBlock;
}

- (void)setStartCallBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startCallBlock, 0);
  objc_storeStrong((id *)&self->_dynamicDisplayContext, 0);
  objc_storeStrong((id *)&self->_defaultNotificationCenter, 0);
  objc_storeStrong((id *)&self->_userConfiguration, 0);
  objc_storeStrong((id *)&self->_pauseDigitsQueue, 0);
  objc_storeStrong((id *)&self->_mergedCallUpdate, 0);
  objc_storeStrong(&self->_isCallRecordingEnabled, 0);
  objc_storeStrong(&self->_dialDelayForRequest, 0);
  objc_storeStrong(&self->_systemControllerSetUplinkMutedBlock, 0);
  objc_storeStrong(&self->_systemControllerUplinkMutedBlock, 0);
  objc_storeStrong(&self->_usesSystemMutingBlock, 0);
  objc_storeStrong((id *)&self->_providerDisplayMonitor, 0);
  objc_storeStrong((id *)&self->_failureContext, 0);
  objc_storeStrong((id *)&self->_providerSource, 0);
  objc_storeStrong((id *)&self->_backingCallSource, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_destroyWeak((id *)&self->_providerCallDelegate);
  objc_storeStrong((id *)&self->_localMemberHandleValue, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_silencingUserInfo, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_screenShareAttributes, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);

  objc_storeStrong((id *)&self->_activeRemoteParticipant, 0);
}

@end