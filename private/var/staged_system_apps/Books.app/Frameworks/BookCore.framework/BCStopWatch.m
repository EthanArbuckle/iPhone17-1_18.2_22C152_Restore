@interface BCStopWatch
+ (id)stopwatch;
+ (id)stopwatchWithDescription:(id)a3;
+ (void)initialize;
- (BCStopWatch)init;
- (double)time;
- (id)description;
- (void)report;
- (void)reportWithMarker:(id)a3;
- (void)setDescription:(id)a3;
- (void)start;
@end

@implementation BCStopWatch

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_345604);
  }
}

- (BCStopWatch)init
{
  v6.receiver = self;
  v6.super_class = (Class)BCStopWatch;
  v2 = [(BCStopWatch *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (id)stopwatchWithDescription:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDescription:v3];

  [v4 start];

  return v4;
}

+ (id)stopwatch
{
  v2 = objc_opt_new();
  [v2 start];

  return v2;
}

- (void)start
{
  self->_startTime = mach_absolute_time();
  CFStringRef description = (const __CFString *)self->_description;
  if (!description) {
    CFStringRef description = &stru_2CE418;
  }
  NSLog(@"<%p> start%@", self, description);
}

- (double)time
{
  uint64_t v3 = mach_absolute_time();
  LODWORD(v4) = dword_345604;
  LODWORD(v5) = *(_DWORD *)algn_345608;
  return (double)(v3 - self->_startTime) * (double)v4 / (double)v5 / 1000000000.0;
}

- (void)setDescription:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@" %@", v4];

  CFStringRef description = self->_description;
  self->_CFStringRef description = v5;
}

- (id)description
{
  if (self->_description) {
    CFStringRef description = (const __CFString *)self->_description;
  }
  else {
    CFStringRef description = &stru_2CE418;
  }
  [(BCStopWatch *)self time];
  return +[NSString stringWithFormat:@"<%p>%@: elapsed time: %0.5f", self, description, v4];
}

- (void)report
{
  id v2 = [(BCStopWatch *)self description];
  NSLog(@"%@", v2);
}

- (void)reportWithMarker:(id)a3
{
  id v6 = a3;
  [(BCStopWatch *)self time];
  CFStringRef description = &stru_2CE418;
  if (self->_description) {
    CFStringRef description = (const __CFString *)self->_description;
  }
  NSLog(@"<%p> [%@] %@: elapsed time: %0.5fs (%0.5fms)", self, v6, description, *(void *)&v4, v4 * 1000.0);
}

- (void).cxx_destruct
{
}

@end