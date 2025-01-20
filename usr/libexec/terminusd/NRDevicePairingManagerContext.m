@interface NRDevicePairingManagerContext
- (NSString)description;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5;
- (void)scalablePipeManagerDidUpdateState:(id)a3;
@end

@implementation NRDevicePairingManagerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryClient, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_cbAdvertiser, 0);
  objc_storeStrong((id *)&self->_cbDiscovery, 0);
  objc_storeStrong((id *)&self->_cbUUIDCandidateMappings, 0);
  objc_storeStrong((id *)&self->_pairingCandidates, 0);
  objc_storeStrong((id *)&self->_pairingTarget, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_managerConnection);
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  v14 = (char *)a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (qword_1001F4B30 != -1) {
    dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4B30 != -1) {
      dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
    }
    _NRLogWithArgs();
  }
  if (v17)
  {
    id v45 = sub_1001071DC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v47 = sub_1001071DC();
      _NRLogWithArgs();
    }
    goto LABEL_41;
  }
  v62 = self;
  v63 = 0;
  v20 = v15;
  v21 = [v16 localIdentifier];
  v22 = v14;
  if (qword_1001F4C80 != -1) {
    dispatch_once(&qword_1001F4C80, &stru_1001C7EF0);
  }
  id v23 = (id)qword_1001F4C78;
  unsigned int v24 = [v21 isEqual:v23];

  if (!v24)
  {
    v14 = v22;
    if (qword_1001F4B30 != -1) {
      dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
    }
    id v15 = v20;
    id v17 = v63;
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4B30 != -1) {
        dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
      }
      v31 = v18;
      id v43 = (id)qword_1001F4B28;
      v56 = [v16 localIdentifier];
      _NRLogWithArgs();

      v30 = 0;
      goto LABEL_42;
    }
LABEL_41:
    v30 = 0;
    v31 = v18;
    goto LABEL_42;
  }
  v64[0] = 0;
  v64[1] = 0;
  v25 = [v16 remoteIdentifier];
  v26 = [v25 identifierData];

  if ([v26 length] == (id)16)
  {
    [v26 getBytes:v64 length:16];
    id v27 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v64];
    id v28 = [objc_alloc((Class)NEIKEv2AuthenticationProtocol) initWithMethod:13];
    v29 = [v16 localIdentifier];
    id v61 = v28;
    v30 = (id *)sub_10011F450(0, v29, v28);

    v31 = v18;
    if (!(*((unsigned int (**)(id, id *))v18 + 2))(v18, v30))
    {
      v33 = v30;
      v30 = 0;
      goto LABEL_37;
    }
    if (v62) {
      pairingCandidates = v62->_pairingCandidates;
    }
    else {
      pairingCandidates = 0;
    }
    id v60 = v27;
    v33 = [(NSMutableDictionary *)pairingCandidates objectForKeyedSubscript:v27];
    if (v33)
    {
LABEL_23:
      id v41 = v20;
      sub_1001073D0((uint64_t)NRDevicePairingCandidateContext, v33 + 15);
      id v42 = v33[15];
      v33[15] = v41;

      sub_10010753C((uint64_t)v33);
      id v27 = v60;
LABEL_37:

      v14 = v22;
      id v15 = v20;
      id v17 = v63;

      goto LABEL_42;
    }
    v34 = (id *)[objc_alloc((Class)NRDevicePairingCandidate) initInternalWithUUID:v60];
    if (v34)
    {
      v33 = v34;
      id v59 = v60;
      [v33 setCbUUID:];
      v35 = [NRDevicePairingCandidateContext alloc];
      v58 = v33;
      if (v62)
      {
        v36 = sub_100107230((id *)&v35->super.isa, v33, v62->_queue, v62);
        if (v36)
        {
          v33 = v36;
          v37 = v62->_pairingCandidates;
          goto LABEL_20;
        }
      }
      else
      {
        v51 = sub_100107230((id *)&v35->super.isa, v33, 0, 0);
        if (v51)
        {
          v33 = v51;
          v37 = 0;
LABEL_20:
          [(NSMutableDictionary *)v37 setObject:v33 forKeyedSubscript:v59];
          v38 = [v58 uuid];
          if (v62)
          {
            cbUUIDCandidateMappings = v62->_cbUUIDCandidateMappings;
LABEL_22:
            v40 = v59;
            [(NSMutableDictionary *)cbUUIDCandidateMappings setObject:v38 forKeyedSubscript:v59];

            goto LABEL_23;
          }
LABEL_52:
          cbUUIDCandidateMappings = 0;
          goto LABEL_22;
        }
      }
      id v52 = sub_1001071DC();
      int v53 = _NRLogIsLevelEnabled();

      if (v53)
      {
        id v54 = sub_1001071DC();
        _NRLogWithArgs();
      }
    }
    else
    {
      id v48 = sub_1001071DC();
      int v49 = _NRLogIsLevelEnabled();

      if (v49)
      {
        id v50 = sub_1001071DC();
        _NRLogWithArgs();
      }
    }
    v38 = (void *)_os_log_pack_size();
    v22 = (char *)&v57 - ((__chkstk_darwin(v38) + 15) & 0xFFFFFFFFFFFFFFF0);
    __error();
    uint64_t v55 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v55 = 136446210;
    *(void *)(v55 + 4) = "-[NRDevicePairingManagerContext requestConfigurationForListener:session:sessionConfig:childCo"
                           "nfig:validateAuthBlock:responseBlock:]";
    sub_1001071DC();
    _NRLogAbortWithPack();
    goto LABEL_52;
  }
  if (qword_1001F4B30 != -1) {
    dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
  }
  v14 = v22;
  id v15 = v20;
  if (_NRLogIsLevelEnabled())
  {
    id v17 = v63;
    if (qword_1001F4B30 != -1) {
      dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
    }
    v31 = v18;
    id v44 = (id)qword_1001F4B28;
    [v26 length];
    _NRLogWithArgs();

    v30 = 0;
  }
  else
  {
    v30 = 0;
    id v17 = v63;
    v31 = v18;
  }
LABEL_42:
  (*((void (**)(id, id *, void, void))v19 + 2))(v19, v30, 0, 0);
}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v22)
  {
    if (v8)
    {
      v10 = [v8 peer];
      v11 = [v10 identifier];

      if (v11)
      {
        if (self) {
          cbUUIDCandidateMappings = self->_cbUUIDCandidateMappings;
        }
        else {
          cbUUIDCandidateMappings = 0;
        }
        v13 = [(NSMutableDictionary *)cbUUIDCandidateMappings objectForKeyedSubscript:v11];
        if (self) {
          pairingCandidates = self->_pairingCandidates;
        }
        else {
          pairingCandidates = 0;
        }
        id v15 = [(NSMutableDictionary *)pairingCandidates objectForKeyedSubscript:v13];
        if (v15)
        {
          if (qword_1001F4B30 != -1) {
            dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
          }
          if (_NRLogIsLevelEnabled())
          {
            if (qword_1001F4B30 != -1) {
              dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
            }
            _NRLogWithArgs();
          }
          sub_100109FCC((uint64_t)v15);
        }
        else
        {
          if (qword_1001F4B30 != -1) {
            dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
          }
          if (_NRLogIsLevelEnabled())
          {
            if (qword_1001F4B30 != -1) {
              dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
            }
            _NRLogWithArgs();
          }
        }
      }
      else
      {
        id v20 = sub_1001071DC();
        int IsLevelEnabled = _NRLogIsLevelEnabled();

        if (!IsLevelEnabled)
        {
          v11 = 0;
          goto LABEL_24;
        }
        v13 = sub_1001071DC();
        _NRLogWithArgs();
      }

LABEL_24:
      goto LABEL_25;
    }
    id v18 = sub_1001071DC();
    int v19 = _NRLogIsLevelEnabled();

    if (v19)
    {
LABEL_31:
      v11 = sub_1001071DC();
      _NRLogWithArgs();
      goto LABEL_24;
    }
  }
  else
  {
    id v16 = sub_1001071DC();
    int v17 = _NRLogIsLevelEnabled();

    if (v17) {
      goto LABEL_31;
    }
  }
LABEL_25:
}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v42 = a3;
  id v6 = a4;
  if (v42)
  {
    if (v6)
    {
      v7 = [v6 peer];
      id v8 = [v7 identifier];

      if (!v8)
      {
        id v28 = sub_1001071DC();
        int IsLevelEnabled = _NRLogIsLevelEnabled();

        if (!IsLevelEnabled)
        {
          id v8 = 0;
          goto LABEL_32;
        }
        v10 = sub_1001071DC();
        _NRLogWithArgs();
        goto LABEL_31;
      }
      if (self) {
        cbUUIDCandidateMappings = self->_cbUUIDCandidateMappings;
      }
      else {
        cbUUIDCandidateMappings = 0;
      }
      v10 = [(NSMutableDictionary *)cbUUIDCandidateMappings objectForKeyedSubscript:v8];
      if (self) {
        pairingCandidates = self->_pairingCandidates;
      }
      else {
        pairingCandidates = 0;
      }
      uint64_t v12 = [(NSMutableDictionary *)pairingCandidates objectForKeyedSubscript:v10];
      if (!v12)
      {
        if (qword_1001F4B30 != -1) {
          dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4B30 != -1) {
            dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
          }
          _NRLogWithArgs();
        }
        goto LABEL_30;
      }
      if (qword_1001F4B30 != -1) {
        dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4B30 != -1) {
          dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
        }
        _NRLogWithArgs();
      }
      id v13 = v6;
      if (*(void *)(v12 + 72)) {
        sub_100109FCC(v12);
      }
      objc_storeStrong((id *)(v12 + 72), a4);
      id v14 = [v13 channel];
      *(void *)(v12 + 80) = v14;
      if (v14)
      {
        os_channel_ring_id();
        uint64_t v15 = os_channel_rx_ring();
        *(void *)(v12 + 88) = v15;
        if (v15)
        {
          os_channel_ring_id();
          uint64_t v16 = os_channel_tx_ring();
          *(void *)(v12 + 96) = v16;
          if (v16)
          {
            unsigned int fd = os_channel_get_fd();
            if ((fd & 0x80000000) != 0)
            {
              id v36 = sub_1001071DC();
              int v37 = _NRLogIsLevelEnabled();

              if (v37)
              {
                id v38 = sub_1001071DC();
                _NRLogWithArgs();
              }
              goto LABEL_23;
            }
            unsigned int v18 = fd;
            int v19 = *(id *)(v12 + 24);
            dispatch_source_t v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v18, 0, v19);
            v21 = *(void **)(v12 + 104);
            *(void *)(v12 + 104) = v20;

            id v22 = *(NSObject **)(v12 + 104);
            if (v22)
            {
              handler[0] = _NSConcreteStackBlock;
              handler[1] = 3221225472;
              handler[2] = sub_10010A934;
              handler[3] = &unk_1001C8BA8;
              handler[4] = v12;
              dispatch_source_set_event_handler(v22, handler);
              id v23 = *(NSObject **)(v12 + 104);
              v43[0] = _NSConcreteStackBlock;
              v43[1] = 3221225472;
              v43[2] = nullsub_12;
              v43[3] = &unk_1001C8BA8;
              id v44 = v13;
              dispatch_source_set_cancel_handler(v23, v43);
              dispatch_resume(*(dispatch_object_t *)(v12 + 104));
              sub_100109074(v12);

LABEL_23:
LABEL_30:

LABEL_31:
LABEL_32:

              goto LABEL_33;
            }
            id v39 = sub_1001071DC();
            int v40 = _NRLogIsLevelEnabled();

            if (!v40) {
              goto LABEL_23;
            }
          }
          else
          {
            id v34 = sub_1001071DC();
            int v35 = _NRLogIsLevelEnabled();

            if (!v35) {
              goto LABEL_23;
            }
          }
        }
        else
        {
          id v32 = sub_1001071DC();
          int v33 = _NRLogIsLevelEnabled();

          if (!v33) {
            goto LABEL_23;
          }
        }
      }
      else
      {
        id v30 = sub_1001071DC();
        int v31 = _NRLogIsLevelEnabled();

        if (!v31) {
          goto LABEL_23;
        }
      }
      id v41 = sub_1001071DC();
      _NRLogWithArgs();

      goto LABEL_23;
    }
    id v26 = sub_1001071DC();
    int v27 = _NRLogIsLevelEnabled();

    if (v27)
    {
LABEL_39:
      id v8 = sub_1001071DC();
      _NRLogWithArgs();
      goto LABEL_32;
    }
  }
  else
  {
    id v24 = sub_1001071DC();
    int v25 = _NRLogIsLevelEnabled();

    if (v25) {
      goto LABEL_39;
    }
  }
LABEL_33:
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  v4 = (CBScalablePipeManager *)a3;
  v5 = v4;
  if (self)
  {
    if (self->_pipeManager != v4) {
      goto LABEL_3;
    }
  }
  else if (v4)
  {
    goto LABEL_3;
  }
  id v6 = [(CBScalablePipeManager *)v4 state];
  if (v6)
  {
    if (v6 == (id)5)
    {
      if (self) {
        pipeManager = self->_pipeManager;
      }
      else {
        pipeManager = 0;
      }
      v11[0] = CBScalablePipeOptionTransport;
      v11[1] = CBScalablePipeOptionStayConnectedWhenIdle;
      v12[0] = &off_1001D4AE0;
      v12[1] = &__kCFBooleanTrue;
      v11[2] = CBScalablePipeOptionRequiresEncryption;
      v12[2] = &__kCFBooleanFalse;
      id v8 = pipeManager;
      id v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
      [(CBScalablePipeManager *)v8 registerEndpoint:@"com.apple.terminusPairing" type:1 priority:2 options:v9];
    }
    else
    {
      if (self) {
        v10 = self->_pipeManager;
      }
      else {
        v10 = 0;
      }
      [(CBScalablePipeManager *)v10 unregisterEndpoint:@"com.apple.terminusPairing"];
    }
  }
LABEL_3:
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  if (self)
  {
    if (self->_centralManager)
    {
      id v6 = v4;
      BOOL v5 = [v4 state] == (id)5;
      id v4 = v6;
      if (v5)
      {
        sub_10010AD14((id *)&self->super.isa);
        id v4 = v6;
      }
    }
  }
}

- (NSString)description
{
  if (self) {
    self = (NRDevicePairingManagerContext *)self->_info;
  }
  return [(NRDevicePairingManagerContext *)self description];
}

- (void)dealloc
{
  sub_10010B514((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NRDevicePairingManagerContext;
  [(NRDevicePairingManagerContext *)&v3 dealloc];
}

@end