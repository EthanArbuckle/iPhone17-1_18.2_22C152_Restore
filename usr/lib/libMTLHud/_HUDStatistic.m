@interface _HUDStatistic
- (NSString)graph;
- (_HUDStatistic)initWithName:(id)a3 color:(unsigned int)a4 tolerance:(double)a5 graph:(id)a6;
- (double)incrementStatistic:(double)a3 forFrame:(unint64_t)a4;
- (double)tolerance;
- (id).cxx_construct;
- (unsigned)rgba;
- (void)setStatistic:(double)a3 forFrame:(unint64_t)a4;
@end

@implementation _HUDStatistic

- (_HUDStatistic)initWithName:(id)a3 color:(unsigned int)a4 tolerance:(double)a5 graph:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)_HUDStatistic;
  v12 = [(_HUDRow *)&v15 initWithName:a3];
  v13 = v12;
  if (v12)
  {
    v12->_rgba = a4;
    v12->_tolerance = a5;
    objc_storeStrong((id *)&v12->_graph, a6);
  }

  return v13;
}

- (void)setStatistic:(double)a3 forFrame:(unint64_t)a4
{
  p_historyRecord = &self->_historyRecord;
  float v5 = a3;
  if (v5 > 999.99 || v5 < 0.0) {
    float v5 = 0.0;
  }
  p_historyRecord->m_currentOffset = a4 % 0x78;
  p_historyRecord->m_lastOffset = a4 % 0x78;
  v7 = &p_historyRecord->m_currentTime + a4 % 0x78;
  float v8 = p_historyRecord->m_accumulatedValue + (float)(v5 - v7[5]);
  v7[5] = v5;
  p_historyRecord->m_accumulatedValue = v8;
  p_historyRecord->m_averageValue = v8 / 120.0;
  CHistoryRecord::UpdateMinMax(p_historyRecord);
}

- (double)incrementStatistic:(double)a3 forFrame:(unint64_t)a4
{
  return 0.0;
}

- (unsigned)rgba
{
  return self->_rgba;
}

- (double)tolerance
{
  return self->_tolerance;
}

- (NSString)graph
{
  return self->_graph;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 22) = 0u;
  *((_OWORD *)self + 23) = 0u;
  *((_OWORD *)self + 24) = 0u;
  *((_OWORD *)self + 25) = 0u;
  *((_OWORD *)self + 26) = 0u;
  *((_OWORD *)self + 27) = 0u;
  *((_OWORD *)self + 28) = 0u;
  *((_OWORD *)self + 29) = 0u;
  *((_OWORD *)self + 30) = 0u;
  *((_OWORD *)self + 31) = 0u;
  *(_OWORD *)((char *)self + 508) = 0u;
  return self;
}

@end