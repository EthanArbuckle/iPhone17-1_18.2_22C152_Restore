@interface UNCNotificationPipelineAssertionImpl
- (UNCNotificationPipelineAssertionImpl)init;
@end

@implementation UNCNotificationPipelineAssertionImpl

- (UNCNotificationPipelineAssertionImpl)init
{
  return (UNCNotificationPipelineAssertionImpl *)NotificationPipelineAssertion.init()();
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectRelease();
}

@end