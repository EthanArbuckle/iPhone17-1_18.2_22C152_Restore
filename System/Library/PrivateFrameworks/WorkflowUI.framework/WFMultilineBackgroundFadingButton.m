@interface WFMultilineBackgroundFadingButton
- (CGSize)intrinsicContentSize;
- (WFMultilineBackgroundFadingButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WFMultilineBackgroundFadingButton

- (void)layoutSubviews
{
  [(WFMultilineBackgroundFadingButton *)self frame];
  double v4 = v3;
  [(WFMultilineBackgroundFadingButton *)self contentEdgeInsets];
  double v6 = v4 - v5;
  [(WFMultilineBackgroundFadingButton *)self contentEdgeInsets];
  double v8 = v6 - v7;
  v9 = [(WFMultilineBackgroundFadingButton *)self titleLabel];
  [v9 setPreferredMaxLayoutWidth:v8];

  v10.receiver = self;
  v10.super_class = (Class)WFMultilineBackgroundFadingButton;
  [(WFMultilineBackgroundFadingButton *)&v10 layoutSubviews];
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(WFMultilineBackgroundFadingButton *)self titleLabel];
  [v3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;

  [(WFMultilineBackgroundFadingButton *)self contentEdgeInsets];
  double v10 = v7 + v8 + v9;
  double v13 = v5 + v11 + v12;
  double v14 = v10;
  result.height = v14;
  result.width = v13;
  return result;
}

- (WFMultilineBackgroundFadingButton)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFMultilineBackgroundFadingButton;
  double v3 = -[WFMultilineBackgroundFadingButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    double v5 = [(WFMultilineBackgroundFadingButton *)v3 titleLabel];
    [v5 setLineBreakMode:0];

    double v6 = [(WFMultilineBackgroundFadingButton *)v4 titleLabel];
    [v6 setTextAlignment:1];

    double v7 = [(WFMultilineBackgroundFadingButton *)v4 titleLabel];
    [v7 setNumberOfLines:0];

    double v8 = v4;
  }

  return v4;
}

@end