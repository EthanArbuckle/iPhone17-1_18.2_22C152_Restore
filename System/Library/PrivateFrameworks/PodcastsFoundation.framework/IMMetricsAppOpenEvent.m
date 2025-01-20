@interface IMMetricsAppOpenEvent
- (IMMetricsAppOpenEvent)initWithReason:(int64_t)a3;
- (NSString)referringAppName;
- (NSString)referringURL;
- (void)setEnterTypeWithLaunchReason:(int64_t)a3;
- (void)setReferringAppName:(id)a3;
- (void)setReferringURL:(id)a3;
@end

@implementation IMMetricsAppOpenEvent

- (IMMetricsAppOpenEvent)initWithReason:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IMMetricsAppOpenEvent;
  v4 = [(IMAMSMetricsEvent *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(IMAMSMetricsEvent *)v4 setEventType:@"app_open"];
    [(IMMetricsAppOpenEvent *)v5 setEnterTypeWithLaunchReason:a3];
  }
  return v5;
}

- (void)setEnterTypeWithLaunchReason:(int64_t)a3
{
  if ((unint64_t)a3 <= 3) {
    [(AMSMetricsEvent *)self im_setName:off_1E5E61560[a3]];
  }
}

- (void)setReferringURL:(id)a3
{
}

- (void)setReferringAppName:(id)a3
{
}

- (NSString)referringAppName
{
  return (NSString *)[(IMMetricsAppOpenEvent *)self propertyForBodyKey:@"refApp"];
}

- (NSString)referringURL
{
  return (NSString *)[(IMMetricsAppOpenEvent *)self propertyForBodyKey:@"refUrl"];
}

@end