@interface NRLinkWired
- (BOOL)cancelWithReason:(id)a3;
- (BOOL)hasScheduledSendingLocalClassCUnlock;
- (BOOL)initiateConnection;
- (BOOL)isIKEResponder;
- (BOOL)onlyAllowClassC;
- (BOOL)remoteClassCUnlocked;
- (BOOL)resume;
- (BOOL)sendControlData:(id)a3;
- (BOOL)sentLocalClassCUnlockNotify;
- (BOOL)start;
- (BOOL)suspend;
- (NEIKEv2Listener)ikeListener;
- (NEIKEv2Session)ikeSessionClassC;
- (NEIKEv2Session)ikeSessionClassD;
- (NRPairingClient)pairingClient;
- (NSString)listenerPortString;
- (NSUUID)randomUUID;
- (OS_nw_path_evaluator)pathEvaluator;
- (id)copyDescriptionInner;
- (id)copyNotifyPayloadsToSendWithProxy:(BOOL)a3;
- (id)copyStatusString;
- (id)ikeSessionPointerForDataProtectionClass:(unsigned __int8)a3;
- (id)respondToIKESession:(id)a3 dataProtectionClass:(unsigned __int8)a4 validateAuthBlock:(id)a5;
- (unsigned)metric;
- (unsigned)setupIPsecRetryCounter;
- (void)checkPeerAvailabilityWithForceAggressive:(BOOL)a3;
- (void)handleNotifyCode:(unsigned __int16)a3 payload:(id)a4;
- (void)initiatePairing;
- (void)invalidateIKESessionClassC;
- (void)invalidateIKESessionClassD;
- (void)invalidateIKESessionForClass:(unsigned __int8)a3;
- (void)invalidateLink;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
- (void)restartIKESessionForDataProtectionClass:(unsigned __int8)a3;
- (void)retrySetupIPsec:(unsigned __int8)a3;
- (void)sendClassCUnlockedNotify;
- (void)setHasScheduledSendingLocalClassCUnlock:(BOOL)a3;
- (void)setIkeListener:(id)a3;
- (void)setIkeSessionClassC:(id)a3;
- (void)setIkeSessionClassD:(id)a3;
- (void)setIsIKEResponder:(BOOL)a3;
- (void)setListenerPortString:(id)a3;
- (void)setOnlyAllowClassC:(BOOL)a3;
- (void)setPairingClient:(id)a3;
- (void)setPathEvaluator:(id)a3;
- (void)setRandomUUID:(id)a3;
- (void)setRemoteClassCUnlocked:(BOOL)a3;
- (void)setSentLocalClassCUnlockNotify:(BOOL)a3;
- (void)setSetupIPsecRetryCounter:(unsigned int)a3;
- (void)setupIKECallbacks:(unsigned __int8)a3;
- (void)setupIPsecIfNecessary:(unsigned __int8)a3;
- (void)upgradeSessionsIfNeeded;
@end

@implementation NRLinkWired

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_randomUUID + 7), 0);
  objc_storeStrong((id *)((char *)&self->_pathEvaluator + 7), 0);
  objc_storeStrong((id *)((char *)&self->_listenerPortString + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassC + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassD + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeListener + 7), 0);
  objc_storeStrong((id *)((char *)&self->_listenerPort + 7), 0);

  objc_storeStrong((id *)((char *)&self->_setupIPsecRetryCounter + 7), 0);
}

- (void)setSetupIPsecRetryCounter:(unsigned int)a3
{
  *(_DWORD *)(&self->_onlyAllowClassC + 2) = a3;
}

- (unsigned)setupIPsecRetryCounter
{
  return *(_DWORD *)(&self->_onlyAllowClassC + 2);
}

- (void)setOnlyAllowClassC:(BOOL)a3
{
  self->_onlyAllowClassC = a3;
}

- (BOOL)onlyAllowClassC
{
  return self->_onlyAllowClassC;
}

- (void)setPairingClient:(id)a3
{
}

- (NRPairingClient)pairingClient
{
  return *(NRPairingClient **)((char *)&self->_randomUUID + 7);
}

- (void)setRemoteClassCUnlocked:(BOOL)a3
{
  self->_remoteClassCUnlocked = a3;
}

- (BOOL)remoteClassCUnlocked
{
  return self->_remoteClassCUnlocked;
}

- (void)setRandomUUID:(id)a3
{
}

- (NSUUID)randomUUID
{
  return *(NSUUID **)((char *)&self->_pathEvaluator + 7);
}

- (void)setIsIKEResponder:(BOOL)a3
{
  self->_isIKEResponder = a3;
}

- (BOOL)isIKEResponder
{
  return self->_isIKEResponder;
}

- (void)setPathEvaluator:(id)a3
{
}

- (OS_nw_path_evaluator)pathEvaluator
{
  return *(OS_nw_path_evaluator **)((char *)&self->_listenerPortString + 7);
}

- (void)setSentLocalClassCUnlockNotify:(BOOL)a3
{
  self->_sentLocalClassCUnlockNotify = a3;
}

- (BOOL)sentLocalClassCUnlockNotify
{
  return self->_sentLocalClassCUnlockNotify;
}

- (void)setHasScheduledSendingLocalClassCUnlock:(BOOL)a3
{
  self->_hasScheduledSendingLocalClassCUnlock = a3;
}

- (BOOL)hasScheduledSendingLocalClassCUnlock
{
  return self->_hasScheduledSendingLocalClassCUnlock;
}

- (void)setListenerPortString:(id)a3
{
}

- (NSString)listenerPortString
{
  return *(NSString **)((char *)&self->_ikeSessionClassC + 7);
}

- (void)setIkeSessionClassC:(id)a3
{
}

- (NEIKEv2Session)ikeSessionClassC
{
  return *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7);
}

- (void)setIkeSessionClassD:(id)a3
{
}

- (NEIKEv2Session)ikeSessionClassD
{
  return *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7);
}

- (void)setIkeListener:(id)a3
{
}

- (NEIKEv2Listener)ikeListener
{
  return *(NEIKEv2Listener **)((char *)&self->_listenerPort + 7);
}

- (BOOL)resume
{
  if (self->super._state == 255)
  {
    v4 = (void *)_NRCopyLogObjectForNRUUID();
    BOOL v5 = 1;
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      v7 = (void *)_NRCopyLogObjectForNRUUID();
      id v17 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)NRLinkWired;
    if ([(NRLink *)&v18 resume])
    {
      companionProxyAgent = self->super._companionProxyAgent;
      if (companionProxyAgent)
      {
        if (sub_1000644C0((uint64_t)companionProxyAgent))
        {
          [(NRLink *)self reportEvent:12002];
        }
        else
        {
          v8 = (void *)_NRCopyLogObjectForNRUUID();
          int v9 = _NRLogIsLevelEnabled();

          if (v9)
          {
            v10 = (void *)_NRCopyLogObjectForNRUUID();
            uint64_t v15 = 1031;
            id v16 = [(NRLink *)self copyDescription];
            v13 = "";
            v14 = "-[NRLinkWired resume]";
            _NRLogWithArgs();
          }
        }
      }
      [(NRLink *)self changeStateTo:8, @"(resume)", v13, v14, v15, v16 details];
      [(NRLink *)self setInterfaceRank];
      v11 = [(NRLink *)self linkDelegate];
      [v11 linkIsReady:self];

      return 1;
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (BOOL)suspend
{
  v16.receiver = self;
  v16.super_class = (Class)NRLinkWired;
  [(NRLink *)&v16 suspend];
  if (self->super._state != 255)
  {
    companionProxyAgent = self->super._companionProxyAgent;
    if (companionProxyAgent)
    {
      if (sub_1000638F4((uint64_t)companionProxyAgent))
      {
        [(NRLink *)self reportEvent:12003];
      }
      else
      {
        v7 = (void *)_NRCopyLogObjectForNRUUID();
        int IsLevelEnabled = _NRLogIsLevelEnabled();

        if (IsLevelEnabled)
        {
          int v9 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v13 = 1003;
          id v14 = [(NRLink *)self copyDescription];
          v11 = "";
          v12 = "-[NRLinkWired suspend]";
          _NRLogWithArgs();
        }
      }
    }
    [(NRLink *)self changeStateTo:9, @"(suspend)", v11, v12, v13, v14 details];
    [(NRLink *)self setInterfaceRank];
    v6 = [(NRLink *)self linkDelegate];
    [v6 linkIsSuspended:self];
    goto LABEL_10;
  }
  v4 = (void *)_NRCopyLogObjectForNRUUID();
  int v5 = _NRLogIsLevelEnabled();

  if (v5)
  {
    v6 = (void *)_NRCopyLogObjectForNRUUID();
    id v15 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();

LABEL_10:
  }
  return 1;
}

- (void)handleNotifyCode:(unsigned __int16)a3 payload:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  v7 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    int v9 = (void *)_NRCopyLogObjectForNRUUID();
    id v12 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();
  }
  switch(v4)
  {
    case 48701:
      char v16 = 0;
      if ([v6 length])
      {
        [v6 getBytes:&v16 length:1];
        if (v16 < 0 && ![(NRLinkWired *)self remoteClassCUnlocked])
        {
          [(NRLinkWired *)self setRemoteClassCUnlocked:1];
          objc_initWeak(&location, self);
          self;
          if (qword_1001F4DE0 != -1) {
            dispatch_once(&qword_1001F4DE0, &stru_1001C8A30);
          }
          id v11 = (id)qword_1001F4DD8;
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_1000CB3C8;
          v13[3] = &unk_1001C7FF0;
          objc_copyWeak(&v14, &location);
          sub_10015969C((uint64_t)v11, v13);

          objc_destroyWeak(&v14);
          objc_destroyWeak(&location);
        }
      }
      break;
    case 50701:
      sub_10014A7E0((uint64_t)NRDLocalDevice, v6, self->super._nrUUID);
      [(NRLink *)self checkProxyAgentWithForceUpdate:0];
      break;
    case 50702:
      v10 = [(NRLink *)self linkDelegate];
      [v10 linkDidReceiveData:self data:v6];

      break;
  }
}

- (void)upgradeSessionsIfNeeded
{
  if (!self
    || !self->_upgradeSessionAfterFirstUnlock
    || ![(NRLinkWired *)self sentLocalClassCUnlockNotify]
    || ![(NRLinkWired *)self remoteClassCUnlocked])
  {
    return;
  }
  self;
  if (qword_1001F4DE0 != -1) {
    dispatch_once(&qword_1001F4DE0, &stru_1001C8A30);
  }
  v3 = (dispatch_queue_t *)(id)qword_1001F4DD8;
  if (!v3)
  {
LABEL_21:

    return;
  }
  int v4 = v3;
  dispatch_assert_queue_V2(v3[2]);
  if (!*((unsigned char *)v4 + 10))
  {
    *((unsigned char *)v4 + 10) = 1;
    if (*((unsigned char *)v4 + 8) == 4)
    {
      sub_100158FD0((uint64_t)v4);
      if (*((unsigned char *)v4 + 9))
      {
        *((unsigned char *)v4 + 8) = 3;
        sub_100159248((uint64_t)v4);
      }
    }
  }
  int v5 = (_BYTE)v4[1] & 0xFD;

  if (v5 == 1 && ![(NRLink *)self ikeClassCEstablished])
  {
    if ([(NRLink *)self state] == 8)
    {
      [(NRLinkWired *)self suspend];
      [(NRLinkWired *)self invalidateIKESessionClassD];
      [(NRLinkWired *)self setupIPsecIfNecessary:3];
      return;
    }
    id v6 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      return;
    }
    int v9 = (dispatch_queue_t *)_NRCopyLogObjectForNRUUID();
    id v8 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();

    v3 = v9;
    goto LABEL_21;
  }
}

- (void)sendClassCUnlockedNotify
{
  if ([(NRLink *)self state] == 8)
  {
    v3 = [(NRLinkWired *)self ikeSessionClassD];

    if (v3)
    {
      if (![(NRLinkWired *)self hasScheduledSendingLocalClassCUnlock])
      {
        [(NRLinkWired *)self setHasScheduledSendingLocalClassCUnlock:1];
        objc_initWeak(&location, self);
        self;
        if (qword_1001F4DE0 != -1) {
          dispatch_once(&qword_1001F4DE0, &stru_1001C8A30);
        }
        id v4 = (id)qword_1001F4DD8;
        v5[0] = _NSConcreteStackBlock;
        v5[1] = 3221225472;
        v5[2] = sub_1000CB764;
        v5[3] = &unk_1001C7FF0;
        objc_copyWeak(&v6, &location);
        sub_10015969C((uint64_t)v4, v5);

        objc_destroyWeak(&v6);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (BOOL)sendControlData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [objc_alloc((Class)NEIKEv2PrivateNotify) initWithNotifyStatus:50702 notifyData:v4];
    BOOL v6 = v5 != 0;
    if (v5)
    {
      objc_initWeak(&location, self);
      v7 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7);
      id v20 = v5;
      id v8 = +[NSArray arrayWithObjects:&v20 count:1];
      int v9 = [(NRLink *)self queue];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000CBCC8;
      v17[3] = &unk_1001C7A00;
      objc_copyWeak(&v18, &location);
      [v7 sendPrivateNotifies:v8 maxRetries:10 retryIntervalInMilliseconds:1000 callbackQueue:v9 callback:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      id v14 = sub_1000CBC74();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        id v16 = sub_1000CBC74();
        _NRLogWithArgs();
      }
    }
  }
  else
  {
    id v11 = sub_1000CBC74();
    int v12 = _NRLogIsLevelEnabled();

    if (v12)
    {
      id v13 = sub_1000CBC74();
      _NRLogWithArgs();
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyNotifyPayloadsToSendWithProxy:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  __int16 v26 = 5632;
  id v6 = [objc_alloc((Class)NSMutableData) initWithBytes:&v26 length:2];
  id v7 = [objc_alloc((Class)NEIKEv2PrivateNotify) initWithNotifyStatus:48602 notifyData:v6];
  [v5 addObject:v7];

  if (qword_1001F4B70 != -1) {
    dispatch_once(&qword_1001F4B70, &stru_1001C7C18);
  }
  id v8 = (id)qword_1001F4B68;
  int v9 = [v8 dataUsingEncoding:4];

  id v10 = [objc_alloc((Class)NEIKEv2PrivateNotify) initWithNotifyStatus:48603 notifyData:v9];
  [v5 addObject:v10];

  if (qword_1001F4B60 != -1) {
    dispatch_once(&qword_1001F4B60, &stru_1001C7BF8);
  }
  id v11 = (id)qword_1001F4B58;
  int v12 = [v11 dataUsingEncoding:4];

  id v13 = [objc_alloc((Class)NEIKEv2PrivateNotify) initWithNotifyStatus:48604 notifyData:v12];
  [v5 addObject:v13];

  id v14 = sub_10011FC08();
  [v5 addObject:v14];

  if (v3)
  {
    id v15 = [(NRLink *)self nrUUID];
    id v16 = sub_10013DC5C((uint64_t)NRDLocalDevice, v15);

    if (v16) {
      id v17 = (void *)v16[16];
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;
    id v19 = [v18 proxyCapability];

    if (v19 == (id)1)
    {
      if (v16) {
        id v20 = (void *)v16[16];
      }
      else {
        id v20 = 0;
      }
      id v21 = v20;
      unsigned __int8 v22 = [v21 hasCompanionDatapath];

      if (v22)
      {
        v23 = 0;
      }
      else
      {
        v23 = [(NRLink *)self localOuterEndpoint];
      }
      id v24 = sub_10011FDA0(v16, v23);
      [v5 addObject:v24];
    }
  }
  return v5;
}

- (id)respondToIKESession:(id)a3 dataProtectionClass:(unsigned __int8)a4 validateAuthBlock:(id)a5
{
  uint64_t v6 = a4;
  id v9 = a3;
  id v10 = (uint64_t (**)(id, void *))a5;
  if (v9)
  {
    String = (void *)NRDataProtectionClassCreateString();
    int v12 = sub_10013DC5C((uint64_t)NRDLocalDevice, self->super._nrUUID);
    id v13 = sub_10013EF3C(v12, v6);
    id v14 = v13;
    if (v13) {
      id v15 = (void *)*((void *)v13 + 1);
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    if (!v16)
    {
      [(NRLink *)self reportEvent:3019, @"%@ %@ %@", String, v9, v12 detailsFormat];
      id v21 = 0;
LABEL_17:

LABEL_18:
      goto LABEL_19;
    }
    if (v6 == 3)
    {
      if (v12)
      {
        unsigned __int8 v22 = sub_10015BD9C();
        dispatch_assert_queue_V2(v22);

        id v18 = (void *)sub_1001416EC(v12, @"0");
        v23 = sub_10015BD9C();
        dispatch_assert_queue_V2(v23);

        id v20 = sub_1001418A8(v12, @"0");
        goto LABEL_12;
      }
    }
    else
    {
      if (v6 != 4)
      {
LABEL_13:
        id v24 = sub_10011F560(0, v12, v6);
        id v25 = [(NRLinkWired *)self copyNotifyPayloadsToSendWithProxy:sub_10011FD1C(v12)];
        [v24 setCustomIKEAuthPrivateNotifies:v25];
        if (v10[2](v10, v24))
        {
          [(NRLinkWired *)self invalidateIKESessionForClass:v6];
          objc_storeStrong([(NRLinkWired *)self ikeSessionPointerForDataProtectionClass:v6], a3);
          [(NRLinkWired *)self setupIKECallbacks:v6];
          [(NRLink *)self reportEvent:3016, @"%@ %@", String, v9 detailsFormat];
          id v21 = v24;
        }
        else
        {
          [(NRLink *)self reportEvent:3021, @"%@ %@", String, v9 detailsFormat];
          id v21 = 0;
        }

        goto LABEL_17;
      }
      if (v12)
      {
        id v17 = sub_10015BD9C();
        dispatch_assert_queue_V2(v17);

        id v18 = sub_100140FAC(v12, @"0");
        id v19 = sub_10015BD9C();
        dispatch_assert_queue_V2(v19);

        id v20 = sub_1001414DC(v12, @"0");
LABEL_12:

        goto LABEL_13;
      }
    }
    id v20 = 0;
    id v18 = 0;
    goto LABEL_12;
  }
  id v27 = sub_1000CBC74();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    String = sub_1000CBC74();
    _NRLogWithArgs();
    id v21 = 0;
    goto LABEL_18;
  }
  id v21 = 0;
LABEL_19:

  return v21;
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v55 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = (void (**)(id, void *, id, NEVirtualInterface_s *))a8;
  if (v55)
  {
    if (v14)
    {
      if (v15)
      {
        if (v17)
        {
          if (v18)
          {
            id v19 = (void *)_NRCopyLogObjectForNRUUID();
            int IsLevelEnabled = _NRLogIsLevelEnabled();

            if (IsLevelEnabled)
            {
              id v21 = (void *)_NRCopyLogObjectForNRUUID();
              id v53 = v15;
              id v54 = v16;
              uint64_t v48 = 683;
              id v49 = [(NRLink *)self copyDescription];
              id v50 = v55;
              id v52 = v14;
              v46 = "";
              v47 = "-[NRLinkWired requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]";
              _NRLogWithArgs();
            }
            if (self->super._state != 255)
            {
              unsigned __int8 v22 = [v15 localIdentifier];
              if (qword_1001F4C30 != -1) {
                dispatch_once(&qword_1001F4C30, &stru_1001C7E50);
              }
              id v23 = (id)qword_1001F4C28;
              unsigned int v24 = [v22 isEqual:v23];

              if (v24)
              {
                if (v16)
                {
                  id v25 = sub_10011F1E0();
                  [v25 setMode:2];
                  [v25 setReplayWindowSize:4];
LABEL_25:
                  v33 = -[NRLinkWired respondToIKESession:dataProtectionClass:validateAuthBlock:](self, "respondToIKESession:dataProtectionClass:validateAuthBlock:", v14, 4, v17, v46, v47, v48, v49, v50, v52, v53, v54);
                  goto LABEL_26;
                }
                if (![(NRLink *)self hasCompanionDatapath])
                {
                  id v25 = 0;
                  goto LABEL_25;
                }
                [(NRLink *)self reportEvent:3024, @"ClassD %@", v14, v47, v48, v49, v50, v52, v53, v54 detailsFormat];
                goto LABEL_21;
              }
              __int16 v26 = [v15 localIdentifier];
              if (qword_1001F4C40 != -1) {
                dispatch_once(&qword_1001F4C40, &stru_1001C7E70);
              }
              id v27 = (id)qword_1001F4C38;
              unsigned int v28 = [v26 isEqual:v27];

              if (v28)
              {
                if (v16)
                {
                  id v25 = sub_10011F1E0();
                  [v25 setMode:2];
                  [v25 setReplayWindowSize:4];
LABEL_36:
                  self;
                  if (qword_1001F4DE0 != -1) {
                    dispatch_once(&qword_1001F4DE0, &stru_1001C8A30);
                  }
                  id v34 = (id)qword_1001F4DD8;
                  v35 = v34;
                  if (v34)
                  {
                    dispatch_assert_queue_V2(*((dispatch_queue_t *)v34 + 2));
                    if (!v35[10])
                    {
                      v35[10] = 1;
                      if (v35[8] == 4)
                      {
                        sub_100158FD0((uint64_t)v35);
                        if (v35[9])
                        {
                          v35[8] = 3;
                          sub_100159248((uint64_t)v35);
                        }
                      }
                    }
                    if ((v35[8] & 0xFD) == 1)
                    {
                      v33 = [(NRLinkWired *)self respondToIKESession:v14 dataProtectionClass:3 validateAuthBlock:v17];

LABEL_26:
                      if ([(NRLink *)self setupVirtualInterface])
                      {
                        v18[2](v18, v33, v25, [(NRLink *)self virtualInterface]);
LABEL_29:

LABEL_30:
                        goto LABEL_31;
                      }
LABEL_28:
                      v18[2](v18, 0, 0, 0);
                      goto LABEL_29;
                    }
                  }
                  [(NRLink *)self reportEvent:3020, @"ClassC %@", v14, v47, v48, v49, v50, v52, v53, v54 detailsFormat];
                  [(NRLinkWired *)self sendClassCUnlockedNotify];

LABEL_22:
                  v33 = 0;
                  goto LABEL_28;
                }
                if (![(NRLink *)self hasCompanionDatapath])
                {
                  id v25 = 0;
                  goto LABEL_36;
                }
                [(NRLink *)self reportEvent:3024, @"ClassC %@", v14, v47, v48, v49, v50, v52, v53, v54 detailsFormat];
              }
              else
              {
                v29 = (void *)_NRCopyLogObjectForNRUUID();
                int v30 = _NRLogIsLevelEnabled();

                if (v30)
                {
                  v31 = (void *)_NRCopyLogObjectForNRUUID();
                  id v32 = [(NRLink *)self copyDescription];
                  v51 = [v15 localIdentifier];
                  _NRLogWithArgs();
                }
              }
            }
LABEL_21:
            id v25 = 0;
            goto LABEL_22;
          }
          id v44 = sub_1000CBC74();
          int v45 = _NRLogIsLevelEnabled();

          if (v45)
          {
LABEL_55:
            v33 = sub_1000CBC74();
            _NRLogWithArgs();
            goto LABEL_30;
          }
        }
        else
        {
          id v42 = sub_1000CBC74();
          int v43 = _NRLogIsLevelEnabled();

          if (v43) {
            goto LABEL_55;
          }
        }
      }
      else
      {
        id v40 = sub_1000CBC74();
        int v41 = _NRLogIsLevelEnabled();

        if (v41) {
          goto LABEL_55;
        }
      }
    }
    else
    {
      id v38 = sub_1000CBC74();
      int v39 = _NRLogIsLevelEnabled();

      if (v39) {
        goto LABEL_55;
      }
    }
  }
  else
  {
    id v36 = sub_1000CBC74();
    int v37 = _NRLogIsLevelEnabled();

    if (v37) {
      goto LABEL_55;
    }
  }
LABEL_31:
}

- (void)retrySetupIPsec:(unsigned __int8)a3
{
  [(NRLinkWired *)self setSetupIPsecRetryCounter:[(NRLinkWired *)self setupIPsecRetryCounter] + 1];
  if ([(NRLinkWired *)self setupIPsecRetryCounter] > 4)
  {
    [(NRLinkWired *)self cancelWithReason:@"IKE session creation hit max retries"];
  }
  else
  {
    [(NRLink *)self reportEvent:3026];
    objc_initWeak(&location, self);
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    uint64_t v6 = [(NRLink *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CCA9C;
    block[3] = &unk_1001C73C0;
    objc_copyWeak(&v8, &location);
    unsigned __int8 v9 = a3;
    dispatch_after(v5, v6, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)setupIPsecIfNecessary:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (![(NRLinkWired *)self isIKEResponder])
  {
    id v7 = [(NRLinkWired *)self ikeSessionPointerForDataProtectionClass:v3];
    if (*v7) {
      return;
    }
    id v8 = v7;
    String = (void *)NRDataProtectionClassCreateString();
    if (self->super._state == 255)
    {
      id v19 = (void *)_NRCopyLogObjectForNRUUID();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (!IsLevelEnabled)
      {
LABEL_29:

        return;
      }
      id v11 = (void *)_NRCopyLogObjectForNRUUID();
      id v44 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
    else
    {
      id v10 = sub_10013DC5C((uint64_t)NRDLocalDevice, self->super._nrUUID);
      id v11 = v10;
      if (!v10)
      {
        v33 = (void *)_NRCopyLogObjectForNRUUID();
        int v34 = _NRLogIsLevelEnabled();

        if (!v34) {
          goto LABEL_28;
        }
        goto LABEL_19;
      }
      id v12 = sub_10013EF3C(v10, v3);

      if (v12)
      {
        id v13 = sub_10011EF54();
        sub_10011EC44(v11, v13);
        [v13 setRandomizeLocalPort:1];
        id v14 = [(NRLink *)self localInterfaceName];
        [v13 setOutgoingInterfaceName:v14];

        id v15 = [(NRLink *)self remoteOuterEndpoint];
        [v13 setRemoteEndpoint:v15];

        [v13 setRequestChildlessSA:-[NRLink hasCompanionDatapath](self, "hasCompanionDatapath") ^ 1];
        if (qword_1001F4B80 != -1) {
          dispatch_once(&qword_1001F4B80, &stru_1001C7C38);
        }
        if (byte_1001F4B78)
        {
          id v16 = [(NRLink *)self remoteOuterEndpoint];
          id v17 = [v16 addressFamily];

          if (v17 == (id)2)
          {
            LODWORD(v51) = 0;
            uint64_t v50 = 0;
            unsigned __int16 v18 = 528;
          }
          else
          {
            uint64_t v50 = 0;
            uint64_t v51 = 0;
            uint64_t v52 = 0;
            unsigned __int16 v18 = 7708;
          }
          unsigned int v49 = v18 | 0x94110000;
          unsigned int v24 = +[NWAddressEndpoint endpointWithAddress:&v49];
          [v13 setLocalEndpoint:v24];

          [v13 setForceUDPEncapsulation:1];
        }
        id v25 = sub_10011F560(1, v11, v3);
        [(NRLinkWired *)self invalidateIKESessionForClass:v3];
        id v26 = sub_10011F1E0();
        [v26 setMode:2];
        [v26 setReplayWindowSize:4];
        sub_10011EDEC(v11, v26);
        id v47 = [objc_alloc((Class)NSString) initWithFormat:@"terminus-Wired-%@", String];
        id v27 = [objc_alloc((Class)NEIKEv2Session) initWithIKEConfig:v13 firstChildConfig:v26 sessionConfig:v25 queue:self->super._queue ipsecInterface:[NRLink virtualInterface](self, "virtualInterface") kernelSASessionName:0 packetDelegate:v47];
        id v28 = *v8;
        id *v8 = v27;

        if (*v8)
        {
          [(NRLink *)self reportEvent:3015, @"%@ %@", String, *v8 detailsFormat];
          [(NRLinkWired *)self setupIKECallbacks:v3];
          v29 = (void *)_NRCopyLogObjectForNRUUID();
          int v30 = _NRLogIsLevelEnabled();

          if (v30)
          {
            v31 = (void *)_NRCopyLogObjectForNRUUID();
            id v32 = [(NRLink *)self copyDescription];
            int v45 = String;
            id v46 = *v8;
            uint64_t v42 = 643;
            id v43 = v32;
            int v39 = "";
            int v41 = "-[NRLinkWired setupIPsecIfNecessary:]";
            _NRLogWithArgs();
          }
          [*v8 connect:v39 v41 v42 v43 v45 v46];
        }
        else
        {
          v35 = (void *)_NRCopyLogObjectForNRUUID();
          int v36 = _NRLogIsLevelEnabled();

          if (v36)
          {
            int v37 = (void *)_NRCopyLogObjectForNRUUID();
            id v38 = [(NRLink *)self copyDescription];
            id v40 = String;
            _NRLogWithArgs();
          }
          -[NRLinkWired retrySetupIPsec:](self, "retrySetupIPsec:", v3, v38, v40);
        }

        goto LABEL_27;
      }
      id v21 = (void *)_NRCopyLogObjectForNRUUID();
      int v22 = _NRLogIsLevelEnabled();

      if (v22)
      {
LABEL_19:
        id v13 = (void *)_NRCopyLogObjectForNRUUID();
        id v23 = [(NRLink *)self copyDescription];
        _NRLogWithArgs();

LABEL_27:
      }
    }
LABEL_28:

    goto LABEL_29;
  }
  self;
  if (qword_1001F47E8 != -1) {
    dispatch_once(&qword_1001F47E8, &stru_1001C5EF8);
  }
  id v48 = (id)qword_1001F47E0;
  dispatch_time_t v5 = [(NRLink *)self localInterfaceName];
  uint64_t v6 = [(NRLink *)self localOuterEndpoint];
  sub_100011C08((uint64_t)v48, self, v5, v6);
}

- (void)setupIKECallbacks:(unsigned __int8)a3
{
  int v3 = a3;
  String = (void *)NRDataProtectionClassCreateString();
  if (v3 == 3)
  {
    uint64_t v6 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7);
    if (!v6)
    {
      id v28 = sub_1000CBC74();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (!IsLevelEnabled) {
        goto LABEL_13;
      }
      goto LABEL_16;
    }
  }
  else
  {
    if (v3 != 4)
    {
      id v25 = (void *)_NRCopyLogObjectForNRUUID();
      int v26 = _NRLogIsLevelEnabled();

      if (v26)
      {
        id v27 = (void *)_NRCopyLogObjectForNRUUID();
        id v30 = [(NRLink *)self copyDescription];
        _NRLogWithArgs();

LABEL_12:
        goto LABEL_13;
      }
      goto LABEL_13;
    }
    uint64_t v6 = *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7);
    if (!v6)
    {
      id v7 = sub_1000CBC74();
      int v8 = _NRLogIsLevelEnabled();

      if (v8)
      {
LABEL_16:
        id v27 = sub_1000CBC74();
        _NRLogWithArgs();
        goto LABEL_12;
      }
LABEL_13:
      id v22 = 0;
      goto LABEL_14;
    }
  }
  id v9 = v6;
  [v9 setClientQueue:self->super._queue];
  objc_initWeak(location, self);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_1000CD74C;
  v57[3] = &unk_1001C72F8;
  objc_copyWeak(&v60, location);
  char v61 = v3;
  id v10 = String;
  id v58 = v10;
  id v11 = v9;
  id v59 = v11;
  [v11 setStateUpdateBlock:v57];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1000CDE9C;
  v52[3] = &unk_1001C7320;
  objc_copyWeak(&v55, location);
  id v12 = v10;
  id v53 = v12;
  id v13 = v11;
  id v54 = v13;
  char v56 = v3;
  [v13 setChildStateUpdateBlock:v52];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1000CDFD4;
  v48[3] = &unk_1001C7348;
  objc_copyWeak(&v51, location);
  id v14 = v12;
  id v49 = v14;
  id v15 = v13;
  id v50 = v15;
  [v15 setConfigurationUpdateBlock:v48];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000CE0B4;
  v44[3] = &unk_1001C7370;
  objc_copyWeak(&v47, location);
  id v16 = v14;
  id v45 = v16;
  id v17 = v15;
  id v46 = v17;
  [v17 setTrafficSelectorUpdateBlock:v44];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000CE1B4;
  v40[3] = &unk_1001C7398;
  objc_copyWeak(&v43, location);
  id v18 = v16;
  id v41 = v18;
  id v19 = v17;
  id v42 = v19;
  [v19 setAdditionalAddressesUpdateBlock:v40];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000CE294;
  v36[3] = &unk_1001C79B0;
  objc_copyWeak(&v39, location);
  id v20 = v18;
  id v37 = v20;
  id v21 = v19;
  id v38 = v21;
  [v21 setShortDPDEventBlock:v36];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000CE368;
  v32[3] = &unk_1001C7398;
  objc_copyWeak(&v35, location);
  id v33 = v20;
  id v22 = v21;
  id v34 = v22;
  [v22 setPrivateNotifyStatusEvent:v32];
  id v23 = (void *)_NRCopyLogObjectForNRUUID();
  LOBYTE(v9) = _NRLogIsLevelEnabled();

  if (v9)
  {
    unsigned int v24 = (void *)_NRCopyLogObjectForNRUUID();
    id v31 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();
  }
  objc_destroyWeak(&v35);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v43);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&v51);

  objc_destroyWeak(&v55);
  objc_destroyWeak(&v60);
  objc_destroyWeak(location);

LABEL_14:
}

- (void)restartIKESessionForDataProtectionClass:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id String = (id)NRDataProtectionClassCreateString();
  if (self->super._state == 255)
  {
    int v8 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_11;
    }
LABEL_10:
    id v12 = (void *)_NRCopyLogObjectForNRUUID();
    id v13 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();

    goto LABEL_11;
  }
  [(NRLinkWired *)self invalidateIKESessionForClass:v3];
  if (v3 == 3 && ![(NRLinkWired *)self remoteClassCUnlocked])
  {
    id v10 = (void *)_NRCopyLogObjectForNRUUID();
    int v11 = _NRLogIsLevelEnabled();

    if (!v11) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  dispatch_time_t v5 = (void *)_NRCopyLogObjectForNRUUID();
  int v6 = _NRLogIsLevelEnabled();

  if (v6)
  {
    id v7 = (void *)_NRCopyLogObjectForNRUUID();
    id v17 = [(NRLink *)self copyDescription];
    id v18 = String;
    uint64_t v16 = 355;
    id v14 = "";
    id v15 = "-[NRLinkWired restartIKESessionForDataProtectionClass:]";
    _NRLogWithArgs();
  }
  -[NRLinkWired setupIPsecIfNecessary:](self, "setupIPsecIfNecessary:", v3, v14, v15, v16, v17, v18);
LABEL_11:
}

- (void)invalidateIKESessionClassC
{
}

- (void)invalidateIKESessionClassD
{
}

- (id)ikeSessionPointerForDataProtectionClass:(unsigned __int8)a3
{
  if (a3 == 4)
  {
    uint64_t v3 = &OBJC_IVAR___NRLinkWired__ikeSessionClassD;
    return (id *)((char *)&self->super.super.isa + *v3);
  }
  if (a3 == 3)
  {
    uint64_t v3 = &OBJC_IVAR___NRLinkWired__ikeSessionClassC;
    return (id *)((char *)&self->super.super.isa + *v3);
  }
  id v5 = sub_1000CBC74();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v7 = sub_1000CBC74();
    id String = (void *)NRDataProtectionClassCreateString();
    _NRLogWithArgs();
  }
  _os_log_pack_size();
  __error();
  uint64_t v8 = _os_log_pack_fill();
  uint64_t v9 = NRDataProtectionClassCreateString();
  *(_DWORD *)uint64_t v8 = 136446466;
  *(void *)(v8 + 4) = "-[NRLinkWired ikeSessionPointerForDataProtectionClass:]";
  *(_WORD *)(v8 + 12) = 2112;
  *(void *)(v8 + 14) = v9;
  sub_1000CBC74();
  id v10 = (NRLinkWired *)_NRLogAbortWithPack();
  [(NRLinkWired *)v10 invalidateIKESessionForClass:v12];
  return result;
}

- (void)invalidateIKESessionForClass:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NRLinkWired;
  -[NRLink invalidateIKESessionForClass:](&v5, "invalidateIKESessionForClass:");
  [(NRLink *)self invalidateIKESession:[(NRLinkWired *)self ikeSessionPointerForDataProtectionClass:v3]];
}

- (void)checkPeerAvailabilityWithForceAggressive:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(NRLink *)self peerAvailabilityCheckInProgress];
  int v6 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (v5)
  {
    if (IsLevelEnabled)
    {
      id v16 = (id)_NRCopyLogObjectForNRUUID();
      id v14 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
  }
  else
  {
    if (IsLevelEnabled)
    {
      uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID();
      id v15 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
    BOOL v9 = !v3;
    if (v3) {
      uint64_t v10 = 5;
    }
    else {
      uint64_t v10 = 3;
    }
    if (v9) {
      uint64_t v11 = 3000;
    }
    else {
      uint64_t v11 = 1000;
    }
    self->super._peerAvailabilityCheckInProgress = 1;
    objc_initWeak(&location, self);
    unsigned __int8 v12 = [(NRLinkWired *)self ikeSessionClassC];
    id v13 = [(NRLink *)self queue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000CEB50;
    v17[3] = &unk_1001C7A00;
    objc_copyWeak(&v18, &location);
    [v12 sendKeepaliveWithRetries:v10 retryIntervalInMilliseconds:v11 callbackQueue:v13 callback:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (BOOL)initiateConnection
{
  BOOL v3 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    unsigned int v5 = (void *)_NRCopyLogObjectForNRUUID();
    uint64_t v12 = 248;
    id v13 = [(NRLink *)self copyDescription];
    uint64_t v10 = "";
    uint64_t v11 = "-[NRLinkWired initiateConnection]";
    _NRLogWithArgs();
  }
  if (self->_isIKEResponder) {
    goto LABEL_4;
  }
  uint64_t v8 = [(NRLink *)self remoteOuterEndpoint];

  if (!v8)
  {
    CFStringRef v9 = @"No remote outer endpoint present";
    goto LABEL_15;
  }
  if (![(NRLink *)self setupVirtualInterface])
  {
    CFStringRef v9 = @"failed to setup virtual interface";
LABEL_15:
    -[NRLinkWired cancelWithReason:](self, "cancelWithReason:", v9, v10, v11, v12, v13);
    return 0;
  }
LABEL_4:
  if (self->_upgradeSessionAfterFirstUnlock || ![(NRLinkWired *)self onlyAllowClassC])
  {
    -[NRLinkWired setupIPsecIfNecessary:](self, "setupIPsecIfNecessary:", 4, v10, v11, v12, v13);
  }
  else
  {
    self;
    if (qword_1001F4DE0 != -1) {
      dispatch_once(&qword_1001F4DE0, &stru_1001C8A30);
    }
    id v6 = (id)qword_1001F4DD8;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000CEE60;
    v14[3] = &unk_1001C8BA8;
    v14[4] = self;
    sub_10015969C((uint64_t)v6, v14);
  }
  return 1;
}

- (void)initiatePairing
{
  BOOL v3 = sub_10013DC5C((uint64_t)NRDLocalDevice, self->super._nrUUID);
  id v4 = objc_alloc_init(NRPairingParameters);
  unsigned int v5 = [(NRLink *)self localInterfaceName];
  if (v4) {
    objc_storeStrong((id *)&v4->_localInterfaceName, v5);
  }

  id v6 = [(NRLink *)self localOuterEndpoint];
  if (v4) {
    objc_storeStrong((id *)&v4->_localEndpoint, v6);
  }

  id v7 = [(NRLink *)self remoteOuterEndpoint];
  uint64_t v8 = v7;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_remoteEndpoint, v7);

    v4->_isResponder = self->_isIKEResponder;
  }
  else
  {
  }
  objc_initWeak(&location, self);
  CFStringRef v9 = sub_10000D5AC((id *)[NRPairingClient alloc], self->super._queue, self->super._nrUUID, v4);
  objc_initWeak(&from, v9);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000CF10C;
  v18[3] = &unk_1001C72D0;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  uint64_t v10 = v18;
  uint64_t v11 = v10;
  if (v9 && !*((unsigned char *)v9 + 10))
  {
    uint64_t v12 = objc_retainBlock(v10);
    id v13 = v9[18];
    v9[18] = v12;
  }
  sub_10000D924((uint64_t)v9);
  objc_storeStrong((id *)((char *)&self->_randomUUID + 7), v9);
  id v14 = (void *)_NRCopyLogObjectForNRUUID();
  char IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v16 = (void *)_NRCopyLogObjectForNRUUID();
    id v17 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

- (BOOL)cancelWithReason:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v14];
    [(NRLink *)self reportEvent:3005 details:v5];
    if ([(NRLink *)self changeStateTo:255])
    {
      id v6 = [(NRLink *)self linkDelegate];
      [v6 linkIsUnavailable:self];

      [(NRLinkWired *)self invalidateLink];
    }
    else
    {
      id v7 = (void *)_NRCopyLogObjectForNRUUID();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        CFStringRef v9 = (void *)_NRCopyLogObjectForNRUUID();
        id v13 = [(NRLink *)self copyDescription];
        _NRLogWithArgs();
      }
    }
  }
  else
  {
    id v11 = sub_1000CBC74();
    int v12 = _NRLogIsLevelEnabled();

    if (!v12) {
      goto LABEL_7;
    }
    id v5 = sub_1000CBC74();
    _NRLogWithArgs();
  }

LABEL_7:
  return v4 != 0;
}

- (BOOL)start
{
  if ([(NRLink *)self state] == 8)
  {
    BOOL v3 = [(NRLink *)self linkDelegate];
    [v3 linkIsReady:self];
LABEL_3:

    return 1;
  }
  if ([(NRLink *)self startRequested]) {
    return 1;
  }
  [(NRLink *)self setStartRequested:1];
  id v5 = [(NRLink *)self localInterfaceName];

  if (!v5)
  {
    id v11 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      return 0;
    }
    uint64_t v10 = (void *)_NRCopyLogObjectForNRUUID();
    id v14 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();

    goto LABEL_15;
  }
  if ([(NRLink *)self state] != 1)
  {
    uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID();
    int v9 = _NRLogIsLevelEnabled();

    if (!v9) {
      return 0;
    }
    uint64_t v10 = (void *)_NRCopyLogObjectForNRUUID();
    id v13 = [(NRLink *)self copyDescription];
    id v15 = sub_10011A480([(NRLink *)self state]);
    _NRLogWithArgs();

LABEL_15:
    return 0;
  }
  [(NRLink *)self reportEvent:3001];
  [(NRLink *)self updateIKEv2Role:&self->_isIKEResponder];
  if ([(NRLinkWired *)self isIKEResponder]
    || ([(NRLink *)self remoteOuterEndpoint],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = sub_10013DC5C((uint64_t)NRDLocalDevice, self->super._nrUUID);
    BOOL v3 = v7;
    if (v7 && v7[12]) {
      [(NRLinkWired *)self initiateConnection];
    }
    else {
      [(NRLinkWired *)self initiatePairing];
    }
    goto LABEL_3;
  }
  [(NRLinkWired *)self cancelWithReason:@"No remote outer endpoint present"];
  return 0;
}

- (unsigned)metric
{
  return 40;
}

- (id)copyDescriptionInner
{
  id v3 = objc_alloc((Class)NSString);
  v9.receiver = self;
  v9.super_class = (Class)NRLinkWired;
  id v4 = [(NRLink *)&v9 copyDescriptionInner];
  id v5 = [(NRLink *)self localOuterEndpoint];
  id v6 = [(NRLink *)self remoteOuterEndpoint];
  id v7 = [v3 initWithFormat:@"%@, %@ -> %@", v4, v5, v6];

  return v7;
}

- (void)invalidateLink
{
  v12.receiver = self;
  v12.super_class = (Class)NRLinkWired;
  [(NRLink *)&v12 invalidateLink];
  [(NRLinkWired *)self invalidateIKESessionClassD];
  [(NRLinkWired *)self invalidateIKESessionClassC];
  id v3 = [(NRLinkWired *)self ikeListener];

  if (v3)
  {
    id v4 = [(NRLinkWired *)self ikeListener];
    [v4 cancel];

    [(NRLinkWired *)self setIkeListener:0];
  }
  companionProxyAgent = self->super._companionProxyAgent;
  if (companionProxyAgent)
  {
    sub_1000638F4((uint64_t)companionProxyAgent);
    [(NRLink *)self reportEvent:12003];
    id v6 = self->super._companionProxyAgent;
    self->super._companionProxyAgent = 0;
  }
  id v7 = [(NRLinkWired *)self pairingClient];

  if (v7)
  {
    uint64_t v8 = [(NRLinkWired *)self pairingClient];
    objc_super v9 = (void *)v8;
    if (v8)
    {
      sub_100008148(v8);
      sub_100007ADC((uint64_t)v9, 6, 0);
    }

    [(NRLinkWired *)self setPairingClient:0];
  }
  [(NRLink *)self invalidateVirtualInterface];
  uint64_t v10 = [(NRLinkWired *)self pathEvaluator];

  if (v10)
  {
    id v11 = [(NRLinkWired *)self pathEvaluator];
    nw_path_evaluator_cancel();

    [(NRLinkWired *)self setPathEvaluator:0];
  }
}

- (id)copyStatusString
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = [(NRLink *)self description];
  id v5 = [v3 initWithString:v4];

  [v5 appendFormat:@"\n %35s = %@", "nrUUID", self->super._nrUUID];
  id v6 = [(NRLink *)self localInterfaceName];
  [v5 appendFormat:@"\n %35s = %@", "localInterfaceName", v6];

  [v5 appendFormat:@"\n %35s = %@", "listenerPortString", *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7)];
  [v5 appendFormat:@"\n %35s = %@", "ikeSessionClassD", *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7)];
  [v5 appendFormat:@"\n %35s = %@", "ikeSessionClassC", *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7)];
  if (self->super._virtualInterface)
  {
    id v7 = (void *)NEVirtualInterfaceCopyName();
    [v5 appendFormat:@"\n %35s = %@", "virtualInterfaceName", v7];
  }
  return v5;
}

@end