@interface NCNotificationSummaryPlatterContainingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)summaryPlatterView;
- (void)layoutSubviews;
- (void)setSummaryPlatterView:(id)a3;
@end

@implementation NCNotificationSummaryPlatterContainingView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(NCNotificationSummaryPlatterContainingView *)self summaryPlatterView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)NCNotificationSummaryPlatterContainingView;
  [(NCNotificationSummaryPlatterContainingView *)&v13 layoutSubviews];
  [(NCNotificationSummaryPlatterContainingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(NCNotificationSummaryPlatterContainingView *)self summaryPlatterView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;

  v12 = [(NCNotificationSummaryPlatterContainingView *)self summaryPlatterView];
  objc_msgSend(v12, "setFrame:", v9, v11, v4, v6);
}

- (UIView)summaryPlatterView
{
  return self->_summaryPlatterView;
}

- (void)setSummaryPlatterView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end