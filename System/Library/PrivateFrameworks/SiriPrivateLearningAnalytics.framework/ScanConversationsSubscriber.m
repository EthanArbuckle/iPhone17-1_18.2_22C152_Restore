@interface ScanConversationsSubscriber
- (_TtC28SiriPrivateLearningAnalyticsP33_1C28A16D52A6DDC29A328441443490A627ScanConversationsSubscriber)init;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
@end

@implementation ScanConversationsSubscriber

- (void)receiveSubscription:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D2F9B628(v4);
}

- (int64_t)receiveInput:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1D3002398();
  swift_unknownObjectRelease();
  int64_t v5 = sub_1D2F9B744((uint64_t)v7);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

- (void)receiveCompletion:(id)a3
{
  id v4 = a3;
  int64_t v5 = self;
  sub_1D2F9BD8C(v4);
}

- (void)cancel
{
  v2 = self;
  sub_1D2F9BFD0();
}

- (_TtC28SiriPrivateLearningAnalyticsP33_1C28A16D52A6DDC29A328441443490A627ScanConversationsSubscriber)init
{
  result = (_TtC28SiriPrivateLearningAnalyticsP33_1C28A16D52A6DDC29A328441443490A627ScanConversationsSubscriber *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end