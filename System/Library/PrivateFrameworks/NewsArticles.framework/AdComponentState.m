@interface AdComponentState
- (NSString)identifier;
- (_TtC12NewsArticles16AdComponentState)init;
@end

@implementation AdComponentState

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BF7E3998();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC12NewsArticles16AdComponentState)init
{
  result = (_TtC12NewsArticles16AdComponentState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles16AdComponentState_bannerState;
  uint64_t v4 = sub_1BF7E0FB8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end