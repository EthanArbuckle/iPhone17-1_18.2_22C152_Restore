@interface YearMonthTransitionMonthView
- (BOOL)hasValidOrigin;
- (CGRect)_adjustFrame:(CGRect)a3;
- (CGRect)monthFrame;
- (CGRect)monthFrameInMonthView;
- (CGRect)monthLabelFrame;
- (NSArray)weekViews;
- (NSString)monthLabelText;
- (UIColor)monthLabelColor;
- (UILabel)monthLabel;
- (double)topInset;
- (void)setHasValidOrigin:(BOOL)a3;
- (void)setMonthLabel:(id)a3;
- (void)setTopInset:(double)a3;
- (void)setWeekViews:(id)a3;
@end

@implementation YearMonthTransitionMonthView

- (CGRect)monthFrame
{
  [(YearMonthTransitionMonthView *)self frame];

  -[YearMonthTransitionMonthView _adjustFrame:](self, "_adjustFrame:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)monthFrameInMonthView
{
  [(YearMonthTransitionMonthView *)self bounds];

  -[YearMonthTransitionMonthView _adjustFrame:](self, "_adjustFrame:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_adjustFrame:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  +[YearMonthTransitionView _monthHeaderHeight];
  double v8 = y + v7 + -8.0;
  double v9 = height - v7 + -4.0;
  double v10 = x;
  double v11 = width;
  result.size.double height = v9;
  result.size.CGFloat width = v11;
  result.origin.double y = v8;
  result.origin.CGFloat x = v10;
  return result;
}

- (CGRect)monthLabelFrame
{
  double v3 = [(YearMonthTransitionMonthView *)self weekViews];
  double v4 = [v3 objectAtIndex:0];

  double v5 = [(YearMonthTransitionMonthView *)self monthLabel];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[YearMonthTransitionMonthView convertRect:fromView:](self, "convertRect:fromView:", v4, v7, v9, v11, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.CGFloat width = v24;
  result.origin.double y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (NSString)monthLabelText
{
  v2 = [(YearMonthTransitionMonthView *)self monthLabel];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (UIColor)monthLabelColor
{
  v2 = [(YearMonthTransitionMonthView *)self monthLabel];
  double v3 = [v2 textColor];

  return (UIColor *)v3;
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

- (BOOL)hasValidOrigin
{
  return self->_hasValidOrigin;
}

- (void)setHasValidOrigin:(BOOL)a3
{
  self->_hasValidOrigin = a3;
}

- (UILabel)monthLabel
{
  return self->_monthLabel;
}

- (void)setMonthLabel:(id)a3
{
}

- (NSArray)weekViews
{
  return self->_weekViews;
}

- (void)setWeekViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekViews, 0);

  objc_storeStrong((id *)&self->_monthLabel, 0);
}

@end