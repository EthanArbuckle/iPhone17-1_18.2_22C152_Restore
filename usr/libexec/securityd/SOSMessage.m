@interface SOSMessage
- (BOOL)SOSTransportMessageCleanupAfterPeerMessages:(id)a3 peers:(__CFDictionary *)a4 err:(__CFError *)a5;
- (BOOL)SOSTransportMessageFlushChanges:(id)a3 err:(__CFError *)a4;
- (BOOL)SOSTransportMessageHandlePeerMessage:(id)a3 id:(__CFString *)a4 cm:(__CFData *)a5 err:(__CFError *)a6;
- (BOOL)SOSTransportMessageSendMessage:(id)a3 id:(__CFString *)a4 messageToSend:(__CFData *)a5 err:(__CFError *)a6;
- (BOOL)SOSTransportMessageSendMessageIfNeeded:(id)a3 circleName:(__CFString *)a4 pID:(__CFString *)a5 err:(__CFError *)a6;
- (BOOL)SOSTransportMessageSendMessages:(id)a3 pm:(__CFDictionary *)a4 err:(__CFError *)a5;
- (BOOL)SOSTransportMessageSyncWithPeers:(id)a3 p:(__CFSet *)a4 err:(__CFError *)a5;
- (NSString)circleName;
- (SOSAccount)account;
- (SOSMessage)initWithAccount:(id)a3 andName:(id)a4;
- (__CFDictionary)SOSTransportMessageHandlePeerMessageReturnsHandledCopy:(id)a3 peerMessages:(__CFDictionary *)a4 err:(__CFError *)a5;
- (__CFString)SOSTransportMessageGetCircleName;
- (__OpaqueSOSEngine)engine;
- (int64_t)SOSTransportMessageGetTransportType;
- (void)SOSTransportMessageCalculateNextTimer:(id)a3 rtt:(int)a4 peerid:(id)a5;
- (void)SOSTransportMessageGetEngine;
- (void)SOSTransportMessageUpdateLastMessageSentTimetstamp:(id)a3 peer:(__OpaqueSOSPeer *)a4;
- (void)SOSTransportMessageUpdateRTTs:(id)a3;
- (void)dealloc;
- (void)setAccount:(id)a3;
- (void)setCircleName:(id)a3;
- (void)setEngine:(__OpaqueSOSEngine *)a3;
@end

@implementation SOSMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleName, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

- (void)setCircleName:(id)a3
{
}

- (NSString)circleName
{
  return self->_circleName;
}

- (void)setAccount:(id)a3
{
}

- (SOSAccount)account
{
  return self->_account;
}

- (void)setEngine:(__OpaqueSOSEngine *)a3
{
  self->_engine = a3;
}

- (__OpaqueSOSEngine)engine
{
  return self->_engine;
}

- (BOOL)SOSTransportMessageSendMessageIfNeeded:(id)a3 circleName:(__CFString *)a4 pID:(__CFString *)a5 err:(__CFError *)a6
{
  id v8 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  v9 = [v8 account];
  BOOL v10 = sub_1001F7170(v9);
  id v11 = [v8 engine];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100215770;
  v17[3] = &unk_100308E60;
  v20 = &v24;
  id v12 = v8;
  id v18 = v12;
  v21 = a5;
  v22 = a6;
  BOOL v23 = v10;
  id v13 = v9;
  id v19 = v13;
  char v14 = sub_1000FC5B8((uint64_t)v11, (uint64_t)a5, (uint64_t)a6, v17);
  if (*((unsigned char *)v25 + 24)) {
    BOOL v15 = v14;
  }
  else {
    BOOL v15 = 0;
  }
  *((unsigned char *)v25 + 24) = v15;

  _Block_object_dispose(&v24, 8);
  return v15;
}

- (void)SOSTransportMessageUpdateLastMessageSentTimetstamp:(id)a3 peer:(__OpaqueSOSPeer *)a4
{
  id v8 = a3;
  v5 = sub_1001DCC24(v8, @"kSOSAccountPeerLastSentTimestamp");
  if (!v5)
  {
    v5 = +[NSMutableDictionary dictionary];
  }
  v6 = [v5 objectForKey:*((void *)a4 + 2)];

  if (!v6)
  {
    v7 = +[NSDate date];
    [v5 setObject:v7 forKey:*((void *)a4 + 2)];

    sub_1001FF4C0(v8, @"kSOSAccountPeerLastSentTimestamp", (uint64_t)v5, 0);
  }
}

- (BOOL)SOSTransportMessageHandlePeerMessage:(id)a3 id:(__CFString *)a4 cm:(__CFData *)a5 err:(__CFError *)a6
{
  id v10 = a3;
  [(SOSMessage *)self SOSTransportMessageUpdateRTTs:a4];
  id v11 = [v10 engine];
  sub_1000297D0(v11 != 0, (CFTypeRef *)a6, @"Missing engine");
  if (v11)
  {
    id v12 = [v10 SOSTransportMessageGetAccount];
    id v13 = [v10 engine];
    id v14 = v12;
    BOOL v15 = v14;
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 1;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    if (v14 && [v14 accountIsChanging])
    {
      v16 = sub_10000B070("engine");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SOSEngineHandleCodedMessage called before signing in to new account", (uint8_t *)v28, 2u);
      }
      BOOL v17 = 1;
    }
    else
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100216CFC;
      v28[3] = &unk_100308E38;
      v32 = a4;
      v33 = a5;
      v34 = a6;
      v29 = v15;
      v30 = &v40;
      id v35 = v13;
      v31 = &v36;
      int v18 = sub_1000FC5B8((uint64_t)v13, (uint64_t)a4, (uint64_t)a6, v28);
      if (*((unsigned char *)v41 + 24)) {
        int v26 = v18;
      }
      else {
        int v26 = 0;
      }
      *((unsigned char *)v41 + 24) = v26;
      if (*((unsigned char *)v37 + 24))
      {
        sub_10013F0C8();
        int v26 = *((unsigned __int8 *)v41 + 24);
      }
      if (v26)
      {
        sub_100227F7C((uint64_t)a4, v19, v20, v21, v22, v23, v24, v25);
        BOOL v17 = *((unsigned char *)v41 + 24) != 0;
      }
      else
      {
        BOOL v17 = 0;
      }
      v16 = v29;
    }

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)SOSTransportMessageUpdateRTTs:(id)a3
{
  id v4 = a3;
  v5 = [(SOSMessage *)self SOSTransportMessageGetAccount];
  v6 = sub_1001DCC24(v5, @"kSOSAccountPeerLastSentTimestamp");
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKey:v4];
    if (v8)
    {
      v9 = +[NSDate date];
      [v9 timeIntervalSinceDate:v8];
      double v11 = v10;
      id v12 = sub_10000B070("otrtimer");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v19 = v4;
        __int16 v20 = 2112;
        uint64_t v21 = v9;
        __int16 v22 = 2112;
        uint64_t v23 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "peerID: %@ current date: %@, stored date: %@", buf, 0x20u);
      }

      id v13 = sub_10000B070("otrtimer");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v19) = (int)v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "rtt: %d", buf, 8u);
      }

      [(SOSMessage *)self SOSTransportMessageCalculateNextTimer:v5 rtt:(int)v11 peerid:v4];
      id v14 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (int)v11, SecCoreAnalyticsValue);
      BOOL v17 = v14;
      BOOL v15 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      +[SecCoreAnalytics sendEvent:@"com.apple.security.sos.messagertt" event:v15];

      [v7 removeObjectForKey:v4];
      sub_1001FF4C0(v5, @"kSOSAccountPeerLastSentTimestamp", (uint64_t)v7, 0);
    }
  }
}

- (void)SOSTransportMessageCalculateNextTimer:(id)a3 rtt:(int)a4 peerid:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = sub_1001DCC24(v7, @"PeerNegotiationTimeouts");
  if (!v9)
  {
    v9 = +[NSMutableDictionary dictionary];
  }
  int v10 = 2 * a4;
  double v11 = [v9 objectForKey:v8];
  id v12 = v11;
  if (!v11 || (signed int v13 = [v11 intValue], a4 > 1800) || v13 < v10)
  {
    if (v10 <= 60) {
      unsigned int v14 = 60;
    }
    else {
      unsigned int v14 = 2 * a4;
    }
    if (v14 >= 0xE10) {
      uint64_t v15 = 3600;
    }
    else {
      uint64_t v15 = v14;
    }
    id v16 = [objc_alloc((Class)NSNumber) initWithInt:v15];
    [v9 setObject:v16 forKey:v8];
    BOOL v17 = sub_10000B070("otrtimer");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      id v19 = v8;
      __int16 v20 = 1024;
      int v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "peerID: %@ New OTR RTT: %d", (uint8_t *)&v18, 0x12u);
    }

    sub_1001FF4C0(v7, @"PeerNegotiationTimeouts", (uint64_t)v9, 0);
  }
}

- (__CFDictionary)SOSTransportMessageHandlePeerMessageReturnsHandledCopy:(id)a3 peerMessages:(__CFDictionary *)a4 err:(__CFError *)a5
{
  return CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
}

- (BOOL)SOSTransportMessageSendMessage:(id)a3 id:(__CFString *)a4 messageToSend:(__CFData *)a5 err:(__CFError *)a6
{
  id v10 = a3;
  CFDictionaryRef v18 = sub_100139704(kCFAllocatorDefault, v11, v12, v13, v14, v15, v16, v17, (uint64_t)a4, (uint64_t)a5);
  BOOL v19 = [(SOSMessage *)self SOSTransportMessageSendMessages:v10 pm:v18 err:a6];

  if (v18) {
    CFRelease(v18);
  }
  return v19;
}

- (BOOL)SOSTransportMessageCleanupAfterPeerMessages:(id)a3 peers:(__CFDictionary *)a4 err:(__CFError *)a5
{
  return 1;
}

- (BOOL)SOSTransportMessageSyncWithPeers:(id)a3 p:(__CFSet *)a4 err:(__CFError *)a5
{
  return 1;
}

- (BOOL)SOSTransportMessageFlushChanges:(id)a3 err:(__CFError *)a4
{
  return 1;
}

- (BOOL)SOSTransportMessageSendMessages:(id)a3 pm:(__CFDictionary *)a4 err:(__CFError *)a5
{
  return 1;
}

- (int64_t)SOSTransportMessageGetTransportType
{
  return 0;
}

- (__CFString)SOSTransportMessageGetCircleName
{
  v2 = [(SOSMessage *)self circleName];

  return v2;
}

- (void)SOSTransportMessageGetEngine
{
  if (![(SOSMessage *)self engine])
  {
    v3 = [(SOSMessage *)self account];
    id v4 = (uint64_t (**)(id, void *, void))[v3 factory];
    v5 = [(SOSMessage *)self circleName];
    if (v4 && (uint64_t v6 = v4[1](v4, v5, 0)) != 0)
    {
      id v7 = *(const void **)v6;
      (*(void (**)(uint64_t, void))(v6 + 72))(v6, 0);

      if (v7) {
        CFRetain(v7);
      }
    }
    else
    {

      id v7 = 0;
    }
    [(SOSMessage *)self setEngine:v7];
  }

  return [(SOSMessage *)self engine];
}

- (void)dealloc
{
  engine = self->_engine;
  if (engine)
  {
    self->_engine = 0;
    CFRelease(engine);
  }
  v4.receiver = self;
  v4.super_class = (Class)SOSMessage;
  [(SOSMessage *)&v4 dealloc];
}

- (SOSMessage)initWithAccount:(id)a3 andName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SOSMessage;
  v9 = [(SOSMessage *)&v16 init];
  if (v9)
  {
    id v10 = (uint64_t (**)(id, id, void))[v7 factory];
    if (v10 && (uint64_t v11 = v10[1](v10, v8, 0)) != 0)
    {
      int v12 = *(__OpaqueSOSEngine **)v11;
      (*(void (**)(uint64_t, void))(v11 + 72))(v11, 0);
      if (v12) {
        CFRetain(v12);
      }
    }
    else
    {
      int v12 = 0;
    }
    v9->_engine = v12;
    objc_storeStrong((id *)&v9->_account, a3);
    int v13 = (NSString *)[objc_alloc((Class)NSString) initWithString:v8];
    circleName = v9->_circleName;
    v9->_circleName = v13;
  }
  return v9;
}

@end