@interface SSMetricsExitEvent
- (NSString)exitType;
- (NSString)exitURL;
- (SSMetricsExitEvent)init;
- (id)description;
- (void)setExitType:(id)a3;
- (void)setExitTypeWithSuspendReason:(int64_t)a3;
- (void)setExitURL:(id)a3;
@end

@implementation SSMetricsExitEvent

- (SSMetricsExitEvent)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSMetricsExitEvent;
  v2 = [(SSMetricsBaseEvent *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SSMetricsMutableEvent *)v2 setEventType:@"exit"];
  }
  return v3;
}

- (NSString)exitType
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"type"];
}

- (NSString)exitURL
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"destinationUrl"];
}

- (void)setExitType:(id)a3
{
}

- (void)setExitTypeWithSuspendReason:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    v3 = @"taskSwitch";
  }
  else
  {
    v3 = @"quit";
  }
  [(SSMetricsExitEvent *)self setExitType:v3];
}

- (void)setExitURL:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SSMetricsExitEvent;
  v4 = [(SSMetricsBaseEvent *)&v8 description];
  objc_super v5 = [(SSMetricsExitEvent *)self exitType];
  v6 = [v3 stringWithFormat:@"%@: Type: %@", v4, v5];

  return v6;
}

@end