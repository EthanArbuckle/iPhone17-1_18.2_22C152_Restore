@interface ProxyAuthenticationKeyManager
- (_TtC12NewsArticles29ProxyAuthenticationKeyManager)init;
- (void)requestAuthenticationKeyWithCompletion:(id)a3;
@end

@implementation ProxyAuthenticationKeyManager

- (_TtC12NewsArticles29ProxyAuthenticationKeyManager)init
{
  result = (_TtC12NewsArticles29ProxyAuthenticationKeyManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_1BF4B5968((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29ProxyAuthenticationKeyManager_key, &qword_1EBA5F768, (uint64_t (*)(uint64_t))type metadata accessor for ProxyAuthenticationKey);
  swift_bridgeObjectRelease();
}

- (void)requestAuthenticationKeyWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1BF4B3B64((uint64_t)sub_1BF4B4434, v5);

  swift_release();
}

@end