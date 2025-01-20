@interface NRPendingOutgoingSeqnoReq
- (BOOL)cancelIfMatchesPrefix:(id)a3 routerID:(unint64_t)a4 seqno:(unsigned __int16)a5;
- (BOOL)cancelIfRouteUnselected;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesPrefix:(id)a3 routerID:(unint64_t)a4;
- (BOOL)removedFromInstance;
- (NRBabelInstance)instance;
- (NRBabelNeighbor)originator;
- (NRBabelNeighbor)target;
- (NRBabelPrefix)bPrefix;
- (NRBabelRoute)route;
- (NRPendingOutgoingSeqnoReq)initWithInstance:(id)a3 prefix:(id)a4 routerID:(unint64_t)a5;
- (OS_dispatch_source)retryTimer;
- (id)createTLV;
- (id)description;
- (signed)retriesLeft;
- (unint64_t)routerID;
- (unsigned)hopCount;
- (unsigned)seqno;
- (void)cancelTimer;
- (void)cancelWithDelay:(BOOL)a3;
- (void)dealloc;
- (void)sendSeqnoReq;
- (void)setBPrefix:(id)a3;
- (void)setHopCount:(unsigned __int8)a3;
- (void)setInstance:(id)a3;
- (void)setOriginator:(id)a3;
- (void)setRemovedFromInstance:(BOOL)a3;
- (void)setRetriesLeft:(signed __int16)a3;
- (void)setRetryTimer:(id)a3;
- (void)setRoute:(id)a3;
- (void)setRouterID:(unint64_t)a3;
- (void)setSeqno:(unsigned __int16)a3;
- (void)setTarget:(id)a3;
- (void)start;
@end

@implementation NRPendingOutgoingSeqnoReq

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_instance);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_destroyWeak((id *)&self->_route);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_target, 0);

  objc_storeStrong((id *)&self->_bPrefix, 0);
}

- (void)setRemovedFromInstance:(BOOL)a3
{
  self->_removedFromInstance = a3;
}

- (BOOL)removedFromInstance
{
  return self->_removedFromInstance;
}

- (void)setInstance:(id)a3
{
}

- (NRBabelInstance)instance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_instance);

  return (NRBabelInstance *)WeakRetained;
}

- (void)setHopCount:(unsigned __int8)a3
{
  self->_hopCount = a3;
}

- (unsigned)hopCount
{
  return self->_hopCount;
}

- (void)setRetryTimer:(id)a3
{
}

- (OS_dispatch_source)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetriesLeft:(signed __int16)a3
{
  self->_retriesLeft = a3;
}

- (signed)retriesLeft
{
  return self->_retriesLeft;
}

- (void)setRoute:(id)a3
{
}

- (NRBabelRoute)route
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_route);

  return (NRBabelRoute *)WeakRetained;
}

- (void)setOriginator:(id)a3
{
}

- (NRBabelNeighbor)originator
{
  return self->_originator;
}

- (void)setTarget:(id)a3
{
}

- (NRBabelNeighbor)target
{
  return self->_target;
}

- (void)setSeqno:(unsigned __int16)a3
{
  self->_seqno = a3;
}

- (unsigned)seqno
{
  return self->_seqno;
}

- (void)setRouterID:(unint64_t)a3
{
  self->_routerID = a3;
}

- (unint64_t)routerID
{
  return self->_routerID;
}

- (void)setBPrefix:(id)a3
{
}

- (NRBabelPrefix)bPrefix
{
  return self->_bPrefix;
}

- (BOOL)cancelIfMatchesPrefix:(id)a3 routerID:(unint64_t)a4 seqno:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  BOOL v7 = [(NRPendingOutgoingSeqnoReq *)self matchesPrefix:a3 routerID:a4];
  if (!v7) {
    return v7;
  }
  unsigned int v8 = [(NRPendingOutgoingSeqnoReq *)self seqno];
  if (v8 == v5) {
    goto LABEL_11;
  }
  if (v8 >= v5)
  {
    if ((__int16)(v8 - v5) >= 0) {
      LOBYTE(v9) = -1;
    }
    else {
      LOBYTE(v9) = 1;
    }
    if ((unsigned __int16)(v8 - v5) == 0x8000) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ((unsigned __int16)(v5 - v8) == 0x8000)
  {
LABEL_11:
    [(NRPendingOutgoingSeqnoReq *)self cancelWithDelay:0];
    LOBYTE(v7) = 1;
    return v7;
  }
  int v9 = ((__int16)(v5 - v8) >> 15) | 1;
LABEL_10:
  if ((v9 & 0x80) == 0) {
    goto LABEL_11;
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)cancelIfRouteUnselected
{
  v3 = [(NRPendingOutgoingSeqnoReq *)self route];
  v4 = v3;
  if (!v3)
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (!_NRLogIsLevelEnabled()) {
      goto LABEL_17;
    }
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    uint64_t v9 = 2524;
    v10 = self;
    BOOL v7 = "";
    unsigned int v8 = "-[NRPendingOutgoingSeqnoReq cancelIfRouteUnselected]";
    goto LABEL_16;
  }
  if (([v3 selected] & 1) == 0)
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    if (!_NRLogIsLevelEnabled()) {
      goto LABEL_17;
    }
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    v10 = self;
    v11 = v4;
    uint64_t v9 = 2529;
    BOOL v7 = "";
    unsigned int v8 = "-[NRPendingOutgoingSeqnoReq cancelIfRouteUnselected]";
LABEL_16:
    _NRLogWithArgs();
LABEL_17:
    -[NRPendingOutgoingSeqnoReq cancelWithDelay:](self, "cancelWithDelay:", 0, v7, v8, v9, v10, v11);
    BOOL v5 = 1;
    goto LABEL_18;
  }
  BOOL v5 = 0;
LABEL_18:

  return v5;
}

- (void)dealloc
{
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    uint64_t v5 = 2516;
    v6 = self;
    v3 = "";
    v4 = "-[NRPendingOutgoingSeqnoReq dealloc]";
    _NRLogWithArgs();
  }
  [(NRPendingOutgoingSeqnoReq *)self cancelTimer];
  v7.receiver = self;
  v7.super_class = (Class)NRPendingOutgoingSeqnoReq;
  [(NRPendingOutgoingSeqnoReq *)&v7 dealloc];
}

- (void)cancelWithDelay:(BOOL)a3
{
  if (a3)
  {
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
    self->_retriesLeft = 0x8000;
    retryTimer = self->_retryTimer;
    dispatch_time_t v5 = dispatch_time(0x8000000000000000, 20000000000);
    dispatch_source_set_timer(retryTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
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
      uint64_t v9 = 2508;
      v10 = self;
      objc_super v7 = "";
      unsigned int v8 = "-[NRPendingOutgoingSeqnoReq cancelWithDelay:]";
      _NRLogWithArgs();
    }
    [(NRPendingOutgoingSeqnoReq *)self cancelTimer];
    id v11 = [(NRPendingOutgoingSeqnoReq *)self instance];
    v6 = [v11 posrs];
    [v6 removeObject:self];
  }
}

- (void)cancelTimer
{
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    dispatch_source_cancel(retryTimer);
    v4 = self->_retryTimer;
    self->_retryTimer = 0;
  }
}

- (void)start
{
  if (self->_retryTimer)
  {
    self->_retriesLeft = 10;
    [(NRPendingOutgoingSeqnoReq *)self sendSeqnoReq];
    retryTimer = self->_retryTimer;
    dispatch_source_set_timer(retryTimer, 0x8000000000000000, 0x3B9ACA00uLL, 0x989680uLL);
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
      _NRLogWithArgs();
    }
  }
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  bPrefix = self->_bPrefix;
  unint64_t routerID = self->_routerID;
  unint64_t v6 = bswap64(routerID);
  if (v6 > 0xFFFE)
  {
    id v8 = objc_alloc((Class)NSString);
    unsigned int v9 = bswap32(routerID);
    id v7 = [v8 initWithFormat:@"<%x:%x:%x:%x>", HIWORD(v9), (unsigned __int16)v9, bswap32(HIDWORD(routerID)) >> 16, __rev16(HIWORD(routerID))];
  }
  else
  {
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"<%llx>", v6, v13, v14, v15];
  }
  v10 = v7;
  id v11 = [v3 initWithFormat:@"%@ %@ seqno %u orig %@ retries %d target %@", bPrefix, v7, -[NRPendingOutgoingSeqnoReq seqno](self, "seqno"), self->_originator, self->_retriesLeft, self->_target];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [v5 bPrefix];
    id v7 = [v5 routerID];

    BOOL v8 = [(NRPendingOutgoingSeqnoReq *)self matchesPrefix:v6 routerID:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)matchesPrefix:(id)a3 routerID:(unint64_t)a4
{
  if (self->_routerID == a4) {
    return [(NRBabelPrefix *)self->_bPrefix isEqual:a3];
  }
  else {
    return 0;
  }
}

- (NRPendingOutgoingSeqnoReq)initWithInstance:(id)a3 prefix:(id)a4 routerID:(unint64_t)a5
{
  id v8 = a3;
  unsigned int v9 = (NRBabelPrefix *)a4;
  v28.receiver = self;
  v28.super_class = (Class)NRPendingOutgoingSeqnoReq;
  v10 = [(NRPendingOutgoingSeqnoReq *)&v28 init];
  if (!v10)
  {
    id v20 = sub_1000B9E04();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v22 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136446210;
    *(void *)(v23 + 4) = "-[NRPendingOutgoingSeqnoReq initWithInstance:prefix:routerID:]";
    sub_1000B9E04();
    _NRLogAbortWithPack();
  }
  id v11 = v10;
  [(NRPendingOutgoingSeqnoReq *)v10 setInstance:v8];
  bPrefix = v11->_bPrefix;
  v11->_bPrefix = v9;
  uint64_t v13 = v9;

  v11->_unint64_t routerID = a5;
  uint64_t v14 = [v8 queue];
  dispatch_source_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v14);
  retryTimer = v11->_retryTimer;
  v11->_retryTimer = (OS_dispatch_source *)v15;

  objc_initWeak(&location, v11);
  v17 = v11->_retryTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000C2848;
  handler[3] = &unk_1001C88B8;
  objc_copyWeak(&v26, &location);
  v18 = v11;
  v25 = v18;
  dispatch_source_set_event_handler(v17, handler);
  dispatch_activate((dispatch_object_t)v11->_retryTimer);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v18;
}

- (void)sendSeqnoReq
{
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A58 != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    uint64_t v8 = 2418;
    unsigned int v9 = self;
    unint64_t v6 = "";
    id v7 = "-[NRPendingOutgoingSeqnoReq sendSeqnoReq]";
    _NRLogWithArgs();
  }
  target = self->_target;
  id v4 = [(NRPendingOutgoingSeqnoReq *)self createTLV];
  v10 = v4;
  id v5 = +[NSArray arrayWithObjects:&v10 count:1];
  [(NRBabelNeighbor *)target sendTLVs:v5];
}

- (id)createTLV
{
  WORD2(v6) = __rev16([(NRPendingOutgoingSeqnoReq *)self seqno]);
  HIWORD(v6) = self->_hopCount;
  bPrefix = self->_bPrefix;
  unint64_t routerID = self->_routerID;
  BYTE1(v6) = [(NRBabelPrefix *)bPrefix writeToAE:(char *)&v6 + 2 plen:(char *)&v6 + 3 prefix:&v8]+ 14;
  id v4 = [objc_alloc((Class)NSData) initWithBytes:&v6 length:BYTE1(v6) + 2];

  return v4;
}

@end