@interface NRRemoteObjectTrafficClasses
- (BOOL)shouldDropUnmatchingTraffic;
- (NSSet)trafficClasses;
- (void)setShouldDropUnmatchingTraffic:(BOOL)a3;
- (void)setTrafficClasses:(id)a3;
@end

@implementation NRRemoteObjectTrafficClasses

- (NSSet)trafficClasses
{
  return self->_trafficClasses;
}

- (void)setTrafficClasses:(id)a3
{
}

- (BOOL)shouldDropUnmatchingTraffic
{
  return self->_shouldDropUnmatchingTraffic;
}

- (void)setShouldDropUnmatchingTraffic:(BOOL)a3
{
  self->_shouldDropUnmatchingTraffic = a3;
}

- (void).cxx_destruct
{
}

@end