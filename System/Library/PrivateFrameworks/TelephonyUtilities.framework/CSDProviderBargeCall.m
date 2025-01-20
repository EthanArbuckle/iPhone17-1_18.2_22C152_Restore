@interface CSDProviderBargeCall
+ (BOOL)isReceivingTransmission:(int64_t)a3;
+ (BOOL)isSendingTransmission:(int64_t)a3;
+ (id)callForChannelIdentity:(id)a3;
+ (id)callForChannelIdentity:(id)a3 configuration:(id)a4;
+ (id)callForChannelSource:(id)a3 joinAction:(id)a4;
+ (id)defaultConfigurationWithProviderIdentifier:(id)a3;
- (BOOL)_activeStandardCallExists;
- (BOOL)_recordingClientPIDsContainsProcessIdentifier:(int)a3;
- (BOOL)_recordingClientPIDsNotification:(id)a3 containsProcessIdentifier:(int)a4;
- (BOOL)isPTT;
- (BOOL)isPlayingSystemSound;
- (BOOL)isReceivingTransmission;
- (BOOL)isSendingTransmission;
- (BOOL)isThirdPartyVideo;
- (BOOL)isUsingBaseband;
- (BOOL)isVideo;
- (BOOL)uplinkWasExplicitlyMuted;
- (CSDProviderBargeCall)initWithUUID:(id)a3 configuration:(id)a4;
- (CSDProviderBargeCallDelegate)providerBargeCallDelegate;
- (CXChannelTransmitStartAction)deferredTransmitStartAction;
- (TUCallSoundPlayer)soundPlayer;
- (id)displayContext;
- (id)displayName;
- (id)dynamicDisplayContext;
- (id)provider;
- (void)_handlePushToTalkRecordingStateChanged:(id)a3;
- (void)_handleRecordingStateChanged:(id)a3;
- (void)audioApplicationMuteStatusChanged:(id)a3;
- (void)deactivate;
- (void)dealloc;
- (void)disconnectWithReason:(int)a3;
- (void)handleAudioSessionActivationStateChangedTo:(id)a3;
- (void)playSoundForSoundType:(int64_t)a3 completion:(id)a4;
- (void)playSoundForTransmissionState:(int64_t)a3 completion:(id)a4;
- (void)setDeferredTransmitStartAction:(id)a3;
- (void)setIsPlayingSystemSound:(BOOL)a3;
- (void)setProviderBargeCallDelegate:(id)a3;
- (void)setProviderSource:(id)a3;
- (void)setSoundPlayer:(id)a3;
- (void)setTransmissionState:(int64_t)a3;
- (void)startTransmissionWithOriginator:(int64_t)a3;
- (void)stopTransmissionWithOriginator:(int64_t)a3;
- (void)updateUplinkMuteState;
@end

@implementation CSDProviderBargeCall

+ (id)callForChannelIdentity:(id)a3
{
  id v4 = a3;
  v5 = [v4 applicationIdentifier];
  v6 = [a1 defaultConfigurationWithProviderIdentifier:v5];

  v7 = [a1 callForChannelIdentity:v4 configuration:v6];

  return v7;
}

+ (id)callForChannelIdentity:(id)a3 configuration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)CXCallUpdate);
  [v7 setSupportsHolding:1];
  v8 = [CSDProviderBargeCall alloc];
  v9 = [v6 channelUUID];

  v10 = [(CSDProviderBargeCall *)v8 initWithUUID:v9 configuration:v5];
  [(CSDProviderCall *)v10 updateWithCallUpdate:v7];

  return v10;
}

+ (id)callForChannelSource:(id)a3 joinAction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 channelUpdate];
  v9 = objc_msgSend(v8, "csd_callUpdate");

  [v9 setSupportsHolding:1];
  v10 = [v7 identifier];
  v11 = [a1 defaultConfigurationWithProviderIdentifier:v10];

  [v11 setProviderSource:v7];
  v12 = [CSDProviderBargeCall alloc];
  v13 = [v6 channelUUID];

  v14 = [(CSDProviderBargeCall *)v12 initWithUUID:v13 configuration:v11];
  [(CSDProviderCall *)v14 updateWithCallUpdate:v9];

  return v14;
}

+ (id)defaultConfigurationWithProviderIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[CSDProviderCallConfiguration alloc] initWithProviderIdentifier:v3];

  [(CSDProviderCallConfiguration *)v4 setEndpointOnCurrentDevice:1];
  [(CSDProviderCallConfiguration *)v4 setHeld:1];
  [(CSDProviderCallConfiguration *)v4 setOutgoing:1];
  [(CSDProviderCallConfiguration *)v4 setTransmissionMode:1];
  [(CSDProviderCallConfiguration *)v4 setAccessoryButtonEventsEnabled:1];

  return v4;
}

- (CSDProviderBargeCall)initWithUUID:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = [a3 UUIDString];
  v17.receiver = self;
  v17.super_class = (Class)CSDProviderBargeCall;
  v8 = [(CSDProviderCall *)&v17 initWithUniqueProxyIdentifier:v7 configuration:v6];

  if (v8)
  {
    v9 = (TUCallSoundPlayer *)objc_alloc_init((Class)TUCallSoundPlayer);
    soundPlayer = v8->_soundPlayer;
    v8->_soundPlayer = v9;

    v8->_isPlayingSystemSound = 0;
    v11 = +[NSArray arrayWithObject:AVSystemController_RecordingStateDidChangeNotification];
    v12 = +[AVSystemController sharedAVSystemController];
    [v12 setAttribute:v11 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    v13 = +[NSNotificationCenter defaultCenter];
    uint64_t v14 = AVSystemController_RecordingStateDidChangeNotification;
    v15 = +[AVSystemController sharedAVSystemController];
    [v13 addObserver:v8 selector:"_handleRecordingStateChanged:" name:v14 object:v15];
  }
  return v8;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSDProviderBargeCall;
  [(CSDProviderCall *)&v4 dealloc];
}

- (id)displayContext
{
  return 0;
}

- (id)displayName
{
  v2 = [(CSDProviderCall *)self callerNameFromNetwork];
  id v3 = v2;
  if (!v2) {
    v2 = &stru_100517F40;
  }
  objc_super v4 = v2;

  return v4;
}

- (id)dynamicDisplayContext
{
  return 0;
}

- (BOOL)isPTT
{
  return 1;
}

- (id)provider
{
  id v3 = [(CSDProviderBargeCall *)self providerBargeCallDelegate];
  objc_super v4 = [(CSDProviderCall *)self providerIdentifier];
  id v5 = [v3 channelProviderForIdentifier:v4];

  return v5;
}

- (void)setProviderSource:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDProviderCall *)self providerSource];
  v8.receiver = self;
  v8.super_class = (Class)CSDProviderBargeCall;
  [(CSDProviderCall *)&v8 setProviderSource:v4];

  uint64_t v6 = [(CSDProviderBargeCall *)self deferredTransmitStartAction];
  id v7 = (void *)v6;
  if (v4 && !v5 && v6)
  {
    [(CSDProviderBargeCall *)self setDeferredTransmitStartAction:0];
    -[CSDProviderBargeCall startTransmissionWithOriginator:](self, "startTransmissionWithOriginator:", [v7 originator]);
  }
}

- (BOOL)uplinkWasExplicitlyMuted
{
  return 1;
}

- (BOOL)isVideo
{
  return 0;
}

- (BOOL)isThirdPartyVideo
{
  return 0;
}

- (BOOL)isUsingBaseband
{
  return 0;
}

- (void)setTransmissionState:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSDProviderBargeCall;
  [(CSDCall *)&v4 setTransmissionState:a3];
  [(CSDProviderBargeCall *)self updateUplinkMuteState];
}

- (void)updateUplinkMuteState
{
  if ([(CSDProviderBargeCall *)self _activeStandardCallExists])
  {
    id v3 = sub_100008DCC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Skipping PushToTalk provider uplink mute state update because an active standard call exists.", buf, 2u);
    }

    return;
  }
  if (![(CSDProviderBargeCall *)self isPlayingSystemSound])
  {
    id v5 = [(CSDProviderBargeCall *)self providerBargeCallDelegate];
    if (v5
      && ([(CSDProviderBargeCall *)self channelSource],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v5 isAppForegroundForChannelSource:v6],
          v6,
          v7))
    {
      objc_super v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = 0;
        v9 = "Unmuting PushToTalk provider uplink because the provider is running in the foreground.";
        v10 = (uint8_t *)&v16;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }
    else
    {
      if (([(CSDCall *)self transmissionState] & 2) != 0
        && ![(CSDProviderBargeCall *)self isSendingTransmission])
      {
        v11 = [(CSDProviderCall *)self providerSource];
        unsigned __int8 v12 = -[CSDProviderBargeCall _recordingClientPIDsContainsProcessIdentifier:](self, "_recordingClientPIDsContainsProcessIdentifier:", [v11 processIdentifier]);

        if ((v12 & 1) == 0)
        {
          objc_super v8 = sub_100008DCC();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Muting PushToTalk provider uplink because the barge call is in a receiving only state.", v15, 2u);
          }
          uint64_t v13 = 1;
          goto LABEL_20;
        }
      }
      objc_super v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        v9 = "Unmuting PushToTalk provider uplink because the barge call is not in a receiving only state.";
        v10 = (uint8_t *)&v14;
        goto LABEL_18;
      }
    }
    uint64_t v13 = 0;
LABEL_20:

    [(CSDProviderCall *)self setUnderlyingUplinkMuted:v13];
    return;
  }
  objc_super v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Muting PushToTalk provider uplink because a system sound is being played.", v17, 2u);
  }

  [(CSDProviderCall *)self setUnderlyingUplinkMuted:1];
}

- (BOOL)_activeStandardCallExists
{
  v2 = +[TUCallCenter sharedInstance];
  id v3 = [v2 countOfCallsPassingTest:&stru_100505F60];

  return v3 != 0;
}

- (BOOL)isReceivingTransmission
{
  id v3 = objc_opt_class();
  int64_t v4 = [(CSDCall *)self transmissionState];

  return _[v3 isReceivingTransmission:v4];
}

+ (BOOL)isReceivingTransmission:(int64_t)a3
{
  return (a3 & 3) == 2;
}

- (BOOL)isSendingTransmission
{
  id v3 = objc_opt_class();
  int64_t v4 = [(CSDCall *)self transmissionState];

  return _[v3 isSendingTransmission:v4];
}

+ (BOOL)isSendingTransmission:(int64_t)a3
{
  return (a3 & 5) == 4;
}

- (void)startTransmissionWithOriginator:(int64_t)a3
{
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received start transmission request for barge call.", buf, 2u);
  }

  if (a3 == 1 && ![(CSDProviderCall *)self accessoryButtonEventsEnabled])
  {
    uint64_t v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v14 = 0;
      unsigned int v7 = "Ignoring barge call transmit request because the request originated from an accessory and accessory events ar"
           "e disabled for the call.";
      objc_super v8 = v14;
      goto LABEL_17;
    }
  }
  else if ([(CSDProviderBargeCall *)self isSendingTransmission])
  {
    uint64_t v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      unsigned int v7 = "Ignoring barge call transmit request because we are already transmitting.";
      objc_super v8 = (uint8_t *)&v13;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else if ([(CSDProviderBargeCall *)self isReceivingTransmission] {
         && [(CSDProviderCall *)self transmissionMode])
  }
  {
    uint64_t v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      unsigned int v7 = "Could not begin sending transmission because barge call was receiving a transmission and does not support full-duplex mode.";
      objc_super v8 = (uint8_t *)&v12;
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v6 = [(CSDProviderBargeCall *)self providerBargeCallDelegate];
    [v6 acquireIndefiniteProcessAssertionForCall:self];
    if ([(CSDProviderBargeCall *)self isOnHold]) {
      [(CSDProviderCall *)self unhold];
    }
    id v9 = objc_alloc((Class)CXChannelTransmitStartAction);
    v10 = [(CSDProviderBargeCall *)self uniqueProxyIdentifierUUID];
    id v11 = [v9 initWithChannelUUID:v10];

    [v11 setOriginator:a3];
    [v6 performChannelAction:v11 forCall:self];
  }
}

- (void)stopTransmissionWithOriginator:(int64_t)a3
{
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received stop transmission request for barge call.", buf, 2u);
  }

  if (a3 == 1 && ![(CSDProviderCall *)self accessoryButtonEventsEnabled])
  {
    uint64_t v6 = sub_100008DCC();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)__int16 v13 = 0;
    v10 = "Ignoring barge call end transmit request because the request originated from an accessory and accessory events"
          " are disabled for the call.";
    id v11 = v13;
    goto LABEL_13;
  }
  if (![(CSDProviderBargeCall *)self isSendingTransmission])
  {
    uint64_t v6 = sub_100008DCC();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v12 = 0;
    v10 = "Ignoring barge call end transmit request because we are not transmitting.";
    id v11 = (uint8_t *)&v12;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    goto LABEL_14;
  }
  if (![(CSDProviderBargeCall *)self isReceivingTransmission]) {
    [(CSDProviderCall *)self hold];
  }
  uint64_t v6 = [(CSDProviderBargeCall *)self providerBargeCallDelegate];
  id v7 = objc_alloc((Class)CXChannelTransmitStopAction);
  objc_super v8 = [(CSDProviderBargeCall *)self uniqueProxyIdentifierUUID];
  id v9 = [v7 initWithChannelUUID:v8];

  [v9 setOriginator:a3];
  [v6 performChannelAction:v9 forCall:self];

LABEL_14:
}

- (void)deactivate
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deactivating PushToTalk barge call.", buf, 2u);
  }

  unsigned int v4 = [(CSDProviderBargeCall *)self isSendingTransmission];
  [(CSDProviderCall *)self setActiveRemoteParticipant:0];
  [(CSDProviderBargeCall *)self setTransmissionState:1];
  if (v4)
  {
    id v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopping transmission for PushToTalk barge call deactivation.", v10, 2u);
    }

    uint64_t v6 = [(CSDProviderBargeCall *)self providerBargeCallDelegate];
    id v7 = objc_alloc((Class)CXChannelTransmitStopAction);
    objc_super v8 = [(CSDProviderBargeCall *)self uniqueProxyIdentifierUUID];
    id v9 = [v7 initWithChannelUUID:v8];

    [v9 setOriginator:3];
    [v6 performChannelAction:v9 forCall:self];
  }
  [(CSDProviderCall *)self hold];
  [(CSDProviderCall *)self setHeld:1];
}

- (void)disconnectWithReason:(int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CSDProviderBargeCall;
  -[CSDProviderCall disconnectWithReason:](&v10, "disconnectWithReason:");
  id v5 = objc_alloc((Class)CXChannelLeaveAction);
  uint64_t v6 = [(CSDProviderBargeCall *)self uniqueProxyIdentifierUUID];
  id v7 = [v5 initWithChannelUUID:v6];

  if (a3 == 2) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 4;
  }
  [v7 setOriginator:v8];
  id v9 = [(CSDProviderBargeCall *)self providerBargeCallDelegate];
  [v9 performChannelAction:v7 forCall:self];
}

- (void)_handleRecordingStateChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(CSDProviderBargeCall *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079F3C;
  block[3] = &unk_100505558;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_handlePushToTalkRecordingStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDProviderCall *)self providerSource];
  unsigned __int8 v6 = -[CSDProviderBargeCall _recordingClientPIDsNotification:containsProcessIdentifier:](self, "_recordingClientPIDsNotification:containsProcessIdentifier:", v4, [v5 processIdentifier]);

  if (v6)
  {
    if ([(CSDProviderBargeCall *)self isSendingTransmission])
    {
      int64_t v7 = [(CSDCall *)self transmissionState];
      [(CSDProviderBargeCall *)self playSoundForTransmissionState:v7 completion:0];
    }
  }
  else
  {
    [(CSDProviderBargeCall *)self updateUplinkMuteState];
  }
}

- (BOOL)_recordingClientPIDsNotification:(id)a3 containsProcessIdentifier:(int)a4
{
  if (a4 < 1) {
    return 0;
  }
  uint64_t v4 = *(void *)&a4;
  id v5 = [a3 userInfo];
  unsigned __int8 v6 = [v5 objectForKeyedSubscript:AVSystemController_RecordingClientPIDsNotificationParameter];

  int64_t v7 = +[NSNumber numberWithInt:v4];
  LOBYTE(v5) = [v6 containsObject:v7];

  return (char)v5;
}

- (BOOL)_recordingClientPIDsContainsProcessIdentifier:(int)a3
{
  if (a3 < 1) {
    return 0;
  }
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = +[AVSystemController sharedAVSystemController];
  id v5 = [v4 attributeForKey:AVSystemController_RecordingClientPIDsAttribute];

  unsigned __int8 v6 = +[NSNumber numberWithInt:v3];
  LOBYTE(v4) = [v5 containsObject:v6];

  return (char)v4;
}

- (void)playSoundForTransmissionState:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if ((a3 & 4) != 0)
  {
    if ((a3 & 8) != 0)
    {
      uint64_t v7 = 20;
      goto LABEL_9;
    }
  }
  else if ((a3 & 0xC) == 8)
  {
    uint64_t v7 = 21;
LABEL_9:
    [(CSDProviderBargeCall *)self playSoundForSoundType:v7 completion:v6];
    goto LABEL_10;
  }
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    int64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "There was no sound type found for transmission state %lu", (uint8_t *)&v9, 0xCu);
  }

LABEL_10:
}

- (void)playSoundForSoundType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  [(CSDProviderBargeCall *)self setIsPlayingSystemSound:1];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x14) {
    [(CSDProviderCall *)self setUnderlyingUplinkMuted:1];
  }
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  __int16 v13 = sub_10007A388;
  __int16 v14 = &unk_100505FB0;
  v15 = self;
  id v16 = v6;
  id v7 = v6;
  id v8 = objc_retainBlock(&v11);
  int v9 = [(CSDProviderBargeCall *)self soundPlayer];
  unsigned __int8 v10 = [v9 attemptToPlaySoundType:a3 forCall:self completion:v8];

  if ((v10 & 1) == 0)
  {
    [(CSDProviderBargeCall *)self setIsPlayingSystemSound:0];
    [(CSDProviderBargeCall *)self updateUplinkMuteState];
  }
}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSDProviderBargeCall;
  id v4 = a3;
  [(CSDProviderCall *)&v6 handleAudioSessionActivationStateChangedTo:v4];
  if ((id)[(CSDCall *)self transmissionState] == (id)5) {
    [(CSDProviderBargeCall *)self playSoundForTransmissionState:[(CSDCall *)self transmissionState] completion:0];
  }
  id v5 = [(CSDProviderBargeCall *)self channelSource];
  [v5 handleAudioSessionActivationStateChangedTo:v4];
}

- (void)audioApplicationMuteStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDProviderBargeCall *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007A5F8;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (CXChannelTransmitStartAction)deferredTransmitStartAction
{
  return self->_deferredTransmitStartAction;
}

- (void)setDeferredTransmitStartAction:(id)a3
{
}

- (CSDProviderBargeCallDelegate)providerBargeCallDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerBargeCallDelegate);

  return (CSDProviderBargeCallDelegate *)WeakRetained;
}

- (void)setProviderBargeCallDelegate:(id)a3
{
}

- (TUCallSoundPlayer)soundPlayer
{
  return self->_soundPlayer;
}

- (void)setSoundPlayer:(id)a3
{
}

- (BOOL)isPlayingSystemSound
{
  return self->_isPlayingSystemSound;
}

- (void)setIsPlayingSystemSound:(BOOL)a3
{
  self->_isPlayingSystemSound = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundPlayer, 0);
  objc_destroyWeak((id *)&self->_providerBargeCallDelegate);

  objc_storeStrong((id *)&self->_deferredTransmitStartAction, 0);
}

@end