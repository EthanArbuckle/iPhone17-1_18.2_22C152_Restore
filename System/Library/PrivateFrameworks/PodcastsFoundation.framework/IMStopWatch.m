@interface IMStopWatch
+ (id)stopwatch;
+ (id)stopwatchWithDescription:(id)a3;
+ (void)initialize;
- (IMStopWatch)init;
- (double)time;
- (id)description;
- (void)report;
- (void)reportWithMarker:(id)a3;
- (void)setDescription:(id)a3;
- (void)start;
@end

@implementation IMStopWatch

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    mach_timebase_info((mach_timebase_info_t)&timeBase);
  }
}

- (IMStopWatch)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMStopWatch;
  v2 = [(IMStopWatch *)&v6 init];
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
  descriptionString = (__CFString *)self->_descriptionString;
  if (!descriptionString) {
    descriptionString = &stru_1F03A51F0;
  }
  NSLog(&cfstr_PStart.isa, self, descriptionString);
}

- (double)time
{
  uint64_t v3 = mach_absolute_time();
  LODWORD(v4) = timeBase;
  LODWORD(v5) = *(_DWORD *)algn_1E99F6DF4;
  return (double)(v3 - self->_startTime) * (double)v4 / (double)v5 / 1000000000.0;
}

- (void)setDescription:(id)a3
{
  unint64_t v4 = (objc_class *)NSString;
  id v5 = a3;
  objc_super v6 = (NSString *)[[v4 alloc] initWithFormat:@" %@", v5];

  descriptionString = self->_descriptionString;
  self->_descriptionString = v6;
}

- (id)description
{
  uint64_t v3 = NSString;
  if (self->_descriptionString) {
    descriptionString = (__CFString *)self->_descriptionString;
  }
  else {
    descriptionString = &stru_1F03A51F0;
  }
  [(IMStopWatch *)self time];
  return (id)[v3 stringWithFormat:@"<%p>%@: elapsed time: %0.5f", self, descriptionString, v5];
}

- (void)report
{
  id v2 = [(IMStopWatch *)self description];
  NSLog(&stru_1F03A60D0.isa, v2);
}

- (void)reportWithMarker:(id)a3
{
  id v6 = a3;
  [(IMStopWatch *)self time];
  descriptionString = &stru_1F03A51F0;
  if (self->_descriptionString) {
    descriptionString = (__CFString *)self->_descriptionString;
  }
  NSLog(&cfstr_PElapsedTime05_0.isa, self, v6, descriptionString, *(void *)&v4, v4 * 1000.0);
}

- (void).cxx_destruct
{
}

@end