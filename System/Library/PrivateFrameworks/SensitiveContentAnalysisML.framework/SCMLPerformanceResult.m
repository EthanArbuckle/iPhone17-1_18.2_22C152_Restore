@interface SCMLPerformanceResult
- (NSString)name;
- (SCMLPerformanceResult)initWithName:(id)a3;
- (id)description;
- (id)dict;
@end

@implementation SCMLPerformanceResult

- (SCMLPerformanceResult)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCMLPerformanceResult;
  v6 = [(SCMLPerformanceResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SCMLPerformanceResult *)self name];
  id v5 = [v3 stringWithFormat:@"[%@: Peak-Delta: %lf, CPU-Time: %lf, Interval: %lf]", v4, *(void *)&self->peakdelta, *(void *)&self->cpuTime, *(void *)&self->timeInterval];

  return v5;
}

- (id)dict
{
  v11[5] = *MEMORY[0x263EF8340];
  v10[0] = @"maxpeak";
  v3 = [NSNumber numberWithDouble:self->maxpeak];
  v11[0] = v3;
  v10[1] = @"peakdelta";
  v4 = [NSNumber numberWithDouble:self->peakdelta];
  v11[1] = v4;
  v10[2] = @"recentpeak";
  id v5 = [NSNumber numberWithDouble:self->recentpeak];
  v11[2] = v5;
  v10[3] = @"current";
  v6 = [NSNumber numberWithDouble:self->current];
  v11[3] = v6;
  v10[4] = @"timeInterval";
  v7 = [NSNumber numberWithDouble:self->timeInterval];
  v11[4] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end