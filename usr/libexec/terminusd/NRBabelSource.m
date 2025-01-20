@interface NRBabelSource
- (BOOL)isDeepEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNewDistanceUnfeasibleWithSeqno:(unsigned __int16)a3 metric:(unsigned __int16)a4;
- (BOOL)matchesPrefix:(id)a3 routerID:(unint64_t)a4;
- (NRBabelInstance)instance;
- (NRBabelPrefix)bPrefix;
- (NRBabelSource)initWithPrefix:(id)a3 routerID:(unint64_t)a4 seqno:(unsigned __int16)a5 metric:(unsigned __int16)a6 instance:(id)a7;
- (OS_dispatch_source)gcTimer;
- (id)description;
- (id)descriptionWithoutMetric;
- (unint64_t)routerID;
- (unsigned)metric;
- (unsigned)seqno;
- (void)dealloc;
- (void)resetGCTimer;
- (void)setBPrefix:(id)a3;
- (void)setGcTimer:(id)a3;
- (void)setInstance:(id)a3;
- (void)setMetric:(unsigned __int16)a3;
- (void)setRouterID:(unint64_t)a3;
- (void)setSeqno:(unsigned __int16)a3;
- (void)setupGCTimer;
- (void)updateFeasabilityDistanceWithSeqno:(unsigned __int16)a3 metric:(unsigned __int16)a4;
@end

@implementation NRBabelSource

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_instance);
  objc_storeStrong((id *)&self->_gcTimer, 0);

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

- (void)setGcTimer:(id)a3
{
}

- (OS_dispatch_source)gcTimer
{
  return self->_gcTimer;
}

- (void)setMetric:(unsigned __int16)a3
{
  self->_metric = a3;
}

- (unsigned)metric
{
  return self->_metric;
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

- (void)resetGCTimer
{
  gcTimer = self->_gcTimer;
  dispatch_time_t v3 = dispatch_time(0x8000000000000000, 180000000000);

  dispatch_source_set_timer(gcTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

- (void)setupGCTimer
{
  objc_initWeak(&location, self);
  dispatch_time_t v3 = [(NRBabelSource *)self instance];
  v4 = [v3 queue];
  v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
  gcTimer = self->_gcTimer;
  self->_gcTimer = v5;

  v7 = self->_gcTimer;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_1000C0378;
  v11 = &unk_1001C7FF0;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler(v7, &v8);
  dispatch_activate((dispatch_object_t)self->_gcTimer);
  [(NRBabelSource *)self resetGCTimer];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)updateFeasabilityDistanceWithSeqno:(unsigned __int16)a3 metric:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  uint64_t v5 = a3;
  if ([(NRBabelSource *)self seqno] < a3)
  {
    [(NRBabelSource *)self setSeqno:v5];
    p_unsigned int metric = &self->_metric;
LABEL_5:
    unsigned __int16 *p_metric = v4;
    return;
  }
  if ([(NRBabelSource *)self seqno] == v5)
  {
    unsigned int metric = self->_metric;
    p_unsigned int metric = &self->_metric;
    if (metric > v4) {
      goto LABEL_5;
    }
  }
}

- (BOOL)isNewDistanceUnfeasibleWithSeqno:(unsigned __int16)a3 metric:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  unsigned int v7 = [(NRBabelSource *)self seqno];
  if (v7 == v5) {
    goto LABEL_2;
  }
  if (v7 >= v5)
  {
    if ((__int16)(v7 - v5) >= 0) {
      LOBYTE(v11) = -1;
    }
    else {
      LOBYTE(v11) = 1;
    }
    if ((unsigned __int16)(v7 - v5) != 0x8000) {
      return (v11 & 0x80u) != 0;
    }
  }
  else if ((unsigned __int16)(v5 - v7) != 0x8000)
  {
    int v11 = ((__int16)(v5 - v7) >> 15) | 1;
    return (v11 & 0x80u) != 0;
  }
LABEL_2:
  unsigned int metric = self->_metric;
  __int16 v9 = metric - v4;
  if (metric == v4)
  {
    LOBYTE(v10) = 0;
  }
  else if (metric >= v4)
  {
    int v15 = (unsigned __int16)(metric - v4);
    if (v9 >= 0) {
      char v16 = -1;
    }
    else {
      char v16 = 1;
    }
    if (v15 == 0x8000) {
      LOBYTE(v10) = 0;
    }
    else {
      LOBYTE(v10) = v16;
    }
  }
  else
  {
    unsigned __int16 v12 = v4 - metric;
    int v13 = v12;
    int v10 = ((__int16)v12 >> 15) | 1;
    if (v13 == 0x8000) {
      LOBYTE(v10) = 0;
    }
  }
  return (v10 & 0x80u) == 0;
}

- (BOOL)isDeepEqual:(id)a3
{
  id v4 = a3;
  if ([(NRBabelSource *)self isEqual:v4]
    && (unsigned int v5 = -[NRBabelSource seqno](self, "seqno"), v5 == [v4 seqno]))
  {
    int metric = self->_metric;
    BOOL v7 = metric == [v4 metric];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id routerID = self->_routerID;
    if (routerID == [v5 routerID])
    {
      bPrefix = self->_bPrefix;
      v8 = [v5 bPrefix];
      unsigned __int8 v9 = [(NRBabelPrefix *)bPrefix isEqual:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)descriptionWithoutMetric
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
  int v10 = v7;
  id v11 = [v3 initWithFormat:@"%@ %@ seqno %u", bPrefix, v7, -[NRBabelSource seqno](self, "seqno")];

  return v11;
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
  int v10 = v7;
  id v11 = [v3 initWithFormat:@"%@ %@ seqno %u metric %u", bPrefix, v7, -[NRBabelSource seqno](self, "seqno"), self->_metric];

  return v11;
}

- (BOOL)matchesPrefix:(id)a3 routerID:(unint64_t)a4
{
  if (self->_routerID == a4) {
    return [a3 isEqual:self->_bPrefix];
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  gcTimer = self->_gcTimer;
  if (gcTimer) {
    dispatch_source_cancel(gcTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)NRBabelSource;
  [(NRBabelSource *)&v4 dealloc];
}

- (NRBabelSource)initWithPrefix:(id)a3 routerID:(unint64_t)a4 seqno:(unsigned __int16)a5 metric:(unsigned __int16)a6 instance:(id)a7
{
  uint64_t v9 = a5;
  unsigned __int16 v12 = (NRBabelPrefix *)a3;
  id v13 = a7;
  v23.receiver = self;
  v23.super_class = (Class)NRBabelSource;
  uint64_t v14 = [(NRBabelSource *)&v23 init];
  if (!v14)
  {
    id v19 = sub_1000B9E04();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v21 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136446210;
    *(void *)(v22 + 4) = "-[NRBabelSource initWithPrefix:routerID:seqno:metric:instance:]";
    sub_1000B9E04();
    _NRLogAbortWithPack();
  }
  uint64_t v15 = v14;
  bPrefix = v14->_bPrefix;
  v14->_bPrefix = v12;

  v15->_unint64_t routerID = a4;
  [(NRBabelSource *)v15 setSeqno:v9];
  v15->_int metric = a6;
  [(NRBabelSource *)v15 setInstance:v13];
  v17 = [v13 sources];
  [v17 addObject:v15];

  [(NRBabelSource *)v15 setupGCTimer];
  return v15;
}

@end