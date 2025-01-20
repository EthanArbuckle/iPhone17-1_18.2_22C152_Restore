@interface TabBarItemsInfo
- (_TtC8VideosUI15TabBarItemsInfo)init;
@end

@implementation TabBarItemsInfo

- (_TtC8VideosUI15TabBarItemsInfo)init
{
  return (_TtC8VideosUI15TabBarItemsInfo *)sub_1E34349A8();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI15TabBarItemsInfo__selectedIndex;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EADF13A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8VideosUI15TabBarItemsInfo_selectedIndexDidChange));
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8VideosUI15TabBarItemsInfo_debugUIGestureHandler);
  sub_1E2C5FB90(v5);
}

@end