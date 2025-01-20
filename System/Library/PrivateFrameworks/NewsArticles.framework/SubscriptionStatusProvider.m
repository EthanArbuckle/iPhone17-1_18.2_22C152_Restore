@interface SubscriptionStatusProvider
- (_TtC12NewsArticles26SubscriptionStatusProvider)init;
- (int64_t)bundleSubscriptionStatus;
- (int64_t)channelSubscriptionStatus;
- (void)addObserver:(id)a3;
- (void)bundleSubscriptionDidExpire:(id)a3;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
- (void)purchaseListChangedWithNotification:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setBundleSubscriptionStatus:(int64_t)a3;
- (void)setChannelSubscriptionStatus:(int64_t)a3;
@end

@implementation SubscriptionStatusProvider

- (int64_t)bundleSubscriptionStatus
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_bundleSubscriptionStatus);
}

- (void)setBundleSubscriptionStatus:(int64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_bundleSubscriptionStatus);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_bundleSubscriptionStatus) = (Class)a3;
  v4 = self;
  sub_1BF5C6528(v3, (SEL *)&selRef_bundleSubscriptionStatusDidChangeFromStatus_);
}

- (int64_t)channelSubscriptionStatus
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus);
}

- (void)setChannelSubscriptionStatus:(int64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus) = (Class)a3;
  v4 = self;
  sub_1BF5C6528(v3, (SEL *)&selRef_channelSubscriptionStatusDidChangeFromStatus_);
}

- (void)purchaseListChangedWithNotification:(id)a3
{
  uint64_t v4 = sub_1BF7DCDE8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF7DCDB8();
  v8 = self;
  uint64_t v9 = sub_1BF5C6A54();
  uint64_t v10 = *(uint64_t *)((char *)&v8->super.isa
                   + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus);
  *(Class *)((char *)&v8->super.isa
           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus) = (Class)v9;
  sub_1BF5C6528(v10, (SEL *)&selRef_channelSubscriptionStatusDidChangeFromStatus_);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC12NewsArticles26SubscriptionStatusProvider)init
{
  result = (_TtC12NewsArticles26SubscriptionStatusProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_observers);
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_bundleSubscriptionStatus);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_bundleSubscriptionStatus) = (Class)2;
  id v5 = a3;
  v8 = self;
  sub_1BF5C6528(v4, (SEL *)&selRef_bundleSubscriptionStatusDidChangeFromStatus_);
  uint64_t v6 = sub_1BF5C6A54();
  uint64_t v7 = *(uint64_t *)((char *)&v8->super.isa
                  + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus);
  *(Class *)((char *)&v8->super.isa
           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus) = (Class)v6;
  sub_1BF5C6528(v7, (SEL *)&selRef_channelSubscriptionStatusDidChangeFromStatus_);
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_bundleSubscriptionStatus);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_bundleSubscriptionStatus) = (Class)1;
  id v5 = a3;
  v8 = self;
  sub_1BF5C6528(v4, (SEL *)&selRef_bundleSubscriptionStatusDidChangeFromStatus_);
  uint64_t v6 = sub_1BF5C6A54();
  uint64_t v7 = *(uint64_t *)((char *)&v8->super.isa
                  + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus);
  *(Class *)((char *)&v8->super.isa
           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus) = (Class)v6;
  sub_1BF5C6528(v7, (SEL *)&selRef_channelSubscriptionStatusDidChangeFromStatus_);
}

@end