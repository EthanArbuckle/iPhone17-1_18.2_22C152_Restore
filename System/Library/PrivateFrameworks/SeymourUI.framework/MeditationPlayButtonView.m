@interface MeditationPlayButtonView
- (_TtC9SeymourUI24MeditationPlayButtonView)initWithCoder:(id)a3;
- (_TtC9SeymourUI24MeditationPlayButtonView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MeditationPlayButtonView

- (_TtC9SeymourUI24MeditationPlayButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI24MeditationPlayButtonView *)sub_23A55FDC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI24MeditationPlayButtonView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A560990();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A560628();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MeditationPlayButtonView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MeditationPlayButtonView_tintView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI24MeditationPlayButtonView_playButton);
}

@end