@interface NRBabelPendingOutgoingTLVs
- (BOOL)representsIHU;
- (BOOL)representsUpdate;
- (NRBabelPendingOutgoingTLVs)initWithInterval:(unsigned __int16)a3;
- (NSMutableArray)tlvs;
- (double)maxTime;
- (double)minTime;
- (void)setMaxTime:(double)a3;
- (void)setMinTime:(double)a3;
- (void)setRepresentsIHU:(BOOL)a3;
- (void)setRepresentsUpdate:(BOOL)a3;
- (void)setTlvs:(id)a3;
@end

@implementation NRBabelPendingOutgoingTLVs

- (void).cxx_destruct
{
}

- (void)setRepresentsUpdate:(BOOL)a3
{
  self->_representsUpdate = a3;
}

- (BOOL)representsUpdate
{
  return self->_representsUpdate;
}

- (void)setRepresentsIHU:(BOOL)a3
{
  self->_representsIHU = a3;
}

- (BOOL)representsIHU
{
  return self->_representsIHU;
}

- (void)setMaxTime:(double)a3
{
  self->_maxTime = a3;
}

- (double)maxTime
{
  return self->_maxTime;
}

- (void)setMinTime:(double)a3
{
  self->_minTime = a3;
}

- (double)minTime
{
  return self->_minTime;
}

- (void)setTlvs:(id)a3
{
}

- (NSMutableArray)tlvs
{
  return self->_tlvs;
}

- (NRBabelPendingOutgoingTLVs)initWithInterval:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NRBabelPendingOutgoingTLVs;
  v4 = [(NRBabelPendingOutgoingTLVs *)&v15 init];
  if (!v4)
  {
    id v10 = sub_1000B9E04();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v12 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    uint64_t v13 = _os_log_pack_size();
    __chkstk_darwin(v13);
    __error();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136446210;
    *(void *)(v14 + 4) = "-[NRBabelPendingOutgoingTLVs initWithInterval:]";
    sub_1000B9E04();
    _NRLogAbortWithPack();
  }
  v5 = v4;
  +[NSDate timeIntervalSinceReferenceDate];
  v5->_minTime = v6 + (double)(unsigned __int16)((429496730 * (unint64_t)(9 * v3)) >> 32) * 0.01;
  v5->_maxTime = v6 + (double)v3 * 0.01;
  v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  tlvs = v5->_tlvs;
  v5->_tlvs = v7;

  return v5;
}

@end