@interface TUProxyCall
+ (BOOL)supportsSecureCoding;
+ (id)proxyCallWithCall:(id)a3;
- (BOOL)accessoryButtonEventsEnabled;
- (BOOL)hasEmergencyVideoStream;
- (BOOL)isBlocked;
- (BOOL)isConversation;
- (BOOL)isDomestic;
- (BOOL)isDownlinkMuted;
- (BOOL)isEmergency;
- (BOOL)isFailureExpected;
- (BOOL)isHostedOnCurrentDevice;
- (BOOL)isInternational;
- (BOOL)isMediaStalled;
- (BOOL)isMutuallyExclusiveCall;
- (BOOL)isOutgoing;
- (BOOL)isPTT;
- (BOOL)isReRing;
- (BOOL)isReceivingTransmission;
- (BOOL)isRemoteUplinkMuted;
- (BOOL)isSOS;
- (BOOL)isSendingAudio;
- (BOOL)isSendingTransmission;
- (BOOL)isSendingVideo;
- (BOOL)isSharingScreen;
- (BOOL)isThirdPartyVideo;
- (BOOL)isUplinkMuted;
- (BOOL)isUsingBaseband;
- (BOOL)isVideo;
- (BOOL)isVideoDegraded;
- (BOOL)isVideoMirrored;
- (BOOL)isVideoPaused;
- (BOOL)isVoicemail;
- (BOOL)mixesVoiceWithMedia;
- (BOOL)needsManualInCallSounds;
- (BOOL)prefersExclusiveAccessToCellularNetwork;
- (BOOL)requiresRemoteVideo;
- (BOOL)shouldSuppressInCallUI;
- (BOOL)supportsEmergencyFallback;
- (BOOL)supportsScreening;
- (BOOL)supportsTTYWithVoice;
- (BOOL)wantsStagingArea;
- (CGRect)remoteVideoContentRect;
- (CGSize)localAspectRatioForOrientation:(int64_t)a3;
- (CGSize)remoteAspectRatio;
- (CGSize)remoteScreenAspectRatio;
- (CGSize)remoteScreenLandscapeAspectRatio;
- (CGSize)remoteScreenPortraitAspectRatio;
- (NSData)localFrequency;
- (NSData)remoteFrequency;
- (NSDictionary)endedReasonUserInfo;
- (NSDictionary)providerContext;
- (NSMutableDictionary)localVideoModeToLayer;
- (NSMutableDictionary)remoteVideoModeToLayer;
- (NSSet)emergencyMediaItems;
- (NSSet)remoteParticipantHandles;
- (NSString)announceProviderIdentifier;
- (NSString)audioCategory;
- (NSString)audioMode;
- (NSString)callUUID;
- (NSString)callerNameFromNetwork;
- (NSString)endedErrorString;
- (NSString)endedReasonString;
- (NSString)isoCountryCode;
- (NSUUID)callGroupUUID;
- (NSUUID)localSenderIdentityAccountUUID;
- (NSUUID)localSenderIdentityUUID;
- (TUCallDisplayContext)displayContext;
- (TUCallProvider)provider;
- (TUCallServicesProxyCallActions)proxyCallActionsDelegate;
- (TUHandle)handle;
- (TUHandle)initiator;
- (TUParticipant)activeRemoteParticipant;
- (TUProxyCall)initWithCoder:(id)a3;
- (TUProxyCall)initWithUniqueProxyIdentifier:(id)a3 endpointOnCurrentDevice:(BOOL)a4;
- (TURemoteVideoClient)localVideo;
- (TURemoteVideoClient)remoteVideo;
- (float)localMeterLevel;
- (float)remoteMeterLevel;
- (id)channelImageURL;
- (id)localMemberHandleValue;
- (id)screenShareAttributes;
- (id)tokens;
- (int)avcRemoteVideoModeForMode:(int64_t)a3;
- (int)callRelaySupport;
- (int)callStatus;
- (int)originatingUIType;
- (int)recordingAvailability;
- (int)ttyType;
- (int64_t)_cameraTypeForVideoAttributeCamera:(int)a3;
- (int64_t)_orientationForVideoAttributesOrientation:(int)a3;
- (int64_t)bluetoothAudioFormat;
- (int64_t)cameraType;
- (int64_t)inputAudioPowerSpectrumToken;
- (int64_t)outputAudioPowerSpectrumToken;
- (int64_t)remoteCameraOrientation;
- (int64_t)remoteScreenOrientation;
- (int64_t)screenSharingIntention;
- (int64_t)serviceStatus;
- (int64_t)transmissionMode;
- (int64_t)videoStreamToken;
- (unint64_t)screenSharingType;
- (void)_createLocalVideoIfNecessary;
- (void)_createRemoteVideoIfNecessary;
- (void)_synchronizeLocalVideo;
- (void)_synchronizeRemoteVideo;
- (void)_updateVideoCallAttributes:(id)a3;
- (void)_updateVideoStreamToken:(int64_t)a3;
- (void)addScreenSharingType:(unint64_t)a3;
- (void)answerWithRequest:(id)a3;
- (void)disconnectWithReason:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)playDTMFToneForKey:(unsigned __int8)a3;
- (void)remoteVideoClient:(id)a3 remoteMediaDidStall:(BOOL)a4;
- (void)remoteVideoClient:(id)a3 remoteScreenAttributesDidChange:(id)a4;
- (void)remoteVideoClient:(id)a3 remoteVideoAttributesDidChange:(id)a4;
- (void)remoteVideoClient:(id)a3 remoteVideoDidPause:(BOOL)a4;
- (void)remoteVideoClient:(id)a3 videoDidDegrade:(BOOL)a4;
- (void)sendHardPauseDigits;
- (void)setAccessoryButtonEventsEnabled:(BOOL)a3;
- (void)setActiveRemoteParticipant:(id)a3;
- (void)setAnnounceProviderIdentifier:(id)a3;
- (void)setAudioCategory:(id)a3;
- (void)setAudioMode:(id)a3;
- (void)setBlocked:(BOOL)a3;
- (void)setBluetoothAudioFormat:(int64_t)a3;
- (void)setCallDisconnectedDueToComponentCrash;
- (void)setCallGroupUUID:(id)a3;
- (void)setCallRelaySupport:(int)a3;
- (void)setCallStatus:(int)a3;
- (void)setCallUUID:(id)a3;
- (void)setCallerNameFromNetwork:(id)a3;
- (void)setCameraType:(int64_t)a3;
- (void)setChannelImageURL:(id)a3;
- (void)setConversation:(BOOL)a3;
- (void)setDisconnectedReason:(int)a3;
- (void)setDisplayContext:(id)a3;
- (void)setDomestic:(BOOL)a3;
- (void)setDownlinkMuted:(BOOL)a3;
- (void)setEmergency:(BOOL)a3;
- (void)setEmergencyMediaItems:(id)a3;
- (void)setEndedErrorString:(id)a3;
- (void)setEndedReasonString:(id)a3;
- (void)setEndedReasonUserInfo:(id)a3;
- (void)setEndpointOnCurrentDevice:(BOOL)a3;
- (void)setFailureExpected:(BOOL)a3;
- (void)setHandle:(id)a3;
- (void)setHasEmergencyVideoStream:(BOOL)a3;
- (void)setHostedOnCurrentDevice:(BOOL)a3;
- (void)setInitiator:(id)a3;
- (void)setInputAudioPowerSpectrumToken:(int64_t)a3;
- (void)setInternational:(BOOL)a3;
- (void)setIsSendingAudio:(BOOL)a3;
- (void)setIsSendingVideo:(BOOL)a3;
- (void)setIsVideo:(BOOL)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setLocalFrequency:(id)a3;
- (void)setLocalMeterLevel:(float)a3;
- (void)setLocalSenderIdentityAccountUUID:(id)a3;
- (void)setLocalSenderIdentityUUID:(id)a3;
- (void)setLocalVideo:(id)a3;
- (void)setLocalVideoLayer:(id)a3 forMode:(int64_t)a4;
- (void)setLocalVideoModeToLayer:(id)a3;
- (void)setMediaStalled:(BOOL)a3;
- (void)setMixesVoiceWithMedia:(BOOL)a3;
- (void)setMutuallyExclusiveCall:(BOOL)a3;
- (void)setNeedsManualInCallSounds:(BOOL)a3;
- (void)setOriginatingUIType:(int)a3;
- (void)setOutgoing:(BOOL)a3;
- (void)setOutputAudioPowerSpectrumToken:(int64_t)a3;
- (void)setPrefersExclusiveAccessToCellularNetwork:(BOOL)a3;
- (void)setProvider:(id)a3;
- (void)setProviderContext:(id)a3;
- (void)setProxyCallActionsDelegate:(id)a3;
- (void)setReceivingTransmission:(BOOL)a3;
- (void)setRemoteAspectRatio:(CGSize)a3;
- (void)setRemoteCameraOrientation:(int64_t)a3;
- (void)setRemoteFrequency:(id)a3;
- (void)setRemoteMeterLevel:(float)a3;
- (void)setRemoteParticipantHandles:(id)a3;
- (void)setRemoteScreenLandscapeAspectRatio:(CGSize)a3;
- (void)setRemoteScreenOrientation:(int64_t)a3;
- (void)setRemoteScreenPortraitAspectRatio:(CGSize)a3;
- (void)setRemoteUplinkMuted:(BOOL)a3;
- (void)setRemoteVideo:(id)a3;
- (void)setRemoteVideoContentRect:(CGRect)a3;
- (void)setRemoteVideoLayer:(id)a3 forMode:(int64_t)a4;
- (void)setRemoteVideoModeToLayer:(id)a3;
- (void)setRemoteVideoPresentationSize:(CGSize)a3;
- (void)setRemoteVideoPresentationState:(int)a3;
- (void)setRequiresRemoteVideo:(BOOL)a3;
- (void)setSOS:(BOOL)a3;
- (void)setScreenShareAttributes:(id)a3;
- (void)setScreenSharingIntention:(int64_t)a3;
- (void)setScreenSharingType:(unint64_t)a3;
- (void)setScreening:(BOOL)a3;
- (void)setSendingTransmission:(BOOL)a3;
- (void)setServiceStatus:(int64_t)a3;
- (void)setSharingScreen:(BOOL)a3;
- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4;
- (void)setShouldSuppressInCallUI:(BOOL)a3;
- (void)setShouldSuppressRingtone:(BOOL)a3;
- (void)setSupportsEmergencyFallback:(BOOL)a3;
- (void)setSupportsTTYWithVoice:(BOOL)a3;
- (void)setThirdPartyVideo:(BOOL)a3;
- (void)setTransitionStatus:(int)a3;
- (void)setTransmissionMode:(int64_t)a3;
- (void)setTtyType:(int)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setUsingBaseband:(BOOL)a3;
- (void)setVideoDegraded:(BOOL)a3;
- (void)setVideoMirrored:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)setVideoStreamToken:(int64_t)a3;
- (void)setVoicemail:(BOOL)a3;
- (void)setWantsHoldMusic:(BOOL)a3;
- (void)setWantsStagingArea:(BOOL)a3;
- (void)updateProxyCallWithDaemon;
- (void)updateWithCall:(id)a3;
@end

@implementation TUProxyCall

- (TUProxyCall)initWithUniqueProxyIdentifier:(id)a3 endpointOnCurrentDevice:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TUProxyCall;
  result = [(TUCall *)&v5 initWithUniqueProxyIdentifier:a3 endpointOnCurrentDevice:a4];
  if (result) {
    result->_remoteScreenOrientation = 1;
  }
  return result;
}

+ (id)proxyCallWithCall:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithCall:v4];

  return v5;
}

- (void)updateWithCall:(id)a3
{
  v74.receiver = self;
  v74.super_class = (Class)TUProxyCall;
  id v4 = a3;
  [(TUCall *)&v74 updateWithCall:v4];
  objc_super v5 = objc_msgSend(v4, "activeRemoteParticipant", v74.receiver, v74.super_class);
  v6 = (TUParticipant *)[v5 copy];
  activeRemoteParticipant = self->_activeRemoteParticipant;
  self->_activeRemoteParticipant = v6;

  v8 = [v4 announceProviderIdentifier];
  v9 = (NSString *)[v8 copy];
  announceProviderIdentifier = self->_announceProviderIdentifier;
  self->_announceProviderIdentifier = v9;

  v11 = [v4 handle];
  handle = self->_handle;
  self->_handle = v11;

  v13 = [v4 isoCountryCode];
  v14 = (NSString *)[v13 copy];
  isoCountryCode = self->_isoCountryCode;
  self->_isoCountryCode = v14;

  v16 = [v4 provider];
  v17 = [v16 base];
  provider = self->_provider;
  self->_provider = v17;

  v19 = [v4 initiator];
  initiator = self->_initiator;
  self->_initiator = v19;

  self->_callStatus = [v4 callStatus];
  v21 = [v4 callerNameFromNetwork];
  v22 = (NSString *)[v21 copy];
  callerNameFromNetwork = self->_callerNameFromNetwork;
  self->_callerNameFromNetwork = v22;

  self->_outgoing = [v4 isOutgoing];
  self->_voicemail = [v4 isVoicemail];
  self->_hostedOnCurrentDevice = [v4 isHostedOnCurrentDevice];
  v24 = [v4 callUUID];
  v25 = (NSString *)[v24 copy];
  callUUID = self->_callUUID;
  self->_callUUID = v25;

  self->_isVideo = [v4 isVideo];
  self->_thirdPartyVideo = [v4 isThirdPartyVideo];
  self->_isSendingAudio = [v4 isSendingAudio];
  self->_isSendingVideo = [v4 isSendingVideo];
  self->_blocked = [v4 isBlocked];
  self->_emergency = [v4 isEmergency];
  self->_hasEmergencyVideoStream = [v4 hasEmergencyVideoStream];
  v27 = [v4 emergencyMediaItems];
  v28 = (NSSet *)[v27 copy];
  emergencyMediaItems = self->_emergencyMediaItems;
  self->_emergencyMediaItems = v28;

  self->_failureExpected = [v4 isFailureExpected];
  self->_international = [v4 isInternational];
  self->_domestic = [v4 isDomestic];
  self->_sos = [v4 isSOS];
  self->_supportsEmergencyFallback = [v4 supportsEmergencyFallback];
  self->_usingBaseband = [v4 isUsingBaseband];
  self->_ttyType = [v4 ttyType];
  self->_bluetoothAudioFormat = [v4 bluetoothAudioFormat];
  self->_mixesVoiceWithMedia = [v4 mixesVoiceWithMedia];
  self->_supportsTTYWithVoice = [v4 supportsTTYWithVoice];
  v30 = [v4 audioCategory];
  audioCategory = self->_audioCategory;
  self->_audioCategory = v30;

  v32 = [v4 audioMode];
  audioMode = self->_audioMode;
  self->_audioMode = v32;

  self->_needsManualInCallSounds = [v4 needsManualInCallSounds];
  v34 = [v4 endedReasonUserInfo];
  v35 = (NSDictionary *)[v34 copy];
  endedReasonUserInfo = self->_endedReasonUserInfo;
  self->_endedReasonUserInfo = v35;

  v37 = [v4 endedErrorString];
  v38 = (NSString *)[v37 copy];
  endedErrorString = self->_endedErrorString;
  self->_endedErrorString = v38;

  v40 = [v4 endedReasonString];
  v41 = (NSString *)[v40 copy];
  endedReasonString = self->_endedReasonString;
  self->_endedReasonString = v41;

  self->_uplinkMuted = [v4 isUplinkMuted];
  self->_downlinkMuted = [v4 isDownlinkMuted];
  self->_callRelaySupport = [v4 callRelaySupport];
  v43 = [v4 localFrequency];
  localFrequency = self->_localFrequency;
  self->_localFrequency = v43;

  v45 = [v4 remoteFrequency];
  remoteFrequency = self->_remoteFrequency;
  self->_remoteFrequency = v45;

  [v4 localMeterLevel];
  self->_localMeterLevel = v47;
  [v4 remoteMeterLevel];
  self->_remoteMeterLevel = v48;
  v49 = [v4 callGroupUUID];
  callGroupUUID = self->_callGroupUUID;
  self->_callGroupUUID = v49;

  v51 = [v4 providerContext];
  v52 = (NSDictionary *)[v51 copy];
  providerContext = self->_providerContext;
  self->_providerContext = v52;

  v54 = [v4 displayContext];
  v55 = (TUCallDisplayContext *)[v54 copy];
  displayContext = self->_displayContext;
  self->_displayContext = v55;

  v57 = [v4 remoteParticipantHandles];
  v58 = (NSSet *)[v57 copy];
  remoteParticipantHandles = self->_remoteParticipantHandles;
  self->_remoteParticipantHandles = v58;

  self->_remoteUplinkMuted = [v4 isRemoteUplinkMuted];
  v60 = [v4 localSenderIdentityUUID];
  localSenderIdentityUUID = self->_localSenderIdentityUUID;
  self->_localSenderIdentityUUID = v60;

  v62 = [v4 localSenderIdentityAccountUUID];
  localSenderIdentityAccountUUID = self->_localSenderIdentityAccountUUID;
  self->_localSenderIdentityAccountUUID = v62;

  self->_shouldSuppressInCallUI = [v4 shouldSuppressInCallUI];
  self->_mutuallyExclusiveCall = [v4 isMutuallyExclusiveCall];
  self->_wantsStagingArea = [v4 wantsStagingArea];
  self->_inputAudioPowerSpectrumToken = [v4 inputAudioPowerSpectrumToken];
  self->_outputAudioPowerSpectrumToken = [v4 outputAudioPowerSpectrumToken];
  self->_isReRing = [v4 isReRing];
  self->_originatingUIType = [v4 originatingUIType];
  self->_sharingScreen = [v4 isSharingScreen];
  self->_conversation = [v4 isConversation];
  v64 = [v4 screenShareAttributes];
  screenShareAttributes = self->_screenShareAttributes;
  self->_screenShareAttributes = v64;

  v66 = [v4 tokens];
  tokens = self->_tokens;
  self->_tokens = v66;

  v68 = [v4 localMemberHandleValue];
  localMemberHandleValue = self->_localMemberHandleValue;
  self->_localMemberHandleValue = v68;

  self->_serviceStatus = [v4 serviceStatus];
  self->_transmissionMode = [v4 transmissionMode];
  self->_accessoryButtonEventsEnabled = [v4 accessoryButtonEventsEnabled];
  self->_receivingTransmission = [v4 isReceivingTransmission];
  self->_sendingTransmission = [v4 isSendingTransmission];
  self->_ptt = [v4 isPTT];
  v70 = [v4 channelImageURL];
  channelImageURL = self->_channelImageURL;
  self->_channelImageURL = v70;

  self->_recordingAvailability = [v4 recordingAvailability];
  self->_supportsScreening = [v4 supportsScreening];
  self->_screenSharingIntention = [v4 screenSharingIntention];
  self->_screenSharingType = [v4 screenSharingType];
  v72 = [v4 videoCallAttributes];
  [(TUProxyCall *)self _updateVideoCallAttributes:v72];

  uint64_t v73 = [v4 videoStreamToken];
  [(TUProxyCall *)self _updateVideoStreamToken:v73];
}

- (void)disconnectWithReason:(int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)TUProxyCall;
  -[TUCall disconnectWithReason:](&v8, sel_disconnectWithReason_);
  objc_super v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v10 = a3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "disconnectWithReason: reason: %d", buf, 8u);
  }

  v6 = [(TUProxyCall *)self proxyCallActionsDelegate];
  v7 = [(TUCall *)self uniqueProxyIdentifier];
  [v6 disconnectCallWithUniqueProxyIdentifier:v7];
}

- (void)playDTMFToneForKey:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v6 = [(TUProxyCall *)self proxyCallActionsDelegate];
  objc_super v5 = [(TUCall *)self uniqueProxyIdentifier];
  [v6 playDTMFToneForCallWithUniqueProxyIdentifier:v5 key:v3];
}

- (void)answerWithRequest:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUProxyCall;
  id v4 = a3;
  [(TUCall *)&v6 answerWithRequest:v4];
  objc_super v5 = [(TUProxyCall *)self proxyCallActionsDelegate];
  [v5 answerCallWithRequest:v4];
}

- (void)setDisconnectedReason:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(TUCall *)self disconnectedReason] != a3)
  {
    objc_super v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      int v10 = @"disconnectedReason";
      __int16 v11 = 1024;
      int v12 = [(TUCall *)self disconnectedReason];
      __int16 v13 = 1024;
      int v14 = a3;
      __int16 v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications and updating daemon", buf, 0x22u);
    }

    objc_super v6 = [(TUCall *)self callNotificationManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__TUProxyCall_setDisconnectedReason___block_invoke;
    v7[3] = &unk_1E58E6918;
    int v8 = a3;
    v7[4] = self;
    [v6 postNotificationsForCall:self afterUpdatesInBlock:v7];
  }
}

void __37__TUProxyCall_setDisconnectedReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)TUProxyCall;
  objc_msgSendSuper2(&v6, sel_setDisconnectedReason_, v2);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__TUProxyCall_setDisconnectedReason___block_invoke_2;
  aBlock[3] = &unk_1E58E5BE0;
  aBlock[4] = *(void *)(a1 + 32);
  uint64_t v3 = _Block_copy(aBlock);
  id v4 = v3;
  if (v3) {
    (*((void (**)(void *))v3 + 2))(v3);
  }
}

uint64_t __37__TUProxyCall_setDisconnectedReason___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateProxyCallWithDaemon];
}

- (void)setShouldSuppressRingtone:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(TUCall *)self shouldSuppressRingtone] != a3)
  {
    objc_super v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      int v10 = @"shouldSuppressRingtone";
      __int16 v11 = 1024;
      BOOL v12 = [(TUCall *)self shouldSuppressRingtone];
      __int16 v13 = 1024;
      BOOL v14 = v3;
      __int16 v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications and updating daemon", buf, 0x22u);
    }

    objc_super v6 = [(TUCall *)self callNotificationManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__TUProxyCall_setShouldSuppressRingtone___block_invoke;
    v7[3] = &unk_1E58E6280;
    BOOL v8 = v3;
    v7[4] = self;
    [v6 postNotificationsForCall:self afterUpdatesInBlock:v7];
  }
}

void __41__TUProxyCall_setShouldSuppressRingtone___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)TUProxyCall;
  objc_msgSendSuper2(&v6, sel_setShouldSuppressRingtone_, v2);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__TUProxyCall_setShouldSuppressRingtone___block_invoke_2;
  aBlock[3] = &unk_1E58E5BE0;
  aBlock[4] = *(void *)(a1 + 32);
  BOOL v3 = _Block_copy(aBlock);
  id v4 = v3;
  if (v3) {
    (*((void (**)(void *))v3 + 2))(v3);
  }
}

uint64_t __41__TUProxyCall_setShouldSuppressRingtone___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateProxyCallWithDaemon];
}

- (void)setWantsHoldMusic:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(TUCall *)self wantsHoldMusic] != a3)
  {
    objc_super v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      int v10 = @"wantsHoldMusic";
      __int16 v11 = 1024;
      BOOL v12 = [(TUCall *)self wantsHoldMusic];
      __int16 v13 = 1024;
      BOOL v14 = v3;
      __int16 v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications and updating daemon", buf, 0x22u);
    }

    objc_super v6 = [(TUCall *)self callNotificationManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__TUProxyCall_setWantsHoldMusic___block_invoke;
    v7[3] = &unk_1E58E6280;
    BOOL v8 = v3;
    v7[4] = self;
    [v6 postNotificationsForCall:self afterUpdatesInBlock:v7];
  }
}

void __33__TUProxyCall_setWantsHoldMusic___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)TUProxyCall;
  objc_msgSendSuper2(&v6, sel_setWantsHoldMusic_, v2);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__TUProxyCall_setWantsHoldMusic___block_invoke_2;
  aBlock[3] = &unk_1E58E5BE0;
  aBlock[4] = *(void *)(a1 + 32);
  BOOL v3 = _Block_copy(aBlock);
  id v4 = v3;
  if (v3) {
    (*((void (**)(void *))v3 + 2))(v3);
  }
}

uint64_t __33__TUProxyCall_setWantsHoldMusic___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateProxyCallWithDaemon];
}

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(TUCall *)self isEndpointOnCurrentDevice] != a3)
  {
    objc_super v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      int v10 = @"isEndpointOnCurrentDevice";
      __int16 v11 = 1024;
      BOOL v12 = [(TUCall *)self isEndpointOnCurrentDevice];
      __int16 v13 = 1024;
      BOOL v14 = v3;
      __int16 v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications", buf, 0x22u);
    }

    objc_super v6 = [(TUCall *)self callNotificationManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__TUProxyCall_setEndpointOnCurrentDevice___block_invoke;
    v7[3] = &unk_1E58E6280;
    BOOL v8 = v3;
    v7[4] = self;
    [v6 postNotificationsForCall:self afterUpdatesInBlock:v7];
  }
}

id __42__TUProxyCall_setEndpointOnCurrentDevice___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)TUProxyCall;
  return objc_msgSendSuper2(&v3, sel_setEndpointOnCurrentDevice_, v1);
}

- (void)setScreening:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(TUCall *)self isScreening] != a3)
  {
    objc_super v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      int v10 = @"isScreening";
      __int16 v11 = 1024;
      BOOL v12 = [(TUCall *)self isScreening];
      __int16 v13 = 1024;
      BOOL v14 = v3;
      __int16 v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications", buf, 0x22u);
    }

    objc_super v6 = [(TUCall *)self callNotificationManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __28__TUProxyCall_setScreening___block_invoke;
    v7[3] = &unk_1E58E6280;
    BOOL v8 = v3;
    v7[4] = self;
    [v6 postNotificationsForCall:self afterUpdatesInBlock:v7];
  }
}

id __28__TUProxyCall_setScreening___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)TUProxyCall;
  return objc_msgSendSuper2(&v3, sel_setScreening_, v1);
}

- (void)setTransitionStatus:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(TUCall *)self transitionStatus] != a3)
  {
    objc_super v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      int v10 = @"transitionStatus";
      __int16 v11 = 1024;
      int v12 = [(TUCall *)self transitionStatus];
      __int16 v13 = 1024;
      int v14 = a3;
      __int16 v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications", buf, 0x22u);
    }

    objc_super v6 = [(TUCall *)self callNotificationManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__TUProxyCall_setTransitionStatus___block_invoke;
    v7[3] = &unk_1E58E6918;
    int v8 = a3;
    v7[4] = self;
    [v6 postNotificationsForCall:self afterUpdatesInBlock:v7];
  }
}

id __35__TUProxyCall_setTransitionStatus___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)TUProxyCall;
  return objc_msgSendSuper2(&v3, sel_setTransitionStatus_, v1);
}

- (void)setVideoPaused:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_videoPaused != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL videoPaused = self->_videoPaused;
      *(_DWORD *)buf = 138413058;
      __int16 v11 = @"videoPaused";
      __int16 v12 = 1024;
      BOOL v13 = videoPaused;
      __int16 v14 = 1024;
      BOOL v15 = v3;
      __int16 v16 = 2112;
      uint64_t v17 = self;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications", buf, 0x22u);
    }

    v7 = [(TUCall *)self callNotificationManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __30__TUProxyCall_setVideoPaused___block_invoke;
    v8[3] = &unk_1E58E6280;
    v8[4] = self;
    BOOL v9 = v3;
    [v7 postNotificationsForCall:self afterUpdatesInBlock:v8];
  }
}

uint64_t __30__TUProxyCall_setVideoPaused___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 523) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setMediaStalled:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_mediaStalled != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL mediaStalled = self->_mediaStalled;
      *(_DWORD *)buf = 138413058;
      __int16 v11 = @"mediaStalled";
      __int16 v12 = 1024;
      BOOL v13 = mediaStalled;
      __int16 v14 = 1024;
      BOOL v15 = v3;
      __int16 v16 = 2112;
      uint64_t v17 = self;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications", buf, 0x22u);
    }

    v7 = [(TUCall *)self callNotificationManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __31__TUProxyCall_setMediaStalled___block_invoke;
    v8[3] = &unk_1E58E6280;
    v8[4] = self;
    BOOL v9 = v3;
    [v7 postNotificationsForCall:self afterUpdatesInBlock:v8];
  }
}

uint64_t __31__TUProxyCall_setMediaStalled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 521) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setVideoDegraded:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_videoDegraded != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL videoDegraded = self->_videoDegraded;
      *(_DWORD *)buf = 138413058;
      __int16 v11 = @"videoDegraded";
      __int16 v12 = 1024;
      BOOL v13 = videoDegraded;
      __int16 v14 = 1024;
      BOOL v15 = v3;
      __int16 v16 = 2112;
      uint64_t v17 = self;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications", buf, 0x22u);
    }

    v7 = [(TUCall *)self callNotificationManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__TUProxyCall_setVideoDegraded___block_invoke;
    v8[3] = &unk_1E58E6280;
    v8[4] = self;
    BOOL v9 = v3;
    [v7 postNotificationsForCall:self afterUpdatesInBlock:v8];
  }
}

uint64_t __32__TUProxyCall_setVideoDegraded___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 522) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setUplinkMuted:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_uplinkMuted != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      BOOL v10 = [(TUProxyCall *)self isUplinkMuted];
      __int16 v11 = 1024;
      BOOL v12 = v3;
      __int16 v13 = 2112;
      __int16 v14 = self;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set uplinkMuted from %d to %d for %@. Posting necessary notifications and updating daemon", buf, 0x18u);
    }

    objc_super v6 = [(TUCall *)self callNotificationManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __30__TUProxyCall_setUplinkMuted___block_invoke;
    v7[3] = &unk_1E58E6280;
    v7[4] = self;
    BOOL v8 = v3;
    [v6 postNotificationsForCall:self afterUpdatesInBlock:v7];
  }
}

void __30__TUProxyCall_setUplinkMuted___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 536) = *(unsigned char *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__TUProxyCall_setUplinkMuted___block_invoke_2;
  v3[3] = &unk_1E58E6280;
  v3[4] = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  uint64_t v1 = _Block_copy(v3);
  uint64_t v2 = v1;
  if (v1) {
    (*((void (**)(void *))v1 + 2))(v1);
  }
}

void __30__TUProxyCall_setUplinkMuted___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) proxyCallActionsDelegate];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) uniqueProxyIdentifier];
  [v4 setUplinkMuted:v2 forCallWithUniqueProxyIdentifier:v3];
}

- (void)setDownlinkMuted:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_downlinkMuted != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      BOOL v10 = [(TUProxyCall *)self isDownlinkMuted];
      __int16 v11 = 1024;
      BOOL v12 = v3;
      __int16 v13 = 2112;
      __int16 v14 = self;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set downlinkMuted from %d to %d for %@. Posting necessary notifications and updating daemon", buf, 0x18u);
    }

    objc_super v6 = [(TUCall *)self callNotificationManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __32__TUProxyCall_setDownlinkMuted___block_invoke;
    v7[3] = &unk_1E58E6280;
    v7[4] = self;
    BOOL v8 = v3;
    [v6 postNotificationsForCall:self afterUpdatesInBlock:v7];
  }
}

void __32__TUProxyCall_setDownlinkMuted___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 537) = *(unsigned char *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__TUProxyCall_setDownlinkMuted___block_invoke_2;
  v3[3] = &unk_1E58E6280;
  v3[4] = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  uint64_t v1 = _Block_copy(v3);
  uint64_t v2 = v1;
  if (v1) {
    (*((void (**)(void *))v1 + 2))(v1);
  }
}

void __32__TUProxyCall_setDownlinkMuted___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) proxyCallActionsDelegate];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) uniqueProxyIdentifier];
  [v4 setDownlinkMuted:v2 forCallWithUniqueProxyIdentifier:v3];
}

- (void)addScreenSharingType:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_screenSharingType != a3)
  {
    objc_super v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      unint64_t v9 = a3;
      __int16 v10 = 2048;
      unint64_t v11 = [(TUProxyCall *)self screenSharingType];
      __int16 v12 = 2112;
      __int16 v13 = self;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to add %lu to screenSharingType %lu for %@. Posting necessary notifications and updating daemon", buf, 0x20u);
    }

    objc_super v6 = [(TUCall *)self callNotificationManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__TUProxyCall_addScreenSharingType___block_invoke;
    v7[3] = &unk_1E58E6590;
    v7[4] = self;
    void v7[5] = a3;
    [v6 postNotificationsForCall:self afterUpdatesInBlock:v7];
  }
}

void __36__TUProxyCall_addScreenSharingType___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 872) = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__TUProxyCall_addScreenSharingType___block_invoke_2;
  v4[3] = &unk_1E58E6590;
  uint64_t v1 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  v4[5] = v1;
  uint64_t v2 = _Block_copy(v4);
  BOOL v3 = v2;
  if (v2) {
    (*((void (**)(void *))v2 + 2))(v2);
  }
}

void __36__TUProxyCall_addScreenSharingType___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) proxyCallActionsDelegate];
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) uniqueProxyIdentifier];
  [v4 addScreenSharingType:v2 forCallWithUniqueProxyIdentifier:v3];
}

- (void)setIsSendingVideo:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_isSendingVideo != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      BOOL v10 = [(TUProxyCall *)self isSendingVideo];
      __int16 v11 = 1024;
      BOOL v12 = v3;
      __int16 v13 = 2112;
      uint64_t v14 = self;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set isSendingVideo from %d to %d for %@. Posting necessary notifications and updating daemon", buf, 0x18u);
    }

    objc_super v6 = [(TUCall *)self callNotificationManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__TUProxyCall_setIsSendingVideo___block_invoke;
    v7[3] = &unk_1E58E6280;
    v7[4] = self;
    BOOL v8 = v3;
    [v6 postNotificationsForCall:self afterUpdatesInBlock:v7];
  }
}

void __33__TUProxyCall_setIsSendingVideo___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 520) = *(unsigned char *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__TUProxyCall_setIsSendingVideo___block_invoke_2;
  v3[3] = &unk_1E58E6280;
  v3[4] = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  uint64_t v1 = _Block_copy(v3);
  uint64_t v2 = v1;
  if (v1) {
    (*((void (**)(void *))v1 + 2))(v1);
  }
}

void __33__TUProxyCall_setIsSendingVideo___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) proxyCallActionsDelegate];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) uniqueProxyIdentifier];
  [v4 setIsSendingVideo:v2 forCallWithUniqueProxyIdentifier:v3];
}

- (void)setSharingScreen:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_sharingScreen != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL sharingScreen = self->_sharingScreen;
      *(_DWORD *)buf = 67109634;
      BOOL v11 = sharingScreen;
      __int16 v12 = 1024;
      BOOL v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = self;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set sharingScreen from %d to %d for %@. Posting necessary notifications and updating daemon", buf, 0x18u);
    }

    v7 = [(TUCall *)self callNotificationManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__TUProxyCall_setSharingScreen___block_invoke;
    v8[3] = &unk_1E58E6280;
    v8[4] = self;
    BOOL v9 = v3;
    [v7 postNotificationsForCall:self afterUpdatesInBlock:v8];
  }
}

void __32__TUProxyCall_setSharingScreen___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 544) = *(unsigned char *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__TUProxyCall_setSharingScreen___block_invoke_2;
  v3[3] = &unk_1E58E6280;
  v3[4] = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  uint64_t v1 = _Block_copy(v3);
  uint64_t v2 = v1;
  if (v1) {
    (*((void (**)(void *))v1 + 2))(v1);
  }
}

void __32__TUProxyCall_setSharingScreen___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) proxyCallActionsDelegate];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) uniqueProxyIdentifier];
  [v4 setSharingScreen:v2 forCallWithUniqueProxyIdentifier:v3];
}

- (void)setMixesVoiceWithMedia:(BOOL)a3
{
  int v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int mixesVoiceWithMedia = self->_mixesVoiceWithMedia;
  objc_super v6 = TUDefaultLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (mixesVoiceWithMedia == v3)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Wrong use of API", buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      BOOL v8 = self->_mixesVoiceWithMedia;
      *(_DWORD *)buf = 67109634;
      BOOL v12 = v8;
      __int16 v13 = 1024;
      int v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = self;
      _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Asked to set mixesVoiceWithMedia from %d to %d for self: %@. Posting necessary notifications and updating daemon", buf, 0x18u);
    }

    objc_super v6 = [(TUCall *)self callNotificationManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__TUProxyCall_setMixesVoiceWithMedia___block_invoke;
    v9[3] = &unk_1E58E6280;
    v9[4] = self;
    char v10 = v3;
    [v6 postNotificationsForCall:self afterUpdatesInBlock:v9];
  }
}

void __38__TUProxyCall_setMixesVoiceWithMedia___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 549) = *(unsigned char *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__TUProxyCall_setMixesVoiceWithMedia___block_invoke_2;
  v3[3] = &unk_1E58E6280;
  v3[4] = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  uint64_t v1 = _Block_copy(v3);
  uint64_t v2 = v1;
  if (v1) {
    (*((void (**)(void *))v1 + 2))(v1);
  }
}

void __38__TUProxyCall_setMixesVoiceWithMedia___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) proxyCallActionsDelegate];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  int v3 = [*(id *)(a1 + 32) uniqueProxyIdentifier];
  [v4 setMixesVoiceWithMedia:v2 forCallWithUniqueProxyIdentifier:v3];
}

- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v4 && !self->_sharingScreen)
  {
    BOOL v8 = TUDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL sharingScreen = self->_sharingScreen;
      *(_DWORD *)buf = 67109890;
      BOOL v15 = sharingScreen;
      __int16 v16 = 1024;
      int v17 = 1;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      v21 = self;
      _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to set sharingScreen from %d to %d attributes: %@ for %@. Posting necessary notifications and updating daemon", buf, 0x22u);
    }

    char v10 = [(TUCall *)self callNotificationManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__TUProxyCall_setSharingScreen_attributes___block_invoke;
    v11[3] = &unk_1E58E6DB0;
    v11[4] = self;
    BOOL v13 = v4;
    id v12 = v6;
    [v10 postNotificationsForCall:self afterUpdatesInBlock:v11];
  }
  else
  {
    BOOL v7 = TUDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Wrong use of API", buf, 2u);
    }
  }
}

void __43__TUProxyCall_setSharingScreen_attributes___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 544) = *(unsigned char *)(a1 + 48);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__TUProxyCall_setSharingScreen_attributes___block_invoke_2;
  aBlock[3] = &unk_1E58E6DB0;
  uint64_t v1 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 48);
  id v5 = v1;
  uint64_t v2 = _Block_copy(aBlock);
  int v3 = v2;
  if (v2) {
    (*((void (**)(void *))v2 + 2))(v2);
  }
}

void __43__TUProxyCall_setSharingScreen_attributes___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) proxyCallActionsDelegate];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = [*(id *)(a1 + 32) uniqueProxyIdentifier];
  [v5 setSharingScreen:v2 attributes:v3 forCallWithUniqueProxyIdentifier:v4];
}

- (void)updateProxyCallWithDaemon
{
  id v3 = [(TUProxyCall *)self proxyCallActionsDelegate];
  [v3 updateCallWithProxy:self];
}

- (void)setCallDisconnectedDueToComponentCrash
{
  [(TUProxyCall *)self setCallStatus:6];
  v3.receiver = self;
  v3.super_class = (Class)TUProxyCall;
  [(TUCall *)&v3 setDisconnectedReason:11];
}

- (void)sendHardPauseDigits
{
  objc_super v3 = [(TUProxyCall *)self proxyCallActionsDelegate];
  BOOL v4 = [(TUCall *)self uniqueProxyIdentifier];
  [v3 sendHardPauseDigitsForCallWithUniqueProxyIdentifier:v4];

  id v5 = [(TUCall *)self callNotificationManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__TUProxyCall_sendHardPauseDigits__block_invoke;
  v6[3] = &unk_1E58E5BE0;
  v6[4] = self;
  [v5 postNotificationsForCall:self afterUpdatesInBlock:v6];
}

uint64_t __34__TUProxyCall_sendHardPauseDigits__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHardPauseDigitsState:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setHardPauseDigits:0];
}

- (void)setHasEmergencyVideoStream:(BOOL)a3
{
  int v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int hasEmergencyVideoStream = self->_hasEmergencyVideoStream;
  char v6 = TUDefaultLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (hasEmergencyVideoStream == v3)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Wrong use of API", buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      BOOL v8 = self->_hasEmergencyVideoStream;
      *(_DWORD *)buf = 67109634;
      BOOL v12 = v8;
      __int16 v13 = 1024;
      int v14 = v3;
      __int16 v15 = 2112;
      __int16 v16 = self;
      _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Asked to set hasEmergencyVideoStream from %d to %d for self: %@. Posting necessary notifications and updating daemon", buf, 0x18u);
    }

    char v6 = [(TUCall *)self callNotificationManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__TUProxyCall_setHasEmergencyVideoStream___block_invoke;
    v9[3] = &unk_1E58E6280;
    v9[4] = self;
    char v10 = v3;
    [v6 postNotificationsForCall:self afterUpdatesInBlock:v9];
  }
}

void __42__TUProxyCall_setHasEmergencyVideoStream___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 527) = *(unsigned char *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__TUProxyCall_setHasEmergencyVideoStream___block_invoke_2;
  v3[3] = &unk_1E58E6280;
  v3[4] = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  uint64_t v1 = _Block_copy(v3);
  uint64_t v2 = v1;
  if (v1) {
    (*((void (**)(void *))v1 + 2))(v1);
  }
}

void __42__TUProxyCall_setHasEmergencyVideoStream___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) proxyCallActionsDelegate];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  int v3 = [*(id *)(a1 + 32) uniqueProxyIdentifier];
  [v4 setHasEmergencyVideoStream:v2 forCallWithUniqueProxyIdentifier:v3];
}

- (void)setEmergencyMediaItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    emergencyMediaItems = self->_emergencyMediaItems;
    *(_DWORD *)buf = 138412802;
    BOOL v12 = emergencyMediaItems;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    __int16 v16 = self;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set emergencyMediaItems from %@ to %@ for self: %@. Posting necessary notifications and updating daemon", buf, 0x20u);
  }

  BOOL v7 = [(TUCall *)self callNotificationManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__TUProxyCall_setEmergencyMediaItems___block_invoke;
  v9[3] = &unk_1E58E5C08;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 postNotificationsForCall:self afterUpdatesInBlock:v9];
}

void __38__TUProxyCall_setEmergencyMediaItems___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 672), *(id *)(a1 + 40));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__TUProxyCall_setEmergencyMediaItems___block_invoke_2;
  v5[3] = &unk_1E58E5C08;
  uint64_t v2 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v2;
  int v3 = _Block_copy(v5);
  id v4 = v3;
  if (v3) {
    (*((void (**)(void *))v3 + 2))(v3);
  }
}

void __38__TUProxyCall_setEmergencyMediaItems___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) proxyCallActionsDelegate];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = [*(id *)(a1 + 32) uniqueProxyIdentifier];
  [v4 setEmergencyMediaItems:v2 forCallWithUniqueProxyIdentifier:v3];
}

- (int)avcRemoteVideoModeForMode:(int64_t)a3
{
  if (a3 == 1) {
    int v3 = 0;
  }
  else {
    int v3 = -1;
  }
  if (a3 == 2) {
    return 1;
  }
  else {
    return v3;
  }
}

- (void)setRemoteVideoLayer:(id)a3 forMode:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(TUProxyCall *)self avcRemoteVideoModeForMode:a4];
  id v8 = [(TUProxyCall *)self remoteVideoModeToLayer];

  if (!v8)
  {
    BOOL v9 = [MEMORY[0x1E4F1CA60] dictionary];
    [(TUProxyCall *)self setRemoteVideoModeToLayer:v9];
  }
  id v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2048;
    uint64_t v17 = (int)v7;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Asked to set remote video layer %@ for mode %ld", (uint8_t *)&v14, 0x16u);
  }

  BOOL v11 = [(TUProxyCall *)self remoteVideoModeToLayer];
  BOOL v12 = [NSNumber numberWithInt:v7];
  [v11 setObject:v6 forKeyedSubscript:v12];

  if (!v6)
  {
    __int16 v13 = [(TUProxyCall *)self remoteVideo];
    [v13 setVideoLayer:0 forMode:v7];
  }
  [(TUProxyCall *)self _synchronizeRemoteVideo];
}

- (void)setLocalVideoLayer:(id)a3 forMode:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(TUProxyCall *)self localVideoModeToLayer];

  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    [(TUProxyCall *)self setLocalVideoModeToLayer:v8];
  }
  BOOL v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2048;
    int64_t v16 = a4;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Asked to set local video layer %@ for mode %ld", (uint8_t *)&v13, 0x16u);
  }

  id v10 = [(TUProxyCall *)self localVideoModeToLayer];
  BOOL v11 = [NSNumber numberWithInteger:a4];
  [v10 setObject:v6 forKeyedSubscript:v11];

  if (!v6)
  {
    BOOL v12 = [(TUProxyCall *)self localVideo];
    objc_msgSend(v12, "setVideoLayer:forMode:", 0, -[TUProxyCall avcRemoteVideoModeForMode:](self, "avcRemoteVideoModeForMode:", a4));
  }
  [(TUProxyCall *)self _synchronizeLocalVideo];
}

- (void)setRequiresRemoteVideo:(BOOL)a3
{
  if (self->_requiresRemoteVideo != a3)
  {
    self->_requiresRemoteVideo = a3;
    [(TUProxyCall *)self _synchronizeRemoteVideo];
  }
}

- (void)_updateVideoCallAttributes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCall *)self videoCallAttributes];
  char v6 = [v5 isEqualToVideoCallAttributes:v4];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(TUCall *)self videoCallAttributes];
    uint64_t v8 = [v7 localVideoContextSlotIdentifier];
    uint64_t v9 = [v4 localVideoContextSlotIdentifier];

    if (v8 != v9) {
      [(TUProxyCall *)self setLocalVideo:0];
    }
    id v10 = [(TUCall *)self videoCallAttributes];
    uint64_t v11 = [v10 remoteVideoContextSlotIdentifier];
    uint64_t v12 = [v4 remoteVideoContextSlotIdentifier];

    if (v11 != v12) {
      [(TUProxyCall *)self setRemoteVideo:0];
    }
    int v13 = [(TUCall *)self videoCallAttributes];
    uint64_t v14 = [v13 remoteCameraOrientation];
    uint64_t v15 = [v4 remoteCameraOrientation];

    if (v14 != v15) {
      -[TUProxyCall setRemoteCameraOrientation:](self, "setRemoteCameraOrientation:", [v4 remoteCameraOrientation]);
    }
    [(TUCall *)self setVideoCallAttributes:v4];
    int64_t v16 = TUDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_19C496000, v16, OS_LOG_TYPE_DEFAULT, "Updating video call attributes %@", (uint8_t *)&v17, 0xCu);
    }

    [(TUProxyCall *)self _synchronizeLocalVideo];
    [(TUProxyCall *)self _synchronizeRemoteVideo];
  }
}

- (void)_updateVideoStreamToken:(int64_t)a3
{
  if (self->_videoStreamToken != a3)
  {
    self->_videoStreamToken = a3;
    [(TUProxyCall *)self setRemoteVideo:0];
    [(TUProxyCall *)self _synchronizeRemoteVideo];
  }
}

- (void)_synchronizeLocalVideo
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v3 = [(TUProxyCall *)self localVideoModeToLayer];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(TUProxyCall *)self _createLocalVideoIfNecessary];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = [(TUProxyCall *)self localVideoModeToLayer];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v21;
      *(void *)&long long v7 = 138412546;
      long long v19 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v12 = [(TUProxyCall *)self localVideoModeToLayer];
          int v13 = [v12 objectForKeyedSubscript:v11];

          uint64_t v14 = TUDefaultLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = [v11 intValue];
            *(_DWORD *)buf = v19;
            v25 = v13;
            __int16 v26 = 1024;
            int v27 = v15;
            _os_log_impl(&dword_19C496000, v14, OS_LOG_TYPE_DEFAULT, "Setting video layer %@ for mode %d", buf, 0x12u);
          }

          int64_t v16 = [(TUProxyCall *)self localVideo];
          objc_msgSend(v16, "setVideoLayer:forMode:", v13, objc_msgSend(v11, "intValue"));
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v8);
    }
  }
  else
  {
    int v17 = [(TUProxyCall *)self localVideo];

    if (v17)
    {
      id v18 = TUDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19C496000, v18, OS_LOG_TYPE_DEFAULT, "No layers to synchronize, set local TURemoteVideoClient to nil", buf, 2u);
      }

      [(TUProxyCall *)self setLocalVideo:0];
    }
  }
}

- (void)_synchronizeRemoteVideo
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v3 = [(TUProxyCall *)self remoteVideoModeToLayer];
  if ([v3 count])
  {

    goto LABEL_4;
  }
  BOOL v4 = [(TUProxyCall *)self requiresRemoteVideo];

  if (v4)
  {
LABEL_4:
    [(TUProxyCall *)self _createRemoteVideoIfNecessary];
    id v5 = [(TUProxyCall *)self remoteVideo];

    if (v5)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v6 = [(TUProxyCall *)self remoteVideoModeToLayer];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v7)
      {
        uint64_t v9 = v7;
        uint64_t v10 = *(void *)v23;
        *(void *)&long long v8 = 138412546;
        long long v21 = v8;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v6);
            }
            uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
            int v13 = [(TUProxyCall *)self remoteVideoModeToLayer];
            uint64_t v14 = [v13 objectForKeyedSubscript:v12];

            int v15 = TUDefaultLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              int v16 = [v12 intValue];
              *(_DWORD *)buf = v21;
              int v27 = v14;
              __int16 v28 = 1024;
              int v29 = v16;
              _os_log_impl(&dword_19C496000, v15, OS_LOG_TYPE_DEFAULT, "Setting video layer %@ for mode %d", buf, 0x12u);
            }

            int v17 = [(TUProxyCall *)self remoteVideo];
            objc_msgSend(v17, "setVideoLayer:forMode:", v14, objc_msgSend(v12, "intValue"));

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v9);
      }
    }
    else
    {
      id v18 = TUDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19C496000, v18, OS_LOG_TYPE_DEFAULT, "Client asked to synchronize remote video layers but we don't have a AVCRemoteVideoClient which is only created once we have a nonzero videoStreamToken", buf, 2u);
      }
    }
    return;
  }
  long long v19 = [(TUProxyCall *)self remoteVideo];

  if (v19)
  {
    long long v20 = TUDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v20, OS_LOG_TYPE_DEFAULT, "No layers to synchronize so setting self.remoteVideo to nil", buf, 2u);
    }

    [(TUProxyCall *)self setRemoteVideo:0];
  }
}

- (void)_createLocalVideoIfNecessary
{
  int v3 = [(TUProxyCall *)self localVideo];

  if (!v3)
  {
    BOOL v4 = [(TUCall *)self videoCallAttributes];
    uint64_t v5 = [v4 localVideoContextSlotIdentifier];

    if (v5)
    {
      uint64_t v6 = [TURemoteVideoClient alloc];
      id v8 = [(TUCall *)self videoCallAttributes];
      uint64_t v7 = -[TURemoteVideoClient initWithVideoContextSlotIdentifier:](v6, "initWithVideoContextSlotIdentifier:", [v8 localVideoContextSlotIdentifier]);
      [(TUProxyCall *)self setLocalVideo:v7];
    }
  }
}

- (void)_createRemoteVideoIfNecessary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = [(TUProxyCall *)self remoteVideo];

  if (!v3)
  {
    BOOL v4 = [(TUCall *)self videoCallAttributes];
    uint64_t v5 = [v4 remoteVideoContextSlotIdentifier];

    if (v5)
    {
      uint64_t v6 = [TURemoteVideoClient alloc];
      uint64_t v7 = [(TUCall *)self videoCallAttributes];
      id v8 = -[TURemoteVideoClient initWithVideoContextSlotIdentifier:](v6, "initWithVideoContextSlotIdentifier:", [v7 remoteVideoContextSlotIdentifier]);
      [(TUProxyCall *)self setRemoteVideo:v8];
    }
    else if ([(TUProxyCall *)self videoStreamToken] >= 1)
    {
      uint64_t v9 = (objc_class *)CUTWeakLinkClass();
      uint64_t v10 = TUDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        int64_t v13 = [(TUProxyCall *)self videoStreamToken];
        _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Creating AVCRemoteVideoClient with stream token %ld", (uint8_t *)&v12, 0xCu);
      }

      uint64_t v11 = objc_msgSend([v9 alloc], "initWithStreamToken:delegate:", -[TUProxyCall videoStreamToken](self, "videoStreamToken"), self);
      [(TUProxyCall *)self setRemoteVideo:v11];
    }
    [(TUProxyCall *)self setMediaStalled:0];
    [(TUProxyCall *)self setVideoDegraded:0];
  }
}

- (CGSize)remoteScreenAspectRatio
{
  int64_t v3 = [(TUProxyCall *)self remoteScreenOrientation];

  [(TUProxyCall *)self localAspectRatioForOrientation:v3];
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)localAspectRatioForOrientation:(int64_t)a3
{
  if (__CUTWeakCGSizeZero__pred_CGSizeZeroCoreGraphics != -1) {
    dispatch_once(&__CUTWeakCGSizeZero__pred_CGSizeZeroCoreGraphics, &__block_literal_global_50);
  }
  if ((unint64_t)(a3 - 3) < 2)
  {
    [(TUProxyCall *)self remoteScreenLandscapeAspectRatio];
  }
  else if ((unint64_t)(a3 - 1) > 1)
  {
    double v6 = *((double *)&__CUTStaticWeak_CGSizeZero + 1);
    double v5 = *(double *)&__CUTStaticWeak_CGSizeZero;
  }
  else
  {
    [(TUProxyCall *)self remoteScreenPortraitAspectRatio];
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setRemoteVideoPresentationSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v7 = [(TUProxyCall *)self videoStreamToken];
    v16.double width = width;
    v16.double height = height;
    id v8 = NSStringFromSize(v16);
    int v11 = 134218242;
    int v12 = (TUProxyCall *)v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "self.videoStreamToken: %ld remoteVideoPresentationSize: %@", (uint8_t *)&v11, 0x16u);
  }
  if ([(TUProxyCall *)self isVideo])
  {
    uint64_t v9 = [(TUProxyCall *)self proxyCallActionsDelegate];
    uint64_t v10 = [(TUCall *)self uniqueProxyIdentifier];
    -[NSObject setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:size:](v9, "setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:size:", v10, width, height);
  }
  else
  {
    uint64_t v9 = TUDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      int v12 = self;
      _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to set remote video presentation size because call is not a video call: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)setRemoteVideoPresentationState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    uint64_t v9 = [(TUProxyCall *)self videoStreamToken];
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "self.videoStreamToken: %ld remoteVideoPresentationState: %d", (uint8_t *)&v8, 0x12u);
  }

  if ([(TUProxyCall *)self isVideo])
  {
    double v6 = [(TUProxyCall *)self proxyCallActionsDelegate];
    int64_t v7 = [(TUCall *)self uniqueProxyIdentifier];
    [v6 setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier:v7 presentationState:v3];
  }
  else
  {
    double v6 = TUDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = self;
      _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to set remote video presentation state because call is not a video call: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)setScreenShareAttributes:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "screenShareAttributes: %@", (uint8_t *)&v8, 0xCu);
  }

  double v6 = [(TUProxyCall *)self proxyCallActionsDelegate];
  int64_t v7 = [(TUCall *)self uniqueProxyIdentifier];
  [v6 setScreenShareAttributesForCallWithUniqueProxyIdentifier:v7 attributes:v4];
}

- (void)setBluetoothAudioFormat:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    int64_t v9 = a3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "bluetoothAudioFormat: %ld", (uint8_t *)&v8, 0xCu);
  }

  double v6 = [(TUProxyCall *)self proxyCallActionsDelegate];
  int64_t v7 = [(TUCall *)self uniqueProxyIdentifier];
  [v6 setBluetoothAudioFormatForCallWithUniqueProxyIdentifier:v7 bluetoothAudioFormat:a3];
}

- (void)remoteVideoClient:(id)a3 remoteVideoDidPause:(BOOL)a4
{
  double v6 = [(TUCall *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__TUProxyCall_remoteVideoClient_remoteVideoDidPause___block_invoke;
  v7[3] = &unk_1E58E6280;
  v7[4] = self;
  BOOL v8 = a4;
  dispatch_async(v6, v7);
}

uint64_t __53__TUProxyCall_remoteVideoClient_remoteVideoDidPause___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) videoStreamToken];
    int v4 = *(unsigned __int8 *)(a1 + 40);
    int v6 = 134218240;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "self.videoStreamToken: %ld didPause: %d", (uint8_t *)&v6, 0x12u);
  }

  return [*(id *)(a1 + 32) setVideoPaused:*(unsigned __int8 *)(a1 + 40)];
}

- (void)remoteVideoClient:(id)a3 remoteMediaDidStall:(BOOL)a4
{
  int v6 = [(TUCall *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__TUProxyCall_remoteVideoClient_remoteMediaDidStall___block_invoke;
  v7[3] = &unk_1E58E6280;
  v7[4] = self;
  BOOL v8 = a4;
  dispatch_async(v6, v7);
}

uint64_t __53__TUProxyCall_remoteVideoClient_remoteMediaDidStall___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) videoStreamToken];
    int v4 = *(unsigned __int8 *)(a1 + 40);
    int v6 = 134218240;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "self.videoStreamToken: %ld didStall: %d", (uint8_t *)&v6, 0x12u);
  }

  return [*(id *)(a1 + 32) setMediaStalled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)remoteVideoClient:(id)a3 videoDidDegrade:(BOOL)a4
{
  int v6 = [(TUCall *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__TUProxyCall_remoteVideoClient_videoDidDegrade___block_invoke;
  v7[3] = &unk_1E58E6280;
  v7[4] = self;
  BOOL v8 = a4;
  dispatch_async(v6, v7);
}

uint64_t __49__TUProxyCall_remoteVideoClient_videoDidDegrade___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) videoStreamToken];
    int v4 = *(unsigned __int8 *)(a1 + 40);
    int v6 = 134218240;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "self.videoStreamToken: %ld didStall: %d", (uint8_t *)&v6, 0x12u);
  }

  return [*(id *)(a1 + 32) setVideoDegraded:*(unsigned __int8 *)(a1 + 40)];
}

- (void)remoteVideoClient:(id)a3 remoteScreenAttributesDidChange:(id)a4
{
  id v5 = a4;
  int v6 = [(TUCall *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__TUProxyCall_remoteVideoClient_remoteScreenAttributesDidChange___block_invoke;
  v8[3] = &unk_1E58E5C08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __65__TUProxyCall_remoteVideoClient_remoteScreenAttributesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) videoStreamToken];
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "self.videoStreamToken: %ld screenAttributes: %@", buf, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) callNotificationManager];
  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__TUProxyCall_remoteVideoClient_remoteScreenAttributesDidChange___block_invoke_55;
  v7[3] = &unk_1E58E5C08;
  v7[4] = v6;
  id v8 = *(id *)(a1 + 40);
  [v5 postNotificationsForCall:v6 afterUpdatesInBlock:v7];
}

uint64_t __65__TUProxyCall_remoteVideoClient_remoteScreenAttributesDidChange___block_invoke_55(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRemoteScreenOrientation:", objc_msgSend(*(id *)(a1 + 32), "_orientationForVideoAttributesOrientation:", objc_msgSend(*(id *)(a1 + 40), "orientation")));
  uint64_t result = [*(id *)(a1 + 32) remoteScreenOrientation];
  if ((unint64_t)(result - 3) < 2)
  {
    [*(id *)(a1 + 40) ratio];
    uint64_t v4 = *(void **)(a1 + 32);
    return objc_msgSend(v4, "setRemoteScreenLandscapeAspectRatio:");
  }
  else if ((unint64_t)(result - 1) <= 1)
  {
    [*(id *)(a1 + 40) ratio];
    uint64_t v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "setRemoteScreenPortraitAspectRatio:");
  }
  return result;
}

- (void)remoteVideoClient:(id)a3 remoteVideoAttributesDidChange:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(TUCall *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__TUProxyCall_remoteVideoClient_remoteVideoAttributesDidChange___block_invoke;
  v8[3] = &unk_1E58E5C08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __64__TUProxyCall_remoteVideoClient_remoteVideoAttributesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) videoStreamToken];
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "self.videoStreamToken: %ld videoAttributes: %@", buf, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) callNotificationManager];
  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__TUProxyCall_remoteVideoClient_remoteVideoAttributesDidChange___block_invoke_56;
  v7[3] = &unk_1E58E5C08;
  v7[4] = v6;
  id v8 = *(id *)(a1 + 40);
  [v5 postNotificationsForCall:v6 afterUpdatesInBlock:v7];
}

uint64_t __64__TUProxyCall_remoteVideoClient_remoteVideoAttributesDidChange___block_invoke_56(uint64_t a1)
{
  [*(id *)(a1 + 40) ratio];
  objc_msgSend(*(id *)(a1 + 32), "setRemoteAspectRatio:");
  [*(id *)(a1 + 40) contentsRect];
  objc_msgSend(*(id *)(a1 + 32), "setRemoteVideoContentRect:");
  objc_msgSend(*(id *)(a1 + 32), "setCameraType:", objc_msgSend(*(id *)(a1 + 32), "_cameraTypeForVideoAttributeCamera:", objc_msgSend(*(id *)(a1 + 40), "camera")));
  objc_msgSend(*(id *)(a1 + 32), "setRemoteCameraOrientation:", objc_msgSend(*(id *)(a1 + 32), "_orientationForVideoAttributesOrientation:", objc_msgSend(*(id *)(a1 + 40), "orientation")));
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = [*(id *)(a1 + 40) videoMirrored];
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 setVideoMirrored:v3];
  }
  return result;
}

- (int64_t)_cameraTypeForVideoAttributeCamera:(int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return qword_19C607FE8[a3];
  }
}

- (int64_t)_orientationForVideoAttributesOrientation:(int)a3
{
  if (a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUProxyCall)initWithCoder:(id)a3
{
  id v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)TUProxyCall;
  id v5 = [(TUCall *)&v91 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_activeRemoteParticipant);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    activeRemoteParticipant = v5->_activeRemoteParticipant;
    v5->_activeRemoteParticipant = (TUParticipant *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"announceProviderIdentifier"];
    announceProviderIdentifier = v5->_announceProviderIdentifier;
    v5->_announceProviderIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initiator"];
    initiator = v5->_initiator;
    v5->_initiator = (TUHandle *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isoCountryCode"];
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callerNameFromNetwork"];
    callerNameFromNetwork = v5->_callerNameFromNetwork;
    v5->_callerNameFromNetwork = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callUUID"];
    callUUID = v5->_callUUID;
    v5->_callUUID = (NSString *)v20;

    v5->_callStatus = [v4 decodeInt32ForKey:@"callStatus"];
    v5->_hostedOnCurrentDevice = [v4 decodeBoolForKey:@"hostedOnCurrentDevice"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provider"];
    provider = v5->_provider;
    v5->_provider = (TUCallProvider *)v22;

    v5->_outgoing = [v4 decodeBoolForKey:@"outgoing"];
    v5->_voicemail = [v4 decodeBoolForKey:@"voicemail"];
    v5->_isVideo = [v4 decodeBoolForKey:@"isVideo"];
    v5->_thirdPartyVideo = [v4 decodeBoolForKey:@"thirdPartyVideo"];
    v5->_isSendingAudio = [v4 decodeBoolForKey:@"isSendingAudio"];
    v5->_isSendingVideo = [v4 decodeBoolForKey:@"isSendingVideo"];
    v5->_blocked = [v4 decodeBoolForKey:@"blocked"];
    v5->_emergency = [v4 decodeBoolForKey:@"emergency"];
    v5->_int hasEmergencyVideoStream = [v4 decodeBoolForKey:@"hasEmergencyVideoStream"];
    long long v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    __int16 v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"emergencyMediaItems"];
    emergencyMediaItems = v5->_emergencyMediaItems;
    v5->_emergencyMediaItems = (NSSet *)v27;

    v5->_failureExpected = [v4 decodeBoolForKey:@"failureExpected"];
    v5->_international = [v4 decodeBoolForKey:@"international"];
    v5->_domestic = [v4 decodeBoolForKey:@"domestic"];
    v5->_sos = [v4 decodeBoolForKey:@"sos"];
    v5->_supportsEmergencyFallback = [v4 decodeBoolForKey:@"supportsEmergencyFallback"];
    v5->_usingBaseband = [v4 decodeBoolForKey:@"usingBaseband"];
    v5->_ttyType = [v4 decodeInt32ForKey:@"ttyType"];
    v5->_supportsTTYWithVoice = [v4 decodeBoolForKey:@"supportsTTYWithVoice"];
    v5->_bluetoothAudioFormat = (int)[v4 decodeInt32ForKey:@"bluetoothAudioFormat"];
    v5->_int mixesVoiceWithMedia = [v4 decodeBoolForKey:@"mixesVoiceWithMedia"];
    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioCategory"];
    audioCategory = v5->_audioCategory;
    v5->_audioCategory = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioMode"];
    audioMode = v5->_audioMode;
    v5->_audioMode = (NSString *)v31;

    v5->_needsManualInCallSounds = [v4 decodeBoolForKey:@"needsManualInCallSounds"];
    v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v33, "setWithObjects:", v34, v35, objc_opt_class(), 0);
    v37 = [v4 decodeObjectOfClasses:v36 forKey:@"endedReasonUserInfo"];
    uint64_t v38 = [v37 copy];
    endedReasonUserInfo = v5->_endedReasonUserInfo;
    v5->_endedReasonUserInfo = (NSDictionary *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endedReasonString"];
    endedReasonString = v5->_endedReasonString;
    v5->_endedReasonString = (NSString *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endedErrorString"];
    endedErrorString = v5->_endedErrorString;
    v5->_endedErrorString = (NSString *)v42;

    v5->_uplinkMuted = [v4 decodeBoolForKey:@"uplinkMuted"];
    v5->_downlinkMuted = [v4 decodeBoolForKey:@"downlinkMuted"];
    v5->_callRelaySupport = [v4 decodeInt32ForKey:@"callRelaySupport"];
    v5->_videoStreamToken = [v4 decodeIntegerForKey:@"videoStreamToken"];
    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callGroupUUID"];
    callGroupUUID = v5->_callGroupUUID;
    v5->_callGroupUUID = (NSUUID *)v44;

    v46 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v47 = objc_opt_class();
    uint64_t v48 = objc_opt_class();
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_opt_class();
    v51 = objc_msgSend(v46, "setWithObjects:", v47, v48, v49, v50, objc_opt_class(), 0);
    v52 = [v4 decodeObjectOfClasses:v51 forKey:@"providerContext"];
    uint64_t v53 = [v52 copy];
    providerContext = v5->_providerContext;
    v5->_providerContext = (NSDictionary *)v53;

    v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayContext"];
    uint64_t v56 = [v55 copy];
    displayContext = v5->_displayContext;
    v5->_displayContext = (TUCallDisplayContext *)v56;

    v58 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v59 = objc_opt_class();
    v60 = objc_msgSend(v58, "setWithObjects:", v59, objc_opt_class(), 0);
    v61 = [v4 decodeObjectOfClasses:v60 forKey:@"remoteParticipantHandles"];
    uint64_t v62 = [v61 copy];
    remoteParticipantHandles = v5->_remoteParticipantHandles;
    v5->_remoteParticipantHandles = (NSSet *)v62;

    v5->_remoteUplinkMuted = [v4 decodeBoolForKey:@"remoteUplinkMuted"];
    uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localSenderIdentityUUID"];
    localSenderIdentityUUID = v5->_localSenderIdentityUUID;
    v5->_localSenderIdentityUUID = (NSUUID *)v64;

    uint64_t v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localSenderIdentityAccountUUID"];
    localSenderIdentityAccountUUID = v5->_localSenderIdentityAccountUUID;
    v5->_localSenderIdentityAccountUUID = (NSUUID *)v66;

    v5->_shouldSuppressInCallUI = [v4 decodeBoolForKey:@"shouldSuppressInCallUI"];
    v5->_mutuallyExclusiveCall = [v4 decodeBoolForKey:@"mutuallyExclusiveCall"];
    v5->_screenSharingIntention = [v4 decodeIntegerForKey:@"screenSharingIntention"];
    v5->_wantsStagingArea = [v4 decodeBoolForKey:@"wantsStagingArea"];
    v5->_inputAudioPowerSpectrumToken = [v4 decodeIntegerForKey:@"inputAudioPowerSpectrumToken"];
    v5->_outputAudioPowerSpectrumToken = [v4 decodeIntegerForKey:@"outputAudioPowerSpectrumToken"];
    v5->_isReRing = [v4 decodeBoolForKey:@"isReRing"];
    v5->_originatingUIType = [v4 decodeInt32ForKey:@"originatingUIType"];
    v5->_BOOL sharingScreen = [v4 decodeBoolForKey:@"sharingScreen"];
    v5->_conversation = [v4 decodeBoolForKey:@"conversation"];
    uint64_t v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"screenShareAttributes"];
    screenShareAttributes = v5->_screenShareAttributes;
    v5->_screenShareAttributes = (TUCallScreenShareAttributes *)v68;

    uint64_t v70 = objc_opt_class();
    v71 = NSStringFromSelector(sel_tokens);
    uint64_t v72 = [v4 decodeObjectOfClass:v70 forKey:v71];
    tokens = v5->_tokens;
    v5->_tokens = (TUMediaTokens *)v72;

    uint64_t v74 = objc_opt_class();
    v75 = NSStringFromSelector(sel_localMemberHandleValue);
    uint64_t v76 = [v4 decodeObjectOfClass:v74 forKey:v75];
    localMemberHandleValue = v5->_localMemberHandleValue;
    v5->_localMemberHandleValue = (NSString *)v76;

    v78 = NSStringFromSelector(sel_serviceStatus);
    v5->_serviceStatus = [v4 decodeIntegerForKey:v78];

    v79 = NSStringFromSelector(sel_transmissionMode);
    v5->_transmissionMode = [v4 decodeIntegerForKey:v79];

    v80 = NSStringFromSelector(sel_accessoryButtonEventsEnabled);
    v5->_accessoryButtonEventsEnabled = [v4 decodeBoolForKey:v80];

    v81 = NSStringFromSelector(sel_isReceivingTransmission);
    v5->_receivingTransmission = [v4 decodeBoolForKey:v81];

    v82 = NSStringFromSelector(sel_isSendingTransmission);
    v5->_sendingTransmission = [v4 decodeBoolForKey:v82];

    v83 = NSStringFromSelector(sel_recordingAvailability);
    v5->_recordingAvailability = [v4 decodeIntForKey:v83];

    v84 = NSStringFromSelector(sel_supportsScreening);
    v5->_supportsScreening = [v4 decodeBoolForKey:v84];

    v5->_ptt = [v4 decodeBoolForKey:@"ptt"];
    uint64_t v85 = objc_opt_class();
    v86 = NSStringFromSelector(sel_channelImageURL);
    uint64_t v87 = [v4 decodeObjectOfClass:v85 forKey:v86];
    channelImageURL = v5->_channelImageURL;
    v5->_channelImageURL = (NSURL *)v87;

    v89 = NSStringFromSelector(sel_screenSharingType);
    v5->_screenSharingType = [v4 decodeIntegerForKey:v89];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v27.receiver = self;
  v27.super_class = (Class)TUProxyCall;
  id v4 = a3;
  [(TUCall *)&v27 encodeWithCoder:v4];
  activeRemoteParticipant = self->_activeRemoteParticipant;
  uint64_t v6 = NSStringFromSelector(sel_activeRemoteParticipant);
  objc_msgSend(v4, "encodeObject:forKey:", activeRemoteParticipant, v6, v27.receiver, v27.super_class);

  [v4 encodeObject:self->_announceProviderIdentifier forKey:@"announceProviderIdentifier"];
  [v4 encodeObject:self->_callUUID forKey:@"callUUID"];
  [v4 encodeObject:self->_initiator forKey:@"initiator"];
  [v4 encodeObject:self->_handle forKey:@"handle"];
  [v4 encodeObject:self->_isoCountryCode forKey:@"isoCountryCode"];
  [v4 encodeObject:self->_callerNameFromNetwork forKey:@"callerNameFromNetwork"];
  [v4 encodeInt32:self->_callStatus forKey:@"callStatus"];
  [v4 encodeBool:self->_hostedOnCurrentDevice forKey:@"hostedOnCurrentDevice"];
  [v4 encodeObject:self->_provider forKey:@"provider"];
  [v4 encodeBool:self->_outgoing forKey:@"outgoing"];
  [v4 encodeBool:self->_voicemail forKey:@"voicemail"];
  [v4 encodeBool:self->_isVideo forKey:@"isVideo"];
  [v4 encodeBool:self->_thirdPartyVideo forKey:@"thirdPartyVideo"];
  [v4 encodeBool:self->_isSendingAudio forKey:@"isSendingAudio"];
  [v4 encodeBool:self->_isSendingVideo forKey:@"isSendingVideo"];
  [v4 encodeBool:self->_blocked forKey:@"blocked"];
  [v4 encodeBool:self->_emergency forKey:@"emergency"];
  [v4 encodeBool:self->_hasEmergencyVideoStream forKey:@"hasEmergencyVideoStream"];
  [v4 encodeObject:self->_emergencyMediaItems forKey:@"emergencyMediaItems"];
  [v4 encodeBool:self->_failureExpected forKey:@"failureExpected"];
  [v4 encodeBool:self->_international forKey:@"international"];
  [v4 encodeBool:self->_domestic forKey:@"domestic"];
  [v4 encodeBool:self->_sos forKey:@"sos"];
  [v4 encodeBool:self->_supportsEmergencyFallback forKey:@"supportsEmergencyFallback"];
  [v4 encodeBool:self->_usingBaseband forKey:@"usingBaseband"];
  [v4 encodeInt32:self->_ttyType forKey:@"ttyType"];
  [v4 encodeBool:self->_supportsTTYWithVoice forKey:@"supportsTTYWithVoice"];
  [v4 encodeInt32:LODWORD(self->_bluetoothAudioFormat) forKey:@"bluetoothAudioFormat"];
  [v4 encodeBool:self->_mixesVoiceWithMedia forKey:@"mixesVoiceWithMedia"];
  [v4 encodeObject:self->_audioCategory forKey:@"audioCategory"];
  [v4 encodeObject:self->_audioMode forKey:@"audioMode"];
  [v4 encodeBool:self->_needsManualInCallSounds forKey:@"needsManualInCallSounds"];
  [v4 encodeObject:self->_endedReasonUserInfo forKey:@"endedReasonUserInfo"];
  [v4 encodeObject:self->_endedReasonString forKey:@"endedReasonString"];
  [v4 encodeObject:self->_endedErrorString forKey:@"endedErrorString"];
  [v4 encodeBool:self->_uplinkMuted forKey:@"uplinkMuted"];
  [v4 encodeBool:self->_downlinkMuted forKey:@"downlinkMuted"];
  [v4 encodeInt32:self->_callRelaySupport forKey:@"callRelaySupport"];
  [v4 encodeInteger:self->_videoStreamToken forKey:@"videoStreamToken"];
  [v4 encodeObject:self->_callGroupUUID forKey:@"callGroupUUID"];
  [v4 encodeObject:self->_providerContext forKey:@"providerContext"];
  [v4 encodeObject:self->_displayContext forKey:@"displayContext"];
  [v4 encodeObject:self->_remoteParticipantHandles forKey:@"remoteParticipantHandles"];
  [v4 encodeBool:self->_remoteUplinkMuted forKey:@"remoteUplinkMuted"];
  [v4 encodeObject:self->_localSenderIdentityUUID forKey:@"localSenderIdentityUUID"];
  [v4 encodeObject:self->_localSenderIdentityAccountUUID forKey:@"localSenderIdentityAccountUUID"];
  [v4 encodeBool:self->_shouldSuppressInCallUI forKey:@"shouldSuppressInCallUI"];
  [v4 encodeBool:self->_mutuallyExclusiveCall forKey:@"mutuallyExclusiveCall"];
  [v4 encodeBool:self->_wantsStagingArea forKey:@"wantsStagingArea"];
  [v4 encodeInteger:self->_inputAudioPowerSpectrumToken forKey:@"inputAudioPowerSpectrumToken"];
  [v4 encodeInteger:self->_outputAudioPowerSpectrumToken forKey:@"outputAudioPowerSpectrumToken"];
  [v4 encodeBool:self->_isReRing forKey:@"isReRing"];
  [v4 encodeInt32:self->_originatingUIType forKey:@"originatingUIType"];
  [v4 encodeBool:self->_sharingScreen forKey:@"sharingScreen"];
  [v4 encodeBool:self->_conversation forKey:@"conversation"];
  [v4 encodeObject:self->_screenShareAttributes forKey:@"screenShareAttributes"];
  [v4 encodeInteger:self->_screenSharingIntention forKey:@"screenSharingIntention"];
  [v4 encodeObject:self->_tokens forKey:@"tokens"];
  localMemberHandleValue = self->_localMemberHandleValue;
  uint64_t v8 = NSStringFromSelector(sel_localMemberHandleValue);
  [v4 encodeObject:localMemberHandleValue forKey:v8];

  int64_t serviceStatus = self->_serviceStatus;
  uint64_t v10 = NSStringFromSelector(sel_serviceStatus);
  [v4 encodeInteger:serviceStatus forKey:v10];

  int64_t transmissionMode = self->_transmissionMode;
  uint64_t v12 = NSStringFromSelector(sel_transmissionMode);
  [v4 encodeInteger:transmissionMode forKey:v12];

  BOOL accessoryButtonEventsEnabled = self->_accessoryButtonEventsEnabled;
  uint64_t v14 = NSStringFromSelector(sel_accessoryButtonEventsEnabled);
  [v4 encodeBool:accessoryButtonEventsEnabled forKey:v14];

  BOOL receivingTransmission = self->_receivingTransmission;
  uint64_t v16 = NSStringFromSelector(sel_isReceivingTransmission);
  [v4 encodeBool:receivingTransmission forKey:v16];

  BOOL sendingTransmission = self->_sendingTransmission;
  uint64_t v18 = NSStringFromSelector(sel_isSendingTransmission);
  [v4 encodeBool:sendingTransmission forKey:v18];

  uint64_t recordingAvailability = self->_recordingAvailability;
  uint64_t v20 = NSStringFromSelector(sel_recordingAvailability);
  [v4 encodeInt:recordingAvailability forKey:v20];

  BOOL supportsScreening = self->_supportsScreening;
  uint64_t v22 = NSStringFromSelector(sel_supportsScreening);
  [v4 encodeBool:supportsScreening forKey:v22];

  [v4 encodeBool:self->_ptt forKey:@"ptt"];
  channelImageURL = self->_channelImageURL;
  long long v24 = NSStringFromSelector(sel_channelImageURL);
  [v4 encodeObject:channelImageURL forKey:v24];

  unint64_t screenSharingType = self->_screenSharingType;
  __int16 v26 = NSStringFromSelector(sel_screenSharingType);
  [v4 encodeInteger:screenSharingType forKey:v26];
}

- (TUParticipant)activeRemoteParticipant
{
  return self->_activeRemoteParticipant;
}

- (void)setActiveRemoteParticipant:(id)a3
{
}

- (NSString)announceProviderIdentifier
{
  return self->_announceProviderIdentifier;
}

- (void)setAnnounceProviderIdentifier:(id)a3
{
}

- (BOOL)isPTT
{
  return self->_ptt;
}

- (id)channelImageURL
{
  return self->_channelImageURL;
}

- (void)setChannelImageURL:(id)a3
{
}

- (BOOL)isReRing
{
  return self->_isReRing;
}

- (NSString)callUUID
{
  return self->_callUUID;
}

- (void)setCallUUID:(id)a3
{
}

- (int)callStatus
{
  return self->_callStatus;
}

- (void)setCallStatus:(int)a3
{
  self->_callStatus = a3;
}

- (TUHandle)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
}

- (BOOL)isHostedOnCurrentDevice
{
  return self->_hostedOnCurrentDevice;
}

- (void)setHostedOnCurrentDevice:(BOOL)a3
{
  self->_hostedOnCurrentDevice = a3;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (TUCallProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (BOOL)isOutgoing
{
  return self->_outgoing;
}

- (void)setOutgoing:(BOOL)a3
{
  self->_outgoing = a3;
}

- (BOOL)isVoicemail
{
  return self->_voicemail;
}

- (void)setVoicemail:(BOOL)a3
{
  self->_voicemail = a3;
}

- (NSString)callerNameFromNetwork
{
  return self->_callerNameFromNetwork;
}

- (void)setCallerNameFromNetwork:(id)a3
{
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (BOOL)isThirdPartyVideo
{
  return self->_thirdPartyVideo;
}

- (void)setThirdPartyVideo:(BOOL)a3
{
  self->_thirdPartyVideo = a3;
}

- (BOOL)isSendingAudio
{
  return self->_isSendingAudio;
}

- (void)setIsSendingAudio:(BOOL)a3
{
  self->_isSendingAudio = a3;
}

- (BOOL)isSendingVideo
{
  return self->_isSendingVideo;
}

- (BOOL)isMediaStalled
{
  return self->_mediaStalled;
}

- (BOOL)isVideoDegraded
{
  return self->_videoDegraded;
}

- (BOOL)isVideoPaused
{
  return self->_videoPaused;
}

- (BOOL)isVideoMirrored
{
  return self->_videoMirrored;
}

- (void)setVideoMirrored:(BOOL)a3
{
  self->_videoMirrored = a3;
}

- (CGSize)remoteAspectRatio
{
  double width = self->_remoteAspectRatio.width;
  double height = self->_remoteAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRemoteAspectRatio:(CGSize)a3
{
  self->_remoteAspectRatio = a3;
}

- (CGRect)remoteVideoContentRect
{
  double x = self->_remoteVideoContentRect.origin.x;
  double y = self->_remoteVideoContentRect.origin.y;
  double width = self->_remoteVideoContentRect.size.width;
  double height = self->_remoteVideoContentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRemoteVideoContentRect:(CGRect)a3
{
  self->_remoteVideoContentRect = a3;
}

- (int64_t)cameraType
{
  return self->_cameraType;
}

- (void)setCameraType:(int64_t)a3
{
  self->_cameraType = a3;
}

- (int64_t)remoteCameraOrientation
{
  return self->_remoteCameraOrientation;
}

- (void)setRemoteCameraOrientation:(int64_t)a3
{
  self->_remoteCameraOrientation = a3;
}

- (BOOL)isBlocked
{
  return self->_blocked;
}

- (void)setBlocked:(BOOL)a3
{
  self->_blocked = a3;
}

- (BOOL)isEmergency
{
  return self->_emergency;
}

- (void)setEmergency:(BOOL)a3
{
  self->_emergencdouble y = a3;
}

- (BOOL)hasEmergencyVideoStream
{
  return self->_hasEmergencyVideoStream;
}

- (NSSet)emergencyMediaItems
{
  return self->_emergencyMediaItems;
}

- (BOOL)isFailureExpected
{
  return self->_failureExpected;
}

- (void)setFailureExpected:(BOOL)a3
{
  self->_failureExpected = a3;
}

- (BOOL)isInternational
{
  return self->_international;
}

- (void)setInternational:(BOOL)a3
{
  self->_international = a3;
}

- (BOOL)isDomestic
{
  return self->_domestic;
}

- (void)setDomestic:(BOOL)a3
{
  self->_domestic = a3;
}

- (BOOL)isSOS
{
  return self->_sos;
}

- (void)setSOS:(BOOL)a3
{
  self->_sos = a3;
}

- (BOOL)supportsEmergencyFallback
{
  return self->_supportsEmergencyFallback;
}

- (void)setSupportsEmergencyFallback:(BOOL)a3
{
  self->_supportsEmergencyFallback = a3;
}

- (BOOL)isUsingBaseband
{
  return self->_usingBaseband;
}

- (void)setUsingBaseband:(BOOL)a3
{
  self->_usingBaseband = a3;
}

- (int)ttyType
{
  return self->_ttyType;
}

- (void)setTtyType:(int)a3
{
  self->_ttyType = a3;
}

- (int64_t)bluetoothAudioFormat
{
  return self->_bluetoothAudioFormat;
}

- (BOOL)supportsTTYWithVoice
{
  return self->_supportsTTYWithVoice;
}

- (void)setSupportsTTYWithVoice:(BOOL)a3
{
  self->_supportsTTYWithVoice = a3;
}

- (NSString)audioCategory
{
  return self->_audioCategory;
}

- (void)setAudioCategory:(id)a3
{
}

- (NSString)audioMode
{
  return self->_audioMode;
}

- (void)setAudioMode:(id)a3
{
}

- (BOOL)needsManualInCallSounds
{
  return self->_needsManualInCallSounds;
}

- (void)setNeedsManualInCallSounds:(BOOL)a3
{
  self->_needsManualInCallSounds = a3;
}

- (NSDictionary)endedReasonUserInfo
{
  return self->_endedReasonUserInfo;
}

- (void)setEndedReasonUserInfo:(id)a3
{
}

- (NSString)endedReasonString
{
  return self->_endedReasonString;
}

- (void)setEndedReasonString:(id)a3
{
}

- (NSString)endedErrorString
{
  return self->_endedErrorString;
}

- (void)setEndedErrorString:(id)a3
{
}

- (BOOL)isUplinkMuted
{
  return self->_uplinkMuted;
}

- (BOOL)isDownlinkMuted
{
  return self->_downlinkMuted;
}

- (int)callRelaySupport
{
  return self->_callRelaySupport;
}

- (void)setCallRelaySupport:(int)a3
{
  self->_callRelaySupport = a3;
}

- (NSData)localFrequency
{
  return self->_localFrequency;
}

- (void)setLocalFrequency:(id)a3
{
}

- (NSData)remoteFrequency
{
  return self->_remoteFrequency;
}

- (void)setRemoteFrequency:(id)a3
{
}

- (float)localMeterLevel
{
  return self->_localMeterLevel;
}

- (void)setLocalMeterLevel:(float)a3
{
  self->_localMeterLevel = a3;
}

- (float)remoteMeterLevel
{
  return self->_remoteMeterLevel;
}

- (void)setRemoteMeterLevel:(float)a3
{
  self->_remoteMeterLevel = a3;
}

- (int64_t)videoStreamToken
{
  return self->_videoStreamToken;
}

- (void)setVideoStreamToken:(int64_t)a3
{
  self->_videoStreamToken = a3;
}

- (int64_t)inputAudioPowerSpectrumToken
{
  return self->_inputAudioPowerSpectrumToken;
}

- (void)setInputAudioPowerSpectrumToken:(int64_t)a3
{
  self->_inputAudioPowerSpectrumToken = a3;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  return self->_outputAudioPowerSpectrumToken;
}

- (void)setOutputAudioPowerSpectrumToken:(int64_t)a3
{
  self->_outputAudioPowerSpectrumToken = a3;
}

- (BOOL)requiresRemoteVideo
{
  return self->_requiresRemoteVideo;
}

- (int64_t)remoteScreenOrientation
{
  return self->_remoteScreenOrientation;
}

- (void)setRemoteScreenOrientation:(int64_t)a3
{
  self->_remoteScreenOrientation = a3;
}

- (NSUUID)callGroupUUID
{
  return self->_callGroupUUID;
}

- (void)setCallGroupUUID:(id)a3
{
}

- (NSDictionary)providerContext
{
  return self->_providerContext;
}

- (void)setProviderContext:(id)a3
{
}

- (TUCallDisplayContext)displayContext
{
  return self->_displayContext;
}

- (void)setDisplayContext:(id)a3
{
}

- (NSSet)remoteParticipantHandles
{
  return self->_remoteParticipantHandles;
}

- (void)setRemoteParticipantHandles:(id)a3
{
}

- (BOOL)prefersExclusiveAccessToCellularNetwork
{
  return self->_prefersExclusiveAccessToCellularNetwork;
}

- (void)setPrefersExclusiveAccessToCellularNetwork:(BOOL)a3
{
  self->_prefersExclusiveAccessToCellularNetwork = a3;
}

- (BOOL)isRemoteUplinkMuted
{
  return self->_remoteUplinkMuted;
}

- (void)setRemoteUplinkMuted:(BOOL)a3
{
  self->_remoteUplinkMuted = a3;
}

- (NSUUID)localSenderIdentityUUID
{
  return self->_localSenderIdentityUUID;
}

- (void)setLocalSenderIdentityUUID:(id)a3
{
}

- (NSUUID)localSenderIdentityAccountUUID
{
  return self->_localSenderIdentityAccountUUID;
}

- (void)setLocalSenderIdentityAccountUUID:(id)a3
{
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_shouldSuppressInCallUI;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  self->_shouldSuppressInCallUI = a3;
}

- (BOOL)isMutuallyExclusiveCall
{
  return self->_mutuallyExclusiveCall;
}

- (void)setMutuallyExclusiveCall:(BOOL)a3
{
  self->_mutuallyExclusiveCall = a3;
}

- (BOOL)wantsStagingArea
{
  return self->_wantsStagingArea;
}

- (void)setWantsStagingArea:(BOOL)a3
{
  self->_wantsStagingArea = a3;
}

- (int)originatingUIType
{
  return self->_originatingUIType;
}

- (void)setOriginatingUIType:(int)a3
{
  self->_originatingUIType = a3;
}

- (BOOL)isSharingScreen
{
  return self->_sharingScreen;
}

- (BOOL)isConversation
{
  return self->_conversation;
}

- (void)setConversation:(BOOL)a3
{
  self->_conversation = a3;
}

- (id)screenShareAttributes
{
  return self->_screenShareAttributes;
}

- (int64_t)serviceStatus
{
  return self->_serviceStatus;
}

- (void)setServiceStatus:(int64_t)a3
{
  self->_int64_t serviceStatus = a3;
}

- (int64_t)transmissionMode
{
  return self->_transmissionMode;
}

- (void)setTransmissionMode:(int64_t)a3
{
  self->_int64_t transmissionMode = a3;
}

- (BOOL)accessoryButtonEventsEnabled
{
  return self->_accessoryButtonEventsEnabled;
}

- (void)setAccessoryButtonEventsEnabled:(BOOL)a3
{
  self->_BOOL accessoryButtonEventsEnabled = a3;
}

- (BOOL)isReceivingTransmission
{
  return self->_receivingTransmission;
}

- (void)setReceivingTransmission:(BOOL)a3
{
  self->_BOOL receivingTransmission = a3;
}

- (BOOL)isSendingTransmission
{
  return self->_sendingTransmission;
}

- (void)setSendingTransmission:(BOOL)a3
{
  self->_BOOL sendingTransmission = a3;
}

- (BOOL)mixesVoiceWithMedia
{
  return self->_mixesVoiceWithMedia;
}

- (int)recordingAvailability
{
  return self->_recordingAvailability;
}

- (BOOL)supportsScreening
{
  return self->_supportsScreening;
}

- (id)tokens
{
  return self->_tokens;
}

- (id)localMemberHandleValue
{
  return self->_localMemberHandleValue;
}

- (int64_t)screenSharingIntention
{
  return self->_screenSharingIntention;
}

- (void)setScreenSharingIntention:(int64_t)a3
{
  self->_screenSharingIntention = a3;
}

- (unint64_t)screenSharingType
{
  return self->_screenSharingType;
}

- (void)setScreenSharingType:(unint64_t)a3
{
  self->_unint64_t screenSharingType = a3;
}

- (TUCallServicesProxyCallActions)proxyCallActionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyCallActionsDelegate);

  return (TUCallServicesProxyCallActions *)WeakRetained;
}

- (void)setProxyCallActionsDelegate:(id)a3
{
}

- (TURemoteVideoClient)localVideo
{
  return self->_localVideo;
}

- (void)setLocalVideo:(id)a3
{
}

- (TURemoteVideoClient)remoteVideo
{
  return self->_remoteVideo;
}

- (void)setRemoteVideo:(id)a3
{
}

- (NSMutableDictionary)remoteVideoModeToLayer
{
  return self->_remoteVideoModeToLayer;
}

- (void)setRemoteVideoModeToLayer:(id)a3
{
}

- (NSMutableDictionary)localVideoModeToLayer
{
  return self->_localVideoModeToLayer;
}

- (void)setLocalVideoModeToLayer:(id)a3
{
}

- (CGSize)remoteScreenPortraitAspectRatio
{
  double width = self->_remoteScreenPortraitAspectRatio.width;
  double height = self->_remoteScreenPortraitAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRemoteScreenPortraitAspectRatio:(CGSize)a3
{
  self->_remoteScreenPortraitAspectRatio = a3;
}

- (CGSize)remoteScreenLandscapeAspectRatio
{
  double width = self->_remoteScreenLandscapeAspectRatio.width;
  double height = self->_remoteScreenLandscapeAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRemoteScreenLandscapeAspectRatio:(CGSize)a3
{
  self->_remoteScreenLandscapeAspectRatio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localVideoModeToLayer, 0);
  objc_storeStrong((id *)&self->_remoteVideoModeToLayer, 0);
  objc_storeStrong((id *)&self->_remoteVideo, 0);
  objc_storeStrong((id *)&self->_localVideo, 0);
  objc_destroyWeak((id *)&self->_proxyCallActionsDelegate);
  objc_storeStrong((id *)&self->_localMemberHandleValue, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_screenShareAttributes, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityAccountUUID, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityUUID, 0);
  objc_storeStrong((id *)&self->_remoteParticipantHandles, 0);
  objc_storeStrong((id *)&self->_displayContext, 0);
  objc_storeStrong((id *)&self->_providerContext, 0);
  objc_storeStrong((id *)&self->_callGroupUUID, 0);
  objc_storeStrong((id *)&self->_remoteFrequency, 0);
  objc_storeStrong((id *)&self->_localFrequency, 0);
  objc_storeStrong((id *)&self->_endedErrorString, 0);
  objc_storeStrong((id *)&self->_endedReasonString, 0);
  objc_storeStrong((id *)&self->_endedReasonUserInfo, 0);
  objc_storeStrong((id *)&self->_audioMode, 0);
  objc_storeStrong((id *)&self->_audioCategory, 0);
  objc_storeStrong((id *)&self->_emergencyMediaItems, 0);
  objc_storeStrong((id *)&self->_callerNameFromNetwork, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_callUUID, 0);
  objc_storeStrong((id *)&self->_channelImageURL, 0);
  objc_storeStrong((id *)&self->_announceProviderIdentifier, 0);

  objc_storeStrong((id *)&self->_activeRemoteParticipant, 0);
}

@end