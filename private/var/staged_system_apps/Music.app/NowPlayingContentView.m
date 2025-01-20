@interface NowPlayingContentView
- (AVPlayerLayer)accessibilityPlayerVideoLayer;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC5Music21NowPlayingContentView)initWithCoder:(id)a3;
- (_TtC5Music21NowPlayingContentView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NowPlayingContentView

- (void)didMoveToWindow
{
  v2 = self;
  sub_10000FE40();
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  id v5 = a3;
  [(NowPlayingContentView *)&v8 traitCollectionDidChange:v5];
  id v6 = [v4 traitCollection];
  id v7 = [v6 userInterfaceStyle];
  if (!v5 || v7 != [v5 userInterfaceStyle]) {
    [v4 setNeedsLayout];
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v6;
    id v7 = self;
    NSString v8 = String._bridgeToObjectiveC()();
  }
  else
  {
    v9 = self;
    NSString v8 = 0;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  unsigned int v10 = [(NowPlayingContentView *)&v14 _shouldAnimatePropertyWithKey:v8];

  if (v10)
  {

    swift_bridgeObjectRelease();
    return 1;
  }
  if (a3)
  {
    v13._countAndFlagsBits = 0x776F64616873;
    v13._object = (void *)0xE600000000000000;
    Swift::Bool v12 = String.hasPrefix(_:)(v13);

    swift_bridgeObjectRelease();
    return v12;
  }
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10003A3B0();
}

- (_TtC5Music21NowPlayingContentView)initWithFrame:(CGRect)a3
{
  return (_TtC5Music21NowPlayingContentView *)sub_1000792F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music21NowPlayingContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005D4270();
}

- (AVPlayerLayer)accessibilityPlayerVideoLayer
{
  v2 = self;
  sub_1005D1C08();
  id v4 = v3;

  return (AVPlayerLayer *)v4;
}

- (void).cxx_destruct
{
  swift_release();
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5Music21NowPlayingContentView_artworkDidChangeHandler));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music21NowPlayingContentView__internalCatalog));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music21NowPlayingContentView_squareMotionSnapshot));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music21NowPlayingContentView_squareMotionKeyframeView));
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music21NowPlayingContentView_squareMotionContainer, &qword_1010B1F08);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music21NowPlayingContentView_squareMotionContainerView));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music21NowPlayingContentView_motionBackgroundSnapshot));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music21NowPlayingContentView_playerPath);
}

@end