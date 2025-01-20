@interface TUIStatsEventCollector
- (TUIStatsEventCollector)init;
- (unint64_t)countForEvent:(unint64_t)a3;
- (void)recordEvent:(unint64_t)a3;
- (void)reset;
@end

@implementation TUIStatsEventCollector

- (TUIStatsEventCollector)init
{
  v5.receiver = self;
  v5.super_class = (Class)TUIStatsEventCollector;
  v2 = [(TUIStatsEventCollector *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TUIStatsEventCollector *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  self->_eventCount[28] = 0;
  *(_OWORD *)&self->_eventCount[26] = 0u;
  *(_OWORD *)&self->_eventCount[24] = 0u;
  *(_OWORD *)&self->_eventCount[22] = 0u;
  *(_OWORD *)&self->_eventCount[20] = 0u;
  *(_OWORD *)&self->_eventCount[18] = 0u;
  *(_OWORD *)&self->_eventCount[16] = 0u;
  *(_OWORD *)&self->_eventCount[14] = 0u;
  *(_OWORD *)&self->_eventCount[12] = 0u;
  *(_OWORD *)&self->_eventCount[10] = 0u;
  *(_OWORD *)&self->_eventCount[8] = 0u;
  *(_OWORD *)&self->_eventCount[6] = 0u;
  *(_OWORD *)&self->_eventCount[4] = 0u;
  *(_OWORD *)&self->_eventCount[2] = 0u;
  *(_OWORD *)self->_eventCount = 0u;
}

- (void)recordEvent:(unint64_t)a3
{
}

- (unint64_t)countForEvent:(unint64_t)a3
{
  return self->_eventCount[a3];
}

@end