@interface NAArticleFooterContext
- (NAArticleFooterContext)init;
@end

@implementation NAArticleFooterContext

- (NAArticleFooterContext)init
{
  result = (NAArticleFooterContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___NAArticleFooterContext_articleGroupData);
  uint64_t v4 = *(void *)&self->headline[OBJC_IVAR___NAArticleFooterContext_articleGroupData];
  uint64_t v5 = *(void *)&self->viewingSessionID[OBJC_IVAR___NAArticleFooterContext_articleGroupData];
  sub_1BF51EF74(v3, v4, v5);
}

@end