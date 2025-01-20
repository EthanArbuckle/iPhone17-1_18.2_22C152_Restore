@interface FormatVideoView
+ (Class)layerClass;
- (_TtC8NewsFeed15FormatVideoView)initWithCoder:(id)a3;
- (_TtC8NewsFeed15FormatVideoView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
@end

@implementation FormatVideoView

+ (Class)layerClass
{
  sub_1C11A201C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8NewsFeed15FormatVideoView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed15FormatVideoView *)sub_1C11A1924(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed15FormatVideoView)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_identifier);
  void *v5 = 0;
  v5[1] = 0xE000000000000000;
  v6 = (char *)self + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_assets;
  uint64_t v7 = type metadata accessor for FormatVideoData.Assets(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = OBJC_IVAR____TtC8NewsFeed15FormatVideoView_displayStateCoordinator;
  type metadata accessor for LayeredMediaViewDisplayStateCoordinator();
  swift_allocObject();
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)LayeredMediaViewDisplayStateCoordinator.init()();
  v10 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_playerProperties);
  v10[1] = 0u;
  v10[2] = 0u;
  _OWORD *v10 = 0u;

  result = (_TtC8NewsFeed15FormatVideoView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(FormatVideoView *)&v3 didMoveToWindow];
  LayeredMediaViewDisplayStateCoordinator.updateDisplay()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1C11A205C((uint64_t)self + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_assets);
  swift_release();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_playerProperties);
  uint64_t v4 = *(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_playerProperties);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity
                  + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_playerProperties);
  uint64_t v6 = *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                  + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_playerProperties);
  uint64_t v7 = *(UITraitCollection **)((char *)&self->super._cachedTraitCollection
                             + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_playerProperties);
  sub_1C01D6E14(v3, v4, v5, v6, v7);
}

@end