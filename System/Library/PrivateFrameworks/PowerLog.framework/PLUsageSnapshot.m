@interface PLUsageSnapshot
- (NSDate)timestamp;
- (double)cpuUsage;
- (id)description;
- (void)setCpuUsage:(double)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation PLUsageSnapshot

- (id)description
{
  v3 = NSString;
  v4 = [(PLUsageSnapshot *)self timestamp];
  [(PLUsageSnapshot *)self cpuUsage];
  v6 = [v3 stringWithFormat:@"PLUsageSnapshot (%@: %f)", v4, v5];

  return v6;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (double)cpuUsage
{
  return self->_cpuUsage;
}

- (void)setCpuUsage:(double)a3
{
  self->_cpuUsage = a3;
}

- (void).cxx_destruct
{
}

@end