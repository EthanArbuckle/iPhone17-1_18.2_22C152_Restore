@interface SubtitledButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12NowPlayingUI15SubtitledButton)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI15SubtitledButton)initWithFrame:(CGRect)a3;
@end

@implementation SubtitledButton

- (_TtC12NowPlayingUI15SubtitledButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_title);
  void *v9 = 0;
  v9[1] = 0xE000000000000000;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_subtitle);
  void *v10 = 0;
  v10[1] = 0;
  uint64_t v11 = OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_textColor;
  v12 = self;
  v13 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v11) = (Class)[v12 whiteColor];

  v16.receiver = v13;
  v16.super_class = ObjectType;
  v14 = -[MultilineButton initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  sub_A5BD8();

  return v14;
}

- (_TtC12NowPlayingUI15SubtitledButton)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_title);
  void *v5 = 0;
  v5[1] = 0xE000000000000000;
  v6 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_subtitle);
  void *v6 = 0;
  v6[1] = 0;
  uint64_t v7 = OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_textColor;
  v8 = self;
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)[v8 whiteColor];

  result = (_TtC12NowPlayingUI15SubtitledButton *)sub_12A480();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  -[MultilineButton sizeThatFits:](&v7, "sizeThatFits:", width, height);
  double v6 = 50.0;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI15SubtitledButton_textColor);
}

@end