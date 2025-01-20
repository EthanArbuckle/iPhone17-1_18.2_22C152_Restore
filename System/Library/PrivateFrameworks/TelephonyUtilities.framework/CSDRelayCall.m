@interface CSDRelayCall
- (BOOL)canBeAnsweredWithAudioOrVideoRelayWithRequest:(id)a3;
- (BOOL)canBeAnsweredWithRequest:(id)a3;
- (BOOL)canOnlyBeAnsweredWithoutAudioOrVideoRelayWithRequest:(id)a3;
- (BOOL)cannotRelayAudioOrVideo;
- (BOOL)isConferenceActive;
- (BOOL)isConversation;
- (BOOL)isEmergency;
- (BOOL)isFailureExpected;
- (BOOL)isHostedOnCurrentDevice;
- (BOOL)isOutgoing;
- (BOOL)isRemoteUplinkMuted;
- (BOOL)isSOS;
- (BOOL)isSendingAudio;
- (BOOL)isUplinkMuted;
- (BOOL)isVideo;
- (BOOL)isVoicemail;
- (BOOL)needsManualInCallSounds;
- (BOOL)shouldOwnMuteHandler;
- (BOOL)supportsDisplayingFaceTimeAudioCalls;
- (BOOL)supportsEmergencyFallback;
- (BOOL)supportsScreening;
- (BOOL)supportsTTYWithVoice;
- (CSDRelayCall)initWithRelayMessage:(id)a3 outgoing:(BOOL)a4;
- (CSDRelayCallDelegate)relayDelegate;
- (NSDictionary)remoteInviteDictionary;
- (NSSet)remoteParticipantHandles;
- (NSString)announceProviderIdentifier;
- (NSString)callerNameFromNetwork;
- (NSString)isoCountryCode;
- (NSUUID)callGroupUUID;
- (NSUUID)localSenderIdentityAccountUUID;
- (NSUUID)localSenderIdentityUUID;
- (TUCallDisplayContext)displayContext;
- (TUCallProvider)localProvider;
- (TUCallProvider)provider;
- (TUHandle)handle;
- (TUJoinConversationRequest)joinConversationRequest;
- (id)audioCategory;
- (id)audioMode;
- (id)initOutgoingWithDialRequest:(id)a3;
- (id)initOutgoingWithJoinConversationRequest:(id)a3;
- (id)recordingAllowedError;
- (id)recordingDisabledError;
- (int)callRelaySupport;
- (int)callStatus;
- (int)originatingUIType;
- (int)ttyType;
- (int64_t)audioInterruptionOperationMode;
- (int64_t)audioInterruptionProviderType;
- (int64_t)bluetoothAudioFormat;
- (int64_t)inputAudioPowerSpectrumToken;
- (int64_t)outputAudioPowerSpectrumToken;
- (int64_t)spatialAudioSourceIdentifier;
- (unint64_t)initialLinkType;
- (void)answerWithRequest:(id)a3;
- (void)becomeEndpointForPullFromRemoteDevice;
- (void)dialWithRequest:(id)a3 displayContext:(id)a4;
- (void)disconnectWithReason:(int)a3;
- (void)groupWithOtherCall:(id)a3;
- (void)hold;
- (void)joinConversationWithRequest:(id)a3;
- (void)performUplinkMuted:(BOOL)a3;
- (void)playLocalDTMFToneForKey:(unsigned __int8)a3;
- (void)sendHardPauseDigits;
- (void)setAnnounceProviderIdentifier:(id)a3;
- (void)setBluetoothAudioFormat:(int64_t)a3;
- (void)setCallGroupUUID:(id)a3;
- (void)setCallStatus:(int)a3;
- (void)setCallerNameFromNetwork:(id)a3;
- (void)setCannotRelayAudioOrVideo:(BOOL)a3;
- (void)setConversation:(BOOL)a3;
- (void)setDisplayContext:(id)a3;
- (void)setEmergency:(BOOL)a3;
- (void)setFailureExpected:(BOOL)a3;
- (void)setHandle:(id)a3;
- (void)setHardPauseDigits:(id)a3;
- (void)setHardPauseDigitsState:(int)a3;
- (void)setInitialLinkType:(unint64_t)a3;
- (void)setIsSendingAudio:(BOOL)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setJoinConversationRequest:(id)a3;
- (void)setLocalSenderIdentityAccountUUID:(id)a3;
- (void)setLocalSenderIdentityUUID:(id)a3;
- (void)setLocallyConnected;
- (void)setLocallyConnecting;
- (void)setLocallyDisconnectedWithReasonIfNone:(int)a3;
- (void)setLocallyDisconnectedWithReasonIfNone:(int)a3 stopConference:(BOOL)a4;
- (void)setLocallyHasSentInvitation;
- (void)setLocallyHasStartedOutgoing;
- (void)setNeedsManualInCallSounds:(BOOL)a3;
- (void)setOriginatingUIType:(int)a3;
- (void)setOutgoing:(BOOL)a3;
- (void)setProvider:(id)a3;
- (void)setRelayDelegate:(id)a3;
- (void)setRemoteInviteDictionary:(id)a3;
- (void)setRemoteParticipantHandles:(id)a3;
- (void)setRemoteUplinkMuted:(BOOL)a3;
- (void)setSOS:(BOOL)a3;
- (void)setSupportsEmergencyFallback:(BOOL)a3;
- (void)setSupportsTTYWithVoice:(BOOL)a3;
- (void)setTtyType:(int)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVoicemail:(BOOL)a3;
- (void)startConferenceForAnsweredCallWithTransport:(id)a3 remoteInviteDictionary:(id)a4;
- (void)startConferenceForDialedCallWithTransport:(id)a3 remoteInviteDictionary:(id)a4;
- (void)startConferenceForPulledCallWithTransport:(id)a3 remoteInviteDictionary:(id)a4;
- (void)stopConference;
- (void)ungroup;
- (void)unhold;
- (void)updateWithRelayMessage:(id)a3;
@end

@implementation CSDRelayCall

- (id)initOutgoingWithDialRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueProxyIdentifier];
  v6 = -[CSDRelayCall initWithUniqueProxyIdentifier:endpointOnCurrentDevice:](self, "initWithUniqueProxyIdentifier:endpointOnCurrentDevice:", v5, [v4 endpointOnCurrentDevice]);

  if (v6)
  {
    uint64_t v7 = [v4 localSenderIdentityUUID];
    localSenderIdentityUUID = v6->_localSenderIdentityUUID;
    v6->_localSenderIdentityUUID = (NSUUID *)v7;

    uint64_t v9 = [v4 localSenderIdentityAccountUUID];
    localSenderIdentityAccountUUID = v6->_localSenderIdentityAccountUUID;
    v6->_localSenderIdentityAccountUUID = (NSUUID *)v9;

    [v4 ttyType];
    v6->_ttyType = TUCallTTYTypeForTUDialRequestTTYType();
    [(CSDCall *)v6 setupInputMuteHandlerWithFeatureFlags:0];
  }

  return v6;
}

- (id)initOutgoingWithJoinConversationRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 UUID];
  v6 = [v5 UUIDString];
  uint64_t v7 = -[CSDRelayCall initWithUniqueProxyIdentifier:endpointOnCurrentDevice:](self, "initWithUniqueProxyIdentifier:endpointOnCurrentDevice:", v6, [v4 endpointOnCurrentDevice]);

  if (v7)
  {
    [(CSDRelayCall *)v7 setConversation:1];
    id v8 = objc_alloc((Class)NSMutableSet);
    uint64_t v9 = [v4 remoteMembers];
    v10 = (NSSet *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v11 = objc_msgSend(v4, "remoteMembers", 0);
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v15) handles];
          v17 = [v16 anyObject];
          [(NSSet *)v10 addObject:v17];

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    remoteParticipantHandles = v7->_remoteParticipantHandles;
    v7->_remoteParticipantHandles = v10;

    [(CSDCall *)v7 setupInputMuteHandlerWithFeatureFlags:0];
  }

  return v7;
}

- (CSDRelayCall)initWithRelayMessage:(id)a3 outgoing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 uniqueProxyIdentifier];
  id v8 = [(CSDRelayCall *)self initWithUniqueProxyIdentifier:v7];

  if (v8)
  {
    uint64_t v9 = [v6 tuHandle];
    handle = v8->_handle;
    v8->_handle = (TUHandle *)v9;

    v11 = [v6 isoCountryCode];
    id v12 = (NSString *)[v11 copy];
    isoCountryCode = v8->_isoCountryCode;
    v8->_isoCountryCode = v12;

    uint64_t v14 = [v6 callerNameFromNetwork];
    v15 = (NSString *)[v14 copy];
    callerNameFromNetwork = v8->_callerNameFromNetwork;
    v8->_callerNameFromNetwork = v15;

    uint64_t v17 = [v6 tuProvider];
    provider = v8->_provider;
    v8->_provider = (TUCallProvider *)v17;

    v8->_failureExpected = [v6 isFailureExpected];
    v8->_supportsEmergencyFallback = [v6 supportsEmergencyFallback];
    v8->_video = [v6 isVideo];
    v8->_voicemail = [v6 isVoicemail];
    v8->_needsManualInCallSounds = [v6 needsManualInCallSounds];
    v8->_outgoing = v4;
    if (v4) {
      int v19 = 3;
    }
    else {
      int v19 = 4;
    }
    v8->_callStatus = v19;
    long long v20 = [v6 inviteData];
    long long v21 = [v20 relayInviteDictionary];
    long long v22 = (NSDictionary *)[v21 copy];
    remoteInviteDictionary = v8->_remoteInviteDictionary;
    v8->_remoteInviteDictionary = v22;

    v8->_remoteUplinkMuted = [v6 isRemoteUplinkMuted];
    uint64_t v24 = [v6 localSenderIdentityUUID];
    localSenderIdentityUUID = v8->_localSenderIdentityUUID;
    v8->_localSenderIdentityUUID = (NSUUID *)v24;

    uint64_t v26 = [v6 localSenderIdentityAccountUUID];
    localSenderIdentityAccountUUID = v8->_localSenderIdentityAccountUUID;
    v8->_localSenderIdentityAccountUUID = (NSUUID *)v26;

    uint64_t v28 = [v6 remoteParticipantTUHandles];
    remoteParticipantHandles = v8->_remoteParticipantHandles;
    v8->_remoteParticipantHandles = (NSSet *)v28;

    v8->_ttyType = [v6 ttyType];
    v8->_supportsTTYWithVoice = [v6 supportsTTYWithVoice];
    -[CSDCall setSupportsDTMFUpdates:](v8, "setSupportsDTMFUpdates:", [v6 supportsDTMFUpdates]);
    -[CSDRelayCall setConversation:](v8, "setConversation:", [v6 hasGroupUUIDString]);
    id v30 = objc_alloc((Class)NSUUID);
    v31 = [v6 groupUUIDString];
    id v32 = [v30 initWithUUIDString:v31];
    [(CSDRelayCall *)v8 setCallGroupUUID:v32];

    v33 = [v6 sourceIdentifier];
    [(CSDRelayCall *)v8 setSourceIdentifier:v33];

    -[CSDCall setSoundRegion:](v8, "setSoundRegion:", [v6 soundRegion]);
    v34 = [v6 callModel];
    [(CSDCall *)v8 setModel:v34];

    [(CSDCall *)v8 setupInputMuteHandlerWithFeatureFlags:0];
  }

  return v8;
}

- (void)updateWithRelayMessage:(id)a3
{
  id v18 = a3;
  if ([v18 hasProtoProvider])
  {
    BOOL v4 = [v18 tuProvider];
    [(CSDRelayCall *)self setProvider:v4];
  }
  v5 = [v18 tuHandle];
  [(CSDRelayCall *)self setHandle:v5];

  id v6 = [v18 isoCountryCode];
  [(CSDRelayCall *)self setIsoCountryCode:v6];

  uint64_t v7 = [v18 callerNameFromNetwork];
  [(CSDRelayCall *)self setCallerNameFromNetwork:v7];

  -[CSDRelayCall setVideo:](self, "setVideo:", [v18 isVideo]);
  -[CSDRelayCall setVoicemail:](self, "setVoicemail:", [v18 isVoicemail]);
  -[CSDRelayCall setNeedsManualInCallSounds:](self, "setNeedsManualInCallSounds:", [v18 needsManualInCallSounds]);
  -[CSDCall setSoundRegion:](self, "setSoundRegion:", [v18 soundRegion]);
  id v8 = [v18 sourceIdentifier];
  [(CSDRelayCall *)self setSourceIdentifier:v8];

  -[CSDRelayCall setEmergency:](self, "setEmergency:", [v18 isEmergency]);
  -[CSDRelayCall setFailureExpected:](self, "setFailureExpected:", [v18 isFailureExpected]);
  -[CSDRelayCall setSupportsEmergencyFallback:](self, "setSupportsEmergencyFallback:", [v18 supportsEmergencyFallback]);
  -[CSDRelayCall setSOS:](self, "setSOS:", [v18 isSOS]);
  -[CSDCall setSupportsDTMFUpdates:](self, "setSupportsDTMFUpdates:", [v18 supportsDTMFUpdates]);
  uint64_t v9 = [v18 callModel];
  [(CSDCall *)self setModel:v9];

  v10 = [(CSDRelayCall *)self displayContext];
  v11 = [v18 displayContext];
  id v12 = [v10 displayContextByMergingWithDisplayContext:v11];
  [(CSDRelayCall *)self setDisplayContext:v12];

  -[CSDRelayCall setRemoteUplinkMuted:](self, "setRemoteUplinkMuted:", [v18 isRemoteUplinkMuted]);
  id v13 = [v18 localSenderIdentityUUID];
  [(CSDRelayCall *)self setLocalSenderIdentityUUID:v13];

  uint64_t v14 = [v18 localSenderIdentityAccountUUID];
  [(CSDRelayCall *)self setLocalSenderIdentityAccountUUID:v14];

  -[CSDRelayCall setTtyType:](self, "setTtyType:", [v18 ttyType]);
  -[CSDRelayCall setSupportsTTYWithVoice:](self, "setSupportsTTYWithVoice:", [v18 supportsTTYWithVoice]);
  -[CSDRelayCall setOriginatingUIType:](self, "setOriginatingUIType:", [v18 originatingUIType]);
  -[CSDRelayCall setConversation:](self, "setConversation:", [v18 hasGroupUUIDString]);
  if ([v18 hasGroupUUIDString])
  {
    id v15 = objc_alloc((Class)NSUUID);
    v16 = [v18 groupUUIDString];
    id v17 = [v15 initWithUUIDString:v16];
    [(CSDRelayCall *)self setCallGroupUUID:v17];
  }
}

- (BOOL)isHostedOnCurrentDevice
{
  return 0;
}

- (id)audioCategory
{
  v2 = (void *)qword_10058C340;
  if (!qword_10058C340)
  {
    v3 = (void **)CUTWeakLinkSymbol();
    if (v3) {
      BOOL v4 = *v3;
    }
    else {
      BOOL v4 = 0;
    }
    objc_storeStrong((id *)&qword_10058C340, v4);
    v2 = (void *)qword_10058C340;
  }

  return v2;
}

- (id)audioMode
{
  v2 = (void *)qword_10058C348;
  if (!qword_10058C348)
  {
    v3 = (void **)CUTWeakLinkSymbol();
    if (v3) {
      BOOL v4 = *v3;
    }
    else {
      BOOL v4 = 0;
    }
    objc_storeStrong((id *)&qword_10058C348, v4);
    v2 = (void *)qword_10058C348;
  }

  return v2;
}

- (int64_t)audioInterruptionOperationMode
{
  return 4;
}

- (int64_t)audioInterruptionProviderType
{
  return 2;
}

- (int)callRelaySupport
{
  v3 = [(CSDRelayCall *)self provider];
  unsigned int v4 = [v3 isSystemProvider];

  if (!v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CSDRelayCall;
  return [(CSDCall *)&v6 callRelaySupport];
}

- (BOOL)supportsScreening
{
  return 0;
}

- (id)recordingDisabledError
{
  id v2 = objc_alloc((Class)NSError);
  id v3 = [v2 initWithDomain:TUStartRecordingErrorDomain code:9 userInfo:0];

  return v3;
}

- (id)recordingAllowedError
{
  id v2 = objc_alloc((Class)NSError);
  id v3 = [v2 initWithDomain:TUStartRecordingErrorDomain code:9 userInfo:0];

  return v3;
}

- (TUCallDisplayContext)displayContext
{
  displayContext = self->_displayContext;
  if (displayContext)
  {
    id v3 = displayContext;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSDRelayCall;
    id v3 = [(CSDCall *)&v5 displayContext];
  }

  return v3;
}

- (BOOL)canBeAnsweredWithRequest:(id)a3
{
  id v4 = a3;
  if ([(CSDRelayCall *)self canBeAnsweredWithAudioOrVideoRelayWithRequest:v4]|| [(CSDRelayCall *)self canOnlyBeAnsweredWithoutAudioOrVideoRelayWithRequest:v4])
  {
    BOOL v5 = 1;
  }
  else if (-[CSDRelayCall isVideo](self, "isVideo") && [v4 behavior] == (id)4)
  {
    BOOL v5 = [(CSDRelayCall *)self supportsDisplayingFaceTimeAudioCalls];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)canBeAnsweredWithAudioOrVideoRelayWithRequest:(id)a3
{
  id v4 = a3;
  if ([(CSDRelayCall *)self hasRelaySupport:2]) {
    unsigned int v5 = ![(CSDRelayCall *)self canOnlyBeAnsweredWithoutAudioOrVideoRelayWithRequest:v4];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)canOnlyBeAnsweredWithoutAudioOrVideoRelayWithRequest:(id)a3
{
  if ([a3 wantsHoldMusic]) {
    return 1;
  }

  return [(CSDRelayCall *)self cannotRelayAudioOrVideo];
}

- (TUCallProvider)localProvider
{
  id v3 = [(CSDRelayCall *)self relayDelegate];
  id v4 = [(CSDRelayCall *)self provider];
  unsigned int v5 = [v4 identifier];
  objc_super v6 = [v3 localProviderWithIdentifier:v5];

  return (TUCallProvider *)v6;
}

- (NSSet)remoteParticipantHandles
{
  remoteParticipantHandles = self->_remoteParticipantHandles;
  if (remoteParticipantHandles)
  {
    id v3 = remoteParticipantHandles;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSDRelayCall;
    id v3 = [(CSDRelayCall *)&v5 remoteParticipantHandles];
  }

  return v3;
}

- (BOOL)supportsDisplayingFaceTimeAudioCalls
{
  id v2 = +[CSDCallCapabilities sharedInstance];
  id v3 = [v2 callCapabilitiesState];
  unsigned __int8 v4 = [v3 supportsDisplayingFaceTimeAudioCalls];

  return v4;
}

- (void)setAnnounceProviderIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CSDRelayCall *)self announceProviderIdentifier];
  char v6 = TUObjectsAreEqualOrNil();

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    uint64_t v9 = sub_1000B72EC;
    v10 = &unk_100504F10;
    v11 = self;
    id v12 = v4;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:&v7];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setCallStatus:(int)a3
{
  if (self->_callStatus != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B7398;
    v4[3] = &unk_100505080;
    v4[4] = self;
    int v5 = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setFailureExpected:(BOOL)a3
{
  if (self->_failureExpected != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B7448;
    v4[3] = &unk_100505030;
    v4[4] = self;
    BOOL v5 = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setSupportsEmergencyFallback:(BOOL)a3
{
  if (self->_supportsEmergencyFallback != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B74F8;
    v4[3] = &unk_100505030;
    v4[4] = self;
    BOOL v5 = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setNeedsManualInCallSounds:(BOOL)a3
{
  if (self->_needsManualInCallSounds != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B75A8;
    v4[3] = &unk_100505030;
    v4[4] = self;
    BOOL v5 = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setRemoteUplinkMuted:(BOOL)a3
{
  if (self->_remoteUplinkMuted != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B7658;
    v4[3] = &unk_100505030;
    v4[4] = self;
    BOOL v5 = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setTtyType:(int)a3
{
  if (self->_ttyType != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B7708;
    v4[3] = &unk_100505080;
    v4[4] = self;
    int v5 = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setSupportsTTYWithVoice:(BOOL)a3
{
  if (self->_supportsTTYWithVoice != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B77B8;
    v4[3] = &unk_100505030;
    v4[4] = self;
    BOOL v5 = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setBluetoothAudioFormat:(int64_t)a3
{
  if (self->_bluetoothAudioFormat != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B7864;
    v4[3] = &unk_100504EE8;
    v4[4] = self;
    void v4[5] = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setHandle:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDRelayCall *)self handle];
  char v6 = TUObjectsAreEqualOrNil();

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    uint64_t v9 = sub_1000B7944;
    v10 = &unk_100504F10;
    v11 = self;
    id v12 = v4;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:&v7];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setCallerNameFromNetwork:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDRelayCall *)self callerNameFromNetwork];
  char v6 = TUObjectsAreEqualOrNil();

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    uint64_t v9 = sub_1000B7A24;
    v10 = &unk_100504F10;
    v11 = self;
    id v12 = v4;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:&v7];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setCallGroupUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDRelayCall *)self callGroupUUID];
  char v6 = TUObjectsAreEqualOrNil();

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    uint64_t v9 = sub_1000B7B04;
    v10 = &unk_100504F10;
    v11 = self;
    id v12 = v4;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:&v7];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setDisplayContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDRelayCall *)self displayContext];
  char v6 = TUObjectsAreEqualOrNil();

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    uint64_t v9 = sub_1000B7BE4;
    v10 = &unk_100504F10;
    v11 = self;
    id v12 = v4;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:&v7];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setHardPauseDigitsState:(int)a3
{
  if ([(CSDRelayCall *)self hardPauseDigitsState] != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000B7C90;
    v5[3] = &unk_100505080;
    int v6 = a3;
    v5[4] = self;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setHardPauseDigits:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDRelayCall *)self hardPauseDigits];
  char v6 = TUObjectsAreEqualOrNil();

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    uint64_t v9 = sub_1000B7D98;
    v10 = &unk_100504F10;
    id v11 = v4;
    id v12 = self;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:&v7];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)groupWithOtherCall:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDRelayCall *)self callGroupUUID];

  if (v5)
  {
    char v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to group call because it is already grouped: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = [v4 callGroupUUID];

    if (!v7)
    {
      uint64_t v8 = +[NSUUID UUID];
      [v4 setCallGroupUUID:v8];
    }
    uint64_t v9 = [v4 callGroupUUID];
    [(CSDRelayCall *)self setCallGroupUUID:v9];

    char v6 = [(CSDRelayCall *)self relayDelegate];
    [v6 relayCall:self didGroupWithOtherCall:v4];
  }
}

- (void)ungroup
{
  id v3 = [(CSDRelayCall *)self callGroupUUID];

  if (v3)
  {
    [(CSDRelayCall *)self setCallGroupUUID:0];
    id v5 = [(CSDRelayCall *)self relayDelegate];
    [v5 relayCallDidUngroup:self];
  }
  else
  {
    id v4 = sub_100008DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to ungroup call because it isn't grouped: %@", buf, 0xCu);
    }
  }
}

- (BOOL)shouldOwnMuteHandler
{
  if ([(CSDRelayCall *)self isConferenceActive])
  {
    v6.receiver = self;
    v6.super_class = (Class)CSDRelayCall;
    return [(CSDCall *)&v6 shouldOwnMuteHandler];
  }
  else
  {
    id v4 = sub_100008DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(CSDRelayCall *)self uniqueProxyIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Call with UPI %@ cannot handle mute control requests since it is a relay call without conference active", buf, 0xCu);
    }
    return 0;
  }
}

- (BOOL)isConferenceActive
{
  id v3 = +[CSDRelayConferenceInterface sharedInstance];
  id v4 = [(CSDRelayCall *)self uniqueProxyIdentifier];
  id v5 = [v3 activeConferenceConnectionForIdentifier:v4];
  BOOL v6 = v5 != 0;

  return v6;
}

- (BOOL)isUplinkMuted
{
  id v3 = +[CSDRelayConferenceInterface sharedInstance];
  id v4 = [(CSDRelayCall *)self uniqueProxyIdentifier];
  unsigned __int8 v5 = [v3 isMutedForIdentifier:v4];

  return v5;
}

- (void)performUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asked to perform uplinkMuted: %d", (uint8_t *)v7, 8u);
  }

  [(CSDRelayCall *)self setUplinkMuted:v3];
  BOOL v6 = [(CSDRelayCall *)self relayDelegate];
  [v6 relayCallDidPerformUplinkMuted:self uplinkMuted:v3];
}

- (void)setUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CSDRelayCall;
  -[CSDCall setUplinkMuted:](&v16, "setUplinkMuted:");
  unsigned __int8 v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v18[0]) = v3;
    WORD2(v18[0]) = 2112;
    *(void *)((char *)v18 + 6) = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting uplinkMuted to %d for call %@", buf, 0x12u);
  }

  BOOL v6 = +[CSDRelayConferenceInterface sharedInstance];
  uint64_t v7 = [(CSDRelayCall *)self uniqueProxyIdentifier];
  uint64_t v8 = [v6 activeConferenceConnectionForIdentifier:v7];

  if (v8)
  {
    uint64_t v9 = +[CSDRelayConferenceInterface sharedInstance];
    int v10 = [(CSDRelayCall *)self uniqueProxyIdentifier];
    unsigned int v11 = [v9 isMutedForIdentifier:v10];

    if (v11 != v3)
    {
      id v12 = +[CSDRelayConferenceInterface sharedInstance];
      id v13 = [(CSDRelayCall *)self uniqueProxyIdentifier];
      [v12 setMuted:v3 forIdentifier:v13];

      [(CSDCall *)self updateUplinkMuted:v3];
    }
  }
  else
  {
    uint64_t v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v15 = @"NO";
      if (v3) {
        CFStringRef v15 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v18[0] = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Ignoring set uplinkMuted: %@, since there is no connection", buf, 0xCu);
    }
  }
}

- (BOOL)isSendingAudio
{
  BOOL v3 = +[CSDRelayConferenceInterface sharedInstance];
  id v4 = [(CSDRelayCall *)self uniqueProxyIdentifier];
  unsigned __int8 v5 = [v3 isSendingAudioForIdentifier:v4];

  return v5;
}

- (void)setIsSendingAudio:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = +[CSDRelayConferenceInterface sharedInstance];
  unsigned __int8 v5 = [(CSDRelayCall *)self uniqueProxyIdentifier];
  [v6 setSendingAudio:v3 forIdentifier:v5];
}

- (int64_t)inputAudioPowerSpectrumToken
{
  BOOL v3 = +[CSDRelayConferenceInterface sharedInstance];
  id v4 = [(CSDRelayCall *)self uniqueProxyIdentifier];
  id v5 = [v3 inputAudioPowerSpectrumTokenForIdentifier:v4];

  return (int64_t)v5;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  BOOL v3 = +[CSDRelayConferenceInterface sharedInstance];
  id v4 = [(CSDRelayCall *)self uniqueProxyIdentifier];
  id v5 = [v3 outputAudioPowerSpectrumTokenForIdentifier:v4];

  return (int64_t)v5;
}

- (int64_t)spatialAudioSourceIdentifier
{
  BOOL v3 = +[CSDRelayConferenceInterface sharedInstance];
  id v4 = [(CSDRelayCall *)self uniqueProxyIdentifier];
  id v5 = [v3 spatialAudioSourceIdentifierForIdentifier:v4];

  return (int64_t)v5;
}

- (void)dialWithRequest:(id)a3 displayContext:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)CSDRelayCall;
  id v6 = a3;
  [(CSDCall *)&v13 dialWithRequest:v6 displayContext:a4];
  uint64_t v7 = objc_msgSend(v6, "handle", v13.receiver, v13.super_class);
  [(CSDRelayCall *)self setHandle:v7];

  uint64_t v8 = [v6 provider];
  [(CSDRelayCall *)self setProvider:v8];

  uint64_t v9 = [v6 localSenderIdentityUUID];
  [(CSDRelayCall *)self setLocalSenderIdentityUUID:v9];

  int v10 = [v6 localSenderIdentityAccountUUID];
  [(CSDRelayCall *)self setLocalSenderIdentityAccountUUID:v10];

  [(CSDRelayCall *)self setCallStatus:3];
  [(CSDRelayCall *)self setOutgoing:1];
  -[CSDRelayCall setVoicemail:](self, "setVoicemail:", [v6 dialType] == (id)2);
  -[CSDRelayCall setEmergency:](self, "setEmergency:", [v6 dialType] == (id)1);
  -[CSDRelayCall setSOS:](self, "setSOS:", [v6 isSOS]);
  [v6 ttyType];
  [(CSDRelayCall *)self setTtyType:TUCallTTYTypeForTUDialRequestTTYType()];
  id v11 = [v6 originatingUIType];

  [(CSDRelayCall *)self setOriginatingUIType:v11];
  id v12 = [(CSDRelayCall *)self relayDelegate];
  [v12 relayCallDidDial:self];

  [(CSDCall *)self propertiesChanged];
}

- (void)joinConversationWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CSDRelayCall joinConversationWithRequest: %@", (uint8_t *)&v9, 0xCu);
  }

  [(CSDRelayCall *)self setJoinConversationRequest:v4];
  [(CSDRelayCall *)self setCallStatus:3];
  [(CSDRelayCall *)self setOutgoing:1];
  [(CSDRelayCall *)self setVoicemail:0];
  [(CSDRelayCall *)self setEmergency:0];
  [(CSDRelayCall *)self setSOS:0];
  id v6 = objc_alloc_init((Class)TUCallProviderManager);
  uint64_t v7 = [v6 faceTimeProvider];
  [(CSDRelayCall *)self setProvider:v7];

  -[CSDRelayCall setOriginatingUIType:](self, "setOriginatingUIType:", [v4 originatingUIType]);
  uint64_t v8 = [(CSDRelayCall *)self relayDelegate];
  [v8 relayCallDidJoin:self];

  [(CSDCall *)self propertiesChanged];
}

- (void)answerWithRequest:(id)a3
{
  id v4 = a3;
  if (([(CSDRelayCall *)self isConnecting] & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)CSDRelayCall;
    [(CSDRelayCall *)&v6 answerWithRequest:v4];
    id v5 = [(CSDRelayCall *)self relayDelegate];
    [v5 relayCall:self didAnswerWithRequest:v4];
  }
}

- (void)disconnectWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(CSDRelayCall *)self status] != 6)
  {
    v8.receiver = self;
    v8.super_class = (Class)CSDRelayCall;
    [(CSDRelayCall *)&v8 disconnectWithReason:v3];
    [(CSDRelayCall *)self setCallStatus:6];
    id v5 = [(CSDRelayCall *)self relayDelegate];
    [v5 relayCallDidDisconnect:self];

    objc_super v6 = +[CSDRelayConferenceInterface sharedInstance];
    uint64_t v7 = [(CSDRelayCall *)self uniqueProxyIdentifier];
    [v6 stopConferenceForIdentifier:v7];
  }
}

- (void)startConferenceForAnsweredCallWithTransport:(id)a3 remoteInviteDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = +[CSDRelayConferenceInterface sharedInstance];
  int v9 = [(CSDRelayCall *)self uniqueProxyIdentifier];
  v10[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B8C68;
  v11[3] = &unk_100505530;
  v11[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B8DB0;
  v10[3] = &unk_100505530;
  [v8 startConferenceForIdentifier:v9 usingTransport:v7 remoteInviteDictionary:v6 didStartHandler:v11 didStopHandler:v10];
}

- (void)startConferenceForDialedCallWithTransport:(id)a3 remoteInviteDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = +[CSDRelayConferenceInterface sharedInstance];
  int v9 = [(CSDRelayCall *)self uniqueProxyIdentifier];
  v10[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B8FC4;
  v11[3] = &unk_100505530;
  v11[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B910C;
  v10[3] = &unk_100505530;
  [v8 startConferenceForIdentifier:v9 usingTransport:v7 remoteInviteDictionary:v6 didStartHandler:v11 didStopHandler:v10];
}

- (void)startConferenceForPulledCallWithTransport:(id)a3 remoteInviteDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = +[CSDRelayConferenceInterface sharedInstance];
  int v9 = [(CSDRelayCall *)self uniqueProxyIdentifier];
  v10[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B9320;
  v11[3] = &unk_100505530;
  v11[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B9434;
  v10[3] = &unk_100505530;
  [v8 startConferenceForIdentifier:v9 usingTransport:v7 remoteInviteDictionary:v6 didStartHandler:v11 didStopHandler:v10];
}

- (void)stopConference
{
  id v4 = +[CSDRelayConferenceInterface sharedInstance];
  uint64_t v3 = [(CSDRelayCall *)self uniqueProxyIdentifier];
  [v4 stopConferenceForIdentifier:v3];
}

- (void)hold
{
  if ([(CSDRelayCall *)self status] == 2)
  {
    uint64_t v3 = sub_100008DCC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to hold call because it is already held: %@", buf, 0xCu);
    }
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B96BC;
    v4[3] = &unk_100504EC0;
    v4[4] = self;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    uint64_t v3 = [(CSDRelayCall *)self relayDelegate];
    [v3 relayCallDidHold:self];
  }
}

- (void)unhold
{
  if ([(CSDRelayCall *)self status] == 2)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B97E8;
    v4[3] = &unk_100504EC0;
    v4[4] = self;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    uint64_t v3 = [(CSDRelayCall *)self relayDelegate];
    [v3 relayCallDidUnhold:self];
  }
  else
  {
    uint64_t v3 = sub_100008DCC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to unhold call because it isn't held: %@", buf, 0xCu);
    }
  }
}

- (void)playLocalDTMFToneForKey:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v5 = [(CSDRelayCall *)self relayDelegate];
  [v5 relayCall:self didPlayLocalDTMFToneForKey:v3];
}

- (void)sendHardPauseDigits
{
  id v3 = [(CSDRelayCall *)self relayDelegate];
  [v3 relayCallDidSendHardPauseDigits:self];
}

- (void)becomeEndpointForPullFromRemoteDevice
{
  [(CSDCall *)self setEndpointOnCurrentDevice:1];
  id v3 = [(CSDRelayCall *)self relayDelegate];
  [v3 relayCallDidBecomeEndpointForPull:self];
}

- (void)setLocallyHasStartedOutgoing
{
  if ([(CSDRelayCall *)self isOutgoing])
  {
    id v3 = [(CSDCall *)self dateStartedOutgoing];

    if (!v3)
    {
      id v4 = +[NSDate date];
      [(CSDCall *)self setDateStartedOutgoing:v4];
    }
  }
}

- (void)setLocallyHasSentInvitation
{
  id v3 = [(CSDRelayCall *)self dateSentInvitation];

  if (!v3)
  {
    id v4 = +[NSDate date];
    [(CSDCall *)self setDateSentInvitation:v4];
  }
}

- (void)setLocallyConnecting
{
  [(CSDRelayCall *)self setCallStatus:1];
  id v3 = [(CSDRelayCall *)self dateStartedConnecting];

  if (!v3)
  {
    id v4 = +[NSDate date];
    [(CSDCall *)self setDateStartedConnecting:v4];
  }
}

- (void)setLocallyConnected
{
  [(CSDRelayCall *)self setLocallyConnecting];
  id v3 = [(CSDRelayCall *)self dateConnected];

  if (!v3)
  {
    id v4 = +[NSDate date];
    [(CSDCall *)self setDateConnected:v4];
  }
}

- (void)setLocallyDisconnectedWithReasonIfNone:(int)a3
{
}

- (void)setLocallyDisconnectedWithReasonIfNone:(int)a3 stopConference:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if ([(CSDRelayCall *)self status] != 6)
  {
    if (![(CSDRelayCall *)self disconnectedReason]) {
      [(CSDCall *)self setDisconnectedReason:v5];
    }
    [(CSDRelayCall *)self setCallStatus:6];
    id v8 = +[CSDRelayConferenceInterface sharedInstance];
    id v7 = [(CSDRelayCall *)self uniqueProxyIdentifier];
    if (v4) {
      [v8 stopConferenceForIdentifier:v7];
    }
    else {
      [v8 prepareToStopConferenceForIdentifier:v7];
    }
  }
}

- (NSString)announceProviderIdentifier
{
  return self->_announceProviderIdentifier;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (int)callStatus
{
  return self->_callStatus;
}

- (TUCallProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (NSUUID)callGroupUUID
{
  return self->_callGroupUUID;
}

- (BOOL)isOutgoing
{
  return self->_outgoing;
}

- (void)setOutgoing:(BOOL)a3
{
  self->_outgoing = a3;
}

- (BOOL)isVideo
{
  return self->_video;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (BOOL)isVoicemail
{
  return self->_voicemail;
}

- (void)setVoicemail:(BOOL)a3
{
  self->_voicemail = a3;
}

- (BOOL)isEmergency
{
  return self->_emergency;
}

- (void)setEmergency:(BOOL)a3
{
  self->_emergency = a3;
}

- (BOOL)isFailureExpected
{
  return self->_failureExpected;
}

- (BOOL)supportsEmergencyFallback
{
  return self->_supportsEmergencyFallback;
}

- (BOOL)isSOS
{
  return self->_sos;
}

- (void)setSOS:(BOOL)a3
{
  self->_sos = a3;
}

- (NSString)callerNameFromNetwork
{
  return self->_callerNameFromNetwork;
}

- (BOOL)needsManualInCallSounds
{
  return self->_needsManualInCallSounds;
}

- (BOOL)isRemoteUplinkMuted
{
  return self->_remoteUplinkMuted;
}

- (unint64_t)initialLinkType
{
  return self->_initialLinkType;
}

- (void)setInitialLinkType:(unint64_t)a3
{
  self->_initialLinkType = a3;
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

- (void)setRemoteParticipantHandles:(id)a3
{
}

- (int)ttyType
{
  return self->_ttyType;
}

- (BOOL)supportsTTYWithVoice
{
  return self->_supportsTTYWithVoice;
}

- (int64_t)bluetoothAudioFormat
{
  return self->_bluetoothAudioFormat;
}

- (int)originatingUIType
{
  return self->_originatingUIType;
}

- (void)setOriginatingUIType:(int)a3
{
  self->_originatingUIType = a3;
}

- (BOOL)isConversation
{
  return self->_conversation;
}

- (void)setConversation:(BOOL)a3
{
  self->_conversation = a3;
}

- (CSDRelayCallDelegate)relayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relayDelegate);

  return (CSDRelayCallDelegate *)WeakRetained;
}

- (void)setRelayDelegate:(id)a3
{
}

- (TUJoinConversationRequest)joinConversationRequest
{
  return self->_joinConversationRequest;
}

- (void)setJoinConversationRequest:(id)a3
{
}

- (BOOL)cannotRelayAudioOrVideo
{
  return self->_cannotRelayAudioOrVideo;
}

- (void)setCannotRelayAudioOrVideo:(BOOL)a3
{
  self->_cannotRelayAudioOrVideo = a3;
}

- (NSDictionary)remoteInviteDictionary
{
  return self->_remoteInviteDictionary;
}

- (void)setRemoteInviteDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteInviteDictionary, 0);
  objc_storeStrong((id *)&self->_joinConversationRequest, 0);
  objc_destroyWeak((id *)&self->_relayDelegate);
  objc_storeStrong((id *)&self->_remoteParticipantHandles, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityAccountUUID, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityUUID, 0);
  objc_storeStrong((id *)&self->_displayContext, 0);
  objc_storeStrong((id *)&self->_callerNameFromNetwork, 0);
  objc_storeStrong((id *)&self->_callGroupUUID, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_announceProviderIdentifier, 0);
}

@end