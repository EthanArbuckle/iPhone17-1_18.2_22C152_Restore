@interface NRLinkQuickRelay
- (BOOL)cancelWithReason:(id)a3;
- (BOOL)resume;
- (BOOL)sendControlData:(id)a3;
- (BOOL)sendPacketData:(id)a3;
- (BOOL)start;
- (BOOL)suspend;
- (NWDatagramConnection)connection;
- (id)copyStatusString;
- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5;
- (unsigned)metric;
- (void)acceptNewFlow:(id)a3 fromNexus:(id)a4 completionHandler:(id)a5;
- (void)invalidateIKESessionForClass:(unsigned __int8)a3;
- (void)invalidateLink;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withOptions:(id)a7;
- (void)session:(id)a3 didReceiveData:(id)a4;
- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4;
- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5;
- (void)sessionStarted:(id)a3;
- (void)setConnection:(id)a3;
- (void)setPacketReceiver:(id)a3;
@end

@implementation NRLinkQuickRelay

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_linkAnalytics + 7), 0);
  objc_storeStrong((id *)((char *)&self->_pathEvaluator + 7), 0);
  objc_storeStrong((id *)((char *)&self->_receivedIKEPackets + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionTimeoutSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_linkIdleTimerSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeClassDEstablishedTime + 7), 0);
  objc_storeStrong((id *)((char *)&self->_receivedDatagrams + 7), 0);
  objc_storeStrong((id *)((char *)&self->_nexusGroup + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dNexusWriteSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dNexusReadSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_nexusOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_packetNexus + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassC + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassD + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeListener + 7), 0);
  objc_storeStrong((id *)((char *)&self->_idsSessionStartTime + 7), 0);
  objc_storeStrong((id *)((char *)&self->_idsDestination + 7), 0);
  objc_storeStrong((id *)((char *)&self->_idsSession + 7), 0);
  objc_storeStrong((id *)((char *)&self->_idsService + 7), 0);

  objc_storeStrong((id *)(&self->_ikeSessionTimeoutScheduledOnce + 1), 0);
}

- (void)setConnection:(id)a3
{
}

- (NWDatagramConnection)connection
{
  return *(NWDatagramConnection **)((char *)&self->_linkAnalytics + 7);
}

- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  v7 = [(NRLink *)self queue];
  dispatch_assert_queue_V2(v7);

  if ([(NRLink *)self state] == 255)
  {
    v13 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_13;
    }
LABEL_11:
    v11 = (void *)_NRCopyLogObjectForNRUUID();
    id v16 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();

LABEL_12:
    goto LABEL_13;
  }
  if (v19)
  {
    if (self) {
      id v8 = *(IDSService **)((char *)&self->_idsService + 7);
    }
    else {
      id v8 = 0;
    }
    v9 = (void *)_NRCopyLogObjectForNRUUID();
    if (v8 != v19)
    {
      int v10 = _NRLogIsLevelEnabled();

      if (!v10) {
        goto LABEL_13;
      }
      v11 = (void *)_NRCopyLogObjectForNRUUID();
      id v12 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();

      goto LABEL_12;
    }
    int v15 = _NRLogIsLevelEnabled();

    if (!v15) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  id v17 = sub_10003B168();
  int v18 = _NRLogIsLevelEnabled();

  if (v18)
  {
    v11 = sub_10003B168();
    _NRLogWithArgs();
    goto LABEL_12;
  }
LABEL_13:
}

- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  v7 = [(NRLink *)self queue];
  dispatch_assert_queue_V2(v7);

  if ([(NRLink *)self state] == 255)
  {
    v13 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_13;
    }
LABEL_11:
    v11 = (void *)_NRCopyLogObjectForNRUUID();
    id v16 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();

LABEL_12:
    goto LABEL_13;
  }
  if (v19)
  {
    if (self) {
      id v8 = *(IDSService **)((char *)&self->_idsService + 7);
    }
    else {
      id v8 = 0;
    }
    v9 = (void *)_NRCopyLogObjectForNRUUID();
    if (v8 != v19)
    {
      int v10 = _NRLogIsLevelEnabled();

      if (!v10) {
        goto LABEL_13;
      }
      v11 = (void *)_NRCopyLogObjectForNRUUID();
      id v12 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();

      goto LABEL_12;
    }
    int v15 = _NRLogIsLevelEnabled();

    if (!v15) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  id v17 = sub_10003B168();
  int v18 = _NRLogIsLevelEnabled();

  if (v18)
  {
    v11 = sub_10003B168();
    _NRLogWithArgs();
    goto LABEL_12;
  }
LABEL_13:
}

- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  v7 = [(NRLink *)self queue];
  dispatch_assert_queue_V2(v7);

  if ([(NRLink *)self state] == 255)
  {
    v13 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_13;
    }
LABEL_11:
    v11 = (void *)_NRCopyLogObjectForNRUUID();
    id v16 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();

LABEL_12:
    goto LABEL_13;
  }
  if (v19)
  {
    if (self) {
      id v8 = *(IDSService **)((char *)&self->_idsService + 7);
    }
    else {
      id v8 = 0;
    }
    v9 = (void *)_NRCopyLogObjectForNRUUID();
    if (v8 != v19)
    {
      int v10 = _NRLogIsLevelEnabled();

      if (!v10) {
        goto LABEL_13;
      }
      v11 = (void *)_NRCopyLogObjectForNRUUID();
      id v12 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();

      goto LABEL_12;
    }
    int v15 = _NRLogIsLevelEnabled();

    if (!v15) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  id v17 = sub_10003B168();
  int v18 = _NRLogIsLevelEnabled();

  if (v18)
  {
    v11 = sub_10003B168();
    _NRLogWithArgs();
    goto LABEL_12;
  }
LABEL_13:
}

- (void)session:(id)a3 didReceiveData:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  v7 = [(NRLink *)self queue];
  dispatch_assert_queue_V2(v7);

  if ([(NRLink *)self state] == 255)
  {
    id v17 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (!v26)
  {
    id v21 = sub_10003B168();
    int v22 = _NRLogIsLevelEnabled();

    if (!v22) {
      goto LABEL_14;
    }
    goto LABEL_20;
  }
  if (!v6)
  {
    id v23 = sub_10003B168();
    int v24 = _NRLogIsLevelEnabled();

    if (!v24) {
      goto LABEL_14;
    }
LABEL_20:
    id v19 = sub_10003B168();
    _NRLogWithArgs();
    goto LABEL_13;
  }
  if (self) {
    id v8 = *(IDSService **)((char *)&self->_idsService + 7);
  }
  else {
    id v8 = 0;
  }
  v9 = [v8 sessionID];
  unsigned __int8 v10 = [v9 isEqualToString:v26];

  if ((v10 & 1) == 0)
  {
    v11 = (void *)_NRCopyLogObjectForNRUUID();
    int v12 = _NRLogIsLevelEnabled();

    if (v12)
    {
      v13 = (void *)_NRCopyLogObjectForNRUUID();
      id v14 = [(NRLink *)self copyDescription];
      v25 = [*(id *)((char *)&self->_idsService + 7) sessionID];
      _NRLogWithArgs();
    }
  }
  int v15 = (void *)_NRCopyLogObjectForNRUUID();
  int v16 = _NRLogIsLevelEnabled();

  if (v16)
  {
LABEL_12:
    id v19 = (void *)_NRCopyLogObjectForNRUUID();
    id v20 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();

LABEL_13:
  }
LABEL_14:
}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v49 = a3;
  id v8 = a5;
  v9 = [(NRLink *)self queue];
  dispatch_assert_queue_V2(v9);

  if ([(NRLink *)self state] == 255)
  {
    int v18 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v20 = (void *)_NRCopyLogObjectForNRUUID();
      id v44 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
  }
  else
  {
    if (v49)
    {
      unsigned __int8 v10 = [v49 sessionID];
      v11 = v10;
      if (self)
      {
        id v12 = objc_alloc_init((Class)NSMutableDictionary);
        [v12 setObject:&off_1001D4930 forKeyedSubscript:@"State"];
        [v12 setObject:v11 forKeyedSubscript:@"SessionID"];
        sub_100114390(@"IDS Session", v12);

        [(NRLink *)self reportEvent:10009, @"%@, %u, %@", v49, v6, v8 detailsFormat];
        id v13 = *(IDSService **)((char *)&self->_idsService + 7);
      }
      else
      {

        [0 reportEvent:10009, @"%@, %u, %@", v49, v6, v8 detailsFormat];
        id v13 = 0;
      }
      id v14 = (void *)_NRCopyLogObjectForNRUUID();
      if (v13 != v49)
      {
        int v15 = _NRLogIsLevelEnabled();

        if (v15)
        {
          int v16 = (void *)_NRCopyLogObjectForNRUUID();
          id v17 = [(NRLink *)self copyDescription];
          _NRLogWithArgs();
        }
        goto LABEL_37;
      }
      int v21 = _NRLogIsLevelEnabled();

      if (v21)
      {
        int v22 = (void *)_NRCopyLogObjectForNRUUID();
        uint64_t v41 = 2529;
        id v43 = [(NRLink *)self copyDescription];
        uint64_t v47 = v6;
        id v48 = v8;
        id v46 = v49;
        v37 = "";
        v39 = "-[NRLinkQuickRelay sessionEnded:withReason:error:]";
        _NRLogWithArgs();
      }
      self->_idsSessionStarted = 0;
      self->_invitationInProgress = 0;
      uint64_t v23 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
      if (!v23) {
        goto LABEL_20;
      }
      if (*(void *)(v23 + 144))
      {
        uint64_t v24 = mach_absolute_time();
        uint64_t v25 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (!v25)
        {
LABEL_20:
          uint64_t v27 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
          if (v27) {
            *(_DWORD *)(v27 + 100) = v6;
          }
          if (self->_dNexusReadSourceSuspended)
          {
            dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusOutputRing + 7));
            self->_dNexusReadSourceSuspended = 0;
          }
          if (v6 == 21
            && ([(NRLink *)self ikeClassCEstablished]
             || [(NRLink *)self ikeClassDEstablished]))
          {
            sub_10003BE54(self);
          }
          else
          {
            if ([(NRLink *)self ikeClassCEstablished]
              || [(NRLink *)self ikeClassDEstablished])
            {
              v28 = (void *)_NRCopyLogObjectForNRUUID();
              int v29 = _NRLogIsLevelEnabled();

              if (v29)
              {
                v30 = (void *)_NRCopyLogObjectForNRUUID();
                uint64_t v42 = 2559;
                id v45 = [(NRLink *)self copyDescription];
                v38 = "";
                v40 = "-[NRLinkQuickRelay sessionEnded:withReason:error:]";
                _NRLogWithArgs();
              }
              sub_10003BF74((uint64_t)self);
            }
            else
            {
              v31 = (void *)_NRCopyLogObjectForNRUUID();
              int v32 = _NRLogIsLevelEnabled();

              if (v32)
              {
                v33 = (void *)_NRCopyLogObjectForNRUUID();
                uint64_t v42 = 2564;
                id v45 = [(NRLink *)self copyDescription];
                v38 = "";
                v40 = "-[NRLinkQuickRelay sessionEnded:withReason:error:]";
                _NRLogWithArgs();
              }
              sub_10003BF74((uint64_t)self);
              [(NRLinkQuickRelay *)self invalidateIKESessionForClass:4];
              [(NRLinkQuickRelay *)self invalidateIKESessionForClass:3];
            }
            [(NRLinkQuickRelay *)self suspend];
          }
          goto LABEL_37;
        }
        id v26 = &OBJC_IVAR___NRAnalyticsCmpnLinkQuickRelay__idsSessionEnd;
      }
      else
      {
        if (!*(void *)(v23 + 112)) {
          goto LABEL_20;
        }
        *(unsigned char *)(v23 + 96) = 1;
        uint64_t v24 = mach_absolute_time();
        uint64_t v25 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (!v25) {
          goto LABEL_20;
        }
        id v26 = &OBJC_IVAR___NRAnalyticsCmpnLinkQuickRelay__idsSessionSendInvitationEnd;
      }
      *(void *)(v25 + *v26) = v24;
      goto LABEL_20;
    }
    id v34 = sub_10003B168();
    int v35 = _NRLogIsLevelEnabled();

    if (v35)
    {
      id v36 = sub_10003B168();
      _NRLogWithArgs();
    }
  }
LABEL_37:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"_connection.connectionState", a4, a5, a6))
  {
    v7 = [(NRLink *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003C3A4;
    block[3] = &unk_1001C8BA8;
    block[4] = self;
    dispatch_async(v7, block);
  }
}

- (void)sessionStarted:(id)a3
{
  v5 = (IDSService *)a3;
  uint64_t v6 = [(NRLink *)self queue];
  dispatch_assert_queue_V2(v6);

  if ([(NRLink *)self state] == 255)
  {
    int v15 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v13 = (char *)_NRCopyLogObjectForNRUUID();
      id v36 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();

LABEL_24:
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (!v5)
  {
    id v28 = sub_10003B168();
    int v29 = _NRLogIsLevelEnabled();

    if (v29)
    {
      id v30 = sub_10003B168();
      _NRLogWithArgs();
    }
    goto LABEL_25;
  }
  v7 = (void *)_NRCopyLogObjectForNRUUID();
  int v8 = _NRLogIsLevelEnabled();

  if (v8)
  {
    v9 = (void *)_NRCopyLogObjectForNRUUID();
    id v35 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();
  }
  unsigned __int8 v10 = &selRef_setSharedSecret_;
  if (*(IDSService **)((char *)&self->_idsService + 7) == v5)
  {
    self->_idsSessionStarted = 1;
    self->_invitationInProgress = 0;
    self->_invitationRetryCounter = 0;
    id v13 = +[NSDate date];
    objc_storeStrong((id *)((char *)&self->_idsDestination + 7), v13);
    uint64_t v17 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
    if (!v17) {
      goto LABEL_18;
    }
    if (*(void *)(v17 + 112))
    {
      uint64_t v18 = mach_absolute_time();
      uint64_t v19 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
      if (!v19) {
        goto LABEL_18;
      }
      id v20 = &OBJC_IVAR___NRAnalyticsCmpnLinkQuickRelay__idsSessionSendInvitationEnd;
    }
    else
    {
      if (!*(void *)(v17 + 128)
        || (uint64_t v18 = mach_absolute_time(), (v19 = *(uint64_t *)((char *)&self->_pathEvaluator + 7)) == 0))
      {
LABEL_18:
        uint64_t v21 = mach_absolute_time();
        uint64_t v22 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (v22) {
          *(void *)(v22 + 144) = v21;
        }
        sub_10003C1B8(self);
        id v23 = [(NRLink *)self nrUUID];
        id v14 = sub_10013DC5C((uint64_t)NRDLocalDevice, v23);

        if (v14)
        {
          sub_100142334(v14, (NWDatagramConnection **)((char *)&self->_connection + 7));
          sub_100141A68(v14, (__uint32_t *)((char *)&self->_localAddrClassD.__u6_addr32[3] + 3));
          id v23 = *(id *)(&self->_ikeSessionTimeoutScheduledOnce + 1);
          unsigned __int8 v10 = (char **)*(id *)((char *)&self->_idsService + 7);
          v3 = [(NRLink *)self queue];
          if (qword_1001F4C08 == -1)
          {
LABEL_22:
            uint64_t v24 = (id)qword_1001F4C10;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000441D8;
            block[3] = &unk_1001C7920;
            id v39 = v23;
            v40 = v10;
            id v41 = v3;
            uint64_t v42 = self;
            id v25 = v3;
            id v26 = v10;
            id v27 = v23;
            dispatch_async(v24, block);

            goto LABEL_23;
          }
        }
        else
        {
          id v31 = sub_10003B168();
          int v32 = _NRLogIsLevelEnabled();

          id v13 = "-[NRLinkQuickRelay sessionStarted:]";
          if (v32)
          {
            id v33 = sub_10003B168();
            _NRLogWithArgs();
          }
          v5 = (IDSService *)_os_log_pack_size();
          self = (NRLinkQuickRelay *)((char *)&block[-1] - ((__chkstk_darwin(v5) + 15) & 0xFFFFFFFFFFFFFFF0));
          __error();
          uint64_t v34 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v34 = 136446210;
          *(void *)(v34 + 4) = "-[NRLinkQuickRelay sessionStarted:]";
          sub_10003B168();
          _NRLogAbortWithPack();
        }
        dispatch_once(&qword_1001F4C08, &stru_1001C7DA8);
        goto LABEL_22;
      }
      id v20 = &OBJC_IVAR___NRAnalyticsCmpnLinkQuickRelay__idsSessionReceiveInvitationEnd;
    }
    *(void *)(v19 + *v20) = v18;
    goto LABEL_18;
  }
  v11 = (void *)_NRCopyLogObjectForNRUUID();
  int v12 = _NRLogIsLevelEnabled();

  if (v12)
  {
    id v13 = (char *)_NRCopyLogObjectForNRUUID();
    id v14 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withOptions:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(NRLink *)self queue];
  dispatch_assert_queue_V2(v17);

  if ([(NRLink *)self state] != 255)
  {
    if (v12)
    {
      if (v13)
      {
        if (v14)
        {
          uint64_t v18 = (void *)_NRCopyLogObjectForNRUUID();
          int IsLevelEnabled = _NRLogIsLevelEnabled();

          if (IsLevelEnabled)
          {
            id v20 = (void *)_NRCopyLogObjectForNRUUID();
            uint64_t v58 = 2278;
            id v59 = [(NRLink *)self copyDescription];
            v56 = "";
            v57 = "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]";
            _NRLogWithArgs();
          }
          uint64_t v21 = (void *)_NRCopyLogObjectForNRUUID();
          int v22 = _NRLogIsLevelEnabled();

          if (v22)
          {
            id v23 = (void *)_NRCopyLogObjectForNRUUID();
            id v59 = [(NRLink *)self copyDescription];
            id v60 = v12;
            uint64_t v58 = 2279;
            v56 = "";
            v57 = "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]";
            _NRLogWithArgs();
          }
          uint64_t v24 = (void *)_NRCopyLogObjectForNRUUID();
          int v25 = _NRLogIsLevelEnabled();

          if (v25)
          {
            id v26 = (void *)_NRCopyLogObjectForNRUUID();
            id v59 = [(NRLink *)self copyDescription];
            id v60 = v13;
            uint64_t v58 = 2280;
            v56 = "";
            v57 = "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]";
            _NRLogWithArgs();
          }
          id v27 = (void *)_NRCopyLogObjectForNRUUID();
          int v28 = _NRLogIsLevelEnabled();

          if (v28)
          {
            int v29 = (void *)_NRCopyLogObjectForNRUUID();
            id v59 = [(NRLink *)self copyDescription];
            id v60 = v14;
            uint64_t v58 = 2281;
            v56 = "";
            v57 = "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]";
            _NRLogWithArgs();
          }
          id v30 = (void *)_NRCopyLogObjectForNRUUID();
          int v31 = _NRLogIsLevelEnabled();

          if (v31)
          {
            int v32 = (void *)_NRCopyLogObjectForNRUUID();
            id v59 = [(NRLink *)self copyDescription];
            id v60 = v15;
            uint64_t v58 = 2282;
            v56 = "";
            v57 = "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]";
            _NRLogWithArgs();
          }
          id v33 = (void *)_NRCopyLogObjectForNRUUID();
          int v34 = _NRLogIsLevelEnabled();

          if (v34)
          {
            id v35 = (void *)_NRCopyLogObjectForNRUUID();
            id v59 = [(NRLink *)self copyDescription];
            id v60 = v16;
            uint64_t v58 = 2283;
            v56 = "";
            v57 = "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]";
            _NRLogWithArgs();
          }
          id v36 = [v14 sessionID:v56, v57, v58, v59, v60];
          id v37 = objc_alloc_init((Class)NSMutableDictionary);
          [v37 setObject:&off_1001D4900 forKeyedSubscript:@"State"];
          [v37 setObject:v36 forKeyedSubscript:@"SessionID"];
          sub_100114390(@"IDS Session", v37);

          [(NRLink *)self reportEvent:10004, @"%@", v14 detailsFormat];
          v38 = [*(id *)(&self->_ikeSessionTimeoutScheduledOnce + 1) deviceForFromID:v15];
          if ([v38 isDefaultPairedDevice])
          {
            if (self->_invitationInProgress)
            {
              id v39 = *(id *)((char *)&self->_pathEvaluator + 7);
              if (v39) {
                ++v39[13];
              }

              [(NRLink *)self reportEvent:10005, @"Cancelling sent: %@, keep received: %@", *(IDSService **)((char *)&self->_idsService + 7), v14 detailsFormat];
              [(NRLink *)self reportEvent:10007, @"%@", *(IDSService **)((char *)&self->_idsService + 7) detailsFormat];
              [*(id *)((char *)&self->_idsService + 7) cancelInvitation];
              uint64_t v40 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
              if (v40) {
                *(void *)(v40 + 112) = 0;
              }
            }
            if (*(IDSService **)((char *)&self->_idsService + 7))
            {
              [(NRLink *)self reportEvent:10019];
              sub_10003BF74((uint64_t)self);
            }
            objc_storeStrong((id *)((char *)&self->_idsService + 7), a5);
            self->_idsSessionIsIncoming = 1;
            id v41 = *(id *)((char *)&self->_idsService + 7);
            uint64_t v42 = [(NRLink *)self queue];
            [v41 setDelegate:self queue:v42];

            uint64_t v61 = IDSSessionForceInternetInvitationKey;
            v62 = &__kCFBooleanTrue;
            id v43 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
            [v14 setPreferences:v43];

            [v14 acceptInvitation];
            [(NRLink *)self reportEvent:10006, @"%@", *(IDSService **)((char *)&self->_idsService + 7) detailsFormat];
            uint64_t v44 = mach_absolute_time();
            uint64_t v45 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
            if (v45) {
              *(void *)(v45 + 128) = v44;
            }
          }
          else
          {
            [(NRLink *)self reportEvent:10026, @"Remote device is not the default paired device: %@/%@", v14, v15 detailsFormat];
            [v14 declineInvitation];
          }

          goto LABEL_32;
        }
        id v53 = sub_10003B168();
        int v54 = _NRLogIsLevelEnabled();

        if (!v54) {
          goto LABEL_32;
        }
      }
      else
      {
        id v51 = sub_10003B168();
        int v52 = _NRLogIsLevelEnabled();

        if (!v52) {
          goto LABEL_32;
        }
      }
    }
    else
    {
      id v49 = sub_10003B168();
      int v50 = _NRLogIsLevelEnabled();

      if (!v50) {
        goto LABEL_32;
      }
    }
    id v55 = sub_10003B168();
    _NRLogWithArgs();

    goto LABEL_32;
  }
  id v46 = (void *)_NRCopyLogObjectForNRUUID();
  int v47 = _NRLogIsLevelEnabled();

  if (v47)
  {
    id v48 = (void *)_NRCopyLogObjectForNRUUID();
    id v59 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();
  }
  [(NRLink *)self reportEvent:10026, @"Link is cancelled: %@/%@/%@", self, v14, v15, v59 detailsFormat];
  [v14 declineInvitation];
LABEL_32:
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14 = a3;
  id v15 = (char *)a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v18 = (unsigned int (**)(void, void *))a7;
  id v19 = a8;
  id v20 = (void (**)(void, void, void, void))v19;
  if (!v14)
  {
    id v102 = sub_10003B168();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_24;
    }
LABEL_76:
    id v112 = sub_10003B168();
    _NRLogWithArgs();

    goto LABEL_24;
  }
  if (!v15)
  {
    id v104 = sub_10003B168();
    int v105 = _NRLogIsLevelEnabled();

    if (!v105) {
      goto LABEL_24;
    }
    goto LABEL_76;
  }
  if (!v16)
  {
    id v106 = sub_10003B168();
    int v107 = _NRLogIsLevelEnabled();

    if (!v107) {
      goto LABEL_24;
    }
    goto LABEL_76;
  }
  if (!v18)
  {
    id v108 = sub_10003B168();
    int v109 = _NRLogIsLevelEnabled();

    if (!v109) {
      goto LABEL_24;
    }
    goto LABEL_76;
  }
  if (!v19)
  {
    id v110 = sub_10003B168();
    int v111 = _NRLogIsLevelEnabled();

    if (!v111) {
      goto LABEL_24;
    }
    goto LABEL_76;
  }
  uint64_t v21 = [(NRLink *)self queue];
  dispatch_assert_queue_V2(v21);

  int v22 = (void *)_NRCopyLogObjectForNRUUID();
  int v23 = _NRLogIsLevelEnabled();

  if (v23)
  {
    uint64_t v24 = (void *)_NRCopyLogObjectForNRUUID();
    id v130 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();
  }
  int state = self->super._state;
  id v142 = v17;
  if (state == 255) {
    goto LABEL_21;
  }
  id v26 = [v16 localIdentifier];
  id v27 = [v26 identifierType];

  if (v27 == (id)11)
  {
    int v28 = [v16 remoteIdentifier];
    id v29 = [v28 identifierType];

    if (v29 == (id)11)
    {
      id v30 = [(NRLink *)self nrUUID];
      int v31 = sub_10013DC5C((uint64_t)NRDLocalDevice, v30);

      v141 = v31;
      if (!v31)
      {
        id v113 = sub_10003B168();
        int v114 = _NRLogIsLevelEnabled();

        if (v114)
        {
          id v115 = sub_10003B168();
          _NRLogWithArgs();
        }
        uint64_t v116 = _os_log_pack_size();
        id v15 = (char *)&v136 - ((__chkstk_darwin(v116) + 15) & 0xFFFFFFFFFFFFFFF0);
        __error();
        uint64_t v117 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v117 = 136446210;
        *(void *)(v117 + 4) = "-[NRLinkQuickRelay requestConfigurationForListener:session:sessionConfig:childConfig:val"
                                "idateAuthBlock:responseBlock:]";
        sub_10003B168();
        _NRLogAbortWithPack();
LABEL_80:
        dispatch_once(&qword_1001F4C30, &stru_1001C7E50);
LABEL_39:
        id v58 = v142;
        id v59 = (id)qword_1001F4C28;
        unsigned int v60 = [v31 isEqual:v59];

        if (v60)
        {
          uint64_t v61 = mach_absolute_time();
          uint64_t v62 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
          if (v62)
          {
            *(void *)(v62 + 48) = v61;
            v63 = *(id *)((char *)&self->_pathEvaluator + 7);
            if (v63) {
              ++v63[9];
            }

            if (v58) {
              goto LABEL_44;
            }
          }
          else
          {

            if (v58)
            {
LABEL_44:
              v64 = sub_10015BD9C();
              dispatch_assert_queue_V2(v64);

              v65 = v141;
              v66 = sub_100140FAC(v141, @"0");
              v67 = sub_10015BD9C();
              dispatch_assert_queue_V2(v67);

              v68 = sub_1001414DC(v65, @"0");
              id v35 = sub_10011F560(0, v65, 4);
              id v136 = objc_alloc((Class)NEIKEv2ConfigurationMessage);
              id v69 = objc_alloc((Class)NEIKEv2InitiatorTransportIPv6Address);
              id v137 = v68;
              id v70 = [v69 initWithAddress:v68];
              v144[0] = v70;
              id v71 = objc_alloc((Class)NEIKEv2ResponderTransportIPv6Address);
              id v138 = v66;
              id v72 = [v71 initWithAddress:v66];
              v144[1] = v72;
              v73 = +[NSArray arrayWithObjects:v144 count:2];
              id v74 = [v136 initWithWithAttributes:v73];
              [v35 setConfigurationReply:v74];

              uint64_t v18 = v140;
              if (v140[2](v140, v35))
              {
                id v75 = v137;
                int v76 = 4;
                [(NRLinkQuickRelay *)self invalidateIKESessionForClass:4];
                objc_storeStrong((id *)((char *)&self->_ikeListener + 7), a4);
                CFStringRef v77 = @"ClassD %@";
LABEL_55:
                sub_10003DE60(self, v76);
                -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3016, v77, v15);

LABEL_57:
                if (self->super._virtualInterface)
                {

                  id v96 = sub_10011F1E0();
                  ((void (**)(void, void *, id, NEVirtualInterface_s *))v20)[2](v20, v35, v96, self->super._virtualInterface);

                  id v14 = v139;
                  goto LABEL_23;
                }
                v118 = (void *)_NRCopyLogObjectForNRUUID();
                int v119 = _NRLogIsLevelEnabled();

                if (v119)
                {
                  v120 = (void *)_NRCopyLogObjectForNRUUID();
                  id v133 = [(NRLink *)self copyDescription];
                  _NRLogWithArgs();
                }
                goto LABEL_63;
              }
              [(NRLink *)self reportEvent:3021, @"ClassD %@", v15 detailsFormat];
              goto LABEL_65;
            }
          }
          [(NRLink *)self reportEvent:3024, @"ClassD %@", v15 detailsFormat];
LABEL_62:
          id v35 = 0;
LABEL_63:
          id v14 = v139;
          uint64_t v18 = v140;
          goto LABEL_66;
        }
        v78 = [v16 localIdentifier];
        if (qword_1001F4C40 != -1) {
          dispatch_once(&qword_1001F4C40, &stru_1001C7E70);
        }
        id v79 = (id)qword_1001F4C38;
        unsigned int v80 = [v78 isEqual:v79];

        if (!v80)
        {
          id v35 = 0;
          uint64_t v18 = v140;
          goto LABEL_57;
        }
        uint64_t v81 = mach_absolute_time();
        uint64_t v82 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (v82)
        {
          *(void *)(v82 + 32) = v81;
          v83 = *(id *)((char *)&self->_pathEvaluator + 7);
          if (v83) {
            ++v83[8];
          }

          if (v58) {
            goto LABEL_53;
          }
        }
        else
        {

          if (v58)
          {
LABEL_53:
            v84 = sub_10015BD9C();
            dispatch_assert_queue_V2(v84);

            v85 = v141;
            v86 = (void *)sub_1001416EC(v141, @"0");
            v87 = sub_10015BD9C();
            dispatch_assert_queue_V2(v87);

            v88 = sub_1001418A8(v85, @"0");
            id v35 = sub_10011F560(0, v85, 3);
            id v89 = objc_alloc((Class)NEIKEv2ConfigurationMessage);
            id v90 = objc_alloc((Class)NEIKEv2InitiatorTransportIPv6Address);
            id v137 = v88;
            id v91 = [v90 initWithAddress:v88];
            v143[0] = v91;
            id v92 = objc_alloc((Class)NEIKEv2ResponderTransportIPv6Address);
            id v138 = v86;
            id v93 = [v92 initWithAddress:v86];
            v143[1] = v93;
            v94 = +[NSArray arrayWithObjects:v143 count:2];
            id v95 = [v89 initWithWithAttributes:v94];
            [v35 setConfigurationReply:v95];

            uint64_t v18 = v140;
            if (v140[2](v140, v35))
            {
              id v75 = v137;
              int v76 = 3;
              [(NRLinkQuickRelay *)self invalidateIKESessionForClass:3];
              sub_100045DF8((uint64_t)self, v15);
              CFStringRef v77 = @"ClassC %@";
              goto LABEL_55;
            }
            [(NRLink *)self reportEvent:3021, @"ClassC %@", v15 detailsFormat];
LABEL_65:

            id v14 = v139;
            goto LABEL_66;
          }
        }
        [(NRLink *)self reportEvent:3024, @"ClassC %@", v15 detailsFormat];
        goto LABEL_62;
      }
      int v32 = [v16 localIdentifier];
      id v33 = [v16 remoteIdentifier];
      unsigned __int8 v34 = [v32 isEqual:v33];

      id v139 = v14;
      v140 = v18;
      if (v34)
      {
        if (_os_feature_enabled_impl() && *((unsigned char *)v141 + 11))
        {
          [(NRLink *)self reportEvent:3022, @"%@ %@", v15, v141 detailsFormat];
          id v35 = 0;
LABEL_66:

          goto LABEL_22;
        }
LABEL_38:
        int v31 = [v16 localIdentifier];
        if (qword_1001F4C30 == -1) {
          goto LABEL_39;
        }
        goto LABEL_80;
      }
      id v43 = [v16 localIdentifier];
      if (qword_1001F4C30 != -1) {
        dispatch_once(&qword_1001F4C30, &stru_1001C7E50);
      }
      id v44 = (id)qword_1001F4C28;
      if ([v43 isEqual:v44])
      {
      }
      else
      {
        uint64_t v45 = [v16 localIdentifier];
        if (qword_1001F4C40 != -1) {
          dispatch_once(&qword_1001F4C40, &stru_1001C7E70);
        }
        id v46 = (id)qword_1001F4C38;
        unsigned __int8 v47 = [v45 isEqual:v46];

        if ((v47 & 1) == 0)
        {
          v97 = (void *)_NRCopyLogObjectForNRUUID();
          int v98 = _NRLogIsLevelEnabled();

          if (v98)
          {
            v99 = (void *)_NRCopyLogObjectForNRUUID();
            id v100 = [(NRLink *)self copyDescription];
            v101 = [v16 localIdentifier];
            v135 = [v16 remoteIdentifier];
            _NRLogWithArgs();
          }
          goto LABEL_62;
        }
      }
      id v48 = [v16 remoteIdentifier];
      id v49 = [v16 localIdentifier];
      int v50 = sub_10013E8A4((uint64_t)NRDLocalDevice, v48, v49, v15);

      id v51 = (void *)_NRCopyLogObjectForNRUUID();
      if (v50)
      {
        int v52 = _NRLogIsLevelEnabled();

        if (v52)
        {
          id v53 = (void *)_NRCopyLogObjectForNRUUID();
          id v131 = [(NRLink *)self copyDescription];
          v132 = v50->_identity;
          _NRLogWithArgs();
        }
        int v54 = v50->_nrUUID;

        if (v54)
        {
          id v55 = v50->_nrUUID;
          v56 = [(NRLink *)self nrUUID];
          unsigned __int8 v57 = [(NSUUID *)v55 isEqual:v56];

          if (v57)
          {

            goto LABEL_38;
          }
          v127 = (void *)_NRCopyLogObjectForNRUUID();
          int v128 = _NRLogIsLevelEnabled();

          if (v128)
          {
            v122 = (void *)_NRCopyLogObjectForNRUUID();
            id v123 = [(NRLink *)self copyDescription];
            v126 = v50->_identity;
            v129 = v50->_nrUUID;
            v134 = [(NRLink *)self nrUUID];
            _NRLogWithArgs();

            goto LABEL_89;
          }
        }
        else
        {
          v124 = (void *)_NRCopyLogObjectForNRUUID();
          int v125 = _NRLogIsLevelEnabled();

          if (v125)
          {
            v122 = (void *)_NRCopyLogObjectForNRUUID();
            id v123 = [(NRLink *)self copyDescription];
            v126 = v50->_identity;
            _NRLogWithArgs();
LABEL_89:

            goto LABEL_90;
          }
        }
      }
      else
      {
        int v121 = _NRLogIsLevelEnabled();

        if (v121)
        {
          v122 = (void *)_NRCopyLogObjectForNRUUID();
          id v123 = [(NRLink *)self copyDescription];
          _NRLogWithArgs();
LABEL_90:
        }
      }
      [(NRLink *)self reportEvent:3023, @"%@ %@", v15, v141 detailsFormat];

      goto LABEL_62;
    }
    id v41 = (void *)_NRCopyLogObjectForNRUUID();
    int v42 = _NRLogIsLevelEnabled();

    if (v42)
    {
      v38 = (void *)_NRCopyLogObjectForNRUUID();
      id v39 = [(NRLink *)self copyDescription];
      uint64_t v40 = [v16 remoteIdentifier];
      [v40 identifierType];
      goto LABEL_20;
    }
  }
  else
  {
    id v36 = (void *)_NRCopyLogObjectForNRUUID();
    int v37 = _NRLogIsLevelEnabled();

    if (v37)
    {
      v38 = (void *)_NRCopyLogObjectForNRUUID();
      id v39 = [(NRLink *)self copyDescription];
      uint64_t v40 = [v16 localIdentifier];
      [v40 identifierType];
LABEL_20:
      _NRLogWithArgs();
    }
  }
LABEL_21:
  id v35 = 0;
LABEL_22:
  v20[2](v20, 0, 0, 0);
LABEL_23:

  id v17 = v142;
LABEL_24:
}

- (void)acceptNewFlow:(id)a3 fromNexus:(id)a4 completionHandler:(id)a5
{
}

- (void)setPacketReceiver:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [(NRLink *)self queue];
    dispatch_assert_queue_V2(v6);

    v7 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      v9 = (void *)_NRCopyLogObjectForNRUUID();
      uint64_t v23 = 2073;
      id v24 = [(NRLink *)self copyDescription];
      uint64_t v21 = "";
      int v22 = "-[NRLinkQuickRelay setPacketReceiver:]";
      _NRLogWithArgs();
    }
    objc_storeStrong((id *)((char *)&self->_packetNexus + 7), a3);
    if ([*(id *)((char *)&self->_ikeSessionTimeoutSource + 7) count])
    {
      unsigned __int8 v10 = (void *)_NRCopyLogObjectForNRUUID();
      int v11 = _NRLogIsLevelEnabled();

      if (v11)
      {
        id v12 = (void *)_NRCopyLogObjectForNRUUID();
        id v24 = [(NRLink *)self copyDescription];
        id v25 = [*(id *)((char *)&self->_ikeSessionTimeoutSource + 7) count];
        uint64_t v23 = 2077;
        uint64_t v21 = "";
        int v22 = "-[NRLinkQuickRelay setPacketReceiver:]";
        _NRLogWithArgs();
      }
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = *(id *)((char *)&self->_ikeSessionTimeoutSource + 7);
    id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)((char *)&self->_packetNexus + 7) receivePacketData:*(void *)(*((void *)&v26 + 1) + 8 * i) v21, v22, v23, v24, v25];
        }
        id v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }

    [*(id *)((char *)&self->_ikeSessionTimeoutSource + 7) removeAllObjects];
  }
  else
  {
    id v18 = sub_10003B168();
    int v19 = _NRLogIsLevelEnabled();

    if (v19)
    {
      id v20 = sub_10003B168();
      _NRLogWithArgs();
    }
  }
}

- (BOOL)sendPacketData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v36 = sub_10003B168();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v38 = sub_10003B168();
      _NRLogWithArgs();

      BOOL v16 = 0;
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  id v5 = [(NRLink *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->super._state != 255)
  {
    uint64_t v6 = *(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7);
    IKEv2PacketString = (void *)createIKEv2PacketString();
    uint64_t v8 = (unsigned __int16)[v4 length];
    v9 = [(NRLinkQuickRelay *)self connection];
    unsigned __int8 v10 = [(NRLinkQuickRelay *)self connection];
    id v11 = [v10 connectionState];
    if ((unint64_t)v11 >= 6) {
      id v12 = [objc_alloc((Class)NSString) initWithFormat:@"Unknown[%lld]", v11];
    }
    else {
      id v12 = *(&off_1001C6750 + (void)v11);
    }
    [(NRLink *)self reportEvent:3006, @"Sending IKEv2 packet #%llu %@ len %u connection %@ state %@", v6, IKEv2PacketString, v8, v9, v12 detailsFormat];

    ++*(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7);
    id v17 = objc_alloc_init((Class)NSMutableData);
    char v48 = 4;
    __int16 v47 = bswap32([v4 length]) >> 16;
    [v17 appendBytes:&v48 length:1];
    [v17 appendBytes:&v47 length:2];
    [v17 appendData:v4];
    [v17 bytes];
    if (!(unsigned __int16)[v17 length])
    {
      id v40 = sub_10003B168();
      int v41 = _NRLogIsLevelEnabled();

      if (v41)
      {
        id v42 = sub_10003B168();
        _NRLogWithArgs();
      }
      uint64_t v43 = _os_log_pack_size();
      __chkstk_darwin(v43);
      __error();
      uint64_t v44 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v44 = 136446210;
      *(void *)(v44 + 4) = "nrChecksumFull";
      sub_10003B168();
      _NRLogAbortWithPack();
    }
    __int16 v46 = ~(unsigned __int16)os_inet_checksum();
    [v17 appendBytes:&v46 length:2];
    id v18 = v17;
    dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
    if (self->super._state == 255)
    {
      int v22 = (void *)_NRCopyLogObjectForNRUUID();
      int v23 = _NRLogIsLevelEnabled();

      if (!v23) {
        goto LABEL_26;
      }
    }
    else
    {
      int v19 = *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7);
      if (v19)
      {
        if ([v19 connectionState] == (id)3)
        {
          *(unint64_t *)((char *)&self->_lastRecordedSessionInvitationCounter + 7) += (unint64_t)[v18 length];
          id v20 = *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7);
          id v51 = v18;
          uint64_t v21 = +[NSArray arrayWithObjects:&v51 count:1];
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_1000467A8;
          v49[3] = &unk_1001C6698;
          v49[4] = self;
          id v50 = v18;
          [v20 writeDatagrams:v21 completionHandler:v49];

LABEL_26:
          BOOL v16 = 1;
          goto LABEL_30;
        }
        long long v28 = *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7);
        id v29 = [v28 connectionState];
        if ((unint64_t)v29 >= 6) {
          id v30 = [objc_alloc((Class)NSString) initWithFormat:@"Unknown[%lld]", v29];
        }
        else {
          id v30 = *(&off_1001C6750 + (void)v29);
        }
        [(NRLink *)self reportEvent:10022, @"cannot write to connection %@ state %@", v28, v30 detailsFormat];

        int v31 = (void *)_NRCopyLogObjectForNRUUID();
        int v32 = _NRLogIsLevelEnabled();

        if (!v32) {
          goto LABEL_26;
        }
        long long v26 = (void *)_NRCopyLogObjectForNRUUID();
        id v33 = [(NRLink *)self copyDescription];
        id v34 = [*(id *)((char *)&self->_linkAnalytics + 7) connectionState];
        if ((unint64_t)v34 >= 6) {
          id v35 = [objc_alloc((Class)NSString) initWithFormat:@"Unknown[%lld]", v34];
        }
        else {
          id v35 = *(&off_1001C6750 + (void)v34);
        }
        _NRLogWithArgs();

LABEL_25:
        goto LABEL_26;
      }
      id v24 = (void *)_NRCopyLogObjectForNRUUID();
      int v25 = _NRLogIsLevelEnabled();

      if (!v25) {
        goto LABEL_26;
      }
    }
    long long v26 = (void *)_NRCopyLogObjectForNRUUID();
    id v27 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();

    goto LABEL_25;
  }
  id v13 = (void *)_NRCopyLogObjectForNRUUID();
  int v14 = _NRLogIsLevelEnabled();

  if (!v14)
  {
LABEL_29:
    BOOL v16 = 0;
    goto LABEL_30;
  }
  id v15 = (void *)_NRCopyLogObjectForNRUUID();
  id v45 = [(NRLink *)self copyDescription];
  _NRLogWithArgs();

  BOOL v16 = 0;
LABEL_30:

  return v16;
}

- (BOOL)sendControlData:(id)a3
{
  id v4 = a3;
  id v5 = [(NRLinkQuickRelay *)self connection];

  if (v5)
  {
    if (v4)
    {
      id v6 = [objc_alloc((Class)NEIKEv2PrivateNotify) initWithNotifyStatus:50702 notifyData:v4];
      BOOL v7 = v6 != 0;
      if (v6)
      {
        objc_initWeak(&location, self);
        uint64_t v8 = *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7);
        id v25 = v6;
        v9 = +[NSArray arrayWithObjects:&v25 count:1];
        unsigned __int8 v10 = [(NRLink *)self queue];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100046D50;
        v22[3] = &unk_1001C7A00;
        objc_copyWeak(&v23, &location);
        [v8 sendPrivateNotifies:v9 maxRetries:10 retryIntervalInMilliseconds:1000 callbackQueue:v10 callback:v22];

        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);
      }
      else
      {
        id v18 = sub_10003B168();
        int IsLevelEnabled = _NRLogIsLevelEnabled();

        if (IsLevelEnabled)
        {
          id v20 = sub_10003B168();
          _NRLogWithArgs();
        }
      }
    }
    else
    {
      id v15 = sub_10003B168();
      int v16 = _NRLogIsLevelEnabled();

      if (v16)
      {
        id v17 = sub_10003B168();
        _NRLogWithArgs();
      }
      BOOL v7 = 0;
    }
  }
  else
  {
    id v11 = (void *)_NRCopyLogObjectForNRUUID();
    BOOL v7 = 1;
    int v12 = _NRLogIsLevelEnabled();

    if (v12)
    {
      id v13 = (void *)_NRCopyLogObjectForNRUUID();
      id v21 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
  }

  return v7;
}

- (void)invalidateIKESessionForClass:(unsigned __int8)a3
{
  int v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NRLinkQuickRelay;
  -[NRLink invalidateIKESessionForClass:](&v5, "invalidateIKESessionForClass:");
  [(NRLink *)self invalidateIKESession:sub_10003DCEC((uint64_t)self, v3)];
}

- (BOOL)resume
{
  if ([(NRLink *)self state] == 255)
  {
    uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID();
    BOOL v3 = 1;
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
LABEL_10:
      unsigned __int8 v10 = (void *)_NRCopyLogObjectForNRUUID();
      id v11 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
  }
  else if ([(NRLink *)self state] == 9)
  {
    if (!self) {
      goto LABEL_15;
    }
    BOOL v3 = 1;
    if (self->_resumeRequested) {
      return v3;
    }
    self->_resumeRequested = 1;
    id v4 = *(id *)((char *)&self->_idsService + 7);
    if (!v4 || (BOOL idsSessionIsIncoming = self->_idsSessionIsIncoming, v4, !idsSessionIsIncoming))
    {
LABEL_15:
      sub_1000470EC((uint64_t)self);
      return 1;
    }
    id v6 = (void *)_NRCopyLogObjectForNRUUID();
    BOOL v3 = 1;
    int v7 = _NRLogIsLevelEnabled();

    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
    int v12 = (void *)_NRCopyLogObjectForNRUUID();
    int v13 = _NRLogIsLevelEnabled();

    if (v13)
    {
      int v14 = (void *)_NRCopyLogObjectForNRUUID();
      id v16 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
    return 0;
  }
  return v3;
}

- (BOOL)suspend
{
  BOOL v3 = [(NRLink *)self queue];
  dispatch_assert_queue_V2(v3);

  if (self && self->_shouldCancelOnSuspend)
  {
    self->_shouldCancelOnSuspend = 0;
    [(NRLinkQuickRelay *)self cancelWithReason:@"Cancelling after link timeout and after suspend"];
  }
  if ([(NRLink *)self state] == 255)
  {
    int v13 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v15 = (void *)_NRCopyLogObjectForNRUUID();
      id v21 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
  }
  else
  {
    if (![(NRLink *)self changeStateTo:9])
    {
      id v4 = (void *)_NRCopyLogObjectForNRUUID();
      int v5 = _NRLogIsLevelEnabled();

      if (v5)
      {
        id v6 = (void *)_NRCopyLogObjectForNRUUID();
        uint64_t v19 = 469;
        id v20 = [(NRLink *)self copyDescription];
        id v17 = "";
        id v18 = "-[NRLinkQuickRelay suspend]";
        _NRLogWithArgs();
      }
    }
    if (self->_dNexusReadSourceSuspended)
    {
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusOutputRing + 7));
      self->_dNexusReadSourceSuspended = 0;
    }
    if (![(NRLink *)self ikeClassDEstablished]) {
      [(NRLinkQuickRelay *)self invalidateIKESessionForClass:4];
    }
    if (![(NRLink *)self ikeClassCEstablished]) {
      [(NRLinkQuickRelay *)self invalidateIKESessionForClass:3];
    }
    self->_resumeRequested = 0;
    self->_hasPendingInputAvailable = 0;
    self->_ikeClassCRetryCounter = 0;
    self->_ikeClassDRetryCounter = 0;
    self->_invitationRetryCounter = 0;
    [*(id *)((char *)&self->_ikeSessionClassC + 7) setAvailability:0];
    sub_10003BF74((uint64_t)self);
    uint64_t v7 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
    if (v7)
    {
      *(void *)(v7 + 24) = *(unint64_t *)((char *)&self->_sentIKEv2PointToPoint + 7)
                           + *(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7);
      uint64_t v8 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
      if (v8)
      {
        *(void *)(v8 + 80) = *(unint64_t *)((char *)&self->_lastRecordedBytesFromQR + 7);
        uint64_t v9 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (v9) {
          *(void *)(v9 + 88) = *(unint64_t *)((char *)&self->_bytesFromNexus + 7);
        }
      }
    }
    [(NRLink *)self linkTotalReadyTimeInSec];
    uint64_t v11 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
    if (v11) {
      *(void *)(v11 + 16) = v10;
    }
    int v12 = [(NRLink *)self linkDelegate];
    [v12 linkIsSuspended:self];

    [*(id *)((char *)&self->_pathEvaluator + 7) submit];
    [*(id *)((char *)&self->_pathEvaluator + 7) reset];
    self->super._linkTotalReadyTimeInSec = 0.0;
    *(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7) = 0;
    *(unint64_t *)((char *)&self->_sentIKEv2PointToPoint + 7) = 0;
    *(unint64_t *)((char *)&self->_lastRecordedBytesFromQR + 7) = 0;
    *(unint64_t *)((char *)&self->_bytesFromNexus + 7) = 0;
  }
  return 1;
}

- (BOOL)start
{
  BOOL v3 = [(NRLink *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(NRLink *)self state] == 255)
  {
    id v6 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID();
      id v15 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
    return 0;
  }
  if ([(NRLink *)self state] == 8)
  {
    id v4 = [(NRLink *)self linkDelegate];
    [v4 linkIsReady:self];

    return 1;
  }
  if ([(NRLink *)self state] != 9)
  {
    if ([(NRLink *)self startRequested]) {
      return 1;
    }
    if (sub_1000474D4(self))
    {
      [(NRLink *)self setStartRequested:1];
      [(NRLink *)self reportEvent:3001];
      if (self)
      {
        id v10 = *(id *)((char *)&self->_idsService + 7);
        if (v10)
        {
          BOOL idsSessionIsIncoming = self->_idsSessionIsIncoming;

          if (idsSessionIsIncoming)
          {
            int v12 = (void *)_NRCopyLogObjectForNRUUID();
            BOOL v5 = 1;
            int v13 = _NRLogIsLevelEnabled();

            if (v13)
            {
              int v14 = (void *)_NRCopyLogObjectForNRUUID();
              id v16 = [(NRLink *)self copyDescription];
              _NRLogWithArgs();
            }
            return v5;
          }
        }
      }
      sub_1000470EC((uint64_t)self);
      return 1;
    }
    return 0;
  }

  return [(NRLinkQuickRelay *)self resume];
}

- (id)copyStatusString
{
  BOOL v3 = [(NRLink *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc((Class)NSMutableString);
  BOOL v5 = [(NRLink *)self description];
  id v6 = [v4 initWithString:v5];

  [v6 appendFormat:@"\n %35s = %@", "nrUUID", self->super._nrUUID];
  if (self->super._startRequested) {
    uint64_t v7 = "YES";
  }
  else {
    uint64_t v7 = "NO";
  }
  [v6 appendFormat:@"\n %35s = %s", @"startRequested", v7];
  if (self->_resumeRequested) {
    uint64_t v8 = "YES";
  }
  else {
    uint64_t v8 = "NO";
  }
  [v6 appendFormat:@"\n %35s = %s", @"resumeRequested", v8];
  [v6 appendFormat:@"\n %35s = %@", "idsService", *(void *)(&self->_ikeSessionTimeoutScheduledOnce + 1)];
  [v6 appendFormat:@"\n %35s = %@", "idsSession", *(IDSService **)((char *)&self->_idsService + 7)];
  [v6 appendFormat:@"\n %35s = %@", "idsDestination", *(IDSSession **)((char *)&self->_idsSession + 7)];
  if (self->_idsSessionStarted) {
    uint64_t v9 = "YES";
  }
  else {
    uint64_t v9 = "NO";
  }
  [v6 appendFormat:@"\n %35s = %s", @"idsSessionStarted", v9];
  if (self->_invitationInProgress) {
    id v10 = "YES";
  }
  else {
    id v10 = "NO";
  }
  [v6 appendFormat:@"\n %35s = %s", @"invitationInProgress", v10];
  [v6 appendFormat:@"\n %35s = %llu", @"sessionInvitationCounter", *(NSDate **)((char *)&self->_ikeClassCEstablishedTime + 7)];
  [v6 appendFormat:@"\n %35s = %@", "idsSessionStartTime", *(NSString **)((char *)&self->_idsDestination + 7)];
  [v6 appendFormat:@"\n %35s = %@", "connection", *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7)];
  uint64_t v11 = *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7);
  if (v11)
  {
    id v12 = [v11 connectionState];
    if ((unint64_t)v12 >= 6) {
      id v13 = [objc_alloc((Class)NSString) initWithFormat:@"Unknown[%lld]", v12];
    }
    else {
      id v13 = *(&off_1001C6750 + (void)v12);
    }
    [v6 appendFormat:@"\n %35s = %@", "connectionState", v13];
  }
  [v6 appendFormat:@"\n %35s = %@", "ikeListener", *(NSDate **)((char *)&self->_idsSessionStartTime + 7)];
  [v6 appendFormat:@"\n %35s = %@", "ikeSessionClassD", *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"ikeClassDRetryCounter", self->_ikeClassDRetryCounter];
  if (self->super._ikeClassDEstablished) {
    int v14 = "YES";
  }
  else {
    int v14 = "NO";
  }
  [v6 appendFormat:@"\n %35s = %s", @"ikeClassDEstablished", v14];
  [v6 appendFormat:@"\n %35s = %@", "ikeClassDEstablishedTime", *(NSMutableArray **)((char *)&self->_receivedDatagrams + 7)];
  [v6 appendFormat:@"\n %35s = %@", "ikeSessionClassC", *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"ikeClassCRetryCounter", self->_ikeClassCRetryCounter];
  if (self->super._ikeClassCEstablished) {
    id v15 = "YES";
  }
  else {
    id v15 = "NO";
  }
  [v6 appendFormat:@"\n %35s = %s", @"ikeClassCEstablished", v15];
  [v6 appendFormat:@"\n %35s = %@", "ikeClassCEstablishedTime", *(NSDate **)((char *)&self->_ikeClassDEstablishedTime + 7)];
  if (self->_isResponder) {
    id v16 = "YES";
  }
  else {
    id v16 = "NO";
  }
  [v6 appendFormat:@"\n %35s = %s", @"isResponder", v16];
  [v6 appendFormat:@"\n %35s = %@", "packetNexus", *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7)];
  [v6 appendFormat:@"\n %35s = %@", "ikePacketReceiver", *(NEIPsecNexus **)((char *)&self->_packetNexus + 7)];
  if (self->super._virtualInterface)
  {
    id v17 = (void *)NEVirtualInterfaceCopyName();
    [v6 appendFormat:@"\n %35s = %@", "virtualInterfaceName", v17];
  }
  [v6 appendFormat:@"\n %35s = %p", @"nexusChannel", *(NEIKEv2PacketReceiver **)((char *)&self->_ikePacketReceiver + 7)];
  [v6 appendFormat:@"\n %35s = %p", @"nexusInputRing", *(channel **)((char *)&self->_nexusChannel + 7)];
  [v6 appendFormat:@"\n %35s = %p", @"dNexusReadSource", *(channel_ring_desc **)((char *)&self->_nexusOutputRing + 7)];
  [v6 appendFormat:@"\n %35s = %p", @"dNexusWriteSource", *(OS_dispatch_source **)((char *)&self->_dNexusReadSource + 7)];
  if (self->_dNexusReadSourceSuspended) {
    id v18 = "YES";
  }
  else {
    id v18 = "NO";
  }
  [v6 appendFormat:@"\n %35s = %s", @"dNexusReadSourceSuspended", v18];
  if (self->_dNexusWriteSourceSuspended) {
    uint64_t v19 = "YES";
  }
  else {
    uint64_t v19 = "NO";
  }
  [v6 appendFormat:@"\n %35s = %s", @"dNexusWriteSourceSuspended", v19];
  if (self->_hasPendingInputAvailable) {
    id v20 = "YES";
  }
  else {
    id v20 = "NO";
  }
  [v6 appendFormat:@"\n %35s = %s", @"hasPendingInputAvailable", v20];
  [v6 appendFormat:@"\n %35s = %llu", @"bytesFromNexus", *(unint64_t *)((char *)&self->_lastRecordedBytesFromQR + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"bytesFromQR", *(unint64_t *)((char *)&self->_bytesToQRSendFailed + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"bytesToQRBeforeSend", *(unint64_t *)((char *)&self->_lastRecordedSessionInvitationCounter + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"bytesToQRSent", *(unint64_t *)((char *)&self->_bytesToQRBeforeSend + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"bytesToQRSendFailed", *(unint64_t *)((char *)&self->_bytesToQRSent + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"bytesToNexus", *(unint64_t *)((char *)&self->_bytesFromNexus + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"receivedDatagrams.count", [*(id *)((char *)&self->_nexusGroup + 7) count]];
  [v6 appendFormat:@"\n %35s = %llu", @"nexusInputAvailableCount", *(unint64_t *)((char *)&self->_bytesToNexus + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"nexusOutputAvailableCount", *(unint64_t *)((char *)&self->_nexusInputAvailableCount + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"sentIKEv2PointToPoint", *(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"recvIKEv2PointToPoint", *(unint64_t *)((char *)&self->_sentIKEv2PointToPoint + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"sentUncompressedIP", *(unint64_t *)((char *)&self->_recvIKEv2PointToPoint + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"recvUncompressedIP", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_TCP_ECT0 + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"sentEncapsulated6LoWPAN", *(unint64_t *)((char *)&self->_sentUncompressedIP + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"recvEncapsulated6LoWPAN", *(unint64_t *)((char *)&self->_recvUncompressedIP + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"sentKnownIPv6Hdr_ESP", *(unint64_t *)((char *)&self->_sentEncapsulated6LoWPAN + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"recvKnownIPv6Hdr_ESP", *(unint64_t *)((char *)&self->_recvEncapsulated6LoWPAN + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"sentKnownIPv6Hdr_ESP_ECT0", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"recvKnownIPv6Hdr_ESP_ECT0", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"sentKnownIPv6Hdr_ESP_ClassC", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ECT0 + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"recvKnownIPv6Hdr_ESP_ClassC", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ECT0 + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"sentKnownIPv6Hdr_ESP_ClassC_ECT0", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ClassC + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"recvKnownIPv6Hdr_ESP_ClassC_ECT0", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ClassC + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"sentKnownIPv6Hdr_TCP", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ClassC_ECT0 + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"recvKnownIPv6Hdr_TCP", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ClassC_ECT0 + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"sentKnownIPv6Hdr_TCP_ECT0", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_TCP + 7)];
  [v6 appendFormat:@"\n %35s = %llu", @"recvKnownIPv6Hdr_TCP_ECT0", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_TCP + 7)];
  return v6;
}

- (unsigned)metric
{
  return 1024;
}

- (BOOL)cancelWithReason:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(NRLink *)self queue];
    dispatch_assert_queue_V2(v5);

    id v6 = [objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v22];
    if ([(NRLink *)self changeStateTo:255 details:v6])
    {
      if (self)
      {
        uint64_t v7 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (v7)
        {
          *(void *)(v7 + 24) = *(unint64_t *)((char *)&self->_sentIKEv2PointToPoint + 7)
                               + *(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7);
          uint64_t v8 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
          if (v8)
          {
            *(void *)(v8 + 80) = *(unint64_t *)((char *)&self->_lastRecordedBytesFromQR + 7);
            uint64_t v9 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
            if (v9) {
              *(void *)(v9 + 88) = *(unint64_t *)((char *)&self->_bytesFromNexus + 7);
            }
          }
        }
        [(NRLink *)self linkTotalReadyTimeInSec];
        uint64_t v11 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (v11) {
          *(void *)(v11 + 16) = v10;
        }
        id v12 = [(NRLink *)self linkDelegate];
        [v12 linkIsUnavailable:self];

        [(NRLinkQuickRelay *)self invalidateLink];
        id v13 = *(OS_nw_path_evaluator **)((char *)&self->_pathEvaluator + 7);
      }
      else
      {
        [0 linkTotalReadyTimeInSec];
        id v20 = [0 linkDelegate];
        [v20 linkIsUnavailable:0];

        [0 invalidateLink];
        id v13 = 0;
      }
      [v13 submit];
    }
    else
    {
      int v14 = (void *)_NRCopyLogObjectForNRUUID();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        id v16 = (void *)_NRCopyLogObjectForNRUUID();
        id v21 = [(NRLink *)self copyDescription];
        _NRLogWithArgs();
      }
    }
  }
  else
  {
    id v18 = sub_10003B168();
    int v19 = _NRLogIsLevelEnabled();

    if (!v19) {
      goto LABEL_15;
    }
    id v6 = sub_10003B168();
    _NRLogWithArgs();
  }

LABEL_15:
  return v4 != 0;
}

- (void)invalidateLink
{
  v29.receiver = self;
  v29.super_class = (Class)NRLinkQuickRelay;
  [(NRLink *)&v29 invalidateLink];
  sub_10003BF74((uint64_t)self);
  if (self)
  {
    BOOL v3 = *(void **)(&self->_ikeSessionTimeoutScheduledOnce + 1);
    if (v3)
    {
      id v4 = v3;
      BOOL v5 = *(void **)(&self->_ikeSessionTimeoutScheduledOnce + 1);
      *(void *)(&self->_ikeSessionTimeoutScheduledOnce + 1) = 0;

      if (qword_1001F4C08 != -1) {
        dispatch_once(&qword_1001F4C08, &stru_1001C7DA8);
      }
      id v6 = (id)qword_1001F4C10;
      id v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472;
      id v25 = sub_1000496BC;
      long long v26 = &unk_1001C8840;
      id v27 = v4;
      long long v28 = self;
      id v7 = v4;
      dispatch_async(v6, &v23);
    }
    uint64_t v8 = *(NSDate **)((char *)&self->_idsSessionStartTime + 7);
    if (v8)
    {
      [v8 cancel];
      uint64_t v9 = *(NSDate **)((char *)&self->_idsSessionStartTime + 7);
      *(NSDate **)((char *)&self->_idsSessionStartTime + 7) = 0;
    }
    -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4, v23, v24, v25, v26);
    [(NRLinkQuickRelay *)self invalidateIKESessionForClass:3];
    uint64_t v10 = *(NSObject **)((char *)&self->_nexusOutputRing + 7);
    if (v10)
    {
      if (self->_dNexusReadSourceSuspended)
      {
        dispatch_resume(v10);
        self->_dNexusReadSourceSuspended = 0;
        uint64_t v10 = *(NSObject **)((char *)&self->_nexusOutputRing + 7);
      }
      dispatch_source_cancel(v10);
      uint64_t v11 = *(channel_ring_desc **)((char *)&self->_nexusOutputRing + 7);
      *(channel_ring_desc **)((char *)&self->_nexusOutputRing + 7) = 0;
    }
    id v12 = *(NSObject **)((char *)&self->_dNexusReadSource + 7);
    if (v12)
    {
      if (self->_dNexusWriteSourceSuspended)
      {
        dispatch_resume(v12);
        self->_dNexusWriteSourceSuspended = 0;
        id v12 = *(NSObject **)((char *)&self->_dNexusReadSource + 7);
      }
      dispatch_source_cancel(v12);
      id v13 = *(OS_dispatch_source **)((char *)&self->_dNexusReadSource + 7);
      *(OS_dispatch_source **)((char *)&self->_dNexusReadSource + 7) = 0;
    }
    if (*(NEIKEv2PacketReceiver **)((char *)&self->_ikePacketReceiver + 7))
    {
      if (!*(OS_dispatch_source **)((char *)&self->_dNexusWriteSource + 7)) {
        os_channel_destroy();
      }
      *(NEIKEv2PacketReceiver **)((char *)&self->_ikePacketReceiver + 7) = 0;
    }
    int v14 = *(OS_dispatch_group **)((char *)&self->_nexusGroup + 7);
    *(OS_dispatch_group **)((char *)&self->_nexusGroup + 7) = 0;

    id v15 = *(OS_dispatch_source **)((char *)&self->_ikeSessionTimeoutSource + 7);
    *(OS_dispatch_source **)((char *)&self->_ikeSessionTimeoutSource + 7) = 0;

    id v16 = *(NSObject **)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7);
    if (v16)
    {
      dispatch_source_cancel(v16);
      id v17 = *(void **)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7);
      *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7) = 0;
    }
    id v18 = *(NSObject **)((char *)&self->_linkIdleTimerSource + 7);
    if (v18)
    {
      dispatch_source_cancel(v18);
      int v19 = *(OS_dispatch_source **)((char *)&self->_linkIdleTimerSource + 7);
      *(OS_dispatch_source **)((char *)&self->_linkIdleTimerSource + 7) = 0;
    }
    [(NRLink *)self setVirtualInterface:0];
    id v20 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7);
    if (v20)
    {
      [v20 setAvailability:0];
      [*(id *)((char *)&self->_ikeSessionClassC + 7) cancel];
      id v21 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7);
      *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7) = 0;
    }
    if (*(NSMutableArray **)((char *)&self->_receivedIKEPackets + 7))
    {
      nw_path_evaluator_cancel();
      uint64_t v22 = *(NSMutableArray **)((char *)&self->_receivedIKEPackets + 7);
      *(NSMutableArray **)((char *)&self->_receivedIKEPackets + 7) = 0;
    }
  }
  else
  {
    [0 invalidateIKESessionForClass:4];
    [0 invalidateIKESessionForClass:3];
    [0 setVirtualInterface:0];
  }
}

- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5
{
  uint64_t v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v21 = sub_10003B168();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_19;
    }
LABEL_15:
    id v29 = sub_10003B168();
    _NRLogWithArgs();

    goto LABEL_19;
  }
  dispatch_assert_queue_V2(v8);
  if (!v9)
  {
    id v23 = sub_10003B168();
    int v24 = _NRLogIsLevelEnabled();

    if (!v24) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if (!v10)
  {
    id v25 = sub_10003B168();
    int v26 = _NRLogIsLevelEnabled();

    if (!v26) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if ((_NRIsUUIDNonZero() & 1) == 0)
  {
    id v27 = sub_10003B168();
    int v28 = _NRLogIsLevelEnabled();

    if (!v28) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  v34.receiver = self;
  v34.super_class = (Class)NRLinkQuickRelay;
  uint64_t v11 = [(NRLink *)&v34 initLinkWithQueue:v8 linkDelegate:v9 nrUUID:v10];
  if (!v11)
  {
    id v30 = sub_10003B168();
    int v31 = _NRLogIsLevelEnabled();

    if (v31)
    {
      id v32 = sub_10003B168();
      _NRLogWithArgs();
    }
    self = 0;
    goto LABEL_19;
  }
  self = v11;
  [(NRLink *)v11 setType:4];
  id v12 = (OS_dispatch_group *)objc_alloc_init((Class)NSMutableArray);
  id v13 = *(OS_dispatch_group **)((char *)&self->_nexusGroup + 7);
  *(OS_dispatch_group **)((char *)&self->_nexusGroup + 7) = v12;

  int v14 = (OS_dispatch_source *)objc_alloc_init((Class)NSMutableArray);
  id v15 = *(OS_dispatch_source **)((char *)&self->_ikeSessionTimeoutSource + 7);
  *(OS_dispatch_source **)((char *)&self->_ikeSessionTimeoutSource + 7) = v14;

  id v16 = objc_alloc_init(NRAnalyticsCmpnLinkQuickRelay);
  id v17 = *(OS_nw_path_evaluator **)((char *)&self->_pathEvaluator + 7);
  *(OS_nw_path_evaluator **)((char *)&self->_pathEvaluator + 7) = (OS_nw_path_evaluator *)v16;

  if (!sub_1000474D4(self))
  {
LABEL_19:
    id v20 = 0;
    goto LABEL_20;
  }
  [(NRLink *)self updateIKEv2Role:&self->_isResponder];
  id v18 = [v10 UUIDString];
  [(NRLink *)self reportEvent:3000 details:v18];

  int v19 = [(NRLink *)self linkDelegate];
  [v19 linkIsAvailable:self];

  self = self;
  id v20 = self;
LABEL_20:

  return v20;
}

@end