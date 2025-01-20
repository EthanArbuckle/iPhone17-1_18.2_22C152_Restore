@interface _CARDNDRegion
- (CLCircularRegion)region;
- (int64_t)regionState;
- (void)setRegion:(id)a3;
- (void)setRegionState:(int64_t)a3;
@end

@implementation _CARDNDRegion

- (CLCircularRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (int64_t)regionState
{
  return self->_regionState;
}

- (void)setRegionState:(int64_t)a3
{
  self->_regionState = a3;
}

- (void).cxx_destruct
{
}

@end