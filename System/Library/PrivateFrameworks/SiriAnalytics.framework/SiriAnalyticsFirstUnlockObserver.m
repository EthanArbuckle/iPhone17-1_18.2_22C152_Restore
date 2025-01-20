@interface SiriAnalyticsFirstUnlockObserver
- (_TtC13SiriAnalytics32SiriAnalyticsFirstUnlockObserver)init;
- (_TtC13SiriAnalytics32SiriAnalyticsFirstUnlockObserver)initWithQueue:(id)a3;
- (void)afterFirstUnlock:(id)a3;
@end

@implementation SiriAnalyticsFirstUnlockObserver

- (_TtC13SiriAnalytics32SiriAnalyticsFirstUnlockObserver)initWithQueue:(id)a3
{
  return (_TtC13SiriAnalytics32SiriAnalyticsFirstUnlockObserver *)SiriAnalyticsFirstUnlockObserver.init(queue:)(a3);
}

- (void)afterFirstUnlock:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1A2BA0658((uint64_t)sub_1A2B588E4, v5);

  swift_release();
}

- (_TtC13SiriAnalytics32SiriAnalyticsFirstUnlockObserver)init
{
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SiriAnalytics32SiriAnalyticsFirstUnlockObserver_queue);
}

@end