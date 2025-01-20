@interface NPHCallConfiguration
+ (id)callConfigurationWithIncomingCallOverrideName:(id)a3 incomingCallStatus:(int)a4 activeCallOverrideName:(id)a5 activeCallStatus:(int)a6 activeCallDisconnectedReason:(int)a7 heldCallOverrideName:(id)a8 heldCallStatus:(int)a9 outgoingCallOverrideName:(id)a10 outgoingCallStatus:(int)a11 isSOS:(BOOL)a12 audioMessageType:(unint64_t)a13 isAnsweringOnPhone:(BOOL)a14 source:(id)a15;
+ (void)log:(id)a3 withReason:(id)a4;
- (BOOL)hasDisconnectedEmergencySOSCall;
- (BOOL)hasEmergencyCall;
- (BOOL)hasEmergencySOSCall;
- (BOOL)hasHostedCall;
- (BOOL)showEmergencyFallback;
- (NPHCall)activeCall;
- (NPHCall)blockedCall;
- (NPHCall)blockedCallEndedPrompt;
- (NPHCall)callEnded;
- (NPHCall)callHandingOff;
- (NPHCall)callHandingOffToWatch;
- (NPHCall)callToAnswerOnPhone;
- (NPHCall)currentCall;
- (NPHCall)incomingCall;
- (NPHCall)remoteCall;
- (NPHCall)sendingCall;
- (NPHCallConfiguration)init;
- (NPHCallConfiguration)initWithCalls:(id)a3 andCallsOnDefaultPairedDevice:(id)a4 source:(id)a5;
- (NPHCallConfigurationChangeSource)source;
- (NSArray)SOSDisambiguationPrompt;
- (NSArray)calls;
- (NSArray)callsEnded;
- (NSArray)callsEnding;
- (NSArray)callsFailed;
- (NSArray)callsNotDeclined;
- (NSArray)callsOnDefaultPairedDevice;
- (TUDialRequest)dialPrompt;
- (TUDialRequest)redialPrompt;
- (TUJoinConversationRequest)rejoinPrompt;
- (id)copyWithCallsPassingTest:(id)a3;
- (id)description;
- (int64_t)sosFlowState;
- (void)_log;
- (void)disconnectAllCallsWithSource:(id)a3;
- (void)disconnectAllNonEmergencyCallsWithSource:(id)a3;
- (void)setBlockedCallEndedPrompt:(id)a3;
- (void)setCallEnded:(id)a3;
- (void)setCallHandingOff:(id)a3;
- (void)setCallHandingOffToWatch:(id)a3;
- (void)setDialPrompt:(id)a3;
- (void)setRedialPrompt:(id)a3;
- (void)setRejoinPrompt:(id)a3;
- (void)setSOSDisambiguationPrompt:(id)a3;
- (void)setShowEmergencyFallback:(BOOL)a3;
- (void)setSosFlowState:(int64_t)a3;
- (void)setSource:(id)a3;
@end

@implementation NPHCallConfiguration

- (NPHCallConfiguration)init
{
  v3 = [[NPHCallConfigurationChangeSource alloc] initWithString:@"initial"];
  v4 = [(NPHCallConfiguration *)self initWithCalls:&__NSArray0__struct andCallsOnDefaultPairedDevice:&__NSArray0__struct source:v3];

  return v4;
}

- (NPHCallConfiguration)initWithCalls:(id)a3 andCallsOnDefaultPairedDevice:(id)a4 source:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NPHCallConfiguration;
  v12 = [(NPHCallConfiguration *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_calls, a3);
    objc_storeStrong((id *)&v13->_callsOnDefaultPairedDevice, a4);
    objc_storeStrong((id *)&v13->_source, a5);
  }

  return v13;
}

- (NSArray)callsEnding
{
  v2 = [(NPHCallConfiguration *)self calls];
  v3 = [v2 objectsPassingTest:&stru_100010788];

  return (NSArray *)v3;
}

- (NSArray)callsEnded
{
  v2 = [(NPHCallConfiguration *)self calls];
  v3 = [v2 objectsPassingTest:&stru_1000107A8];

  return (NSArray *)v3;
}

- (NSArray)callsNotDeclined
{
  v2 = [(NPHCallConfiguration *)self calls];
  v3 = [v2 objectsPassingTest:&stru_1000107C8];

  return (NSArray *)v3;
}

- (NPHCall)incomingCall
{
  v2 = [(NPHCallConfiguration *)self calls];
  v3 = [v2 firstObjectPassingTest:&stru_1000107E8];

  return (NPHCall *)v3;
}

- (NPHCall)activeCall
{
  v2 = [(NPHCallConfiguration *)self calls];
  v3 = [v2 firstObjectPassingTest:&stru_100010808];

  return (NPHCall *)v3;
}

- (NPHCall)sendingCall
{
  v2 = [(NPHCallConfiguration *)self calls];
  v3 = [v2 firstObjectPassingTest:&stru_100010828];

  return (NPHCall *)v3;
}

- (NPHCall)currentCall
{
  v2 = [(NPHCallConfiguration *)self calls];
  v3 = +[NPHCall currentCallFromCalls:v2];

  return (NPHCall *)v3;
}

- (NPHCall)remoteCall
{
  v3 = [(NPHCallConfiguration *)self callsOnDefaultPairedDevice];
  v4 = [v3 firstObjectPassingTest:&stru_100010848];
  v5 = [v3 firstObjectPassingTest:&stru_100010868];
  v6 = [v3 firstObject];
  uint64_t v7 = [(NPHCallConfiguration *)self callHandingOffToWatch];
  v8 = (void *)v7;
  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = (void *)v7;
  }
  if (v5) {
    id v9 = v5;
  }
  if (v4) {
    id v10 = v4;
  }
  else {
    id v10 = v9;
  }
  id v11 = v10;

  return v11;
}

- (NPHCall)callToAnswerOnPhone
{
  v2 = [(NPHCallConfiguration *)self callsOnDefaultPairedDevice];
  v3 = [v2 firstObjectPassingTest:&stru_100010888];

  return (NPHCall *)v3;
}

- (NSArray)callsFailed
{
  v2 = [(NPHCallConfiguration *)self calls];
  v3 = [v2 objectsPassingTest:&stru_1000108A8];

  return (NSArray *)v3;
}

- (NPHCall)blockedCall
{
  v2 = [(NPHCallConfiguration *)self calls];
  v3 = [v2 firstObjectPassingTest:&stru_1000108C8];

  return (NPHCall *)v3;
}

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)NPHCallConfiguration;
  v3 = [(NPHCallConfiguration *)&v14 description];
  v4 = [(NPHCallConfiguration *)self incomingCall];
  v5 = [v4 description];
  v6 = [(NPHCallConfiguration *)self calls];
  uint64_t v7 = [v6 description];
  v8 = [(NPHCallConfiguration *)self callsOnDefaultPairedDevice];
  id v9 = [v8 description];
  id v10 = [(NPHCallConfiguration *)self callToAnswerOnPhone];
  id v11 = [v10 description];
  v12 = +[NSString stringWithFormat:@"%@, incoming %@, calls %@, callsOnDefaultPairedDevice %@, callToAnswerOnPhone %@", v3, v5, v7, v9, v11];

  return v12;
}

- (BOOL)hasEmergencyCall
{
  v2 = [(NPHCallConfiguration *)self calls];
  unsigned __int8 v3 = [v2 hasObjectPassingTest:&stru_1000108E8];

  return v3;
}

- (BOOL)hasEmergencySOSCall
{
  v2 = [(NPHCallConfiguration *)self calls];
  unsigned __int8 v3 = [v2 hasObjectPassingTest:&stru_100010908];

  return v3;
}

- (BOOL)hasDisconnectedEmergencySOSCall
{
  v2 = [(NPHCallConfiguration *)self calls];
  unsigned __int8 v3 = [v2 hasObjectPassingTest:&stru_100010928];

  return v3;
}

- (BOOL)hasHostedCall
{
  v2 = [(NPHCallConfiguration *)self calls];
  unsigned __int8 v3 = [v2 hasObjectPassingTest:&stru_100010948];

  return v3;
}

- (void)disconnectAllCallsWithSource:(id)a3
{
  id v4 = a3;
  v5 = [(NPHCallConfiguration *)self calls];
  v6 = [v5 objectsPassingTest:&stru_100010968];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) disconnectWithReason:2* ([*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) status, (void)v12] == 4) fromSource:v4];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)copyWithCallsPassingTest:(id)a3
{
  id v4 = a3;
  v5 = [NPHCallConfiguration alloc];
  v6 = [(NPHCallConfiguration *)self calls];
  id v7 = [v6 objectsPassingTest:v4];
  id v8 = [(NPHCallConfiguration *)self callsOnDefaultPairedDevice];
  id v9 = [v8 objectsPassingTest:v4];

  uint64_t v10 = [(NPHCallConfiguration *)self source];
  id v11 = [(NPHCallConfiguration *)v5 initWithCalls:v7 andCallsOnDefaultPairedDevice:v9 source:v10];

  return v11;
}

- (void)disconnectAllNonEmergencyCallsWithSource:(id)a3
{
  id v4 = a3;
  v5 = [(NPHCallConfiguration *)self calls];
  v6 = [v5 objectsPassingTest:&stru_100010988];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) disconnectWithReason:2*([*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) status, (void)v12] == 4), v4];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

+ (id)callConfigurationWithIncomingCallOverrideName:(id)a3 incomingCallStatus:(int)a4 activeCallOverrideName:(id)a5 activeCallStatus:(int)a6 activeCallDisconnectedReason:(int)a7 heldCallOverrideName:(id)a8 heldCallStatus:(int)a9 outgoingCallOverrideName:(id)a10 outgoingCallStatus:(int)a11 isSOS:(BOOL)a12 audioMessageType:(unint64_t)a13 isAnsweringOnPhone:(BOOL)a14 source:(id)a15
{
  uint64_t v17 = *(void *)&a4;
  id v18 = a3;
  id v71 = a5;
  id v70 = a8;
  id v69 = a10;
  id v65 = a15;
  v19 = objc_opt_new();
  v64 = objc_opt_new();
  p_attr = (char **)(&stru_100015FF8 + 8);
  v67 = v18;
  if (v18)
  {
    v21 = objc_opt_new();
    [v21 setMockDisplayName:v67];
    [v21 setMockLocalizedLabel:@"iPhone"];
    id v22 = objc_alloc((Class)TUSenderIdentity);
    v23 = +[NSUUID UUID];
    v24 = +[NSUUID UUID];
    id v25 = [objc_alloc((Class)TUHandle) initWithType:2 value:@"987654321"];
    id v26 = [v22 initWithUUID:v23 accountUUID:v24 ISOCountryCode:@"us" localizedName:@"Primary" localizedShortName:@"P" localizedServiceName:@"service" handle:v25];
    [v21 setMockLocalSenderIdentity:v26];

    p_attr = &stru_100015FF8.attr;
    [v21 setMockDestinationID:@"123456789"];
    [v21 setMockService:1];
    [v21 setMockStatus:v17];
    [v21 setMockSOS:a12];
    [v21 setNph_audioMessageType:a13];
    v27 = [[NPHCall alloc] initWithTUCall:v21];
    [v19 addObject:v27];
  }
  v68 = v19;
  v28 = p_attr;
  if (v71)
  {
    id v29 = objc_alloc((Class)TUDialRequest);
    v30 = +[TUCallCenter sharedInstance];
    v31 = [v30 providerManager];
    v32 = [v31 telephonyProvider];
    id v33 = [v29 initWithProvider:v32];

    id v34 = [objc_alloc((Class)TUHandle) initWithType:2 value:@"123456789"];
    [v33 setHandle:v34];

    v35 = objc_opt_new();
    [v35 setMockDisplayName:v71];
    [v35 setMockLocalizedLabel:@"iPhone"];
    id v36 = objc_alloc((Class)TUSenderIdentity);
    v37 = +[NSUUID UUID];
    v38 = +[NSUUID UUID];
    id v39 = [objc_alloc((Class)TUHandle) initWithType:2 value:@"987654321"];
    id v40 = [v36 initWithUUID:v37 accountUUID:v38 ISOCountryCode:@"us" localizedName:@"Primary" localizedShortName:@"P" localizedServiceName:@"service" handle:v39];
    [v35 setMockLocalSenderIdentity:v40];

    [v35 setMockDestinationID:@"123456789"];
    [v35 setMockService:1];
    [v35 setMockStatus:a6];
    [v35 setMockStartTime:CFAbsoluteTimeGetCurrent()];
    [v35 setMockDisconnectedReason:a7];
    [v35 setMockDialRequestForRedial:v33];
    [v35 setMockSOS:a12];
    [v35 setNph_audioMessageType:a13];
    id v41 = [objc_alloc((Class)(v28 + 302)) initWithTUCall:v35];
    [v68 addObject:v41];
  }
  if (v69)
  {
    v42 = objc_opt_new();
    [v42 setMockDisplayName:v69];
    [v42 setMockLocalizedLabel:@"iPhone"];
    id v43 = objc_alloc((Class)TUSenderIdentity);
    v44 = +[NSUUID UUID];
    v45 = +[NSUUID UUID];
    id v46 = [objc_alloc((Class)TUHandle) initWithType:2 value:@"987654321"];
    id v47 = [v43 initWithUUID:v44 accountUUID:v45 ISOCountryCode:@"us" localizedName:@"Primary" localizedShortName:@"P" localizedServiceName:@"service" handle:v46];
    [v42 setMockLocalSenderIdentity:v47];

    [v42 setMockStatus:a11];
    [v42 setMockService:1];
    [v42 setMockDestinationID:@"123456789"];
    [v42 setMockOutgoing:1];
    [v42 setMockSOS:a12];
    [v42 setNph_audioMessageType:a13];
    id v48 = [objc_alloc((Class)(v28 + 302)) initWithTUCall:v42];
    [v68 addObject:v48];
  }
  if (v70)
  {
    v49 = objc_opt_new();
    [v49 setMockDisplayName:v70];
    [v49 setMockLocalizedLabel:@"iPhone"];
    id v50 = objc_alloc((Class)TUSenderIdentity);
    v51 = +[NSUUID UUID];
    v52 = +[NSUUID UUID];
    id v53 = [objc_alloc((Class)TUHandle) initWithType:2 value:@"987654321"];
    id v54 = [v50 initWithUUID:v51 accountUUID:v52 ISOCountryCode:@"us" localizedName:@"Primary" localizedShortName:@"P" localizedServiceName:@"service" handle:v53];
    [v49 setMockLocalSenderIdentity:v54];

    [v49 setMockStatus:a9];
    [v49 setMockService:1];
    [v49 setMockDestinationID:@"123456789"];
    [v49 setMockStartTime:CFAbsoluteTimeGetCurrent()];
    [v49 setMockSOS:a12];
    [v49 setNph_audioMessageType:a13];
    [v49 setWantsHoldMusic:a14];
    id v55 = [objc_alloc((Class)(v28 + 302)) initWithTUCall:v49];
    if (a14) {
      v56 = v64;
    }
    else {
      v56 = v68;
    }
    [v56 addObject:v55];
  }
  id v57 = objc_alloc((Class)a1);
  id v58 = [v68 copy];
  id v59 = [v64 copy];
  id v60 = [v57 initWithCalls:v58 andCallsOnDefaultPairedDevice:v59 source:v65];

  return v60;
}

+ (void)log:(id)a3 withReason:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100001854();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = +[NSString stringWithValidatedFormat:v6, @"%p", 0, v5 validFormatSpecifiers error];
    *(_DWORD *)buf = 138412290;
    long long v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  if (v5)
  {
    [v5 _log];
  }
  else
  {
    id v9 = sub_100001854();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "\t<none>", buf, 2u);
    }
  }
  uint64_t v10 = sub_100001854();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, (const char *)&unk_10000B882, buf, 2u);
  }
}

- (void)_log
{
  unsigned __int8 v3 = [(NPHCallConfiguration *)self incomingCall];
  [v3 logWithReason:@"incomingCall" indented:1];

  id v4 = [(NPHCallConfiguration *)self callToAnswerOnPhone];
  [v4 logWithReason:@"callToAnswerOnPhone" indented:1];

  id v5 = [(NPHCallConfiguration *)self callEnded];
  [v5 logWithReason:@"callEnded" indented:1];

  id v6 = [(NPHCallConfiguration *)self callHandingOff];
  [v6 logWithReason:@"callHandingOff" indented:1];

  id v7 = [(NPHCallConfiguration *)self callHandingOffToWatch];
  [v7 logWithReason:@"callHandingOffToWatch" indented:1];

  id v8 = [(NPHCallConfiguration *)self dialPrompt];
  [v8 nph_logWithReason:@"dialPrompt" indented:1];

  id v9 = [(NPHCallConfiguration *)self redialPrompt];
  [v9 nph_logWithReason:@"redialPrompt" indented:1];

  uint64_t v10 = [(NPHCallConfiguration *)self rejoinPrompt];
  [v10 nph_logWithReason:@"rejoinPrompt" indented:1];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = [(NPHCallConfiguration *)self calls];
  id v12 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v32;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v16);
        id v18 = +[NSString stringWithFormat:@"call #%d ", (char *)v16 + v14];
        [v17 logWithReason:v18 indented:1];

        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      id v13 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
      uint64_t v14 = (v14 + v16);
    }
    while (v13);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v19 = [(NPHCallConfiguration *)self callsOnDefaultPairedDevice];
  id v20 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)v28;
    do
    {
      v24 = 0;
      do
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v19);
        }
        id v25 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v24);
        id v26 = +[NSString stringWithFormat:@"callOnDefaultPairedDevice #%d ", (char *)v24 + v22];
        [v25 logWithReason:v26 indented:1];

        v24 = (char *)v24 + 1;
      }
      while (v21 != v24);
      id v21 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
      uint64_t v22 = (v22 + v24);
    }
    while (v21);
  }
}

- (NSArray)calls
{
  return self->_calls;
}

- (BOOL)showEmergencyFallback
{
  return self->_showEmergencyFallback;
}

- (void)setShowEmergencyFallback:(BOOL)a3
{
  self->_showEmergencyFallback = a3;
}

- (NSArray)callsOnDefaultPairedDevice
{
  return self->_callsOnDefaultPairedDevice;
}

- (TUDialRequest)dialPrompt
{
  return self->_dialPrompt;
}

- (void)setDialPrompt:(id)a3
{
}

- (TUDialRequest)redialPrompt
{
  return self->_redialPrompt;
}

- (void)setRedialPrompt:(id)a3
{
}

- (TUJoinConversationRequest)rejoinPrompt
{
  return self->_rejoinPrompt;
}

- (void)setRejoinPrompt:(id)a3
{
}

- (NPHCall)blockedCallEndedPrompt
{
  return self->_blockedCallEndedPrompt;
}

- (void)setBlockedCallEndedPrompt:(id)a3
{
}

- (NSArray)SOSDisambiguationPrompt
{
  return self->_SOSDisambiguationPrompt;
}

- (void)setSOSDisambiguationPrompt:(id)a3
{
}

- (int64_t)sosFlowState
{
  return self->_sosFlowState;
}

- (void)setSosFlowState:(int64_t)a3
{
  self->_sosFlowState = a3;
}

- (NPHCall)callEnded
{
  return self->_callEnded;
}

- (void)setCallEnded:(id)a3
{
}

- (NPHCall)callHandingOff
{
  return self->_callHandingOff;
}

- (void)setCallHandingOff:(id)a3
{
}

- (NPHCall)callHandingOffToWatch
{
  return self->_callHandingOffToWatch;
}

- (void)setCallHandingOffToWatch:(id)a3
{
}

- (NPHCallConfigurationChangeSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_callHandingOffToWatch, 0);
  objc_storeStrong((id *)&self->_callHandingOff, 0);
  objc_storeStrong((id *)&self->_callEnded, 0);
  objc_storeStrong((id *)&self->_SOSDisambiguationPrompt, 0);
  objc_storeStrong((id *)&self->_blockedCallEndedPrompt, 0);
  objc_storeStrong((id *)&self->_rejoinPrompt, 0);
  objc_storeStrong((id *)&self->_redialPrompt, 0);
  objc_storeStrong((id *)&self->_dialPrompt, 0);
  objc_storeStrong((id *)&self->_callsOnDefaultPairedDevice, 0);

  objc_storeStrong((id *)&self->_calls, 0);
}

@end