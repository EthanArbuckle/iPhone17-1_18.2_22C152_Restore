@interface NRLinkFixedInterface
- (BOOL)cancelWithReason:(id)a3;
- (BOOL)resume;
- (BOOL)sendControlData:(id)a3;
- (BOOL)start;
- (BOOL)suspend;
- (id)copyDescriptionInner;
- (id)copyStatusString;
- (unsigned)metric;
- (void)invalidateIKESessionForClass:(unsigned __int8)a3;
- (void)invalidateLink;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
@end

@implementation NRLinkFixedInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_listenerPortString + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassD + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeListener + 7), 0);
  objc_storeStrong((id *)((char *)&self->_listenerPort + 7), 0);

  objc_storeStrong((id *)(&self->_hasScheduledSendingLocalClassCUnlock + 7), 0);
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
    v18.super_class = (Class)NRLinkFixedInterface;
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
            uint64_t v15 = 683;
            id v16 = [(NRLink *)self copyDescription];
            v13 = "";
            v14 = "-[NRLinkFixedInterface resume]";
            _NRLogWithArgs();
          }
        }
      }
      [(NRLink *)self changeStateTo:8, @"(resume)", v13, v14, v15, v16 details];
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
  v16.super_class = (Class)NRLinkFixedInterface;
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
          uint64_t v13 = 656;
          id v14 = [(NRLink *)self copyDescription];
          v11 = "";
          v12 = "-[NRLinkFixedInterface suspend]";
          _NRLogWithArgs();
        }
      }
    }
    [(NRLink *)self changeStateTo:9, @"(suspend)", v11, v12, v13, v14 details];
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
      v7 = *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7);
      id v20 = v5;
      v8 = +[NSArray arrayWithObjects:&v20 count:1];
      int v9 = [(NRLink *)self queue];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100067DD0;
      v17[3] = &unk_1001C7A00;
      objc_copyWeak(&v18, &location);
      [v7 sendPrivateNotifies:v8 maxRetries:10 retryIntervalInMilliseconds:1000 callbackQueue:v9 callback:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      id v14 = sub_100067D7C();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        id v16 = sub_100067D7C();
        _NRLogWithArgs();
      }
    }
  }
  else
  {
    id v11 = sub_100067D7C();
    int v12 = _NRLogIsLevelEnabled();

    if (v12)
    {
      id v13 = sub_100067D7C();
      _NRLogWithArgs();
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14 = (char *)a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = (uint64_t (**)(id, void *))a7;
  id v19 = a8;
  id v20 = (void (**)(void, void, void, void))v19;
  if (!v14)
  {
    id v42 = sub_100067D7C();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_44;
    }
LABEL_36:
    id v52 = sub_100067D7C();
    _NRLogWithArgs();

    goto LABEL_44;
  }
  if (!v15)
  {
    id v44 = sub_100067D7C();
    int v45 = _NRLogIsLevelEnabled();

    if (!v45) {
      goto LABEL_44;
    }
    goto LABEL_36;
  }
  if (!v16)
  {
    id v46 = sub_100067D7C();
    int v47 = _NRLogIsLevelEnabled();

    if (!v47) {
      goto LABEL_44;
    }
    goto LABEL_36;
  }
  if (!v18)
  {
    id v48 = sub_100067D7C();
    int v49 = _NRLogIsLevelEnabled();

    if (!v49) {
      goto LABEL_44;
    }
    goto LABEL_36;
  }
  if (v19)
  {
    v21 = (void *)_NRCopyLogObjectForNRUUID();
    int v22 = _NRLogIsLevelEnabled();

    if (v22)
    {
      v23 = (void *)_NRCopyLogObjectForNRUUID();
      id v58 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
    int state = self->super._state;
    id v64 = v15;
    if (state == 255) {
      goto LABEL_41;
    }
    v25 = [v16 localIdentifier];
    id v63 = a4;
    if (qword_1001F4C30 != -1) {
      dispatch_once(&qword_1001F4C30, &stru_1001C7E50);
    }
    id v26 = (id)qword_1001F4C28;
    unsigned int v27 = [v25 isEqual:v26];

    if (!v27)
    {
      v29 = v14;
      v30 = (void *)_NRCopyLogObjectForNRUUID();
      int v31 = _NRLogIsLevelEnabled();

      if (v31)
      {
        v32 = (void *)_NRCopyLogObjectForNRUUID();
        id v33 = [(NRLink *)self copyDescription];
        v59 = [v16 localIdentifier];
        _NRLogWithArgs();
      }
      v34 = 0;
      id v28 = 0;
      id v14 = v29;
      goto LABEL_42;
    }
    if (v17)
    {
      id v28 = sub_10011F1E0();
      [v28 setMode:2];
      [v28 setReplayWindowSize:4];
    }
    else
    {
      if ([(NRLink *)self hasCompanionDatapath])
      {
LABEL_40:
        [(NRLink *)self reportEvent:3024, @"ClassD %@", v15 detailsFormat];
LABEL_41:
        v34 = 0;
        id v28 = 0;
        goto LABEL_42;
      }
      id v28 = 0;
    }
    id v15 = [(NRLink *)self nrUUID];
    v35 = (id *)sub_10013DC5C((uint64_t)NRDLocalDevice, v15);

    if (v35)
    {
      id v60 = v17;
      v34 = sub_10011F560(0, v35, 4);
      id v36 = v35[16];
      unsigned __int8 v37 = [v36 hasCompanionDatapath];

      id v61 = v16;
      v62 = v14;
      if (v37)
      {
        v38 = 0;
      }
      else
      {
        v38 = [(NRLink *)self localOuterEndpoint];
      }
      id v39 = sub_10011FDA0(v35, v38);
      v65[0] = v39;
      id v40 = sub_10011FC08();
      v65[1] = v40;
      v41 = +[NSArray arrayWithObjects:v65 count:2];
      [v34 setCustomIKEAuthPrivateNotifies:v41];

      if (v18[2](v18, v34))
      {
        [(NRLinkFixedInterface *)self invalidateIKESessionForClass:4];
        objc_storeStrong((id *)((char *)&self->_ikeListener + 7), v63);
        sub_100068604(self);
        [(NRLink *)self reportEvent:3016, @"ClassD %@", v64 detailsFormat];

        id v16 = v61;
        id v14 = v62;
        id v17 = v60;
        if ([(NRLink *)self setupVirtualInterface])
        {
          ((void (**)(void, void *, id, NEVirtualInterface_s *))v20)[2](v20, v34, v28, [(NRLink *)self virtualInterface]);
LABEL_43:

          id v15 = v64;
          goto LABEL_44;
        }
      }
      else
      {
        [(NRLink *)self reportEvent:3021, @"ClassD %@", v64 detailsFormat];

        id v16 = v61;
        id v14 = v62;
        id v17 = v60;
      }
LABEL_42:
      v20[2](v20, 0, 0, 0);
      goto LABEL_43;
    }
    id v53 = sub_100067D7C();
    int v54 = _NRLogIsLevelEnabled();

    if (v54)
    {
      id v55 = sub_100067D7C();
      _NRLogWithArgs();
    }
    uint64_t v56 = _os_log_pack_size();
    id v14 = (char *)&v60 - ((__chkstk_darwin(v56) + 15) & 0xFFFFFFFFFFFFFFF0);
    __error();
    uint64_t v57 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v57 = 136446210;
    *(void *)(v57 + 4) = "-[NRLinkFixedInterface requestConfigurationForListener:session:sessionConfig:childConfig:vali"
                           "dateAuthBlock:responseBlock:]";
    sub_100067D7C();
    _NRLogAbortWithPack();
    goto LABEL_40;
  }
  id v50 = sub_100067D7C();
  int v51 = _NRLogIsLevelEnabled();

  if (v51) {
    goto LABEL_36;
  }
LABEL_44:
}

- (void)invalidateIKESessionForClass:(unsigned __int8)a3
{
  int v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NRLinkFixedInterface;
  -[NRLink invalidateIKESessionForClass:](&v5, "invalidateIKESessionForClass:");
  [(NRLink *)self invalidateIKESession:sub_10006A35C((uint64_t)self, v3)];
}

- (BOOL)cancelWithReason:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v11];
    [(NRLink *)self reportEvent:3005 details:v5];
    if ([(NRLink *)self changeStateTo:255])
    {
      BOOL v6 = [(NRLink *)self linkDelegate];
      [v6 linkIsUnavailable:self];

      [(NRLinkFixedInterface *)self invalidateLink];
    }
    else
    {
      if (qword_1001F4960 != -1) {
        dispatch_once(&qword_1001F4960, &stru_1001C69F8);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4960 != -1) {
          dispatch_once(&qword_1001F4960, &stru_1001C69F8);
        }
        _NRLogWithArgs();
      }
    }
  }
  else
  {
    id v8 = sub_100067D7C();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v10 = sub_100067D7C();
      _NRLogWithArgs();
    }
  }

  return v4 != 0;
}

- (BOOL)start
{
  uint64_t v2 = (uint64_t)self;
  if ([(NRLink *)self state] == 8)
  {
    int v3 = [(id)v2 linkDelegate];
    [v3 linkIsReady:v2];

    return 1;
  }
  if ([(id)v2 state] != 9)
  {
    if ([(id)v2 startRequested]) {
      return 1;
    }
    [(id)v2 setStartRequested:1];
    BOOL v6 = [(id)v2 localInterfaceName];

    if (!v6)
    {
      id v21 = sub_100067D7C();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (!IsLevelEnabled) {
        return 0;
      }
      id v19 = sub_100067D7C();
      _NRLogWithArgs();
LABEL_24:

      return 0;
    }
    if ([(id)v2 state] == 1)
    {
      [(id)v2 reportEvent:3001];
      v7 = [(id)v2 nrUUID];
      id v8 = sub_10013DC5C((uint64_t)NRDLocalDevice, v7);

      if (v8)
      {
        [(id)v2 setIkev2Role:sub_100118D5C(v8)];
        if ([(id)v2 ikev2Role] == 2
          && ([(id)v2 remoteOuterEndpoint],
              int v9 = objc_claimAutoreleasedReturnValue(),
              v9,
              !v9))
        {
          CFStringRef v20 = @"No remote outer endpoint present";
        }
        else
        {
          if ([(id)v2 setupVirtualInterface])
          {
            id v10 = nw_parameters_create();
            uint64_t v11 = [(id)v2 localInterfaceName];
            [v11 UTF8String];
            int v12 = nw_interface_create_with_name();
            nw_parameters_require_interface(v10, v12);
            id v13 = [(id)v2 remoteOuterEndpoint];
            id v14 = [v13 copyCEndpoint];
            evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();

            objc_initWeak(&location, (id)v2);
            id v16 = [(id)v2 queue];
            objc_copyWeak(&v27, &location);
            nw_path_evaluator_set_update_handler();

            nw_path_evaluator_start();
            if (v2) {
              objc_storeStrong((id *)(v2 + 247), evaluator_for_endpoint);
            }
            sub_100069CC4((char *)v2);
            objc_destroyWeak(&v27);
            objc_destroyWeak(&location);

            BOOL v5 = 1;
            goto LABEL_29;
          }
          CFStringRef v20 = @"failed to setup virtual interface";
        }
        [(id)v2 cancelWithReason:v20];
        BOOL v5 = 0;
LABEL_29:

        return v5;
      }
      id v23 = sub_100067D7C();
      int v24 = _NRLogIsLevelEnabled();

      id v17 = "-[NRLinkFixedInterface start]";
      if (v24)
      {
        id v25 = sub_100067D7C();
        _NRLogWithArgs();
      }
      uint64_t v2 = _os_log_pack_size();
      __chkstk_darwin(v2);
      __error();
      uint64_t v26 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v26 = 136446210;
      *(void *)(v26 + 4) = "-[NRLinkFixedInterface start]";
      sub_100067D7C();
      _NRLogAbortWithPack();
      __break(1u);
    }
    else
    {
      if (qword_1001F4960 != -1) {
        dispatch_once(&qword_1001F4960, &stru_1001C69F8);
      }
      id v17 = (const char *)&unk_1001F4000;
      if (!_NRLogIsLevelEnabled()) {
        return 0;
      }
      if (qword_1001F4960 == -1) {
        goto LABEL_23;
      }
    }
    dispatch_once(&qword_1001F4960, &stru_1001C69F8);
LABEL_23:
    id v18 = *((id *)v17 + 299);
    id v19 = sub_10011A480([(id)v2 state]);
    _NRLogWithArgs();

    goto LABEL_24;
  }

  return [(id)v2 resume];
}

- (unsigned)metric
{
  return 100;
}

- (id)copyDescriptionInner
{
  id v3 = objc_alloc((Class)NSString);
  v9.receiver = self;
  v9.super_class = (Class)NRLinkFixedInterface;
  id v4 = [(NRLink *)&v9 copyDescriptionInner];
  BOOL v5 = [(NRLink *)self localOuterEndpoint];
  BOOL v6 = [(NRLink *)self remoteOuterEndpoint];
  id v7 = [v3 initWithFormat:@"%@, %@ -> %@", v4, v5, v6];

  return v7;
}

- (void)invalidateLink
{
  v8.receiver = self;
  v8.super_class = (Class)NRLinkFixedInterface;
  [(NRLink *)&v8 invalidateLink];
  if (!self)
  {
    [0 invalidateVirtualInterface];
    companionProxyAgent = (NRCompanionProxyAgent *)MEMORY[0x58];
    if (!MEMORY[0x58]) {
      return;
    }
    goto LABEL_7;
  }
  [(NRLinkFixedInterface *)self invalidateIKESessionForClass:4];
  id v3 = *(NSNumber **)((char *)&self->_listenerPort + 7);
  if (v3)
  {
    [v3 cancel];
    id v4 = *(NSNumber **)((char *)&self->_listenerPort + 7);
    *(NSNumber **)((char *)&self->_listenerPort + 7) = 0;
  }
  [(NRLink *)self invalidateVirtualInterface];
  if (*(NSString **)((char *)&self->_listenerPortString + 7))
  {
    nw_path_evaluator_cancel();
    BOOL v5 = *(NSString **)((char *)&self->_listenerPortString + 7);
    *(NSString **)((char *)&self->_listenerPortString + 7) = 0;
  }
  companionProxyAgent = self->super._companionProxyAgent;
  if (companionProxyAgent)
  {
LABEL_7:
    sub_1000638F4((uint64_t)companionProxyAgent);
    [(NRLink *)self reportEvent:12003];
    id v7 = self->super._companionProxyAgent;
    self->super._companionProxyAgent = 0;
  }
}

- (id)copyStatusString
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = [(NRLink *)self description];
  id v5 = [v3 initWithString:v4];

  [v5 appendFormat:@"\n %35s = %@", "nrUUID", self->super._nrUUID];
  [v5 appendFormat:@"\n %35s = %@", "localInterfaceName", self->super._localInterfaceName];
  [v5 appendFormat:@"\n %35s = %@", "listenerPortString", *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7)];
  [v5 appendFormat:@"\n %35s = %@", "ikeSessionClassD", *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7)];
  if (self->super._virtualInterface)
  {
    BOOL v6 = (void *)NEVirtualInterfaceCopyName();
    [v5 appendFormat:@"\n %35s = %@", "virtualInterfaceName", v6];
  }
  return v5;
}

@end