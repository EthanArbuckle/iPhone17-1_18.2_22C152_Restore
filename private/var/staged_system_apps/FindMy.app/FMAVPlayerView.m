@interface FMAVPlayerView
+ (Class)layerClass;
- (NSString)accessibilityAssetName;
- (NSString)description;
- (_TtC6FindMy14FMAVPlayerView)initWithCoder:(id)a3;
- (_TtC6FindMy14FMAVPlayerView)initWithFrame:(CGRect)a3;
- (void)dealloc;
@end

@implementation FMAVPlayerView

+ (Class)layerClass
{
  sub_100006060(0, &qword_1006BA2D8);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC6FindMy14FMAVPlayerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002FA640();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy14FMAVPlayerView_assetManager);
  id v3 = self;
  [v2 invalidate];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for FMAVPlayerView();
  [(FMAVPlayerView *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy14FMAVPlayerView_playerStartedObservation));
  swift_unknownObjectRelease();
  sub_100067244((uint64_t)self + OBJC_IVAR____TtC6FindMy14FMAVPlayerView_playerTimeObserver);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_100036B90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC6FindMy14FMAVPlayerView_playingHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy14FMAVPlayerView_showHideHandler);

  sub_100036B90(v3);
}

- (NSString)description
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC6FindMy14FMAVPlayerView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy14FMAVPlayerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (NSString)accessibilityAssetName
{
  if (*(void *)&self->assetBundle[OBJC_IVAR____TtC6FindMy14FMAVPlayerView_assetName])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

@end