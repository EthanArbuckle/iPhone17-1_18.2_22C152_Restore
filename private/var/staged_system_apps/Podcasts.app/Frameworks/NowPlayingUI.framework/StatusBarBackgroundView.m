@interface StatusBarBackgroundView
- (_TtC12NowPlayingUI23StatusBarBackgroundView)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI23StatusBarBackgroundView)initWithEffect:(id)a3;
@end

@implementation StatusBarBackgroundView

- (_TtC12NowPlayingUI23StatusBarBackgroundView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI23StatusBarBackgroundView_edgeProgress) = 0;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI23StatusBarBackgroundView_style) = 1;
  id v4 = a3;

  result = (_TtC12NowPlayingUI23StatusBarBackgroundView *)sub_12A480();
  __break(1u);
  return result;
}

- (_TtC12NowPlayingUI23StatusBarBackgroundView)initWithEffect:(id)a3
{
  id v3 = a3;
  result = (_TtC12NowPlayingUI23StatusBarBackgroundView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end