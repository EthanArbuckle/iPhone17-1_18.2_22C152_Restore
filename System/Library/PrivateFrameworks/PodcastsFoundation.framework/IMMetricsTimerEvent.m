@interface IMMetricsTimerEvent
- (IMMetricsTimerEvent)init;
- (double)duration;
- (id)shortDescription;
- (void)setDuration:(double)a3;
@end

@implementation IMMetricsTimerEvent

- (id)shortDescription
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)IMMetricsTimerEvent;
  v4 = [(AMSMetricsEvent *)&v8 shortDescription];
  [(IMMetricsTimerEvent *)self duration];
  v6 = [v3 stringWithFormat:@"%@, %f", v4, v5];

  return v6;
}

- (double)duration
{
  v2 = [(IMMetricsTimerEvent *)self propertyForBodyKey:@"duration"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (IMMetricsTimerEvent)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMMetricsTimerEvent;
  v2 = [(IMAMSMetricsEvent *)&v5 init];
  double v3 = v2;
  if (v2) {
    [(IMAMSMetricsEvent *)v2 setEventType:@"timer"];
  }
  return v3;
}

- (void)setDuration:(double)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  [(AMSMetricsEvent *)self im_setProperty:v4 forBodyKey:@"duration"];
}

@end