@interface JSShareResult
@end

@implementation JSShareResult

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore13JSShareResult_previewURL, (uint64_t *)&unk_DC0FA0);
  swift_bridgeObjectRelease();
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore13JSShareResult_url, (uint64_t *)&unk_DC0FA0);
}

@end