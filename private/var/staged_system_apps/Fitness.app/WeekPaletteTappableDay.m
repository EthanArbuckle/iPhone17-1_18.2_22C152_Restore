@interface WeekPaletteTappableDay
- (UILabel)weekDayLabel;
- (UIView)circle;
- (WeekPaletteTappableDay)init;
- (int64_t)index;
- (void)layoutSubviews;
- (void)setCircle:(id)a3;
- (void)setCircleHidden:(BOOL)a3 updateCircleColor:(BOOL)a4;
- (void)setFont:(id)a3 textColor:(id)a4;
- (void)setIndex:(int64_t)a3;
- (void)setTextColorHighlighted:(BOOL)a3;
- (void)setWeekDayLabel:(id)a3;
@end

@implementation WeekPaletteTappableDay

- (WeekPaletteTappableDay)init
{
  v12.receiver = self;
  v12.super_class = (Class)WeekPaletteTappableDay;
  v2 = [(WeekPaletteTappableDay *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
    circle = v2->_circle;
    v2->_circle = v7;

    [(UIView *)v2->_circle setAlpha:0.0];
    [(WeekPaletteTappableDay *)v2 addSubview:v2->_circle];
    v9 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    weekDayLabel = v2->_weekDayLabel;
    v2->_weekDayLabel = v9;

    [(UILabel *)v2->_weekDayLabel setTextAlignment:1];
    [(WeekPaletteTappableDay *)v2 addSubview:v2->_weekDayLabel];
  }
  return v2;
}

- (void)setFont:(id)a3 textColor:(id)a4
{
  v6 = (UIFont *)a3;
  v7 = (UIColor *)a4;
  dayFont = self->_dayFont;
  self->_dayFont = v6;
  v11 = v6;

  dayTextColor = self->_dayTextColor;
  self->_dayTextColor = v7;
  v10 = v7;

  [(UILabel *)self->_weekDayLabel setFont:v11];
  [(UILabel *)self->_weekDayLabel setTextColor:v10];
}

- (void)setTextColorHighlighted:(BOOL)a3
{
  if (a3)
  {
    v4 = +[ARUIMetricColors energyColors];
    v5 = [v4 nonGradientTextColor];
    v6 = [v5 colorWithAlphaComponent:0.99];
  }
  else
  {
    v6 = self->_dayTextColor;
  }
  [(UILabel *)self->_weekDayLabel setTextColor:v6];
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)WeekPaletteTappableDay;
  [(WeekPaletteTappableDay *)&v23 layoutSubviews];
  [(WeekPaletteTappableDay *)self bounds];
  double v4 = v3;
  [(WeekPaletteTappableDay *)self bounds];
  if (vabdd_f64(v4, v5) >= 2.0)
  {
    v10 = [(UIView *)self->_circle layer];
    [v10 setCornerRadius:8.0];

    [(WeekPaletteTappableDay *)self bounds];
    -[UIView setFrame:](self->_circle, "setFrame:");
    [(WeekPaletteTappableDay *)self bounds];
    double MidX = CGRectGetMidX(v26);
    [(WeekPaletteTappableDay *)self bounds];
    -[UIView setCenter:](self->_circle, "setCenter:", MidX, CGRectGetMidY(v27));
  }
  else
  {
    [(WeekPaletteTappableDay *)self bounds];
    double v7 = v6;
    double v8 = v6 * 0.5;
    v9 = [(UIView *)self->_circle layer];
    [v9 setCornerRadius:v8];

    -[UIView setFrame:](self->_circle, "setFrame:", 0.0, 0.0, v7, v7);
  }
  id v12 = objc_alloc((Class)NSAttributedString);
  v13 = [(UILabel *)self->_weekDayLabel text];
  dayFont = self->_dayFont;
  NSAttributedStringKey v24 = NSFontAttributeName;
  v25 = dayFont;
  v15 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  id v16 = [v12 initWithString:v13 attributes:v15];

  [(WeekPaletteTappableDay *)self bounds];
  [v16 boundingRectWithSize:0 options:0 context:v17];
  CGRect v29 = CGRectIntegral(v28);
  double width = v29.size.width;
  double height = v29.size.height;
  [(WeekPaletteTappableDay *)self bounds];
  UIRoundToViewScale();
  double v21 = v20;
  [(WeekPaletteTappableDay *)self bounds];
  UIRoundToViewScale();
  -[UILabel setFrame:](self->_weekDayLabel, "setFrame:", v21, v22, width, height);
}

- (void)setCircleHidden:(BOOL)a3 updateCircleColor:(BOOL)a4
{
  BOOL v5 = a3;
  if (a3) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  double v8 = [(WeekPaletteTappableDay *)self circle];
  [v8 setAlpha:v7];

  if (a4)
  {
    v9 = +[ARUIMetricColors energyColors];
    id v13 = [v9 nonGradientTextColor];

    uint64_t v10 = (uint64_t)v13;
  }
  else
  {
    uint64_t v10 = +[UIColor secondaryLabelColor];
  }
  id v14 = (id)v10;
  [(UIView *)self->_circle setBackgroundColor:v10];
  if (v5)
  {
    v11 = self->_dayTextColor;
  }
  else
  {
    v11 = +[UIColor colorWithWhite:1.0 alpha:0.99];
  }
  id v12 = v11;
  [(UILabel *)self->_weekDayLabel setTextColor:v11];
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (UIView)circle
{
  return self->_circle;
}

- (void)setCircle:(id)a3
{
}

- (UILabel)weekDayLabel
{
  return self->_weekDayLabel;
}

- (void)setWeekDayLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekDayLabel, 0);
  objc_storeStrong((id *)&self->_circle, 0);
  objc_storeStrong((id *)&self->_dayTextColor, 0);

  objc_storeStrong((id *)&self->_dayFont, 0);
}

@end