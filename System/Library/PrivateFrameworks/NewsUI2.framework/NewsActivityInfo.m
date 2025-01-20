@interface NewsActivityInfo
- (_TtC7NewsUI216NewsActivityInfo)init;
@end

@implementation NewsActivityInfo

- (_TtC7NewsUI216NewsActivityInfo)init
{
  result = (_TtC7NewsUI216NewsActivityInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DEB4B7AC((uint64_t)self + OBJC_IVAR____TtC7NewsUI216NewsActivityInfo_url);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI216NewsActivityInfo_scrollPosition);
  uint64_t v4 = *(void *)&self->type[OBJC_IVAR____TtC7NewsUI216NewsActivityInfo_scrollPosition];
  sub_1DEF40E8C(v3, v4);
}

@end