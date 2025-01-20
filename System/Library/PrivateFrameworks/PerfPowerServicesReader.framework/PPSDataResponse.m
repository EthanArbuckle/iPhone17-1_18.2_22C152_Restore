@interface PPSDataResponse
- (NSDictionary)profilingStats;
- (void)setProfilingStats:(id)a3;
@end

@implementation PPSDataResponse

- (NSDictionary)profilingStats
{
  return self->_profilingStats;
}

- (void)setProfilingStats:(id)a3
{
  self->_profilingStats = (NSDictionary *)a3;
}

@end