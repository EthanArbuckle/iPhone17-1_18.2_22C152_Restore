@interface TTRIBackgroundView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC15RemindersUICore18TTRIBackgroundView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore18TTRIBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TTRIBackgroundView

- (_TtC15RemindersUICore18TTRIBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore18TTRIBackgroundView *)TTRIBackgroundView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore18TTRIBackgroundView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore18TTRIBackgroundView *)sub_1B93BAA40(a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 1.0;
  double v4 = 1.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  TTRIBackgroundView.layoutSubviews()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore18TTRIBackgroundView_backgroundFillColor));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore18TTRIBackgroundView_borderColor);
}

@end