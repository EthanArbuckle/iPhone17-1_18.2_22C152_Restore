@interface NRBabelNeighbor
- (BOOL)dtlsEnabled;
- (BOOL)dtlsReady;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesAddress:(const in6_addr *)a3;
- (BOOL)matchesAddress:(const in6_addr *)a3 babelInterface:(id)a4;
- (NRBabelInterface)babelInterface;
- (NRBabelNeighbor)initWithAddress:(const in6_addr *)a3 babelInterface:(id)a4;
- (NRDDTLSStack)dtlsStack;
- (NSMutableArray)pendingOutgoingPackets;
- (NSString)description;
- (OS_dispatch_source)incomingIHUTimer;
- (OS_dispatch_source)incomingPersonalHelloTimer;
- (OS_dispatch_source)incomingPublicHelloTimer;
- (OS_dispatch_source)pendingOutgoingTimer;
- (double)lastIncomingPersonalHelloTime;
- (double)lastIncomingPublicHelloTime;
- (id)createIHUTLV;
- (id)createPersonalHelloTLV;
- (id)descriptionWithNextHop:(const in6_addr *)a3;
- (in6_addr)address;
- (unint64_t)incomingPersonalHelloHistory;
- (unint64_t)incomingPublicHelloHistory;
- (unsigned)lastIncomingIHUInterval;
- (unsigned)lastIncomingPersonalHelloInterval;
- (unsigned)lastIncomingPersonalHelloSeqno;
- (unsigned)lastIncomingPublicHelloInterval;
- (unsigned)lastIncomingPublicHelloSeqno;
- (unsigned)metric;
- (unsigned)outgoingIHUInterval;
- (unsigned)outgoingPersonalHelloSeqno;
- (unsigned)outgoingUpdateInterval;
- (unsigned)rxcost;
- (unsigned)txcost;
- (void)dealloc;
- (void)enqueueNextIHU;
- (void)enqueueNextUpdate;
- (void)handleDTLSStack:(id)a3 inboundDecryptedData:(id)a4;
- (void)handleDTLSStack:(id)a3 outboundEncryptedData:(id)a4;
- (void)handleHelloWithSeqno:(unsigned __int16)a3 interval:(unsigned __int16)a4 personal:(BOOL)a5;
- (void)handleIsReady:(id)a3;
- (void)processPendingOutgoingPackets;
- (void)resetIncomingHelloTimer:(BOOL)a3 personal:(BOOL)a4;
- (void)resetIncomingIHUTimerInterval:(unsigned __int16)a3;
- (void)scheduleTLV:(id)a3 interval:(unsigned __int16)a4;
- (void)sendFullPacket:(iovec *)a3 iovLen:(unsigned int)a4;
- (void)sendTLVs:(id)a3;
- (void)setAddress:(in6_addr)a3;
- (void)setBabelInterface:(id)a3;
- (void)setDtlsEnabled:(BOOL)a3;
- (void)setDtlsReady:(BOOL)a3;
- (void)setDtlsStack:(id)a3;
- (void)setIncomingIHUTimer:(id)a3;
- (void)setIncomingPersonalHelloHistory:(unint64_t)a3;
- (void)setIncomingPersonalHelloTimer:(id)a3;
- (void)setIncomingPublicHelloHistory:(unint64_t)a3;
- (void)setIncomingPublicHelloTimer:(id)a3;
- (void)setLastIncomingIHUInterval:(unsigned __int16)a3;
- (void)setLastIncomingPersonalHelloInterval:(unsigned __int16)a3;
- (void)setLastIncomingPersonalHelloSeqno:(unsigned __int16)a3;
- (void)setLastIncomingPersonalHelloTime:(double)a3;
- (void)setLastIncomingPublicHelloInterval:(unsigned __int16)a3;
- (void)setLastIncomingPublicHelloSeqno:(unsigned __int16)a3;
- (void)setLastIncomingPublicHelloTime:(double)a3;
- (void)setOutgoingIHUInterval:(unsigned __int16)a3;
- (void)setOutgoingPersonalHelloSeqno:(unsigned __int16)a3;
- (void)setOutgoingUpdateInterval:(unsigned __int16)a3;
- (void)setPendingOutgoingPackets:(id)a3;
- (void)setPendingOutgoingTimer:(id)a3;
- (void)setRxcost:(unsigned __int16)a3;
- (void)setTxcost:(unsigned __int16)a3;
- (void)updateRXCostCheckTime:(BOOL)a3 personal:(BOOL)a4;
@end

@implementation NRBabelNeighbor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dtlsStack, 0);
  objc_storeStrong((id *)&self->_pendingOutgoingPackets, 0);
  objc_storeStrong((id *)&self->_pendingOutgoingTimer, 0);
  objc_storeStrong((id *)&self->_incomingIHUTimer, 0);
  objc_storeStrong((id *)&self->_incomingPersonalHelloTimer, 0);
  objc_storeStrong((id *)&self->_incomingPublicHelloTimer, 0);

  objc_storeStrong((id *)&self->_babelInterface, 0);
}

- (void)setDtlsStack:(id)a3
{
}

- (NRDDTLSStack)dtlsStack
{
  return self->_dtlsStack;
}

- (void)setDtlsReady:(BOOL)a3
{
  self->_dtlsReady = a3;
}

- (BOOL)dtlsReady
{
  return self->_dtlsReady;
}

- (void)setDtlsEnabled:(BOOL)a3
{
  self->_dtlsEnabled = a3;
}

- (BOOL)dtlsEnabled
{
  return self->_dtlsEnabled;
}

- (void)setPendingOutgoingPackets:(id)a3
{
}

- (NSMutableArray)pendingOutgoingPackets
{
  return self->_pendingOutgoingPackets;
}

- (void)setPendingOutgoingTimer:(id)a3
{
}

- (OS_dispatch_source)pendingOutgoingTimer
{
  return self->_pendingOutgoingTimer;
}

- (void)setIncomingIHUTimer:(id)a3
{
}

- (OS_dispatch_source)incomingIHUTimer
{
  return self->_incomingIHUTimer;
}

- (void)setLastIncomingIHUInterval:(unsigned __int16)a3
{
  self->_lastIncomingIHUInterval = a3;
}

- (unsigned)lastIncomingIHUInterval
{
  return self->_lastIncomingIHUInterval;
}

- (void)setIncomingPersonalHelloTimer:(id)a3
{
}

- (OS_dispatch_source)incomingPersonalHelloTimer
{
  return self->_incomingPersonalHelloTimer;
}

- (void)setLastIncomingPersonalHelloInterval:(unsigned __int16)a3
{
  self->_lastIncomingPersonalHelloInterval = a3;
}

- (unsigned)lastIncomingPersonalHelloInterval
{
  return self->_lastIncomingPersonalHelloInterval;
}

- (void)setLastIncomingPersonalHelloTime:(double)a3
{
  self->_lastIncomingPersonalHelloTime = a3;
}

- (double)lastIncomingPersonalHelloTime
{
  return self->_lastIncomingPersonalHelloTime;
}

- (void)setLastIncomingPersonalHelloSeqno:(unsigned __int16)a3
{
  self->_lastIncomingPersonalHelloSeqno = a3;
}

- (unsigned)lastIncomingPersonalHelloSeqno
{
  return self->_lastIncomingPersonalHelloSeqno;
}

- (void)setIncomingPersonalHelloHistory:(unint64_t)a3
{
  self->_incomingPersonalHelloHistory = a3;
}

- (unint64_t)incomingPersonalHelloHistory
{
  return self->_incomingPersonalHelloHistory;
}

- (void)setIncomingPublicHelloTimer:(id)a3
{
}

- (OS_dispatch_source)incomingPublicHelloTimer
{
  return self->_incomingPublicHelloTimer;
}

- (void)setLastIncomingPublicHelloInterval:(unsigned __int16)a3
{
  self->_lastIncomingPublicHelloInterval = a3;
}

- (unsigned)lastIncomingPublicHelloInterval
{
  return self->_lastIncomingPublicHelloInterval;
}

- (void)setLastIncomingPublicHelloTime:(double)a3
{
  self->_lastIncomingPublicHelloTime = a3;
}

- (double)lastIncomingPublicHelloTime
{
  return self->_lastIncomingPublicHelloTime;
}

- (void)setLastIncomingPublicHelloSeqno:(unsigned __int16)a3
{
  self->_lastIncomingPublicHelloSeqno = a3;
}

- (unsigned)lastIncomingPublicHelloSeqno
{
  return self->_lastIncomingPublicHelloSeqno;
}

- (void)setIncomingPublicHelloHistory:(unint64_t)a3
{
  self->_incomingPublicHelloHistory = a3;
}

- (unint64_t)incomingPublicHelloHistory
{
  return self->_incomingPublicHelloHistory;
}

- (void)setRxcost:(unsigned __int16)a3
{
  self->_rxcost = a3;
}

- (unsigned)rxcost
{
  return self->_rxcost;
}

- (void)setTxcost:(unsigned __int16)a3
{
  self->_txcost = a3;
}

- (unsigned)txcost
{
  return self->_txcost;
}

- (void)setOutgoingUpdateInterval:(unsigned __int16)a3
{
  self->_outgoingUpdateInterval = a3;
}

- (unsigned)outgoingUpdateInterval
{
  return self->_outgoingUpdateInterval;
}

- (void)setOutgoingIHUInterval:(unsigned __int16)a3
{
  self->_outgoingIHUInterval = a3;
}

- (unsigned)outgoingIHUInterval
{
  return self->_outgoingIHUInterval;
}

- (void)setOutgoingPersonalHelloSeqno:(unsigned __int16)a3
{
  self->_outgoingPersonalHelloSeqno = a3;
}

- (unsigned)outgoingPersonalHelloSeqno
{
  return self->_outgoingPersonalHelloSeqno;
}

- (void)setBabelInterface:(id)a3
{
}

- (NRBabelInterface)babelInterface
{
  return self->_babelInterface;
}

- (void)setAddress:(in6_addr)a3
{
  self->_address = a3;
}

- (in6_addr)address
{
  uint64_t v2 = *(void *)&self->_address.__u6_addr32[2];
  uint64_t v3 = *(void *)self->_address.__u6_addr8;
  *(void *)&result.__u6_addr32[2] = v2;
  *(void *)result.__u6_addr8 = v3;
  return result;
}

- (void)handleDTLSStack:(id)a3 inboundDecryptedData:(id)a4
{
  id v14 = a4;
  v5 = [(NRBabelNeighbor *)self babelInterface];
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    id v6 = (id)qword_1001F4A50;
    v12 = self;
    id v13 = [v14 length];
    uint64_t v11 = 1867;
    v9 = "";
    v10 = "-[NRBabelNeighbor handleDTLSStack:inboundDecryptedData:]";
    _NRLogWithArgs();
  }
  v7 = [(NRBabelNeighbor *)self babelInterface];
  v8 = [v7 instance];
  [v8 handlePacket:[v14 bytes] length:[v14 length] remoteAddr:&self->_address localAddr:[v5 localAddress] babelInterface:v5 dtls:1];
}

- (void)handleDTLSStack:(id)a3 outboundEncryptedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    id v8 = (id)qword_1001F4A50;
    id v13 = self;
    id v14 = [v7 length];
    uint64_t v12 = 1855;
    v10 = "";
    uint64_t v11 = "-[NRBabelNeighbor handleDTLSStack:outboundEncryptedData:]";
    _NRLogWithArgs();
  }
  v15[0] = [v7 bytes:v10, v11, v12, v13, v14];
  v15[1] = [v7 length];
  v9 = [(NRBabelNeighbor *)self babelInterface];
  [v9 sendPacket:v15 iovLen:1 toAddr:&self->_address];
}

- (void)handleIsReady:(id)a3
{
  id v11 = a3;
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    v9 = self;
    id v10 = v11;
    uint64_t v8 = 1847;
    id v6 = "";
    id v7 = "-[NRBabelNeighbor handleIsReady:]";
    _NRLogWithArgs();
  }
  -[NRBabelNeighbor setDtlsReady:](self, "setDtlsReady:", 1, v6, v7, v8, v9, v10);
  v4 = [(NRBabelNeighbor *)self babelInterface];
  v5 = [v4 instance];
  [v5 sendImmediateRouteUpdateToNeighbor:self];
}

- (void)sendTLVs:(id)a3
{
  id v5 = a3;
  if (![v5 count]) {
    goto LABEL_35;
  }
  unsigned int v6 = [v5 count];
  uint64_t v7 = v6 + 1;
  if (v6 == -1)
  {
    id v30 = sub_1000B9E04();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v32 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    v24 = (void *)_os_log_pack_size();
    __chkstk_darwin(v24);
    __error();
    uint64_t v33 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v33 = 136446210;
    *(void *)(v33 + 4) = "strict_calloc";
LABEL_42:
    sub_1000B9E04();
    _NRLogAbortWithPack();
LABEL_43:
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
LABEL_20:
    uint64_t v7 = v39;
    if (_NRLogIsLevelEnabled())
    {
      if (v24[331] != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      _NRLogWithArgs();
    }
    goto LABEL_25;
  }
  uint64_t v8 = malloc_type_calloc(v6 + 1, 0x10uLL, 0xF1748037uLL);
  if (!v8)
  {
    id v34 = sub_1000B9E04();
    int v35 = _NRLogIsLevelEnabled();

    if (v35)
    {
      id v36 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    v24 = (void *)_os_log_pack_size();
    __chkstk_darwin(v24);
    __error();
    uint64_t v37 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v37 = 136446722;
    *(void *)(v37 + 4) = "strict_calloc";
    *(_WORD *)(v37 + 12) = 2048;
    *(void *)(v37 + 14) = v7;
    *(_WORD *)(v37 + 22) = 2048;
    *(void *)(v37 + 24) = 16;
    goto LABEL_42;
  }
  int v54 = 554;
  void *v8 = &v54;
  v8[1] = 4;
  v41 = self;
  v9 = v8;
  id v10 = [(NRBabelNeighbor *)self babelInterface];
  unsigned __int16 v11 = (unsigned __int16)[v10 mtu];

  id v12 = objc_alloc_init((Class)NSMutableArray);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v42 = v5;
  id v44 = v5;
  id v13 = [v44 countByEnumeratingWithState:&v50 objects:v56 count:16];
  v43 = v12;
  v40 = v9;
  if (v13)
  {
    id v14 = v13;
    unsigned int v3 = 0;
    unsigned __int16 v45 = v11 - 4;
    uint64_t v15 = *(void *)v51;
    v16 = v9 + 1;
    unsigned int v17 = 1;
    uint64_t v39 = v7;
LABEL_6:
    v18 = 0;
    unsigned int v38 = v17;
    if (v7 >= v17) {
      v19 = (void *)(v7 - v17);
    }
    else {
      v19 = 0;
    }
    v20 = &v16[2 * v17];
    while (1)
    {
      if (*(void *)v51 != v15) {
        objc_enumerationMutation(v44);
      }
      if (v19 == v18) {
        break;
      }
      id v21 = *(id *)(*((void *)&v50 + 1) + 8 * (void)v18);
      unsigned int v22 = [v21 length];
      unsigned int v23 = v3 + v22;
      if ((unsigned __int16)(v3 + v22) > v45)
      {
        [v43 addObject:v21];
      }
      else
      {
        *(v20 - 1) = [v21 bytes];
        void *v20 = [v21 length];
        unsigned int v3 = v23;
      }
      v18 = (char *)v18 + 1;
      v20 += 2;
      if (v14 == v18)
      {
        unsigned int v17 = v38 + v18;
        id v14 = [v44 countByEnumeratingWithState:&v50 objects:v56 count:16];
        uint64_t v7 = v39;
        if (v14) {
          goto LABEL_6;
        }
        goto LABEL_25;
      }
    }
    v24 = &unk_1001F4000;
    if (qword_1001F4A58 != -1) {
      goto LABEL_43;
    }
    goto LABEL_20;
  }
  unsigned int v3 = 0;
LABEL_25:

  HIWORD(v54) = bswap32(v3) >> 16;
  [(NRBabelNeighbor *)v41 sendFullPacket:v40 iovLen:v7];
  free(v40);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v25 = v44;
  id v26 = [v25 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v47;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v47 != v28) {
          objc_enumerationMutation(v25);
        }
      }
      id v27 = [v25 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v27);
  }

  if ([v43 count]) {
    [(NRBabelNeighbor *)v41 sendTLVs:v43];
  }

  id v5 = v42;
LABEL_35:
}

- (void)sendFullPacket:(iovec *)a3 iovLen:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (![(NRBabelNeighbor *)self dtlsEnabled])
  {
    id v13 = [(NRBabelNeighbor *)self babelInterface];
    [v13 sendPacket:a3 iovLen:v4 toAddr:&self->_address];
LABEL_16:

    return;
  }
  if ([(NRBabelNeighbor *)self dtlsReady])
  {
    id v7 = objc_alloc_init((Class)NSMutableData);
    if (v4)
    {
      uint64_t v4 = v4;
      p_iov_len = &a3->iov_len;
      do
      {
        [v7 appendBytes:*(p_iov_len - 1) length:*p_iov_len];
        p_iov_len += 2;
        --v4;
      }
      while (v4);
    }
    v9 = [(NRBabelNeighbor *)self dtlsStack];
    id v13 = v7;
    if (v9)
    {
      if (qword_1001F4D10 != -1) {
        dispatch_once(&qword_1001F4D10, &stru_1001C8638);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4D10 != -1) {
          dispatch_once(&qword_1001F4D10, &stru_1001C8638);
        }
        id v10 = (id)qword_1001F4D08;
        [v13 length];
        _NRLogWithArgs();
      }
      unsigned __int16 v11 = v9[4];
      id v12 = [v13 _createDispatchData];
      completion[0] = _NSConcreteStackBlock;
      completion[1] = 3221225472;
      completion[2] = sub_1001325B0;
      completion[3] = &unk_1001C84D8;
      completion[4] = v9;
      nw_connection_send(v11, v12, _nw_content_context_default_message, 0, completion);
    }
    goto LABEL_16;
  }
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    _NRLogWithArgs();
  }
}

- (unsigned)metric
{
  unsigned int txcost = self->_txcost;
  unsigned __int16 v3 = -1;
  if (txcost != 0xFFFF)
  {
    if (txcost <= 0x100) {
      int v4 = 256;
    }
    else {
      int v4 = self->_txcost;
    }
    unsigned int v5 = self->_rxcost * v4;
    if (v5 > 0xFFFEFF) {
      return -1;
    }
    else {
      return v5 >> 8;
    }
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v5 = [v4 matchesAddress:&self->_address babelInterface:self->_babelInterface];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)descriptionWithNextHop:(const in6_addr *)a3
{
  unsigned __int8 v4 = -[NRBabelNeighbor matchesAddress:](self, "matchesAddress:");
  id v5 = objc_alloc((Class)NSString);
  if (v4)
  {
    IPv6AddrString = [(NRBabelNeighbor *)self description];
    id v7 = [v5 initWithString:IPv6AddrString];
  }
  else
  {
    IPv6AddrString = (void *)createIPv6AddrString();
    id v7 = [v5 initWithFormat:@"%@(nh %@)", self, IPv6AddrString];
  }
  uint64_t v8 = v7;

  return v8;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  IPv6AddrString = (void *)createIPv6AddrString();
  babelInterface = self->_babelInterface;
  unsigned int v6 = [(NRBabelNeighbor *)self dtlsEnabled];
  id v7 = "";
  if (v6) {
    id v7 = "_DTLS";
  }
  id v8 = [v3 initWithFormat:@"%@[%@]%s", IPv6AddrString, babelInterface, v7];

  return (NSString *)v8;
}

- (BOOL)matchesAddress:(const in6_addr *)a3 babelInterface:(id)a4
{
  unsigned int v6 = [(NRBabelInterface *)self->_babelInterface isEqual:a4];
  if (v6)
  {
    LOBYTE(v6) = [(NRBabelNeighbor *)self matchesAddress:a3];
  }
  return v6;
}

- (BOOL)matchesAddress:(const in6_addr *)a3
{
  return *(void *)self->_address.__u6_addr8 == *(void *)a3->__u6_addr8
      && *(void *)&self->_address.__u6_addr32[2] == *(void *)&a3->__u6_addr32[2];
}

- (NRBabelNeighbor)initWithAddress:(const in6_addr *)a3 babelInterface:(id)a4
{
  unsigned __int8 v4 = a4;
  id v7 = a4;
  id v8 = [v7 instance];
  if (v8)
  {
    v54.receiver = self;
    v54.super_class = (Class)NRBabelNeighbor;
    v9 = [(NRBabelNeighbor *)&v54 init];
    if (v9)
    {
      self = v9;
      v9->_address = *a3;
      objc_storeStrong((id *)&v9->_babelInterface, v4);
      if (![v7 dtlsEnabled])
      {
LABEL_17:
        self->_outgoingPersonalHelloSeqno = arc4random_uniform(0x10000u);
        self->_incomingPublicHelloHistory = 0xFFFFLL;
        self->_incomingPersonalHelloHistory = 0xFFFFLL;
        *(void *)&self->_outgoingIHUInterval = -4059036496;
        v20 = [v8 queue];
        id v21 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v20);
        incomingPublicHelloTimer = self->_incomingPublicHelloTimer;
        self->_incomingPublicHelloTimer = v21;

        unsigned int v23 = [v8 queue];
        v24 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v23);
        incomingPersonalHelloTimer = self->_incomingPersonalHelloTimer;
        self->_incomingPersonalHelloTimer = v24;

        id v26 = [v8 queue];
        id v27 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v26);
        incomingIHUTimer = self->_incomingIHUTimer;
        self->_incomingIHUTimer = v27;

        v29 = [v8 queue];
        id v30 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v29);
        pendingOutgoingTimer = self->_pendingOutgoingTimer;
        self->_pendingOutgoingTimer = v30;

        id v32 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        pendingOutgoingPackets = self->_pendingOutgoingPackets;
        self->_pendingOutgoingPackets = v32;

        id v34 = objc_alloc_init(NRBabelPendingOutgoingTLVs);
        [(NRBabelPendingOutgoingTLVs *)v34 setRepresentsIHU:1];
        [(NRBabelPendingOutgoingTLVs *)v34 setRepresentsUpdate:1];
        [(NSMutableArray *)self->_pendingOutgoingPackets addObject:v34];
        [(NRBabelNeighbor *)self processPendingOutgoingPackets];
        objc_initWeak(&location, self);
        int v35 = self->_pendingOutgoingTimer;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_1000BE8E8;
        handler[3] = &unk_1001C7FF0;
        objc_copyWeak(&v52, &location);
        dispatch_source_set_event_handler(v35, handler);
        dispatch_activate((dispatch_object_t)self->_pendingOutgoingTimer);
        id v36 = self->_incomingPublicHelloTimer;
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_1000BE92C;
        v49[3] = &unk_1001C7FF0;
        objc_copyWeak(&v50, &location);
        dispatch_source_set_event_handler(v36, v49);
        dispatch_activate((dispatch_object_t)self->_incomingPublicHelloTimer);
        uint64_t v37 = self->_incomingPersonalHelloTimer;
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_1000BE978;
        v47[3] = &unk_1001C7FF0;
        objc_copyWeak(&v48, &location);
        dispatch_source_set_event_handler(v37, v47);
        dispatch_activate((dispatch_object_t)self->_incomingPersonalHelloTimer);
        unsigned int v38 = self->_incomingIHUTimer;
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_1000BE9C4;
        v45[3] = &unk_1001C7FF0;
        objc_copyWeak(&v46, &location);
        dispatch_source_set_event_handler(v38, v45);
        dispatch_activate((dispatch_object_t)self->_incomingIHUTimer);
        self = self;
        objc_destroyWeak(&v46);
        objc_destroyWeak(&v48);
        objc_destroyWeak(&v50);
        objc_destroyWeak(&v52);
        objc_destroyWeak(&location);

        id v14 = self;
        goto LABEL_18;
      }
      [(NRBabelNeighbor *)self setDtlsEnabled:1];
      unsigned __int8 v4 = [(NRBabelNeighbor *)self babelInterface];
      id v10 = (unint64_t *)[v4 localAddress];
      unint64_t v11 = bswap64(*(void *)a3->__u6_addr8);
      unint64_t v12 = bswap64(*v10);
      if (v11 == v12 && (unint64_t v11 = bswap64(*(void *)&a3->__u6_addr32[2]), v12 = bswap64(v10[1]), v11 == v12))
      {
        int v13 = 0;
      }
      else if (v11 < v12)
      {
        int v13 = -1;
      }
      else
      {
        int v13 = 1;
      }
      char v15 = v13 > 0;
      v16 = [NRDDTLSStack alloc];
      unsigned int v17 = [v8 queue];
      v18 = sub_100133B54((id *)&v16->super.isa, v17, v15, self);
      [(NRBabelNeighbor *)self setDtlsStack:v18];

      a3 = (const in6_addr *)&unk_1001F4000;
      if (qword_1001F4A58 == -1)
      {
LABEL_12:
        if (_NRLogIsLevelEnabled())
        {
          if (*(void *)&a3[165].__u6_addr32[2] != -1) {
            dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
          }
          id v19 = (id)qword_1001F4A50;
          id v44 = [(NRBabelNeighbor *)self dtlsStack];
          _NRLogWithArgs();
        }
        goto LABEL_17;
      }
    }
    else
    {
      id v40 = sub_1000B9E04();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        id v42 = sub_1000B9E04();
        _NRLogWithArgs();
      }
      id v7 = (id)_os_log_pack_size();
      id v8 = (char *)v45 - ((__chkstk_darwin(v7) + 15) & 0xFFFFFFFFFFFFFFF0);
      __error();
      uint64_t v43 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v43 = 136446210;
      *(void *)(v43 + 4) = "-[NRBabelNeighbor initWithAddress:babelInterface:]";
      sub_1000B9E04();
      _NRLogAbortWithPack();
    }
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    goto LABEL_12;
  }
  id v14 = 0;
LABEL_18:

  return v14;
}

- (void)handleHelloWithSeqno:(unsigned __int16)a3 interval:(unsigned __int16)a4 personal:(BOOL)a5
{
  BOOL v5 = a5;
  int v7 = a3 | 0x10000;
  if (a5)
  {
    unsigned int lastIncomingPersonalHelloSeqno = self->_lastIncomingPersonalHelloSeqno;
    if (lastIncomingPersonalHelloSeqno < a3) {
      int v7 = a3;
    }
    int v9 = v7 - lastIncomingPersonalHelloSeqno;
    if (v9 < 1) {
      v9 += 0x10000;
    }
    if (v9 <= 16) {
      unint64_t v10 = (self->_incomingPersonalHelloHistory << v9) | 1;
    }
    else {
      unint64_t v10 = 0xFFFFLL;
    }
    self->_incomingPersonalHelloHistory = v10;
    self->_unsigned int lastIncomingPersonalHelloSeqno = a3;
    if (a4)
    {
      uint64_t v14 = 72;
      uint64_t v15 = 26;
LABEL_20:
      *(_WORD *)((char *)&self->super.isa + v15) = a4;
      +[NSDate timeIntervalSinceReferenceDate];
      *(Class *)((char *)&self->super.isa + v14) = v16;
      [(NRBabelNeighbor *)self updateRXCostCheckTime:0 personal:v5];
    }
  }
  else
  {
    unsigned int lastIncomingPublicHelloSeqno = self->_lastIncomingPublicHelloSeqno;
    if (lastIncomingPublicHelloSeqno < a3) {
      int v7 = a3;
    }
    int v12 = v7 - lastIncomingPublicHelloSeqno;
    if (v12 < 1) {
      v12 += 0x10000;
    }
    if (v12 <= 16) {
      unint64_t v13 = (self->_incomingPublicHelloHistory << v12) | 1;
    }
    else {
      unint64_t v13 = 0xFFFFLL;
    }
    self->_incomingPublicHelloHistory = v13;
    self->_unsigned int lastIncomingPublicHelloSeqno = a3;
    if (a4)
    {
      uint64_t v14 = 48;
      uint64_t v15 = 22;
      goto LABEL_20;
    }
  }
}

- (void)updateRXCostCheckTime:(BOOL)a3 personal:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  p_incomingPublicHelloHistory = &self->_incomingPublicHelloHistory;
  int8x16_t v8 = (int8x16_t)vld1q_dup_f64((const double *)p_incomingPublicHelloHistory);
  int8x16_t v9 = (int8x16_t)xmmword_10016C8C0;
  int8x16_t v10 = (int8x16_t)xmmword_10016C8D0;
  int8x16_t v11 = (int8x16_t)xmmword_10016C8E0;
  int8x16_t v12 = (int8x16_t)xmmword_10016C8F0;
  int8x16_t v13 = (int8x16_t)xmmword_10016C900;
  int8x16_t v14 = (int8x16_t)xmmword_10016C910;
  int8x16_t v15 = (int8x16_t)xmmword_10016C920;
  int8x16_t v16 = (int8x16_t)xmmword_10016C930;
  int8x16_t v17 = (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10016C8C0)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10016C8D0))), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10016C8E0)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10016C8F0))));
  int8x16_t v18 = (int8x16_t)xmmword_10016C940;
  int8x16_t v19 = vandq_s8(vcltzq_s8(vshlq_n_s8(vuzp1q_s8(v17, (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10016C900)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10016C910))), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10016C920)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10016C930))))), 7uLL)), (int8x16_t)xmmword_10016C940);
  v17.i8[0] = vaddv_s8(*(int8x8_t *)v19.i8);
  v19.i64[0] = vextq_s8(v19, v19, 8uLL).u64[0];
  v19.i8[0] = vaddv_s8(*(int8x8_t *)v19.i8);
  v19.i32[0] = (unsigned __int16)(v17.i16[0] | (v19.i16[0] << 8));
  *(int8x8_t *)v19.i8 = vcnt_s8(*(int8x8_t *)v19.i8);
  v19.i16[0] = vaddlv_u8(*(uint8x8_t *)v19.i8);
  unsigned int v20 = v19.i32[0];
  if (a3)
  {
    unsigned int lastIncomingPublicHelloInterval = self->_lastIncomingPublicHelloInterval;
    double lastIncomingPublicHelloTime = self->_lastIncomingPublicHelloTime;
    +[NSDate timeIntervalSinceReferenceDate];
    int8x16_t v18 = (int8x16_t)xmmword_10016C940;
    int8x16_t v16 = (int8x16_t)xmmword_10016C930;
    int8x16_t v15 = (int8x16_t)xmmword_10016C920;
    int8x16_t v14 = (int8x16_t)xmmword_10016C910;
    int8x16_t v13 = (int8x16_t)xmmword_10016C900;
    int8x16_t v12 = (int8x16_t)xmmword_10016C8F0;
    int8x16_t v11 = (int8x16_t)xmmword_10016C8E0;
    int8x16_t v10 = (int8x16_t)xmmword_10016C8D0;
    int8x16_t v9 = (int8x16_t)xmmword_10016C8C0;
    v20 += ((v23 - lastIncomingPublicHelloTime) * 100.0) / lastIncomingPublicHelloInterval;
  }
  p_incomingPersonalHelloHistory = &self->_incomingPersonalHelloHistory;
  int8x16_t v25 = (int8x16_t)vld1q_dup_f64((const double *)p_incomingPersonalHelloHistory);
  int8x16_t v26 = (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v9)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v10))), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v11)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v12))));
  int8x16_t v27 = vandq_s8(vcltzq_s8(vshlq_n_s8(vuzp1q_s8(v26, (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v13)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v14))), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v15)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v16))))), 7uLL)), v18);
  v26.i8[0] = vaddv_s8(*(int8x8_t *)v27.i8);
  v27.i64[0] = vextq_s8(v27, v27, 8uLL).u64[0];
  v27.i8[0] = vaddv_s8(*(int8x8_t *)v27.i8);
  v27.i32[0] = (unsigned __int16)(v26.i16[0] | (v27.i16[0] << 8));
  *(int8x8_t *)v27.i8 = vcnt_s8(*(int8x8_t *)v27.i8);
  v27.i16[0] = vaddlv_u8(*(uint8x8_t *)v27.i8);
  unsigned int v28 = v27.i32[0];
  if (v5)
  {
    unsigned int lastIncomingPersonalHelloInterval = self->_lastIncomingPersonalHelloInterval;
    double lastIncomingPersonalHelloTime = self->_lastIncomingPersonalHelloTime;
    +[NSDate timeIntervalSinceReferenceDate];
    v28 += ((v31 - lastIncomingPersonalHelloTime) * 100.0) / lastIncomingPersonalHelloInterval;
  }
  if (v20 >= v28) {
    unsigned int v32 = v28;
  }
  else {
    unsigned int v32 = v20;
  }
  uint64_t rxcost = self->_rxcost;
  if (v32 <= 0xF) {
    unsigned int v34 = 0x1000 / (16 - (unsigned __int16)v32);
  }
  else {
    unsigned int v34 = 0xFFFF;
  }
  self->_uint64_t rxcost = v34;
  if (v34 != rxcost)
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      int v35 = "hello";
      if (v5) {
        int v35 = "timeout";
      }
      uint64_t v43 = self->_rxcost;
      id v44 = v35;
      v41 = self;
      uint64_t v42 = rxcost;
      uint64_t v39 = "-[NRBabelNeighbor updateRXCostCheckTime:personal:]";
      uint64_t v40 = 1562;
      unsigned int v38 = "";
      _NRLogWithArgs();
    }
    id v36 = [(NRBabelNeighbor *)self babelInterface];
    uint64_t v37 = [v36 instance];
    [v37 updateRoutes];
  }

  [(NRBabelNeighbor *)self resetIncomingHelloTimer:!v5 personal:v4];
}

- (void)resetIncomingIHUTimerInterval:(unsigned __int16)a3
{
  incomingIHUTimer = self->_incomingIHUTimer;
  dispatch_time_t v4 = dispatch_time(0x8000000000000000, 35000000 * a3);

  dispatch_source_set_timer(incomingIHUTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

- (void)resetIncomingHelloTimer:(BOOL)a3 personal:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v5 = 22;
  if (a4) {
    uint64_t v5 = 26;
  }
  uint64_t v6 = 80;
  if (a4) {
    uint64_t v6 = 56;
  }
  unsigned int v7 = *(unsigned __int16 *)((char *)&self->super.isa + v5);
  source = *(id *)((char *)&self->super.isa + v6);
  uint64_t v8 = 12500000 * v7;
  if (v7 <= 0x64) {
    uint64_t v8 = 17500000 * v7;
  }
  if (v4) {
    int64_t v9 = v8;
  }
  else {
    int64_t v9 = 10000000 * v7;
  }
  dispatch_time_t v10 = dispatch_time(0x8000000000000000, v9);
  dispatch_source_set_timer(source, v10, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

- (void)scheduleTLV:(id)a3 interval:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v8 = [[NRBabelPendingOutgoingTLVs alloc] initWithInterval:v4];
  unsigned int v7 = [(NRBabelPendingOutgoingTLVs *)v8 tlvs];
  [v7 addObject:v6];

  [(NSMutableArray *)self->_pendingOutgoingPackets addObject:v8];
  [(NRBabelNeighbor *)self processPendingOutgoingPackets];
}

- (void)dealloc
{
  incomingPublicHelloTimer = self->_incomingPublicHelloTimer;
  if (incomingPublicHelloTimer)
  {
    dispatch_source_cancel(incomingPublicHelloTimer);
    uint64_t v4 = self->_incomingPublicHelloTimer;
    self->_incomingPublicHelloTimer = 0;
  }
  incomingPersonalHelloTimer = self->_incomingPersonalHelloTimer;
  if (incomingPersonalHelloTimer)
  {
    dispatch_source_cancel(incomingPersonalHelloTimer);
    id v6 = self->_incomingPersonalHelloTimer;
    self->_incomingPersonalHelloTimer = 0;
  }
  incomingIHUTimer = self->_incomingIHUTimer;
  if (incomingIHUTimer)
  {
    dispatch_source_cancel(incomingIHUTimer);
    uint64_t v8 = self->_incomingIHUTimer;
    self->_incomingIHUTimer = 0;
  }
  pendingOutgoingTimer = self->_pendingOutgoingTimer;
  if (pendingOutgoingTimer)
  {
    dispatch_source_cancel(pendingOutgoingTimer);
    dispatch_time_t v10 = self->_pendingOutgoingTimer;
    self->_pendingOutgoingTimer = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)NRBabelNeighbor;
  [(NRBabelNeighbor *)&v11 dealloc];
}

- (void)processPendingOutgoingPackets
{
  id v3 = [(NRBabelNeighbor *)self babelInterface];
  uint64_t v4 = [v3 instance];

  if (!v4) {
    goto LABEL_107;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  v95 = self;
  uint64_t v8 = self->_pendingOutgoingPackets;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v112 objects:v121 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v113;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v113 != v11) {
          objc_enumerationMutation(v8);
        }
        int8x16_t v13 = *(void **)(*((void *)&v112 + 1) + 8 * i);
        [v13 minTime];
        if (v14 <= v6) {
          [v7 addObject:v13];
        }
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v112 objects:v121 count:16];
    }
    while (v10);
  }

  int8x16_t v15 = (id *)&unk_1001F4000;
  if (![v7 count])
  {
    unsigned int v28 = v95;
    if ([(NSMutableArray *)v95->_pendingOutgoingPackets count])
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        pendingOutgoingPackets = v95->_pendingOutgoingPackets;
        id v30 = (id)qword_1001F4A50;
        double v87 = *(double *)&v95;
        double v88 = COERCE_DOUBLE([(NSMutableArray *)pendingOutgoingPackets count]);
        uint64_t v86 = 1429;
        v83 = "";
        v84 = "-[NRBabelNeighbor processPendingOutgoingPackets]";
        _NRLogWithArgs();
      }
      id v92 = v7;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      double v31 = v95->_pendingOutgoingPackets;
      id v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v104 objects:v119 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v105;
        do
        {
          for (j = 0; j != v33; j = (char *)j + 1)
          {
            if (*(void *)v105 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64_t v43 = *(void **)(*((void *)&v104 + 1) + 8 * (void)j);
            if (qword_1001F4A58 != -1) {
              dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
            }
            if (_NRLogIsLevelEnabled())
            {
              if (qword_1001F4A58 != -1) {
                dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
              }
              id v36 = v15[330];
              [v43 minTime];
              double v38 = v37 - v6;
              [v43 maxTime];
              double v40 = v39 - v6;
              v41 = v15;
              [v43 minTime];
              uint64_t v42 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
              [v43 maxTime];
              +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
              v90 = id v89 = v42;
              double v87 = v38;
              double v88 = v40;
              uint64_t v86 = 1433;
              v83 = "";
              v84 = "-[NRBabelNeighbor processPendingOutgoingPackets]";
              _NRLogWithArgs();

              int8x16_t v15 = v41;
            }
          }
          id v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v104 objects:v119 count:16];
        }
        while (v33);
      }

      id v7 = v92;
      unsigned int v28 = v95;
    }
    else
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        uint64_t v86 = 1436;
        double v87 = *(double *)&v95;
        v83 = "";
        v84 = "-[NRBabelNeighbor processPendingOutgoingPackets]";
        _NRLogWithArgs();
      }
    }
    goto LABEL_71;
  }
  v93 = v4;
  id v94 = objc_alloc_init((Class)NSMutableArray);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v91 = v7;
  id v16 = v7;
  id v17 = [v16 countByEnumeratingWithState:&v108 objects:v120 count:16];
  if (v17)
  {
    id v18 = v17;
    char v19 = 0;
    char v20 = 0;
    uint64_t v21 = *(void *)v109;
    do
    {
      for (k = 0; k != v18; k = (char *)k + 1)
      {
        if (*(void *)v109 != v21) {
          objc_enumerationMutation(v16);
        }
        double v23 = *(void **)(*((void *)&v108 + 1) + 8 * (void)k);
        unsigned __int8 v24 = [v23 representsIHU];
        unsigned __int8 v25 = [v23 representsUpdate];
        int8x16_t v26 = [v23 tlvs];

        if (v26)
        {
          int8x16_t v27 = [v23 tlvs];
          [v94 addObjectsFromArray:v27];
        }
        v20 |= v24;
        v19 |= v25;
        [(NSMutableArray *)v95->_pendingOutgoingPackets removeObject:v23];
      }
      id v18 = [v16 countByEnumeratingWithState:&v108 objects:v120 count:16];
    }
    while (v18);
  }
  else
  {
    char v19 = 0;
    char v20 = 0;
  }

  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  id v7 = v91;
  uint64_t v4 = v93;
  int8x16_t v15 = (id *)&unk_1001F4000;
  unsigned int v28 = v95;
  if (!_NRLogIsLevelEnabled())
  {
    if ((v20 & 1) == 0) {
      goto LABEL_46;
    }
LABEL_62:
    id v48 = [(NRBabelNeighbor *)v28 createIHUTLV];
    [v94 addObject:v48];

    long long v49 = [(NRBabelNeighbor *)v28 createPersonalHelloTLV];
    [v94 addObject:v49];

    if ((v19 & 1) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  if (v20) {
    unsigned __int16 v45 = "IHU+";
  }
  else {
    unsigned __int16 v45 = "";
  }
  if (v19) {
    id v46 = "Update+";
  }
  else {
    id v46 = "";
  }
  id v47 = (id)qword_1001F4A50;
  id v89 = [v94 count];
  v90 = v95;
  double v87 = *(double *)&v45;
  double v88 = *(double *)&v46;
  unsigned int v28 = v95;
  v84 = "-[NRBabelNeighbor processPendingOutgoingPackets]";
  uint64_t v86 = 1410;
  v83 = "";
  _NRLogWithArgs();

  if (v20) {
    goto LABEL_62;
  }
LABEL_46:
  if (v19)
  {
LABEL_47:
    id v44 = [v93 createUpdateTLVsWithInterval:v28->_outgoingUpdateInterval, v83, v84];
    [v94 addObjectsFromArray:v44];
  }
LABEL_48:
  -[NRBabelNeighbor sendTLVs:](v28, "sendTLVs:", v94, v83, v84);
  if (v20) {
    [(NRBabelNeighbor *)v28 enqueueNextIHU];
  }
  if (v19) {
    [(NRBabelNeighbor *)v28 enqueueNextUpdate];
  }

LABEL_71:
  if ([(NSMutableArray *)v28->_pendingOutgoingPackets count])
  {
    id v50 = [(NSMutableArray *)v28->_pendingOutgoingPackets objectAtIndexedSubscript:0];
    [v50 maxTime];
    double v52 = v51;

    long long v53 = [(NSMutableArray *)v28->_pendingOutgoingPackets objectAtIndexedSubscript:0];
    [v53 minTime];
    double v55 = v54;

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    v56 = v28->_pendingOutgoingPackets;
    id v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v100 objects:v118 count:16];
    if (v57)
    {
      id v58 = v57;
      uint64_t v59 = *(void *)v101;
      do
      {
        for (m = 0; m != v58; m = (char *)m + 1)
        {
          if (*(void *)v101 != v59) {
            objc_enumerationMutation(v56);
          }
          v61 = *(void **)(*((void *)&v100 + 1) + 8 * (void)m);
          [v61 maxTime];
          if (v62 < v52)
          {
            [v61 maxTime];
            double v52 = v63;
            [v61 minTime];
            double v55 = v64;
          }
        }
        id v58 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v100 objects:v118 count:16];
      }
      while (v58);
    }

    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    v65 = v95->_pendingOutgoingPackets;
    id v66 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v96 objects:v117 count:16];
    if (v66)
    {
      id v67 = v66;
      uint64_t v68 = *(void *)v97;
      do
      {
        for (n = 0; n != v67; n = (char *)n + 1)
        {
          if (*(void *)v97 != v68) {
            objc_enumerationMutation(v65);
          }
          v70 = *(void **)(*((void *)&v96 + 1) + 8 * (void)n);
          [v70 minTime];
          if (v55 < v71)
          {
            [v70 minTime];
            if (v72 < v52)
            {
              [v70 minTime];
              double v55 = v73;
            }
          }
        }
        id v67 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v96 objects:v117 count:16];
      }
      while (v67);
    }

    v74 = v95->_pendingOutgoingTimer;
    if (v55 >= v52)
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4A58 != -1) {
          dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
        }
        id v75 = v15[330];
        v76 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v55];
        v85 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v52];
        _NRLogWithArgs();
      }
      double v52 = v55 + 0.001;
    }
    double v77 = (v52 - v55) * 2.32830644e-10 * (double)arc4random();
    double v78 = v77 + v55;
    when.tv_sec = vcvtmd_s64_f64(v78) + 978307200;
    when.tv_nsec = (uint64_t)((v78 - floor(v78)) * 1000000000.0);
    dispatch_time_t v79 = dispatch_walltime(&when, 0);
    uint64_t v80 = (unint64_t)(fmin(v77, v52 - v78) * 1000000000.0);
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4A58 != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      id v81 = v15[330];
      v82 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v78];
      +[NSDate timeIntervalSinceReferenceDate];
      _NRLogWithArgs();
    }
    dispatch_source_set_timer(v74, v79, 0xFFFFFFFFFFFFFFFFLL, v80);
  }
LABEL_107:
}

- (id)createPersonalHelloTLV
{
  int v2 = self->_outgoingPersonalHelloSeqno + 1;
  self->_outgoingPersonalHelloSeqno = v2;
  unsigned int v3 = bswap32(self->_outgoingIHUInterval);
  int v6 = 8390148;
  __int16 v7 = bswap32(v2) >> 16;
  __int16 v8 = HIWORD(v3);
  id v4 = [objc_alloc((Class)NSData) initWithBytes:&v6 length:8];

  return v4;
}

- (id)createIHUTLV
{
  unsigned int v2 = bswap32(self->_rxcost);
  unsigned int v3 = bswap32(self->_outgoingIHUInterval);
  int v6 = 1541;
  __int16 v7 = HIWORD(v2);
  __int16 v8 = HIWORD(v3);
  id v4 = [objc_alloc((Class)NSData) initWithBytes:&v6 length:8];

  return v4;
}

- (void)enqueueNextUpdate
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_pendingOutgoingPackets;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "representsUpdate", (void)v11)) {
          [v3 addObject:v9];
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_pendingOutgoingPackets removeObjectsInArray:v3];
  id v10 = [[NRBabelPendingOutgoingTLVs alloc] initWithInterval:self->_outgoingUpdateInterval];
  [(NRBabelPendingOutgoingTLVs *)v10 setRepresentsUpdate:1];
  [(NSMutableArray *)self->_pendingOutgoingPackets addObject:v10];
}

- (void)enqueueNextIHU
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_pendingOutgoingPackets;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "representsIHU", (void)v11)) {
          [v3 addObject:v9];
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_pendingOutgoingPackets removeObjectsInArray:v3];
  id v10 = [[NRBabelPendingOutgoingTLVs alloc] initWithInterval:self->_outgoingIHUInterval];
  [(NRBabelPendingOutgoingTLVs *)v10 setRepresentsIHU:1];
  [(NSMutableArray *)self->_pendingOutgoingPackets addObject:v10];
}

@end