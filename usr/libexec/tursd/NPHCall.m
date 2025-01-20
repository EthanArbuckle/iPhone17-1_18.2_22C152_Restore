@interface NPHCall
+ (id)_errorAlertMessageForDisconnectedReason:(int)a3;
+ (id)callsFromTUCalls:(id)a3;
+ (id)currentCallFromCalls:(id)a3;
+ (id)descriptionForCallService:(int)a3;
+ (id)descriptionForCallStatus:(int)a3;
+ (id)descriptionForCallSupport:(int)a3;
+ (int)callSupportForProvider:(id)a3 isVideo:(BOOL)a4;
- (BOOL)hasFailed;
- (BOOL)hasRelaySupport;
- (BOOL)isConferenced;
- (BOOL)isConnected;
- (BOOL)isEmergencyCall;
- (BOOL)isEmergencySOSCall;
- (BOOL)isEndpointOnCurrentDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFaceTimeVideoCall;
- (BOOL)isHostedOnCurrentDevice;
- (BOOL)isKappaOriginatedCall;
- (BOOL)isNewtonOriginatedCall;
- (BOOL)isSOSFlowCall;
- (BOOL)isSupported;
- (BOOL)isTinCanCall;
- (BOOL)wantsHoldMusic;
- (BOOL)wasDeclined;
- (NPHCall)init;
- (NPHCall)initWithTUCall:(id)a3;
- (NPHCall)initWithTUCalls:(id)a3;
- (NSArray)TUCalls;
- (NSString)callDurationString;
- (NSString)displayName;
- (NSString)localizedProviderName;
- (NSString)statusString;
- (TUCall)onlyTUCall;
- (TUConversation)conversation;
- (TUDialRequest)redialPrompt;
- (TUJoinConversationRequest)rejoinPrompt;
- (id)_firstTUCall;
- (id)_outgoingStatusStringWithLabel:(id)a3;
- (id)description;
- (int)disconnectedReason;
- (int)service;
- (int)status;
- (void)disconnectWithReason:(int)a3 fromSource:(id)a4;
- (void)logWithReason:(id)a3 indented:(BOOL)a4;
- (void)resumeCallFromSource:(id)a3;
- (void)setTUCalls:(id)a3;
@end

@implementation NPHCall

- (NPHCall)init
{
  return 0;
}

- (NPHCall)initWithTUCall:(id)a3
{
  id v8 = a3;
  id v4 = a3;
  v5 = +[NSArray arrayWithObjects:&v8 count:1];

  v6 = -[NPHCall initWithTUCalls:](self, "initWithTUCalls:", v5, v8);
  return v6;
}

- (NPHCall)initWithTUCalls:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPHCall;
  v5 = [(NPHCall *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 sortedArrayUsingComparator:&stru_1000104E8];
    TUCalls = v5->_TUCalls;
    v5->_TUCalls = (NSArray *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(NPHCall *)self TUCalls];
  uint64_t v6 = [v4 TUCalls];

  LOBYTE(v4) = [v5 isEqualToArray:v6];
  return (char)v4;
}

+ (id)callsFromTUCalls:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectsPassingTest:&stru_100010528];
  if ([v4 count]) {
    v5 = [[NPHCall alloc] initWithTUCalls:v4];
  }
  else {
    v5 = 0;
  }
  uint64_t v6 = [v3 objectsPassingTest:&stru_100010548];
  v7 = [v6 nph_map:&stru_100010588];
  id v8 = v7;
  if (v5)
  {
    id v9 = [v7 arrayByAddingObject:v5];
  }
  else
  {
    id v9 = v7;
  }
  v10 = v9;

  return v10;
}

+ (id)currentCallFromCalls:(id)a3
{
  return [a3 max:&stru_1000105C8];
}

- (TUCall)onlyTUCall
{
  if (NPHDeviceOSIsInternalInstall()
    && ([(NPHCall *)self TUCalls],
        id v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 count],
        v3,
        v4 != (id)1))
  {
    uint64_t v6 = sub_100001854();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100008440(v6);
    }

    v5 = 0;
  }
  else
  {
    v5 = [(NPHCall *)self _firstTUCall];
  }

  return (TUCall *)v5;
}

- (BOOL)isConnected
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NPHCall *)self TUCalls];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    unsigned __int8 v6 = 1;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (v6) {
          unsigned __int8 v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) isConnected];
        }
        else {
          unsigned __int8 v6 = 0;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (BOOL)isHostedOnCurrentDevice
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NPHCall *)self TUCalls];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    unsigned __int8 v6 = 1;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (v6) {
          unsigned __int8 v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) isHostedOnCurrentDevice];
        }
        else {
          unsigned __int8 v6 = 0;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (BOOL)isEmergencyCall
{
  char v3 = NPHDeviceOSIsInternalInstall();
  id v4 = +[NSUserDefaults standardUserDefaults];
  uint64_t v5 = [v4 stringForKey:@"CSLEmergencyPhoneNumber"];

  unsigned __int8 v6 = [(NPHCall *)self TUCalls];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000024E8;
  v9[3] = &unk_1000105F0;
  char v10 = v3;
  v9[4] = v5;
  unsigned __int8 v7 = [v6 hasObjectPassingTest:v9];

  return v7;
}

- (BOOL)isEmergencySOSCall
{
  char v3 = NPHDeviceOSIsInternalInstall();
  id v4 = +[NSUserDefaults standardUserDefaults];
  uint64_t v5 = [v4 stringForKey:@"CSLEmergencyPhoneNumber"];

  unsigned __int8 v6 = [(NPHCall *)self TUCalls];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002650;
  v9[3] = &unk_1000105F0;
  char v10 = v3;
  v9[4] = v5;
  unsigned __int8 v7 = [v6 hasObjectPassingTest:v9];

  return v7;
}

- (BOOL)isTinCanCall
{
  v2 = [(NPHCall *)self TUCalls];
  unsigned __int8 v3 = [v2 hasObjectPassingTest:&stru_100010610];

  return v3;
}

- (BOOL)isNewtonOriginatedCall
{
  v2 = [(NPHCall *)self TUCalls];
  unsigned __int8 v3 = [v2 hasObjectPassingTest:&stru_100010630];

  return v3;
}

- (BOOL)isKappaOriginatedCall
{
  v2 = [(NPHCall *)self TUCalls];
  unsigned __int8 v3 = [v2 hasObjectPassingTest:&stru_100010650];

  return v3;
}

- (BOOL)isSOSFlowCall
{
  if ([(NPHCall *)self isEmergencySOSCall]
    || [(NPHCall *)self isNewtonOriginatedCall])
  {
    return 1;
  }

  return [(NPHCall *)self isKappaOriginatedCall];
}

- (BOOL)isFaceTimeVideoCall
{
  v2 = [(NPHCall *)self onlyTUCall];
  BOOL v3 = [v2 service] == 3;

  return v3;
}

- (BOOL)isConferenced
{
  v2 = [(NPHCall *)self TUCalls];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (BOOL)hasRelaySupport
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NPHCall *)self TUCalls];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v7 + 1) + 8 * i) hasRelaySupport:2])
        {
          LOBYTE(v3) = 0;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
    LOBYTE(v3) = 1;
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)isSupported
{
  v2 = [(NPHCall *)self TUCalls];
  char v3 = [v2 hasObjectPassingTest:&stru_100010670] ^ 1;

  return v3;
}

- (NSString)displayName
{
  if ([(NPHCall *)self isConferenced])
  {
    char v3 = +[NSBundle bundleForClass:objc_opt_class()];
    [v3 localizedStringForKey:@"CONFERENCE_CALL" value:&stru_100010A90 table:0];
  }
  else
  {
    char v3 = [(NPHCall *)self onlyTUCall];
    [v3 nph_displayName];
  uint64_t v4 = };

  return (NSString *)v4;
}

- (TUConversation)conversation
{
  v2 = [(NPHCall *)self onlyTUCall];
  char v3 = [v2 nph_conversation];

  return (TUConversation *)v3;
}

- (NSString)callDurationString
{
  if ([(NPHCall *)self isConnected])
  {
    char v3 = [(NPHCall *)self TUCalls];
    uint64_t v4 = [v3 max:&stru_1000106B0];

    uint64_t v5 = [v4 callDurationString];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (int)status
{
  v2 = [(NPHCall *)self _firstTUCall];
  int v3 = [v2 status];

  return v3;
}

- (int)disconnectedReason
{
  v2 = [(NPHCall *)self _firstTUCall];
  int v3 = [v2 disconnectedReason];

  return v3;
}

- (BOOL)isEndpointOnCurrentDevice
{
  v2 = [(NPHCall *)self _firstTUCall];
  unsigned __int8 v3 = [v2 isEndpointOnCurrentDevice];

  return v3;
}

- (int)service
{
  v2 = [(NPHCall *)self _firstTUCall];
  int v3 = [v2 service];

  return v3;
}

- (NSString)statusString
{
  int v3 = [(NPHCall *)self TUCalls];
  if ([v3 count] == (id)1)
  {
    uint64_t v4 = [(NPHCall *)self _firstTUCall];
    uint64_t v5 = [v4 localizedLabel];
  }
  else
  {
    uint64_t v5 = 0;
  }

  switch([(NPHCall *)self status])
  {
    case 0:
      unsigned __int8 v6 = +[NSBundle bundleForClass:objc_opt_class()];
      long long v7 = v6;
      CFStringRef v8 = @"CALL_STATUS_IDLE";
      goto LABEL_19;
    case 1:
      long long v9 = [(NPHCall *)self callDurationString];
      long long v7 = v9;
      if (v9)
      {
        id v10 = v9;
LABEL_20:
        v14 = v10;
      }
      else
      {
        v15 = [(NPHCall *)self _firstTUCall];
        if ([v15 isOutgoing])
        {
          v14 = [(NPHCall *)self _outgoingStatusStringWithLabel:v5];
        }
        else
        {
          v17 = +[NSBundle bundleForClass:objc_opt_class()];
          v14 = [v17 localizedStringForKey:@"CALL_CONNECTING" value:&stru_100010A90 table:0];
        }
      }

LABEL_26:
      return (NSString *)v14;
    case 2:
      unsigned __int8 v6 = +[NSBundle bundleForClass:objc_opt_class()];
      long long v7 = v6;
      CFStringRef v8 = @"CALL_STATUS_HELD";
      goto LABEL_19;
    case 3:
      id v11 = [(NPHCall *)self _outgoingStatusStringWithLabel:v5];
      goto LABEL_25;
    case 5:
      unsigned __int8 v12 = [(NPHCall *)self wasDeclined];
      long long v7 = +[NSBundle bundleForClass:objc_opt_class()];
      if (v12) {
        goto LABEL_16;
      }
      CFStringRef v8 = @"CALL_STATUS_CALL_ENDING";
      goto LABEL_18;
    case 6:
      unsigned __int8 v13 = [(NPHCall *)self wasDeclined];
      long long v7 = +[NSBundle bundleForClass:objc_opt_class()];
      if (v13) {
LABEL_16:
      }
        CFStringRef v8 = @"CALL_DECLINED";
      else {
        CFStringRef v8 = @"CALL_STATUS_CALL_ENDED";
      }
LABEL_18:
      unsigned __int8 v6 = v7;
LABEL_19:
      id v10 = [v6 localizedStringForKey:v8 value:&stru_100010A90 table:0];
      goto LABEL_20;
    default:
      if (v5)
      {
        id v11 = v5;
      }
      else
      {
        id v11 = [(NPHCall *)self localizedProviderName];
      }
LABEL_25:
      v14 = v11;
      goto LABEL_26;
  }
}

- (BOOL)wantsHoldMusic
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NPHCall *)self TUCalls];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    unsigned __int8 v6 = 1;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (v6) {
          unsigned __int8 v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) wantsHoldMusic];
        }
        else {
          unsigned __int8 v6 = 0;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (TUDialRequest)redialPrompt
{
  id v3 = [(NPHCall *)self TUCalls];
  id v4 = [v3 count];

  if (v4 == (id)1)
  {
    uint64_t v5 = [(NPHCall *)self onlyTUCall];
    unsigned __int8 v6 = [v5 dialRequestForRedial];
    long long v7 = +[NPHCall _errorAlertMessageForDisconnectedReason:](NPHCall, "_errorAlertMessageForDisconnectedReason:", [v5 disconnectedReason]);
    [v6 setNph_errorAlertMessage:v7];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return (TUDialRequest *)v6;
}

- (TUJoinConversationRequest)rejoinPrompt
{
  id v3 = [(NPHCall *)self TUCalls];
  id v4 = [v3 count];

  if (v4 == (id)1
    && (([(NPHCall *)self conversation], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0)
     || ([(NPHCall *)self onlyTUCall],
         unsigned __int8 v6 = objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v6, "nph_lastAssociatedConversation"),
         uint64_t v5 = objc_claimAutoreleasedReturnValue(),
         v6,
         v5)))
  {
    id v7 = [objc_alloc((Class)TUJoinConversationRequest) initWithConversation:v5];
  }
  else
  {
    id v7 = 0;
  }

  return (TUJoinConversationRequest *)v7;
}

- (BOOL)wasDeclined
{
  v2 = [(NPHCall *)self _firstTUCall];
  if ([v2 status] == 5 && objc_msgSend(v2, "isIncoming")) {
    unsigned int v3 = [v2 isConnecting] ^ 1;
  }
  else {
    LOBYTE(v3) = [v2 wasDeclined];
  }

  return v3;
}

- (BOOL)hasFailed
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NPHCall *)self TUCalls];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    unsigned __int8 v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        if (v5) {
          unsigned __int8 v5 = 1;
        }
        else {
          unsigned __int8 v5 = [*(id *)(*((void *)&v9 + 1) + 8 * i) nph_hasFailed];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)resumeCallFromSource:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned __int8 v5 = [(NPHCall *)self TUCalls];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
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
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = sub_100001854();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v18 = v4;
          __int16 v19 = 2112;
          uint64_t v20 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: [TUCallCenter.sharedInstance unholdCall:] to %@", buf, 0x16u);
        }

        long long v12 = +[TUCallCenter sharedInstance];
        [v12 unholdCall:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v7);
  }
}

- (void)disconnectWithReason:(int)a3 fromSource:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [(NPHCall *)self TUCalls];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v13 = sub_100001854();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v20 = v6;
          __int16 v21 = 2112;
          uint64_t v22 = v12;
          __int16 v23 = 1024;
          int v24 = v4;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: [call callCenter] disconnectCall: %@ withReason: %d", buf, 0x1Cu);
        }

        long long v14 = +[TUCallCenter sharedInstance];
        [v14 disconnectCall:v12 withReason:v4];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v9);
  }
}

+ (int)callSupportForProvider:(id)a3 isVideo:(BOOL)a4
{
  id v4 = a3;
  if ([v4 isTelephonyProvider])
  {
    unsigned int v5 = +[TUCallCapabilities telephonyCallSupport];
LABEL_5:
    int v6 = v5;
    goto LABEL_9;
  }
  if ([v4 isFaceTimeProvider])
  {
    unsigned int v5 = +[TUCallCapabilities faceTimeAudioCallSupport];
    goto LABEL_5;
  }
  if ([v4 isSystemProvider]) {
    int v6 = 0;
  }
  else {
    int v6 = 3;
  }
LABEL_9:

  return v6;
}

- (NSString)localizedProviderName
{
  v2 = [(NPHCall *)self _firstTUCall];
  id v3 = [v2 provider];
  if ([v3 isTelephonyProvider])
  {
    id v4 = 0;
  }
  else if ([v3 isFaceTimeProvider])
  {
    unsigned int v5 = [v2 isVideo];
    int v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = v6;
    if (v5) {
      CFStringRef v8 = @"CALL_SERVICE_FACETIME_SHORT";
    }
    else {
      CFStringRef v8 = @"CALL_SERVICE_FACETIME_AUDIO";
    }
    id v4 = [v6 localizedStringForKey:v8 value:&stru_100010A90 table:0];
  }
  else
  {
    id v4 = [v3 localizedName];
  }

  return (NSString *)v4;
}

+ (id)descriptionForCallService:(int)a3
{
  switch(a3)
  {
    case 0:
      id v4 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v5 = v4;
      CFStringRef v6 = @"CALL_SERVICE_UNKNOWN";
      goto LABEL_6;
    case 1:
      id v4 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v5 = v4;
      CFStringRef v6 = @"CALL_SERVICE_TELEPHONY";
      goto LABEL_6;
    case 2:
      id v4 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v5 = v4;
      CFStringRef v6 = @"CALL_SERVICE_FACETIME_AUDIO";
      goto LABEL_6;
    case 3:
      id v4 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v5 = v4;
      CFStringRef v6 = @"CALL_SERVICE_FACETIME_VIDEO";
LABEL_6:
      id v3 = [v4 localizedStringForKey:v6 value:&stru_100010A90 table:0];

      break;
    default:
      break;
  }

  return v3;
}

+ (id)descriptionForCallStatus:(int)a3
{
  if (a3 > 6) {
    return @"TUCallStatusSending";
  }
  else {
    return *(&off_1000106D0 + a3);
  }
}

+ (id)descriptionForCallSupport:(int)a3
{
  if ((a3 - 1) > 2) {
    return @"TUCallSupportNone";
  }
  else {
    return *(&off_100010708 + a3 - 1);
  }
}

- (void)logWithReason:(id)a3 indented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = &stru_100010A90;
  if (v4) {
    id v7 = @"\t";
  }
  CFStringRef v8 = v7;
  uint64_t v9 = [objc_opt_class() descriptionForCallStatus:-[NPHCall status](self, "status")];
  uint64_t v10 = sub_100001854();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v27 = v8;
    __int16 v28 = 2112;
    id v29 = v6;
    __int16 v30 = 2048;
    v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@%@ NPHCall %p status: %@", buf, 0x2Au);
  }
  __int16 v19 = (void *)v9;
  id v20 = v6;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v11 = [(NPHCall *)self TUCalls];
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = sub_100001854();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          long long v18 = [v16 nph_description:v19, v20];
          *(_DWORD *)buf = 138412546;
          v27 = v8;
          __int16 v28 = 2112;
          id v29 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@\t%@", buf, 0x16u);
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }
}

- (id)description
{
  id v3 = [[objc_opt_class() descriptionForCallStatus:-[NPHCall status](self, "status")];
  BOOL v4 = +[NSMutableString stringWithFormat:@"NPHCall %p: status: %@\n", self, v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unsigned int v5 = [(NPHCall *)self TUCalls];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) nph_description];
        [v4 appendFormat:@"\t%@\n", v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_outgoingStatusStringWithLabel:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(NPHCall *)self service];
  if (v5 < 2)
  {
    if (!v4)
    {
      id v6 = +[NSBundle bundleForClass:objc_opt_class()];
      self = [v6 localizedStringForKey:@"CALL_STATUS_CALLING" value:&stru_100010A90 table:0];
      goto LABEL_9;
    }
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"CALL_STATUS_CALLING_WITH_LABEL" value:&stru_100010A90 table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v4);
    self = (NPHCall *)objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_9:
    goto LABEL_10;
  }
  if (v5 - 2 <= 1)
  {
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"CALL_STATUS_NONTELEPHONY_CALLING" value:&stru_100010A90 table:0];
    uint64_t v8 = [(NPHCall *)self localizedProviderName];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);
    self = (NPHCall *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
LABEL_10:

  return self;
}

- (id)_firstTUCall
{
  v2 = [(NPHCall *)self TUCalls];
  id v3 = [v2 firstObject];

  return v3;
}

+ (id)_errorAlertMessageForDisconnectedReason:(int)a3
{
  if (a3 == 16)
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = [v3 localizedStringForKey:@"CALL_FAILED_CLIENT_DEVICE_BUSY" value:&stru_100010A90 table:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSArray)TUCalls
{
  return self->_TUCalls;
}

- (void)setTUCalls:(id)a3
{
}

- (void).cxx_destruct
{
}

@end