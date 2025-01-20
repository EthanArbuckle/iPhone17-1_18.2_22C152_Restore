@interface PuzzleGameCenterService
- (_TtC8NewsFeed23PuzzleGameCenterService)init;
- (void)networkReachabilityDidChange:(id)a3;
@end

@implementation PuzzleGameCenterService

- (_TtC8NewsFeed23PuzzleGameCenterService)init
{
  swift_defaultActor_initialize();
  result = (_TtC8NewsFeed23PuzzleGameCenterService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)networkReachabilityDidChange:(id)a3
{
  sub_1C0064478(0);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain();
  swift_retain();
  if (objc_msgSend(a3, sel_isNetworkReachable))
  {
    uint64_t v8 = sub_1C151EE9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
    v9 = (void *)swift_allocObject();
    v9[2] = 0;
    v9[3] = 0;
    v9[4] = self;
    swift_retain();
    sub_1C0C833AC((uint64_t)v7, (uint64_t)&unk_1EA1AB2A0, (uint64_t)v9);
    swift_unknownObjectRelease();
    swift_release();
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    swift_release();
  }
}

@end