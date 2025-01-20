@interface NowPlayingViewController.TimeLabel
- (_TtCC5Music24NowPlayingViewController9TimeLabel)initWithCoder:(id)a3;
- (_TtCC5Music24NowPlayingViewController9TimeLabel)initWithFrame:(CGRect)a3;
@end

@implementation NowPlayingViewController.TimeLabel

- (_TtCC5Music24NowPlayingViewController9TimeLabel)initWithFrame:(CGRect)a3
{
  sub_1005E4850(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtCC5Music24NowPlayingViewController9TimeLabel)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC5Music24NowPlayingViewController9TimeLabel_displayLink) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC5Music24NowPlayingViewController9TimeLabel____lazy_storage___dateFormatter) = 0;
  id v4 = a3;

  result = (_TtCC5Music24NowPlayingViewController9TimeLabel *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Music24NowPlayingViewController9TimeLabel_displayLink));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC5Music24NowPlayingViewController9TimeLabel____lazy_storage___dateFormatter);
}

@end