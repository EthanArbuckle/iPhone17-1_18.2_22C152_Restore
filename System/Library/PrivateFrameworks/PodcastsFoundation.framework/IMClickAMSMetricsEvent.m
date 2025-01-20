@interface IMClickAMSMetricsEvent
- (IMClickAMSMetricsEvent)init;
- (void)setPositionX:(id)a3;
- (void)setPositionY:(id)a3;
@end

@implementation IMClickAMSMetricsEvent

- (IMClickAMSMetricsEvent)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMClickAMSMetricsEvent;
  v2 = [(IMAMSMetricsEvent *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IMAMSMetricsEvent *)v2 setEventType:@"click"];
  }
  return v3;
}

- (void)setPositionX:(id)a3
{
}

- (void)setPositionY:(id)a3
{
}

@end