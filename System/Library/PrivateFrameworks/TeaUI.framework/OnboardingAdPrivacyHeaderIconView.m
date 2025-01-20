@interface OnboardingAdPrivacyHeaderIconView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC5TeaUI33OnboardingAdPrivacyHeaderIconView)init;
- (_TtC5TeaUI33OnboardingAdPrivacyHeaderIconView)initWithCoder:(id)a3;
- (_TtC5TeaUI33OnboardingAdPrivacyHeaderIconView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation OnboardingAdPrivacyHeaderIconView

- (_TtC5TeaUI33OnboardingAdPrivacyHeaderIconView)init
{
  return (_TtC5TeaUI33OnboardingAdPrivacyHeaderIconView *)sub_1B5ED9F54();
}

- (_TtC5TeaUI33OnboardingAdPrivacyHeaderIconView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5EDA294();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B5EDA35C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1B5EDA9C4();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC5TeaUI33OnboardingAdPrivacyHeaderIconView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI33OnboardingAdPrivacyHeaderIconView_label));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5TeaUI33OnboardingAdPrivacyHeaderIconView_backgroundView);
}

@end