@interface SubscriptionButtonTextProvider
- (NSString)title;
- (_TtC12NewsArticles30SubscriptionButtonTextProvider)init;
- (void)setTitle:(id)a3;
@end

@implementation SubscriptionButtonTextProvider

- (NSString)title
{
  v2 = self;
  sub_1BF7A1024();

  v3 = (void *)sub_1BF7E3998();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v4 = sub_1BF7E39C8();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12NewsArticles30SubscriptionButtonTextProvider____lazy_storage___title);
  uint64_t *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC12NewsArticles30SubscriptionButtonTextProvider)init
{
  result = (_TtC12NewsArticles30SubscriptionButtonTextProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end