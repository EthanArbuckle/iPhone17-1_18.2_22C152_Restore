@interface CSDCallStateMonitor
+ (double)breakBeforeMakeTimeout;
- (BOOL)isAudioMutedForHoldMusic;
- (BOOL)wantsBreakBeforeMakeForCall:(id)a3;
- (CSDCallStateMonitor)initWithCallCenter:(id)a3;
- (CSDCallStateMonitor)initWithCallCenter:(id)a3 featureFlags:(id)a4 serverBag:(id)a5;
- (CSDConversationServerBag)serverBag;
- (CSDRTTSettings)rttSettings;
- (CSDRouteManager)routeManager;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)callDurationLimitTimer;
- (TUCallCenter)callCenter;
- (TUFeatureFlags)featureFlags;
- (id)_ringingTimerForCallWithIdentifier:(id)a3;
- (id)setUpBreakBeforeMakeTimeout;
- (int)lockStateNotificationToken;
- (int)passcodeLockedOrBlockedNotificationToken;
- (int)requestCLTMThrottleUncapToken;
- (void)_cleanCallMediaCache;
- (void)_disconnectOrPullExistingCallsForCallIfNecessary:(id)a3;
- (void)_handleAudioReadyForCall:(id)a3;
- (void)_handleCallConnected:(id)a3;
- (void)_handleCallDurationTimerFired;
- (void)_handleCallMayRequireBreakBeforeMakeChanged:(id)a3;
- (void)_handleCallStartedConnecting:(id)a3;
- (void)_handleCallStatusChanged:(id)a3;
- (void)_handlePasscodeLockedOrBlocked;
- (void)_notifyCLTMOfIncomingCall;
- (void)_pushCallToAlternateDestinationIfNecessary:(id)a3;
- (void)_setUpBreakBeforeMakeTimeoutIfNecessaryForCall:(id)a3;
- (void)_setUpCallDurationLimitIfNecessary;
- (void)_updateCallMutingForHoldMusic;
- (void)callIsOnHoldChangedNotification:(id)a3;
- (void)clearUplinkMutedCacheIfNecessary;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)dealloc;
- (void)disconnectActiveCallsBasedOnCallStatusForCall:(id)a3;
- (void)disconnectAllCallsBesides:(id)a3;
- (void)enableEmergencyModeIfNecessaryForCall:(id)a3;
- (void)handleCallConnectedNotification:(id)a3;
- (void)handleCallHasStartedOutgoingChangedNotification:(id)a3;
- (void)handleCallMayRequireBreakBeforeMakeChangedNotification:(id)a3;
- (void)handleCallOneToOneModeChangedNotification:(id)a3;
- (void)handleCallStartedConnectingNotification:(id)a3;
- (void)handleCallStatusChangedNotification:(id)a3;
- (void)handleCallUpgradedToVideoNotification:(id)a3;
- (void)handleCallWantsHoldMusicChangedNotification:(id)a3;
- (void)leaveAVLessConversationsIfNecessaryForCall:(id)a3;
- (void)setAudioMutedForHoldMusic:(BOOL)a3;
- (void)setCallDurationLimitTimer:(id)a3;
- (void)setLockStateNotificationToken:(int)a3;
- (void)setPasscodeLockedOrBlockedNotificationToken:(int)a3;
- (void)setRequestCLTMThrottleUncapToken:(int)a3;
- (void)setRttSettings:(id)a3;
- (void)setSetUpBreakBeforeMakeTimeout:(id)a3;
@end

@implementation CSDCallStateMonitor

- (CSDCallStateMonitor)initWithCallCenter:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)TUFeatureFlags);
  v6 = objc_alloc_init(CSDSharedConversationServerBag);
  v7 = [(CSDCallStateMonitor *)self initWithCallCenter:v4 featureFlags:v5 serverBag:v6];

  return v7;
}

- (CSDCallStateMonitor)initWithCallCenter:(id)a3 featureFlags:(id)a4 serverBag:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v34.receiver = self;
  v34.super_class = (Class)CSDCallStateMonitor;
  v12 = [(CSDCallStateMonitor *)&v34 init];
  if (v12)
  {
    uint64_t v13 = [v9 queue];
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_callCenter, a3);
    objc_storeStrong((id *)&v12->_featureFlags, a4);
    objc_storeStrong((id *)&v12->_serverBag, a5);
    uint64_t v15 = +[RTTSettings sharedInstance];
    rttSettings = v12->_rttSettings;
    v12->_rttSettings = (CSDRTTSettings *)v15;

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v12 selector:"handleCallHasStartedOutgoingChangedNotification:" name:@"CSDCallHasStartedOutgoingChangedNotification" object:0];
    [v17 addObserver:v12 selector:"handleCallStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];
    [v17 addObserver:v12 selector:"handleCallStatusChangedNotification:" name:TUCallCenterVideoCallStatusChangedNotification object:0];
    [v17 addObserver:v12 selector:"handleCallStartedConnectingNotification:" name:TUCallCenterCallStartedConnectingNotification object:0];
    [v17 addObserver:v12 selector:"handleCallConnectedNotification:" name:TUCallCenterCallConnectedNotification object:0];
    [v17 addObserver:v12 selector:"handleCallMayRequireBreakBeforeMakeChangedNotification:" name:@"CSDCallMayRequireBreakBeforeMakeChangedNotification" object:0];
    [v17 addObserver:v12 selector:"handleCallWantsHoldMusicChangedNotification:" name:TUCallCenterCallWantsHoldMusicChangedNotification object:0];
    [v17 addObserver:v12 selector:"callIsOnHoldChangedNotification:" name:TUCallIsOnHoldChangedNotification object:0];
    [v17 addObserver:v12 selector:"handleCallOneToOneModeChangedNotification:" name:@"CSDCallOneToOneModeChangedNotification" object:0];
    [v17 addObserver:v12 selector:"handleCallUpgradedToVideoNotification:" name:TUCallUpgradedToVideoNotification object:0];
    notify_register_check((const char *)[@"com.apple.request.hipuncap" UTF8String], &v12->_requestCLTMThrottleUncapToken);
    v18 = [v9 conversationManager];
    [v18 addDelegate:v12 queue:v12->_queue];

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000613B4;
    v32[3] = &unk_100505AF0;
    id v19 = v9;
    id v33 = v19;
    v20 = objc_retainBlock(v32);
    id setUpBreakBeforeMakeTimeout = v12->_setUpBreakBeforeMakeTimeout;
    v12->_id setUpBreakBeforeMakeTimeout = v20;

    objc_initWeak(&location, v12);
    v22 = (const char *)[@"com.apple.springboard.passcodeLockedOrBlocked" UTF8String];
    v23 = [v19 queue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000614C8;
    handler[3] = &unk_100505B18;
    objc_copyWeak(&v30, &location);
    notify_register_dispatch(v22, &v12->_passcodeLockedOrBlockedNotificationToken, v23, handler);

    v24 = (const char *)[@"com.apple.springboard.lockstate" UTF8String];
    v25 = [v19 queue];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10006150C;
    v27[3] = &unk_100505B18;
    objc_copyWeak(&v28, &location);
    notify_register_dispatch(v24, &v12->_lockStateNotificationToken, v25, v27);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v12;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(CSDCallStateMonitor *)self callDurationLimitTimer];

  if (v4)
  {
    id v5 = [(CSDCallStateMonitor *)self callDurationLimitTimer];
    dispatch_source_cancel(v5);
  }
  notify_cancel(self->_requestCLTMThrottleUncapToken);
  notify_cancel(self->_lockStateNotificationToken);
  notify_cancel(self->_passcodeLockedOrBlockedNotificationToken);
  v6.receiver = self;
  v6.super_class = (Class)CSDCallStateMonitor;
  [(CSDCallStateMonitor *)&v6 dealloc];
}

- (void)handleCallHasStartedOutgoingChangedNotification:(id)a3
{
  id v4 = [a3 object];
  [(CSDCallStateMonitor *)self _handleCallHasStartedOutgoingChanged:v4];
}

- (void)handleCallStatusChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v4 object];
    [(CSDCallStateMonitor *)self _handleCallStatusChanged:v7];
  }
  else
  {
    v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v4 object];
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not handling call status changed notification for object that is not CSDCall: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)handleCallStartedConnectingNotification:(id)a3
{
  id v4 = [a3 object];
  [(CSDCallStateMonitor *)self _handleCallStartedConnecting:v4];
}

- (void)handleCallConnectedNotification:(id)a3
{
  id v4 = [a3 object];
  [(CSDCallStateMonitor *)self _handleCallConnected:v4];
}

- (void)handleCallMayRequireBreakBeforeMakeChangedNotification:(id)a3
{
  id v4 = [a3 object];
  [(CSDCallStateMonitor *)self _handleCallMayRequireBreakBeforeMakeChanged:v4];
}

- (void)handleCallWantsHoldMusicChangedNotification:(id)a3
{
  id v4 = [a3 object];
  [(CSDCallStateMonitor *)self _handleCallWantsHoldMusicChanged:v4];
}

- (void)_cleanCallMediaCache
{
  v2 = [(CSDCallStateMonitor *)self callContainer];
  v3 = [v2 _allCalls];

  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v10 callStatus] != 6)
        {
          id v11 = [v10 activeRemoteParticipant];
          v12 = [v11 imageURL];
          uint64_t v13 = [v12 lastPathComponent];

          if ([v13 length]) {
            [v4 addObject:v13];
          }
          v14 = [v10 imageURL];
          uint64_t v15 = [v14 lastPathComponent];

          if ([v15 length]) {
            [v4 addObject:v15];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }

  id v28 = 0;
  v16 = [[CSDSandboxExtensionDirectory alloc] initWithName:@"Images" error:&v28];
  id v17 = v28;
  id v27 = v17;
  unsigned __int8 v18 = [(CSDSandboxExtensionDirectory *)v16 removeLinksForFilenamesNotInArray:v4 error:&v27];
  id v19 = v27;

  if ((v18 & 1) == 0)
  {
    v20 = sub_100008DCC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1003A85C4((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
}

- (CSDRouteManager)routeManager
{
  return +[CSDRouteManager sharedInstance];
}

- (BOOL)wantsBreakBeforeMakeForCall:(id)a3
{
  id v3 = a3;
  id v4 = [v3 localSenderIdentityUUID];
  if (v4)
  {
    id v5 = +[TUCallCapabilities senderIdentityCapabilitiesWithUUID:v4];
    id v6 = v5;
    if (v5)
    {
      unsigned int v7 = [v5 supportsSimultaneousVoiceAndData];
      uint64_t v8 = +[FTDeviceSupport sharedInstance];
      unsigned int v9 = [v8 nonWifiFaceTimeAvailable];

      int v10 = +[FTNetworkSupport sharedInstance];
      unsigned int v11 = [v10 wiFiActiveAndReachable];

      if (v7) {
        int v12 = 0;
      }
      else {
        int v12 = v9 & (v11 ^ 1);
      }
      uint64_t v13 = sub_100008DCC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v14 = @"NO";
        if (v12) {
          CFStringRef v15 = @"YES";
        }
        else {
          CFStringRef v15 = @"NO";
        }
        int v31 = 138413314;
        CFStringRef v32 = v15;
        if (v7) {
          CFStringRef v16 = @"YES";
        }
        else {
          CFStringRef v16 = @"NO";
        }
        __int16 v33 = 2112;
        CFStringRef v34 = v16;
        if (v9) {
          CFStringRef v17 = @"YES";
        }
        else {
          CFStringRef v17 = @"NO";
        }
        __int16 v35 = 2112;
        CFStringRef v36 = v17;
        if (v11) {
          CFStringRef v14 = @"YES";
        }
        __int16 v37 = 2112;
        CFStringRef v38 = v14;
        __int16 v39 = 2112;
        id v40 = v3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Determined wants break before make is %@ (supportsSimultaneousVoiceAndData: %@, nonWifiFaceTimeAvailable: %@, wiFiActiveAndReachable: %@) for call %@", (uint8_t *)&v31, 0x34u);
      }
    }
    else
    {
      uint64_t v13 = sub_100008DCC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1003A869C((uint64_t)v3, v13, v24, v25, v26, v27, v28, v29);
      }
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    id v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1003A8630((uint64_t)v3, v6, v18, v19, v20, v21, v22, v23);
    }
    LOBYTE(v12) = 0;
  }

  return v12;
}

+ (double)breakBeforeMakeTimeout
{
  v2 = +[FTServerBag sharedInstance];
  id v3 = [v2 objectForKey:@"gk-invitation-break-before-make-timeout"];
  [v3 doubleValue];
  double v4 = 12.0;
  if (v5 > 12.0)
  {
    id v6 = +[FTServerBag sharedInstance];
    unsigned int v7 = [v6 objectForKey:@"gk-invitation-break-before-make-timeout"];
    [v7 doubleValue];
    double v4 = v8;
  }
  return v4;
}

- (void)_handleCallStatusChanged:(id)a3
{
  id v4 = a3;
  [(CSDCallStateMonitor *)self _setUpCallDurationLimitIfNecessary];
  [(CSDCallStateMonitor *)self _updateCallMutingForHoldMusic];
  switch([v4 status])
  {
    case 3u:
      double v5 = sub_100008DCC();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Call started outgoing: %@", buf, 0xCu);
      }

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v6 = [(CSDCallStateMonitor *)self callContainer];
      unsigned int v7 = [v6 currentAudioAndVideoCalls];

      id v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (!v8) {
        goto LABEL_22;
      }
      id v10 = v8;
      uint64_t v11 = *(void *)v31;
      *(void *)&long long v9 = 138412290;
      long long v29 = v9;
      break;
    case 4u:
      [(CSDCallStateMonitor *)self _notifyCLTMOfIncomingCall];
      [v4 unsuppressRingtoneIfNecessary];
      uint64_t v19 = [v4 timeoutTimer];
      if (v19)
      {
      }
      else
      {
        uint64_t v25 = [v4 provider];
        unsigned __int8 v26 = [v25 isSystemProvider];

        if ((v26 & 1) == 0)
        {
          uint64_t v27 = [v4 uniqueProxyIdentifier];
          uint64_t v28 = [(CSDCallStateMonitor *)self _ringingTimerForCallWithIdentifier:v27];
          [v4 setTimeoutTimer:v28];
        }
      }
      goto LABEL_31;
    case 5u:
      [v4 setTimeoutTimer:0];
      goto LABEL_31;
    case 6u:
      uint64_t v20 = [(CSDCallStateMonitor *)self callContainer];
      unsigned __int8 v21 = [v20 hasCurrentCalls];

      if ((v21 & 1) == 0)
      {
        uint64_t v22 = sub_100008DCC();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "All calls ended. Setting uplink and downlink muted to NO", buf, 2u);
        }

        [v4 unmuteAfterDisconnect];
        [(CSDCallStateMonitor *)self clearUplinkMutedCacheIfNecessary];
        uint64_t v23 = +[TUAudioSystemController sharedAudioSystemController];
        [v23 setUplinkMuted:0];

        uint64_t v24 = +[TUAudioSystemController sharedAudioSystemController];
        [v24 setDownlinkMuted:0];
      }
      [(CSDCallStateMonitor *)self _cleanCallMediaCache];
      goto LABEL_31;
    default:
LABEL_31:
      uint64_t v18 = 1;
      goto LABEL_32;
  }
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v31 != v11) {
        objc_enumerationMutation(v7);
      }
      id v13 = *(id *)(*((void *)&v30 + 1) + 8 * i);
      if (v13 != v4)
      {
        if ([*(id *)(*((void *)&v30 + 1) + 8 * i) isVideo])
        {
          CFStringRef v14 = sub_100008DCC();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v29;
            id v36 = v13;
            CFStringRef v15 = v14;
            CFStringRef v16 = "Disconnecting video call because another call started outgoing: %@";
            goto LABEL_13;
          }
          goto LABEL_14;
        }
        if ([v4 isVideo]
          && [v13 isUsingBaseband]
          && [(CSDCallStateMonitor *)self wantsBreakBeforeMakeForCall:v13])
        {
          CFStringRef v14 = sub_100008DCC();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v29;
            id v36 = v13;
            CFStringRef v15 = v14;
            CFStringRef v16 = "Disconnecting call using the baseband because a video call started outgoing and wantsBreakBeforeMake=YES: %@";
LABEL_13:
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
          }
LABEL_14:

          CFStringRef v17 = [(CSDCallStateMonitor *)self callCenter];
          [v17 disconnectCall:v13];

          continue;
        }
      }
    }
    id v10 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  }
  while (v10);
LABEL_22:

  [(CSDCallStateMonitor *)self _disconnectOrPullExistingCallsForCallIfNecessary:v4];
  [(CSDCallStateMonitor *)self _pushCallToAlternateDestinationIfNecessary:v4];
  uint64_t v18 = 0;
LABEL_32:
  -[CSDCallStateMonitor setHeySiriEnabled:](self, "setHeySiriEnabled:", v18, v29);
}

- (void)clearUplinkMutedCacheIfNecessary
{
  objc_initWeak(&location, self);
  id v3 = [(CSDCallStateMonitor *)self serverBag];
  dispatch_time_t v4 = dispatch_time(0, 1000000000 * (void)[v3 clearMuteCacheDelay]);
  double v5 = [(CSDCallStateMonitor *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100062348;
  v6[3] = &unk_100505698;
  objc_copyWeak(&v7, &location);
  dispatch_after(v4, v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_handleCallStartedConnecting:(id)a3
{
  id v4 = a3;
  double v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Call started connecting: %@", (uint8_t *)&v6, 0xCu);
  }

  [(CSDCallStateMonitor *)self _disconnectOrPullExistingCallsForCallIfNecessary:v4];
  if ([v4 isIncoming]) {
    [(CSDCallStateMonitor *)self _handleAudioReadyForCall:v4];
  }
}

- (void)leaveAVLessConversationsIfNecessaryForCall:(id)a3
{
  id v4 = a3;
  double v5 = [(CSDCallStateMonitor *)self callCenter];
  uint64_t v22 = v4;
  int v6 = [v5 activeConversationForCall:v4];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [(CSDCallStateMonitor *)self callCenter];
  id v8 = [v7 conversationManager];
  long long v9 = [v8 activeConversations];

  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        CFStringRef v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        CFStringRef v15 = [v6 UUID];
        CFStringRef v16 = [v14 UUID];
        unsigned __int8 v17 = [v15 isEqual:v16];

        if ((v17 & 1) == 0 && [v14 state] == (id)3 && !objc_msgSend(v14, "avMode"))
        {
          uint64_t v18 = sub_100008DCC();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v28 = v14;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Leaving converstion since we have call that is getting connected: %@", buf, 0xCu);
          }

          uint64_t v19 = [(CSDCallStateMonitor *)self callCenter];
          uint64_t v20 = [v19 conversationManager];
          unsigned __int8 v21 = [v14 UUID];
          [v20 leaveConversationWithUUID:v21];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v11);
  }
}

- (void)callIsOnHoldChangedNotification:(id)a3
{
  id v4 = a3;
  double v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v10, 0x16u);
  }
  long long v9 = [v4 object];
  [(CSDCallStateMonitor *)self disconnectActiveCallsBasedOnCallStatusForCall:v9];
}

- (void)handleCallOneToOneModeChangedNotification:(id)a3
{
  id v4 = a3;
  double v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    CFStringRef v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v12, 0x16u);
  }
  long long v9 = [v4 object];
  if ([v9 isConversation]
    && ([v9 isOneToOneModeEnabled] & 1) == 0
    && ([v9 isEndpointOnCurrentDevice] & 1) == 0
    && [v9 isHostedOnCurrentDevice])
  {
    int v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Pulling relaying calls from client since one to one mode changed for relaying calls if it requires GFT and device does not support GFT relay", (uint8_t *)&v12, 2u);
    }

    id v11 = [(CSDCallStateMonitor *)self callCenter];
    [v11 pullRelayingGFTCallsFromClientIfNecessary];

    [v9 setUplinkMuted:1];
    [v9 setIsSendingVideo:0];
  }
}

- (void)handleCallUpgradedToVideoNotification:(id)a3
{
  id v4 = a3;
  double v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    int v11 = 138412546;
    int v12 = v6;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v11, 0x16u);
  }
  long long v9 = [v4 object];
  if ([v9 isVideo])
  {
    int v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      int v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Call upgraded to video: %@", (uint8_t *)&v11, 0xCu);
    }

    [(CSDCallStateMonitor *)self disconnectAllCallsBesides:v9];
  }
}

- (void)_handleCallConnected:(id)a3
{
  id v4 = a3;
  [(CSDCallStateMonitor *)self enableEmergencyModeIfNecessaryForCall:v4];
  [(CSDCallStateMonitor *)self _updateCallMutingForHoldMusic];
  [(CSDCallStateMonitor *)self _handleAudioReadyForCall:v4];
  [(CSDCallStateMonitor *)self leaveAVLessConversationsIfNecessaryForCall:v4];
  [(CSDCallStateMonitor *)self disconnectActiveCallsBasedOnCallStatusForCall:v4];
  if ([v4 isVideo])
  {
    double v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Video call connected: %@", (uint8_t *)&v6, 0xCu);
    }

    [(CSDCallStateMonitor *)self disconnectAllCallsBesides:v4];
  }
}

- (void)disconnectAllCallsBesides:(id)a3
{
  id v4 = a3;
  double v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting to disconnect all calls besides: %@", buf, 0xCu);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v6 = [(CSDCallStateMonitor *)self callContainer];
  id v7 = [v6 currentAudioAndVideoCalls];

  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v21;
    *(void *)&long long v9 = 138412290;
    long long v19 = v9;
    do
    {
      int v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        __int16 v13 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v12);
        __int16 v14 = objc_msgSend(v4, "uniqueProxyIdentifier", v19);
        CFStringRef v15 = [v13 uniqueProxyIdentifier];
        unsigned __int8 v16 = [v14 isEqualToString:v15];

        if ((v16 & 1) == 0)
        {
          unsigned __int8 v17 = sub_100008DCC();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            id v26 = v13;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Disconnecting call because it is not compatible with call: %@", buf, 0xCu);
          }

          uint64_t v18 = [(CSDCallStateMonitor *)self callCenter];
          [v18 disconnectCall:v13];
        }
        int v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
}

- (void)disconnectActiveCallsBasedOnCallStatusForCall:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v5 = [(CSDCallStateMonitor *)self callContainer];
  int v6 = [v5 currentAudioAndVideoCalls];

  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v20;
    *(void *)&long long v8 = 138412546;
    long long v18 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqualToCall:", v4, v18) & 1) == 0
          && [v12 status] == 1
          && [v4 status] == 1
          && ([v12 isOnHold] & 1) == 0
          && ([v4 isOnHold] & 1) == 0)
        {
          __int16 v13 = [v12 callGroupUUID];
          __int16 v14 = [v4 callGroupUUID];
          unsigned __int8 v15 = [v13 isEqual:v14];

          if ((v15 & 1) == 0)
          {
            unsigned __int8 v16 = sub_100008DCC();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v18;
              long long v24 = v12;
              __int16 v25 = 2112;
              id v26 = v4;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Ending current active call %@ because call %@ is going to go active", buf, 0x16u);
            }

            unsigned __int8 v17 = [(CSDCallStateMonitor *)self callCenter];
            [v17 disconnectCall:v12];
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v9);
  }
}

- (void)_handleCallMayRequireBreakBeforeMakeChanged:(id)a3
{
}

- (void)enableEmergencyModeIfNecessaryForCall:(id)a3
{
  id v3 = a3;
  if (([v3 isEmergency] & 1) != 0 || objc_msgSend(v3, "isSOS"))
  {
    id v4 = sub_100008DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reporting emergency call to screen time", buf, 2u);
    }

    double v5 = +[DMFEmergencyModeMonitor sharedMonitor];
    id v9 = 0;
    unsigned int v6 = [v5 enableEmergencyModeWithError:&v9];
    id v7 = v9;

    if (!v6 || v7)
    {
      long long v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1003A8708(v6, (uint64_t)v7, v8);
      }
    }
  }
}

- (void)_handlePasscodeLockedOrBlocked
{
  if (MKBGetDeviceLockState() == 1 || MKBGetDeviceLockState() == 2)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = [(CSDCallStateMonitor *)self callContainer];
    id v4 = [v3 currentAudioAndVideoCalls];

    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v5)
    {
      id v7 = v5;
      uint64_t v8 = *(void *)v14;
      *(void *)&long long v6 = 138412290;
      long long v12 = v6;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v10, "isSharingScreen", v12))
          {
            uint64_t v11 = sub_100008DCC();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v12;
              long long v18 = v10;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Device is locked so stopping sharing screen for call %@", buf, 0xCu);
            }

            [v10 setSharingScreen:0];
          }
        }
        id v7 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v7);
    }
  }
}

- (void)_notifyCLTMOfIncomingCall
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412546;
    CFStringRef v5 = @"com.apple.request.hipuncap";
    __int16 v6 = 2048;
    uint64_t v7 = 2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Posting CLTM notification %@ and setting state to %llu", (uint8_t *)&v4, 0x16u);
  }

  notify_set_state([(CSDCallStateMonitor *)self requestCLTMThrottleUncapToken], 2uLL);
  notify_post((const char *)[@"com.apple.request.hipuncap" UTF8String]);
}

- (void)_disconnectOrPullExistingCallsForCallIfNecessary:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  CFStringRef v5 = [(CSDCallStateMonitor *)self callContainer];
  __int16 v6 = [v5 _allCalls];

  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (!v7) {
    goto LABEL_26;
  }
  id v8 = v7;
  char v19 = 0;
  uint64_t v9 = *(void *)v21;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(id *)(*((void *)&v20 + 1) + 8 * (void)v10);
      if (([v11 isPTT] & 1) == 0 && v11 != v4)
      {
        unsigned int v12 = [v4 isHostedOnCurrentDevice];
        if (v12 != [v11 isHostedOnCurrentDevice]
          || (unsigned int v13 = [v4 isEndpointOnCurrentDevice],
              v13 != [v11 isEndpointOnCurrentDevice]))
        {
          if ([v4 isEndpointOnCurrentDevice]
            && [v11 isHostedOnCurrentDevice]
            && ([v11 isEndpointOnCurrentDevice] & 1) == 0
            && ([v11 provider],
                long long v14 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v15 = [v14 isTinCanProvider],
                v14,
                (v15 & 1) == 0))
          {
            unsigned __int8 v17 = sub_100008DCC();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v25 = v11;
              __int16 v26 = 2112;
              id v27 = v4;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Requesting to pull call %@ because its continuity state is different from call %@", buf, 0x16u);
            }
            char v19 = 1;
          }
          else
          {
            long long v16 = sub_100008DCC();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v25 = v11;
              __int16 v26 = 2112;
              id v27 = v4;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Disconnecting call %@ because its continuity state is different from call %@", buf, 0x16u);
            }

            unsigned __int8 v17 = [(CSDCallStateMonitor *)self callCenter];
            [v17 disconnectCall:v11];
          }
        }
      }
      uint64_t v10 = (char *)v10 + 1;
    }
    while (v8 != v10);
    id v18 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    id v8 = v18;
  }
  while (v18);

  if (v19)
  {
    __int16 v6 = [(CSDCallStateMonitor *)self callCenter];
    [v6 pullRelayingCallsFromClient];
LABEL_26:
  }
}

- (void)_pushCallToAlternateDestinationIfNecessary:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 dialRequest];
  __int16 v6 = [v5 endpointIDSDestination];

  if (v6)
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 dialRequest];
      uint64_t v9 = [v8 endpointIDSDestination];
      int v25 = 138412546;
      __int16 v26 = v9;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "An endpointIDSDestination %@ is present for call %@ so pushing all hosted calls to that destination", (uint8_t *)&v25, 0x16u);
    }
    uint64_t v10 = [(CSDCallStateMonitor *)self callCenter];
    id v11 = [v4 dialRequest];
    unsigned int v12 = [v11 endpointIDSDestination];
    [v10 pushHostedCallsToDestination:v12];
LABEL_11:

    goto LABEL_12;
  }
  unsigned int v13 = [v4 dialRequest];
  long long v14 = [v13 endpointRapportMediaSystemIdentifier];
  if ([v14 length])
  {

LABEL_8:
    id v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      char v19 = [v4 dialRequest];
      long long v20 = [v19 endpointRapportMediaSystemIdentifier];
      long long v21 = [v4 dialRequest];
      long long v22 = [v21 endpointRapportEffectiveIdentifier];
      int v25 = 138412802;
      __int16 v26 = v20;
      __int16 v27 = 2112;
      id v28 = v22;
      __int16 v29 = 2112;
      id v30 = v4;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "An endpointRapportMediaSystemIdentifier=\"%@\" or endpointRapportEffectiveIdentifier=\"%@\" is present on dial request for call %@ so attempting to pick matching route", (uint8_t *)&v25, 0x20u);
    }
    uint64_t v10 = [(CSDCallStateMonitor *)self callCenter];
    id v11 = [v4 dialRequest];
    unsigned int v12 = [v11 endpointRapportMediaSystemIdentifier];
    long long v23 = [v4 dialRequest];
    long long v24 = [v23 endpointRapportEffectiveIdentifier];
    [v10 pickRouteForRapportDeviceWithMediaSystemIdentifier:v12 effectiveIdentifier:v24];

    goto LABEL_11;
  }
  unsigned __int8 v15 = [v4 dialRequest];
  long long v16 = [v15 endpointRapportEffectiveIdentifier];
  id v17 = [v16 length];

  if (v17) {
    goto LABEL_8;
  }
LABEL_12:
}

- (void)_setUpBreakBeforeMakeTimeoutIfNecessaryForCall:(id)a3
{
  id v4 = a3;
  if ([v4 status] == 3
    && [v4 isVideo]
    && [v4 mayRequireBreakBeforeMake])
  {
    CFStringRef v5 = [v4 uniqueProxyIdentifier];
    __int16 v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting up break before make timeout for call: %@", buf, 0xCu);
    }

    id v7 = [(CSDCallStateMonitor *)self setUpBreakBeforeMakeTimeout];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100063B88;
    v10[3] = &unk_100504F10;
    v10[4] = self;
    id v11 = v5;
    id v8 = (void (*)(void *, void *))v7[2];
    id v9 = v5;
    v8(v7, v10);
  }
}

- (void)_handleAudioReadyForCall:(id)a3
{
  id v4 = a3;
  if ([v4 isRTT])
  {
    CFStringRef v5 = [(CSDCallStateMonitor *)self routeManager];
    unsigned int v6 = [v5 isCarPlayRouteAvailable];

    unsigned int v7 = v6 | [v4 isEmergency];
    id v8 = sub_100008DCC();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        int v18 = 138412290;
        id v19 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CarPlay is connected; unmuting uplink for RTT call %@",
          (uint8_t *)&v18,
          0xCu);
      }

LABEL_13:
      uint64_t v14 = v7 ^ 1;
      id v13 = v4;
LABEL_16:
      [v13 setUplinkMuted:v14];
      goto LABEL_17;
    }
    if (v9)
    {
      int v18 = 138412290;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CarPlay is not connected; muting uplink for RTT call %@",
        (uint8_t *)&v18,
        0xCu);
    }

    unsigned __int8 v15 = [(CSDCallStateMonitor *)self rttSettings];
    unsigned int v16 = [v15 answerRTTCallsAsMuted];

    if (v16) {
      goto LABEL_13;
    }
    id v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not muting uplink because RTTSettings says not to mute the uplink for RTT calls %@", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = [v4 provider];
    unsigned int v11 = [v10 isTinCanProvider];

    if (v11)
    {
      unsigned int v12 = sub_100008DCC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        id v19 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting uplink muted for TinCan call %@", (uint8_t *)&v18, 0xCu);
      }

      id v13 = v4;
      uint64_t v14 = 1;
      goto LABEL_16;
    }
    if (([v4 uplinkWasExplicitlyMuted] & 1) == 0)
    {
      id v13 = v4;
      uint64_t v14 = 0;
      goto LABEL_16;
    }
  }
LABEL_17:
}

- (id)_ringingTimerForCallWithIdentifier:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting ringing timer for call with identifier %@", buf, 0xCu);
  }

  unsigned int v6 = [(CSDCallStateMonitor *)self queue];
  unsigned int v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);

  dispatch_time_t v8 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100064150;
  v11[3] = &unk_100505558;
  objc_copyWeak(&v13, (id *)buf);
  id v12 = v4;
  id v9 = v4;
  dispatch_source_set_event_handler(v7, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

  return v7;
}

- (void)_setUpCallDurationLimitIfNecessary
{
  if (TUIsStoreDemoModeEnabled())
  {
    id v3 = [(CSDCallStateMonitor *)self callContainer];
    unsigned int v4 = [v3 anyCallPassesTest:&stru_100505B38];

    CFStringRef v5 = [(CSDCallStateMonitor *)self callDurationLimitTimer];

    if (v5 || !v4)
    {
      uint64_t v10 = [(CSDCallStateMonitor *)self callDurationLimitTimer];
      if (!v10) {
        LOBYTE(v4) = 1;
      }

      if ((v4 & 1) == 0)
      {
        unsigned int v11 = sub_100008DCC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Stopping call duration limit timer", (uint8_t *)buf, 2u);
        }

        id v12 = [(CSDCallStateMonitor *)self callDurationLimitTimer];
        dispatch_source_cancel(v12);

        [(CSDCallStateMonitor *)self setCallDurationLimitTimer:0];
      }
    }
    else
    {
      unsigned int v6 = sub_100008DCC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting call duration limit timer as we are in a retail environment", (uint8_t *)buf, 2u);
      }

      unsigned int v7 = [(CSDCallStateMonitor *)self queue];
      dispatch_time_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v7);

      dispatch_time_t v9 = dispatch_time(0, 300000000000);
      dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
      objc_initWeak(buf, self);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000645C8;
      handler[3] = &unk_100505698;
      objc_copyWeak(&v14, buf);
      dispatch_source_set_event_handler(v8, handler);
      [(CSDCallStateMonitor *)self setCallDurationLimitTimer:v8];
      dispatch_activate(v8);
      objc_destroyWeak(&v14);
      objc_destroyWeak(buf);
    }
  }
}

- (void)_handleCallDurationTimerFired
{
  id v3 = [(CSDCallStateMonitor *)self callContainer];
  unsigned int v4 = [v3 callsPassingTest:&stru_100505B58];

  if ([v4 count])
  {
    CFStringRef v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v27 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Disconnecting restricted calls because the limited call duration timer fired: %@", buf, 0xCu);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v10);
          id v12 = [(CSDCallStateMonitor *)self callCenter];
          [v12 disconnectCall:v11];

          uint64_t v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }

    id v13 = TUBundle();
    id v14 = [v13 localizedStringForKey:@"CALL_ENDED" value:&stru_100517F40 table:@"TelephonyUtilities"];
    id v15 = TUBundle();
    unsigned int v16 = [v15 localizedStringForKey:@"CALL_ENDED_DEMO_EXPLANATION" value:&stru_100517F40 table:@"TelephonyUtilities"];
    id v17 = TUBundle();
    int v18 = [v17 localizedStringForKey:@"OK" value:&stru_100517F40 table:@"TelephonyUtilities"];
    id v19 = +[IMUserNotification userNotificationWithIdentifier:@"RetailDemoNotification" title:v14 message:v16 defaultButton:v18 alternateButton:0 otherButton:0];

    [v19 setUsesNotificationCenter:0];
    [v19 setRepresentedApplicationBundle:TUBundleIdentifierTelephonyUtilitiesFramework];
    long long v20 = +[IMUserNotificationCenter sharedInstance];
    [v20 addUserNotification:v19 listener:0 completionHandler:0];
  }
}

- (void)_updateCallMutingForHoldMusic
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = [(CSDCallStateMonitor *)self callCenter];
  unsigned int v4 = [v3 currentAudioAndVideoCalls];

  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (!v5)
  {

    id v7 = 0;
    goto LABEL_21;
  }
  id v6 = v5;
  id v7 = 0;
  id v8 = 0;
  uint64_t v9 = *(void *)v20;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v4);
      }
      uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      if (![v11 wantsHoldMusic])
      {
        id v12 = v7;
        id v7 = v11;
        id v13 = v8;
LABEL_10:
        id v14 = v11;

        id v8 = v13;
        continue;
      }
      id v12 = v8;
      id v13 = v11;
      if ([v11 status] == 1) {
        goto LABEL_10;
      }
    }
    id v6 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  }
  while (v6);

  if (v8)
  {
    id v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found active call needing hold music: %@", buf, 0xCu);
    }

    if (![(CSDCallStateMonitor *)self isAudioMutedForHoldMusic])
    {
      unsigned int v16 = sub_100008DCC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Hold music enabled - call is active so muting uplink and downlink", buf, 2u);
      }

      uint64_t v17 = 1;
      [v8 setUplinkMuted:1];
      [v8 setDownlinkMuted:1];
      goto LABEL_25;
    }
    goto LABEL_27;
  }
LABEL_21:
  if ([(CSDCallStateMonitor *)self isAudioMutedForHoldMusic])
  {
    int v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Hold music disabled - unmuting uplink and downlink", buf, 2u);
    }

    [v7 setUplinkMuted:0];
    [v7 setDownlinkMuted:0];
    uint64_t v17 = 0;
    id v8 = 0;
LABEL_25:
    [(CSDCallStateMonitor *)self setAudioMutedForHoldMusic:v17];
  }
  else
  {
    id v8 = 0;
  }
LABEL_27:
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v5 = a4;
  if ([v5 state] == (id)3 && !objc_msgSend(v5, "avMode"))
  {
    id v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Disconnecting all calls since we have an AVLess conversation that is Joined: %@", (uint8_t *)&v13, 0xCu);
    }

    id v7 = [(CSDCallStateMonitor *)self callCenter];
    id v8 = [v5 groupUUID];
    uint64_t v9 = [v7 callForConversationWithGroupUUID:v8];

    uint64_t v10 = [v5 presentationContext];
    if ([v10 mode] == (id)2 && v9)
    {
      unsigned int v11 = [v9 status];

      if (v11 != 4)
      {
LABEL_10:
        id v12 = [(CSDCallStateMonitor *)self callCenter];
        [v12 disconnectAllCalls];

        goto LABEL_11;
      }
      uint64_t v10 = [(CSDCallStateMonitor *)self callCenter];
      [v10 disconnectCall:v9 withReason:1];
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_source)callDurationLimitTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCallDurationLimitTimer:(id)a3
{
}

- (BOOL)isAudioMutedForHoldMusic
{
  return self->_audioMutedForHoldMusic;
}

- (void)setAudioMutedForHoldMusic:(BOOL)a3
{
  self->_audioMutedForHoldMusic = a3;
}

- (int)requestCLTMThrottleUncapToken
{
  return self->_requestCLTMThrottleUncapToken;
}

- (void)setRequestCLTMThrottleUncapToken:(int)a3
{
  self->_requestCLTMThrottleUncapToken = a3;
}

- (int)lockStateNotificationToken
{
  return self->_lockStateNotificationToken;
}

- (void)setLockStateNotificationToken:(int)a3
{
  self->_lockStateNotificationToken = a3;
}

- (int)passcodeLockedOrBlockedNotificationToken
{
  return self->_passcodeLockedOrBlockedNotificationToken;
}

- (void)setPasscodeLockedOrBlockedNotificationToken:(int)a3
{
  self->_passcodeLockedOrBlockedNotificationToken = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (CSDRTTSettings)rttSettings
{
  return self->_rttSettings;
}

- (void)setRttSettings:(id)a3
{
}

- (id)setUpBreakBeforeMakeTimeout
{
  return self->_setUpBreakBeforeMakeTimeout;
}

- (void)setSetUpBreakBeforeMakeTimeout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setUpBreakBeforeMakeTimeout, 0);
  objc_storeStrong((id *)&self->_rttSettings, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_callDurationLimitTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_callCenter, 0);
}

@end