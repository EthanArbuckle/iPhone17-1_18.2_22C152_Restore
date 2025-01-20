@interface ShareLyricsStoryActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (_TtC5Music24ShareLyricsStoryActivity)init;
- (id)_bundleIdentifierForActivityImageCreation;
- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4;
@end

@implementation ShareLyricsStoryActivity

+ (int64_t)activityCategory
{
  return 1;
}

- (NSString)activityType
{
  v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();

  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)activityTitle
{
  sub_1003C95E8();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (id)_bundleIdentifierForActivityImageCreation
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  NSString v3 = self;
  char v4 = sub_100707E50();

  return v4 & 1;
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (a3) {
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v8 = sub_100224CC4;
  }
  else
  {
    v8 = 0;
    uint64_t v7 = 0;
  }
  v9 = self;
  sub_100706AE8((uint64_t)a3, (uint64_t)v8, v7);
  sub_10006ADFC((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (_TtC5Music24ShareLyricsStoryActivity)init
{
  result = (_TtC5Music24ShareLyricsStoryActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSString v3 = (char *)self + OBJC_IVAR____TtC5Music24ShareLyricsStoryActivity_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24ShareLyricsStoryActivity_artwork, (uint64_t *)&unk_10109EF90);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC5Music24ShareLyricsStoryActivity_presentationSource;

  sub_1000E0890((uint64_t)v5);
}

@end