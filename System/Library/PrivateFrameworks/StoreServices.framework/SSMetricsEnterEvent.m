@interface SSMetricsEnterEvent
- (NSString)enterType;
- (NSString)referringAppName;
- (NSString)referringURL;
- (SSMetricsEnterEvent)init;
- (id)description;
- (void)setEnterType:(id)a3;
- (void)setEnterTypeWithLaunchReason:(int64_t)a3;
- (void)setReferringAppName:(id)a3;
- (void)setReferringURL:(id)a3;
@end

@implementation SSMetricsEnterEvent

- (SSMetricsEnterEvent)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSMetricsEnterEvent;
  v2 = [(SSMetricsBaseEvent *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SSMetricsMutableEvent *)v2 setEventType:@"enter"];
  }
  return v3;
}

- (NSString)enterType
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"type"];
}

- (NSString)referringAppName
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"refApp"];
}

- (NSString)referringURL
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"refUrl"];
}

- (void)setEnterType:(id)a3
{
}

- (void)setEnterTypeWithLaunchReason:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    [(SSMetricsEnterEvent *)self setEnterType:off_1E5BAEC68[a3]];
  }
}

- (void)setReferringAppName:(id)a3
{
}

- (void)setReferringURL:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SSMetricsEnterEvent;
  v4 = [(SSMetricsBaseEvent *)&v8 description];
  objc_super v5 = [(SSMetricsEnterEvent *)self enterType];
  v6 = [v3 stringWithFormat:@"%@: Type: %@", v4, v5];

  return v6;
}

@end