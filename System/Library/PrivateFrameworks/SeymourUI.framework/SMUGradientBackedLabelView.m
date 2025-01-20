@interface SMUGradientBackedLabelView
- (SMUGradientBackedLabelView)initWithCoder:(id)a3;
- (SMUGradientBackedLabelView)initWithFrame:(CGRect)a3;
- (UIView)viewForLastBaselineLayout;
- (void)layoutSubviews;
@end

@implementation SMUGradientBackedLabelView

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___SMUGradientBackedLabelView_label));
}

- (SMUGradientBackedLabelView)initWithFrame:(CGRect)a3
{
  return (SMUGradientBackedLabelView *)sub_23A06A1E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A06AC50();
}

- (SMUGradientBackedLabelView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A06CAB8();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SMUGradientBackedLabelView_gradientView);
}

@end