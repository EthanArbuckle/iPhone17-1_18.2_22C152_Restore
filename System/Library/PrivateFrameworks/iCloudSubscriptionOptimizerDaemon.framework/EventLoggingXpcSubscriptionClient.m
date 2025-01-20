@interface EventLoggingXpcSubscriptionClient
- (void)request:(id)a3 withReply:(id)a4;
@end

@implementation EventLoggingXpcSubscriptionClient

- (void)request:(id)a3 withReply:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = a3;
  swift_retain();
  EventLoggingXpcSubscriptionClient.request(_:withReply:)(v7, (uint64_t)sub_22A5494DC, v6);

  swift_release();
  swift_release();
}

@end