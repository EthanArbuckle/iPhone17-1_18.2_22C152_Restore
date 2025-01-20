@interface NowPlayingContentView
- (AVPlayerLayer)accessibilityPlayerVideoLayer;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC12NowPlayingUI21NowPlayingContentView)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI21NowPlayingContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NowPlayingContentView

- (_TtC12NowPlayingUI21NowPlayingContentView)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI21NowPlayingContentView *)sub_D1630(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI21NowPlayingContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_D3AB0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_D1FFC();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1299F0();
    a3 = v6;
    v7 = self;
    NSString v8 = sub_1299B0();
  }
  else
  {
    v9 = self;
    NSString v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = ObjectType;
  unsigned int v10 = [(NowPlayingContentView *)&v13 _shouldAnimatePropertyWithKey:v8];

  if (v10)
  {

    swift_bridgeObjectRelease();
    return 1;
  }
  if (a3)
  {
    v14._countAndFlagsBits = 0x776F64616873;
    v14._object = (void *)0xE600000000000000;
    BOOL v12 = sub_129A50(v14);

    swift_bridgeObjectRelease();
    return v12;
  }
  __break(1u);
  return result;
}

- (AVPlayerLayer)accessibilityPlayerVideoLayer
{
  v2 = self;
  id v3 = sub_D3740();

  return (AVPlayerLayer *)v3;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI21NowPlayingContentView_videoViewController));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI21NowPlayingContentView_radiosityView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI21NowPlayingContentView_borderColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI21NowPlayingContentView_placeholderImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI21NowPlayingContentView_playerPath);
}

@end