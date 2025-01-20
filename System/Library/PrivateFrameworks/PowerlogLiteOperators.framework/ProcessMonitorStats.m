@interface ProcessMonitorStats
- (BOOL)shared_cache_reslid;
- (unint64_t)cpu_time;
- (unint64_t)cpu_time_diff;
- (void)setCpu_time:(unint64_t)a3;
- (void)setCpu_time_diff:(unint64_t)a3;
- (void)setShared_cache_reslid:(BOOL)a3;
@end

@implementation ProcessMonitorStats

- (unint64_t)cpu_time
{
  return self->_cpu_time;
}

- (void)setCpu_time:(unint64_t)a3
{
  self->_cpu_time = a3;
}

- (unint64_t)cpu_time_diff
{
  return self->_cpu_time_diff;
}

- (void)setCpu_time_diff:(unint64_t)a3
{
  self->_cpu_time_diff = a3;
}

- (BOOL)shared_cache_reslid
{
  return self->_shared_cache_reslid;
}

- (void)setShared_cache_reslid:(BOOL)a3
{
  self->_shared_cache_reslid = a3;
}

@end