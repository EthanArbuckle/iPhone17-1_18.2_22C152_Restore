@interface CSDIDSChat
+ (NSUUID)faceTimeAppUUID;
- (BOOL)hasSentInvitation;
- (BOOL)isConnected;
- (BOOL)isMuted;
- (BOOL)isOutgoing;
- (BOOL)isRelaying;
- (BOOL)isRemoteMomentsAvailable;
- (BOOL)isRemoteUplinkMuted;
- (BOOL)isSendingAudio;
- (BOOL)isSendingAudioData;
- (BOOL)isSendingVideo;
- (BOOL)isVideo;
- (BOOL)mayRequireBreakBeforeMake;
- (BOOL)shouldStartAudioPaused;
- (BOOL)shouldStartVideoPaused;
- (BOOL)shouldSuppressInCallUI;
- (CGSize)localLandscapeAspectRatio;
- (CGSize)localPortraitAspectRatio;
- (CSDAVConference)conference;
- (CSDExternalIDSDualSession)session;
- (CSDIDSChat)initWithSession:(id)a3 remoteHandle:(id)a4 wantsVideo:(BOOL)a5;
- (CSDIDSChatDelegate)delegate;
- (CXCallFailureContext)failureContext;
- (NSArray)invitedPushTokens;
- (NSDate)dateConnected;
- (NSDate)dateEnded;
- (NSDate)dateReceivedFirstRemoteFrame;
- (NSDate)dateStartedConnecting;
- (NSDictionary)remoteInviteDictionary;
- (NSString)crossDeviceIdentifier;
- (NSString)remoteFromID;
- (NSString)sessionUUID;
- (NSUUID)UUID;
- (NSUUID)localSenderIdentityUUID;
- (NSUUID)upgradeSessionUUID;
- (RTCSecureHierarchyToken)reportingHierarchyToken;
- (TUHandle)handle;
- (id)capabilities;
- (id)conferenceCreationBlock;
- (id)initIncomingWithSession:(id)a3 remoteHandle:(id)a4 wantsVideo:(BOOL)a5 remoteInviteDictionary:(id)a6;
- (id)initOutgoingWithSession:(id)a3 UUID:(id)a4 remoteHandle:(id)a5 wantsVideo:(BOOL)a6 isRelaying:(BOOL)a7;
- (id)inviteCompletion;
- (int)deviceRole;
- (int64_t)endedReason;
- (int64_t)inputAudioPowerSpectrumToken;
- (int64_t)outputAudioPowerSpectrumToken;
- (int64_t)spatialAudioSourceIdentifier;
- (int64_t)videoStreamToken;
- (unint64_t)initialLinkType;
- (void)_handlePushTokensInvited:(id)a3 didSendInvitation:(BOOL)a4 didCancelInvitation:(BOOL)a5;
- (void)_setDateEndedIfNecessary;
- (void)_setLocalAspectRatiosForVideoAspectRatioDescriptor:(id)a3;
- (void)answerWithVideoAspectRatioDescriptor:(id)a3;
- (void)cancelInvitationWithAnsweredElsewhere;
- (void)cancelInvitationWithDeclinedElsewhere;
- (void)cancelInvitationWithLocalHangup;
- (void)cancelOrDeclineInvitation;
- (void)conference:(id)a3 changedBytesOfDataUsed:(int64_t)a4;
- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5;
- (void)conference:(id)a3 endedWithReason:(int64_t)a4 error:(id)a5;
- (void)conference:(id)a3 inputFrequencyLevelChangedTo:(id)a4;
- (void)conference:(id)a3 inputLevelChangedTo:(float)a4;
- (void)conference:(id)a3 outputFrequencyLevelChangedTo:(id)a4;
- (void)conference:(id)a3 outputLevelChangedTo:(float)a4;
- (void)conference:(id)a3 remoteMediaStalled:(BOOL)a4;
- (void)conferenceFinishedPreparing:(id)a3;
- (void)conferenceStarted:(id)a3;
- (void)end;
- (void)mutedChangedForConference:(id)a3;
- (void)prepareConference;
- (void)receivedFirstRemoteFrameForConference:(id)a3;
- (void)remoteVideoPausedForConference:(id)a3;
- (void)sendDataUnreliably:(id)a3;
- (void)sendingAudioChangedForConference:(id)a3;
- (void)session:(id)a3 endedWithReason:(int)a4;
- (void)session:(id)a3 invitationSentToPushTokens:(id)a4 shouldBreakBeforeMake:(BOOL)a5;
- (void)session:(id)a3 receivedData:(id)a4;
- (void)session:(id)a3 receivedInvitationAcceptWithData:(id)a4;
- (void)session:(id)a3 receivedInvitationCancelWithData:(id)a4;
- (void)session:(id)a3 receivedInvitationDeclineWithData:(id)a4;
- (void)sessionStarted:(id)a3;
- (void)setConference:(id)a3;
- (void)setConferenceCreationBlock:(id)a3;
- (void)setDateEnded:(id)a3;
- (void)setDateReceivedFirstRemoteFrame:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasSentInvitation:(BOOL)a3;
- (void)setInviteCompletion:(id)a3;
- (void)setInvitedPushTokens:(id)a3;
- (void)setLocalLandscapeAspectRatio:(CGSize)a3;
- (void)setLocalPortraitAspectRatio:(CGSize)a3;
- (void)setLocalSenderIdentityUUID:(id)a3;
- (void)setMayRequireBreakBeforeMake:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setRelaying:(BOOL)a3;
- (void)setRemoteMomentsAvailable:(BOOL)a3;
- (void)setRemoteUplinkMuted:(BOOL)a3;
- (void)setRemoteVideoPresentationSize:(CGSize)a3;
- (void)setRemoteVideoPresentationState:(int)a3;
- (void)setReportingHierarchyToken:(id)a3;
- (void)setSendingAudio:(BOOL)a3;
- (void)setSendingAudioData:(BOOL)a3;
- (void)setSendingVideo:(BOOL)a3;
- (void)setShouldStartAudioPaused:(BOOL)a3;
- (void)setShouldStartVideoPaused:(BOOL)a3;
- (void)setShouldSuppressInCallUI:(BOOL)a3;
- (void)setUpgradeSessionUUID:(id)a3;
- (void)setVideo:(BOOL)a3;
- (void)startConnectionWithTransport:(id)a3;
- (void)startWithVideoAspectRatioDescriptor:(id)a3 inviteCompletion:(id)a4;
@end

@implementation CSDIDSChat

+ (NSUUID)faceTimeAppUUID
{
  if (qword_10058C2B8 != -1) {
    dispatch_once(&qword_10058C2B8, &stru_100506038);
  }
  v2 = (void *)qword_10058C2B0;

  return (NSUUID *)v2;
}

- (CSDIDSChat)initWithSession:(id)a3 remoteHandle:(id)a4 wantsVideo:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CSDIDSChat;
  v11 = [(CSDIDSChat *)&v20 init];
  if (v11)
  {
    v12 = +[TUCallCenter sharedInstance];
    v13 = [v12 queue];
    dispatch_assert_queue_V2(v13);

    objc_storeStrong((id *)&v11->_session, a3);
    [(CSDIDSDualSession *)v11->_session setDelegate:v11];
    uint64_t v14 = +[NSUUID UUID];
    UUID = v11->_UUID;
    v11->_UUID = (NSUUID *)v14;

    objc_storeStrong((id *)&v11->_handle, a4);
    v11->_video = a5;
    v16 = (RTCSecureHierarchyToken *)+[RTCReporting newHierarchyTokenFromParentToken:0];
    reportingHierarchyToken = v11->_reportingHierarchyToken;
    v11->_reportingHierarchyToken = v16;

    id conferenceCreationBlock = v11->_conferenceCreationBlock;
    v11->_id conferenceCreationBlock = &stru_100506078;
  }
  return v11;
}

- (id)initIncomingWithSession:(id)a3 remoteHandle:(id)a4 wantsVideo:(BOOL)a5 remoteInviteDictionary:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a6;
  v13 = [(CSDIDSChat *)self initWithSession:v11 remoteHandle:a4 wantsVideo:v7];
  if (v13)
  {
    if ([v11 isInitiator])
    {
      v16 = +[NSAssertionHandler currentHandler];
      [v16 handleFailureInMethod:a2, v13, @"CSDIDSChat.m", 107, @"Cannot create an incoming chat with an outgoing session: %@", v11 object file lineNumber description];
    }
    objc_storeStrong((id *)&v13->_remoteInviteDictionary, a6);
    uint64_t v14 = +[CSDReportingController sharedInstance];
    [v14 createOneToOneFTReportingSessionForCallWithUUID:v13->_UUID withReportingHierarchyToken:v13->_reportingHierarchyToken withVideo:v7];
  }
  return v13;
}

- (id)initOutgoingWithSession:(id)a3 UUID:(id)a4 remoteHandle:(id)a5 wantsVideo:(BOOL)a6 isRelaying:(BOOL)a7
{
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  v15 = [(CSDIDSChat *)self initWithSession:v13 remoteHandle:a5 wantsVideo:v8];
  if (v15)
  {
    if (([v13 isInitiator] & 1) == 0)
    {
      v18 = +[NSAssertionHandler currentHandler];
      [v18 handleFailureInMethod:a2, v15, @"CSDIDSChat.m", 118, @"Cannot create an outgoing chat with an incoming session: %@", v13 object file lineNumber description];
    }
    v15->_outgoing = 1;
    objc_storeStrong((id *)&v15->_UUID, a4);
    v15->_relaying = a7;
    v16 = +[CSDReportingController sharedInstance];
    [v16 createOneToOneFTReportingSessionForCallWithUUID:v15->_UUID withReportingHierarchyToken:v15->_reportingHierarchyToken withVideo:v8];
  }
  return v15;
}

- (NSString)sessionUUID
{
  v2 = [(CSDIDSChat *)self session];
  v3 = [v2 UUID];

  return (NSString *)v3;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (int64_t)videoStreamToken
{
  v2 = [(CSDIDSChat *)self conference];
  id v3 = [v2 callID];

  return (int64_t)v3;
}

- (int64_t)inputAudioPowerSpectrumToken
{
  v2 = [(CSDIDSChat *)self conference];
  id v3 = [v2 inputAudioPowerSpectrumToken];

  return (int64_t)v3;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  v2 = [(CSDIDSChat *)self conference];
  id v3 = [v2 outputAudioPowerSpectrumToken];

  return (int64_t)v3;
}

- (int64_t)spatialAudioSourceIdentifier
{
  v2 = [(CSDIDSChat *)self conference];
  id v3 = [v2 callID];

  return (int64_t)v3;
}

- (NSDate)dateStartedConnecting
{
  v2 = [(CSDIDSChat *)self conference];
  id v3 = [v2 dateStartedConnecting];

  return (NSDate *)v3;
}

- (NSDate)dateConnected
{
  if ([(CSDIDSChat *)self isVideo])
  {
    id v3 = [(CSDIDSChat *)self dateReceivedFirstRemoteFrame];
  }
  else
  {
    v4 = [(CSDIDSChat *)self conference];
    id v3 = [v4 dateConnected];
  }

  return (NSDate *)v3;
}

- (BOOL)isConnected
{
  v2 = [(CSDIDSChat *)self session];
  BOOL v3 = [v2 state] == 3;

  return v3;
}

- (int64_t)endedReason
{
  if ([(CSDIDSChat *)self hasSentInvitation])
  {
    BOOL v3 = [(CSDIDSChat *)self invitedPushTokens];
    id v4 = [v3 count];

    if (!v4)
    {
      BOOL v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        uint64_t v20 = (uint64_t)self;
        id v9 = "Setting disconnected reason to call failed because invitation was sent but no push tokens were available to"
             " receive the invitation for call %@";
        id v10 = v8;
        uint32_t v11 = 12;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v19, v11);
      }
      goto LABEL_17;
    }
  }
  v5 = [(CSDIDSChat *)self session];
  unsigned int v6 = [v5 endedReason];

  uint64_t v7 = v6;
  switch(v6)
  {
    case 0u:
      goto LABEL_13;
    case 1u:
      id v13 = [(CSDIDSChat *)self conference];
      id v14 = [v13 dateStartedConnecting];

      if (!v14)
      {
        BOOL v8 = sub_100008DCC();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 134217984;
          uint64_t v20 = 1;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Using call ended reason remote ended because CSDIDSDualSession ended reason is %ld", (uint8_t *)&v19, 0xCu);
        }
        goto LABEL_33;
      }
LABEL_13:
      v15 = [(CSDIDSChat *)self conference];

      if (!v15) {
        return -1;
      }
      v16 = [(CSDIDSChat *)self conference];
      v17 = (char *)[v16 endedReason];

      if ((unint64_t)(v17 - 3) < 5) {
        goto LABEL_15;
      }
      if (v17 == (char *)2)
      {
        BOOL v8 = sub_100008DCC();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 134217984;
          int64_t v12 = 2;
          uint64_t v20 = 2;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Using call ended reason remote ended because CSDAVConference ended reason is %ld", (uint8_t *)&v19, 0xCu);
          goto LABEL_18;
        }
LABEL_33:
        int64_t v12 = 2;
        goto LABEL_18;
      }
      if (v17 != (char *)1) {
        return -1;
      }
LABEL_15:
      BOOL v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1003A8C20((uint64_t)self, (uint64_t)v17, v8);
      }
LABEL_17:
      int64_t v12 = 1;
LABEL_18:

      return v12;
    case 2u:
      BOOL v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134217984;
        uint64_t v20 = 2;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Using call ended reason answered elsewhere because CSDIDSDualSession ended reason is %ld", (uint8_t *)&v19, 0xCu);
      }
      int64_t v12 = 4;
      goto LABEL_18;
    case 3u:
      BOOL v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134217984;
        uint64_t v20 = 3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Using call ended reason declined elsewhere because CSDIDSDualSession ended reason is %ld", (uint8_t *)&v19, 0xCu);
      }
      int64_t v12 = 5;
      goto LABEL_18;
    case 4u:
      BOOL v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134217984;
        uint64_t v20 = 4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Using call ended reason unanswered because CSDIDSDualSession ended reason is %ld", (uint8_t *)&v19, 0xCu);
      }
      int64_t v12 = 3;
      goto LABEL_18;
    case 5u:
    case 6u:
      BOOL v8 = sub_100008DCC();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v19 = 134218242;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      v22 = self;
      id v9 = "Setting disconnected reason to call failed because CSDIDSDualSession ended reason is %ld for call %@";
      id v10 = v8;
      uint32_t v11 = 22;
      goto LABEL_8;
    default:
      return -1;
  }
}

- (CXCallFailureContext)failureContext
{
  if ([(CSDIDSChat *)self hasSentInvitation])
  {
    BOOL v3 = [(CSDIDSChat *)self invitedPushTokens];
    id v4 = [v3 count];

    if (!v4)
    {
      id v11 = objc_alloc_init((Class)CXCallFailureContext);
      id v7 = v11;
      uint64_t v12 = 1;
      goto LABEL_11;
    }
  }
  v5 = [(CSDIDSChat *)self session];
  unsigned int v6 = [v5 endedReason];

  if (v6 == 6)
  {
    id v7 = objc_alloc_init((Class)CXCallFailureContext);
    [v7 setFailureReason:0];
    BOOL v8 = [(CSDIDSChat *)self session];
    objc_msgSend(v7, "setProviderErrorCode:", objc_msgSend(v8, "underlyingErrorCode"));

    goto LABEL_13;
  }
  id v7 = [(CSDIDSChat *)self conference];

  if (v7)
  {
    id v9 = [(CSDIDSChat *)self conference];
    id v10 = [v9 endedReason];

    if (v10 == (id)6)
    {
      id v11 = objc_alloc_init((Class)CXCallFailureContext);
      id v7 = v11;
      uint64_t v12 = 5;
      goto LABEL_11;
    }
    if (v10 == (id)7)
    {
      id v11 = objc_alloc_init((Class)CXCallFailureContext);
      id v7 = v11;
      uint64_t v12 = 4;
LABEL_11:
      [v11 setFailureReason:v12];
      goto LABEL_13;
    }
    id v7 = 0;
  }
LABEL_13:

  return (CXCallFailureContext *)v7;
}

- (NSString)crossDeviceIdentifier
{
  v2 = [(CSDIDSChat *)self session];
  BOOL v3 = [v2 UUID];

  return (NSString *)v3;
}

- (NSString)remoteFromID
{
  v2 = [(CSDIDSChat *)self session];
  BOOL v3 = [v2 remoteFromID];

  return (NSString *)v3;
}

- (unint64_t)initialLinkType
{
  v2 = [(CSDIDSChat *)self session];
  id v3 = [v2 initialLinkType];

  return (unint64_t)v3;
}

- (void)_setDateEndedIfNecessary
{
  id v3 = [(CSDIDSChat *)self dateEnded];

  if (v3) {
    return;
  }
  if ([(CSDIDSChat *)self hasSentInvitation])
  {
    id v4 = [(CSDIDSChat *)self invitedPushTokens];
    id v5 = [v4 count];

    if (!v5)
    {
LABEL_9:
      id v9 = +[NSDate date];
      [(CSDIDSChat *)self setDateEnded:v9];
      goto LABEL_10;
    }
  }
  unsigned int v6 = [(CSDIDSChat *)self conference];

  if (!v6)
  {
    id v11 = [(CSDIDSChat *)self session];

    if (!v11) {
      goto LABEL_11;
    }
    uint64_t v12 = [(CSDIDSChat *)self session];
    unsigned int v13 = [v12 state];

    if (v13 != 5) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  id v7 = [(CSDIDSChat *)self conference];
  unsigned int v8 = [v7 state];

  if (v8 != 7) {
    goto LABEL_11;
  }
  id v9 = [(CSDIDSChat *)self conference];
  id v10 = [v9 dateEnded];
  [(CSDIDSChat *)self setDateEnded:v10];

LABEL_10:
LABEL_11:
  id v17 = [(CSDIDSChat *)self delegate];
  uint64_t v14 = [(CSDIDSChat *)self dateEnded];
  if (v14)
  {
    v15 = (void *)v14;
    char v16 = objc_opt_respondsToSelector();

    if (v16) {
      [v17 chatEnded:self];
    }
  }
}

- (void)_setLocalAspectRatiosForVideoAspectRatioDescriptor:(id)a3
{
  id v4 = [(CSDIDSChat *)self delegate];
  [v4 localPortraitAspectRatioForChat:self];
  double v6 = v5;
  double v8 = v7;

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v16.width = v6;
    v16.height = v8;
    id v10 = NSStringFromSize(v16);
    v17.width = v8;
    v17.height = v6;
    id v11 = NSStringFromSize(v17);
    int v12 = 138412546;
    unsigned int v13 = v10;
    __int16 v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting local portrait aspect ratio %@ and local landscape aspect ratio %@", (uint8_t *)&v12, 0x16u);
  }
  -[CSDIDSChat setLocalPortraitAspectRatio:](self, "setLocalPortraitAspectRatio:", v6, v8);
  -[CSDIDSChat setLocalLandscapeAspectRatio:](self, "setLocalLandscapeAspectRatio:", v8, v6);
}

- (id)capabilities
{
  if (qword_10058C2C8 != -1) {
    dispatch_once(&qword_10058C2C8, &stru_100506098);
  }
  id v3 = objc_alloc_init((Class)VCCapabilities);
  [v3 setIsKeyExchangeEnabled:byte_10058C2C0 == 0];
  [v3 setIsAudioEnabled:1];
  objc_msgSend(v3, "setIsVideoEnabled:", -[CSDIDSChat isVideo](self, "isVideo"));
  objc_msgSend(v3, "setIsDuplexAudioOnly:", objc_msgSend(v3, "isVideoEnabled") ^ 1);
  [v3 setIsRelayForced:0];
  [v3 setIsRelayEnabled:1];
  objc_msgSend(v3, "setIsAudioPausedToStart:", -[CSDIDSChat shouldStartAudioPaused](self, "shouldStartAudioPaused"));
  objc_msgSend(v3, "setIsVideoPausedToStart:", -[CSDIDSChat shouldStartVideoPaused](self, "shouldStartVideoPaused"));
  objc_msgSend(v3, "setDeviceRole:", -[CSDIDSChat deviceRole](self, "deviceRole"));

  return v3;
}

- (int)deviceRole
{
  if ([(CSDIDSChat *)self isRelaying]) {
    return 3;
  }
  else {
    return 0;
  }
}

- (void)startWithVideoAspectRatioDescriptor:(id)a3 inviteCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "", v9, 2u);
  }

  [(CSDIDSChat *)self _setLocalAspectRatiosForVideoAspectRatioDescriptor:v7];
  [(CSDIDSChat *)self setInviteCompletion:v6];

  [(CSDIDSChat *)self prepareConference];
}

- (void)answerWithVideoAspectRatioDescriptor:(id)a3
{
  id v4 = a3;
  double v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "videoAspectRatioDescriptor: %@", (uint8_t *)&v7, 0xCu);
  }

  [(CSDIDSChat *)self _setLocalAspectRatiosForVideoAspectRatioDescriptor:v4];
  id v6 = +[NSUUID UUID];
  [(CSDIDSChat *)self setUpgradeSessionUUID:v6];

  [(CSDIDSChat *)self prepareConference];
}

- (void)cancelOrDeclineInvitation
{
  id v3 = [(CSDIDSChat *)self session];
  unsigned int v4 = [v3 isInitiator];

  double v5 = sub_100008DCC();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Canceling session", buf, 2u);
    }

    int v7 = [(CSDIDSChat *)self session];
    [v7 cancelInvitationWithReason:0];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Declining session", v8, 2u);
    }

    int v7 = [(CSDIDSChat *)self session];
    [v7 declineInvitation];
  }
}

- (void)end
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    NSSize v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "end self: %@", (uint8_t *)&v15, 0xCu);
  }

  unsigned int v4 = [(CSDIDSChat *)self dateEnded];

  if (!v4)
  {
    uint64_t v5 = [(CSDIDSChat *)self conference];
    if (v5)
    {
      BOOL v6 = (void *)v5;
      int v7 = [(CSDIDSChat *)self conference];
      if ((int)[v7 state] <= 3)
      {
      }
      else
      {
        id v8 = [(CSDIDSChat *)self conference];
        int v9 = [v8 state];

        if (v9 <= 5)
        {
          id v10 = sub_100008DCC();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v15) = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Stopping conference", (uint8_t *)&v15, 2u);
          }

          id v11 = [(CSDIDSChat *)self conference];
          [v11 stop];
          goto LABEL_16;
        }
      }
    }
    int v12 = [(CSDIDSChat *)self session];
    unsigned int v13 = [v12 state];

    if (v13 == 1)
    {
      [(CSDIDSChat *)self cancelOrDeclineInvitation];
LABEL_17:
      [(CSDIDSChat *)self _handlePushTokensInvited:&__NSArray0__struct didSendInvitation:0 didCancelInvitation:1];
      return;
    }
    __int16 v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Ending session", (uint8_t *)&v15, 2u);
    }

    id v11 = [(CSDIDSChat *)self session];
    [v11 end];
LABEL_16:

    goto LABEL_17;
  }
}

- (void)cancelInvitationWithAnsweredElsewhere
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    int v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "for call %@", (uint8_t *)&v6, 0xCu);
  }

  unsigned int v4 = [(CSDIDSChat *)self session];
  [v4 cancelInvitationWithReason:1];

  uint64_t v5 = [(CSDIDSChat *)self conference];
  [v5 cancel];
}

- (void)cancelInvitationWithDeclinedElsewhere
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    int v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "for call %@", (uint8_t *)&v6, 0xCu);
  }

  unsigned int v4 = [(CSDIDSChat *)self session];
  [v4 cancelInvitationWithReason:2];

  uint64_t v5 = [(CSDIDSChat *)self conference];
  [v5 cancel];
}

- (void)cancelInvitationWithLocalHangup
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    int v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "for call %@", (uint8_t *)&v6, 0xCu);
  }

  unsigned int v4 = [(CSDIDSChat *)self session];
  [v4 cancelInvitationWithReason:0];

  uint64_t v5 = [(CSDIDSChat *)self conference];
  [v5 cancel];
}

- (void)sendDataUnreliably:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDIDSChat *)self conference];
  [v5 sendData:v4];
}

- (BOOL)isSendingAudio
{
  v2 = [(CSDIDSChat *)self conference];
  unsigned __int8 v3 = [v2 isSendingAudio];

  return v3;
}

- (void)setSendingAudio:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67109378;
    BOOL v11 = v3;
    __int16 v12 = 2112;
    unsigned int v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting isSendingAudio to %d for chat %@", (uint8_t *)&v10, 0x12u);
  }

  int v6 = [(CSDIDSChat *)self conference];

  if (v6)
  {
    int v7 = [(CSDIDSChat *)self conference];
    [v7 setSendingAudio:v3];
  }
  else
  {
    id v8 = sub_100008DCC();
    BOOL v9 = v3 ^ 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109120;
      BOOL v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Conference has not been created yet. Updating shouldStartAudioPaused to %d", (uint8_t *)&v10, 8u);
    }

    [(CSDIDSChat *)self setShouldStartAudioPaused:v9];
  }
}

- (BOOL)isSendingAudioData
{
  v2 = [(CSDIDSChat *)self conference];
  unsigned __int8 v3 = [v2 isSendingAudioData];

  return v3;
}

- (void)setSendingAudioData:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = v3;
    __int16 v9 = 2112;
    int v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting isSendingAudioData to %d for chat %@", (uint8_t *)v8, 0x12u);
  }

  int v6 = [(CSDIDSChat *)self conference];

  if (v6)
  {
    int v7 = [(CSDIDSChat *)self conference];
    [v7 setSendingAudioData:v3];
  }
}

- (BOOL)isSendingVideo
{
  v2 = [(CSDIDSChat *)self conference];
  unsigned __int8 v3 = [v2 isSendingVideo];

  return v3;
}

- (void)setSendingVideo:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67109378;
    BOOL v11 = v3;
    __int16 v12 = 2112;
    unsigned int v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting isSendingVideo to %d for chat %@", (uint8_t *)&v10, 0x12u);
  }

  int v6 = [(CSDIDSChat *)self conference];

  if (v6)
  {
    int v7 = [(CSDIDSChat *)self conference];
    [v7 setSendingVideo:v3];
  }
  else
  {
    id v8 = sub_100008DCC();
    BOOL v9 = v3 ^ 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109120;
      BOOL v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Conference has not been created yet. Updating shouldStartVideoPaused to %d", (uint8_t *)&v10, 8u);
    }

    [(CSDIDSChat *)self setShouldStartVideoPaused:v9];
  }
}

- (void)setRelaying:(BOOL)a3
{
  if (self->_relaying != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109634;
      v8[1] = [(CSDIDSChat *)self isRelaying];
      __int16 v9 = 1024;
      BOOL v10 = v3;
      __int16 v11 = 2112;
      __int16 v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting relaying from %d to %d for chat %@", (uint8_t *)v8, 0x18u);
    }

    self->_relaying = v3;
    uint64_t v6 = [(CSDIDSChat *)self deviceRole];
    int v7 = [(CSDIDSChat *)self conference];
    [v7 setDeviceRole:v6];
  }
}

- (void)startConnectionWithTransport:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "transport: %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v6 = [(CSDIDSChat *)self conference];
  int v7 = [(CSDIDSChat *)self remoteFromID];
  id v8 = [(CSDIDSChat *)self crossDeviceIdentifier];
  [v6 setRemoteIDSDestinationURI:v7 crossDeviceIdentifier:v8];

  __int16 v9 = [(CSDIDSChat *)self conference];
  [v9 startConnectionWithTransport:v4];

  BOOL v10 = [(CSDIDSChat *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 chatStartedConnecting:self];
  }
}

- (void)prepareConference
{
  BOOL v3 = [(CSDIDSChat *)self conferenceCreationBlock];
  id v4 = v3[2]();
  [(CSDIDSChat *)self setConference:v4];

  id v5 = [(CSDIDSChat *)self conference];
  [v5 setDelegate:self];

  uint64_t v6 = +[TUCallCenter sharedInstance];
  int v7 = [v6 queue];
  id v8 = [(CSDIDSChat *)self conference];
  [v8 setDelegateQueue:v7];

  __int16 v14 = objc_alloc_init(CSDAVConferenceConfiguration);
  [(CSDAVConferenceConfiguration *)v14 setRequiresInviteDictionary:1];
  [(CSDAVConferenceConfiguration *)v14 setCaller:[(CSDIDSChat *)self isOutgoing]];
  __int16 v9 = [(CSDIDSChat *)self capabilities];
  [(CSDAVConferenceConfiguration *)v14 setCapabilities:v9];

  BOOL v10 = [(id)objc_opt_class() faceTimeAppUUID];
  [(CSDAVConferenceConfiguration *)v14 setClientUUID:v10];

  int v11 = [(CSDIDSChat *)self reportingHierarchyToken];
  [(CSDAVConferenceConfiguration *)v14 setReportingHierarchyToken:v11];

  id v12 = [(CSDIDSChat *)self remoteInviteDictionary];
  [(CSDAVConferenceConfiguration *)v14 setRemoteInviteDictionary:v12];

  [(CSDIDSChat *)self localPortraitAspectRatio];
  -[CSDAVConferenceConfiguration setLocalPortraitAspectRatio:](v14, "setLocalPortraitAspectRatio:");
  [(CSDIDSChat *)self localLandscapeAspectRatio];
  -[CSDAVConferenceConfiguration setLocalLandscapeAspectRatio:](v14, "setLocalLandscapeAspectRatio:");
  unsigned int v13 = [(CSDIDSChat *)self conference];
  [v13 prepareWithConfiguration:v14];
}

- (void)setRemoteVideoPresentationSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(CSDIDSChat *)self conference];
  objc_msgSend(v5, "setRemoteVideoPresentationSize:", width, height);
}

- (void)setRemoteVideoPresentationState:(int)a3
{
  if (a3 == 2) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = a3 == 1;
  }
  id v4 = [(CSDIDSChat *)self conference];
  [v4 setRemoteVideoPresentationState:v3];
}

- (void)_handlePushTokensInvited:(id)a3 didSendInvitation:(BOOL)a4 didCancelInvitation:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = [(CSDIDSChat *)self inviteCompletion];

  if (v8)
  {
    [(CSDIDSChat *)self setInvitedPushTokens:v11];
    [(CSDIDSChat *)self setHasSentInvitation:v6];
    __int16 v9 = [(CSDIDSChat *)self inviteCompletion];
    ((void (**)(void, id, BOOL))v9)[2](v9, v11, v5);

    [(CSDIDSChat *)self setInviteCompletion:0];
    BOOL v10 = [(CSDIDSChat *)self delegate];
    if ([(CSDIDSChat *)self hasSentInvitation] && (objc_opt_respondsToSelector() & 1) != 0) {
      [v10 chatSentInvitation:self];
    }
  }

  _objc_release_x2();
}

- (void)sessionStarted:(id)a3
{
  id v4 = (CSDIDSChat *)a3;
  BOOL v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    __int16 v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "sessionStarted: %@", (uint8_t *)&v13, 0xCu);
  }

  BOOL v6 = [(CSDIDSChat *)self delegate];
  unsigned __int8 v7 = [v6 isMediaAllowedForChat:self];

  if (v7)
  {
    id v8 = [(CSDIDSChat *)self conference];
    __int16 v9 = [v8 remoteInviteDictionary];

    if (v9)
    {
      BOOL v10 = [(CSDIDSChat *)v4 transport];
      [(CSDIDSChat *)self startConnectionWithTransport:v10];
    }
    else
    {
      BOOL v10 = sub_100008DCC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(CSDIDSChat *)self conference];
        unsigned int v12 = [v11 state];
        int v13 = 67109120;
        LODWORD(v14) = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not starting connection because conference state is %d", (uint8_t *)&v13, 8u);
      }
    }
  }
  else
  {
    BOOL v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      __int16 v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Not starting connection because the chat is not allowed to start media: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)session:(id)a3 invitationSentToPushTokens:(id)a4 shouldBreakBeforeMake:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "session %@ invitationSentToPushTokens %@ shouldBreakBeforeMake %d", (uint8_t *)&v11, 0x1Cu);
  }

  [(CSDIDSChat *)self setMayRequireBreakBeforeMake:v5];
  [(CSDIDSChat *)self _handlePushTokensInvited:v9 didSendInvitation:1 didCancelInvitation:0];
  [(CSDIDSChat *)self _setDateEndedIfNecessary];
}

- (void)session:(id)a3 endedWithReason:(int)a4
{
  id v6 = a3;
  unsigned __int8 v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 1024;
    int v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "session %@ endedWithReason %d", (uint8_t *)&v9, 0x12u);
  }

  id v8 = [(CSDIDSChat *)self conference];
  [v8 stop];

  [(CSDIDSChat *)self _handlePushTokensInvited:&__NSArray0__struct didSendInvitation:0 didCancelInvitation:1];
  [(CSDIDSChat *)self _setDateEndedIfNecessary];
}

- (void)session:(id)a3 receivedInvitationAcceptWithData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[CSDMessagingCallMessage alloc] initWithData:v7];

  int v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v43 = v6;
    *(_WORD *)&v43[8] = 2112;
    v44 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "session %@ receivedInvitationAcceptWithData %@", buf, 0x16u);
  }

  id v10 = [(CSDIDSChat *)self delegate];
  unsigned __int8 v11 = [v10 isMediaAllowedForChat:self];

  if ((v11 & 1) == 0)
  {
    BOOL v16 = sub_100008DCC();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v43 = self;
    v30 = "[WARN] Dropping invitation accept since the chat is not allowed to start media: %@";
LABEL_25:
    v31 = v16;
    uint32_t v32 = 12;
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    goto LABEL_34;
  }
  if (![(CSDIDSChat *)self isOutgoing])
  {
    BOOL v16 = sub_100008DCC();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v43 = self;
    v30 = "[WARN] Ignoring invitation accept since chat is incoming: %@";
    goto LABEL_25;
  }
  int v12 = [v6 remoteFromID];
  id v13 = [v12 length];

  if (v13)
  {
    id v14 = [v6 remoteFromID];
    id v41 = 0;
    id v15 = [v14 _stripPotentialTokenURIWithToken:&v41];
    BOOL v16 = v41;

    if (![v16 length])
    {
      v29 = sub_100008DCC();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1003A8CA8(v29);
      }
      goto LABEL_33;
    }
    NSSize v17 = [(CSDIDSChat *)self invitedPushTokens];
    unsigned __int8 v18 = [v17 containsObject:v16];

    if ((v18 & 1) == 0)
    {
      v29 = sub_100008DCC();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1003A8D84(v29);
      }
      goto LABEL_33;
    }
    if (!v8)
    {
      v29 = sub_100008DCC();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring incoming accept since accompanying message was nil", buf, 2u);
      }
      goto LABEL_33;
    }
    if ([(CSDMessagingCallMessage *)v8 type] != 1)
    {
      v29 = sub_100008DCC();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = (id)[(CSDMessagingCallMessage *)v8 type];
        if (v33 >= 3)
        {
          v34 = +[NSString stringWithFormat:@"(unknown: %i)", v33];
        }
        else
        {
          v34 = off_1005060B8[(int)v33];
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v43 = v34;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring incoming message since message with type=%@ was not invite.", buf, 0xCu);
      }
      goto LABEL_33;
    }
    int v19 = [(CSDMessagingCallMessage *)v8 inviteData];
    uint64_t v20 = [v19 faceTimeInviteDictionary];
    __int16 v21 = [(CSDIDSChat *)self conference];
    [v21 setRemoteInviteDictionary:v20];

    [(CSDIDSChat *)self setRemoteMomentsAvailable:[(CSDMessagingCallMessage *)v8 isMomentsAvailable]];
    if ([(CSDMessagingCallMessage *)v8 hasProtoUpgradeSessionUUID]
      && ([(CSDIDSChat *)self upgradeSessionUUID],
          v22 = objc_claimAutoreleasedReturnValue(),
          v22,
          !v22))
    {
      id v39 = objc_alloc((Class)NSUUID);
      v40 = [(CSDMessagingCallMessage *)v8 protoUpgradeSessionUUID];
      v23 = [v39 initWithUUIDString:v40];

      if (v23)
      {
        [(CSDIDSChat *)self setUpgradeSessionUUID:v23];
LABEL_15:

        if ([(CSDMessagingCallMessage *)v8 hasProtoWantsVideo])
        {
          if ([(CSDIDSChat *)self isVideo])
          {
            unsigned int v25 = [(CSDIDSChat *)self isVideo];
            unsigned int v26 = [(CSDMessagingCallMessage *)v8 protoWantsVideo];
            [(CSDIDSChat *)self setVideo:[(CSDMessagingCallMessage *)v8 protoWantsVideo]];
            if (v25 != v26)
            {
              v27 = [(CSDIDSChat *)self conference];
              v28 = [(CSDIDSChat *)self capabilities];
              [v27 updateCapabilities:v28];
            }
          }
        }
        if ([v6 state] == 3)
        {
          v29 = [v6 transport];
          [(CSDIDSChat *)self startConnectionWithTransport:v29];
        }
        else
        {
          v29 = sub_100008DCC();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v35 = [(CSDIDSChat *)self session];
            unsigned int v36 = [v35 state];
            v37 = [(CSDIDSChat *)self conference];
            unsigned int v38 = [v37 state];
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v43 = v36;
            *(_WORD *)&v43[4] = 1024;
            *(_DWORD *)&v43[6] = v38;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Not starting connecting because session state is %d and conference state is %d", buf, 0xEu);
          }
        }
LABEL_33:

        goto LABEL_34;
      }
      v24 = sub_100008DCC();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1003A8CEC(v8, v24);
      }
    }
    else
    {
      v23 = sub_100008DCC();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      v24 = [(CSDIDSChat *)self upgradeSessionUUID];
      *(_DWORD *)buf = 138412546;
      *(void *)v43 = v8;
      *(_WORD *)&v43[8] = 2112;
      v44 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[WARN] Not setting upgradeSessionUUID for message: %@ self.upgradeSessionUUID: %@", buf, 0x16u);
    }

    goto LABEL_15;
  }
  BOOL v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v30 = "[WARN] Ignoring invitation accept since there is no remote from ID set on the session.";
    v31 = v16;
    uint32_t v32 = 2;
    goto LABEL_26;
  }
LABEL_34:
}

- (void)session:(id)a3 receivedInvitationDeclineWithData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "session %@ receivedInvitationDeclineWithData %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)session:(id)a3 receivedInvitationCancelWithData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "session %@ receivedInvitationCancelWithData %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)session:(id)a3 receivedData:(id)a4
{
  id v5 = a3;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"non-nil";
    if (!a4) {
      CFStringRef v7 = @"nil";
    }
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    CFStringRef v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "session %@ receivedData (data is %@)", (uint8_t *)&v8, 0x16u);
  }
}

- (void)conferenceFinishedPreparing:(id)a3
{
  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)&v25, 2u);
  }

  id v5 = [(CSDIDSChat *)self delegate];
  id v6 = [(id)objc_opt_class() faceTimeAppUUID];
  CFStringRef v7 = [(CSDIDSChat *)self session];
  [v7 setClientUUID:v6];

  id v8 = [v5 isWiFiAllowedForChat:self];
  id v9 = [(CSDIDSChat *)self session];
  [v9 setWiFiAllowed:v8];

  id v10 = [v5 isCellularDataAllowedForChat:self];
  CFStringRef v11 = [(CSDIDSChat *)self session];
  [v11 setCellularDataAllowed:v10];

  id v12 = [v5 isCellularDataPreferredForChat:self];
  id v13 = [(CSDIDSChat *)self session];
  [v13 setCellularDataPreferred:v12];

  id v14 = objc_alloc_init(CSDMessagingCallMessage);
  [(CSDMessagingCallMessage *)v14 addProtocolVersion];
  [(CSDMessagingCallMessage *)v14 setType:1];
  id v15 = [CSDMessagingAVConferenceInviteData alloc];
  BOOL v16 = [(CSDIDSChat *)self conference];
  NSSize v17 = [v16 localInviteDictionary];
  unsigned __int8 v18 = [(CSDMessagingAVConferenceInviteData *)v15 initWithFaceTimeInviteDictionary:v17];
  [(CSDMessagingCallMessage *)v14 setInviteData:v18];

  [(CSDMessagingCallMessage *)v14 setShouldSuppressInCallUI:[(CSDIDSChat *)self shouldSuppressInCallUI]];
  int v19 = [(CSDIDSChat *)self upgradeSessionUUID];
  uint64_t v20 = [v19 UUIDString];
  [(CSDMessagingCallMessage *)v14 setProtoUpgradeSessionUUID:v20];

  if (objc_opt_respondsToSelector()) {
    -[CSDMessagingCallMessage setMomentsAvailable:](v14, "setMomentsAvailable:", [v5 isMomentsAvailableForChat:self]);
  }
  [(CSDMessagingCallMessage *)v14 setProtoWantsVideo:[(CSDIDSChat *)self isVideo]];
  __int16 v21 = sub_100008DCC();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    unsigned int v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "message: %@", (uint8_t *)&v25, 0xCu);
  }

  unsigned int v22 = [(CSDIDSChat *)self isOutgoing];
  v23 = [(CSDIDSChat *)self session];
  v24 = [(CSDMessagingCallMessage *)v14 data];
  if (v22) {
    [v23 sendInvitationWithData:v24];
  }
  else {
    [v23 acceptInvitationWithData:v24];
  }
}

- (void)conferenceStarted:(id)a3
{
  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  if ([(CSDIDSChat *)self isVideo])
  {
    dispatch_time_t v5 = dispatch_time(0, 3000000000);
    id v6 = +[TUCallCenter sharedInstance];
    CFStringRef v7 = [v6 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007EFAC;
    block[3] = &unk_100504EC0;
    block[4] = self;
    dispatch_after(v5, v7, block);
  }
  else
  {
    id v8 = [(CSDIDSChat *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 chatConnected:self];
    }
  }
}

- (void)conference:(id)a3 endedWithReason:(int64_t)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    int64_t v12 = a4;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "reason=%ld error=%@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = [(CSDIDSChat *)self session];
  unsigned int v10 = [v9 state];

  if (v10 == 1) {
    [(CSDIDSChat *)self cancelOrDeclineInvitation];
  }
  [(CSDIDSChat *)self _setDateEndedIfNecessary];
}

- (void)mutedChangedForConference:(id)a3
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", v4, 2u);
  }
}

- (void)sendingAudioChangedForConference:(id)a3
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", v4, 2u);
  }
}

- (void)receivedFirstRemoteFrameForConference:(id)a3
{
  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", v8, 2u);
  }

  dispatch_time_t v5 = [(CSDIDSChat *)self dateReceivedFirstRemoteFrame];

  if (!v5)
  {
    id v6 = +[NSDate date];
    [(CSDIDSChat *)self setDateReceivedFirstRemoteFrame:v6];

    id v7 = [(CSDIDSChat *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 chatConnected:self];
    }
  }
}

- (void)remoteVideoPausedForConference:(id)a3
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", v4, 2u);
  }
}

- (void)conference:(id)a3 remoteMediaStalled:(BOOL)a4
{
  if (a4)
  {
    dispatch_time_t v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remote media stalled for chat: %@. Reconnecting IDS session.", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [(CSDIDSChat *)self session];
    [v6 reconnectSession];
  }
}

- (void)conference:(id)a3 inputFrequencyLevelChangedTo:(id)a4
{
  id v6 = a4;
  dispatch_time_t v5 = [(CSDIDSChat *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 chat:self inputFrequencyLevelChangedTo:v6];
  }
}

- (void)conference:(id)a3 outputFrequencyLevelChangedTo:(id)a4
{
  id v6 = a4;
  dispatch_time_t v5 = [(CSDIDSChat *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 chat:self outputFrequencyLevelChangedTo:v6];
  }
}

- (void)conference:(id)a3 inputLevelChangedTo:(float)a4
{
  id v7 = [(CSDIDSChat *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v6 = a4;
    [v7 chat:self inputLevelChangedTo:v6];
  }
}

- (void)conference:(id)a3 outputLevelChangedTo:(float)a4
{
  id v7 = [(CSDIDSChat *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v6 = a4;
    [v7 chat:self outputLevelChangedTo:v6];
  }
}

- (void)conference:(id)a3 changedBytesOfDataUsed:(int64_t)a4
{
  id v6 = [(CSDIDSChat *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 chat:self changedBytesOfDataUsed:a4];
  }
}

- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5
{
  id v7 = a4;
  id v6 = [(CSDIDSChat *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 chat:self receivedData:v7];
  }
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_shouldSuppressInCallUI;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  self->_shouldSuppressInCallUI = a3;
}

- (CSDIDSChatDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDIDSChatDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSDExternalIDSDualSession)session
{
  return self->_session;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (BOOL)isOutgoing
{
  return self->_outgoing;
}

- (BOOL)isVideo
{
  return self->_video;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (BOOL)isRelaying
{
  return self->_relaying;
}

- (BOOL)isRemoteUplinkMuted
{
  return self->_remoteUplinkMuted;
}

- (void)setRemoteUplinkMuted:(BOOL)a3
{
  self->_remoteUplinkMuted = a3;
}

- (BOOL)isRemoteMomentsAvailable
{
  return self->_remoteMomentsAvailable;
}

- (void)setRemoteMomentsAvailable:(BOOL)a3
{
  self->_remoteMomentsAvailable = a3;
}

- (NSUUID)localSenderIdentityUUID
{
  return self->_localSenderIdentityUUID;
}

- (void)setLocalSenderIdentityUUID:(id)a3
{
}

- (NSUUID)upgradeSessionUUID
{
  return self->_upgradeSessionUUID;
}

- (void)setUpgradeSessionUUID:(id)a3
{
}

- (CSDAVConference)conference
{
  return self->_conference;
}

- (void)setConference:(id)a3
{
}

- (BOOL)shouldStartAudioPaused
{
  return self->_shouldStartAudioPaused;
}

- (void)setShouldStartAudioPaused:(BOOL)a3
{
  self->_shouldStartAudioPaused = a3;
}

- (BOOL)shouldStartVideoPaused
{
  return self->_shouldStartVideoPaused;
}

- (void)setShouldStartVideoPaused:(BOOL)a3
{
  self->_shouldStartVideoPaused = a3;
}

- (BOOL)mayRequireBreakBeforeMake
{
  return self->_mayRequireBreakBeforeMake;
}

- (void)setMayRequireBreakBeforeMake:(BOOL)a3
{
  self->_mayRequireBreakBeforeMake = a3;
}

- (BOOL)hasSentInvitation
{
  return self->_hasSentInvitation;
}

- (void)setHasSentInvitation:(BOOL)a3
{
  self->_hasSentInvitation = a3;
}

- (NSDate)dateReceivedFirstRemoteFrame
{
  return self->_dateReceivedFirstRemoteFrame;
}

- (void)setDateReceivedFirstRemoteFrame:(id)a3
{
}

- (NSDate)dateEnded
{
  return self->_dateEnded;
}

- (void)setDateEnded:(id)a3
{
}

- (NSDictionary)remoteInviteDictionary
{
  return self->_remoteInviteDictionary;
}

- (NSArray)invitedPushTokens
{
  return self->_invitedPushTokens;
}

- (void)setInvitedPushTokens:(id)a3
{
}

- (id)inviteCompletion
{
  return self->_inviteCompletion;
}

- (void)setInviteCompletion:(id)a3
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

- (id)conferenceCreationBlock
{
  return self->_conferenceCreationBlock;
}

- (void)setConferenceCreationBlock:(id)a3
{
}

- (RTCSecureHierarchyToken)reportingHierarchyToken
{
  return self->_reportingHierarchyToken;
}

- (void)setReportingHierarchyToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingHierarchyToken, 0);
  objc_storeStrong(&self->_conferenceCreationBlock, 0);
  objc_storeStrong(&self->_inviteCompletion, 0);
  objc_storeStrong((id *)&self->_invitedPushTokens, 0);
  objc_storeStrong((id *)&self->_remoteInviteDictionary, 0);
  objc_storeStrong((id *)&self->_dateEnded, 0);
  objc_storeStrong((id *)&self->_dateReceivedFirstRemoteFrame, 0);
  objc_storeStrong((id *)&self->_conference, 0);
  objc_storeStrong((id *)&self->_upgradeSessionUUID, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityUUID, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end