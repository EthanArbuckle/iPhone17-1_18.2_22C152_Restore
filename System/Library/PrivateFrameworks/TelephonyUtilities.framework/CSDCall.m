@interface CSDCall
- (BOOL)endDueToHandoff;
- (BOOL)faceTimeIDStatusRefreshed;
- (BOOL)hasAudioFinished;
- (BOOL)hasAudioInterruption;
- (BOOL)hasIdentifiedSpamInCallerName;
- (BOOL)hasNondisclosedGreeting;
- (BOOL)hasStartedOutgoing;
- (BOOL)ignoresBluetoothDeviceUID;
- (BOOL)isAnsweringMachineAvailable;
- (BOOL)isEmergency;
- (BOOL)isKnownCaller;
- (BOOL)isLocalUserInHomeCountry;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isOutgoing;
- (BOOL)isSOS;
- (BOOL)isSendingAudio;
- (BOOL)isUnderlyingLinksConnected;
- (BOOL)isVoicemail;
- (BOOL)joinedFromLink;
- (BOOL)mayRequireBreakBeforeMake;
- (BOOL)mediaPlaybackOnExternalDevice;
- (BOOL)mixesVoiceWithMedia;
- (BOOL)needsConversationOrVideoRelaySupport;
- (BOOL)needsConversationRelaySupport;
- (BOOL)remoteDoesHandoff;
- (BOOL)shouldHandleMuteRequests;
- (BOOL)shouldOverrideCallStatus;
- (BOOL)shouldOwnMuteHandler;
- (BOOL)startAsHandoff;
- (BOOL)startAsOneToOneMode;
- (BOOL)temporaryRequireInCallSounds;
- (BOOL)uplinkWasExplicitlyMuted;
- (CSDCall)initWithUniqueProxyIdentifier:(id)a3 configuration:(id)a4;
- (CSDCall)initWithUniqueProxyIdentifier:(id)a3 configuration:(id)a4 idQueryController:(id)a5;
- (CSDCallDataSource)dataSource;
- (CSDCallDelegate)delegate;
- (CSDIDSTransport)relayClientTransport;
- (CSDMuteProcessAttributionProtocol)audioApplication;
- (CXCall)cxCall;
- (IDSDestination)expectedRelayClientDestination;
- (IDSIDQueryController)idQueryController;
- (NSDate)dateStartedOutgoing;
- (NSDate)temporaryDateStartedOutgoing;
- (NSDictionary)handoffActivityUserInfo;
- (NSDictionary)silencingUserInfo;
- (NSError)recordingAllowedError;
- (NSError)recordingDisabledError;
- (NSSet)activeRemoteParticipants;
- (NSString)handoffDynamicIdentifier;
- (NSString)ringtoneSubscriptionIdentifier;
- (OS_dispatch_source)timeoutTimer;
- (TUCallRecordingSession)recordingSession;
- (TUDialRequest)dialRequest;
- (TUDynamicCallDisplayContext)dynamicDisplayContext;
- (double)remoteUplinkMutedSetTime;
- (double)uplinkMutedSetTime;
- (id)displayContext;
- (id)handle;
- (int)callRelaySupport;
- (int)callStatus;
- (int)callStatusFromOverride;
- (int)callStatusFromUnderlyingSource;
- (int)faceTimeIDStatus;
- (int)recordingAvailability;
- (int64_t)audioInterruptionOperationMode;
- (int64_t)audioInterruptionProviderType;
- (int64_t)bytesOfDataUsed;
- (int64_t)identificationCategory;
- (int64_t)junkConfidence;
- (int64_t)liveVoicemailStatus;
- (int64_t)providerEndedReason;
- (int64_t)providerErrorCode;
- (int64_t)transmissionState;
- (unint64_t)initialLinkType;
- (void)_refreshFaceTimeIDSStatus;
- (void)_refreshFaceTimeIDSStatusIfNecessary;
- (void)dealloc;
- (void)dialWithRequest:(id)a3 displayContext:(id)a4;
- (void)disconnect;
- (void)disconnectCallWithReason:(int)a3;
- (void)handleAudioSessionActivationStateChangedTo:(id)a3;
- (void)handleUpdatedPropertiesAfterChangesInBlock:(id)a3;
- (void)idStatusUpdatedForDestinations:(id)a3 service:(id)a4;
- (void)propertiesChanged;
- (void)setActiveRemoteParticipants:(id)a3;
- (void)setAnsweringMachineAvailable:(BOOL)a3;
- (void)setAnsweringMachineStreamToken:(int64_t)a3;
- (void)setAudioApplication:(id)a3;
- (void)setBytesOfDataUsed:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDateConnected:(id)a3;
- (void)setDateEnded:(id)a3;
- (void)setDateSentInvitation:(id)a3;
- (void)setDateStartedConnecting:(id)a3;
- (void)setDateStartedOutgoing:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDialRequest:(id)a3;
- (void)setDisconnectedReason:(int)a3;
- (void)setDynamicDisplayContext:(id)a3;
- (void)setEndDueToHandoff:(BOOL)a3;
- (void)setEndpointOnCurrentDevice:(BOOL)a3;
- (void)setExpectedRelayClientDestination:(id)a3;
- (void)setFaceTimeIDStatus:(int)a3;
- (void)setFaceTimeIDStatusRefreshed:(BOOL)a3;
- (void)setHasAudioFinished:(BOOL)a3;
- (void)setHasAudioInterruption:(BOOL)a3;
- (void)setIdentificationCategory:(int64_t)a3;
- (void)setIdentifiedSpamInCallerName:(BOOL)a3;
- (void)setIsKnownCaller:(BOOL)a3;
- (void)setIsSendingAudio:(BOOL)a3;
- (void)setIsUnderlyingLinksConnected:(BOOL)a3;
- (void)setJoinedFromLink:(BOOL)a3;
- (void)setJunkConfidence:(int64_t)a3;
- (void)setLiveVoicemailStatus:(int64_t)a3;
- (void)setLocalUserInHomeCountry:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setNondisclosedGreeting:(BOOL)a3;
- (void)setRecordingSession:(id)a3;
- (void)setRelayClientTransport:(id)a3;
- (void)setRemoteDoesHandoff:(BOOL)a3;
- (void)setRemoteUplinkMutedSetTime:(double)a3;
- (void)setRingtoneSubscriptionIdentifier:(id)a3;
- (void)setScreening:(BOOL)a3;
- (void)setScreeningAnnouncementHasFinished:(BOOL)a3;
- (void)setShouldSuppressRingtone:(BOOL)a3;
- (void)setSilencingUserInfo:(id)a3;
- (void)setSoundRegion:(int64_t)a3;
- (void)setStartAsHandoff:(BOOL)a3;
- (void)setStartAsOneToOneMode:(BOOL)a3;
- (void)setSupportsDTMFUpdates:(BOOL)a3;
- (void)setTemporaryDateStartedOutgoing:(id)a3;
- (void)setTemporaryRequireInCallSounds:(BOOL)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setTransitionStatus:(int)a3;
- (void)setTransmissionState:(int64_t)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setUplinkMutedSetTime:(double)a3;
- (void)setUplinkWasExplicitlyMuted:(BOOL)a3;
- (void)setWantsHoldMusic:(BOOL)a3;
- (void)setWasDialAssisted:(BOOL)a3;
- (void)unmuteAfterDisconnect;
- (void)unsuppressRingtoneIfNecessary;
- (void)updateWithProxyCall:(id)a3;
@end

@implementation CSDCall

- (CSDCall)initWithUniqueProxyIdentifier:(id)a3 configuration:(id)a4 idQueryController:(id)a5
{
  v8 = (IDSIDQueryController *)a5;
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CSDCall;
  v10 = -[CSDCall initWithUniqueProxyIdentifier:endpointOnCurrentDevice:](&v16, "initWithUniqueProxyIdentifier:endpointOnCurrentDevice:", v9, [a4 isEndpointOnCurrentDevice]);

  idQueryController = v10->_idQueryController;
  v10->_idQueryController = v8;
  v12 = v8;

  uint64_t v13 = IDSServiceNameFaceTime;
  v14 = [(CSDCall *)v10 queue];
  [(IDSIDQueryController *)v12 addDelegate:v10 forService:v13 listenerID:@"com.apple.TUCallCenter" queue:v14];

  return v10;
}

- (CSDCall)initWithUniqueProxyIdentifier:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[IDSIDQueryController sharedInstance];
  id v9 = [(CSDCall *)self initWithUniqueProxyIdentifier:v7 configuration:v6 idQueryController:v8];

  return v9;
}

- (void)dealloc
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Call is being deallocated", buf, 2u);
  }

  [(CSDCall *)self setTimeoutTimer:0];
  v4.receiver = self;
  v4.super_class = (Class)CSDCall;
  [(CSDCall *)&v4 dealloc];
}

- (void)unmuteAfterDisconnect
{
}

- (int)callRelaySupport
{
  if ([(CSDCall *)self lockdownModeEnabled]) {
    return 0;
  }
  if ([(CSDCall *)self isConversation])
  {
    objc_super v4 = +[TUCallCenter sharedInstance];
    v5 = [v4 activeConversationForCall:self];

    id v6 = [v5 activitySessions];
    id v7 = [v6 anyObject];

    if (v7)
    {
      if ([v7 state] == (id)1) {
        int v3 = 1;
      }
      else {
        int v3 = 2;
      }
    }
    else
    {
      int v3 = 2;
    }
  }
  else if ([(CSDCall *)self isVideo])
  {
    return 1;
  }
  else
  {
    return 2;
  }
  return v3;
}

- (BOOL)needsConversationOrVideoRelaySupport
{
  if (![(CSDCall *)self isConversation]) {
    return 0;
  }
  int v3 = [(CSDCall *)self remoteParticipantHandles];
  if ((unint64_t)[v3 count] <= 1) {
    unsigned __int8 v4 = [(CSDCall *)self isVideo];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (BOOL)needsConversationRelaySupport
{
  if (![(CSDCall *)self isConversation]) {
    return 0;
  }
  int v3 = [(CSDCall *)self remoteParticipantHandles];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (int)recordingAvailability
{
  int v3 = [(CSDCall *)self recordingAllowedError];
  BOOL v4 = [(CSDCall *)self recordingDisabledError];
  if (v3) {
    int v5 = 2;
  }
  else {
    int v5 = 3;
  }
  if (v4) {
    int v6 = 1;
  }
  else {
    int v6 = v5;
  }

  return v6;
}

- (void)dialWithRequest:(id)a3 displayContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([v7 isValid] & 1) == 0)
  {
    v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, self, @"CSDCall.m", 243, @"dialRequest is invalid: %@", v7 object file lineNumber description];
  }
  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "dialRequest: %@ displayContext: %@", buf, 0x16u);
  }

  [(CSDCall *)self setDialRequest:v7];
  -[CSDCall setWasDialAssisted:](self, "setWasDialAssisted:", [v7 isDialAssisted]);
  v10 = [v7 audioSourceIdentifier];
  [(CSDCall *)self setSourceIdentifier:v10];

  if (v8)
  {
    id v11 = objc_alloc((Class)TUDynamicCallDisplayContext);
    v12 = [(CSDCall *)self queue];
    id v13 = [v11 initWithDisplayContext:v8 call:self serialQueue:v12];
    [(CSDCall *)self setDynamicDisplayContext:v13];

    v14 = [(CSDCall *)self dynamicDisplayContext];
    [v14 setDelegate:self];
  }
}

- (void)disconnect
{
}

- (void)disconnectCallWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = (int)v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "diconnectCallWithReason: %lu", (uint8_t *)&v6, 0xCu);
  }

  [(CSDCall *)self disconnectWithReason:v3];
}

- (void)unsuppressRingtoneIfNecessary
{
  if ([(CSDCall *)self shouldSuppressRingtone])
  {
    id v3 = objc_alloc_init((Class)CUTWeakLinkClass());
    [v3 setType:2];
    objc_initWeak(&location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000EA364;
    v6[3] = &unk_1005074C8;
    objc_copyWeak(&v8, &location);
    id v4 = v3;
    id v7 = v4;
    [v4 setCompletionHandler:v6];
    int v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting coordinated alert request to determine ringtone un-suppression: %@", buf, 0xCu);
    }

    [v4 start];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)updateWithProxyCall:(id)a3
{
  id v4 = a3;
  -[CSDCall setDisconnectedReason:](self, "setDisconnectedReason:", [v4 disconnectedReason]);
  -[CSDCall setShouldSuppressRingtone:](self, "setShouldSuppressRingtone:", [v4 shouldSuppressRingtone]);
  id v5 = [v4 wantsHoldMusic];

  [(CSDCall *)self setWantsHoldMusic:v5];
}

- (void)setHasAudioInterruption:(BOOL)a3
{
  if (self->_hasAudioInterruption != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000EA68C;
    v4[3] = &unk_100505030;
    v4[4] = self;
    BOOL v5 = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setRelayClientTransport:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCall *)self relayClientTransport];
  char v6 = TUObjectsAreEqualOrNil();

  if ((v6 & 1) == 0)
  {
    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    id v9 = sub_1000EA770;
    v10 = &unk_100504F10;
    id v11 = self;
    id v12 = v4;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:&v7];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setTransitionStatus:(int)a3
{
  if ([(CSDCall *)self transitionStatus] != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000EA81C;
    v5[3] = &unk_100505080;
    int v6 = a3;
    v5[4] = self;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setWantsHoldMusic:(BOOL)a3
{
  if ([(CSDCall *)self wantsHoldMusic] != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000EA8F4;
    v5[3] = &unk_100505030;
    BOOL v6 = a3;
    v5[4] = self;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setWasDialAssisted:(BOOL)a3
{
  if ([(CSDCall *)self wasDialAssisted] != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000EA9CC;
    v5[3] = &unk_100505030;
    BOOL v6 = a3;
    v5[4] = self;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setScreeningAnnouncementHasFinished:(BOOL)a3
{
  if ([(CSDCall *)self screeningAnnouncementHasFinished] != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000EAAA4;
    v5[3] = &unk_100505030;
    BOOL v6 = a3;
    v5[4] = self;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setDisconnectedReason:(int)a3
{
  if ([(CSDCall *)self disconnectedReason] != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000EAB7C;
    v5[3] = &unk_100505080;
    int v6 = a3;
    v5[4] = self;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setShouldSuppressRingtone:(BOOL)a3
{
  if ([(CSDCall *)self shouldSuppressRingtone] != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000EAC54;
    v5[3] = &unk_100505030;
    BOOL v6 = a3;
    v5[4] = self;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setFaceTimeIDStatus:(int)a3
{
  if ([(CSDCall *)self faceTimeIDStatus] != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000EAD2C;
    v5[3] = &unk_100505080;
    int v6 = a3;
    v5[4] = self;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setSoundRegion:(int64_t)a3
{
  if ([(CSDCall *)self soundRegion] != (id)a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000EAE00;
    v5[3] = &unk_100504EE8;
    v5[4] = self;
    void v5[5] = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setModel:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCall *)self model];

  if (v5 != v4)
  {
    int v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    uint64_t v8 = sub_1000EAEFC;
    id v9 = &unk_100504F10;
    id v10 = v4;
    id v11 = self;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:&v6];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setAnsweringMachineStreamToken:(int64_t)a3
{
  if ([(CSDCall *)self answeringMachineStreamToken] != (id)a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000EAFCC;
    v5[3] = &unk_100504EE8;
    v5[4] = self;
    void v5[5] = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setSupportsDTMFUpdates:(BOOL)a3
{
  if ([(CSDCall *)self supportsDTMFUpdates] != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000EB0A0;
    v5[3] = &unk_100505030;
    BOOL v6 = a3;
    v5[4] = self;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  if ([(CSDCall *)self isEndpointOnCurrentDevice] != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000EB178;
    v5[3] = &unk_100505030;
    BOOL v6 = a3;
    v5[4] = self;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setScreening:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CSDCall *)self isScreening] != a3)
  {
    [(CSDCall *)self setWasScreened:[(CSDCall *)self wasScreened] | v3];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000EB264;
    v5[3] = &unk_100505030;
    BOOL v6 = v3;
    v5[4] = self;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v5];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setDateSentInvitation:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCall *)self dateSentInvitation];
  char v6 = TUObjectsAreEqualOrNil();

  if (v6)
  {
    uint64_t v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(CSDCall *)self dateSentInvitation];
      *(_DWORD *)buf = 138412546;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "self.dateSentInvitation: %@, dateSentInvitation: %@", buf, 0x16u);
    }
  }
  else
  {
    if ([(CSDCall *)self isOutgoing])
    {
      id v9 = [(CSDCall *)self dateStartedOutgoing];

      if (!v9) {
        [(CSDCall *)self setDateStartedOutgoing:v4];
      }
    }
    v10.receiver = self;
    v10.super_class = (Class)CSDCall;
    [(CSDCall *)&v10 setDateSentInvitation:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setDateStartedConnecting:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCall *)self dateStartedConnecting];
  char v6 = TUObjectsAreEqualOrNil();

  if ((v6 & 1) == 0)
  {
    if ([(CSDCall *)self isOutgoing])
    {
      uint64_t v7 = [(CSDCall *)self dateSentInvitation];

      if (!v7) {
        [(CSDCall *)self setDateSentInvitation:v4];
      }
    }
    v8.receiver = self;
    v8.super_class = (Class)CSDCall;
    [(CSDCall *)&v8 setDateStartedConnecting:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setDateConnected:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCall *)self dateConnected];
  char v6 = TUObjectsAreEqualOrNil();

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(CSDCall *)self dateStartedConnecting];

    if (!v7) {
      [(CSDCall *)self setDateStartedConnecting:v4];
    }
    v8.receiver = self;
    v8.super_class = (Class)CSDCall;
    [(CSDCall *)&v8 setDateConnected:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setRecordingSession:(id)a3
{
  id v4 = (TUCallRecordingSession *)a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    objc_super v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting recording session %@", (uint8_t *)&v7, 0xCu);
  }

  recordingSession = self->_recordingSession;
  self->_recordingSession = v4;

  [(CSDCall *)self propertiesChanged];
}

- (void)setDateEnded:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCall *)self dateEnded];
  char v6 = TUObjectsAreEqualOrNil();

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)CSDCall;
    [(CSDCall *)&v7 setDateEnded:v4];
    [(CSDCall *)self updateForDisconnection];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setDateStartedOutgoing:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCall *)self dateStartedOutgoing];
  char v6 = TUObjectsAreEqualOrNil();

  if ((v6 & 1) == 0)
  {
    objc_super v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    id v9 = sub_1000EB78C;
    objc_super v10 = &unk_100504F10;
    id v11 = self;
    id v12 = v4;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:&v7];
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setIsKnownCaller:(BOOL)a3
{
  if ([(CSDCall *)self isKnownCaller] != a3)
  {
    self->_isKnownCaller = a3;
    [(CSDCall *)self propertiesChanged];
  }
}

- (void)setUplinkMuted:(BOOL)a3
{
  if (a3) {
    [(CSDCall *)self setUplinkWasExplicitlyMuted:1];
  }
}

- (BOOL)shouldOwnMuteHandler
{
  if ([(CSDCall *)self isOnHold])
  {
    BOOL v3 = sub_100008DCC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(CSDCall *)self uniqueProxyIdentifier];
      int v6 = 138412290;
      objc_super v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Call with UPI %@ cannot own mute handler since it is held", (uint8_t *)&v6, 0xCu);
    }
    return 0;
  }
  else
  {
    return [(CSDCall *)self shouldHandleMuteRequests];
  }
}

- (BOOL)shouldHandleMuteRequests
{
  if ([(CSDCall *)self status] != 1
    && [(CSDCall *)self status] != 3
    && [(CSDCall *)self status] != 2)
  {
    BOOL v3 = sub_100008DCC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v7 = [(CSDCall *)self uniqueProxyIdentifier];
      int v8 = 138412546;
      id v9 = v7;
      __int16 v10 = 1024;
      unsigned int v11 = [(CSDCall *)self status];
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Call with UPI %@ cannot handle mute control requests since the call status is not eligible for mute control %d", (uint8_t *)&v8, 0x12u);
    }
    goto LABEL_15;
  }
  if ([(CSDCall *)self isScreening])
  {
    BOOL v3 = sub_100008DCC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(CSDCall *)self uniqueProxyIdentifier];
      int v8 = 138412290;
      id v9 = v4;
      id v5 = "Call with UPI %@ cannot handle mute control requests since it is screening";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (([(CSDCall *)self isEndpointOnCurrentDevice] & 1) != 0
      || ([(CSDCall *)self isHostedOnCurrentDevice] & 1) != 0)
    {
      return 1;
    }
    BOOL v3 = sub_100008DCC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(CSDCall *)self uniqueProxyIdentifier];
      int v8 = 138412290;
      id v9 = v4;
      id v5 = "Call with UPI %@ cannot handle mute control requests since it is not endpoint for the call";
      goto LABEL_14;
    }
  }
LABEL_15:

  return 0;
}

- (void)setTimeoutTimer:(id)a3
{
  id v5 = a3;
  p_timeoutTimer = (id *)&self->_timeoutTimer;
  objc_super v7 = *p_timeoutTimer;
  id v8 = v5;
  if (*p_timeoutTimer != v5)
  {
    if (v7) {
      dispatch_source_cancel(v7);
    }
    objc_storeStrong(p_timeoutTimer, a3);
    if (*p_timeoutTimer) {
      dispatch_activate((dispatch_object_t)*p_timeoutTimer);
    }
  }
}

- (void)setTransmissionState:(int64_t)a3
{
  if (self->_transmissionState != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000EBC4C;
    v4[3] = &unk_100504EE8;
    v4[4] = self;
    void v4[5] = a3;
    [(CSDCall *)self handleUpdatedPropertiesAfterChangesInBlock:v4];
    [(CSDCall *)self propertiesChanged];
  }
}

- (int)callStatus
{
  if ([(CSDCall *)self shouldOverrideCallStatus])
  {
    return [(CSDCall *)self callStatusFromOverride];
  }
  else
  {
    return [(CSDCall *)self callStatusFromUnderlyingSource];
  }
}

- (int)callStatusFromUnderlyingSource
{
  return 0;
}

- (BOOL)shouldOverrideCallStatus
{
  return [(CSDCall *)self disconnectedReason] == 17
      || [(CSDCall *)self disconnectedReason] == 14
      || [(CSDCall *)self disconnectedReason] == 21;
}

- (int)callStatusFromOverride
{
  return 6;
}

- (BOOL)hasStartedOutgoing
{
  BOOL v3 = [(CSDCall *)self temporaryDateStartedOutgoing];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(CSDCall *)self dateStartedOutgoing];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (int64_t)audioInterruptionProviderType
{
  return 1;
}

- (int64_t)audioInterruptionOperationMode
{
  return 0;
}

- (id)handle
{
  BOOL v3 = [(CSDCall *)self dialRequest];
  if (v3)
  {
    BOOL v4 = [(CSDCall *)self dialRequest];
    id v5 = [v4 handle];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CSDCall;
    id v5 = [(CSDCall *)&v7 handle];
  }

  return v5;
}

- (BOOL)isOutgoing
{
  BOOL v3 = [(CSDCall *)self dialRequest];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CSDCall;
    BOOL v4 = [(CSDCall *)&v6 isOutgoing];
  }

  return v4;
}

- (BOOL)isVoicemail
{
  BOOL v3 = [(CSDCall *)self dialRequest];
  if (v3)
  {
    BOOL v4 = [(CSDCall *)self dialRequest];
    unsigned __int8 v5 = [v4 dialType] == (id)2;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CSDCall;
    unsigned __int8 v5 = [(CSDCall *)&v7 isVoicemail];
  }

  return v5;
}

- (BOOL)isEmergency
{
  BOOL v3 = [(CSDCall *)self dialRequest];
  if (v3)
  {
    BOOL v4 = [(CSDCall *)self dialRequest];
    unsigned __int8 v5 = [v4 dialType] == (id)1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CSDCall;
    unsigned __int8 v5 = [(CSDCall *)&v7 isEmergency];
  }

  return v5;
}

- (BOOL)isSOS
{
  BOOL v3 = [(CSDCall *)self dialRequest];
  if (v3)
  {
    BOOL v4 = [(CSDCall *)self dialRequest];
    unsigned __int8 v5 = [v4 isSOS];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CSDCall;
    unsigned __int8 v5 = [(CSDCall *)&v7 isSOS];
  }

  return v5;
}

- (NSString)handoffDynamicIdentifier
{
  return 0;
}

- (NSDictionary)handoffActivityUserInfo
{
  return 0;
}

- (int)faceTimeIDStatus
{
  [(CSDCall *)self _refreshFaceTimeIDSStatusIfNecessary];
  v4.receiver = self;
  v4.super_class = (Class)CSDCall;
  return [(CSDCall *)&v4 faceTimeIDStatus];
}

- (void)_refreshFaceTimeIDSStatus
{
  BOOL v3 = [(CSDCall *)self provider];
  unsigned int v4 = [v3 isFaceTimeProvider];

  if (v4)
  {
    unsigned __int8 v5 = self;
    uint64_t v6 = 2;
  }
  else
  {
    objc_super v7 = [(CSDCall *)self handle];
    id v8 = [v7 value];
    id v9 = [v8 length];

    if (v9)
    {
      __int16 v10 = [(CSDCall *)self idQueryController];
      unsigned int v11 = [(CSDCall *)self handle];
      id v12 = TUCopyIDSCanonicalAddressForHandle();
      uint64_t v13 = IDSServiceNameFaceTime;
      id v14 = [(CSDCall *)self queue];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000EC21C;
      v15[3] = &unk_1005074F0;
      v15[4] = self;
      [v10 currentIDStatusForDestination:v12 service:v13 listenerID:@"com.apple.TUCallCenter" queue:v14 completionBlock:v15];

      return;
    }
    unsigned __int8 v5 = self;
    uint64_t v6 = 0;
  }

  [(CSDCall *)v5 setFaceTimeIDStatus:v6];
}

- (void)_refreshFaceTimeIDSStatusIfNecessary
{
  if (![(CSDCall *)self faceTimeIDStatusRefreshed])
  {
    [(CSDCall *)self setFaceTimeIDStatusRefreshed:1];
    [(CSDCall *)self _refreshFaceTimeIDSStatus];
  }
}

- (NSDictionary)silencingUserInfo
{
  silencingUserInfo = self->_silencingUserInfo;
  if (!silencingUserInfo)
  {
    unsigned int v4 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    unsigned __int8 v5 = self->_silencingUserInfo;
    self->_silencingUserInfo = v4;

    silencingUserInfo = self->_silencingUserInfo;
  }

  return silencingUserInfo;
}

- (id)displayContext
{
  BOOL v3 = [(CSDCall *)self dynamicDisplayContext];
  if (!v3)
  {
    unsigned int v4 = [(CSDCall *)self queue];

    if (!v4) {
      goto LABEL_5;
    }
    id v5 = objc_alloc((Class)TUDynamicCallDisplayContext);
    uint64_t v6 = [(CSDCall *)self dialRequest];
    objc_super v7 = [v6 contactIdentifier];
    id v8 = [(CSDCall *)self queue];
    id v9 = objc_msgSend(v5, "initWithCall:contactIdentifier:serialQueue:cacheOnly:", self, v7, v8, -[CSDCall isIncoming](self, "isIncoming") ^ 1);
    [(CSDCall *)self setDynamicDisplayContext:v9];

    BOOL v3 = [(CSDCall *)self dynamicDisplayContext];
    [v3 setDelegate:self];
  }

LABEL_5:
  __int16 v10 = [(CSDCall *)self dynamicDisplayContext];
  id v11 = [v10 copy];

  return v11;
}

- (int64_t)providerErrorCode
{
  return 0;
}

- (int64_t)providerEndedReason
{
  return 0;
}

- (BOOL)mayRequireBreakBeforeMake
{
  return 0;
}

- (BOOL)mixesVoiceWithMedia
{
  return 0;
}

- (BOOL)mediaPlaybackOnExternalDevice
{
  return 0;
}

- (CXCall)cxCall
{
  id v3 = objc_alloc((Class)CXCall);
  unsigned int v4 = [(CSDCall *)self uniqueProxyIdentifierUUID];
  id v5 = [v3 initWithUUID:v4];

  objc_msgSend(v5, "setOutgoing:", -[CSDCall isOutgoing](self, "isOutgoing"));
  objc_msgSend(v5, "setOnHold:", -[CSDCall isOnHold](self, "isOnHold"));
  objc_msgSend(v5, "setHasConnected:", -[CSDCall isConnected](self, "isConnected"));
  objc_msgSend(v5, "setHasEnded:", -[CSDCall status](self, "status") == 6);
  uint64_t v6 = [(CSDCall *)self provider];
  objc_super v7 = [v6 identifier];
  [v5 setProviderIdentifier:v7];

  objc_msgSend(v5, "setEndpointOnCurrentDevice:", -[CSDCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice"));
  objc_msgSend(v5, "setHostedOnCurrentDevice:", -[CSDCall isHostedOnCurrentDevice](self, "isHostedOnCurrentDevice"));
  if ([(CSDCall *)self isVideo]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = (uint64_t)[(CSDCall *)self isThirdPartyVideo];
  }
  [v5 setVideo:v8];
  objc_msgSend(v5, "setScreening:", -[CSDCall isScreening](self, "isScreening"));

  return (CXCall *)v5;
}

- (void)propertiesChanged
{
  id v3 = [(CSDCall *)self delegate];
  [v3 propertiesChangedForCall:self];
}

- (void)handleUpdatedPropertiesAfterChangesInBlock:(id)a3
{
  unsigned int v4 = (void (**)(void))a3;
  v67 = [(CSDCall *)self handle];
  v65 = [(CSDCall *)self callerNameFromNetwork];
  unsigned int v46 = [(CSDCall *)self isInternational];
  v50 = [(CSDCall *)self relayClientTransport];
  unsigned int v49 = [(CSDCall *)self mayRequireBreakBeforeMake];
  unsigned int v5 = [(CSDCall *)self hasStartedOutgoing];
  unsigned int v51 = [(CSDCall *)self hasAudioInterruption];
  unsigned int v47 = [(CSDCall *)self isEmergency];
  unsigned int v45 = [(CSDCall *)self isVoicemail];
  v61 = [(CSDCall *)self activeRemoteParticipants];
  unsigned int v54 = [(CSDCall *)self isOneToOneModeEnabled];
  unsigned int v56 = [(CSDCall *)self mediaPlaybackOnExternalDevice];
  int64_t v58 = [(CSDCall *)self transmissionState];
  unsigned int v60 = [(CSDCall *)self prefersToPlayDuringWombat];
  v63 = [(CSDCall *)self remoteParticipantHandles];
  v4[2](v4);

  v66 = [(CSDCall *)self handle];
  v64 = [(CSDCall *)self callerNameFromNetwork];
  unsigned int v6 = [(CSDCall *)self isInternational];
  objc_super v7 = [(CSDCall *)self relayClientTransport];
  unsigned int v8 = [(CSDCall *)self mayRequireBreakBeforeMake];
  unsigned int v48 = [(CSDCall *)self hasStartedOutgoing];
  unsigned int v9 = [(CSDCall *)self hasAudioInterruption];
  unsigned int v10 = [(CSDCall *)self isEmergency];
  unsigned int v11 = [(CSDCall *)self isVoicemail];
  uint64_t v12 = [(CSDCall *)self activeRemoteParticipants];
  unsigned int v52 = [(CSDCall *)self isOneToOneModeEnabled];
  unsigned int v53 = [(CSDCall *)self mediaPlaybackOnExternalDevice];
  int64_t v55 = [(CSDCall *)self transmissionState];
  unsigned int v57 = [(CSDCall *)self prefersToPlayDuringWombat];
  v62 = [(CSDCall *)self remoteParticipantHandles];
  unsigned int v59 = [(CSDCall *)self isUnderlyingLinksConnected];
  uint64_t v13 = [(CSDCall *)self dynamicDisplayContext];
  if (v13)
  {
    id v14 = (void *)v13;
    if (!TUObjectsAreEqualOrNil()
      || !TUStringsAreEqualOrNil()
      || ((v47 ^ v10) & 1) != 0
      || ((v46 ^ v6) & 1) != 0
      || ((v45 ^ v11) & 1) != 0)
    {
    }
    else
    {
      unsigned __int8 v15 = [v63 isEqualToSet:v62];

      if (v15) {
        goto LABEL_13;
      }
    }
    objc_super v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v69 = (const __CFString *)self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Invalidating display context for %@", buf, 0xCu);
    }

    [(CSDCall *)self setDynamicDisplayContext:0];
  }
LABEL_13:
  id v17 = (void *)v12;
  if ((TUObjectsAreEqualOrNil() & 1) == 0)
  {
    __int16 v18 = sub_100008DCC();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    uint64_t v20 = TUCallCenterCallContinuityStateChangedNotification;
    if (v19)
    {
      *(_DWORD *)buf = 138413058;
      CFStringRef v69 = (const __CFString *)TUCallCenterCallContinuityStateChangedNotification;
      __int16 v70 = 2112;
      *(void *)v71 = v50;
      *(_WORD *)&v71[8] = 2112;
      *(void *)v72 = v7;
      *(_WORD *)&v72[8] = 2112;
      v73 = self;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Posting %@ because relayClientTransport changed from %@ to %@ for %@", buf, 0x2Au);
    }

    v21 = [(CSDCall *)self notificationCenter];
    [v21 postNotificationName:v20 object:self];
  }
  if (v49 != v8)
  {
    v22 = sub_100008DCC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      CFStringRef v69 = @"CSDCallMayRequireBreakBeforeMakeChangedNotification";
      __int16 v70 = 1024;
      *(_DWORD *)v71 = v49;
      *(_WORD *)&v71[4] = 1024;
      *(_DWORD *)&v71[6] = v8;
      *(_WORD *)v72 = 2112;
      *(void *)&v72[2] = self;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Posting %@ because mayRequireBreakBeforeMake changed from %d to %d for %@", buf, 0x22u);
    }

    v23 = [(CSDCall *)self notificationCenter];
    [v23 postNotificationName:@"CSDCallMayRequireBreakBeforeMakeChangedNotification" object:self];
  }
  if (v5 != v48)
  {
    v24 = sub_100008DCC();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      CFStringRef v69 = @"CSDCallHasStartedOutgoingChangedNotification";
      __int16 v70 = 1024;
      *(_DWORD *)v71 = v5;
      *(_WORD *)&v71[4] = 1024;
      *(_DWORD *)&v71[6] = v48;
      *(_WORD *)v72 = 2112;
      *(void *)&v72[2] = self;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Posting %@ because hasStartedOutgoing changed from %d to %d for %@", buf, 0x22u);
    }

    v25 = [(CSDCall *)self notificationCenter];
    [v25 postNotificationName:@"CSDCallHasStartedOutgoingChangedNotification" object:self];
  }
  if (v51 != v9)
  {
    v26 = sub_100008DCC();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      CFStringRef v69 = @"CSDCallHasAudioInterruptionChangedNotification";
      __int16 v70 = 1024;
      *(_DWORD *)v71 = v51;
      *(_WORD *)&v71[4] = 1024;
      *(_DWORD *)&v71[6] = v9;
      *(_WORD *)v72 = 2112;
      *(void *)&v72[2] = self;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Posting %@ because hasAudioInterruption changed from %d to %d for %@", buf, 0x22u);
    }

    v27 = [(CSDCall *)self notificationCenter];
    [v27 postNotificationName:@"CSDCallHasAudioInterruptionChangedNotification" object:self];
  }
  if (([(__CFString *)v61 isEqualToSet:v17] & 1) == 0)
  {
    v28 = sub_100008DCC();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v69 = v61;
      __int16 v70 = 2112;
      *(void *)v71 = v17;
      *(_WORD *)&v71[8] = 2112;
      *(void *)v72 = self;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "activeRemoteParticipants changed from %@ to %@ for %@", buf, 0x20u);
    }

    id v29 = [v17 mutableCopy];
    [v29 minusSet:v61];
    if ([v29 count])
    {
      v30 = sub_100008DCC();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v69 = @"CSDCallRemoteParticipantJoinedNotification";
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Posting %@", buf, 0xCu);
      }

      v31 = [(CSDCall *)self notificationCenter];
      [v31 postNotificationName:@"CSDCallRemoteParticipantJoinedNotification" object:self];
    }
    id v32 = [(__CFString *)v61 mutableCopy];
    [v32 minusSet:v17];
    if ([v32 count])
    {
      v33 = sub_100008DCC();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v69 = @"CSDCallRemoteParticipantLeftNotification";
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Posting %@", buf, 0xCu);
      }

      v34 = [(CSDCall *)self notificationCenter];
      [v34 postNotificationName:@"CSDCallRemoteParticipantLeftNotification" object:self];
    }
  }
  if (v54 != v52)
  {
    v35 = sub_100008DCC();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v69 = @"CSDCallOneToOneModeChangedNotification";
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Posting %@", buf, 0xCu);
    }

    v36 = [(CSDCall *)self notificationCenter];
    [v36 postNotificationName:@"CSDCallOneToOneModeChangedNotification" object:self];
  }
  if (v56 != v53)
  {
    v37 = sub_100008DCC();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v69 = @"CSDMediaPlaybackOnExternalDeviceChangedNotification";
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Posting %@", buf, 0xCu);
    }

    v38 = [(CSDCall *)self notificationCenter];
    [v38 postNotificationName:@"CSDMediaPlaybackOnExternalDeviceChangedNotification" object:self];
  }
  if (v58 != v55)
  {
    v39 = sub_100008DCC();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v69 = @"CSDCallTransmissionStateChangedNotification";
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Posting %@", buf, 0xCu);
    }

    v40 = [(CSDCall *)self notificationCenter];
    [v40 postNotificationName:@"CSDCallTransmissionStateChangedNotification" object:self];
  }
  if (v60 != v57)
  {
    v41 = sub_100008DCC();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v69 = @"CSDCallPrefersToPlayDuringWombatChangedNotification";
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Posting %@", buf, 0xCu);
    }

    v42 = [(CSDCall *)self notificationCenter];
    [v42 postNotificationName:@"CSDCallPrefersToPlayDuringWombatChangedNotification" object:self];
  }
  if (v59 != [(CSDCall *)self isUnderlyingLinksConnected])
  {
    v43 = sub_100008DCC();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v69 = @"CSDCallUnderlyingLinksConnectionChangedNotification";
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Posting %@", buf, 0xCu);
    }

    v44 = [(CSDCall *)self notificationCenter];
    [v44 postNotificationName:@"CSDCallUnderlyingLinksConnectionChangedNotification" object:self];
  }
}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  -[CSDCall setHasAudioInterruption:](self, "setHasAudioInterruption:", [a3 BOOLValue]);
  id v4 = [(CSDCall *)self notificationCenter];
  [v4 postNotificationName:@"CSDCallAudioInterruptionPropertiesChangedNotification" object:self];
}

- (void)idStatusUpdatedForDestinations:(id)a3 service:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(CSDCall *)self queue];
  dispatch_assert_queue_V2(v6);

  objc_super v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    unsigned int v9 = self;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ Received update about new query cache on service %@", (uint8_t *)&v8, 0x16u);
  }

  [(CSDCall *)self _refreshFaceTimeIDSStatus];
}

- (BOOL)isSendingAudio
{
  return self->_isSendingAudio;
}

- (void)setIsSendingAudio:(BOOL)a3
{
  self->_isSendingAudio = a3;
}

- (int64_t)junkConfidence
{
  return self->_junkConfidence;
}

- (void)setJunkConfidence:(int64_t)a3
{
  self->_junkConfidence = a3;
}

- (int64_t)identificationCategory
{
  return self->_identificationCategory;
}

- (void)setIdentificationCategory:(int64_t)a3
{
  self->_identificationCategory = a3;
}

- (BOOL)isKnownCaller
{
  return self->_isKnownCaller;
}

- (int64_t)liveVoicemailStatus
{
  return self->_liveVoicemailStatus;
}

- (void)setLiveVoicemailStatus:(int64_t)a3
{
  self->_liveVoicemailStatus = a3;
}

- (BOOL)joinedFromLink
{
  return self->_joinedFromLink;
}

- (void)setJoinedFromLink:(BOOL)a3
{
  self->_joinedFromLink = a3;
}

- (BOOL)isLocalUserInHomeCountry
{
  return self->_localUserInHomeCountry;
}

- (void)setLocalUserInHomeCountry:(BOOL)a3
{
  self->_localUserInHomeCountry = a3;
}

- (BOOL)isAnsweringMachineAvailable
{
  return self->_answeringMachineAvailable;
}

- (void)setAnsweringMachineAvailable:(BOOL)a3
{
  self->_answeringMachineAvailable = a3;
}

- (BOOL)hasNondisclosedGreeting
{
  return self->_nondisclosedGreeting;
}

- (void)setNondisclosedGreeting:(BOOL)a3
{
  self->_nondisclosedGreeting = a3;
}

- (BOOL)hasIdentifiedSpamInCallerName
{
  return self->_identifiedSpamInCallerName;
}

- (void)setIdentifiedSpamInCallerName:(BOOL)a3
{
  self->_identifiedSpamInCallerName = a3;
}

- (TUCallRecordingSession)recordingSession
{
  return self->_recordingSession;
}

- (CSDCallDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDCallDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSDCallDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (CSDCallDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (TUDialRequest)dialRequest
{
  return self->_dialRequest;
}

- (void)setDialRequest:(id)a3
{
}

- (NSDate)dateStartedOutgoing
{
  return self->_dateStartedOutgoing;
}

- (BOOL)uplinkWasExplicitlyMuted
{
  return self->_uplinkWasExplicitlyMuted;
}

- (void)setUplinkWasExplicitlyMuted:(BOOL)a3
{
  self->_uplinkWasExplicitlyMuted = a3;
}

- (BOOL)hasAudioInterruption
{
  return self->_hasAudioInterruption;
}

- (BOOL)hasAudioFinished
{
  return self->_hasAudioFinished;
}

- (void)setHasAudioFinished:(BOOL)a3
{
  self->_hasAudioFinished = a3;
}

- (NSString)ringtoneSubscriptionIdentifier
{
  return self->_ringtoneSubscriptionIdentifier;
}

- (void)setRingtoneSubscriptionIdentifier:(id)a3
{
  self->_ringtoneSubscriptionIdentifier = (NSString *)a3;
}

- (BOOL)ignoresBluetoothDeviceUID
{
  return self->_ignoresBluetoothDeviceUID;
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_oneToOneModeEnabled;
}

- (BOOL)temporaryRequireInCallSounds
{
  return self->_temporaryRequireInCallSounds;
}

- (void)setTemporaryRequireInCallSounds:(BOOL)a3
{
  self->_temporaryRequireInCallSounds = a3;
}

- (NSDate)temporaryDateStartedOutgoing
{
  return self->_temporaryDateStartedOutgoing;
}

- (void)setTemporaryDateStartedOutgoing:(id)a3
{
}

- (void)setSilencingUserInfo:(id)a3
{
}

- (BOOL)startAsOneToOneMode
{
  return self->_startAsOneToOneMode;
}

- (void)setStartAsOneToOneMode:(BOOL)a3
{
  self->_startAsOneToOneMode = a3;
}

- (BOOL)startAsHandoff
{
  return self->_startAsHandoff;
}

- (void)setStartAsHandoff:(BOOL)a3
{
  self->_startAsHandoff = a3;
}

- (BOOL)endDueToHandoff
{
  return self->_endDueToHandoff;
}

- (void)setEndDueToHandoff:(BOOL)a3
{
  self->_endDueToHandoff = a3;
}

- (BOOL)remoteDoesHandoff
{
  return self->_remoteDoesHandoff;
}

- (void)setRemoteDoesHandoff:(BOOL)a3
{
  self->_remoteDoesHandoff = a3;
}

- (int64_t)bytesOfDataUsed
{
  return self->_bytesOfDataUsed;
}

- (void)setBytesOfDataUsed:(int64_t)a3
{
  self->_bytesOfDataUsed = a3;
}

- (unint64_t)initialLinkType
{
  return self->_initialLinkType;
}

- (double)uplinkMutedSetTime
{
  return self->_uplinkMutedSetTime;
}

- (void)setUplinkMutedSetTime:(double)a3
{
  self->_uplinkMutedSetTime = a3;
}

- (double)remoteUplinkMutedSetTime
{
  return self->_remoteUplinkMutedSetTime;
}

- (void)setRemoteUplinkMutedSetTime:(double)a3
{
  self->_remoteUplinkMutedSetTime = a3;
}

- (NSSet)activeRemoteParticipants
{
  return self->_activeRemoteParticipants;
}

- (void)setActiveRemoteParticipants:(id)a3
{
}

- (CSDIDSTransport)relayClientTransport
{
  return self->_relayClientTransport;
}

- (IDSDestination)expectedRelayClientDestination
{
  return self->_expectedRelayClientDestination;
}

- (void)setExpectedRelayClientDestination:(id)a3
{
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (int64_t)transmissionState
{
  return self->_transmissionState;
}

- (BOOL)isUnderlyingLinksConnected
{
  return self->_isUnderlyingLinksConnected;
}

- (void)setIsUnderlyingLinksConnected:(BOOL)a3
{
  self->_isUnderlyingLinksConnected = a3;
}

- (NSError)recordingDisabledError
{
  return self->_recordingDisabledError;
}

- (NSError)recordingAllowedError
{
  return self->_recordingAllowedError;
}

- (TUDynamicCallDisplayContext)dynamicDisplayContext
{
  return self->_dynamicDisplayContext;
}

- (void)setDynamicDisplayContext:(id)a3
{
}

- (BOOL)faceTimeIDStatusRefreshed
{
  return self->_faceTimeIDStatusRefreshed;
}

- (void)setFaceTimeIDStatusRefreshed:(BOOL)a3
{
  self->_faceTimeIDStatusRefreshed = a3;
}

- (CSDMuteProcessAttributionProtocol)audioApplication
{
  return self->_audioApplication;
}

- (void)setAudioApplication:(id)a3
{
}

- (IDSIDQueryController)idQueryController
{
  return self->_idQueryController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idQueryController, 0);
  objc_storeStrong((id *)&self->_audioApplication, 0);
  objc_storeStrong((id *)&self->_dynamicDisplayContext, 0);
  objc_storeStrong((id *)&self->_recordingAllowedError, 0);
  objc_storeStrong((id *)&self->_recordingDisabledError, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_expectedRelayClientDestination, 0);
  objc_storeStrong((id *)&self->_relayClientTransport, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipants, 0);
  objc_storeStrong((id *)&self->_silencingUserInfo, 0);
  objc_storeStrong((id *)&self->_temporaryDateStartedOutgoing, 0);
  objc_storeStrong((id *)&self->_dateStartedOutgoing, 0);
  objc_storeStrong((id *)&self->_dialRequest, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_recordingSession, 0);
}

@end