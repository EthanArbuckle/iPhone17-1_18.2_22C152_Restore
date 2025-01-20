@interface SearchFetcher
- (_TtC7NewsUI213SearchFetcher)init;
@end

@implementation SearchFetcher

- (_TtC7NewsUI213SearchFetcher)init
{
  result = (_TtC7NewsUI213SearchFetcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI213SearchFetcher_searchEndpointConfigManager);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI213SearchFetcher_queryContextManager);
  swift_unknownObjectRelease();
  sub_1DEF40E8C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI213SearchFetcher_queryContext), *(void *)&self->connection[OBJC_IVAR____TtC7NewsUI213SearchFetcher_queryContext]);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI213SearchFetcher_logger;
  uint64_t v4 = sub_1DFDF01D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
}

@end