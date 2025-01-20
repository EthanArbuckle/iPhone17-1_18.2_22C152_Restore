@interface OTPairingService
+ (id)sharedService;
- (BOOL)initiator;
- (IDSService)service;
- (NSString)pairedDeviceNotificationName;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)sessionTimer;
- (OS_dispatch_source)unlockTimer;
- (OTDeviceInformationActualAdapter)deviceInfo;
- (OTPairingSession)session;
- (id)initAsInitiator:(BOOL)a3;
- (int)notifyToken;
- (void)_sendMessage:(id)a3 to:(id)a4 identifier:(id)a5;
- (void)_sendMessage:(id)a3 to:(id)a4 identifier:(id)a5 expectReply:(BOOL)a6;
- (void)deviceUnlockTimedOut;
- (void)exchangePacketAndReply;
- (void)initiatePairingWithCompletion:(id)a3;
- (void)scheduleGizmoPoke;
- (void)scheduleSessionTimeout;
- (void)sendReplyToPacket;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)session:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5;
- (void)setDeviceInfo:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setQueue:(id)a3;
- (void)setService:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionTimer:(id)a3;
- (void)setUnlockTimer:(id)a3;
- (void)stopWaitingForDeviceUnlock;
- (void)waitForDeviceUnlock;
@end

@implementation OTPairingService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_unlockTimer, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setSessionTimer:(id)a3
{
}

- (OS_dispatch_source)sessionTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSession:(id)a3
{
}

- (OTPairingSession)session
{
  return (OTPairingSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeviceInfo:(id)a3
{
}

- (OTDeviceInformationActualAdapter)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setUnlockTimer:(id)a3
{
}

- (OS_dispatch_source)unlockTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32, 1);
}

- (void)setService:(id)a3
{
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)initiator
{
  return self->_initiator;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)scheduleGizmoPoke
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, 0);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_COMMUNICATES_WITH_PAIRED_DEVICE, 1);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "scheduling XPC Activity to inform gizmo of companion unlock", buf, 2u);
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004A48;
  handler[3] = &unk_10000C508;
  handler[4] = self;
  xpc_activity_register("com.apple.security.otpaird.poke", v3, handler);
}

- (void)stopWaitingForDeviceUnlock
{
  xpc_object_t v3 = [(OTPairingService *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(OTPairingService *)self notifyToken] != -1)
  {
    if (notify_cancel([(OTPairingService *)self notifyToken])) {
      _os_assumes_log();
    }
    [(OTPairingService *)self setNotifyToken:0xFFFFFFFFLL];
  }
  v4 = [(OTPairingService *)self unlockTimer];

  if (v4)
  {
    v5 = [(OTPairingService *)self unlockTimer];
    dispatch_source_cancel(v5);

    [(OTPairingService *)self setUnlockTimer:0];
  }
}

- (void)waitForDeviceUnlock
{
  xpc_object_t v3 = [(OTPairingService *)self queue];
  dispatch_assert_queue_V2(v3);

  int out_token = -1431655766;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004EC4;
  block[3] = &unk_10000C4A0;
  block[4] = self;
  if (qword_1000117F8 != -1) {
    dispatch_once(&qword_1000117F8, block);
  }
  if ([(OTPairingService *)self notifyToken] == -1)
  {
    v4 = [(OTPairingService *)self queue];
    uint32_t v5 = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &out_token, v4, &stru_10000C4E0);

    if (v5) {
      _os_assumes_log();
    }
    else {
      [(OTPairingService *)self setNotifyToken:out_token];
    }
  }
  v6 = [(OTPairingService *)self queue];
  dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);
  [(OTPairingService *)self setUnlockTimer:v7];

  v8 = [(OTPairingService *)self unlockTimer];
  dispatch_time_t v9 = dispatch_time(0, 120000000000);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);

  v10 = [(OTPairingService *)self unlockTimer];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004F90;
  handler[3] = &unk_10000C4A0;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);

  v11 = [(OTPairingService *)self unlockTimer];
  dispatch_activate(v11);

  if (!MKBGetDeviceLockState())
  {
    [(OTPairingService *)self stopWaitingForDeviceUnlock];
    dispatch_time_t v12 = dispatch_time(0, 5000000000);
    v13 = [(OTPairingService *)self queue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100004FCC;
    v14[3] = &unk_10000C4A0;
    v14[4] = self;
    dispatch_after(v12, v13, v14);
  }
}

- (void)scheduleSessionTimeout
{
  xpc_object_t v3 = [(OTPairingService *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(OTPairingService *)self initiator])
  {
    v4 = [(OTPairingService *)self queue];
    dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
    [(OTPairingService *)self setSessionTimer:v5];

    v6 = [(OTPairingService *)self sessionTimer];
    dispatch_time_t v7 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);

    v8 = [(OTPairingService *)self sessionTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100005144;
    handler[3] = &unk_10000C4A0;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);

    dispatch_time_t v9 = [(OTPairingService *)self sessionTimer];
    dispatch_activate(v9);
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v11 = a5;
  id v12 = a7;
  v13 = [(OTPairingService *)self queue];
  dispatch_assert_queue_V2(v13);

  v14 = [(OTPairingService *)self session];
  v15 = [v14 sentMessageIdentifier];
  unsigned __int8 v16 = [v15 isEqualToString:v11];

  if (v16)
  {
    if (!a6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412546;
        id v20 = v11;
        __int16 v21 = 2112;
        id v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unsuccessfully sent message (%@): %@", (uint8_t *)&v19, 0x16u);
      }
      v17 = [(OTPairingService *)self session];
      v18 = +[NSError errorWithDomain:@"com.apple.security.otpaird" code:3 description:@"IDS message failed to send" underlying:v12];
      [(OTPairingService *)self session:v17 didCompleteWithSuccess:0 error:v18];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ignoring didSendWithSuccess callback for unexpected identifier: %@", (uint8_t *)&v19, 0xCu);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  v13 = [(OTPairingService *)self queue];
  dispatch_assert_queue_V2(v13);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 138412546;
    id v39 = v11;
    __int16 v40 = 2112;
    id v41 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IDS message from %@: %@", (uint8_t *)&v38, 0x16u);
  }
  v14 = [[OTPairingPacketContext alloc] initWithMessage:v10 fromID:v11 context:v12];

  if ([(OTPairingPacketContext *)v14 messageType] == 3) {
    goto LABEL_22;
  }
  v15 = [(OTPairingPacketContext *)v14 sessionIdentifier];

  if (v15)
  {
    unsigned __int8 v16 = [(OTPairingPacketContext *)v14 sessionIdentifier];
    v17 = [(OTPairingService *)self session];
    v18 = [v17 identifier];
    unsigned __int8 v19 = [v16 isEqualToString:v18];

    if (v19)
    {
      id v20 = [(OTPairingService *)self session];
      __int16 v21 = [v20 sentMessageIdentifier];
      id v22 = [(OTPairingPacketContext *)v14 incomingResponseIdentifier];
      unsigned __int8 v23 = [v21 isEqualToString:v22];

      if ((v23 & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v38) = 0;
          v24 = "ignoring message with unrecognized incomingResponseIdentifier";
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v38, 2u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
    }
    else
    {
      unsigned int v25 = [(OTPairingService *)self initiator];
      BOOL v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v25)
      {
        if (v26)
        {
          LOWORD(v38) = 0;
          v24 = "unknown session identifier, dropping message";
          goto LABEL_14;
        }
        goto LABEL_22;
      }
      if (v26)
      {
        v27 = [(OTPairingPacketContext *)v14 sessionIdentifier];
        int v38 = 138412290;
        id v39 = v27;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unknown session identifier %@, creating new session object", (uint8_t *)&v38, 0xCu);
      }
      v28 = [OTPairingSession alloc];
      BOOL v29 = [(OTPairingService *)self initiator];
      v30 = [(OTPairingService *)self deviceInfo];
      v31 = [(OTPairingPacketContext *)v14 sessionIdentifier];
      id v32 = [(OTPairingSession *)v28 initAsInitiator:v29 deviceInfo:v30 identifier:v31];
      [(OTPairingService *)self setSession:v32];
    }
    unsigned int v33 = [(OTPairingPacketContext *)v14 messageType];
    if (v33 == 1)
    {
      v37 = [(OTPairingService *)self session];
      [v37 setPacket:v14];

      [(OTPairingService *)self sendReplyToPacket];
    }
    else if (v33 == 2)
    {
      v34 = [(OTPairingService *)self session];
      v35 = [(OTPairingPacketContext *)v14 error];
      v36 = +[NSError errorWithDomain:@"com.apple.security.otpaird" code:4 description:@"companion error" underlying:v35];
      [(OTPairingService *)self session:v34 didCompleteWithSuccess:0 error:v36];
    }
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v38) = 0;
    v24 = "ignoring message with no session identifier (old build?)";
    goto LABEL_14;
  }
LABEL_22:
}

- (void)_sendMessage:(id)a3 to:(id)a4 identifier:(id)a5 expectReply:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(OTPairingService *)self queue];
  dispatch_assert_queue_V2(v13);

  v14 = +[NSSet setWithObject:v11];

  v15 = objc_opt_new();
  [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionForceLocalDeliveryKey];
  unsigned __int8 v16 = +[NSNumber numberWithBool:v6];
  [v15 setObject:v16 forKeyedSubscript:IDSSendMessageOptionExpectsPeerResponseKey];

  if (v10) {
    [v15 setObject:v10 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];
  }
  v17 = [(OTPairingService *)self service];
  id v23 = 0;
  id v24 = 0;
  unsigned int v18 = [v17 sendMessage:v12 toDestinations:v14 priority:200 options:v15 identifier:&v24 error:&v23];

  id v19 = v24;
  id v20 = v23;

  if (!v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v19;
      __int16 v27 = 2112;
      id v28 = v20;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send message failed (%@): %@", buf, 0x16u);
    }
    __int16 v21 = [(OTPairingService *)self session];
    id v22 = +[NSError errorWithDomain:@"com.apple.security.otpaird" code:3 description:@"IDS message send failure" underlying:v20];
    [(OTPairingService *)self session:v21 didCompleteWithSuccess:0 error:v22];

    goto LABEL_9;
  }
  if (v6)
  {
    __int16 v21 = [(OTPairingService *)self session];
    [v21 setSentMessageIdentifier:v19];
LABEL_9:
  }
}

- (void)_sendMessage:(id)a3 to:(id)a4 identifier:(id)a5
{
}

- (void)exchangePacketAndReply
{
  xpc_object_t v3 = [(OTPairingService *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(OTPairingService *)self session];
  dispatch_source_t v5 = [v4 packet];

  BOOL v6 = [(OTPairingService *)self session];
  [v6 setPacket:0];

  dispatch_time_t v7 = [(OTPairingService *)self session];
  v8 = [v7 channel];
  dispatch_time_t v9 = [v5 packetData];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005B9C;
  v11[3] = &unk_10000C478;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  [v8 exchangePacket:v9 complete:v11];
}

- (void)deviceUnlockTimedOut
{
  xpc_object_t v3 = [(OTPairingService *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(OTPairingService *)self session];

  if (v4)
  {
    dispatch_source_t v5 = [(OTPairingService *)self session];
    id v16 = [v5 packet];

    BOOL v6 = [(OTPairingService *)self session];
    [v6 setPacket:0];

    if (v16)
    {
      dispatch_time_t v7 = +[NSError errorWithDomain:@"com.apple.security.otpaird" code:1 description:@"timed out waiting for companion unlock"];
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
      [v8 setObject:&off_10000C9A0 forKeyedSubscript:@"m"];
      dispatch_time_t v9 = [(OTPairingService *)self session];
      id v10 = [v9 identifier];
      [v8 setObject:v10 forKeyedSubscript:@"session"];

      id v11 = [v7 description];
      [v8 setObject:v11 forKeyedSubscript:@"error"];

      id v12 = [v16 fromID];
      v13 = [v16 outgoingResponseIdentifier];
      [(OTPairingService *)self _sendMessage:v8 to:v12 identifier:v13];
      [(OTPairingService *)self scheduleGizmoPoke];
      v14 = [(OTPairingService *)self session];
      v15 = +[NSError errorWithDomain:@"com.apple.security.otpaird" code:1 description:@"timed out waiting for unlock"];
      [(OTPairingService *)self session:v14 didCompleteWithSuccess:0 error:v15];
    }
    else
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
  }
}

- (void)sendReplyToPacket
{
  xpc_object_t v3 = [(OTPairingService *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(OTPairingService *)self session];
  unsigned int v5 = [v4 acquireLockAssertion];

  if (v5)
  {
    [(OTPairingService *)self stopWaitingForDeviceUnlock];
    [(OTPairingService *)self exchangePacketAndReply];
  }
  else
  {
    [(OTPairingService *)self waitForDeviceUnlock];
  }
}

- (void)session:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  id v8 = a5;
  dispatch_time_t v9 = [(OTPairingService *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(OTPairingService *)self session];

  if (v10 == v12)
  {
    id v11 = [(OTPairingService *)self session];
    [v11 didCompleteWithSuccess:v6 error:v8];

    [(OTPairingService *)self setSession:0];
    [(OTPairingService *)self setSessionTimer:0];
    [(OTPairingService *)self setUnlockTimer:0];
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
}

- (void)initiatePairingWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(OTPairingService *)self queue];
  dispatch_assert_queue_not_V2(v5);

  if ([(OTPairingService *)self initiator])
  {
    BOOL v6 = [(OTPairingService *)self queue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000064C0;
    v8[3] = &unk_10000C428;
    v8[4] = self;
    id v9 = v4;
    id v7 = v4;
    dispatch_async(v6, v8);
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
}

- (NSString)pairedDeviceNotificationName
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(OTPairingService *)self service];
  xpc_object_t v3 = [v2 devices];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 isDefaultPairedDevice])
        {
          id v8 = [v7 uniqueIDOverride];
          id v4 = +[NSString stringWithFormat:@"ids-device-state-%@", v8];

          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (NSString *)v4;
}

- (id)initAsInitiator:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)OTPairingService;
  id v4 = [(OTPairingService *)&v11 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.security.otpaird", 0);
    [(OTPairingService *)v4 setQueue:v5];

    v4->_initiator = a3;
    id v6 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.octagon"];
    [(OTPairingService *)v4 setService:v6];

    id v7 = [(OTPairingService *)v4 service];
    id v8 = [(OTPairingService *)v4 queue];
    [v7 addDelegate:v4 queue:v8];

    [(OTPairingService *)v4 setNotifyToken:0xFFFFFFFFLL];
    id v9 = objc_alloc_init(OTDeviceInformationActualAdapter);
    [(OTPairingService *)v4 setDeviceInfo:v9];
  }
  return v4;
}

+ (id)sharedService
{
  if (qword_1000117E8 != -1) {
    dispatch_once(&qword_1000117E8, &stru_10000C400);
  }
  v2 = (void *)qword_1000117F0;

  return v2;
}

@end