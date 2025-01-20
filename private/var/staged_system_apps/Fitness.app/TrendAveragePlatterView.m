@interface TrendAveragePlatterView
- (_TtC10FitnessApp23TrendAveragePlatterView)initWithCoder:(id)a3;
- (_TtC10FitnessApp23TrendAveragePlatterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setupFontsAndConstants;
@end

@implementation TrendAveragePlatterView

- (_TtC10FitnessApp23TrendAveragePlatterView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp23TrendAveragePlatterView *)sub_10060B48C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp23TrendAveragePlatterView)initWithCoder:(id)a3
{
  return 0;
}

- (void)setupFontsAndConstants
{
  v2 = self;
  sub_10060BCB4();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TrendAveragePlatterView();
  v2 = (char *)v4.receiver;
  [(TrendAveragePlatterView *)&v4 layoutSubviews];
  v3 = self;
  [v3 begin];
  [v3 setDisableActions:1];
  sub_10060C3F8(v2);
  [v3 commit];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendAveragePlatterView_labelStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendAveragePlatterView_label1));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendAveragePlatterView_label2));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendAveragePlatterView_stackLeadingConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp23TrendAveragePlatterView_stackTrailingConstraint);
}

@end