@interface NWStatsInterfaceSource
- (id)description;
- (unint64_t)srcRef;
- (unint64_t)threshold;
- (unsigned)ifIndex;
- (void)setIfIndex:(unsigned int)a3;
- (void)setSrcRef:(unint64_t)a3;
- (void)setThreshold:(unint64_t)a3;
@end

@implementation NWStatsInterfaceSource

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"NWStatsInterfaceSource with srcref %lld interface %u threshold %lld", self->_srcRef, self->_ifIndex, self->_threshold);
  return v2;
}

- (unint64_t)srcRef
{
  return self->_srcRef;
}

- (void)setSrcRef:(unint64_t)a3
{
  self->_srcRef = a3;
}

- (unint64_t)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(unint64_t)a3
{
  self->_threshold = a3;
}

- (unsigned)ifIndex
{
  return self->_ifIndex;
}

- (void)setIfIndex:(unsigned int)a3
{
  self->_ifIndex = a3;
}

@end