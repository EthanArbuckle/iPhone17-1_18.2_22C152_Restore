@interface NRDevicePairingCandidateContext
- (BOOL)sendPacketData:(id)a3;
- (NSString)description;
- (void)dealloc;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
- (void)setPacketReceiver:(id)a3;
@end

@implementation NRDevicePairingCandidateContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbkdf2Group, 0);
  objc_storeStrong((id *)&self->_derivedPSKForPairing, 0);
  objc_storeStrong((id *)&self->_pinSalt, 0);
  objc_storeStrong((id *)&self->_ikePacketReceiver, 0);
  objc_storeStrong((id *)&self->_ikeSessionPairing, 0);
  objc_storeStrong((id *)&self->_ikeSessionControl, 0);
  objc_storeStrong((id *)&self->_ikeListener, 0);
  objc_storeStrong((id *)&self->_pipeInputSource, 0);
  objc_storeStrong((id *)&self->_pipe, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_deviceEndpoint, 0);
  objc_storeStrong((id *)&self->_cbDevice, 0);
  objc_storeStrong((id *)&self->_pairingTarget, 0);
  objc_storeStrong((id *)&self->_candidateInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_pairingManager);
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v34 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v33 = a7;
  id v17 = a8;
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
  if (v16)
  {
    id v31 = sub_1001071DC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v24 = sub_1001071DC();
      _NRLogWithArgs();
LABEL_27:
      id v26 = 0;
      v27 = v33;
LABEL_30:

      goto LABEL_34;
    }
  }
  else
  {
    v18 = [v15 localIdentifier];
    v19 = v14;
    if (qword_1001F4C80 != -1) {
      dispatch_once(&qword_1001F4C80, &stru_1001C7EF0);
    }
    id v20 = (id)qword_1001F4C78;
    unsigned int v21 = [v18 isEqual:v20];

    if (v21)
    {
      v22 = [v15 remoteIdentifier];
      id v23 = [v22 identifierType];

      if (v23 == (id)13)
      {
        id v24 = [objc_alloc((Class)NEIKEv2AuthenticationProtocol) initWithMethod:13];
        v25 = [v15 localIdentifier];
        id v26 = sub_10011F450(0, v25, v24);

        v27 = v33;
        if ((*((unsigned int (**)(id, id))v33 + 2))(v33, v26))
        {
          id v28 = v19;
          if (self)
          {
            sub_1001073D0((uint64_t)NRDevicePairingCandidateContext, (id *)&self->_ikeSessionControl);
            objc_storeStrong((id *)&self->_ikeSessionControl, a4);
            sub_10010753C((uint64_t)self);
          }
        }
        else
        {
          id v28 = v26;
          id v26 = 0;
        }

        id v14 = v19;
        id v16 = 0;
        goto LABEL_30;
      }
      if (qword_1001F4B30 != -1) {
        dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
      }
      id v14 = v19;
      id v16 = 0;
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4B30 != -1) {
          dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
        }
        id v30 = (id)qword_1001F4B28;
        id v24 = [v15 remoteIdentifier];
        _NRLogWithArgs();

        goto LABEL_27;
      }
    }
    else
    {
      id v14 = v19;
      if (qword_1001F4B30 != -1) {
        dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
      }
      id v16 = 0;
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4B30 != -1) {
          dispatch_once(&qword_1001F4B30, &stru_1001C7B38);
        }
        id v29 = (id)qword_1001F4B28;
        id v24 = [v15 localIdentifier];
        _NRLogWithArgs();

        goto LABEL_27;
      }
    }
  }
  id v26 = 0;
  v27 = v33;
LABEL_34:
  (*((void (**)(id, id, void, void))v17 + 2))(v17, v26, 0, 0);
}

- (void)setPacketReceiver:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    if (!self) {
      goto LABEL_5;
    }
    v5 = (NEIKEv2PacketReceiver *)v4;
    ikePacketReceiver = self->_ikePacketReceiver;
    self->_ikePacketReceiver = v5;
    goto LABEL_4;
  }
  id v7 = sub_1001071DC();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  id v4 = 0;
  if (IsLevelEnabled)
  {
    ikePacketReceiver = sub_1001071DC();
    _NRLogWithArgs();
LABEL_4:

    id v4 = v9;
  }
LABEL_5:
}

- (BOOL)sendPacketData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = sub_1001071DC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v7 = sub_1001071DC();
      _NRLogWithArgs();
    }
    goto LABEL_11;
  }
  if (self)
  {
    if (self->_pipeOutputRing)
    {
      if (os_channel_get_next_slot())
      {
        if (![v4 length])
        {
          [v4 getBytes:0 length:0];
          [v4 length];
          os_channel_set_slot_properties();
          if (os_channel_advance_slot())
          {
            id v14 = sub_1001071DC();
            int v15 = _NRLogIsLevelEnabled();

            if (v15)
            {
              id v16 = sub_1001071DC();
              _NRLogWithArgs();
            }
          }
          if (!os_channel_sync()) {
            goto LABEL_8;
          }
          id v17 = sub_1001071DC();
          int v18 = _NRLogIsLevelEnabled();

          if (!v18) {
            goto LABEL_8;
          }
          id v11 = sub_1001071DC();
          goto LABEL_21;
        }
        id v12 = sub_1001071DC();
        int v13 = _NRLogIsLevelEnabled();

        if (v13)
        {
LABEL_14:
          id v11 = sub_1001071DC();
          [v4 length];
LABEL_21:
          _NRLogWithArgs();
        }
      }
      else
      {
        id v9 = sub_1001071DC();
        int v10 = _NRLogIsLevelEnabled();

        if (v10) {
          goto LABEL_14;
        }
      }
LABEL_8:
      LOBYTE(self) = 1;
      goto LABEL_12;
    }
LABEL_11:
    LOBYTE(self) = 0;
  }
LABEL_12:

  return (char)self;
}

- (NSString)description
{
  if (self) {
    self = (NRDevicePairingCandidateContext *)self->_candidateInfo;
  }
  return [(NRDevicePairingCandidateContext *)self description];
}

- (void)dealloc
{
  sub_100109F28((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NRDevicePairingCandidateContext;
  [(NRDevicePairingCandidateContext *)&v3 dealloc];
}

@end