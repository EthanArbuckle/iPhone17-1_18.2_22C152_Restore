@interface IMAMSMetricsEvent
- (IMAMSMetricsEvent)init;
- (NSString)pageType;
- (id)eventType;
- (void)setEventType:(id)a3;
- (void)setPageType:(id)a3;
@end

@implementation IMAMSMetricsEvent

- (IMAMSMetricsEvent)init
{
  v3 = objc_msgSend(MEMORY[0x1E4F4DD60], "im_defaultTopicForEvents");
  v6.receiver = self;
  v6.super_class = (Class)IMAMSMetricsEvent;
  v4 = [(IMAMSMetricsEvent *)&v6 initWithTopic:v3];

  return v4;
}

- (void)setPageType:(id)a3
{
}

- (void)setEventType:(id)a3
{
}

- (id)eventType
{
  return (id)[(IMAMSMetricsEvent *)self propertyForBodyKey:@"eventType"];
}

- (NSString)pageType
{
  return (NSString *)[(IMAMSMetricsEvent *)self propertyForBodyKey:@"pageType"];
}

@end