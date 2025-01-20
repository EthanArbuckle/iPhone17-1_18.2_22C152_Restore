@interface BreakoutBackgroundEffectView
- (_TtC8AppStore28BreakoutBackgroundEffectView)initWithCoder:(id)a3;
- (_TtC8AppStore28BreakoutBackgroundEffectView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BreakoutBackgroundEffectView

- (_TtC8AppStore28BreakoutBackgroundEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28BreakoutBackgroundEffectView *)sub_1002014C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore28BreakoutBackgroundEffectView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100202010();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100201CF0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28BreakoutBackgroundEffectView_topGradient));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28BreakoutBackgroundEffectView_blurGradientMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28BreakoutBackgroundEffectView_blurView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore28BreakoutBackgroundEffectView_bottomGradient);
}

@end