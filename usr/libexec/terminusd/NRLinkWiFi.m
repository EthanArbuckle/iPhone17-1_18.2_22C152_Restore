@interface NRLinkWiFi
- (BOOL)cancelWithReason:(id)a3;
- (BOOL)resume;
- (BOOL)sendControlData:(id)a3;
- (BOOL)start;
- (BOOL)suspend;
- (id)copyDescriptionInner;
- (id)copyStatusString;
- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5 wifiInterfaceName:(id)a6 localOuterEndpoint:(id)a7 remoteOuterEndpoint:(id)a8 listenerPortString:(id)a9;
- (unsigned)metric;
- (void)checkPeerAvailabilityWithForceAggressive:(BOOL)a3;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopTrackingAllNOIs:(id)a3;
- (void)invalidateLink;
- (void)refreshCompanionProxyAgent;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
- (void)setIsPrimary:(BOOL)a3;
@end

@implementation NRLinkWiFi

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_pairingClient + 7), 0);
  objc_storeStrong((id *)((char *)&self->_randomUUIDForWiFiAssertion + 7), 0);
  objc_storeStrong((id *)((char *)&self->_linkAnalytics + 7), 0);
  objc_storeStrong((id *)((char *)&self->_symptomsNOIManager + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassC + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeListener + 7), 0);
  objc_storeStrong((id *)((char *)&self->_listenerPortString + 7), 0);

  objc_storeStrong((id *)((char *)&self->_notifyToken + 7), 0);
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
    v18.super_class = (Class)NRLinkWiFi;
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
            uint64_t v15 = 1267;
            id v16 = [(NRLink *)self copyDescription];
            v13 = "";
            v14 = "-[NRLinkWiFi resume]";
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
  v16.super_class = (Class)NRLinkWiFi;
  [(NRLink *)&v16 suspend];
  if (self->super._state != 255)
  {
    [(NRLink *)self changeStateTo:9 details:@"(suspend)"];
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
          uint64_t v13 = 1240;
          id v14 = [(NRLink *)self copyDescription];
          v11 = "";
          v12 = "-[NRLinkWiFi suspend]";
          _NRLogWithArgs();
        }
      }
    }
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
      v17[2] = sub_100034D24;
      v17[3] = &unk_1001C7A00;
      objc_copyWeak(&v18, &location);
      [v7 sendPrivateNotifies:v8 maxRetries:10 retryIntervalInMilliseconds:1000 callbackQueue:v9 callback:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      id v14 = sub_100034CD0();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        id v16 = sub_100034CD0();
        _NRLogWithArgs();
      }
    }
  }
  else
  {
    id v11 = sub_100034CD0();
    int v12 = _NRLogIsLevelEnabled();

    if (v12)
    {
      id v13 = sub_100034CD0();
      _NRLogWithArgs();
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = (char *)a6;
  id v18 = (uint64_t (**)(id, void *))a7;
  id v19 = a8;
  id v20 = (void (**)(void, void, void, void))v19;
  if (!v14)
  {
    id v54 = sub_100034CD0();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_56;
    }
LABEL_48:
    id v64 = sub_100034CD0();
    _NRLogWithArgs();

    goto LABEL_56;
  }
  if (!v15)
  {
    id v56 = sub_100034CD0();
    int v57 = _NRLogIsLevelEnabled();

    if (!v57) {
      goto LABEL_56;
    }
    goto LABEL_48;
  }
  if (!v16)
  {
    id v58 = sub_100034CD0();
    int v59 = _NRLogIsLevelEnabled();

    if (!v59) {
      goto LABEL_56;
    }
    goto LABEL_48;
  }
  if (!v18)
  {
    id v60 = sub_100034CD0();
    int v61 = _NRLogIsLevelEnabled();

    if (!v61) {
      goto LABEL_56;
    }
    goto LABEL_48;
  }
  if (v19)
  {
    v21 = (void *)_NRCopyLogObjectForNRUUID();
    int v22 = _NRLogIsLevelEnabled();

    if (v22)
    {
      v23 = (void *)_NRCopyLogObjectForNRUUID();
      id v69 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
    int state = self->super._state;
    id v77 = v15;
    if (state == 255) {
      goto LABEL_53;
    }
    v25 = [v16 localIdentifier];
    id v76 = a4;
    if (qword_1001F4C40 != -1) {
      dispatch_once(&qword_1001F4C40, &stru_1001C7E70);
    }
    id v26 = (id)qword_1001F4C38;
    unsigned int v27 = [v25 isEqual:v26];

    if (!v27)
    {
      v30 = v16;
      v31 = v18;
      v32 = v17;
      v33 = (void *)_NRCopyLogObjectForNRUUID();
      int v34 = _NRLogIsLevelEnabled();

      if (v34)
      {
        v35 = (void *)_NRCopyLogObjectForNRUUID();
        id v36 = [(NRLink *)self copyDescription];
        v70 = [v30 localIdentifier];
        _NRLogWithArgs();
      }
      id v29 = 0;
      v37 = 0;
      id v17 = v32;
      id v18 = v31;
      id v16 = v30;
      goto LABEL_54;
    }
    if (v17)
    {
      v28 = v17;
      id v29 = sub_10011F1E0();
      [v29 setMode:2];
      [v29 setReplayWindowSize:4];
    }
    else
    {
      if ([(NRLink *)self hasCompanionDatapath])
      {
LABEL_52:
        [(NRLink *)self reportEvent:3024, @"ClassC %@", v15 detailsFormat];
LABEL_53:
        id v29 = 0;
        v37 = 0;
        goto LABEL_54;
      }
      v28 = 0;
      id v29 = 0;
    }
    uint64_t v38 = *(uint64_t *)((char *)&self->_randomUUIDForWiFiAssertion + 7);
    if (v38)
    {
      sub_100008148(*(uint64_t *)((char *)&self->_randomUUIDForWiFiAssertion + 7));
      sub_100007ADC(v38, 6, 0);
      v39 = *(NSUUID **)((char *)&self->_randomUUIDForWiFiAssertion + 7);
      *(NSUUID **)((char *)&self->_randomUUIDForWiFiAssertion + 7) = 0;
    }
    v40 = *(id *)((char *)&self->_symptomsNOIManager + 7);
    if (v40) {
      ++v40[8];
    }

    uint64_t v41 = mach_absolute_time();
    uint64_t v42 = *(uint64_t *)((char *)&self->_symptomsNOIManager + 7);
    id v17 = v28;
    if (v42) {
      *(void *)(v42 + 32) = v41;
    }
    id v15 = [(NRLink *)self nrUUID];
    v43 = (id *)sub_10013DC5C((uint64_t)NRDLocalDevice, v15);

    if (v43)
    {
      v37 = sub_10011F560(0, v43, 3);
      if (sub_10011FD1C(v43))
      {
        id v73 = v16;
        v44 = v18;
        id v75 = v14;
        id v45 = v43[16];
        unsigned __int8 v46 = [v45 hasCompanionDatapath];

        v74 = v17;
        if (v46)
        {
          v47 = 0;
        }
        else
        {
          v47 = [(NRLink *)self localOuterEndpoint];
        }
        id v48 = sub_10011FDA0(v43, v47);
        id v79 = v48;
        v49 = +[NSArray arrayWithObjects:&v79 count:1];
        [v37 setCustomIKEAuthPrivateNotifies:v49];

        id v17 = v74;
        id v14 = v75;
        id v18 = v44;
        id v16 = v73;
      }
      if (v18[2](v18, v37))
      {
        v78.receiver = self;
        v78.super_class = (Class)NRLinkWiFi;
        [(NRLink *)&v78 invalidateIKESessionForClass:3];
        [(NRLink *)self setIkeClassDEstablished:0];
        self->super._peerAvailabilityCheckInProgress = 0;
        [(NRLink *)self invalidateIKESession:(char *)&self->_ikeListener + 7];
        objc_storeStrong((id *)((char *)&self->_ikeListener + 7), v76);
        sub_1000356C8((uint64_t)self);
        [(NRLink *)self reportEvent:3016, @"ClassC %@", v77 detailsFormat];

        if ([(NRLink *)self setupVirtualInterface])
        {
          ((void (**)(void, void *, id, NEVirtualInterface_s *))v20)[2](v20, v37, v29, [(NRLink *)self virtualInterface]);
LABEL_55:

          id v15 = v77;
          goto LABEL_56;
        }
        v50 = v17;
        v51 = (void *)_NRCopyLogObjectForNRUUID();
        int v52 = _NRLogIsLevelEnabled();

        if (v52)
        {
          v53 = (void *)_NRCopyLogObjectForNRUUID();
          id v71 = [(NRLink *)self copyDescription];
          _NRLogWithArgs();
        }
        id v17 = v50;
      }
      else
      {
        [(NRLink *)self reportEvent:3021, @"ClassC %@", v77 detailsFormat];
      }
LABEL_54:
      v20[2](v20, 0, 0, 0);
      goto LABEL_55;
    }
    id v65 = sub_100034CD0();
    int v66 = _NRLogIsLevelEnabled();

    if (v66)
    {
      id v67 = sub_100034CD0();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    id v17 = (char *)&v72 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
    __error();
    uint64_t v68 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v68 = 136446210;
    *(void *)(v68 + 4) = "-[NRLinkWiFi requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBl"
                           "ock:responseBlock:]";
    sub_100034CD0();
    _NRLogAbortWithPack();
    goto LABEL_52;
  }
  id v62 = sub_100034CD0();
  int v63 = _NRLogIsLevelEnabled();

  if (v63) {
    goto LABEL_48;
  }
LABEL_56:
}

- (void)checkPeerAvailabilityWithForceAggressive:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(NRLink *)self peerAvailabilityCheckInProgress];
  BOOL v6 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (v5)
  {
    if (IsLevelEnabled)
    {
      id v15 = (id)_NRCopyLogObjectForNRUUID();
      id v13 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
  }
  else
  {
    if (IsLevelEnabled)
    {
      v8 = (void *)_NRCopyLogObjectForNRUUID();
      id v14 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
    self->super._peerAvailabilityCheckInProgress = 1;
    objc_initWeak(&location, self);
    id v9 = *(id *)((char *)&self->_ikeListener + 7);
    v10 = [(NRLink *)self queue];
    if (v3) {
      uint64_t v11 = 1000;
    }
    else {
      uint64_t v11 = 3000;
    }
    if (v3) {
      uint64_t v12 = 5;
    }
    else {
      uint64_t v12 = 3;
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100037FBC;
    v16[3] = &unk_1001C7A00;
    objc_copyWeak(&v17, &location);
    [v9 sendKeepaliveWithRetries:v12 retryIntervalInMilliseconds:v11 callbackQueue:v10 callback:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  if ([(NRLink *)self state] != 255)
  {
    id v4 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      BOOL v6 = (void *)_NRCopyLogObjectForNRUUID();
      id v7 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
    sub_10003822C((uint64_t)self);
    sub_100037B3C((char *)self);
  }
}

- (void)didStartTrackingNOI:(id)a3
{
  id v4 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    BOOL v6 = (void *)_NRCopyLogObjectForNRUUID();
    uint64_t v26 = 705;
    id v27 = [(NRLink *)self copyDescription];
    v23 = "";
    v25 = "-[NRLinkWiFi didStartTrackingNOI:]";
    _NRLogWithArgs();
  }
  uint64_t v7 = mach_absolute_time();
  uint64_t v8 = *(uint64_t *)((char *)&self->_symptomsNOIManager + 7);
  if (v8) {
    *(void *)(v8 + 112) = v7;
  }
  if (*(unsigned int *)((char *)&self->_symptomsAdvisoryCounter + 3) == -1)
  {
    if (!&_symptom_new)
    {
      v10 = (void *)_NRCopyLogObjectForNRUUID();
      int v11 = _NRLogIsLevelEnabled();

      if (v11)
      {
        id v30 = (id)_NRCopyLogObjectForNRUUID();
        id v28 = [(NRLink *)self copyDescription];
        _NRLogWithArgs();
      }
      return;
    }
    if (qword_1001F4BD0 != -1) {
      dispatch_once(&qword_1001F4BD0, &stru_1001C7D28);
    }
    if (!symptom_new())
    {
      if (qword_1001F48F0 != -1) {
        dispatch_once(&qword_1001F48F0, &stru_1001C6670);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F48F0 != -1) {
          dispatch_once(&qword_1001F48F0, &stru_1001C6670);
        }
        _NRLogWithArgs();
      }
      return;
    }
    if ([(NRLink *)self hasCompanionDatapath])
    {
      [(NRLink *)self virtualInterface];
      id v9 = (void *)NEVirtualInterfaceCopyName();
    }
    else
    {
      id v9 = [(NRLink *)self localInterfaceName];
    }
    uint64_t v12 = v9;
    [v9 length:v23, v25, v26, v27];
    [v12 UTF8String];
    symptom_set_additional_qualifier();
    if (symptom_send())
    {
      id v13 = (void *)_NRCopyLogObjectForNRUUID();
      int v14 = _NRLogIsLevelEnabled();

      if (v14)
      {
        id v15 = (void *)_NRCopyLogObjectForNRUUID();
        id v24 = [(NRLink *)self copyDescription];
        _NRLogWithArgs();
      }
      goto LABEL_41;
    }
    objc_initWeak(&location, self);
    id v16 = [(NRLink *)self queue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100038AA8;
    handler[3] = &unk_1001C8A58;
    objc_copyWeak(&v32, &location);
    uint32_t v17 = notify_register_dispatch("com.apple.symptoms.liveLinkHasAdvice", (int *)((char *)&self->_symptomsAdvisoryCounter + 3), v16, handler);

    if (v17 || *(unsigned int *)((char *)&self->_symptomsAdvisoryCounter + 3) == -1)
    {
      if (qword_1001F48F0 != -1) {
        dispatch_once(&qword_1001F48F0, &stru_1001C6670);
      }
      id v18 = (id)qword_1001F48E8;
      char v19 = _NRLogIsLevelEnabled();

      if ((v19 & 1) == 0) {
        goto LABEL_40;
      }
      if (qword_1001F48F0 != -1) {
        dispatch_once(&qword_1001F48F0, &stru_1001C6670);
      }
      id v20 = (id)qword_1001F48E8;
      _NRLogWithArgs();
    }
    else
    {
      v21 = (void *)_NRCopyLogObjectForNRUUID();
      int v22 = _NRLogIsLevelEnabled();

      if (!v22)
      {
LABEL_40:
        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);
LABEL_41:

        return;
      }
      id v20 = (id)_NRCopyLogObjectForNRUUID();
      id v29 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
    goto LABEL_40;
  }
}

- (BOOL)cancelWithReason:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v45 = &v47;
    id v5 = [objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v47];
    unsigned __int8 v6 = [(NRLink *)self changeStateTo:255 details:v5];
    uint64_t v7 = (void *)_NRCopyLogObjectForNRUUID();
    if (v6)
    {
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        id v9 = (void *)_NRCopyLogObjectForNRUUID();
        id v35 = [(NRLink *)self copyDescription];
        id v37 = v5;
        uint64_t v33 = 387;
        id v29 = "";
        v31 = "-[NRLinkWiFi cancelWithReason:]";
        _NRLogWithArgs();
      }
      id v40 = v5;
      id v39 = [(NRLinkWiFi *)self copyStatusString];
      id v10 = [v39 componentsSeparatedByString:@"\n"];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v11 = [v10 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v42;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v42 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            id v16 = (void *)_NRCopyLogObjectForNRUUID();
            int v17 = _NRLogIsLevelEnabled();

            if (v17)
            {
              id v18 = (void *)_NRCopyLogObjectForNRUUID();
              id v36 = [(NRLink *)self copyDescription];
              uint64_t v38 = v15;
              uint64_t v34 = 391;
              id v30 = "";
              id v32 = "-[NRLinkWiFi cancelWithReason:]";
              _NRLogWithArgs();
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v12);
      }
      v21 = [(NRLink *)self linkDelegate];
      [v21 linkIsUnavailable:self];

      [(NRLinkWiFi *)self invalidateLink];
      uint64_t v22 = *(uint64_t *)((char *)&self->_symptomsNOIManager + 7);
      if (v22) {
        *(void *)(v22 + 128) = *(unsigned int *)((char *)&self->_ikeRetryCounter + 3);
      }
      [(NRLink *)self linkTotalReadyTimeInSec];
      uint64_t v24 = *(uint64_t *)((char *)&self->_symptomsNOIManager + 7);
      if (v24)
      {
        *(void *)(v24 + 16) = v23;
        v25 = *(NWNetworkOfInterestManager **)((char *)&self->_symptomsNOIManager + 7);
      }
      else
      {
        v25 = 0;
      }
      id v5 = v40;
      id v20 = v39;
      [v25 submit];
      goto LABEL_21;
    }
    int v19 = _NRLogIsLevelEnabled();

    if (v19)
    {
      id v20 = (void *)_NRCopyLogObjectForNRUUID();
      id v10 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
LABEL_21:
    }
  }
  else
  {
    id v27 = sub_100034CD0();
    int v28 = _NRLogIsLevelEnabled();

    if (!v28) {
      goto LABEL_23;
    }
    id v5 = sub_100034CD0();
    _NRLogWithArgs();
  }

LABEL_23:
  return v4 != 0;
}

- (BOOL)start
{
  BOOL v3 = [(NRLink *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(NRLink *)self state] == 255)
  {
    unsigned __int8 v6 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      return 0;
    }
    goto LABEL_7;
  }
  if ([(NRLink *)self state] == 8)
  {
    id v4 = [(NRLink *)self linkDelegate];
    [v4 linkIsReady:self];
LABEL_4:

    return 1;
  }
  if ([(NRLink *)self state] != 9)
  {
    if ([(NRLink *)self startRequested]) {
      return 1;
    }
    [(NRLink *)self updateIKEv2Role:&self->_isResponder];
    if (!self) {
      return 0;
    }
    if (!self->_isResponder)
    {
      id v10 = [(NRLink *)self remoteOuterEndpoint];

      if (!v10) {
        return 0;
      }
      id v11 = sub_10013DC5C((uint64_t)NRDLocalDevice, self->super._nrUUID);
      uint64_t v8 = v11;
      if (v11 && v11[13] || [(NRLink *)self ikev2Role])
      {
      }
      else
      {
        uint64_t v16 = [(NRLink *)self peerToken];
        if (!v16) {
          goto LABEL_8;
        }
        int v17 = (void *)v16;
        id v18 = [(NRLink *)self localToken];

        if (!v18) {
          return 0;
        }
      }
    }
    [(NRLink *)self setStartRequested:1];
    id v12 = [(NRLink *)self localInterfaceName];

    if (v12)
    {
      if ([(NRLink *)self state] == 1)
      {
        uint64_t v13 = sub_10013DC5C((uint64_t)NRDLocalDevice, self->super._nrUUID);
        id v4 = v13;
        if (v13 && v13[13]) {
          sub_1000395E8((uint64_t)self);
        }
        else {
          sub_100039334((uint64_t)self);
        }
        if ([(NRLink *)self subtype] == 102) {
          sub_10003990C((uint64_t)self);
        }
        goto LABEL_4;
      }
      int v14 = (void *)_NRCopyLogObjectForNRUUID();
      int v15 = _NRLogIsLevelEnabled();

      if (!v15) {
        return 0;
      }
      uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID();
      id v21 = [(NRLink *)self copyDescription];
      id v22 = sub_10011A480([(NRLink *)self state]);
      _NRLogWithArgs();

      goto LABEL_8;
    }
    int v19 = (void *)_NRCopyLogObjectForNRUUID();
    int v20 = _NRLogIsLevelEnabled();

    if (!v20) {
      return 0;
    }
LABEL_7:
    uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID();
    id v9 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();

LABEL_8:
    return 0;
  }

  return [(NRLinkWiFi *)self resume];
}

- (unsigned)metric
{
  return 100;
}

- (id)copyDescriptionInner
{
  id v3 = objc_alloc((Class)NSString);
  v9.receiver = self;
  v9.super_class = (Class)NRLinkWiFi;
  id v4 = [(NRLink *)&v9 copyDescriptionInner];
  id v5 = [(NRLink *)self localOuterEndpoint];
  unsigned __int8 v6 = [(NRLink *)self remoteOuterEndpoint];
  id v7 = [v3 initWithFormat:@"%@, %@ -> %@", v4, v5, v6];

  return v7;
}

- (void)refreshCompanionProxyAgent
{
  if (self->super._state == 255)
  {
    id v4 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v7 = (id)_NRCopyLogObjectForNRUUID();
      id v6 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
  }
  else
  {
    companionProxyAgent = self->super._companionProxyAgent;
    sub_100064F74((uint64_t)companionProxyAgent);
  }
}

- (void)invalidateLink
{
  v24.receiver = self;
  v24.super_class = (Class)NRLinkWiFi;
  [(NRLink *)&v24 invalidateLink];
  if (self)
  {
    v25.receiver = self;
    v25.super_class = (Class)NRLinkWiFi;
    [(NRLink *)&v25 invalidateIKESessionForClass:3];
    [(NRLink *)self setIkeClassDEstablished:0];
    self->super._peerAvailabilityCheckInProgress = 0;
    [(NRLink *)self invalidateIKESession:(char *)&self->_ikeListener + 7];
    id v3 = *(NSString **)((char *)&self->_listenerPortString + 7);
    if (v3)
    {
      [v3 cancel];
      id v4 = *(NSString **)((char *)&self->_listenerPortString + 7);
      *(NSString **)((char *)&self->_listenerPortString + 7) = 0;
    }
    id v5 = *(NSObject **)((char *)&self->_pairingClient + 7);
    if (v5)
    {
      nw_browser_cancel(v5);
      id v6 = *(NRPairingClient **)((char *)&self->_pairingClient + 7);
      *(NRPairingClient **)((char *)&self->_pairingClient + 7) = 0;

      id v7 = (void *)_NRCopyLogObjectForNRUUID();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        objc_super v9 = (void *)_NRCopyLogObjectForNRUUID();
        uint64_t v22 = 489;
        id v23 = [(NRLink *)self copyDescription];
        int v20 = "";
        id v21 = "-[NRLinkWiFi stopAWDLBrowser]";
        _NRLogWithArgs();
      }
    }
    sub_10003822C((uint64_t)self);
    id v10 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7);
    if (v10)
    {
      [v10 setDelegate:0];
      [*(id *)((char *)&self->_ikeSessionClassC + 7) destroy];
      id v11 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7);
      *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7) = 0;
    }
  }
  else
  {
    sub_10003822C(0);
  }
  if ([(NRLink *)self virtualInterface])
  {
    [(NRLink *)self virtualInterface];
    NEVirtualInterfaceSetRankNever();
    [(NRLink *)self virtualInterface];
    NEVirtualInterfaceUpdateAdHocService();
  }
  [(NRLink *)self invalidateVirtualInterface];
  companionProxyAgent = self->super._companionProxyAgent;
  if (companionProxyAgent)
  {
    sub_1000638F4((uint64_t)companionProxyAgent);
    [(NRLink *)self reportEvent:12003];
    uint64_t v13 = self->super._companionProxyAgent;
    self->super._companionProxyAgent = 0;
  }
  self;
  if (qword_1001F4A20 != -1) {
    dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
  }
  id v14 = (id)qword_1001F4A18;
  int v15 = v14;
  if (v14) {
    uint64_t v16 = (void *)*((void *)v14 + 6);
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = v16;
  sub_100155CF0((uint64_t)v17, 0, *(void **)((char *)&self->_linkAnalytics + 7));

  *(unsigned int *)((char *)&self->_ikeRetryCounter + 3) = 0;
  *(_DWORD *)(&self->_ikeRetryBackoffScheduled + 2) = 0;
  *(unsigned int *)((char *)&self->_startRetryCounter + 3) = 0;
  uint64_t v18 = *(uint64_t *)((char *)&self->_randomUUIDForWiFiAssertion + 7);
  if (v18)
  {
    sub_100008148(*(uint64_t *)((char *)&self->_randomUUIDForWiFiAssertion + 7));
    sub_100007ADC(v18, 6, 0);
    int v19 = *(NSUUID **)((char *)&self->_randomUUIDForWiFiAssertion + 7);
    *(NSUUID **)((char *)&self->_randomUUIDForWiFiAssertion + 7) = 0;
  }
}

- (void)setIsPrimary:(BOOL)a3
{
  BOOL v3 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NRLinkWiFi;
  -[NRLink setIsPrimary:](&v21, "setIsPrimary:");
  self;
  if (qword_1001F4A20 != -1) {
    dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
  }
  id v5 = (id)qword_1001F4A18;
  id v6 = v5;
  if (v5) {
    id v7 = (void *)*((void *)v5 + 6);
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = v7;
  objc_super v9 = v8;
  if (v3)
  {
    if (self) {
      id v10 = *(NRAnalyticsCmpnLinkWiFi **)((char *)&self->_linkAnalytics + 7);
    }
    else {
      id v10 = 0;
    }
    sub_1001573C0(v8, 32, v10, &off_1001D4D00);

    self;
    if (qword_1001F4A20 != -1) {
      dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
    }
    id v11 = (id)qword_1001F4A18;
    id v12 = v11;
    if (v11) {
      uint64_t v13 = (void *)*((void *)v11 + 6);
    }
    else {
      uint64_t v13 = 0;
    }
    id v14 = v13;
    int v15 = v14;
    if (self) {
      uint64_t v16 = *(NRAnalyticsCmpnLinkWiFi **)((char *)&self->_linkAnalytics + 7);
    }
    else {
      uint64_t v16 = 0;
    }
    int v17 = 1;
  }
  else
  {
    if (self) {
      uint64_t v18 = *(NRAnalyticsCmpnLinkWiFi **)((char *)&self->_linkAnalytics + 7);
    }
    else {
      uint64_t v18 = 0;
    }
    sub_1001572E8(v8, v18);

    self;
    if (qword_1001F4A20 != -1) {
      dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
    }
    id v19 = (id)qword_1001F4A18;
    id v12 = v19;
    if (v19) {
      int v20 = (void *)*((void *)v19 + 6);
    }
    else {
      int v20 = 0;
    }
    id v14 = v20;
    int v15 = v14;
    if (self) {
      uint64_t v16 = *(NRAnalyticsCmpnLinkWiFi **)((char *)&self->_linkAnalytics + 7);
    }
    else {
      uint64_t v16 = 0;
    }
    int v17 = 0;
  }
  sub_100155CF0((uint64_t)v14, v17, v16);
}

- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5 wifiInterfaceName:(id)a6 localOuterEndpoint:(id)a7 remoteOuterEndpoint:(id)a8 listenerPortString:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (!v15)
  {
    id v32 = sub_100034CD0();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled) {
      goto LABEL_21;
    }
    goto LABEL_25;
  }
  if (!v16)
  {
    id v34 = sub_100034CD0();
    int v35 = _NRLogIsLevelEnabled();

    if (v35) {
      goto LABEL_21;
    }
    goto LABEL_25;
  }
  if (!v17)
  {
    id v36 = sub_100034CD0();
    int v37 = _NRLogIsLevelEnabled();

    if (v37) {
      goto LABEL_21;
    }
    goto LABEL_25;
  }
  if ((_NRIsUUIDNonZero() & 1) == 0)
  {
    id v38 = sub_100034CD0();
    int v39 = _NRLogIsLevelEnabled();

    if (v39) {
      goto LABEL_21;
    }
    goto LABEL_25;
  }
  if (!v18)
  {
    id v40 = sub_100034CD0();
    int v41 = _NRLogIsLevelEnabled();

    if (v41) {
      goto LABEL_21;
    }
    goto LABEL_25;
  }
  if (!v19)
  {
    id v42 = sub_100034CD0();
    int v43 = _NRLogIsLevelEnabled();

    if (v43)
    {
LABEL_21:
      id v44 = sub_100034CD0();
      _NRLogWithArgs();

      id v30 = 0;
      goto LABEL_9;
    }
LABEL_25:
    id v30 = 0;
    goto LABEL_9;
  }
  v48.receiver = self;
  v48.super_class = (Class)NRLinkWiFi;
  uint64_t v22 = [(NRLink *)&v48 initLinkWithQueue:v15 linkDelegate:v16 nrUUID:v17];
  if (!v22)
  {
    id v45 = sub_100034CD0();
    int v46 = _NRLogIsLevelEnabled();

    if (v46)
    {
      id v47 = sub_100034CD0();
      _NRLogWithArgs();
    }
    self = 0;
    goto LABEL_25;
  }
  id v23 = v22;
  [v22 setType:2];
  [v23 setSubtype:101];
  [v23 setLocalInterfaceName:v18];
  [v23 setLocalOuterEndpoint:v19];
  [v23 setRemoteOuterEndpoint:v20];
  objc_storeStrong((id *)(v23 + 239), a9);
  *(_DWORD *)(v23 + 231) = -1;
  objc_super v24 = objc_alloc_init(NRAnalyticsCmpnLinkWiFi);
  objc_super v25 = *(void **)(v23 + 271);
  *(void *)(v23 + 271) = v24;

  uint64_t v26 = +[NSUUID UUID];
  id v27 = *(void **)(v23 + 279);
  *(void *)(v23 + 279) = v26;

  int v28 = [v17 UUIDString];
  [v23 reportEvent:3000 details:v28];

  id v29 = [v23 linkDelegate];
  [v29 linkIsAvailable:v23];

  self = v23;
  id v30 = self;
LABEL_9:

  return v30;
}

- (id)copyStatusString
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = [(NRLink *)self description];
  id v5 = [v3 initWithString:v4];

  [v5 appendFormat:@"\n %35s = %@", "nrUUID", self->super._nrUUID];
  id v6 = [(NRLink *)self localInterfaceName];
  [v5 appendFormat:@"\n %35s = %@", "localInterfaceName", v6];

  [v5 appendFormat:@"\n %35s = %@", "listenerPortString", *(void *)((char *)&self->_notifyToken + 7)];
  [v5 appendFormat:@"\n %35s = %@", "ikeSessionClassC", *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7)];
  if (self->super._virtualInterface)
  {
    id v7 = (void *)NEVirtualInterfaceCopyName();
    [v5 appendFormat:@"\n %35s = %@", "virtualInterfaceName", v7];
  }
  uint64_t v8 = *(uint64_t *)((char *)&self->_symptomsNOIManager + 7);
  if (v8) {
    uint64_t v8 = *(void *)(v8 + 120);
  }
  [v5 appendFormat:@"\n %35s = %llu", @"symptomsAdvisoryFalsePositives", v8];
  return v5;
}

@end