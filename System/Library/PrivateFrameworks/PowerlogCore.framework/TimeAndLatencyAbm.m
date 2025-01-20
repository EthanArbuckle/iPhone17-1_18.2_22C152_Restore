@interface TimeAndLatencyAbm
- (NSDate)time;
- (TimeAndLatencyAbm)initWithTime:(id)a3 andLatency:(double)a4;
- (double)latency;
- (void)setLatency:(double)a3;
- (void)setTime:(id)a3;
@end

@implementation TimeAndLatencyAbm

- (TimeAndLatencyAbm)initWithTime:(id)a3 andLatency:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TimeAndLatencyAbm;
  v8 = [(TimeAndLatencyAbm *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_time, a3);
    v9->_latency = a4;
  }

  return v9;
}

- (NSDate)time
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTime:(id)a3
{
}

- (double)latency
{
  return self->_latency;
}

- (void)setLatency:(double)a3
{
  self->_latency = a3;
}

- (void).cxx_destruct
{
}

@end