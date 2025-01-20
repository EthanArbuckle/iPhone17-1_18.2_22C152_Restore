@interface _CHWorkoutSummaryTabbedLabelContainer
- (CGSize)intrinsicContentSize;
- (NSString)averageText;
- (NSString)titleText;
- (NSString)totalText;
- (UIColor)textColor;
- (_CHWorkoutSummaryTabbedLabelContainer)initWithFrame:(CGRect)a3;
- (double)_firstBaselineOffsetFromTop;
- (void)layoutSubviews;
- (void)setAverageText:(id)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTotalText:(id)a3;
- (void)sizeToFit;
@end

@implementation _CHWorkoutSummaryTabbedLabelContainer

- (_CHWorkoutSummaryTabbedLabelContainer)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)_CHWorkoutSummaryTabbedLabelContainer;
  v3 = -[_CHWorkoutSummaryTabbedLabelContainer initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(_CHWorkoutSummaryTabbedLabelContainer *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v9;

    [(UILabel *)v3->_titleLabel setAdjustsFontSizeToFitWidth:1];
    v11 = +[UIFont defaultFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v3->_titleLabel setFont:v11];

    v12 = +[UIColor labelColor];
    [(UILabel *)v3->_titleLabel setTextColor:v12];

    v13 = +[UIColor clearColor];
    [(UILabel *)v3->_titleLabel setBackgroundColor:v13];

    [(_CHWorkoutSummaryTabbedLabelContainer *)v3 addSubview:v3->_titleLabel];
    v14 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    totalLabel = v3->_totalLabel;
    v3->_totalLabel = v14;

    [(UILabel *)v3->_totalLabel setAdjustsFontSizeToFitWidth:1];
    v16 = +[UIFont defaultFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v3->_totalLabel setFont:v16];

    v17 = +[UIColor labelColor];
    [(UILabel *)v3->_totalLabel setTextColor:v17];

    v18 = +[UIColor clearColor];
    [(UILabel *)v3->_totalLabel setBackgroundColor:v18];

    [(_CHWorkoutSummaryTabbedLabelContainer *)v3 addSubview:v3->_totalLabel];
    v19 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    averageLabel = v3->_averageLabel;
    v3->_averageLabel = v19;

    [(UILabel *)v3->_averageLabel setAdjustsFontSizeToFitWidth:1];
    v21 = +[UIFont defaultFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v3->_averageLabel setFont:v21];

    v22 = +[UIColor labelColor];
    [(UILabel *)v3->_averageLabel setTextColor:v22];

    v23 = +[UIColor clearColor];
    [(UILabel *)v3->_averageLabel setBackgroundColor:v23];

    [(_CHWorkoutSummaryTabbedLabelContainer *)v3 addSubview:v3->_averageLabel];
  }
  return v3;
}

- (void)setTextColor:(id)a3
{
  p_textColor = &self->_textColor;
  objc_storeStrong((id *)&self->_textColor, a3);
  id v6 = a3;
  [(UILabel *)self->_totalLabel setTextColor:*p_textColor];
  [(UILabel *)self->_averageLabel setTextColor:*p_textColor];
}

- (void)setTitleText:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_titleText, a3);
  [(UILabel *)self->_titleLabel setText:self->_titleText];
  if ([(NSString *)self->_titleText length]) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 1;
  }
  [(UILabel *)self->_titleLabel setTextAlignment:v5];
}

- (void)setTotalText:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_totalText, a3);
  [(UILabel *)self->_totalLabel setText:self->_totalText];
  if ([(NSString *)self->_totalText length]) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 1;
  }
  [(UILabel *)self->_totalLabel setTextAlignment:v5];
}

- (void)setAverageText:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_averageText, a3);
  [(UILabel *)self->_averageLabel setText:self->_averageText];
  if ([(NSString *)self->_averageText length]) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 1;
  }
  [(UILabel *)self->_averageLabel setTextAlignment:v5];
}

- (void)setText:(id)a3
{
  titleLabel = self->_titleLabel;
  id v5 = a3;
  [(UILabel *)titleLabel setText:v5];
  [(UILabel *)self->_totalLabel setText:v5];
  [(UILabel *)self->_averageLabel setText:v5];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)_CHWorkoutSummaryTabbedLabelContainer;
  [(_CHWorkoutSummaryTabbedLabelContainer *)&v10 layoutSubviews];
  double v3 = sub_1001784B4() + -4.0;
  [(_CHWorkoutSummaryTabbedLabelContainer *)self bounds];
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, 0.0, v3, CGRectGetHeight(v12));
  [(UILabel *)self->_titleLabel frame];
  CGFloat v4 = CGRectGetMaxX(v13) + 4.0;
  double v5 = sub_10017851C() + -4.0;
  [(_CHWorkoutSummaryTabbedLabelContainer *)self bounds];
  -[UILabel setFrame:](self->_totalLabel, "setFrame:", v4, 0.0, v5, CGRectGetHeight(v14));
  [(UILabel *)self->_totalLabel frame];
  CGFloat v6 = CGRectGetMaxX(v15) + 4.0;
  double v7 = sub_10017851C() + -4.0;
  [(_CHWorkoutSummaryTabbedLabelContainer *)self bounds];
  -[UILabel setFrame:](self->_averageLabel, "setFrame:", v6, 0.0, v7, CGRectGetHeight(v16));
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:0] == (id)1)
  {
    totalLabel = self->_totalLabel;
    v11[0] = self->_titleLabel;
    v11[1] = totalLabel;
    v11[2] = self->_averageLabel;
    v9 = +[NSArray arrayWithObjects:v11 count:3];
    [(_CHWorkoutSummaryTabbedLabelContainer *)self ch_transformViewsForRightToLeftLanguages:v9];
  }
}

- (CGSize)intrinsicContentSize
{
  double v3 = +[UIScreen mainScreen];
  [v3 bounds];
  CGFloat v4 = CGRectGetWidth(v10) + -16.0 + -15.0;
  [(UILabel *)self->_titleLabel intrinsicContentSize];
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)sizeToFit
{
  [(_CHWorkoutSummaryTabbedLabelContainer *)self frame];
  double v4 = v3;
  double v6 = v5;
  [(_CHWorkoutSummaryTabbedLabelContainer *)self intrinsicContentSize];

  -[_CHWorkoutSummaryTabbedLabelContainer setFrame:](self, "setFrame:", v4, v6, v7, v8);
}

- (double)_firstBaselineOffsetFromTop
{
  [(UILabel *)self->_titleLabel _firstBaselineOffsetFromTop];
  return result;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)totalText
{
  return self->_totalText;
}

- (NSString)averageText
{
  return self->_averageText;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_averageText, 0);
  objc_storeStrong((id *)&self->_totalText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_averageLabel, 0);
  objc_storeStrong((id *)&self->_totalLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end