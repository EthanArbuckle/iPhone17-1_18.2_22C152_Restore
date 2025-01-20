@interface SmartRoutingStatsWx
- (unint64_t)thV2Ticks;
- (unsigned)thV2WxCount;
- (void)setThV2Ticks:(unint64_t)a3;
- (void)setThV2WxCount:(unsigned __int8)a3;
@end

@implementation SmartRoutingStatsWx

- (unint64_t)thV2Ticks
{
  return self->_thV2Ticks;
}

- (void)setThV2Ticks:(unint64_t)a3
{
  self->_thV2Ticks = a3;
}

- (unsigned)thV2WxCount
{
  return self->_thV2WxCount;
}

- (void)setThV2WxCount:(unsigned __int8)a3
{
  self->_thV2WxCount = a3;
}

@end