@interface KTIDSSessionHandler
+ (int64_t)compareLocalSessionID:(id)a3 remoteSessionID:(id)a4;
- (BOOL)deleteSessionByID:(id)a3;
- (BOOL)startSession:(id)a3;
- (BOOL)validateAnnounce:(id)a3 updateSession:(id)a4;
- (IDSService)service;
- (KTIDSSessionHandler)initWithTransport:(id)a3 transparencyd:(id)a4 peerName:(id)a5;
- (KTIDSSessionTransport)transport;
- (KTIDSTransparencyConnection)transparencyd;
- (NSMutableDictionary)idsHandleLookup;
- (NSMutableDictionary)sessionIDLookup;
- (OS_dispatch_queue)queue;
- (OS_os_log)oslog;
- (id)findSessionByHandle:(id)a3;
- (id)findSessionByID:(id)a3;
- (id)listSessions;
- (id)mapMailbox:(id)a3;
- (id)setupMailbox:(id)a3 publicInfo:(id)a4;
- (void)addMailbox:(id)a3;
- (void)dumpState:(id)a3;
- (void)haveContact:(id)a3 complete:(id)a4;
- (void)ktAnnounce:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)ktCommit:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)ktConfirm:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)ktRevealA:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)ktSelected:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)ktSetupB:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)ktTTR:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)ktTeardown:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)negotiatedSessionID:(id)a3 forMailbox:(id)a4;
- (void)removeAddressLookup:(id)a3;
- (void)removeMailbox:(id)a3;
- (void)removeSessionIDLookup:(id)a3;
- (void)resetSession:(id)a3;
- (void)runIfHaveContact:(id)a3 complete:(id)a4;
- (void)sasTTR:(id)a3 toHandle:(id)a4 pushToken:(id)a5;
- (void)sendMessage:(unsigned __int16)a3 data:(id)a4 mailbox:(id)a5 fromID:(id)a6;
- (void)sendMessage:(unsigned __int16)a3 data:(id)a4 targets:(id)a5 fromHandle:(id)a6;
- (void)sendMessage:(unsigned __int16)a3 data:(id)a4 toID:(id)a5 sourceID:(id)a6;
- (void)setIdsHandleLookup:(id)a3;
- (void)setMessagedAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4;
- (void)setOslog:(id)a3;
- (void)setQueue:(id)a3;
- (void)setService:(id)a3;
- (void)setSessionIDLookup:(id)a3;
- (void)setTransparencyd:(id)a3;
- (void)setTransport:(id)a3;
- (void)setupTransport;
- (void)startMessageDelegate:(id)a3 onQueue:(id)a4;
- (void)tearDown:(id)a3 toID:(id)a4 fromID:(id)a5;
@end

@implementation KTIDSSessionHandler

- (KTIDSSessionHandler)initWithTransport:(id)a3 transparencyd:(id)a4 peerName:(id)a5
{
  v8 = (KTIDSSessionHandler *)a3;
  v9 = (KTIDSSessionHandler *)a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)KTIDSSessionHandler;
  v11 = [(KTIDSSessionHandler *)&v24 init];
  if (v11)
  {
    v12 = v8;
    if (v8) {
      goto LABEL_4;
    }
    id v13 = objc_alloc((Class)IDSService);
    id v14 = [v13 initWithService:off_1000A5A50];
    [(KTIDSSessionHandler *)v11 setService:v14];

    v15 = [(KTIDSSessionHandler *)v11 service];

    v12 = v11;
    if (v15)
    {
LABEL_4:
      [(KTIDSSessionHandler *)v11 setTransport:v12];
      if (v9) {
        v16 = v9;
      }
      else {
        v16 = v11;
      }
      [(KTIDSSessionHandler *)v11 setTransparencyd:v16];
      v17 = +[NSMutableDictionary dictionary];
      [(KTIDSSessionHandler *)v11 setSessionIDLookup:v17];

      v18 = +[NSMutableDictionary dictionary];
      [(KTIDSSessionHandler *)v11 setIdsHandleLookup:v18];

      if (v10)
      {
        v19 = +[NSString stringWithFormat:@"KTIDSSessionHandler-%{mask.hash}@", v10];
      }
      else
      {
        v19 = @"KTIDSSessionHandler";
      }
      v20 = v19;
      os_log_t v21 = os_log_create("com.apple.Transparency", (const char *)[(__CFString *)v20 UTF8String]);
      [(KTIDSSessionHandler *)v11 setOslog:v21];

      dispatch_queue_t v22 = dispatch_queue_create("KTIDSSessionHandler", 0);
      [(KTIDSSessionHandler *)v11 setQueue:v22];

      [(KTIDSSessionHandler *)v11 setupTransport];
      v15 = v11;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)setupTransport
{
  v3 = [(KTIDSSessionHandler *)self transport];
  [v3 setMessagedAction:"ktAnnounce:service:account:fromID:context:" forIncomingRequestsOfType:0];

  v4 = [(KTIDSSessionHandler *)self transport];
  [v4 setMessagedAction:"ktCommit:service:account:fromID:context:" forIncomingRequestsOfType:1];

  v5 = [(KTIDSSessionHandler *)self transport];
  [v5 setMessagedAction:"ktSetupB:service:account:fromID:context:" forIncomingRequestsOfType:4];

  v6 = [(KTIDSSessionHandler *)self transport];
  [v6 setMessagedAction:"ktRevealA:service:account:fromID:context:" forIncomingRequestsOfType:5];

  v7 = [(KTIDSSessionHandler *)self transport];
  [v7 setMessagedAction:"ktConfirm:service:account:fromID:context:" forIncomingRequestsOfType:6];

  v8 = [(KTIDSSessionHandler *)self transport];
  [v8 setMessagedAction:"ktTeardown:service:account:fromID:context:" forIncomingRequestsOfType:3];

  v9 = [(KTIDSSessionHandler *)self transport];
  [v9 setMessagedAction:"ktSelected:service:account:fromID:context:" forIncomingRequestsOfType:2];

  id v10 = [(KTIDSSessionHandler *)self transport];
  [v10 setMessagedAction:"ktTTR:service:account:fromID:context:" forIncomingRequestsOfType:7];

  id v12 = [(KTIDSSessionHandler *)self transport];
  v11 = [(KTIDSSessionHandler *)self queue];
  [v12 startMessageDelegate:self onQueue:v11];
}

- (void)setMessagedAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = [(KTIDSSessionHandler *)self service];
  [v6 setProtobufAction:a3 forIncomingRequestsOfType:v4];
}

- (void)startMessageDelegate:(id)a3 onQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KTIDSSessionHandler *)self service];
  [v8 addDelegate:v7 withDelegateProperties:0 queue:v6];
}

- (void)sendMessage:(unsigned __int16)a3 data:(id)a4 targets:(id)a5 fromHandle:(id)a6
{
  uint64_t v8 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = +[NSMutableDictionary dictionary];
  id v14 = v13;
  if (v11) {
    [v13 setObject:v11 forKeyedSubscript:IDSSendMessageOptionFromIDKey];
  }
  id v15 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v12 type:v8 isResponse:0];

  v16 = [(KTIDSSessionHandler *)self service];
  id v22 = 0;
  unsigned __int8 v17 = [v16 sendProtobuf:v15 toDestinations:v10 priority:300 options:v14 identifier:0 error:&v22];
  id v18 = v22;

  if ((v17 & 1) == 0)
  {
    v19 = [v10 allObjects];
    v20 = [v19 componentsJoinedByString:@","];

    os_log_t v21 = [(KTIDSSessionHandler *)self oslog];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110658;
      int v24 = v8;
      __int16 v25 = 2160;
      uint64_t v26 = 1752392040;
      __int16 v27 = 2112;
      v28 = v20;
      __int16 v29 = 2160;
      uint64_t v30 = 1752392040;
      __int16 v31 = 2112;
      id v32 = v11;
      __int16 v33 = 2160;
      uint64_t v34 = 1752392040;
      __int16 v35 = 2112;
      id v36 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%d send sendProtobuf to %{mask.hash}@ from %{mask.hash}@ failed with: %{mask.hash}@", buf, 0x44u);
    }
  }
}

- (void)sasTTR:(id)a3 toHandle:(id)a4 pushToken:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  if (a5)
  {
    uint64_t v9 = +[NSString stringWithFormat:@"token:%@/%@", a5, v8];

    id v8 = (id)v9;
  }
  [(KTIDSSessionHandler *)self sendMessage:7 data:v10 toID:v8 sourceID:0];
}

- (id)mapMailbox:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 mapMailbox];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)findSessionByHandle:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100008920;
  v16 = sub_100008930;
  id v17 = 0;
  v5 = [(KTIDSSessionHandler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008938;
  block[3] = &unk_10008CE88;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)findSessionByID:(id)a3
{
  id v4 = a3;
  v5 = +[NSData kt_dataWithHexString:](NSData, "kt_dataWithHexString:", [v4 UTF8String]);
  if (v5)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = sub_100008920;
    id v17 = sub_100008930;
    id v18 = 0;
    id v6 = [(KTIDSSessionHandler *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008B74;
    block[3] = &unk_10008CE88;
    uint64_t v12 = &v13;
    block[4] = self;
    id v11 = v5;
    dispatch_sync(v6, block);

    id v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = [(KTIDSSessionHandler *)self oslog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100068270();
    }

    id v7 = 0;
  }

  return v7;
}

- (id)listSessions
{
  uint64_t v3 = +[NSMutableArray array];
  id v4 = [(KTIDSSessionHandler *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008CD8;
  v9[3] = &unk_10008CEB0;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(v4, v9);

  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (BOOL)deleteSessionByID:(id)a3
{
  id v4 = a3;
  id v5 = [(KTIDSSessionHandler *)self oslog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deleting sessionID: [%{public}@]", (uint8_t *)&buf, 0xCu);
  }

  id v6 = v4;
  id v7 = +[NSData kt_dataWithHexString:](NSData, "kt_dataWithHexString:", [v6 UTF8String]);
  if (v7)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    id v8 = [(KTIDSSessionHandler *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009004;
    block[3] = &unk_10008CED8;
    block[4] = self;
    id v13 = v7;
    p_long long buf = &buf;
    dispatch_sync(v8, block);

    BOOL v9 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v10 = [(KTIDSSessionHandler *)self oslog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000682FC();
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (void)sendMessage:(unsigned __int16)a3 data:(id)a4 mailbox:(id)a5 fromID:(id)a6
{
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(KTIDSSessionHandler *)self queue];
  dispatch_assert_queue_V2(v13);

  uint64_t v14 = [v11 peer];

  if (v14)
  {
    if (!v12)
    {
      uint64_t v15 = [v11 peer];
      id v12 = [v15 peer];
    }
    uint64_t v16 = [v11 peer];
    char v17 = [v16 lastUsedAddressOfMe];
    [(KTIDSSessionHandler *)self sendMessage:v8 data:v10 toID:v12 sourceID:v17];
  }
  else
  {
    id v18 = [(KTIDSSessionHandler *)self oslog];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000683EC(v8, v18);
    }
  }
}

- (void)sendMessage:(unsigned __int16)a3 data:(id)a4 toID:(id)a5 sourceID:(id)a6
{
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)IDSCopyBestGuessIDForID();
  if (v13)
  {
    if (v12) {
      uint64_t v14 = IDSCopyBestGuessIDForID();
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v15 = [(KTIDSSessionHandler *)self oslog];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18[0] = 67110658;
      v18[1] = v8;
      __int16 v19 = 2160;
      uint64_t v20 = 1752392040;
      __int16 v21 = 2112;
      id v22 = v13;
      __int16 v23 = 2160;
      uint64_t v24 = 1752392040;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      __int16 v27 = 2160;
      uint64_t v28 = 1752392040;
      __int16 v29 = 2112;
      id v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "sending message %d to: %{mask.hash}@ from: %{mask.hash}@[%{mask.hash}@]", (uint8_t *)v18, 0x44u);
    }

    uint64_t v16 = [(KTIDSSessionHandler *)self transport];
    char v17 = +[NSSet setWithObject:v13];
    [v16 sendMessage:v8 data:v10 targets:v17 fromHandle:v14];
  }
  else
  {
    uint64_t v14 = [(KTIDSSessionHandler *)self oslog];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100068468(v8, (uint64_t)v11, v14);
    }
  }
}

- (id)setupMailbox:(id)a3 publicInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = sub_100008920;
  id v22 = sub_100008930;
  id v23 = 0;
  uint64_t v8 = [(KTIDSSessionHandler *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100009518;
  v13[3] = &unk_10008CF00;
  id v14 = v6;
  uint64_t v15 = self;
  id v16 = v7;
  char v17 = &v18;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (void)resetSession:(id)a3
{
  id v4 = a3;
  [(KTIDSSessionHandler *)self removeSessionIDLookup:v4];
  [v4 reset];
}

- (BOOL)startSession:(id)a3
{
  return 1;
}

- (BOOL)validateAnnounce:(id)a3 updateSession:(id)a4
{
  return 1;
}

- (void)tearDown:(id)a3 toID:(id)a4 fromID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_alloc_init(SASTeardown);
  [(SASTeardown *)v12 setSessionId:v10];

  id v11 = [(TransparencyGPBMessage *)v12 data];
  [(KTIDSSessionHandler *)self sendMessage:3 data:v11 toID:v9 sourceID:v8];
}

- (void)ktAnnounce:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a6;
  id v10 = a3;
  id v11 = [(KTIDSSessionHandler *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)IDSCopyAddressDestinationForDestination();
  [(KTIDSSessionHandler *)self dumpState:@"SASAnnounce"];
  id v13 = [(KTIDSSessionHandler *)self idsHandleLookup];
  id v14 = [v13 objectForKeyedSubscript:v12];

  if (v14)
  {
    uint64_t v15 = [(SKMailbox *)v14 destinationIDSID];
    if (v15
      && (id v16 = (void *)v15,
          [(SKMailbox *)v14 destinationIDSID],
          char v17 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v18 = [v17 isEqual:v9],
          v17,
          v16,
          (v18 & 1) == 0))
    {
      [(KTIDSSessionHandler *)self resetSession:v14];
    }
    else
    {
      __int16 v19 = [(SKMailbox *)v14 destinationIDSID];

      if (v19) {
        goto LABEL_11;
      }
    }
    [(SKMailbox *)v14 setDestinationIDSID:v9];
  }
  else
  {
    uint64_t v20 = [(KTIDSSessionHandler *)self oslog];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 141558274;
      uint64_t v28 = 1752392040;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "ktAnnounce: new session: %{mask.hash}@", (uint8_t *)&v27, 0x16u);
    }

    __int16 v21 = [SKMailbox alloc];
    id v22 = [(KTIDSSessionHandler *)self oslog];
    id v14 = [(SKMailbox *)v21 initWithLogging:v22 publicInfo:0 peerIDSID:v12 session:self];

    [(SKMailbox *)v14 setDestinationIDSID:v9];
    id v23 = [objc_alloc((Class)KTStaticKeyPeer) initWithPeer:v12];
    [(SKMailbox *)v14 setPeer:v23];
    uint64_t v24 = [(KTIDSSessionHandler *)self idsHandleLookup];
    [v24 setObject:v14 forKeyedSubscript:v12];
  }
LABEL_11:
  __int16 v25 = [(KTIDSSessionHandler *)self oslog];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 141558274;
    uint64_t v28 = 1752392040;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "ktAnnounce: %{mask.hash}@", (uint8_t *)&v27, 0x16u);
  }

  uint64_t v26 = [v10 data];

  [(SKMailbox *)v14 recvAnnounce:v26];
}

- (void)ktSelected:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  id v12 = a3;
  id v13 = [(KTIDSSessionHandler *)self queue];
  dispatch_assert_queue_V2(v13);

  id v14 = [SASSelected alloc];
  uint64_t v15 = [v12 data];

  id v16 = [(TransparencyGPBMessage *)v14 initWithData:v15 error:0];
  char v17 = [(SASSelected *)v16 sessionId];
  id v18 = [v17 length];

  if (v18)
  {
    __int16 v19 = [(KTIDSSessionHandler *)self oslog];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [(SASSelected *)v16 sessionId];
      __int16 v21 = [v20 kt_hexString];
      *(_DWORD *)long long buf = 141558530;
      uint64_t v34 = 1752392040;
      __int16 v35 = 2112;
      id v36 = v10;
      __int16 v37 = 2114;
      uint64_t v38 = (uint64_t)v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "ktSelected: session: %{mask.hash}@ - %{public}@", buf, 0x20u);
    }
    id v22 = (void *)IDSCopyAddressDestinationForDestination();
    id v23 = [(KTIDSSessionHandler *)self idsHandleLookup];
    uint64_t v24 = [v23 objectForKeyedSubscript:v22];

    if (!v24)
    {
      __int16 v25 = [(KTIDSSessionHandler *)self oslog];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = [v11 toID];
        *(_DWORD *)long long buf = 141558786;
        uint64_t v34 = 1752392040;
        __int16 v35 = 2112;
        id v36 = v10;
        __int16 v37 = 2160;
        uint64_t v38 = 1752392040;
        __int16 v39 = 2112;
        v40 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "ktSelected: teardown %{mask.hash}@ %{mask.hash}@", buf, 0x2Au);
      }
      int v27 = [(SASSelected *)v16 sessionId];
      uint64_t v28 = [v11 toID];
      [(KTIDSSessionHandler *)self tearDown:v27 toID:v10 fromID:v28];
    }
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10000A294;
    v30[3] = &unk_10008CEB0;
    id v31 = v24;
    id v32 = v16;
    id v29 = v24;
    [(KTIDSSessionHandler *)self runIfHaveContact:v22 complete:v30];
  }
}

- (void)ktCommit:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [(KTIDSSessionHandler *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)IDSCopyAddressDestinationForDestination();
  [(KTIDSSessionHandler *)self dumpState:@"ktCommit"];
  id v13 = [(KTIDSSessionHandler *)self oslog];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 141558274;
    uint64_t v22 = 1752392040;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ktCommit: %{mask.hash}@", buf, 0x16u);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000A44C;
  v17[3] = &unk_10008CF28;
  v17[4] = self;
  id v18 = v12;
  id v19 = v10;
  id v20 = v9;
  id v14 = v9;
  id v15 = v10;
  id v16 = v12;
  [(KTIDSSessionHandler *)self runIfHaveContact:v16 complete:v17];
}

- (void)runIfHaveContact:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(KTIDSSessionHandler *)self transparencyd];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A640;
  v11[3] = &unk_10008CF50;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 haveContact:v10 complete:v11];
}

- (void)ktSetupB:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [(KTIDSSessionHandler *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)IDSCopyAddressDestinationForDestination();
  [(KTIDSSessionHandler *)self dumpState:@"ktSetupB"];
  id v13 = [(KTIDSSessionHandler *)self oslog];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 141558274;
    uint64_t v21 = 1752392040;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ktSetupB: %{mask.hash}@", buf, 0x16u);
  }

  id v14 = [(KTIDSSessionHandler *)self idsHandleLookup];
  id v15 = [v14 objectForKeyedSubscript:v12];

  if (v15)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000A96C;
    v17[3] = &unk_10008CEB0;
    id v18 = v15;
    id v19 = v9;
    [(KTIDSSessionHandler *)self runIfHaveContact:v12 complete:v17];

    id v16 = v18;
  }
  else
  {
    id v16 = [(KTIDSSessionHandler *)self oslog];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 141558274;
      uint64_t v21 = 1752392040;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "mb not found for %{mask.hash}@", buf, 0x16u);
    }
  }
}

- (void)ktRevealA:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [(KTIDSSessionHandler *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(KTIDSSessionHandler *)self oslog];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v22 = (uint64_t)v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "ktRevealA %{public}@", buf, 0xCu);
  }

  [(KTIDSSessionHandler *)self dumpState:@"ktRevealA"];
  id v13 = (void *)IDSCopyAddressDestinationForDestination();
  id v14 = [(KTIDSSessionHandler *)self oslog];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 141558274;
    uint64_t v22 = 1752392040;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ktRevealA: %{mask.hash}@", buf, 0x16u);
  }

  id v15 = [(KTIDSSessionHandler *)self idsHandleLookup];
  id v16 = [v15 objectForKeyedSubscript:v13];

  if (v16)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    _DWORD v18[2] = sub_10000AC00;
    v18[3] = &unk_10008CEB0;
    id v19 = v16;
    id v20 = v9;
    [(KTIDSSessionHandler *)self runIfHaveContact:v13 complete:v18];

    char v17 = v19;
  }
  else
  {
    char v17 = [(KTIDSSessionHandler *)self oslog];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10006858C();
    }
  }
}

- (void)ktConfirm:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [(KTIDSSessionHandler *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)IDSCopyAddressDestinationForDestination();
  id v13 = [(KTIDSSessionHandler *)self oslog];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 141558274;
    uint64_t v22 = 1752392040;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ktConfirm %{mask.hash}@", buf, 0x16u);
  }

  [(KTIDSSessionHandler *)self dumpState:@"ktConfirm"];
  id v14 = [(KTIDSSessionHandler *)self oslog];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 141558274;
    uint64_t v22 = 1752392040;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ktConfirm: %{mask.hash}@", buf, 0x16u);
  }

  id v15 = [(KTIDSSessionHandler *)self idsHandleLookup];
  id v16 = [v15 objectForKeyedSubscript:v12];

  if (v16)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    _DWORD v18[2] = sub_10000AEA4;
    v18[3] = &unk_10008CEB0;
    id v19 = v16;
    id v20 = v9;
    [(KTIDSSessionHandler *)self runIfHaveContact:v12 complete:v18];

    char v17 = v19;
  }
  else
  {
    char v17 = [(KTIDSSessionHandler *)self oslog];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10006858C();
    }
  }
}

- (void)ktTeardown:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [(KTIDSSessionHandler *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(KTIDSSessionHandler *)self oslog];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 141558274;
    uint64_t v28 = 1752392040;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ktTeardown %{mask.hash}@", buf, 0x16u);
  }

  id v13 = (void *)IDSCopyAddressDestinationForDestination();
  id v14 = [(KTIDSSessionHandler *)self idsHandleLookup];
  id v15 = [v14 objectForKeyedSubscript:v13];

  if (v15)
  {
    id v16 = [SASTeardown alloc];
    char v17 = [v9 data];
    id v18 = [(TransparencyGPBMessage *)v16 initWithData:v17 error:0];

    if (!v18
      || ([v18 sessionId],
          id v19 = objc_claimAutoreleasedReturnValue(),
          v19,
          !v19))
    {
      uint64_t v22 = [(KTIDSSessionHandler *)self oslog];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100068628();
      }
      goto LABEL_18;
    }
    id v20 = [v15 peerSessionID];
    uint64_t v21 = [v18 sessionId];
    if ([v20 isEqual:v21])
    {
    }
    else
    {
      __int16 v23 = [v15 localSessionID];
      id v24 = [v18 sessionId];
      unsigned int v26 = [v23 isEqual:v24];

      if (!v26)
      {
        uint64_t v22 = [(KTIDSSessionHandler *)self oslog];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100068690(v18, v15, v22);
        }
        goto LABEL_18;
      }
    }
    __int16 v25 = [(KTIDSSessionHandler *)self oslog];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "ktTeardown: session match, tearing down", buf, 2u);
    }

    uint64_t v22 = [v9 data];
    [v15 recvTeardown:v22];
LABEL_18:

    goto LABEL_19;
  }
  id v18 = [(KTIDSSessionHandler *)self oslog];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_1000685C0();
  }
LABEL_19:
}

- (void)ktTTR:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a3;
  id v10 = a6;
  if (_os_feature_enabled_impl())
  {
    if (+[TransparencyAnalytics hasInternalDiagnostics])
    {
      id v11 = IDSCopyAddressDestinationForDestination();
      id v12 = [v9 data];
      id v20 = 0;
      id v13 = +[SASValidateTTRMessage validateWithMessage:v12 error:&v20];
      id v14 = v20;

      if (v13)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10000B444;
        v17[3] = &unk_10008CFA0;
        void v17[4] = self;
        id v18 = v13;
        id v19 = v11;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10000B578;
        v16[3] = &unk_10008CF78;
        v16[4] = self;
        +[TransparencyXPCConnection invokeIDSSupportWithBlock:v17 errorHandler:v16];
      }
      else
      {
        id v15 = [(KTIDSSessionHandler *)self oslog];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1000687B0();
        }
      }
    }
    else
    {
      id v11 = [(KTIDSSessionHandler *)self oslog];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100068818();
      }
    }
  }
  else
  {
    id v11 = [(KTIDSSessionHandler *)self oslog];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10006884C();
    }
  }
}

+ (int64_t)compareLocalSessionID:(id)a3 remoteSessionID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqual:v6])
  {
    int64_t v7 = 2;
  }
  else
  {
    id v8 = [v5 length];
    if (v8 <= [v6 length])
    {
      id v9 = [v5 length];
      if (v9 >= [v6 length])
      {
        id v10 = [v5 bytes];
        id v11 = v6;
        int64_t v7 = memcmp(v10, [v11 bytes], (size_t)[v11 length]) >> 31;
      }
      else
      {
        int64_t v7 = 0;
      }
    }
    else
    {
      int64_t v7 = 1;
    }
  }

  return v7;
}

- (void)addMailbox:(id)a3
{
  id v4 = a3;
  id v5 = [(KTIDSSessionHandler *)self sessionIDLookup];
  id v6 = [v4 handleID];
  [v5 setObject:v4 forKeyedSubscript:v6];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int64_t v7 = [v4 peerHandles];
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v11);
        id v13 = [(KTIDSSessionHandler *)self idsHandleLookup];
        [v13 setObject:v4 forKeyedSubscript:v12];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)removeAddressLookup:(id)a3
{
  id v4 = a3;
  if (([v4 deletedHandles] & 1) == 0)
  {
    [v4 setDeletedHandles:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [v4 peerHandles];
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v9);
          id v11 = [(KTIDSSessionHandler *)self idsHandleLookup];
          [v11 setObject:0 forKeyedSubscript:v10];

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)removeSessionIDLookup:(id)a3
{
  id v4 = a3;
  id v6 = [(KTIDSSessionHandler *)self sessionIDLookup];
  id v5 = [v4 handleID];

  [v6 setObject:0 forKeyedSubscript:v5];
}

- (void)removeMailbox:(id)a3
{
  id v4 = a3;
  id v5 = [(KTIDSSessionHandler *)self oslog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 negotiatedSessionID];
    id v7 = [v6 kt_hexString];
    uint64_t v8 = [v4 localSessionID];
    id v9 = [v8 kt_hexString];
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2114;
    long long v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "removing session %{public}@, local-session %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [(KTIDSSessionHandler *)self removeAddressLookup:v4];
  [(KTIDSSessionHandler *)self removeSessionIDLookup:v4];
  [v4 sendTeardown];
}

- (void)dumpState:(id)a3
{
  id v4 = a3;
  id v5 = [(KTIDSSessionHandler *)self oslog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "session handler-lookup state: %{public}@", buf, 0xCu);
  }

  id v6 = [(KTIDSSessionHandler *)self idsHandleLookup];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000BC40;
  v7[3] = &unk_10008CFC8;
  v7[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)negotiatedSessionID:(id)a3 forMailbox:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KTIDSSessionHandler *)self sessionIDLookup];
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (void)haveContact:(id)a3 complete:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000BEE4;
  v9[3] = &unk_10008CFF0;
  int v10 = self;
  id v11 = a3;
  id v12 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C080;
  v7[3] = &unk_10008D018;
  v7[4] = v10;
  id v8 = v12;
  id v5 = v12;
  id v6 = v11;
  +[TransparencyXPCConnection invokeIDSSupportWithBlock:v9 errorHandler:v7];
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setService:(id)a3
{
}

- (KTIDSSessionTransport)transport
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transport);

  return (KTIDSSessionTransport *)WeakRetained;
}

- (void)setTransport:(id)a3
{
}

- (OS_os_log)oslog
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOslog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)sessionIDLookup
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSessionIDLookup:(id)a3
{
}

- (NSMutableDictionary)idsHandleLookup
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIdsHandleLookup:(id)a3
{
}

- (KTIDSTransparencyConnection)transparencyd
{
  return (KTIDSTransparencyConnection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTransparencyd:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyd, 0);
  objc_storeStrong((id *)&self->_idsHandleLookup, 0);
  objc_storeStrong((id *)&self->_sessionIDLookup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_oslog, 0);
  objc_destroyWeak((id *)&self->_transport);

  objc_storeStrong((id *)&self->_service, 0);
}

@end