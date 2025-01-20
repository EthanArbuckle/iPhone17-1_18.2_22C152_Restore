@interface CompactMonthWeekTodayCircle
+ (CGSize)roundedRectSizeForNumberString:(id)a3 overlayString:(id)a4 fontSize:(double)a5 overlayFontSize:(double)a6;
+ (double)circleDiameter;
+ (double)circleDiameterCompressed;
+ (double)circleDiameterWithOverlayLarge;
+ (double)roundedRectDayNumberBaselineOffsetWithOverlay:(BOOL)a3 fontSize:(double)a4 overlayFontSize:(double)a5;
+ (double)roundedRectHeightWithOverlay:(BOOL)a3 fontSize:(double)a4 overlayFontSize:(double)a5;
+ (double)topOffset;
+ (id)dayNumberFontForSize:(double)a3;
+ (id)dayOverlayFontForSize:(double)a3;
- (BOOL)compressed;
- (BOOL)drawCircle;
- (BOOL)showOverlay;
- (BOOL)useTodayColors;
- (BOOL)usesRoundedRectInsteadOfCircle;
- (CGRect)dayNumberFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CompactMonthWeekTodayCircle)initWithCalendarDate:(id)a3;
- (UIColor)nonTodayCircleColor;
- (UIColor)nonTodayColor;
- (UIFont)fontOverride;
- (double)fontSize;
- (double)overlayFontSize;
- (id)_dayNumberFontForSize:(double)a3;
- (id)backgroundColor;
- (id)dayNumberString;
- (id)overlayString;
- (void)_updateTextColor;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setCompressed:(BOOL)a3;
- (void)setDrawCircle:(BOOL)a3;
- (void)setFontOverride:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setNonTodayCircleColor:(id)a3;
- (void)setNonTodayColor:(id)a3;
- (void)setOverlayFontSize:(double)a3;
- (void)setShowOverlay:(BOOL)a3;
- (void)setUseTodayColors:(BOOL)a3;
- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3;
- (void)updateOverlay;
@end

@implementation CompactMonthWeekTodayCircle

- (CompactMonthWeekTodayCircle)initWithCalendarDate:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CompactMonthWeekTodayCircle;
  v6 = [(CompactMonthWeekTodayCircle *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_calendarDate, a3);
    v7->_day = (unint64_t)[v5 day];
    uint64_t v8 = CUIKLocalizedStringForInteger();
    dayString = v7->_dayString;
    v7->_dayString = (NSString *)v8;

    v7->_drawCircle = 1;
    v7->_useTodayColors = 1;
    v7->_showOverlay = 0;
    v7->_fontSize = 18.0;
    v7->_overlayFontSize = 10.0;
    uint64_t v10 = CalendarAppCircleNonTodayBGColor();
    nonTodayCircleColor = v7->_nonTodayCircleColor;
    v7->_nonTodayCircleColor = (UIColor *)v10;

    v12 = (UILabel *)objc_alloc_init((Class)UILabel);
    dayLabel = v7->_dayLabel;
    v7->_dayLabel = v12;

    [(CompactMonthWeekTodayCircle *)v7 fontSize];
    v14 = -[CompactMonthWeekTodayCircle _dayNumberFontForSize:](v7, "_dayNumberFontForSize:");
    [(UILabel *)v7->_dayLabel setFont:v14];

    v15 = +[UIColor clearColor];
    [(UILabel *)v7->_dayLabel setBackgroundColor:v15];

    v16 = +[UIColor whiteColor];
    [(UILabel *)v7->_dayLabel setTextColor:v16];

    [(UILabel *)v7->_dayLabel setText:v7->_dayString];
    [(UILabel *)v7->_dayLabel sizeToFit];
    [(CompactMonthWeekTodayCircle *)v7 addSubview:v7->_dayLabel];
    v17 = +[UIColor whiteColor];
    [(CompactMonthWeekTodayCircle *)v7 setBackgroundColor:v17];

    [(CompactMonthWeekTodayCircle *)v7 setUserInteractionEnabled:0];
  }

  return v7;
}

+ (double)circleDiameter
{
  return 40.0;
}

+ (double)circleDiameterCompressed
{
  return 30.0;
}

+ (double)circleDiameterWithOverlayLarge
{
  return 41.0;
}

+ (double)roundedRectHeightWithOverlay:(BOOL)a3 fontSize:(double)a4 overlayFontSize:(double)a5
{
  CalRoundToScreenScale();
  return result;
}

+ (CGSize)roundedRectSizeForNumberString:(id)a3 overlayString:(id)a4 fontSize:(double)a5 overlayFontSize:(double)a6
{
  id v10 = a4;
  id v11 = a3;
  CalRoundToScreenScale();
  double v13 = v12;
  NSAttributedStringKey v28 = NSFontAttributeName;
  v14 = [a1 dayNumberFontForSize:a5];
  v29 = v14;
  v15 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  [v11 sizeWithAttributes:v15];

  CalRoundToScreenScale();
  double v17 = v16 + 10.0;
  if (v17 >= v13) {
    double v13 = v17;
  }
  if (v10)
  {
    NSAttributedStringKey v26 = NSFontAttributeName;
    v18 = [a1 dayOverlayFontForSize:a6];
    v27 = v18;
    objc_super v19 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [v10 sizeWithAttributes:v19];

    CalRoundToScreenScale();
    double v21 = v20 + 10.0;
    if (v21 >= v13) {
      double v13 = v21;
    }
  }
  [a1 roundedRectHeightWithOverlay:v10 != 0 fontSize:a5 overlayFontSize:a6];
  double v23 = v22;

  double v24 = v13;
  double v25 = v23;
  result.height = v25;
  result.width = v24;
  return result;
}

- (id)dayNumberString
{
  return self->_dayString;
}

- (id)overlayString
{
  return [(UILabel *)self->_overlayLabel text];
}

- (CGRect)dayNumberFrame
{
  [(UILabel *)self->_dayLabel frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

+ (double)topOffset
{
  return 7.0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if ([(CompactMonthWeekTodayCircle *)self usesRoundedRectInsteadOfCircle])
  {
    double v4 = objc_opt_class();
    dayString = self->_dayString;
    v6 = [(UILabel *)self->_overlayLabel text];
    [(CompactMonthWeekTodayCircle *)self fontSize];
    double v8 = v7;
    [(CompactMonthWeekTodayCircle *)self overlayFontSize];
    [v4 roundedRectSizeForNumberString:dayString overlayString:v6 fontSize:v8 overlayFontSize:v9];
    double v11 = v10;
    double v13 = v12;

    double v14 = v11;
    double v15 = v13;
  }
  else
  {
    if (self->_showOverlay)
    {
      if ([(NSString *)self->_dayString length] <= 1
        && ([(UILabel *)self->_overlayLabel text],
            double v16 = objc_claimAutoreleasedReturnValue(),
            id v17 = [v16 length],
            v16,
            (unint64_t)v17 < 3))
      {
        [(id)objc_opt_class() circleDiameterWithOverlay];
      }
      else
      {
        [(id)objc_opt_class() circleDiameterWithOverlayLarge];
      }
    }
    else
    {
      BOOL compressed = self->_compressed;
      objc_super v19 = objc_opt_class();
      if (compressed) {
        [v19 circleDiameterCompressed];
      }
      else {
        [v19 circleDiameter];
      }
    }
    double v15 = v14;
  }
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setUseTodayColors:(BOOL)a3
{
  if (self->_useTodayColors != a3)
  {
    self->_useTodayColors = a3;
    [(CompactMonthWeekTodayCircle *)self fontSize];
    double v4 = -[CompactMonthWeekTodayCircle _dayNumberFontForSize:](self, "_dayNumberFontForSize:");
    [(UILabel *)self->_dayLabel setFont:v4];

    [(CompactMonthWeekTodayCircle *)self _updateTextColor];
    [(CompactMonthWeekTodayCircle *)self setNeedsDisplay];
  }
}

- (void)setFontOverride:(id)a3
{
  double v5 = (UIFont *)a3;
  p_fontOverride = &self->_fontOverride;
  if (self->_fontOverride != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)p_fontOverride, a3);
    [(CompactMonthWeekTodayCircle *)self fontSize];
    double v7 = -[CompactMonthWeekTodayCircle _dayNumberFontForSize:](self, "_dayNumberFontForSize:");
    [(UILabel *)self->_dayLabel setFont:v7];

    p_fontOverride = (UIFont **)[(CompactMonthWeekTodayCircle *)self setNeedsDisplay];
    double v5 = v8;
  }

  _objc_release_x1(p_fontOverride, v5);
}

- (void)setDrawCircle:(BOOL)a3
{
  if (self->_drawCircle != a3)
  {
    self->_drawCircle = a3;
    [(CompactMonthWeekTodayCircle *)self _updateTextColor];
    [(CompactMonthWeekTodayCircle *)self setNeedsDisplay];
  }
}

- (void)setShowOverlay:(BOOL)a3
{
  if (self->_showOverlay != a3)
  {
    self->_showOverlay = a3;
    if (a3)
    {
      double v4 = (UILabel *)objc_alloc_init((Class)UILabel);
      overlayLabel = self->_overlayLabel;
      self->_overlayLabel = v4;

      v6 = objc_opt_class();
      [(CompactMonthWeekTodayCircle *)self overlayFontSize];
      double v7 = [v6 dayOverlayFontForSize:];
      [(UILabel *)self->_overlayLabel setFont:v7];

      double v8 = +[UIColor clearColor];
      [(UILabel *)self->_overlayLabel setBackgroundColor:v8];

      double v9 = [(EKCalendarDate *)self->_calendarDate date];
      double v10 = CUIKGetOverlayCalendar();
      double v11 = +[CUIKDateStrings overlayShortStringForDate:v9 inCalendar:v10];
      [(UILabel *)self->_overlayLabel setText:v11];

      [(UILabel *)self->_overlayLabel sizeToFit];
      [(CompactMonthWeekTodayCircle *)self addSubview:self->_overlayLabel];
      [(CompactMonthWeekTodayCircle *)self _updateTextColor];
    }
    else
    {
      [(UILabel *)self->_overlayLabel removeFromSuperview];
      double v12 = self->_overlayLabel;
      self->_overlayLabel = 0;
    }
    [(CompactMonthWeekTodayCircle *)self setNeedsDisplay];
  }
}

- (void)updateOverlay
{
  if (self->_showOverlay)
  {
    double v3 = [(EKCalendarDate *)self->_calendarDate date];
    double v4 = CUIKGetOverlayCalendar();
    double v5 = +[CUIKDateStrings overlayShortStringForDate:v3 inCalendar:v4];
    [(UILabel *)self->_overlayLabel setText:v5];

    [(UILabel *)self->_overlayLabel sizeToFit];
    [(CompactMonthWeekTodayCircle *)self setNeedsLayout];
  }
}

- (void)setNonTodayColor:(id)a3
{
  objc_storeStrong((id *)&self->_nonTodayColor, a3);

  [(CompactMonthWeekTodayCircle *)self _updateTextColor];
}

- (void)setFontSize:(double)a3
{
  if (vabdd_f64(self->_fontSize, a3) >= 2.22044605e-16)
  {
    self->_fontSize = a3;
    double v4 = -[CompactMonthWeekTodayCircle _dayNumberFontForSize:](self, "_dayNumberFontForSize:");
    [(UILabel *)self->_dayLabel setFont:v4];

    dayLabel = self->_dayLabel;
    [(UILabel *)dayLabel sizeToFit];
  }
}

- (void)setOverlayFontSize:(double)a3
{
  if (vabdd_f64(self->_overlayFontSize, a3) >= 2.22044605e-16)
  {
    self->_overlayFontSize = a3;
    double v4 = [(id)objc_opt_class() dayOverlayFontForSize:a3];
    [(UILabel *)self->_overlayLabel setFont:v4];

    overlayLabel = self->_overlayLabel;
    [(UILabel *)overlayLabel sizeToFit];
  }
}

- (void)_updateTextColor
{
  if (self->_drawCircle
    && ([(CompactMonthWeekTodayCircle *)self nonTodayColor],
        double v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    if ([(CompactMonthWeekTodayCircle *)self useTodayColors]) {
      +[UIColor whiteColor];
    }
    else {
    uint64_t v7 = CalendarAppCircleTextColor();
    }
  }
  else
  {
    if (![(CompactMonthWeekTodayCircle *)self useTodayColors])
    {
      uint64_t v4 = [(CompactMonthWeekTodayCircle *)self nonTodayColor];
      if (v4)
      {
        double v5 = (void *)v4;
        id v8 = [(CompactMonthWeekTodayCircle *)self nonTodayColor];

        id v6 = v8;
        goto LABEL_8;
      }
    }
    uint64_t v7 = CalendarAppTintColor();
  }
  id v6 = (id)v7;
LABEL_8:
  id v9 = v6;
  [(UILabel *)self->_dayLabel setTextColor:v6];
  [(UILabel *)self->_overlayLabel setTextColor:v9];
}

- (id)_dayNumberFontForSize:(double)a3
{
  double v5 = [(CompactMonthWeekTodayCircle *)self fontOverride];

  if (v5)
  {
    id v6 = [(CompactMonthWeekTodayCircle *)self fontOverride];
    uint64_t v7 = [v6 fontDescriptor];
    id v8 = +[UIFont fontWithDescriptor:v7 size:a3];
  }
  else
  {
    id v8 = +[UIFont systemFontOfSize:a3 weight:UIFontWeightBold];
  }

  return v8;
}

+ (id)dayNumberFontForSize:(double)a3
{
  return +[UIFont systemFontOfSize:a3 weight:UIFontWeightBold];
}

+ (id)dayOverlayFontForSize:(double)a3
{
  return +[UIFont systemFontOfSize:a3 weight:UIFontWeightBold];
}

+ (double)roundedRectDayNumberBaselineOffsetWithOverlay:(BOOL)a3 fontSize:(double)a4 overlayFontSize:(double)a5
{
  BOOL v7 = a3;
  if (qword_100216798 != -1) {
    dispatch_once(&qword_100216798, &stru_1001D4900);
  }
  id v9 = [a1 dayNumberFontForSize:a4];
  [(id)qword_100216788 setFont:v9];

  [(id)qword_100216788 sizeToFit];
  [a1 roundedRectHeightWithOverlay:v7 fontSize:a4 overlayFontSize:a5];
  [(id)qword_100216788 frame];
  CGRectGetHeight(v13);
  CalRoundToScreenScale();
  if (v7)
  {
    double v10 = [a1 dayOverlayFontForSize:a5];
    [(id)qword_100216790 setFont:v10];

    [(id)qword_100216790 sizeToFit];
    [(id)qword_100216790 frame];
    CGRectGetHeight(v14);
  }
  [(id)qword_100216788 _firstLineBaselineOffsetFromBoundsTop];

  CalRoundToScreenScale();
  return result;
}

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)CompactMonthWeekTodayCircle;
  [(CompactMonthWeekTodayCircle *)&v39 layoutSubviews];
  [(CompactMonthWeekTodayCircle *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat rect = v7;
  CGFloat v10 = v9;
  [(UILabel *)self->_dayLabel frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v40.origin.CGFloat x = v4;
  v40.origin.CGFloat y = v6;
  v40.size.width = v8;
  v40.size.CGFloat height = v10;
  double Width = CGRectGetWidth(v40);
  v41.origin.CGFloat x = v12;
  v41.origin.CGFloat y = v14;
  v41.size.width = v16;
  v41.size.CGFloat height = v18;
  double v20 = (Width - CGRectGetWidth(v41)) * 0.5;
  [(CompactMonthWeekTodayCircle *)self fontSize];
  double v21 = -[CompactMonthWeekTodayCircle _dayNumberFontForSize:](self, "_dayNumberFontForSize:");
  CalOffsetToCenterNumberWithFont();
  double v23 = v20 + v22;
  CGFloat v36 = v4;
  CGFloat v37 = v10;
  v42.origin.CGFloat x = v4;
  CGFloat v24 = v6;
  v42.origin.CGFloat y = v6;
  v42.size.width = rect;
  v42.size.CGFloat height = v10;
  CGFloat v25 = v18;
  CGRectGetMidY(v42);
  v43.origin.CGFloat x = v23;
  v43.origin.CGFloat y = v14;
  double v26 = v16;
  v43.size.width = v16;
  v43.size.CGFloat height = v18;
  CGRectGetHeight(v43);
  CalRoundToScreenScale();
  double v28 = v27 + -0.5;
  overlayLabel = self->_overlayLabel;
  if (overlayLabel)
  {
    [(UILabel *)overlayLabel frame];
    CGFloat x = v44.origin.x;
    CGFloat y = v44.origin.y;
    CGFloat v35 = v26;
    CGFloat v32 = v44.size.width;
    CGFloat height = v44.size.height;
    CGFloat v34 = v28 - ((CGRectGetHeight(v44) + -3.5) * 0.5 + 1.5);
    v45.origin.CGFloat x = v36;
    v45.size.CGFloat height = v37;
    v45.origin.CGFloat y = v24;
    v45.size.width = rect;
    CGRectGetMidX(v45);
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.width = v32;
    v46.size.CGFloat height = height;
    CGRectGetWidth(v46);
    v47.origin.CGFloat x = v23;
    v47.origin.CGFloat y = v34;
    v47.size.width = v35;
    v47.size.CGFloat height = v25;
    CGRectGetMaxY(v47);
    CalRoundRectToScreenScale();
    -[UILabel setFrame:](self->_overlayLabel, "setFrame:");
  }
  CalRoundRectToScreenScale();
  -[UILabel setFrame:](self->_dayLabel, "setFrame:");
}

- (id)backgroundColor
{
  return +[UIColor whiteColor];
}

- (void)drawRect:(CGRect)a3
{
  if ([(CompactMonthWeekTodayCircle *)self drawCircle])
  {
    if ([(CompactMonthWeekTodayCircle *)self useTodayColors]) {
      CalendarAppTintColor();
    }
    else {
    CGFloat v4 = [(CompactMonthWeekTodayCircle *)self nonTodayCircleColor];
    }
    [v4 setFill];

    CurrentContext = UIGraphicsGetCurrentContext();
    [(CompactMonthWeekTodayCircle *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    if ([(CompactMonthWeekTodayCircle *)self usesRoundedRectInsteadOfCircle])
    {
      +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v7, v9, v11, v13, EKUILargeTextRoundedRectCornerRadius);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      [v16 fill];
    }
    else
    {
      EKUIScaleFactor();
      CGFloat v15 = 1.0 / v14;
      v18.origin.CGFloat x = v7;
      v18.origin.CGFloat y = v9;
      v18.size.width = v11;
      v18.size.CGFloat height = v13;
      CGRect v19 = CGRectInset(v18, v15, v15);
      CGContextFillEllipseInRect(CurrentContext, v19);
    }
  }
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_BOOL compressed = a3;
}

- (BOOL)drawCircle
{
  return self->_drawCircle;
}

- (BOOL)useTodayColors
{
  return self->_useTodayColors;
}

- (BOOL)showOverlay
{
  return self->_showOverlay;
}

- (UIColor)nonTodayColor
{
  return self->_nonTodayColor;
}

- (UIColor)nonTodayCircleColor
{
  return self->_nonTodayCircleColor;
}

- (void)setNonTodayCircleColor:(id)a3
{
}

- (UIFont)fontOverride
{
  return self->_fontOverride;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (double)overlayFontSize
{
  return self->_overlayFontSize;
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return self->_usesRoundedRectInsteadOfCircle;
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
  self->_usesRoundedRectInsteadOfCircle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontOverride, 0);
  objc_storeStrong((id *)&self->_nonTodayCircleColor, 0);
  objc_storeStrong((id *)&self->_nonTodayColor, 0);
  objc_storeStrong((id *)&self->_overlayLabel, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_dayString, 0);

  objc_storeStrong((id *)&self->_calendarDate, 0);
}

@end