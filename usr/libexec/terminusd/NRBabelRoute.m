@interface NRBabelRoute
- (BOOL)isEqual:(id)a3;
- (BOOL)isNextHopEqualTo:(const in6_addr *)a3;
- (BOOL)matchesPrefix:(id)a3 neighbor:(id)a4;
- (BOOL)selected;
- (NRBabelInstance)instance;
- (NRBabelNeighbor)neighbor;
- (NRBabelPrefix)bPrefix;
- (NRBabelRoute)initWithPrefix:(id)a3 neighbor:(id)a4 routerID:(unint64_t)a5 seqno:(unsigned __int16)a6 interval:(unsigned __int16)a7 receivedMetric:(unsigned __int16)a8 nextHop:(const in6_addr *)a9 instance:(id)a10;
- (OS_dispatch_source)expiryTimer;
- (id)description;
- (in6_addr)nextHopInner;
- (unint64_t)routerID;
- (unsigned)interval;
- (unsigned)metric;
- (unsigned)numExpiryTimerFires;
- (unsigned)receivedMetric;
- (unsigned)seqno;
- (void)applyUsingSystem;
- (void)resetExpiryTimer;
- (void)setBPrefix:(id)a3;
- (void)setExpiryTimer:(id)a3;
- (void)setInstance:(id)a3;
- (void)setInterval:(unsigned __int16)a3;
- (void)setNeighbor:(id)a3;
- (void)setNextHop:(const in6_addr *)a3;
- (void)setNextHopInner:(in6_addr)a3;
- (void)setNumExpiryTimerFires:(unsigned __int16)a3;
- (void)setReceivedMetric:(unsigned __int16)a3;
- (void)setRouterID:(unint64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSeqno:(unsigned __int16)a3;
@end

@implementation NRBabelRoute

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_instance);
  objc_storeStrong((id *)&self->_expiryTimer, 0);
  objc_storeStrong((id *)&self->_neighbor, 0);

  objc_storeStrong((id *)&self->_bPrefix, 0);
}

- (void)setInstance:(id)a3
{
}

- (NRBabelInstance)instance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_instance);

  return (NRBabelInstance *)WeakRetained;
}

- (void)setInterval:(unsigned __int16)a3
{
  self->_interval = a3;
}

- (unsigned)interval
{
  return self->_interval;
}

- (void)setNumExpiryTimerFires:(unsigned __int16)a3
{
  self->_numExpiryTimerFires = a3;
}

- (unsigned)numExpiryTimerFires
{
  return self->_numExpiryTimerFires;
}

- (void)setExpiryTimer:(id)a3
{
}

- (OS_dispatch_source)expiryTimer
{
  return self->_expiryTimer;
}

- (void)setNextHopInner:(in6_addr)a3
{
  self->_nextHopInner = a3;
}

- (in6_addr)nextHopInner
{
  uint64_t v2 = *(void *)&self->_nextHopInner.__u6_addr32[2];
  uint64_t v3 = *(void *)self->_nextHopInner.__u6_addr8;
  *(void *)&result.__u6_addr32[2] = v2;
  *(void *)result.__u6_addr8 = v3;
  return result;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setReceivedMetric:(unsigned __int16)a3
{
  self->_receivedMetric = a3;
}

- (unsigned)receivedMetric
{
  return self->_receivedMetric;
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

- (void)setNeighbor:(id)a3
{
}

- (NRBabelNeighbor)neighbor
{
  return self->_neighbor;
}

- (void)setBPrefix:(id)a3
{
}

- (NRBabelPrefix)bPrefix
{
  return self->_bPrefix;
}

- (void)applyUsingSystem
{
  uint64_t v2 = self;
  uint64_t v3 = [(NRBabelNeighbor *)self->_neighbor babelInterface];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(NRBabelPrefix *)v2->_bPrefix descriptionWithoutPlen];
    if (!v5)
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
      goto LABEL_21;
    }
    BOOL selected = v2->_selected;
    id v7 = objc_alloc((Class)NSString);
    v8 = v7;
    if (selected)
    {
      unsigned int v9 = [(NRBabelPrefix *)v2->_bPrefix plen];
      IPv6AddrString = (void *)createIPv6AddrString();
      v11 = [(NRBabelNeighbor *)v2->_neighbor babelInterface];
      v12 = [v11 ifName];
      id v13 = [v8 initWithFormat:@"route -nv delete -inet6 %@ ; route -nv add -inet6 -proto2 -prefixlen %u %@ %@%%%@",
              v5,
              v9,
              v5,
              IPv6AddrString,
              v12);
    }
    else
    {
      id v13 = [v7 initWithFormat:@"route -nv delete -inet6 %@", v5];
    }
    v18 = _NRCopySerialQueueAttr();
    uint64_t v2 = (NRBabelRoute *)"terminusd.babel.commands";
    dispatch_queue_t v19 = dispatch_queue_create("terminusd.babel.commands", v18);

    if (v19)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C123C;
      block[3] = &unk_1001C8840;
      dispatch_queue_t v29 = v19;
      id v30 = v13;
      id v20 = v13;
      v21 = v19;
      dispatch_async(v21, block);

LABEL_21:
      return;
    }
    id v22 = sub_1000B9E04();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v24 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    uint64_t v25 = _os_log_pack_size();
    v14 = (id *)((char *)&block[-1] - ((__chkstk_darwin(v25) + 15) & 0xFFFFFFFFFFFFFFF0));
    __error();
    uint64_t v26 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v26 = 136446466;
    *(void *)(v26 + 4) = "nr_dispatch_queue_create";
    *(_WORD *)(v26 + 12) = 2080;
    *(void *)(v26 + 14) = "terminusd.babel.commands";
    sub_1000B9E04();
    _NRLogAbortWithPack();
    goto LABEL_26;
  }
  if (qword_1001F4A58 != -1) {
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
  v14 = (id *)&unk_1001F4000;
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A58 == -1)
    {
LABEL_9:
      neighbor = v2->_neighbor;
      id v16 = v14[330];
      uint64_t v27 = [(NRBabelNeighbor *)neighbor babelInterface];
      _NRLogWithArgs();

      v17 = (void *)v27;

      return;
    }
LABEL_26:
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    goto LABEL_9;
  }
}

- (void)resetExpiryTimer
{
  expiryTimer = self->_expiryTimer;
  dispatch_time_t v3 = dispatch_time(0x8000000000000000, 35000000 * self->_interval);

  dispatch_source_set_timer(expiryTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

- (unsigned)metric
{
  if (self->_numExpiryTimerFires)
  {
    LOWORD(v2) = -1;
  }
  else
  {
    int receivedMetric = self->_receivedMetric;
    unsigned int v2 = [(NRBabelNeighbor *)self->_neighbor metric] + receivedMetric;
    if (v2 > 0xFFFE) {
      LOWORD(v2) = -1;
    }
  }
  return v2;
}

- (BOOL)isNextHopEqualTo:(const in6_addr *)a3
{
  return *(void *)self->_nextHopInner.__u6_addr8 == *(void *)a3->__u6_addr8
      && *(void *)&self->_nextHopInner.__u6_addr32[2] == *(void *)&a3->__u6_addr32[2];
}

- (void)setNextHop:(const in6_addr *)a3
{
  self->_nextHopInner = *a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 bPrefix];
    id v7 = [v5 neighbor];

    BOOL v8 = [(NRBabelRoute *)self matchesPrefix:v6 neighbor:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
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
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"<%llx>", v6, v19, v20, v21];
  }
  v10 = v7;
  unsigned int v11 = [(NRBabelRoute *)self seqno];
  uint64_t receivedMetric = self->_receivedMetric;
  unsigned int v13 = [(NRBabelRoute *)self metric];
  uint64_t v14 = [(NRBabelNeighbor *)self->_neighbor descriptionWithNextHop:&self->_nextHopInner];
  v15 = (void *)v14;
  if (self->_selected) {
    id v16 = "";
  }
  else {
    id v16 = "not ";
  }
  id v17 = [v3 initWithFormat:@"%@ %@ seqno %u recvMetric %u metric %u via %@ %sselected", bPrefix, v10, v11, receivedMetric, v13, v14, v16];

  return v17;
}

- (BOOL)matchesPrefix:(id)a3 neighbor:(id)a4
{
  id v6 = a3;
  if ([(NRBabelNeighbor *)self->_neighbor isEqual:a4]) {
    BOOL v7 = [(NRBabelPrefix *)self->_bPrefix isEqual:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (NRBabelRoute)initWithPrefix:(id)a3 neighbor:(id)a4 routerID:(unint64_t)a5 seqno:(unsigned __int16)a6 interval:(unsigned __int16)a7 receivedMetric:(unsigned __int16)a8 nextHop:(const in6_addr *)a9 instance:(id)a10
{
  uint64_t v12 = a6;
  id v17 = a3;
  id v18 = a4;
  id v19 = a10;
  v35.receiver = self;
  v35.super_class = (Class)NRBabelRoute;
  uint64_t v20 = [(NRBabelRoute *)&v35 init];
  uint64_t v21 = v20;
  if (!v20)
  {
    id v28 = sub_1000B9E04();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v30 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136446210;
    *(void *)(v31 + 4) = "-[NRBabelRoute initWithPrefix:neighbor:routerID:seqno:interval:receivedMetric:nextHop:instance:]";
    sub_1000B9E04();
    _NRLogAbortWithPack();
    __break(1u);
  }
  objc_storeStrong((id *)&v20->_bPrefix, a3);
  objc_storeStrong((id *)&v21->_neighbor, a4);
  v21->_unint64_t routerID = a5;
  [(NRBabelRoute *)v21 setSeqno:v12];
  v21->_interval = a7;
  v21->_uint64_t receivedMetric = a8;
  v21->_nextHopInner = *a9;
  [(NRBabelRoute *)v21 setInstance:v19];
  id v22 = [v19 routes];
  [v22 addObject:v21];

  objc_initWeak(&location, v21);
  v23 = [v19 queue];
  dispatch_source_t v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v23);
  expiryTimer = v21->_expiryTimer;
  v21->_expiryTimer = (OS_dispatch_source *)v24;

  uint64_t v26 = v21->_expiryTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000C19C0;
  handler[3] = &unk_1001C7FF0;
  objc_copyWeak(&v33, &location);
  dispatch_source_set_event_handler(v26, handler);
  dispatch_activate((dispatch_object_t)v21->_expiryTimer);
  [(NRBabelRoute *)v21 resetExpiryTimer];
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return v21;
}

@end