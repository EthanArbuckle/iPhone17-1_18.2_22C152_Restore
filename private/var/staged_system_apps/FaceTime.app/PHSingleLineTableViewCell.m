@interface PHSingleLineTableViewCell
- (NSDirectionalEdgeInsets)rootViewLayoutMargins;
- (double)titleLabelFirstBaselineLayoutConstraintConstant;
- (double)titleLabelLastBaselineLayoutConstraintConstant;
- (id)loadRootViewAndContentViews;
- (void)updateFontsAndLayoutMetrics;
@end

@implementation PHSingleLineTableViewCell

- (id)loadRootViewAndContentViews
{
  v6.receiver = self;
  v6.super_class = (Class)PHSingleLineTableViewCell;
  v3 = [(PHTableViewCell *)&v6 loadRootViewAndContentViews];
  v4 = [(PHTableViewCell *)self titleLabel];
  [v4 setNumberOfLines:0];

  return v3;
}

- (void)updateFontsAndLayoutMetrics
{
  v10.receiver = self;
  v10.super_class = (Class)PHSingleLineTableViewCell;
  [(PHTableViewCell *)&v10 updateFontsAndLayoutMetrics];
  v3 = +[UIFont telephonyUIBodyShortFont];
  v4 = [(PHTableViewCell *)self subtitleLabel];
  [v4 setFont:v3];

  double v5 = NUIContainerViewLengthUseDefault;
  objc_super v6 = [(PHTableViewCell *)self subtitleLabel];
  [v6 setCustomBaselineOffsetFromBottom:v5];

  [(PHSingleLineTableViewCell *)self effectiveBaselineOffsetFromBottom];
  double v8 = v7;
  v9 = [(PHTableViewCell *)self subtitleLabel];
  [v9 setCustomBaselineOffsetFromBottom:v8];
}

- (NSDirectionalEdgeInsets)rootViewLayoutMargins
{
  v18.receiver = self;
  v18.super_class = (Class)PHSingleLineTableViewCell;
  [(PHTableViewCell *)&v18 rootViewLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(PHSingleLineTableViewCell *)self titleLabelLastBaselineLayoutConstraintConstant];
  double v10 = v9;
  v11 = [(PHTableViewCell *)self titleLabel];
  [v11 effectiveBaselineOffsetFromBottom];
  double v13 = v10 - v12;

  double v14 = v4;
  double v15 = v6;
  double v16 = v13;
  double v17 = v8;
  result.trailing = v17;
  result.bottom = v16;
  result.leading = v15;
  result.top = v14;
  return result;
}

- (double)titleLabelFirstBaselineLayoutConstraintConstant
{
  v2 = [(PHTableViewCell *)self titleLabel];
  double v3 = [v2 font];
  double v4 = [v3 fontDescriptor];
  double v5 = [v4 objectForKey:UIFontDescriptorTextStyleAttribute];

  if (v5)
  {
    double v6 = +[UIFontMetrics metricsForTextStyle:v5];
    [v6 scaledValueForValue:36.0];
    double v8 = v7;
  }
  else
  {
    double v8 = 36.0;
  }

  return v8;
}

- (double)titleLabelLastBaselineLayoutConstraintConstant
{
  v2 = [(PHTableViewCell *)self titleLabel];
  double v3 = [v2 font];
  double v4 = [v3 fontDescriptor];
  double v5 = [v4 objectForKey:UIFontDescriptorTextStyleAttribute];

  if (v5)
  {
    double v6 = +[UIFontMetrics metricsForTextStyle:v5];
    [v6 scaledValueForValue:24.0];
    double v8 = v7;
  }
  else
  {
    double v8 = 24.0;
  }

  return v8;
}

@end