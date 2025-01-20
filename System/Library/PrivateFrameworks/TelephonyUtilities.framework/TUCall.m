@interface TUCall
+ (BOOL)isJunkConfidenceLevelJunk:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_supplementalDialTelephonyCallStringForLocString:(id)a3 destination:(id)a4 isPhoneNumber:(BOOL)a5 includeFaceTimeAudio:(BOOL)a6;
+ (id)faceTimeSupplementalDialTelephonyCallStringIncludingFTA:(BOOL)a3;
+ (id)supplementalDialTelephonyCallString;
+ (id)supplementalDialTelephonyCallStringForDestination:(id)a3 isPhoneNumber:(BOOL)a4;
+ (int64_t)acceptableJunkConfidence;
+ (int64_t)maxJunkConfidence;
- (BOOL)_isEligibleForManualScreening:(BOOL)a3 languageIdentifier:(id)a4;
- (BOOL)accessoryButtonEventsEnabled;
- (BOOL)hasBeenRedirected;
- (BOOL)hasEmergencyVideoStream;
- (BOOL)hasIdentifiedSpamInCallerName;
- (BOOL)hasNondisclosedGreeting;
- (BOOL)hasRelaySupport:(int)a3;
- (BOOL)hasSentInvitation;
- (BOOL)hasUpdatedAudio;
- (BOOL)isActive;
- (BOOL)isAnsweringMachineAvailable;
- (BOOL)isBlocked;
- (BOOL)isConferenced;
- (BOOL)isConnected;
- (BOOL)isConnecting;
- (BOOL)isConversation;
- (BOOL)isDialRequestVideoUpgrade:(id)a3;
- (BOOL)isDomestic;
- (BOOL)isDownlinkMuted;
- (BOOL)isEligibleForManualScreening;
- (BOOL)isEligibleForManualScreening:(id)a3;
- (BOOL)isEligibleForScreening;
- (BOOL)isEligibleForScreening:(id)a3;
- (BOOL)isEmergency;
- (BOOL)isEndpointOnCurrentDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCall:(id)a3;
- (BOOL)isFailureExpected;
- (BOOL)isFromSiri;
- (BOOL)isHostedOnCurrentDevice;
- (BOOL)isIncoming;
- (BOOL)isInternational;
- (BOOL)isJunk;
- (BOOL)isKnownCaller;
- (BOOL)isLocalUserInHomeCountry;
- (BOOL)isMediaStalled;
- (BOOL)isMutuallyExclusiveCall;
- (BOOL)isOnHold;
- (BOOL)isOutgoing;
- (BOOL)isPTT;
- (BOOL)isRTT;
- (BOOL)isReRing;
- (BOOL)isReceivingTransmission;
- (BOOL)isRecording;
- (BOOL)isRecordingAllowed;
- (BOOL)isRemoteUplinkMuted;
- (BOOL)isSOS;
- (BOOL)isScreening;
- (BOOL)isScreeningDueToUserInteraction;
- (BOOL)isSendingAudio;
- (BOOL)isSendingTransmission;
- (BOOL)isSendingVideo;
- (BOOL)isSharingScreen;
- (BOOL)isTTY;
- (BOOL)isThirdPartyVideo;
- (BOOL)isUplinkMuted;
- (BOOL)isUsingBaseband;
- (BOOL)isVideo;
- (BOOL)isVideoDegraded;
- (BOOL)isVideoMirrored;
- (BOOL)isVideoPaused;
- (BOOL)isVideoUpgradeFromCall:(id)a3;
- (BOOL)isVoIPCall;
- (BOOL)isVoicemail;
- (BOOL)isWiFiCall;
- (BOOL)joinedFromLink;
- (BOOL)lockdownModeEnabled;
- (BOOL)mediaPlaybackOnExternalDevice;
- (BOOL)mixesVoiceWithMedia;
- (BOOL)needsConversationOrVideoRelaySupport;
- (BOOL)needsConversationRelaySupport;
- (BOOL)needsManualInCallSounds;
- (BOOL)prefersExclusiveAccessToCellularNetwork;
- (BOOL)prefersToPlayDuringWombat;
- (BOOL)requiresRemoteVideo;
- (BOOL)ringtoneSuppressedRemotely;
- (BOOL)screeningAnnouncementHasFinished;
- (BOOL)setMuted:(BOOL)a3;
- (BOOL)shouldDisplayLocationIfAvailable;
- (BOOL)shouldPlayDTMFTone;
- (BOOL)shouldSuppressInCallUI;
- (BOOL)shouldSuppressRingtone;
- (BOOL)statusIsProvisional;
- (BOOL)supportsDTMFTones;
- (BOOL)supportsDTMFUpdates;
- (BOOL)supportsEmergencyFallback;
- (BOOL)supportsRecents;
- (BOOL)supportsScreening;
- (BOOL)supportsSimultaneousVoiceAndData;
- (BOOL)supportsTTYWithVoice;
- (BOOL)wantsHoldMusic;
- (BOOL)wantsStagingArea;
- (BOOL)wasDeclined;
- (BOOL)wasDialAssisted;
- (BOOL)wasPulledToCurrentDevice;
- (BOOL)wasScreened;
- (CGRect)remoteVideoContentRect;
- (CGSize)remoteScreenAspectRatio;
- (NSArray)contactIdentifiers;
- (NSData)localFrequency;
- (NSData)remoteFrequency;
- (NSDate)dateAnsweredOrDialed;
- (NSDate)dateConnected;
- (NSDate)dateCreated;
- (NSDate)dateEnded;
- (NSDate)dateScreeningEnded;
- (NSDate)dateSentInvitation;
- (NSDate)dateStartedConnecting;
- (NSDictionary)callStats;
- (NSDictionary)endedReasonUserInfo;
- (NSDictionary)providerContext;
- (NSNotificationCenter)notificationCenter;
- (NSNumber)handoffRecipientParticipant;
- (NSSet)emergencyMediaItems;
- (NSSet)remoteParticipantHandles;
- (NSString)announceProviderIdentifier;
- (NSString)audioCategory;
- (NSString)audioMode;
- (NSString)blockedByExtension;
- (NSString)callDirectoryIdentityExtension;
- (NSString)callDirectoryName;
- (NSString)callDurationString;
- (NSString)callerNameFromNetwork;
- (NSString)companyDepartment;
- (NSString)companyName;
- (NSString)contactIdentifier;
- (NSString)destinationID;
- (NSString)displayFirstName;
- (NSString)displayName;
- (NSString)endedErrorString;
- (NSString)endedReasonString;
- (NSString)hardPauseDigits;
- (NSString)hardPauseDigitsDisplayString;
- (NSString)isoCountryCode;
- (NSString)localMemberHandleValue;
- (NSString)localizedHandoffRecipientDeviceCategory;
- (NSString)localizedLabel;
- (NSString)reminderString;
- (NSString)sourceIdentifier;
- (NSString)suggestedDisplayName;
- (NSString)uniqueProxyIdentifier;
- (NSURL)channelImageURL;
- (NSURL)imageURL;
- (NSUUID)callGroupUUID;
- (NSUUID)conversationID;
- (NSUUID)localSenderIdentityAccountUUID;
- (NSUUID)localSenderIdentityUUID;
- (NSUUID)uniqueProxyIdentifierUUID;
- (OS_dispatch_queue)queue;
- (TUCall)init;
- (TUCall)initWithCall:(id)a3;
- (TUCall)initWithCoder:(id)a3;
- (TUCall)initWithNotificationCenter:(id)a3;
- (TUCall)initWithUniqueProxyIdentifier:(id)a3;
- (TUCall)initWithUniqueProxyIdentifier:(id)a3 endpointOnCurrentDevice:(BOOL)a4;
- (TUCall)initWithUniqueProxyIdentifier:(id)a3 endpointOnCurrentDevice:(BOOL)a4 notificationCenter:(id)a5;
- (TUCallCenter)callCenter;
- (TUCallDisplayContext)displayContext;
- (TUCallModel)model;
- (TUCallNotificationManager)callNotificationManager;
- (TUCallProvider)provider;
- (TUCallRecordingSession)recordingSession;
- (TUCallScreenShareAttributes)screenShareAttributes;
- (TUCallServicesInterface)callServicesInterface;
- (TUDialRequest)dialRequestForRedial;
- (TUFeatureFlags)featureFlags;
- (TUHandle)handle;
- (TUHandle)initiator;
- (TUMediaTokens)tokens;
- (TUParticipant)activeRemoteParticipant;
- (TUProxyCall)comparativeCall;
- (TUSenderIdentity)localSenderIdentity;
- (TUVideoCallAttributes)videoCallAttributes;
- (double)callDuration;
- (double)clientMessageReceiveTime;
- (double)hostCreationTime;
- (double)hostMessageSendTime;
- (double)startTime;
- (float)localMeterLevel;
- (float)remoteMeterLevel;
- (id)clarityEnabledBlock;
- (id)contactsDataSourceCreationBlock;
- (id)description;
- (id)errorAlertMessage;
- (id)errorAlertTitle;
- (id)lowPowerModeEnabledBlock;
- (id)serviceDisplayString;
- (id)supplementalInCallString;
- (int)abUID;
- (int)callRelaySupport;
- (int)callStatus;
- (int)callSubType;
- (int)disconnectedReason;
- (int)faceTimeIDStatus;
- (int)filteredOutReason;
- (int)hardPauseDigitsState;
- (int)originatingUIType;
- (int)recordingAvailability;
- (int)service;
- (int)status;
- (int)transitionStatus;
- (int)ttyType;
- (int64_t)answeringMachineStreamToken;
- (int64_t)bluetoothAudioFormat;
- (int64_t)callDirectoryIdentityType;
- (int64_t)cameraType;
- (int64_t)faceTimeTransportType;
- (int64_t)identificationCategory;
- (int64_t)inputAudioPowerSpectrumToken;
- (int64_t)junkConfidence;
- (int64_t)liveVoicemailUnavailableReason;
- (int64_t)outputAudioPowerSpectrumToken;
- (int64_t)priority;
- (int64_t)providerEndedReason;
- (int64_t)providerErrorCode;
- (int64_t)provisionalHoldStatus;
- (int64_t)remoteCameraOrientation;
- (int64_t)remoteScreenOrientation;
- (int64_t)screenSharingIntention;
- (int64_t)serviceStatus;
- (int64_t)soundRegion;
- (int64_t)transmissionMode;
- (int64_t)verificationStatus;
- (int64_t)videoStreamToken;
- (unint64_t)hash;
- (unint64_t)screenSharingType;
- (void)_handleStatusChange;
- (void)answerWithRequest:(id)a3;
- (void)dealloc;
- (void)dialRequestForRedial;
- (void)disconnectWithReason:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)hold;
- (void)resetProvisionalState;
- (void)resetWantsHoldMusic;
- (void)setAnnounceProviderIdentifier:(id)a3;
- (void)setAnsweringMachineStreamToken:(int64_t)a3;
- (void)setBlockedByExtension:(id)a3;
- (void)setBluetoothAudioFormat:(int64_t)a3;
- (void)setCallDirectoryIdentityExtension:(id)a3;
- (void)setCallServicesInterface:(id)a3;
- (void)setCallSubType:(int)a3;
- (void)setChannelImageURL:(id)a3;
- (void)setClarityEnabledBlock:(id)a3;
- (void)setClientMessageReceiveTime:(double)a3;
- (void)setComparativeCall:(id)a3;
- (void)setContactsDataSourceCreationBlock:(id)a3;
- (void)setDateAnsweredOrDialed:(id)a3;
- (void)setDateConnected:(id)a3;
- (void)setDateEnded:(id)a3;
- (void)setDateScreeningEnded:(id)a3;
- (void)setDateSentInvitation:(id)a3;
- (void)setDateStartedConnecting:(id)a3;
- (void)setDisconnectedReason:(int)a3;
- (void)setEmergencyMediaItems:(id)a3;
- (void)setEndpointOnCurrentDevice:(BOOL)a3;
- (void)setFaceTimeIDStatus:(int)a3;
- (void)setFailureExpected:(BOOL)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setFilteredOutReason:(int)a3;
- (void)setHardPauseDigits:(id)a3;
- (void)setHardPauseDigitsState:(int)a3;
- (void)setHasEmergencyVideoStream:(BOOL)a3;
- (void)setHasUpdatedAudio:(BOOL)a3;
- (void)setHostCreationTime:(double)a3;
- (void)setHostMessageSendTime:(double)a3;
- (void)setIsOnHold:(BOOL)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setJoinedFromLink:(BOOL)a3;
- (void)setLiveVoicemailUnavailableReason:(int64_t)a3;
- (void)setLowPowerModeEnabledBlock:(id)a3;
- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3;
- (void)setMixesVoiceWithMedia:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setPrefersToPlayDuringWombat:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
- (void)setProvisionalHoldStatus:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setRingtoneSuppressedRemotely:(BOOL)a3;
- (void)setScreenSharingType:(unint64_t)a3;
- (void)setScreening:(BOOL)a3;
- (void)setScreeningAnnouncementHasFinished:(BOOL)a3;
- (void)setScreeningDueToUserInteraction:(BOOL)a3;
- (void)setSharingScreen:(BOOL)a3;
- (void)setShouldSuppressRingtone:(BOOL)a3;
- (void)setSoundRegion:(int64_t)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setSupportsDTMFUpdates:(BOOL)a3;
- (void)setSupportsEmergencyFallback:(BOOL)a3;
- (void)setSupportsRecents:(BOOL)a3;
- (void)setTransitionStatus:(int)a3;
- (void)setTtyType:(int)a3;
- (void)setUniqueProxyIdentifier:(id)a3;
- (void)setVerificationStatus:(int64_t)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVideoCallAttributes:(id)a3;
- (void)setWantsHoldMusic:(BOOL)a3;
- (void)setWasDialAssisted:(BOOL)a3;
- (void)setWasPulledToCurrentDevice:(BOOL)a3;
- (void)setWasScreened:(BOOL)a3;
- (void)suppressRingtone;
- (void)suppressRingtoneDueToRemoteSuppression;
- (void)unhold;
- (void)updateComparativeCall;
- (void)updateWithCall:(id)a3;
@end

@implementation TUCall

- (TUCall)init
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [v3 UUIDString];
  v5 = [(TUCall *)self initWithUniqueProxyIdentifier:v4];

  return v5;
}

- (TUCall)initWithNotificationCenter:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [v5 UUIDString];
  v7 = [(TUCall *)self initWithUniqueProxyIdentifier:v6 endpointOnCurrentDevice:1 notificationCenter:v4];

  return v7;
}

- (TUCall)initWithUniqueProxyIdentifier:(id)a3
{
  return [(TUCall *)self initWithUniqueProxyIdentifier:a3 endpointOnCurrentDevice:1];
}

- (TUCall)initWithCall:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueProxyIdentifier];
  v6 = [(TUCall *)self initWithUniqueProxyIdentifier:v5];

  if (v6) {
    [(TUCall *)v6 updateWithCall:v4];
  }

  return v6;
}

- (TUCall)initWithUniqueProxyIdentifier:(id)a3 endpointOnCurrentDevice:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a3;
  v8 = [v6 defaultCenter];
  v9 = [(TUCall *)self initWithUniqueProxyIdentifier:v7 endpointOnCurrentDevice:v4 notificationCenter:v8];

  return v9;
}

- (TUCall)initWithUniqueProxyIdentifier:(id)a3 endpointOnCurrentDevice:(BOOL)a4 notificationCenter:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)TUCall;
  v11 = [(TUCall *)&v30 init];
  if (v11)
  {
    [v10 addObserver:v11 selector:sel__handleStatusChange name:@"TUCallCenterCallStatusChangedInternalNotification" object:v11];
    v12 = objc_alloc_init(TUFeatureFlags);
    featureFlags = v11->_featureFlags;
    v11->_featureFlags = v12;

    v11->_lockdownModeEnabled = TULockdownModeEnabled();
    v14 = [[TUCallNotificationManager alloc] initWithNotificationCenter:v10];
    callNotificationManager = v11->_callNotificationManager;
    v11->_callNotificationManager = v14;

    v16 = objc_alloc_init(TUCallModel);
    model = v11->_model;
    v11->_model = v16;

    v11->_shouldSuppressRingtone = 1;
    v11->_supportsRecents = 1;
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
    dateCreated = v11->_dateCreated;
    v11->_dateCreated = (NSDate *)v18;

    objc_storeStrong((id *)&v11->_uniqueProxyIdentifier, a3);
    v11->_endpointOnCurrentDevice = a4;
    v20 = objc_alloc_init(TUVideoCallAttributes);
    videoCallAttributes = v11->_videoCallAttributes;
    v11->_videoCallAttributes = v20;

    objc_initWeak(&location, v11);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __83__TUCall_initWithUniqueProxyIdentifier_endpointOnCurrentDevice_notificationCenter___block_invoke;
    v27[3] = &unk_1E58E86A8;
    objc_copyWeak(&v28, &location);
    v22 = _Block_copy(v27);
    id contactsDataSourceCreationBlock = v11->_contactsDataSourceCreationBlock;
    v11->_id contactsDataSourceCreationBlock = v22;

    id clarityEnabledBlock = v11->_clarityEnabledBlock;
    v11->_id clarityEnabledBlock = &__block_literal_global_52;

    id lowPowerModeEnabledBlock = v11->_lowPowerModeEnabledBlock;
    v11->_id lowPowerModeEnabledBlock = &__block_literal_global_239;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v11;
}

id __83__TUCall_initWithUniqueProxyIdentifier_endpointOnCurrentDevice_notificationCenter___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1B990], "tu_contactStoreConfigurationForCall:", WeakRetained);
    [v2 setIncludeLocalContacts:1];
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __83__TUCall_initWithUniqueProxyIdentifier_endpointOnCurrentDevice_notificationCenter___block_invoke_3()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v1 = [v0 isLowPowerModeEnabled];

  return v1;
}

- (void)dealloc
{
  v3 = [(TUCall *)self notificationCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TUCall;
  [(TUCall *)&v4 dealloc];
}

- (NSNotificationCenter)notificationCenter
{
  v2 = [(TUCall *)self callNotificationManager];
  v3 = [v2 notificationCenter];

  return (NSNotificationCenter *)v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_super v4 = [(TUCall *)self provider];
  v5 = [v4 identifier];
  [v3 appendFormat:@" p=%@", v5];

  v6 = [(TUCall *)self announceProviderIdentifier];
  [v3 appendFormat:@" aPI=%@", v6];

  id v7 = [(TUCall *)self initiator];
  [v3 appendFormat:@" initr=%@", v7];

  v8 = [(TUCall *)self recordingSession];
  [v3 appendFormat:@" crs=%@", v8];

  id v9 = TUStringForCallService([(TUCall *)self service]);
  [v3 appendFormat:@" svc=%@", v9];

  id v10 = [(TUCall *)self handle];
  [v3 appendFormat:@" hdl=%@", v10];

  v11 = [(TUCall *)self remoteParticipantHandles];
  [v3 appendFormat:@" hdls=%@", v11];

  v12 = [(TUCall *)self isoCountryCode];
  [v3 appendFormat:@" isoCC=%@", v12];

  v13 = TUStringForCallStatus([(TUCall *)self status]);
  [v3 appendFormat:@" stat=%@", v13];

  objc_msgSend(v3, "appendFormat:", @" tStat=%d", -[TUCall transitionStatus](self, "transitionStatus"));
  objc_msgSend(v3, "appendFormat:", @" dR=%d", -[TUCall disconnectedReason](self, "disconnectedReason"));
  objc_msgSend(v3, "appendFormat:", @" fR=%d", -[TUCall filteredOutReason](self, "filteredOutReason"));
  objc_msgSend(v3, "appendFormat:", @" supportsR=%d", -[TUCall supportsRecents](self, "supportsRecents"));
  v14 = [(TUCall *)self uniqueProxyIdentifier];
  [v3 appendFormat:@" uPI=%@", v14];

  v15 = [(TUCall *)self callGroupUUID];
  [v3 appendFormat:@" grp=%@", v15];

  v16 = [(TUCall *)self localSenderIdentityUUID];
  [v3 appendFormat:@" lSIUUID=%@", v16];

  v17 = [(TUCall *)self localSenderIdentityAccountUUID];
  [v3 appendFormat:@" lSIAccountUUID=%@", v17];

  objc_msgSend(v3, "appendFormat:", @" hosted=%d", -[TUCall isHostedOnCurrentDevice](self, "isHostedOnCurrentDevice"));
  objc_msgSend(v3, "appendFormat:", @" endpt=%d", -[TUCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice"));
  uint64_t v18 = [(TUCall *)self callerNameFromNetwork];
  [v3 appendFormat:@" callerNFN=%@", v18];

  v19 = [(TUCall *)self sourceIdentifier];
  [v3 appendFormat:@" srcID=%@", v19];

  v20 = [(TUCall *)self audioCategory];
  [v3 appendFormat:@" aC=%@", v20];

  v21 = [(TUCall *)self audioMode];
  [v3 appendFormat:@" aM=%@", v21];

  objc_msgSend(v3, "appendFormat:", @" iUB=%d", -[TUCall isUsingBaseband](self, "isUsingBaseband"));
  objc_msgSend(v3, "appendFormat:", @" vm=%d", -[TUCall isVoicemail](self, "isVoicemail"));
  objc_msgSend(v3, "appendFormat:", @" connStat=%d%d", -[TUCall isConnecting](self, "isConnecting"), -[TUCall isConnected](self, "isConnected"));
  objc_msgSend(v3, "appendFormat:", @" nMICS=%d", -[TUCall needsManualInCallSounds](self, "needsManualInCallSounds"));
  objc_msgSend(v3, "appendFormat:", @" sR=%ld", -[TUCall soundRegion](self, "soundRegion"));
  objc_msgSend(v3, "appendFormat:", @" iSA=%d", -[TUCall isSendingAudio](self, "isSendingAudio"));
  objc_msgSend(v3, "appendFormat:", @" iSV=%d", -[TUCall isSendingVideo](self, "isSendingVideo"));
  objc_msgSend(v3, "appendFormat:", @" iSS=%d", -[TUCall isSharingScreen](self, "isSharingScreen"));
  objc_msgSend(v3, "appendFormat:", @" wHM=%d", -[TUCall wantsHoldMusic](self, "wantsHoldMusic"));
  objc_msgSend(v3, "appendFormat:", @" hSI=%d", -[TUCall hasSentInvitation](self, "hasSentInvitation"));
  objc_msgSend(v3, "appendFormat:", @" vST=%ld", -[TUCall videoStreamToken](self, "videoStreamToken"));
  objc_msgSend(v3, "appendFormat:", @" iapST=%ld", -[TUCall inputAudioPowerSpectrumToken](self, "inputAudioPowerSpectrumToken"));
  objc_msgSend(v3, "appendFormat:", @" oapST=%ld", -[TUCall outputAudioPowerSpectrumToken](self, "outputAudioPowerSpectrumToken"));
  v22 = [(TUCall *)self tokens];

  if (v22)
  {
    v23 = [(TUCall *)self tokens];
    [v3 appendFormat:@" tokens=%@", v23];
  }
  v24 = [(TUCall *)self localMemberHandleValue];

  if (v24)
  {
    v25 = [(TUCall *)self localMemberHandleValue];
    [v3 appendFormat:@" localMemberHandleValue=%@", v25];
  }
  v26 = [(TUCall *)self videoCallAttributes];
  [v3 appendFormat:@" vCA=%@", v26];

  v27 = [(TUCall *)self screenShareAttributes];
  [v3 appendFormat:@" ssA=%@", v27];

  objc_msgSend(v3, "appendFormat:", @" ssI=%ld", -[TUCall screenSharingIntention](self, "screenSharingIntention"));
  id v28 = [(TUCall *)self model];
  [v3 appendFormat:@" model=%@", v28];

  objc_msgSend(v3, "appendFormat:", @" dtmfU=%d", -[TUCall supportsDTMFUpdates](self, "supportsDTMFUpdates"));
  objc_msgSend(v3, "appendFormat:", @" em=%d", -[TUCall isEmergency](self, "isEmergency"));
  objc_msgSend(v3, "appendFormat:", @" emvs=%d", -[TUCall hasEmergencyVideoStream](self, "hasEmergencyVideoStream"));
  v29 = [(TUCall *)self emergencyMediaItems];
  [v3 appendFormat:@" emmi=%@", v29];

  objc_msgSend(v3, "appendFormat:", @" iFE=%d", -[TUCall isFailureExpected](self, "isFailureExpected"));
  objc_msgSend(v3, "appendFormat:", @" sos=%d", -[TUCall isSOS](self, "isSOS"));
  objc_msgSend(v3, "appendFormat:", @" sSR=%d", -[TUCall shouldSuppressRingtone](self, "shouldSuppressRingtone"));
  objc_msgSend(v3, "appendFormat:", @" sSUI=%d", -[TUCall shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  objc_msgSend(v3, "appendFormat:", @" mX=%d", -[TUCall isMutuallyExclusiveCall](self, "isMutuallyExclusiveCall"));
  objc_msgSend(v3, "appendFormat:", @" iUM=%d", -[TUCall isUplinkMuted](self, "isUplinkMuted"));
  objc_msgSend(v3, "appendFormat:", @" iDM=%d", -[TUCall isDownlinkMuted](self, "isDownlinkMuted"));
  objc_msgSend(v3, "appendFormat:", @" tty=%ld", -[TUCall ttyType](self, "ttyType"));
  objc_msgSend(v3, "appendFormat:", @" ttyWV=%d", -[TUCall supportsTTYWithVoice](self, "supportsTTYWithVoice"));
  objc_msgSend(v3, "appendFormat:", @" convo=%d", -[TUCall isConversation](self, "isConversation"));
  objc_msgSend(v3, "appendFormat:", @" rUM=%d", -[TUCall isRemoteUplinkMuted](self, "isRemoteUplinkMuted"));
  objc_msgSend(v3, "appendFormat:", @" ver=%ld", -[TUCall verificationStatus](self, "verificationStatus"));
  objc_msgSend(v3, "appendFormat:", @" pri=%ld", -[TUCall priority](self, "priority"));
  objc_msgSend(v3, "appendFormat:", @" oUI=%ld", -[TUCall originatingUIType](self, "originatingUIType"));
  objc_msgSend(v3, "appendFormat:", @" lvmR=%ld", -[TUCall liveVoicemailUnavailableReason](self, "liveVoicemailUnavailableReason"));
  objc_msgSend(v3, "appendFormat:", @" jConf=%ld", -[TUCall junkConfidence](self, "junkConfidence"));
  objc_msgSend(v3, "appendFormat:", @" iCat=%ld", -[TUCall identificationCategory](self, "identificationCategory"));
  objc_msgSend(v3, "appendFormat:", @" iKC=%d", -[TUCall isKnownCaller](self, "isKnownCaller"));
  objc_msgSend(v3, "appendFormat:", @" JFL=%d", -[TUCall joinedFromLink](self, "joinedFromLink"));
  objc_msgSend(v3, "appendFormat:", @" btAF=%ld", -[TUCall bluetoothAudioFormat](self, "bluetoothAudioFormat"));
  objc_msgSend(v3, "appendFormat:", @" mVM=%d", -[TUCall mixesVoiceWithMedia](self, "mixesVoiceWithMedia"));
  objc_msgSend(v3, "appendFormat:", @" sEF=%d", -[TUCall supportsEmergencyFallback](self, "supportsEmergencyFallback"));
  objc_msgSend(v3, "appendFormat:", @" cs=%d", -[TUCall isScreening](self, "isScreening"));
  objc_msgSend(v3, "appendFormat:", @" csUI=%d", -[TUCall isScreeningDueToUserInteraction](self, "isScreeningDueToUserInteraction"));
  objc_msgSend(v3, "appendFormat:", @" ae=%d", -[TUCall screeningAnnouncementHasFinished](self, "screeningAnnouncementHasFinished"));
  objc_msgSend(v3, "appendFormat:", @" hBR=%d", -[TUCall hasBeenRedirected](self, "hasBeenRedirected"));
  objc_super v30 = [(TUCall *)self providerContext];
  [v3 appendFormat:@" pCtx=%@", v30];

  objc_msgSend(v3, "appendFormat:", @" amst=%ld", -[TUCall answeringMachineStreamToken](self, "answeringMachineStreamToken"));
  objc_msgSend(v3, "appendFormat:", @" lUHC=%d", -[TUCall isLocalUserInHomeCountry](self, "isLocalUserInHomeCountry"));
  objc_msgSend(v3, "appendFormat:", @" iSCN=%d", -[TUCall hasIdentifiedSpamInCallerName](self, "hasIdentifiedSpamInCallerName"));
  objc_msgSend(v3, "appendFormat:", @" reRing=%d", -[TUCall isReRing](self, "isReRing"));
  objc_msgSend(v3, "appendFormat:", @" cST=%ld", -[TUCall callSubType](self, "callSubType"));
  objc_msgSend(v3, "appendFormat:", @" screenSharingType=%ld", -[TUCall screenSharingType](self, "screenSharingType"));
  [v3 appendString:@">"];

  return v3;
}

+ (int64_t)acceptableJunkConfidence
{
  return 1;
}

+ (int64_t)maxJunkConfidence
{
  return 3;
}

+ (BOOL)isJunkConfidenceLevelJunk:(int64_t)a3
{
  return +[TUCall acceptableJunkConfidence] < a3;
}

- (void)updateComparativeCall
{
  id v3 = [(TUCall *)self comparativeCall];
  [v3 updateWithCall:self];
}

- (TUCallCenter)callCenter
{
  v2 = [(TUCall *)self callServicesInterface];
  id v3 = [v2 callCenter];

  return (TUCallCenter *)v3;
}

- (BOOL)isEmergency
{
  return 0;
}

- (BOOL)isFailureExpected
{
  return 0;
}

- (BOOL)supportsEmergencyFallback
{
  return 0;
}

- (BOOL)isSOS
{
  return 0;
}

- (BOOL)isVoicemail
{
  return 0;
}

- (BOOL)isUsingBaseband
{
  return 0;
}

- (BOOL)prefersExclusiveAccessToCellularNetwork
{
  return 0;
}

- (BOOL)isUplinkMuted
{
  return 0;
}

- (BOOL)isDownlinkMuted
{
  return 0;
}

- (BOOL)isVideo
{
  return 0;
}

- (BOOL)isThirdPartyVideo
{
  return 0;
}

- (BOOL)isOutgoing
{
  return 0;
}

- (BOOL)isBlocked
{
  return 0;
}

- (BOOL)isSendingAudio
{
  return 0;
}

- (BOOL)isSendingVideo
{
  return 0;
}

- (BOOL)isMediaStalled
{
  return 0;
}

- (BOOL)isVideoDegraded
{
  return 0;
}

- (BOOL)isVideoPaused
{
  return 0;
}

- (BOOL)isVideoMirrored
{
  return 0;
}

- (BOOL)requiresRemoteVideo
{
  return 0;
}

- (BOOL)supportsTTYWithVoice
{
  return 0;
}

- (BOOL)isRemoteUplinkMuted
{
  return 0;
}

- (BOOL)shouldSuppressInCallUI
{
  return 0;
}

- (BOOL)isMutuallyExclusiveCall
{
  return 0;
}

- (BOOL)wantsStagingArea
{
  return 0;
}

- (BOOL)isConversation
{
  return 0;
}

- (float)remoteMeterLevel
{
  return 0.0;
}

- (float)localMeterLevel
{
  return 0.0;
}

- (int64_t)videoStreamToken
{
  return 0;
}

- (int64_t)inputAudioPowerSpectrumToken
{
  return 0;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  return 0;
}

- (BOOL)isReRing
{
  return 0;
}

- (void)_handleStatusChange
{
  [(TUCall *)self resetProvisionalState];
  if ([(TUCall *)self isOnHold])
  {
    [(TUCall *)self resetWantsHoldMusic];
  }
}

- (void)answerWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [(TUCall *)self callNotificationManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__TUCall_answerWithRequest___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 deferNotificationsUntilAfterPerformingBlock:v7];
}

uint64_t __28__TUCall_answerWithRequest___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTransitionStatus:1];
  v2 = [*(id *)(a1 + 40) sourceIdentifier];
  [*(id *)(a1 + 32) setSourceIdentifier:v2];

  objc_msgSend(*(id *)(a1 + 32), "setWantsHoldMusic:", objc_msgSend(*(id *)(a1 + 40), "wantsHoldMusic"));
  objc_msgSend(*(id *)(a1 + 32), "setScreening:", objc_msgSend(*(id *)(a1 + 40), "sendToScreening"));
  objc_msgSend(*(id *)(a1 + 32), "setScreeningDueToUserInteraction:", objc_msgSend(*(id *)(a1 + 40), "screeningDueToUserInteraction"));
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

- (BOOL)supportsRecents
{
  if (!self->_supportsRecents) {
    return 0;
  }
  v2 = [(TUCall *)self provider];
  char v3 = [v2 supportsRecents];

  return v3;
}

- (BOOL)isOnHold
{
  int64_t v3 = [(TUCall *)self provisionalHoldStatus];
  if (v3 != 1) {
    LOBYTE(v3) = [(TUCall *)self provisionalHoldStatus] != 2
  }
              && [(TUCall *)self status] == 2;
  return v3;
}

- (void)setIsOnHold:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(TUCall *)self callCenter];
  id v6 = v5;
  if (v3) {
    [v5 holdCall:self];
  }
  else {
    [v5 unholdCall:self];
  }
}

- (void)hold
{
}

- (void)unhold
{
}

- (void)disconnectWithReason:(int)a3
{
  v5 = [(TUCall *)self callNotificationManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__TUCall_disconnectWithReason___block_invoke;
  v6[3] = &unk_1E58E6918;
  v6[4] = self;
  int v7 = a3;
  [v5 deferNotificationsUntilAfterPerformingBlock:v6];
}

uint64_t __31__TUCall_disconnectWithReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTransitionStatus:5];
  uint64_t result = [*(id *)(a1 + 32) disconnectedReason];
  if (!result)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 40);
    id v4 = *(void **)(a1 + 32);
    return [v4 setDisconnectedReason:v3];
  }
  return result;
}

- (void)resetProvisionalState
{
}

- (NSString)hardPauseDigitsDisplayString
{
  v2 = [(TUCall *)self hardPauseDigits];
  uint64_t v3 = TUHardPauseDigitsDisplayString(v2);

  return (NSString *)v3;
}

- (NSUUID)uniqueProxyIdentifierUUID
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  id v4 = [(TUCall *)self uniqueProxyIdentifier];
  v5 = (void *)[v3 initWithUUIDString:v4];

  return (NSUUID *)v5;
}

- (TUCallProvider)provider
{
  v2 = [(TUCall *)self callCenter];
  id v3 = [v2 providerManager];
  id v4 = [v3 defaultProvider];

  return (TUCallProvider *)v4;
}

- (int)service
{
  v2 = self;
  id v3 = [(TUCall *)self provider];
  LODWORD(v2) = +[TUCallProviderManager serviceForProvider:v3 video:[(TUCall *)v2 isVideo]];

  return (int)v2;
}

- (BOOL)wasDeclined
{
  return [(TUCall *)self disconnectedReason] == 2
      || [(TUCall *)self disconnectedReason] == 3
      || [(TUCall *)self disconnectedReason] == 4;
}

- (double)startTime
{
  v2 = [(TUCall *)self dateConnected];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (BOOL)hasSentInvitation
{
  v2 = [(TUCall *)self dateSentInvitation];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isConnecting
{
  v2 = [(TUCall *)self dateStartedConnecting];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isConnected
{
  v2 = [(TUCall *)self dateConnected];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isActive
{
  return [(TUCall *)self status] == 3
      || [(TUCall *)self status] == 4
      || [(TUCall *)self status] == 1;
}

- (BOOL)isIncoming
{
  return ![(TUCall *)self isOutgoing];
}

- (BOOL)isConferenced
{
  BOOL v3 = [(TUCall *)self callGroupUUID];
  if (v3)
  {
    double v4 = [(TUCall *)self provider];
    char v5 = [v4 isTelephonyProvider];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)resetWantsHoldMusic
{
}

- (void)suppressRingtone
{
}

- (void)suppressRingtoneDueToRemoteSuppression
{
  [(TUCall *)self setRingtoneSuppressedRemotely:1];

  [(TUCall *)self suppressRingtone];
}

- (BOOL)needsManualInCallSounds
{
  return 1;
}

- (BOOL)isWiFiCall
{
  if ([(TUCall *)self service] == 1) {
    return ![(TUCall *)self isUsingBaseband];
  }
  else {
    return 0;
  }
}

- (BOOL)isVoIPCall
{
  return ![(TUCall *)self isUsingBaseband];
}

- (BOOL)isRTT
{
  if ([(TUCall *)self ttyType] - 1 > 1) {
    return 0;
  }

  return [(TUCall *)self supportsTTYWithVoice];
}

- (BOOL)isTTY
{
  if ([(TUCall *)self ttyType] - 1 > 1) {
    return 0;
  }
  else {
    return ![(TUCall *)self supportsTTYWithVoice];
  }
}

- (BOOL)isRecording
{
  BOOL v3 = [(TUCall *)self recordingSession];

  if (!v3) {
    return 0;
  }
  double v4 = [(TUCall *)self recordingSession];
  BOOL v5 = [v4 recordingState] == 3;

  return v5;
}

- (int64_t)faceTimeTransportType
{
  BOOL v3 = [(TUCall *)self providerContext];
  double v4 = [v3 objectForKeyedSubscript:@"TUCallFaceTimeTransportTypeKey"];

  if (!v4) {
    return 0;
  }
  BOOL v5 = [(TUCall *)self providerContext];
  id v6 = [v5 objectForKeyedSubscript:@"TUCallFaceTimeTransportTypeKey"];
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (NSString)localizedHandoffRecipientDeviceCategory
{
  BOOL v3 = [(TUCall *)self providerContext];
  double v4 = [v3 objectForKeyedSubscript:@"TUCallFaceTimeLocalizedHandoffRecipientDeviceCategoryKey"];

  if (v4)
  {
    BOOL v5 = [(TUCall *)self providerContext];
    id v6 = [v5 objectForKeyedSubscript:@"TUCallFaceTimeLocalizedHandoffRecipientDeviceCategoryKey"];
    int64_t v7 = (void *)[v6 copy];
  }
  else
  {
    int64_t v7 = 0;
  }

  return (NSString *)v7;
}

- (NSNumber)handoffRecipientParticipant
{
  BOOL v3 = [(TUCall *)self providerContext];
  double v4 = [v3 objectForKeyedSubscript:@"TUCallFaceTimeHandoffRecipientParticipantKey"];

  if (v4)
  {
    BOOL v5 = [(TUCall *)self providerContext];
    id v6 = [v5 objectForKeyedSubscript:@"TUCallFaceTimeHandoffRecipientParticipantKey"];
    int64_t v7 = (void *)[v6 copy];
  }
  else
  {
    int64_t v7 = 0;
  }

  return (NSNumber *)v7;
}

- (int)ttyType
{
  return 0;
}

- (int64_t)bluetoothAudioFormat
{
  return 0;
}

- (TUDialRequest)dialRequestForRedial
{
  BOOL v3 = [TUDialRequest alloc];
  double v4 = [(TUCall *)self provider];
  BOOL v5 = [(TUDialRequest *)v3 initWithProvider:v4];

  if ([(TUDialRequest *)v5 service] != 1) {
    goto LABEL_7;
  }
  if ([(TUCall *)self isVoicemail])
  {
    uint64_t v6 = 2;
  }
  else
  {
    if (![(TUCall *)self isEmergency]) {
      goto LABEL_7;
    }
    uint64_t v6 = 1;
  }
  [(TUDialRequest *)v5 setDialType:v6];
LABEL_7:
  int64_t v7 = [(TUCall *)self handle];
  [(TUDialRequest *)v5 setHandle:v7];

  id v8 = [(TUCall *)self contactIdentifiers];
  id v9 = [v8 firstObject];
  [(TUDialRequest *)v5 setContactIdentifier:v9];

  BOOL v10 = [(TUCall *)self isVideo] || [(TUCall *)self isThirdPartyVideo];
  [(TUDialRequest *)v5 setVideo:v10];
  [(TUDialRequest *)v5 setSOS:[(TUCall *)self isSOS]];
  [(TUDialRequest *)v5 setRedial:1];
  v11 = [(TUCall *)self sourceIdentifier];
  [(TUDialRequest *)v5 setAudioSourceIdentifier:v11];

  [(TUDialRequest *)v5 setOriginatingUIType:25];
  [(TUDialRequest *)v5 setPerformDialAssist:0];
  [(TUDialRequest *)v5 setPerformLocalDialAssist:0];
  [(TUDialRequest *)v5 setDialAssisted:[(TUCall *)self wasDialAssisted]];
  [(TUDialRequest *)v5 setTtyType:TUDialRequestTTYTypeForTUCallTTYType([(TUCall *)self ttyType])];
  v12 = [(TUCall *)self localSenderIdentityUUID];
  [(TUDialRequest *)v5 setLocalSenderIdentityUUID:v12];

  v13 = [(TUCall *)self localSenderIdentityAccountUUID];
  [(TUDialRequest *)v5 setLocalSenderIdentityAccountUUID:v13];

  if ([(TUDialRequest *)v5 dialType] == 1)
  {
    v14 = [(TUDialRequest *)v5 validityErrorForEmergencyCall];

    if (v14)
    {
      v15 = TUDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        [(TUCall *)v5 dialRequestForRedial];
      }

      [(TUDialRequest *)v5 setDialType:0];
    }
  }

  return v5;
}

- (NSSet)remoteParticipantHandles
{
  BOOL v3 = [(TUCall *)self handle];
  double v4 = (void *)MEMORY[0x1E4F1CAD0];
  if (v3)
  {
    BOOL v5 = [(TUCall *)self handle];
    uint64_t v6 = [v4 setWithObject:v5];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v6;
}

- (NSString)announceProviderIdentifier
{
  return 0;
}

- (NSString)destinationID
{
  v2 = [(TUCall *)self handle];
  BOOL v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)callerNameFromNetwork
{
  return 0;
}

- (BOOL)hasBeenRedirected
{
  return 0;
}

- (TUHandle)handle
{
  return 0;
}

- (NSString)isoCountryCode
{
  return 0;
}

- (BOOL)shouldDisplayLocationIfAvailable
{
  return [(TUCall *)self service] == 1;
}

- (BOOL)isHostedOnCurrentDevice
{
  return 1;
}

- (NSUUID)callGroupUUID
{
  return 0;
}

- (TUSenderIdentity)localSenderIdentity
{
  BOOL v3 = [(TUCall *)self localSenderIdentityAccountUUID];
  if (v3)
  {
    double v4 = [(TUCall *)self provider];
    BOOL v5 = [v4 senderIdentityForAccountUUID:v3];
  }
  else
  {
    BOOL v5 = 0;
  }

  return (TUSenderIdentity *)v5;
}

- (NSUUID)localSenderIdentityUUID
{
  return 0;
}

- (NSUUID)localSenderIdentityAccountUUID
{
  return 0;
}

- (BOOL)isEqualToCall:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUCall *)self uniqueProxyIdentifier];
  uint64_t v6 = [v4 uniqueProxyIdentifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TUCall *)self isEqualToCall:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(TUCall *)self uniqueProxyIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (double)callDuration
{
  unint64_t v3 = [(TUCall *)self dateScreeningEnded];
  if (!v3)
  {
    unint64_t v3 = [(TUCall *)self dateConnected];
    if (!v3) {
      return 0.0;
    }
  }
  id v4 = [(TUCall *)self dateEnded];

  if (v4)
  {
    BOOL v5 = [(TUCall *)self dateEnded];
    [v5 timeIntervalSinceDate:v3];
    double v7 = v6;
  }
  else
  {
    [v3 timeIntervalSinceNow];
    double v7 = -v8;
  }

  return v7;
}

- (NSString)callDurationString
{
  [(TUCall *)self callDuration];
  if (v2 == 0.0)
  {
    double v6 = 0;
    goto LABEL_10;
  }
  unsigned int v3 = vcvtmd_s64_f64(v2);
  if ((int)v3 < 1)
  {
    uint64_t v5 = 0;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = v3 % 0xE10 / 0x3C;
    if (v3 > 0xE0F)
    {
      objc_msgSend(NSString, "localizedStringWithFormat:", @"%02d:%02d:%02d", v3 / 0xE10uLL, v4, v3 % 0xE10 % 0x3C);
      goto LABEL_9;
    }
    uint64_t v5 = v3 % 0xE10 % 0x3C;
  }
  objc_msgSend(NSString, "localizedStringWithFormat:", @"%02d:%02d", v4, v5, v8);
  double v6 = LABEL_9:;
LABEL_10:

  return (NSString *)v6;
}

- (NSString)reminderString
{
  if ([(TUCall *)self isVideo])
  {
    unsigned int v3 = TUBundle();
    uint64_t v4 = v3;
    uint64_t v5 = @"FACETIME_REMINDER";
  }
  else
  {
    int v6 = [(TUCall *)self service];
    unsigned int v3 = TUBundle();
    uint64_t v4 = v3;
    if (v6 == 1) {
      uint64_t v5 = @"TELEPHONY_REMINDER";
    }
    else {
      uint64_t v5 = @"FACETIME_AUDIO_REMINDER";
    }
  }
  double v7 = [v3 localizedStringForKey:v5 value:&stru_1EECEA668 table:@"TelephonyUtilities"];

  return (NSString *)v7;
}

- (int)status
{
  int v3 = [(TUCall *)self callStatus];
  int v4 = [(TUCall *)self transitionStatus];
  if (![(TUCall *)self isPTT] && (v3 <= 4 && v4 == 5 || v3 == 4 && v4 == 1)) {
    return v4;
  }
  return v3;
}

- (int)callStatus
{
  return 0;
}

- (BOOL)isReceivingTransmission
{
  return 1;
}

- (BOOL)isSendingTransmission
{
  return 1;
}

- (BOOL)statusIsProvisional
{
  return [(TUCall *)self provisionalHoldStatus] != 0;
}

- (BOOL)isJunk
{
  int v3 = objc_msgSend((id)objc_opt_class(), "isJunkConfidenceLevelJunk:", -[TUCall junkConfidence](self, "junkConfidence"));
  if (v3) {
    LOBYTE(v3) = ![(TUCall *)self isKnownCaller];
  }
  return v3;
}

- (BOOL)isFromSiri
{
  double v2 = [(TUCall *)self sourceIdentifier];
  char v3 = [v2 isEqual:@"TUCallSourceIdentifierHeySiri"];

  return v3;
}

- (BOOL)supportsSimultaneousVoiceAndData
{
  char v3 = [(TUCall *)self provider];
  if ([v3 isTelephonyProvider])
  {
    int v4 = [(TUCall *)self localSenderIdentityUUID];
    BOOL v5 = +[TUCallCapabilities isSimultaneousVoiceAndDataSupportedForSIMWithUUID:v4];
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)shouldPlayDTMFTone
{
  return [(TUCall *)self status] == 3 || [(TUCall *)self status] == 1;
}

- (BOOL)supportsDTMFTones
{
  double v2 = [(TUCall *)self model];
  char v3 = [v2 supportsDTMF];

  return v3;
}

- (NSString)audioCategory
{
  return 0;
}

- (NSString)audioMode
{
  return 0;
}

- (BOOL)setMuted:(BOOL)a3
{
  return 1;
}

- (NSData)localFrequency
{
  return 0;
}

- (NSData)remoteFrequency
{
  return 0;
}

- (TUCallDisplayContext)displayContext
{
  return 0;
}

- (NSString)contactIdentifier
{
  double v2 = [(TUCall *)self displayContext];
  char v3 = [v2 contactIdentifiers];
  int v4 = [v3 firstObject];

  return (NSString *)v4;
}

- (NSArray)contactIdentifiers
{
  double v2 = [(TUCall *)self displayContext];
  char v3 = [v2 contactIdentifiers];

  return (NSArray *)v3;
}

- (NSString)displayName
{
  double v2 = [(TUCall *)self displayContext];
  char v3 = [v2 name];

  if ([v3 length])
  {
    qmemcpy(v9, ", * ", sizeof(v9));
    int v4 = NSString;
    BOOL v5 = [NSString stringWithCharacters:&v9[1] length:1];
    int v6 = [NSString stringWithCharacters:v9 length:1];
    uint64_t v7 = [v4 stringWithFormat:@"%@%@%@", v5, v3, v6];

    char v3 = (void *)v7;
  }

  return (NSString *)v3;
}

- (NSString)displayFirstName
{
  char v3 = [(TUCall *)self displayContext];
  int v4 = [v3 personNameComponents];
  BOOL v5 = [v4 givenName];
  int v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [(TUCall *)self displayContext];
    id v7 = [v8 name];
  }

  return (NSString *)v7;
}

- (NSString)suggestedDisplayName
{
  double v2 = [(TUCall *)self displayContext];
  char v3 = [v2 suggestedName];

  return (NSString *)v3;
}

- (NSString)localizedLabel
{
  double v2 = [(TUCall *)self displayContext];
  char v3 = [v2 label];

  return (NSString *)v3;
}

- (NSString)callDirectoryName
{
  char v3 = [(TUCall *)self displayContext];
  uint64_t v4 = [v3 callDirectoryLocalizedExtensionContainingAppName];
  if (!v4)
  {
    v12 = 0;
    goto LABEL_5;
  }
  BOOL v5 = (void *)v4;
  int v6 = [(TUCall *)self displayContext];
  id v7 = [v6 callDirectoryLabel];

  if (v7)
  {
    uint64_t v8 = NSString;
    char v3 = [(TUCall *)self displayContext];
    id v9 = [v3 callDirectoryLocalizedExtensionContainingAppName];
    BOOL v10 = [(TUCall *)self displayContext];
    v11 = [v10 callDirectoryLabel];
    v12 = [v8 stringWithFormat:@"%@: %@", v9, v11];

LABEL_5:
    goto LABEL_7;
  }
  v12 = 0;
LABEL_7:

  return (NSString *)v12;
}

- (int64_t)callDirectoryIdentityType
{
  double v2 = [(TUCall *)self displayContext];
  int64_t v3 = [v2 callDirectoryIdentityType];

  return v3;
}

- (NSString)callDirectoryIdentityExtension
{
  double v2 = [(TUCall *)self displayContext];
  int64_t v3 = [v2 callDirectoryLocalizedExtensionContainingAppName];

  return (NSString *)v3;
}

- (NSString)companyName
{
  double v2 = [(TUCall *)self displayContext];
  int64_t v3 = [v2 companyName];

  return (NSString *)v3;
}

- (NSString)companyDepartment
{
  double v2 = [(TUCall *)self displayContext];
  int64_t v3 = [v2 companyDepartment];

  return (NSString *)v3;
}

- (NSURL)imageURL
{
  if ([(TUCall *)self isPTT])
  {
    int64_t v3 = [(TUCall *)self channelImageURL];
  }
  else
  {
    uint64_t v4 = [(TUCall *)self displayContext];
    int64_t v3 = [v4 companyLogoURL];
  }

  return (NSURL *)v3;
}

- (int)abUID
{
  double v2 = [(TUCall *)self displayContext];
  int v3 = [v2 legacyAddressBookIdentifier];

  return v3;
}

- (int)callRelaySupport
{
  return 0;
}

- (BOOL)hasRelaySupport:(int)a3
{
  return [(TUCall *)self callRelaySupport] >= a3;
}

- (NSDictionary)endedReasonUserInfo
{
  return 0;
}

+ (id)_supplementalDialTelephonyCallStringForLocString:(id)a3 destination:(id)a4 isPhoneNumber:(BOOL)a5 includeFaceTimeAudio:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  if (!+[TUCallCapabilities supportsTelephonyCalls]
    || +[TUCallCapabilities supportsPrimaryCalling])
  {
    v11 = 0;
    goto LABEL_23;
  }
  v12 = [MEMORY[0x1E4F28E78] stringWithString:v9];
  v13 = [MEMORY[0x1E4F1CA48] array];
  if (v10)
  {
    if (v7) {
      v14 = @"_TO_NUMBER_%@";
    }
    else {
      v14 = @"_TO_CONTACT_%@";
    }
    [v12 appendString:v14];
    [v13 addObject:v10];
  }
  if (+[TUCallCapabilities isDirectTelephonyCallingCurrentlyAvailable])
  {
    v15 = @"_CARRIER";
  }
  else
  {
    if (!+[TUCallCapabilities areRelayCallingFeaturesEnabled])goto LABEL_14; {
    v15 = @"_RELAY";
    }
  }
  [v12 appendString:v15];
LABEL_14:
  if (v6) {
    [v12 appendString:@"_FTA"];
  }
  if ([v13 count] == 1)
  {
    v16 = NSString;
    v17 = TUBundle();
    uint64_t v18 = TUStringKeyForPlatform((uint64_t)v12);
    v19 = [v17 localizedStringForKey:v18 value:&stru_1EECEA668 table:@"TelephonyUtilities"];
    v20 = [v13 objectAtIndex:0];
    v11 = objc_msgSend(v16, "stringWithFormat:", v19, v20);

LABEL_21:
    goto LABEL_22;
  }
  if (![v13 count])
  {
    v17 = TUBundle();
    uint64_t v18 = TUStringKeyForPlatform((uint64_t)v12);
    v11 = [v17 localizedStringForKey:v18 value:&stru_1EECEA668 table:@"TelephonyUtilities"];
    goto LABEL_21;
  }
  v11 = 0;
LABEL_22:

LABEL_23:

  return v11;
}

+ (id)supplementalDialTelephonyCallStringForDestination:(id)a3 isPhoneNumber:(BOOL)a4
{
  return (id)[a1 _supplementalDialTelephonyCallStringForLocString:@"DIAL_CALL" destination:a3 isPhoneNumber:a4 includeFaceTimeAudio:0];
}

+ (id)supplementalDialTelephonyCallString
{
  return (id)[a1 _supplementalDialTelephonyCallStringForLocString:@"DIAL_CALL" destination:0 isPhoneNumber:0 includeFaceTimeAudio:0];
}

+ (id)faceTimeSupplementalDialTelephonyCallStringIncludingFTA:(BOOL)a3
{
  return (id)[a1 _supplementalDialTelephonyCallStringForLocString:@"DIAL_CALL_FACETIME" destination:0 isPhoneNumber:0 includeFaceTimeAudio:a3];
}

- (id)serviceDisplayString
{
  int v3 = [(TUCall *)self provider];
  int v4 = [v3 isFaceTimeProvider];

  if (!v4)
  {
    v11 = 0;
    goto LABEL_15;
  }
  if ([(TUCall *)self isVideo])
  {
    if ([(TUCall *)self isConversation])
    {
      BOOL v5 = [(TUCall *)self callCenter];
      BOOL v6 = [v5 activeConversationForCall:self];

      if (v6)
      {
        uint64_t v7 = [v6 resolvedAudioVideoMode];
        uint64_t v8 = TUBundle();
        id v9 = v8;
        if (v7 == 2) {
          id v10 = @"FACETIME_SERVICE";
        }
        else {
          id v10 = @"FACETIME_AUDIO_SERVICE";
        }
      }
      else
      {
        uint64_t v8 = TUBundle();
        id v9 = v8;
        id v10 = @"FACETIME_SERVICE";
      }
      v11 = [v8 localizedStringForKey:v10 value:&stru_1EECEA668 table:@"TelephonyUtilities"];

      goto LABEL_14;
    }
    v12 = TUBundle();
    BOOL v6 = v12;
    v13 = @"FACETIME_SERVICE";
  }
  else
  {
    v12 = TUBundle();
    BOOL v6 = v12;
    v13 = @"FACETIME_AUDIO_SERVICE";
  }
  v11 = [v12 localizedStringForKey:v13 value:&stru_1EECEA668 table:@"TelephonyUtilities"];
LABEL_14:

LABEL_15:

  return v11;
}

- (id)supplementalInCallString
{
  if ([(TUCall *)self isHostedOnCurrentDevice])
  {
    int v3 = 0;
  }
  else
  {
    BOOL v4 = [(TUCall *)self isOutgoing];
    BOOL v5 = TUBundle();
    BOOL v6 = v5;
    if (v4) {
      uint64_t v7 = @"IN_CALL_OUTGOING_RELAY";
    }
    else {
      uint64_t v7 = @"IN_CALL_INCOMING_RELAY";
    }
    int v3 = [v5 localizedStringForKey:v7 value:&stru_1EECEA668 table:@"TelephonyUtilities"];
  }

  return v3;
}

- (id)errorAlertTitle
{
  int v3 = 0;
  switch([(TUCall *)self disconnectedReason])
  {
    case 8:
      TUBundle();
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BOOL v5 = @"ALERT_RELAY_FAILED_CONFERENCE_FAILED_TITLE";
      goto LABEL_29;
    case 9:
    case 0xC:
      TUBundle();
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BOOL v5 = @"ALERT_RELAY_FAILED_RELAY_DEVICE_UNAVAILABLE_TITLE";
      goto LABEL_29;
    case 0xA:
      TUBundle();
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BOOL v5 = @"ALERT_HOST_DEVICE_BUSY_TITLE";
      goto LABEL_29;
    case 0xB:
    case 0x2E:
      TUBundle();
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0xD:
      BOOL v9 = +[TUCallCapabilities isThumperCallingEnabled];
      TUBundle();
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v9) {
LABEL_7:
      }
        BOOL v5 = @"ALERT_GENERIC_FAILURE_TITLE";
      else {
        BOOL v5 = @"ALERT_RELAY_FAILED_NO_REMOTE_NETWORK_TITLE";
      }
      goto LABEL_29;
    case 0xE:
      if ([(TUCall *)self isVideo] && [(TUCall *)self isIncoming])
      {
        TUBundle();
        id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        BOOL v4 = v10;
        v11 = @"ALERT_GENERIC_FAILURE_TITLE_IOS";
LABEL_26:
        int v3 = [(__CFString *)v10 localizedStringForKey:v11 value:&stru_1EECEA668 table:@"TelephonyUtilities"];
LABEL_31:
      }
      else
      {
        int v3 = 0;
      }
LABEL_32:
      return v3;
    case 0x10:
      TUBundle();
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BOOL v5 = @"ALERT_CLIENT_DEVICE_BUSY_TITLE";
LABEL_29:
      TUStringKeyForPlatform((uint64_t)v5);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v13 = v4;
      v15 = v14;
      goto LABEL_30;
    case 0x1A:
      TUBundle();
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BOOL v4 = v10;
      v11 = @"ALERT_KICKED_OUT_TITLE";
      goto LABEL_26;
    case 0x1B:
      TUBundle();
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BOOL v4 = v10;
      v11 = @"ALERT_REJECTED_TITLE";
      goto LABEL_26;
    case 0x1D:
      TUBundle();
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BOOL v4 = v10;
      v11 = @"ALERT_LINKS_DISABLED_TITLE";
      goto LABEL_26;
    case 0x1E:
    case 0x31:
      BOOL v6 = NSString;
      TUBundle();
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [(__CFString *)v4 localizedStringForKey:@"NO_DESTINATIONS_AVAILABLE_TITLE_%@" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
      uint64_t v8 = [(TUCall *)self displayName];
      int v3 = objc_msgSend(v6, "stringWithFormat:", v7, v8);

      goto LABEL_31;
    case 0x23:
      TUBundle();
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BOOL v4 = v10;
      v11 = @"ALERT_OFFRAMPED_TITLE";
      goto LABEL_26;
    case 0x26:
      BOOL v4 = [(TUCall *)self dateConnected];
      TUBundle();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v4) {
        v15 = @"ALERT_BLOCKED_REMOTE_PARTICIPANT_REMOTE_JOINING_TITLE";
      }
      else {
        v15 = @"ALERT_BLOCKED_REMOTE_PARTICIPANT_SELF_JOINING_TITLE";
      }
      goto LABEL_30;
    case 0x2A:
      TUBundle();
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BOOL v4 = v10;
      v11 = @"TRAVEL_MODE_TITLE";
      goto LABEL_26;
    case 0x2B:
      TUBundle();
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BOOL v4 = v10;
      v11 = @"GUEST_MODE_TITLE";
      goto LABEL_26;
    case 0x2C:
      BOOL v4 = [(TUCall *)self featureFlags];
      int v12 = [(__CFString *)v4 appleAccountRebrandEnabled];
      TUBundle();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v12) {
        v15 = @"NOT_SIGNED_IN_TITLE_APPLEACCOUNT";
      }
      else {
        v15 = @"NOT_SIGNED_IN_TITLE";
      }
LABEL_30:
      int v3 = [(__CFString *)v13 localizedStringForKey:v15 value:&stru_1EECEA668 table:@"TelephonyUtilities"];

      goto LABEL_31;
    case 0x2D:
      TUBundle();
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BOOL v4 = v10;
      v11 = @"APP_NOT_INSTALLED_TITLE";
      goto LABEL_26;
    default:
      goto LABEL_32;
  }
}

- (id)errorAlertMessage
{
  int v3 = [(TUCall *)self disconnectedReason];
  BOOL v4 = 0;
  switch(v3)
  {
    case 9:
      BOOL v5 = [(TUCall *)self featureFlags];
      int v6 = [v5 appleAccountRebrandEnabled];
      uint64_t v7 = TUBundle();
      if (v6) {
        uint64_t v8 = @"ALERT_RELAY_FAILED_RELAY_DEVICE_UNAVAILABLE_ACCOUNTS_MESSAGE_APPLEACCOUNT";
      }
      else {
        uint64_t v8 = @"ALERT_RELAY_FAILED_RELAY_DEVICE_UNAVAILABLE_ACCOUNTS_MESSAGE";
      }
      uint64_t v9 = TUStringKeyForProduct(v8);
      goto LABEL_19;
    case 10:
      BOOL v5 = TUBundle();
      v14 = @"ALERT_HOST_DEVICE_BUSY_MESSAGE";
      goto LABEL_21;
    case 11:
    case 14:
    case 15:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 31:
    case 32:
    case 33:
    case 34:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
      goto LABEL_31;
    case 12:
      BOOL v5 = TUBundle();
      v14 = @"ALERT_RELAY_FAILED_RELAY_DEVICE_UNAVAILABLE_ENABLE_MESSAGE";
      goto LABEL_21;
    case 13:
      if (+[TUCallCapabilities isThumperCallingEnabled])
      {
        BOOL v5 = [(id)CUTWeakLinkClass() sharedInstance];
        int v17 = [v5 wiFiActiveAndReachable];
        uint64_t v7 = TUBundle();
        if (v17) {
          uint64_t v18 = @"ALERT_THUMPER_FAILED_CALLING_NOT_AVAILABLE_MESSAGE";
        }
        else {
          uint64_t v18 = @"ALERT_THUMPER_FAILED_NO_NETWORK_MESSAGE";
        }
        uint64_t v9 = TUStringKeyForNetwork(v18);
LABEL_19:
        v19 = (void *)v9;
        BOOL v4 = [v7 localizedStringForKey:v9 value:&stru_1EECEA668 table:@"TelephonyUtilities"];
      }
      else
      {
        BOOL v5 = TUBundle();
        uint64_t v20 = TUStringKeyForNetworkAndProduct(@"ALERT_RELAY_FAILED_NO_REMOTE_NETWORK_MESSAGE");
LABEL_22:
        uint64_t v7 = (void *)v20;
        BOOL v4 = [v5 localizedStringForKey:v20 value:&stru_1EECEA668 table:@"TelephonyUtilities"];
      }

      goto LABEL_30;
    case 16:
      BOOL v5 = TUBundle();
      v14 = @"ALERT_CLIENT_DEVICE_BUSY_MESSAGE";
LABEL_21:
      uint64_t v20 = TUStringKeyForProduct(v14);
      goto LABEL_22;
    case 26:
      v15 = TUBundle();
      BOOL v5 = v15;
      v16 = @"ALERT_KICKED_OUT_MESSAGE";
      goto LABEL_29;
    case 27:
      v15 = TUBundle();
      BOOL v5 = v15;
      v16 = @"ALERT_REJECTED_MESSAGE";
      goto LABEL_29;
    case 28:
      v15 = TUBundle();
      BOOL v5 = v15;
      v16 = @"ALERT_INVALID_LINK_MESSAGE";
      goto LABEL_29;
    case 29:
      v15 = TUBundle();
      BOOL v5 = v15;
      v16 = @"ALERT_LINKS_DISABLED_MESSAGE";
      goto LABEL_29;
    case 30:
      goto LABEL_7;
    case 35:
      v15 = TUBundle();
      BOOL v5 = v15;
      v16 = @"ALERT_OFFRAMPED_MESSAGE";
      goto LABEL_29;
    case 42:
      v15 = TUBundle();
      BOOL v5 = v15;
      v16 = @"TRAVEL_MODE_MESSAGE";
      goto LABEL_29;
    case 43:
      v15 = TUBundle();
      BOOL v5 = v15;
      v16 = @"GUEST_MODE_MESSAGE";
      goto LABEL_29;
    case 44:
      v15 = TUBundle();
      BOOL v5 = v15;
      v16 = @"NOT_SIGNED_IN_MESSAGE";
      goto LABEL_29;
    case 45:
      v15 = TUBundle();
      BOOL v5 = v15;
      v16 = @"APP_NOT_INSTALLED_MESSAGE";
LABEL_29:
      BOOL v4 = [v15 localizedStringForKey:v16 value:&stru_1EECEA668 table:@"TelephonyUtilities"];
      goto LABEL_30;
    default:
      if (v3 != 49) {
        goto LABEL_31;
      }
LABEL_7:
      id v10 = NSString;
      BOOL v5 = TUBundle();
      v11 = [v5 localizedStringForKey:@"NO_DESTINATIONS_AVAILABLE_MESSAGE_%@" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
      int v12 = [(TUCall *)self handle];
      v13 = [v12 value];
      BOOL v4 = objc_msgSend(v10, "stringWithFormat:", v11, v13);

LABEL_30:
LABEL_31:
      return v4;
  }
}

- (void)updateWithCall:(id)a3
{
  id v4 = a3;
  [(TUCall *)self resetProvisionalState];
  self->_disconnectedReason = [v4 disconnectedReason];
  self->_filteredOutReason = [v4 filteredOutReason];
  self->_supportsRecents = [v4 supportsRecents];
  BOOL v5 = [v4 dateAnsweredOrDialed];
  dateAnsweredOrDialed = self->_dateAnsweredOrDialed;
  self->_dateAnsweredOrDialed = v5;

  uint64_t v7 = [v4 dateCreated];
  dateCreated = self->_dateCreated;
  self->_dateCreated = v7;

  uint64_t v9 = [v4 dateSentInvitation];
  dateSentInvitation = self->_dateSentInvitation;
  self->_dateSentInvitation = v9;

  v11 = [v4 dateStartedConnecting];
  dateStartedConnecting = self->_dateStartedConnecting;
  self->_dateStartedConnecting = v11;

  v13 = [v4 dateConnected];
  dateConnected = self->_dateConnected;
  self->_dateConnected = v13;

  v15 = [v4 dateScreeningEnded];
  dateScreeningEnded = self->_dateScreeningEnded;
  self->_dateScreeningEnded = v15;

  int v17 = [v4 dateEnded];
  dateEnded = self->_dateEnded;
  self->_dateEnded = v17;

  self->_wantsHoldMusic = [v4 wantsHoldMusic];
  self->_endpointOnCurrentDevice = [v4 isEndpointOnCurrentDevice];
  self->_localUserInHomeCountry = [v4 isLocalUserInHomeCountry];
  self->_answeringMachineAvailable = [v4 isAnsweringMachineAvailable];
  self->_nondisclosedGreeting = [v4 hasNondisclosedGreeting];
  self->_identifiedSpamInCallerName = [v4 hasIdentifiedSpamInCallerName];
  self->_screening = [v4 isScreening];
  self->_screeningDueToUserInteraction = [v4 isScreeningDueToUserInteraction];
  self->_wasScreened = [v4 wasScreened];
  self->_screeningAnnouncementHasFinished = [v4 screeningAnnouncementHasFinished];
  self->_shouldSuppressRingtone = [v4 shouldSuppressRingtone];
  v19 = [v4 sourceIdentifier];
  uint64_t v20 = (NSString *)[v19 copy];
  sourceIdentifier = self->_sourceIdentifier;
  self->_sourceIdentifier = v20;

  self->_wasDialAssisted = [v4 wasDialAssisted];
  self->_faceTimeIDStatus = [v4 faceTimeIDStatus];
  self->_hardPauseDigitsState = [v4 hardPauseDigitsState];
  v22 = [v4 hardPauseDigits];
  v23 = (NSString *)[v22 copy];
  hardPauseDigits = self->_hardPauseDigits;
  self->_hardPauseDigits = v23;

  self->_wasPulledToCurrentDevice = [v4 wasPulledToCurrentDevice];
  self->_soundRegion = [v4 soundRegion];
  v25 = [v4 model];
  v26 = (TUCallModel *)[v25 copy];
  model = self->_model;
  self->_model = v26;

  self->_supportsDTMFUpdates = [v4 supportsDTMFUpdates];
  self->_video = [v4 isVideo];
  self->_verificationStatus = [v4 verificationStatus];
  self->_priority = [v4 priority];
  self->_originatingUIType = [v4 originatingUIType];
  self->_liveVoicemailUnavailableReason = [v4 liveVoicemailUnavailableReason];
  self->_junkConfidence = [v4 junkConfidence];
  self->_identificationCategory = [v4 identificationCategory];
  self->_isKnownCaller = [v4 isKnownCaller];
  self->_joinedFromLink = [v4 joinedFromLink];
  self->_callSubType = [v4 callSubType];
  self->_hasEmergencyVideoStream = [v4 hasEmergencyVideoStream];
  id v28 = [v4 emergencyMediaItems];
  v29 = (NSSet *)[v28 copy];
  emergencyMediaItems = self->_emergencyMediaItems;
  self->_emergencyMediaItems = v29;

  v31 = [v4 recordingSession];
  v32 = (TUCallRecordingSession *)[v31 copy];
  recordingSession = self->_recordingSession;
  self->_recordingSession = v32;

  v34 = [v4 blockedByExtension];
  v35 = (NSString *)[v34 copy];
  blockedByExtension = self->_blockedByExtension;
  self->_blockedByExtension = v35;

  v37 = [v4 callDirectoryIdentityExtension];
  v38 = (NSString *)[v37 copy];
  callDirectoryIdentityExtension = self->_callDirectoryIdentityExtension;
  self->_callDirectoryIdentityExtension = v38;

  self->_screenSharingIntention = [v4 screenSharingIntention];
  [v4 hostCreationTime];
  self->_hostCreationTime = v40;
  [v4 hostMessageSendTime];
  self->_hostMessageSendTime = v41;
  [v4 clientMessageReceiveTime];
  self->_clientMessageReceiveTime = v42;
  self->_answeringMachineStreamToken = [v4 answeringMachineStreamToken];
  self->_providerErrorCode = [v4 providerErrorCode];
  self->_providerEndedReason = [v4 providerEndedReason];
  unint64_t v43 = [v4 screenSharingType];

  self->_screenSharingType = v43;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCall)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueProxyIdentifier"];
  int v6 = [(TUCall *)self initWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceIdentifier"];
    uint64_t v8 = [v7 copy];
    sourceIdentifier = v6->_sourceIdentifier;
    v6->_sourceIdentifier = (NSString *)v8;

    v6->_disconnectedReason = [v4 decodeInt32ForKey:@"disconnectedReason"];
    v6->_filteredOutReason = [v4 decodeInt32ForKey:@"filteredOutReason"];
    v6->_supportsRecents = [v4 decodeBoolForKey:@"supportsRecents"];
    v6->_faceTimeIDStatus = [v4 decodeInt32ForKey:@"faceTimeIDStatus"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateCreated"];
    dateCreated = v6->_dateCreated;
    v6->_dateCreated = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateAnsweredOrDialed"];
    dateAnsweredOrDialed = v6->_dateAnsweredOrDialed;
    v6->_dateAnsweredOrDialed = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateSentInvitation"];
    dateSentInvitation = v6->_dateSentInvitation;
    v6->_dateSentInvitation = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateStartedConnecting"];
    dateStartedConnecting = v6->_dateStartedConnecting;
    v6->_dateStartedConnecting = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateConnected"];
    dateConnected = v6->_dateConnected;
    v6->_dateConnected = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateScreeningEnded"];
    dateScreeningEnded = v6->_dateScreeningEnded;
    v6->_dateScreeningEnded = (NSDate *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateEnded"];
    dateEnded = v6->_dateEnded;
    v6->_dateEnded = (NSDate *)v22;

    v6->_wasDialAssisted = [v4 decodeBoolForKey:@"wasDialAssisted"];
    v6->_wantsHoldMusic = [v4 decodeBoolForKey:@"wantsHoldMusic"];
    v6->_endpointOnCurrentDevice = [v4 decodeBoolForKey:@"endpointOnCurrentDevice"];
    v6->_localUserInHomeCountry = [v4 decodeBoolForKey:@"localUserInHomeCountry"];
    v6->_answeringMachineAvailable = [v4 decodeBoolForKey:@"answeringMachineAvailable"];
    v6->_nondisclosedGreeting = [v4 decodeBoolForKey:@"nondisclosedGreeting"];
    v6->_identifiedSpamInCallerName = [v4 decodeBoolForKey:@"identifiedSpamInCallerName"];
    v6->_screening = [v4 decodeBoolForKey:@"screening"];
    v6->_screeningDueToUserInteraction = [v4 decodeBoolForKey:@"screeningDueToUserInteraction"];
    v6->_wasScreened = [v4 decodeBoolForKey:@"wasScreened"];
    v6->_screeningAnnouncementHasFinished = [v4 decodeBoolForKey:@"screeningAnnouncementHasFinished"];
    v6->_shouldSuppressRingtone = [v4 decodeBoolForKey:@"shouldSuppressRingtone"];
    v6->_hardPauseDigitsState = [v4 decodeInt32ForKey:@"hardPauseDigitsState"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hardPauseDigits"];
    hardPauseDigits = v6->_hardPauseDigits;
    v6->_hardPauseDigits = (NSString *)v24;

    v6->_wasPulledToCurrentDevice = [v4 decodeBoolForKey:@"wasPulledToCurrentDevice"];
    v6->_soundRegion = [v4 decodeIntegerForKey:@"soundRegion"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
    model = v6->_model;
    v6->_model = (TUCallModel *)v26;

    v6->_supportsDTMFUpdates = [v4 decodeBoolForKey:@"supportsDTMFUpdates"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"videoCallAttributes"];
    videoCallAttributes = v6->_videoCallAttributes;
    v6->_videoCallAttributes = (TUVideoCallAttributes *)v28;

    v6->_verificationStatus = (int)[v4 decodeInt32ForKey:@"verificationStatus"];
    v6->_priority = (int)[v4 decodeInt32ForKey:@"priority"];
    v6->_originatingUIType = [v4 decodeInt32ForKey:@"originatingUIType"];
    v6->_liveVoicemailUnavailableReason = (int)[v4 decodeInt32ForKey:@"liveVoicemailUnavailableReason"];
    v6->_junkConfidence = (int)[v4 decodeInt32ForKey:@"junkConfidence"];
    v6->_identificationCategory = (int)[v4 decodeInt32ForKey:@"identificationCategory"];
    v6->_isKnownCaller = [v4 decodeBoolForKey:@"isKnownCaller"];
    v6->_joinedFromLink = [v4 decodeBoolForKey:@"joinedFromLink"];
    v6->_answeringMachineStreamToken = (int)[v4 decodeIntForKey:@"answeringMachineStreamToken"];
    v6->_callSubType = [v4 decodeIntForKey:@"callSubType"];
    v6->_screenSharingIntention = (int)[v4 decodeIntForKey:@"screenSharingIntention"];
    v6->_hasEmergencyVideoStream = [v4 decodeBoolForKey:@"hasEmergencyVideoStream"];
    objc_super v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"emergencyMediaItems"];
    emergencyMediaItems = v6->_emergencyMediaItems;
    v6->_emergencyMediaItems = (NSSet *)v33;

    v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blockedByExtension"];
    uint64_t v36 = [v35 copy];
    blockedByExtension = v6->_blockedByExtension;
    v6->_blockedByExtension = (NSString *)v36;

    v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callDirectoryIdentityExtension"];
    uint64_t v39 = [v38 copy];
    callDirectoryIdentityExtension = v6->_callDirectoryIdentityExtension;
    v6->_callDirectoryIdentityExtension = (NSString *)v39;

    [v4 decodeDoubleForKey:@"hostCreationTime"];
    v6->_hostCreationTime = v41;
    [v4 decodeDoubleForKey:@"hostMessageSendTime"];
    v6->_hostMessageSendTime = v42;
    [v4 decodeDoubleForKey:@"clientMessageReceiveTime"];
    v6->_clientMessageReceiveTime = v43;
    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordingSession"];
    recordingSession = v6->_recordingSession;
    v6->_recordingSession = (TUCallRecordingSession *)v44;

    v6->_providerErrorCode = (int)[v4 decodeIntForKey:@"providerErrorCode"];
    v6->_providerEndedReason = (int)[v4 decodeIntForKey:@"providerEndedReason"];
    v6->_screenSharingType = [v4 decodeIntegerForKey:@"screenSharingType"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueProxyIdentifier = self->_uniqueProxyIdentifier;
  id v5 = a3;
  [v5 encodeObject:uniqueProxyIdentifier forKey:@"uniqueProxyIdentifier"];
  [v5 encodeObject:self->_sourceIdentifier forKey:@"sourceIdentifier"];
  [v5 encodeInt32:self->_disconnectedReason forKey:@"disconnectedReason"];
  [v5 encodeInt32:self->_filteredOutReason forKey:@"filteredOutReason"];
  [v5 encodeBool:self->_supportsRecents forKey:@"supportsRecents"];
  [v5 encodeInt32:self->_faceTimeIDStatus forKey:@"faceTimeIDStatus"];
  [v5 encodeObject:self->_dateCreated forKey:@"dateCreated"];
  [v5 encodeObject:self->_dateAnsweredOrDialed forKey:@"dateAnsweredOrDialed"];
  [v5 encodeObject:self->_dateSentInvitation forKey:@"dateSentInvitation"];
  [v5 encodeObject:self->_dateStartedConnecting forKey:@"dateStartedConnecting"];
  [v5 encodeObject:self->_dateConnected forKey:@"dateConnected"];
  [v5 encodeObject:self->_dateScreeningEnded forKey:@"dateScreeningEnded"];
  [v5 encodeObject:self->_dateEnded forKey:@"dateEnded"];
  [v5 encodeBool:self->_wasDialAssisted forKey:@"wasDialAssisted"];
  [v5 encodeInt32:self->_transitionStatus forKey:@"transitionStatus"];
  [v5 encodeBool:self->_wantsHoldMusic forKey:@"wantsHoldMusic"];
  [v5 encodeBool:self->_endpointOnCurrentDevice forKey:@"endpointOnCurrentDevice"];
  [v5 encodeBool:self->_localUserInHomeCountry forKey:@"localUserInHomeCountry"];
  [v5 encodeBool:self->_answeringMachineAvailable forKey:@"answeringMachineAvailable"];
  [v5 encodeBool:self->_nondisclosedGreeting forKey:@"nondisclosedGreeting"];
  [v5 encodeBool:self->_identifiedSpamInCallerName forKey:@"identifiedSpamInCallerName"];
  [v5 encodeBool:self->_screening forKey:@"screening"];
  [v5 encodeBool:self->_screeningDueToUserInteraction forKey:@"screeningDueToUserInteraction"];
  [v5 encodeBool:self->_wasScreened forKey:@"wasScreened"];
  [v5 encodeBool:self->_screeningAnnouncementHasFinished forKey:@"screeningAnnouncementHasFinished"];
  [v5 encodeBool:self->_shouldSuppressRingtone forKey:@"shouldSuppressRingtone"];
  [v5 encodeInt32:self->_hardPauseDigitsState forKey:@"hardPauseDigitsState"];
  [v5 encodeObject:self->_hardPauseDigits forKey:@"hardPauseDigits"];
  [v5 encodeBool:self->_wasPulledToCurrentDevice forKey:@"wasPulledToCurrentDevice"];
  [v5 encodeInteger:self->_soundRegion forKey:@"soundRegion"];
  [v5 encodeInteger:self->_screenSharingIntention forKey:@"screenSharingIntention"];
  [v5 encodeObject:self->_model forKey:@"model"];
  [v5 encodeBool:self->_supportsDTMFUpdates forKey:@"supportsDTMFUpdates"];
  [v5 encodeObject:self->_videoCallAttributes forKey:@"videoCallAttributes"];
  [v5 encodeInteger:self->_verificationStatus forKey:@"verificationStatus"];
  [v5 encodeInteger:self->_priority forKey:@"priority"];
  [v5 encodeInt32:self->_originatingUIType forKey:@"originatingUIType"];
  [v5 encodeInt32:LODWORD(self->_liveVoicemailUnavailableReason) forKey:@"liveVoicemailUnavailableReason"];
  [v5 encodeInteger:self->_junkConfidence forKey:@"junkConfidence"];
  [v5 encodeInteger:self->_identificationCategory forKey:@"identificationCategory"];
  [v5 encodeBool:self->_isKnownCaller forKey:@"isKnownCaller"];
  [v5 encodeBool:self->_joinedFromLink forKey:@"joinedFromLink"];
  [v5 encodeInt:self->_callSubType forKey:@"callSubType"];
  [v5 encodeBool:self->_hasEmergencyVideoStream forKey:@"hasEmergencyVideoStream"];
  [v5 encodeObject:self->_emergencyMediaItems forKey:@"emergencyMediaItems"];
  [v5 encodeObject:self->_recordingSession forKey:@"recordingSession"];
  [v5 encodeObject:self->_blockedByExtension forKey:@"blockedByExtension"];
  [v5 encodeObject:self->_callDirectoryIdentityExtension forKey:@"callDirectoryIdentityExtension"];
  [v5 encodeDouble:@"hostCreationTime" forKey:self->_hostCreationTime];
  [v5 encodeDouble:@"hostMessageSendTime" forKey:self->_hostMessageSendTime];
  [v5 encodeDouble:@"clientMessageReceiveTime" forKey:self->_clientMessageReceiveTime];
  [v5 encodeInteger:self->_answeringMachineStreamToken forKey:@"answeringMachineStreamToken"];
  [v5 encodeInteger:self->_providerErrorCode forKey:@"providerErrorCode"];
  [v5 encodeInteger:self->_providerEndedReason forKey:@"providerEndedReason"];
  [v5 encodeInteger:self->_screenSharingType forKey:@"screenSharingType"];
}

- (NSDictionary)callStats
{
  return 0;
}

- (NSString)endedErrorString
{
  return 0;
}

- (NSString)endedReasonString
{
  return 0;
}

- (int64_t)cameraType
{
  return 0;
}

- (int64_t)remoteCameraOrientation
{
  return 0;
}

- (int64_t)remoteScreenOrientation
{
  return 0;
}

- (CGRect)remoteVideoContentRect
{
  if (__CUTWeakCGRectZero__pred_CGRectZeroCoreGraphics != -1) {
    dispatch_once(&__CUTWeakCGRectZero__pred_CGRectZeroCoreGraphics, &__block_literal_global_1707);
  }
  double v3 = *((double *)&__CUTStaticWeak_CGRectZero + 1);
  double v2 = *(double *)&__CUTStaticWeak_CGRectZero;
  double v4 = *(double *)&qword_1E940AB40;
  double v5 = unk_1E940AB48;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isVideoUpgradeFromCall:(id)a3
{
  id v4 = a3;
  if ([(TUCall *)self isVideo]
    && ([v4 isVideo] & 1) == 0
    && ([(TUCall *)self handle],
        double v5 = objc_claimAutoreleasedReturnValue(),
        [v4 handle],
        int v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = TUHandlesAreCanonicallyEqual(v5, v6),
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [v4 provider];
    int v9 = [v8 isTinCanProvider] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)isDialRequestVideoUpgrade:(id)a3
{
  id v4 = a3;
  if ([v4 isVideo] && !-[TUCall isVideo](self, "isVideo"))
  {
    int v6 = [(TUCall *)self handle];
    int v7 = [v4 handle];
    char v5 = TUHandlesAreCanonicallyEqual(v6, v7);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isEligibleForManualScreening
{
  return [(TUCall *)self isEligibleForManualScreening:0];
}

- (BOOL)isEligibleForManualScreening:(id)a3
{
  return [(TUCall *)self _isEligibleForManualScreening:1 languageIdentifier:a3];
}

- (BOOL)isEligibleForScreening
{
  return [(TUCall *)self isEligibleForScreening:0];
}

- (BOOL)isEligibleForScreening:(id)a3
{
  return [(TUCall *)self _isEligibleForManualScreening:0 languageIdentifier:a3];
}

- (BOOL)_isEligibleForManualScreening:(BOOL)a3 languageIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [(TUCall *)self featureFlags];
  int v8 = TUCallScreeningEnabled(v7, v6);

  if (!v8) {
    goto LABEL_32;
  }
  int v9 = [(TUCall *)self clarityEnabledBlock];
  int v10 = v9[2]();

  if (v10)
  {
    v11 = TUDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      uint64_t v12 = "isEligibleForScreening: NO because ClarityUI is enabled";
LABEL_15:
      _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v29, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!v4)
  {
    v13 = [(TUCall *)self lowPowerModeEnabledBlock];
    int v14 = v13[2]();

    if (v14)
    {
      v11 = TUDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        uint64_t v12 = "isEligibleForScreening: NO because the device is in low power mode";
        goto LABEL_15;
      }
LABEL_16:
      LOBYTE(v16) = 0;
      goto LABEL_40;
    }
  }
  if (![(TUCall *)self supportsScreening])
  {
    v11 = TUDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      uint64_t v12 = "isEligibleForScreening: NO because the call provider reports this call does not support screening";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if ([(TUCall *)self priority] == 2)
  {
    [(TUCall *)self setLiveVoicemailUnavailableReason:7];
    v15 = TUDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_19C496000, v15, OS_LOG_TYPE_DEFAULT, "isEligibleForScreening: High Priority call, not screenable", (uint8_t *)&v29, 2u);
    }
LABEL_27:

    goto LABEL_28;
  }
  int v17 = [(TUCall *)self provider];
  int v18 = [v17 isTelephonyProvider];

  if (v18
    && (v4
     || [(TUCall *)self isLocalUserInHomeCountry]
     && ![(TUCall *)self hasIdentifiedSpamInCallerName]
     && [(TUCall *)self junkConfidence] < 2))
  {
    goto LABEL_19;
  }
  v19 = [(TUCall *)self provider];
  int v20 = [v19 isFaceTimeProvider];

  if (!v20) {
    goto LABEL_28;
  }
  v15 = [(TUCall *)self remoteParticipantHandles];
  if ((unint64_t)[v15 count] > 1 || [(TUCall *)self isVideo]) {
    goto LABEL_27;
  }
  BOOL v26 = [(TUCall *)self isConversation];
  if (v26 && !v4)
  {
    v27 = [(TUCall *)self contactIdentifiers];
    uint64_t v28 = [v27 count];

    if (v28 != 1) {
      goto LABEL_28;
    }
LABEL_19:
    if ([(TUCall *)self isAnsweringMachineAvailable])
    {
      BOOL v16 = 1;
      goto LABEL_33;
    }
    v21 = TUDefaultLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    LOWORD(v29) = 0;
    uint64_t v22 = "isEligibleForScreening: NO, Answering Machine is not currently available";
    goto LABEL_30;
  }

  if (v26) {
    goto LABEL_19;
  }
LABEL_28:
  v21 = TUDefaultLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    uint64_t v22 = "isEligibleForScreening: NO, either telephony roaming, Junk Call, or Emergency or not a U+1 audio call from a contact";
LABEL_30:
    _os_log_impl(&dword_19C496000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v29, 2u);
  }
LABEL_31:

LABEL_32:
  BOOL v16 = 0;
LABEL_33:
  v11 = TUDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v23 = @"NO";
    if (v16) {
      uint64_t v24 = @"YES";
    }
    else {
      uint64_t v24 = @"NO";
    }
    int v29 = 138412802;
    objc_super v30 = v24;
    __int16 v31 = 2112;
    if (v4) {
      v23 = @"YES";
    }
    v32 = v23;
    __int16 v33 = 2112;
    v34 = self;
    _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "isEligibleForScreening: %@ manualScreening: %@ for call: %@", (uint8_t *)&v29, 0x20u);
  }
LABEL_40:

  return v16;
}

- (BOOL)isRecordingAllowed
{
  return [(TUCall *)self recordingAvailability] == 3;
}

- (int)recordingAvailability
{
  return 1;
}

- (BOOL)supportsScreening
{
  return 0;
}

- (int)callSubType
{
  return self->_callSubType;
}

- (void)setCallSubType:(int)a3
{
  self->_callSubType = a3;
}

- (TUCallRecordingSession)recordingSession
{
  return self->_recordingSession;
}

- (void)setAnnounceProviderIdentifier:(id)a3
{
}

- (int)disconnectedReason
{
  return self->_disconnectedReason;
}

- (void)setDisconnectedReason:(int)a3
{
  self->_disconnectedReason = a3;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (int)faceTimeIDStatus
{
  return self->_faceTimeIDStatus;
}

- (void)setFaceTimeIDStatus:(int)a3
{
  self->_faceTimeIDStatus = a3;
}

- (BOOL)isEndpointOnCurrentDevice
{
  return self->_endpointOnCurrentDevice;
}

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  self->_endpointOnCurrentDevice = a3;
}

- (void)setTtyType:(int)a3
{
  self->_ttyType = a3;
}

- (BOOL)shouldSuppressRingtone
{
  return self->_shouldSuppressRingtone;
}

- (void)setShouldSuppressRingtone:(BOOL)a3
{
  self->_shouldSuppressRingtone = a3;
}

- (BOOL)wantsHoldMusic
{
  return self->_wantsHoldMusic;
}

- (void)setWantsHoldMusic:(BOOL)a3
{
  self->_wantsHoldMusic = a3;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSDate)dateAnsweredOrDialed
{
  return self->_dateAnsweredOrDialed;
}

- (void)setDateAnsweredOrDialed:(id)a3
{
}

- (NSDate)dateSentInvitation
{
  return self->_dateSentInvitation;
}

- (void)setDateSentInvitation:(id)a3
{
}

- (NSDate)dateStartedConnecting
{
  return self->_dateStartedConnecting;
}

- (void)setDateStartedConnecting:(id)a3
{
}

- (NSDate)dateConnected
{
  return self->_dateConnected;
}

- (void)setDateConnected:(id)a3
{
}

- (NSDate)dateEnded
{
  return self->_dateEnded;
}

- (void)setDateEnded:(id)a3
{
}

- (unint64_t)screenSharingType
{
  return self->_screenSharingType;
}

- (void)setScreenSharingType:(unint64_t)a3
{
  self->_screenSharingType = a3;
}

- (NSString)uniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier;
}

- (void)setUniqueProxyIdentifier:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (void)setIsoCountryCode:(id)a3
{
}

- (BOOL)wasDialAssisted
{
  return self->_wasDialAssisted;
}

- (void)setWasDialAssisted:(BOOL)a3
{
  self->_wasDialAssisted = a3;
}

- (BOOL)hasEmergencyVideoStream
{
  return self->_hasEmergencyVideoStream;
}

- (void)setHasEmergencyVideoStream:(BOOL)a3
{
  self->_hasEmergencyVideoStream = a3;
}

- (NSSet)emergencyMediaItems
{
  return self->_emergencyMediaItems;
}

- (void)setEmergencyMediaItems:(id)a3
{
}

- (TUCallModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (TUCallNotificationManager)callNotificationManager
{
  return self->_callNotificationManager;
}

- (BOOL)lockdownModeEnabled
{
  return self->_lockdownModeEnabled;
}

- (TUProxyCall)comparativeCall
{
  return self->_comparativeCall;
}

- (void)setComparativeCall:(id)a3
{
}

- (int)filteredOutReason
{
  return self->_filteredOutReason;
}

- (void)setFilteredOutReason:(int)a3
{
  self->_filteredOutReason = a3;
}

- (NSString)blockedByExtension
{
  return self->_blockedByExtension;
}

- (void)setBlockedByExtension:(id)a3
{
}

- (void)setSupportsRecents:(BOOL)a3
{
  self->_supportsRecents = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (TUCallServicesInterface)callServicesInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callServicesInterface);

  return (TUCallServicesInterface *)WeakRetained;
}

- (void)setCallServicesInterface:(id)a3
{
}

- (TUVideoCallAttributes)videoCallAttributes
{
  return self->_videoCallAttributes;
}

- (void)setVideoCallAttributes:(id)a3
{
}

- (NSDate)dateScreeningEnded
{
  return self->_dateScreeningEnded;
}

- (void)setDateScreeningEnded:(id)a3
{
}

- (int64_t)verificationStatus
{
  return self->_verificationStatus;
}

- (void)setVerificationStatus:(int64_t)a3
{
  self->_verificationStatus = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (id)contactsDataSourceCreationBlock
{
  return self->_contactsDataSourceCreationBlock;
}

- (void)setContactsDataSourceCreationBlock:(id)a3
{
}

- (id)clarityEnabledBlock
{
  return self->_clarityEnabledBlock;
}

- (void)setClarityEnabledBlock:(id)a3
{
}

- (id)lowPowerModeEnabledBlock
{
  return self->_lowPowerModeEnabledBlock;
}

- (void)setLowPowerModeEnabledBlock:(id)a3
{
}

- (NSURL)channelImageURL
{
  return self->_channelImageURL;
}

- (void)setChannelImageURL:(id)a3
{
}

- (TUParticipant)activeRemoteParticipant
{
  return self->_activeRemoteParticipant;
}

- (int64_t)provisionalHoldStatus
{
  return self->_provisionalHoldStatus;
}

- (void)setProvisionalHoldStatus:(int64_t)a3
{
  self->_provisionalHoldStatus = a3;
}

- (void)setCallDirectoryIdentityExtension:(id)a3
{
}

- (int64_t)serviceStatus
{
  return self->_serviceStatus;
}

- (int64_t)transmissionMode
{
  return self->_transmissionMode;
}

- (BOOL)accessoryButtonEventsEnabled
{
  return self->_accessoryButtonEventsEnabled;
}

- (int)transitionStatus
{
  return self->_transitionStatus;
}

- (void)setTransitionStatus:(int)a3
{
  self->_transitionStatus = a3;
}

- (BOOL)hasUpdatedAudio
{
  return self->_hasUpdatedAudio;
}

- (void)setHasUpdatedAudio:(BOOL)a3
{
  self->_hasUpdatedAudio = a3;
}

- (int64_t)soundRegion
{
  return self->_soundRegion;
}

- (void)setSoundRegion:(int64_t)a3
{
  self->_soundRegion = a3;
}

- (BOOL)isScreening
{
  return self->_screening;
}

- (void)setScreening:(BOOL)a3
{
  self->_screening = a3;
}

- (BOOL)isScreeningDueToUserInteraction
{
  return self->_screeningDueToUserInteraction;
}

- (void)setScreeningDueToUserInteraction:(BOOL)a3
{
  self->_screeningDueToUserInteraction = a3;
}

- (BOOL)wasScreened
{
  return self->_wasScreened;
}

- (void)setWasScreened:(BOOL)a3
{
  self->_wasScreened = a3;
}

- (BOOL)screeningAnnouncementHasFinished
{
  return self->_screeningAnnouncementHasFinished;
}

- (void)setScreeningAnnouncementHasFinished:(BOOL)a3
{
  self->_screeningAnnouncementHasFinished = a3;
}

- (BOOL)isPTT
{
  return self->_ptt;
}

- (BOOL)ringtoneSuppressedRemotely
{
  return self->_ringtoneSuppressedRemotely;
}

- (void)setRingtoneSuppressedRemotely:(BOOL)a3
{
  self->_ringtoneSuppressedRemotely = a3;
}

- (NSDictionary)providerContext
{
  return self->_providerContext;
}

- (int64_t)providerErrorCode
{
  return self->_providerErrorCode;
}

- (int64_t)providerEndedReason
{
  return self->_providerEndedReason;
}

- (int64_t)answeringMachineStreamToken
{
  return self->_answeringMachineStreamToken;
}

- (void)setAnsweringMachineStreamToken:(int64_t)a3
{
  self->_answeringMachineStreamToken = a3;
}

- (TUMediaTokens)tokens
{
  return self->_tokens;
}

- (NSString)localMemberHandleValue
{
  return self->_localMemberHandleValue;
}

- (CGSize)remoteScreenAspectRatio
{
  double width = self->_remoteScreenAspectRatio.width;
  double height = self->_remoteScreenAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)needsConversationOrVideoRelaySupport
{
  return self->_needsConversationOrVideoRelaySupport;
}

- (BOOL)needsConversationRelaySupport
{
  return self->_needsConversationRelaySupport;
}

- (BOOL)isSharingScreen
{
  return self->_sharingScreen;
}

- (void)setSharingScreen:(BOOL)a3
{
  self->_sharingScreen = a3;
}

- (BOOL)mixesVoiceWithMedia
{
  return self->_mixesVoiceWithMedia;
}

- (void)setMixesVoiceWithMedia:(BOOL)a3
{
  self->_mixesVoiceWithMedia = a3;
}

- (BOOL)mediaPlaybackOnExternalDevice
{
  return self->_mediaPlaybackOnExternalDevice;
}

- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3
{
  self->_mediaPlaybackOnExternalDevice = a3;
}

- (BOOL)prefersToPlayDuringWombat
{
  return self->_prefersToPlayDuringWombat;
}

- (void)setPrefersToPlayDuringWombat:(BOOL)a3
{
  self->_prefersToPlayDuringWombat = a3;
}

- (double)hostCreationTime
{
  return self->_hostCreationTime;
}

- (void)setHostCreationTime:(double)a3
{
  self->_hostCreationTime = a3;
}

- (double)hostMessageSendTime
{
  return self->_hostMessageSendTime;
}

- (void)setHostMessageSendTime:(double)a3
{
  self->_hostMessageSendTime = a3;
}

- (double)clientMessageReceiveTime
{
  return self->_clientMessageReceiveTime;
}

- (void)setClientMessageReceiveTime:(double)a3
{
  self->_clientMessageReceiveTime = a3;
}

- (BOOL)wasPulledToCurrentDevice
{
  return self->_wasPulledToCurrentDevice;
}

- (void)setWasPulledToCurrentDevice:(BOOL)a3
{
  self->_wasPulledToCurrentDevice = a3;
}

- (int)hardPauseDigitsState
{
  return self->_hardPauseDigitsState;
}

- (void)setHardPauseDigitsState:(int)a3
{
  self->_hardPauseDigitsState = a3;
}

- (NSString)hardPauseDigits
{
  return self->_hardPauseDigits;
}

- (void)setHardPauseDigits:(id)a3
{
}

- (TUHandle)initiator
{
  return self->_initiator;
}

- (NSUUID)conversationID
{
  return self->_conversationID;
}

- (int)originatingUIType
{
  return self->_originatingUIType;
}

- (int64_t)liveVoicemailUnavailableReason
{
  return self->_liveVoicemailUnavailableReason;
}

- (void)setLiveVoicemailUnavailableReason:(int64_t)a3
{
  self->_liveVoicemailUnavailableReason = a3;
}

- (int64_t)junkConfidence
{
  return self->_junkConfidence;
}

- (int64_t)identificationCategory
{
  return self->_identificationCategory;
}

- (BOOL)isKnownCaller
{
  return self->_isKnownCaller;
}

- (BOOL)isLocalUserInHomeCountry
{
  return self->_localUserInHomeCountry;
}

- (BOOL)isAnsweringMachineAvailable
{
  return self->_answeringMachineAvailable;
}

- (BOOL)hasNondisclosedGreeting
{
  return self->_nondisclosedGreeting;
}

- (BOOL)hasIdentifiedSpamInCallerName
{
  return self->_identifiedSpamInCallerName;
}

- (BOOL)joinedFromLink
{
  return self->_joinedFromLink;
}

- (void)setJoinedFromLink:(BOOL)a3
{
  self->_joinedFromLink = a3;
}

- (void)setBluetoothAudioFormat:(int64_t)a3
{
  self->_bluetoothAudioFormat = a3;
}

- (TUCallScreenShareAttributes)screenShareAttributes
{
  return self->_screenShareAttributes;
}

- (int64_t)screenSharingIntention
{
  return self->_screenSharingIntention;
}

- (void)setFailureExpected:(BOOL)a3
{
  self->_failureExpected = a3;
}

- (BOOL)isInternational
{
  return self->_international;
}

- (BOOL)isDomestic
{
  return self->_domestic;
}

- (void)setSupportsEmergencyFallback:(BOOL)a3
{
  self->_supportsEmergencyFallback = a3;
}

- (BOOL)supportsDTMFUpdates
{
  return self->_supportsDTMFUpdates;
}

- (void)setSupportsDTMFUpdates:(BOOL)a3
{
  self->_supportsDTMFUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenShareAttributes, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_hardPauseDigits, 0);
  objc_storeStrong((id *)&self->_localMemberHandleValue, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_providerContext, 0);
  objc_storeStrong((id *)&self->_callDirectoryIdentityExtension, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipant, 0);
  objc_storeStrong((id *)&self->_channelImageURL, 0);
  objc_storeStrong(&self->_lowPowerModeEnabledBlock, 0);
  objc_storeStrong(&self->_clarityEnabledBlock, 0);
  objc_storeStrong(&self->_contactsDataSourceCreationBlock, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_dateScreeningEnded, 0);
  objc_storeStrong((id *)&self->_videoCallAttributes, 0);
  objc_destroyWeak((id *)&self->_callServicesInterface);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_blockedByExtension, 0);
  objc_storeStrong((id *)&self->_comparativeCall, 0);
  objc_storeStrong((id *)&self->_callNotificationManager, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_emergencyMediaItems, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueProxyIdentifier, 0);
  objc_storeStrong((id *)&self->_dateEnded, 0);
  objc_storeStrong((id *)&self->_dateConnected, 0);
  objc_storeStrong((id *)&self->_dateStartedConnecting, 0);
  objc_storeStrong((id *)&self->_dateSentInvitation, 0);
  objc_storeStrong((id *)&self->_dateAnsweredOrDialed, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_announceProviderIdentifier, 0);

  objc_storeStrong((id *)&self->_recordingSession, 0);
}

- (void)dialRequestForRedial
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v3 = [a1 handle];
  int v4 = 138412290;
  char v5 = v3;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Call was emergency, but handle %@ is not considered to be an emergency handle. Setting redial dialType to normal.", (uint8_t *)&v4, 0xCu);
}

@end