@interface JSShareResult
@end

@implementation JSShareResult

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore13JSShareResult_previewURL, (uint64_t *)&unk_10109BF50);
  swift_bridgeObjectRelease();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore13JSShareResult_url, (uint64_t *)&unk_10109BF50);
}

@end