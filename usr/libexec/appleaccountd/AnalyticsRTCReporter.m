@interface AnalyticsRTCReporter
- (_TtC13appleaccountd20AnalyticsRTCReporter)init;
- (void)sendEvent:(id)a3;
@end

@implementation AnalyticsRTCReporter

- (void)sendEvent:(id)a3
{
  v5 = self;
  id v6 = a3;
  v7 = self;
  [objc_msgSend(v5, "reporter") sendEvent:v6];

  swift_unknownObjectRelease();
}

- (_TtC13appleaccountd20AnalyticsRTCReporter)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(AnalyticsRTCReporter *)&v3 init];
}

@end