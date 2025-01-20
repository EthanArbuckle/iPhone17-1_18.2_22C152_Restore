@interface TappableDayNumber
+ (double)_yOffsetForNumber;
+ (double)firstLineBaselineOffsetForFontSize:(double)a3;
+ (id)circledFontForSize:(double)a3;
+ (id)normalFontForSize:(double)a3;
+ (id)overlayFontForSize:(double)a3;
- (BOOL)circled;
- (BOOL)isToday;
- (BOOL)isWeekend;
- (BOOL)pressed;
- (BOOL)usesRoundedRectInsteadOfCircle;
- (CGRect)contentFrame;
- (CGRect)dayCircleFrame;
- (CGRect)numberFrame;
- (CGRect)primaryNumberFrame;
- (CGSize)_cachedSizeForLabel:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)overlayText;
- (NSString)text;
- (TappableDayNumber)initWithSizeClass:(int64_t)a3;
- (UIColor)circledDefaultDayNumberColor;
- (UIColor)defaultCircleColor;
- (UIColor)todayCircleColor;
- (UIColor)weekendColor;
- (UILabel)titleLabel;
- (double)circleDiameter;
- (double)firstLineBaselineOffsetFromBoundsTop;
- (double)fontSize;
- (double)overlayFontSize;
- (double)underlineThickness;
- (id)_circledFont;
- (id)_normalFont;
- (id)_overlayFont;
- (id)_pressColor;
- (id)_textColor;
- (void)_createSubviews;
- (void)_forceLayoutIfNeeded;
- (void)_loadCircleIfNeeded;
- (void)_loadCircledNumberIfNeeded;
- (void)_loadCircledOverlayIfNeeded;
- (void)_loadOverlayIfNeeded;
- (void)_loadPressIfNeeded;
- (void)_loadUnderlineIfNeeded;
- (void)_updateCircleColor;
- (void)_updateSubviewAlpha;
- (void)_updateSubviewAlphaForCircled:(BOOL)a3 pressed:(BOOL)a4;
- (void)_updateTextColor;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setCircleDiameter:(double)a3;
- (void)setCircled:(BOOL)a3;
- (void)setCircled:(BOOL)a3 animated:(BOOL)a4;
- (void)setCircledDefaultDayNumberColor:(id)a3;
- (void)setDefaultCircleColor:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setIsToday:(BOOL)a3;
- (void)setIsWeekend:(BOOL)a3;
- (void)setNeedsDisplay;
- (void)setOverlayFontSize:(double)a3;
- (void)setOverlayText:(id)a3;
- (void)setPressed:(BOOL)a3;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4;
- (void)setText:(id)a3;
- (void)setTodayCircleColor:(id)a3;
- (void)setUnderlineThickness:(double)a3;
- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3;
- (void)setWeekendColor:(id)a3;
- (void)tintColorDidChange;
@end

@implementation TappableDayNumber

- (void)_loadCircleIfNeeded
{
  if (!self->_circle)
  {
    v3 = (DayCircleView *)objc_opt_new();
    circle = self->_circle;
    self->_circle = v3;

    double v5 = 1.0;
    if (!self->_circled) {
      double v5 = 0.0;
    }
    [(DayCircleView *)self->_circle setAlpha:v5];
    v6 = [(TappableDayNumber *)self _backgroundColor];
    [(DayCircleView *)self->_circle setBackgroundColor:v6];

    [(DayCircleView *)self->_circle setUsesRoundedRectInsteadOfCircle:[(TappableDayNumber *)self usesRoundedRectInsteadOfCircle]];
    [(TappableDayNumber *)self _updateCircleColor];
    pressCircle = self->_pressCircle;
    if (!pressCircle) {
      pressCircle = self->_number;
    }
    [(TappableDayNumber *)self insertSubview:self->_circle aboveSubview:pressCircle];
    [(TappableDayNumber *)self _loadCircledNumberIfNeeded];
    [(TappableDayNumber *)self _loadCircledOverlayIfNeeded];
  }
}

- (id)_pressColor
{
  if (self->_isToday)
  {
    v2 = CalendarAppTintColor();
    v3 = [v2 colorWithAlphaComponent:0.1];
  }
  else
  {
    v3 = +[UIColor colorWithWhite:0.0 alpha:0.1];
  }

  return v3;
}

- (void)_updateSubviewAlphaForCircled:(BOOL)a3 pressed:(BOOL)a4
{
  if (a4) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  if (a3) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  number = self->_number;
  if (a3) {
    double v8 = 1.0;
  }
  else {
    double v8 = 0.0;
  }
  if (a3) {
    double v9 = 0.0;
  }
  else {
    double v9 = v5;
  }
  -[UILabel setAlpha:](number, "setAlpha:", v6, 1.0, v5);
  [(UILabel *)self->_overlay setAlpha:v6];
  [(UIView *)self->_underline setAlpha:v6];
  [(DayCircleView *)self->_circle setAlpha:v8];
  [(UILabel *)self->_numberCircled setAlpha:v8];
  [(UILabel *)self->_overlayCircled setAlpha:v8];
  pressCircle = self->_pressCircle;

  [(DayCircleView *)pressCircle setAlpha:v9];
}

- (void)_loadCircledNumberIfNeeded
{
  if (!self->_numberCircled)
  {
    id v3 = objc_alloc((Class)UILabel);
    [(UILabel *)self->_number frame];
    v4 = [v3 initWithFrame:];
    numberCircled = self->_numberCircled;
    self->_numberCircled = v4;

    double v6 = [(TappableDayNumber *)self _circledFont];
    [(UILabel *)self->_numberCircled setFont:v6];

    [(UILabel *)self->_numberCircled setTextAlignment:1];
    v7 = +[UIColor clearColor];
    [(UILabel *)self->_numberCircled setBackgroundColor:v7];

    if (self->_isToday) {
      +[UIColor whiteColor];
    }
    else {
    double v8 = CalendarAppCircleTextColor();
    }
    [(UILabel *)self->_numberCircled setTextColor:v8];

    double v9 = 1.0;
    if (!self->_circled && !self->_pressed) {
      double v9 = 0.0;
    }
    [(UILabel *)self->_numberCircled setAlpha:v9];
    v10 = [(UILabel *)self->_number text];
    [(UILabel *)self->_numberCircled setText:v10];

    v11 = self->_numberCircled;
    [(TappableDayNumber *)self addSubview:v11];
  }
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)TappableDayNumber;
  [(TappableDayNumber *)&v3 setNeedsDisplay];
  [(DayCircleView *)self->_circle setNeedsDisplay];
}

- (CGRect)dayCircleFrame
{
  [(TappableDayNumber *)self bounds];
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  double height = v15.size.height;
  CGRectGetMidX(v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.double height = height;
  CGRectGetMidY(v16);
  if (![(TappableDayNumber *)self usesRoundedRectInsteadOfCircle])
  {
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.double height = height;
    double v7 = CGRectGetWidth(v17);
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.double height = height;
    double height = fmin(v7, CGRectGetHeight(v18));
    CGFloat width = height;
  }
  CalRoundToScreenScale();
  double v9 = v8;
  CalRoundToScreenScale();
  double v11 = v10;
  double v12 = v9;
  double v13 = width;
  double v14 = height;
  result.size.double height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)layoutSubviews
{
  self->_needsToForceLayout = 0;
  v49.receiver = self;
  v49.super_class = (Class)TappableDayNumber;
  [(TappableDayNumber *)&v49 layoutSubviews];
  [(TappableDayNumber *)self bounds];
  CGFloat x = v50.origin.x;
  CGFloat y = v50.origin.y;
  CGFloat width = v50.size.width;
  CGFloat height = v50.size.height;
  CGRectGetMidX(v50);
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  CGRectGetMidY(v51);
  CGFloat v7 = CGRectNull.origin.y;
  [(TappableDayNumber *)self _cachedSizeForLabel:self->_number];
  double v9 = v8;
  CGFloat v11 = v10;
  v52.origin.CGFloat x = CGRectNull.origin.x;
  v52.origin.CGFloat y = v7;
  v52.size.CGFloat width = v9;
  v52.size.CGFloat height = v11;
  CGRectGetWidth(v52);
  CalRoundToScreenScale();
  CGFloat v12 = v53.origin.x;
  v53.origin.CGFloat y = v7;
  v53.size.CGFloat width = v9;
  v53.size.CGFloat height = v11;
  CGRectGetHeight(v53);
  [(id)objc_opt_class() _yOffsetForNumber];
  CalRoundToScreenScale();
  double v14 = v13;
  CGFloat v48 = v7;
  if (self->_overlay)
  {
    -[TappableDayNumber _cachedSizeForLabel:](self, "_cachedSizeForLabel:");
    CGFloat v47 = v12;
    double v16 = v15;
    double v18 = v17;
    v54.origin.CGFloat x = CGRectNull.origin.x;
    v54.origin.CGFloat y = v7;
    v54.size.CGFloat width = v16;
    v54.size.CGFloat height = v18;
    CGRectGetHeight(v54);
    CalRoundToScreenScale();
    double v14 = v14 - v19;
    v55.origin.CGFloat x = CGRectNull.origin.x;
    v55.origin.CGFloat y = v7;
    v55.size.CGFloat width = v16;
    v55.size.CGFloat height = v18;
    CGRectGetWidth(v55);
    CalRoundToScreenScale();
    double v21 = v20;
    double v22 = v47;
    v56.origin.CGFloat x = v47;
    v56.origin.CGFloat y = v14;
    v56.size.CGFloat width = v9;
    v56.size.CGFloat height = v11;
    CGRectGetMaxY(v56);
    CalRoundToScreenScale();
    -[UILabel setFrame:](self->_overlay, "setFrame:", v21, v23, v16, v18);
    double v24 = v11;
    if (self->_underline)
    {
      [(UILabel *)self->_overlay frame];
      double v25 = v57.origin.x;
      double v26 = v57.size.width;
      CGRectGetMaxY(v57);
      CalRoundToScreenScale();
      double v28 = v27;
      CalRoundToScreenScale();
      -[UIView setFrame:](self->_underline, "setFrame:", v25, v28, v26, v29);
    }
  }
  else
  {
    double v22 = v12;
    double v24 = v11;
  }
  -[UILabel setFrame:](self->_number, "setFrame:", v22, v14, v9, v24, *(void *)&v47);
  if (self->_circled)
  {
    [(TappableDayNumber *)self dayCircleFrame];
    -[DayCircleView setFrame:](self->_circle, "setFrame:");
    [(UILabel *)self->_number sizeToFit];
    [(UILabel *)self->_numberCircled sizeToFit];
    [(TappableDayNumber *)self _cachedSizeForLabel:self->_numberCircled];
    double v31 = v30;
    double v33 = v32;
    v58.origin.CGFloat y = v48;
    v58.origin.CGFloat x = CGRectNull.origin.x;
    v58.size.CGFloat width = v31;
    v58.size.CGFloat height = v33;
    CGRectGetWidth(v58);
    v34 = [(UILabel *)self->_numberCircled text];
    v35 = [(UILabel *)self->_numberCircled font];
    CalOffsetToCenterNumberWithFont();
    CalRoundToScreenScale();
    double v37 = v36;

    [(UILabel *)self->_number frame];
    CGRectGetMinY(v59);
    [(UILabel *)self->_number _firstLineBaselineOffsetFromBoundsTop];
    [(UILabel *)self->_numberCircled _firstLineBaselineOffsetFromBoundsTop];
    CalRoundToScreenScale();
    CGFloat v39 = v38;
    -[UILabel setFrame:](self->_numberCircled, "setFrame:", v37, v38, v31, v33);
    if (self->_overlayCircled)
    {
      -[TappableDayNumber _cachedSizeForLabel:](self, "_cachedSizeForLabel:");
      double v41 = v40;
      double v43 = v42;
      v60.origin.CGFloat y = v48;
      v60.origin.CGFloat x = CGRectNull.origin.x;
      v60.size.CGFloat width = v41;
      v60.size.CGFloat height = v43;
      CGRectGetWidth(v60);
      CalRoundToScreenScale();
      double v45 = v44;
      v61.origin.CGFloat x = v37;
      v61.origin.CGFloat y = v39;
      v61.size.CGFloat width = v31;
      v61.size.CGFloat height = v33;
      CGRectGetMaxY(v61);
      CalRoundToScreenScale();
      -[UILabel setFrame:](self->_overlayCircled, "setFrame:", v45, v46, v41, v43);
    }
  }
}

- (CGSize)_cachedSizeForLabel:(id)a3
{
  id v3 = a3;
  if (qword_100216670 != -1) {
    dispatch_once(&qword_100216670, &stru_1001D3490);
  }
  v4 = [v3 font];
  uint64_t v5 = [v3 text];
  double v6 = (void *)v5;
  if (v4 && v5)
  {
    CGFloat v7 = [(id)qword_100216668 objectForKey:v4];
    if (!v7)
    {
      CGFloat v7 = objc_opt_new();
      [(id)qword_100216668 setObject:v7 forKey:v4];
    }
    double v8 = [v7 objectForKey:v6];
    if (!v8)
    {
      [v3 intrinsicContentSize];
      CalCeilToScreenScale();
      double v10 = v9;
      CalCeilToScreenScale();
      double v8 = +[NSValue valueWithSize:](NSValue, "valueWithSize:", v10, v11);
      [v7 setObject:v8 forKey:v6];
    }
    [v8 sizeValue];
    CGFloat width = v12;
    CGFloat height = v14;
  }
  else
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }

  double v16 = width;
  double v17 = height;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

+ (double)_yOffsetForNumber
{
  EKUIScaleFactor();
  return -1.0 / v2;
}

- (void)setUnderlineThickness:(double)a3
{
  if (self->_underlineThickness != a3)
  {
    self->_underlineThickness = a3;
    if (a3 <= 0.0)
    {
      [(UIView *)self->_underline removeFromSuperview];
      underline = self->_underline;
      self->_underline = 0;
    }
    else
    {
      [(TappableDayNumber *)self _loadUnderlineIfNeeded];
      [(TappableDayNumber *)self _updateSubviewAlpha];
      [(TappableDayNumber *)self setNeedsLayout];
      self->_needsToForceLayout = 1;
    }
    [(TappableDayNumber *)self setNeedsLayout];
    self->_needsToForceLayout = 1;
  }
}

- (void)setText:(id)a3
{
  number = self->_number;
  id v5 = a3;
  [(UILabel *)number setText:v5];
  [(UILabel *)self->_numberCircled setText:v5];

  [(TappableDayNumber *)self setNeedsLayout];
  self->_needsToForceLayout = 1;
}

- (void)setIsWeekend:(BOOL)a3
{
  if (self->_isWeekend != a3)
  {
    self->_isWeekend = a3;
    [(TappableDayNumber *)self _updateTextColor];
  }
}

- (void)_updateTextColor
{
  id v3 = [(TappableDayNumber *)self _textColor];
  [(UILabel *)self->_number setTextColor:v3];

  v4 = [(TappableDayNumber *)self _textColor];
  [(UILabel *)self->_overlay setTextColor:v4];

  if (self->_isToday)
  {
    id v5 = +[UIColor whiteColor];
    [(UILabel *)self->_numberCircled setTextColor:v5];

    id v8 = +[UIColor whiteColor];
    [(UILabel *)self->_overlayCircled setTextColor:v8];
  }
  else
  {
    [(UILabel *)self->_numberCircled setTextColor:self->_circledDefaultDayNumberColor];
    circledDefaultDayNumberColor = self->_circledDefaultDayNumberColor;
    overlayCircled = self->_overlayCircled;
    [(UILabel *)overlayCircled setTextColor:circledDefaultDayNumberColor];
  }
}

- (id)_textColor
{
  if (self->_isToday)
  {
    CalendarAppTintColor();
    double v2 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->_isWeekend)
  {
    weekendColor = self->_weekendColor;
    if (weekendColor)
    {
      double v2 = weekendColor;
    }
    else
    {
      WeekendTextColor();
      double v2 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    double v2 = +[UIColor labelColor];
  }

  return v2;
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return self->_usesRoundedRectInsteadOfCircle;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
  if (self->_usesRoundedRectInsteadOfCircle != a3)
  {
    BOOL v3 = a3;
    self->_usesRoundedRectInsteadOfCircle = a3;
    -[DayCircleView setUsesRoundedRectInsteadOfCircle:](self->_circle, "setUsesRoundedRectInsteadOfCircle:");
    pressCircle = self->_pressCircle;
    [(DayCircleView *)pressCircle setUsesRoundedRectInsteadOfCircle:v3];
  }
}

- (void)setOverlayFontSize:(double)a3
{
  if (vabdd_f64(self->_overlayFontSize, a3) >= 2.22044605e-16)
  {
    self->_overlayFontSize = a3;
    v4 = [(TappableDayNumber *)self _overlayFont];
    [(UILabel *)self->_overlay setFont:v4];

    id v5 = [(TappableDayNumber *)self _circledOverlayFont];
    [(UILabel *)self->_overlayCircled setFont:v5];
  }
}

- (void)setFontSize:(double)a3
{
  if (vabdd_f64(self->_fontSize, a3) >= 2.22044605e-16)
  {
    self->_fontSize = a3;
    v4 = [(TappableDayNumber *)self _normalFont];
    [(UILabel *)self->_number setFont:v4];

    id v5 = [(TappableDayNumber *)self _circledFont];
    [(UILabel *)self->_numberCircled setFont:v5];
  }
}

+ (id)overlayFontForSize:(double)a3
{
  if (qword_100216690 != -1) {
    dispatch_once(&qword_100216690, &stru_1001D34D0);
  }
  v4 = (void *)qword_100216688;
  id v5 = +[NSNumber numberWithDouble:a3];
  double v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    CGFloat v7 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody addingSymbolicTraits:0 options:3];
    double v6 = +[UIFont fontWithDescriptor:v7 size:a3];
    id v8 = (void *)qword_100216688;
    double v9 = +[NSNumber numberWithDouble:a3];
    [v8 setObject:v6 forKeyedSubscript:v9];
  }

  return v6;
}

+ (id)normalFontForSize:(double)a3
{
  if (qword_100216680 != -1) {
    dispatch_once(&qword_100216680, &stru_1001D34B0);
  }
  v4 = (void *)qword_100216678;
  id v5 = +[NSNumber numberWithDouble:a3];
  double v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    CGFloat v7 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody addingSymbolicTraits:0 options:3];
    double v6 = +[UIFont fontWithDescriptor:v7 size:a3];
    id v8 = (void *)qword_100216678;
    double v9 = +[NSNumber numberWithDouble:a3];
    [v8 setObject:v6 forKeyedSubscript:v9];
  }

  return v6;
}

- (void)setIsToday:(BOOL)a3
{
  if (self->_isToday != a3)
  {
    self->_isTodaCGFloat y = a3;
    v4 = [(TappableDayNumber *)self _pressColor];
    [(DayCircleView *)self->_pressCircle setColor:v4];

    [(TappableDayNumber *)self _updateCircleColor];
    [(TappableDayNumber *)self _updateTextColor];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)TappableDayNumber;
  [(TappableDayNumber *)&v3 tintColorDidChange];
  [(TappableDayNumber *)self _updateCircleColor];
}

- (TappableDayNumber)initWithSizeClass:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TappableDayNumber;
  v4 = -[TappableDayNumber initWithFrame:](&v14, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  id v5 = v4;
  if (v4)
  {
    double v6 = 18.0;
    if (a3 == 2) {
      double v6 = 17.0;
    }
    v4->_fontSize = v6;
    v4->_overlayFontSize = 10.0;
    uint64_t v7 = CalendarAppTintColor();
    todayCircleColor = v5->_todayCircleColor;
    v5->_todayCircleColor = (UIColor *)v7;

    uint64_t v9 = CalendarAppCircleNonTodayBGColor();
    defaultCircleColor = v5->_defaultCircleColor;
    v5->_defaultCircleColor = (UIColor *)v9;

    uint64_t v11 = CalendarAppCircleTextColor();
    circledDefaultDayNumberColor = v5->_circledDefaultDayNumberColor;
    v5->_circledDefaultDayNumberColor = (UIColor *)v11;

    [(TappableDayNumber *)v5 _createSubviews];
  }
  return v5;
}

- (void)_updateCircleColor
{
  if (self->_isToday) {
    double v2 = &OBJC_IVAR___TappableDayNumber__todayCircleColor;
  }
  else {
    double v2 = &OBJC_IVAR___TappableDayNumber__defaultCircleColor;
  }
  [(DayCircleView *)self->_circle setColor:*(Class *)((char *)&self->super.super.super.super.isa + *v2)];
}

- (void)_createSubviews
{
  objc_super v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  number = self->_number;
  self->_number = v3;

  id v5 = [(TappableDayNumber *)self _normalFont];
  [(UILabel *)self->_number setFont:v5];

  [(UILabel *)self->_number setTextAlignment:1];
  double v6 = +[UIColor labelColor];
  [(UILabel *)self->_number setTextColor:v6];

  uint64_t v7 = +[UIColor clearColor];
  [(UILabel *)self->_number setBackgroundColor:v7];

  id v8 = self->_number;

  [(TappableDayNumber *)self addSubview:v8];
}

- (id)_normalFont
{
  objc_super v3 = objc_opt_class();
  [(TappableDayNumber *)self fontSize];

  return [v3 normalFontForSize:];
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TappableDayNumber;
  id v4 = a3;
  [(TappableDayNumber *)&v5 setBackgroundColor:v4];
  -[DayCircleView setBackgroundColor:](self->_circle, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
  [(DayCircleView *)self->_pressCircle setBackgroundColor:v4];
}

- (void)setCircled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_circled != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_circled = a3;
    [(TappableDayNumber *)self _loadCircleIfNeeded];
    [(TappableDayNumber *)self dayCircleFrame];
    double v11 = v7;
    double v12 = v8;
    double v13 = v9;
    double v14 = v10;
    if (v4)
    {
      if (self->_circleAnimating)
      {
        double v15 = (v10 - v10 * 0.3) * 0.5;
        [(TappableDayNumber *)self _updateSubviewAlphaForCircled:v5 pressed:self->_pressed];
        circle = self->_circle;
        if (v5)
        {
          double v17 = v11;
          double v18 = v12;
          double v19 = v13;
          double v20 = v14;
        }
        else
        {
          double v17 = (v13 - v13 * 0.3) * 0.5;
          double v18 = v15;
          double v19 = v13 * 0.3;
          double v20 = v14 * 0.3;
        }
        -[DayCircleView setFrame:](circle, "setFrame:", v17, v18, v19, v20);
      }
      else
      {
        self->_circleAnimating = 1;
        double v26 = v10 * 0.3;
        double v27 = (v9 - v9 * 0.3) * 0.5;
        double v21 = (v10 - v10 * 0.3) * 0.5;
        [(TappableDayNumber *)self _updateSubviewAlphaForCircled:v5 ^ 1 pressed:self->_pressed];
        if (v5) {
          double v22 = (v13 - v13 * 0.3) * 0.5;
        }
        else {
          double v22 = v11;
        }
        if (v5) {
          double v23 = v21;
        }
        else {
          double v23 = v12;
        }
        if (v5) {
          double v24 = v13 * 0.3;
        }
        else {
          double v24 = v13;
        }
        if (v5) {
          double v25 = v26;
        }
        else {
          double v25 = v14;
        }
        -[DayCircleView setFrame:](self->_circle, "setFrame:", v22, v23, v24, v25);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10006CAD4;
        v29[3] = &unk_1001D3470;
        v29[4] = self;
        BOOL v30 = v5;
        *(double *)&v29[5] = v11;
        *(double *)&v29[6] = v12;
        *(double *)&v29[7] = v13;
        *(double *)&v29[8] = v14;
        *(double *)&v29[9] = v27;
        *(double *)&v29[10] = v21;
        *(double *)&v29[11] = v13 * 0.3;
        *(double *)&v29[12] = v26;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10006CB74;
        v28[3] = &unk_1001D27D8;
        v28[4] = self;
        +[UIView animateWithDuration:0 delay:v29 usingSpringWithDamping:v28 initialSpringVelocity:0.3 options:0.0 animations:0.9 completion:0.0];
      }
    }
    else
    {
      -[DayCircleView setFrame:](self->_circle, "setFrame:", v7, v8, v9, v10);
      [(TappableDayNumber *)self _updateSubviewAlpha];
    }
  }
}

- (void)_updateSubviewAlpha
{
}

- (void)_loadCircledOverlayIfNeeded
{
  if (!self->_overlayCircled && self->_overlay)
  {
    id v3 = objc_alloc((Class)UILabel);
    [(UILabel *)self->_overlay frame];
    BOOL v4 = [v3 initWithFrame:];
    overlayCircled = self->_overlayCircled;
    self->_overlayCircled = v4;

    double v6 = [(TappableDayNumber *)self _circledOverlayFont];
    [(UILabel *)self->_overlayCircled setFont:v6];

    [(UILabel *)self->_overlayCircled setTextAlignment:1];
    double v7 = +[UIColor clearColor];
    [(UILabel *)self->_overlayCircled setBackgroundColor:v7];

    if (self->_isToday) {
      +[UIColor whiteColor];
    }
    else {
    double v8 = CalendarAppCircleTextColor();
    }
    [(UILabel *)self->_overlayCircled setTextColor:v8];

    double v9 = 1.0;
    if (!self->_circled && !self->_pressed) {
      double v9 = 0.0;
    }
    [(UILabel *)self->_overlayCircled setAlpha:v9];
    double v10 = [(UILabel *)self->_overlay text];
    [(UILabel *)self->_overlayCircled setText:v10];

    double v11 = self->_overlayCircled;
    [(TappableDayNumber *)self addSubview:v11];
  }
}

- (id)_circledFont
{
  id v3 = objc_opt_class();
  [(TappableDayNumber *)self fontSize];

  return [v3 circledFontForSize:];
}

+ (id)circledFontForSize:(double)a3
{
  return +[UIFont boldSystemFontOfSize:a3];
}

- (UIColor)circledDefaultDayNumberColor
{
  return self->_circledDefaultDayNumberColor;
}

- (void)setCircledDefaultDayNumberColor:(id)a3
{
  objc_storeStrong((id *)&self->_circledDefaultDayNumberColor, a3);

  [(TappableDayNumber *)self _updateTextColor];
}

- (UIColor)todayCircleColor
{
  return self->_todayCircleColor;
}

- (void)setTodayCircleColor:(id)a3
{
  objc_storeStrong((id *)&self->_todayCircleColor, a3);

  [(TappableDayNumber *)self _updateCircleColor];
}

- (UIColor)defaultCircleColor
{
  return self->_defaultCircleColor;
}

- (void)setDefaultCircleColor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultCircleColor, a3);

  [(TappableDayNumber *)self _updateCircleColor];
}

- (void)_forceLayoutIfNeeded
{
  if (self->_needsToForceLayout) {
    [(TappableDayNumber *)self layoutSubviews];
  }
  else {
    [(TappableDayNumber *)self layoutIfNeeded];
  }
}

- (void)_loadPressIfNeeded
{
  if (!self->_pressCircle)
  {
    id v3 = [DayCircleView alloc];
    [(TappableDayNumber *)self bounds];
    BOOL v4 = -[DayCircleView initWithFrame:](v3, "initWithFrame:");
    pressCircle = self->_pressCircle;
    self->_pressCircle = v4;

    [(DayCircleView *)self->_pressCircle setAutoresizingMask:18];
    double v6 = [(TappableDayNumber *)self _pressColor];
    [(DayCircleView *)self->_pressCircle setColor:v6];

    double v7 = [(TappableDayNumber *)self backgroundColor];
    [(DayCircleView *)self->_pressCircle setBackgroundColor:v7];

    double v8 = 1.0;
    if (!self->_pressed) {
      double v8 = 0.0;
    }
    [(DayCircleView *)self->_pressCircle setAlpha:v8];
    [(DayCircleView *)self->_pressCircle setUsesRoundedRectInsteadOfCircle:[(TappableDayNumber *)self usesRoundedRectInsteadOfCircle]];
    [(TappableDayNumber *)self insertSubview:self->_pressCircle belowSubview:self->_number];
    [(TappableDayNumber *)self _loadCircledNumberIfNeeded];
  }
}

- (void)_loadOverlayIfNeeded
{
  if (!self->_overlay)
  {
    id v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    overlaCGFloat y = self->_overlay;
    self->_overlaCGFloat y = v3;

    BOOL v5 = [(TappableDayNumber *)self _overlayFont];
    [(UILabel *)self->_overlay setFont:v5];

    [(UILabel *)self->_overlay setTextAlignment:1];
    double v6 = +[UIColor labelColor];
    [(UILabel *)self->_overlay setTextColor:v6];

    double v7 = +[UIColor clearColor];
    [(UILabel *)self->_overlay setBackgroundColor:v7];

    double v8 = self->_overlay;
    [(TappableDayNumber *)self addSubview:v8];
  }
}

- (void)_loadUnderlineIfNeeded
{
  if (!self->_underline)
  {
    id v3 = (UIView *)objc_opt_new();
    underline = self->_underline;
    self->_underline = v3;

    BOOL v5 = CalendarAppTintColor();
    [(UIView *)self->_underline setBackgroundColor:v5];

    double v6 = self->_underline;
    [(TappableDayNumber *)self addSubview:v6];
  }
}

- (NSString)text
{
  return [(UILabel *)self->_number text];
}

- (void)setOverlayText:(id)a3
{
  id v10 = a3;
  id v4 = [(UILabel *)self->_overlay text];
  if (v4 == v10)
  {
  }
  else
  {
    BOOL v5 = [(UILabel *)self->_overlay text];
    unsigned __int8 v6 = [v10 isEqualToString:v5];

    double v7 = v10;
    if (v6) {
      goto LABEL_11;
    }
    if (v10)
    {
      [(TappableDayNumber *)self _loadOverlayIfNeeded];
      if (self->_circled) {
        [(TappableDayNumber *)self _loadCircledOverlayIfNeeded];
      }
      [(UILabel *)self->_overlay setText:v10];
      [(UILabel *)self->_overlayCircled setText:v10];
      [(TappableDayNumber *)self _updateTextColor];
    }
    else
    {
      [(UILabel *)self->_overlayCircled removeFromSuperview];
      overlayCircled = self->_overlayCircled;
      self->_overlayCircled = 0;

      [(UILabel *)self->_overlay removeFromSuperview];
      overlaCGFloat y = self->_overlay;
      self->_overlaCGFloat y = 0;
    }
    [(TappableDayNumber *)self setNeedsLayout];
    self->_needsToForceLayout = 1;
  }
  double v7 = v10;
LABEL_11:
}

- (NSString)overlayText
{
  return [(UILabel *)self->_overlay text];
}

- (void)setWeekendColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_weekendColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_weekendColor, a3);
    [(TappableDayNumber *)self _updateTextColor];
  }
}

- (void)setCircled:(BOOL)a3
{
}

- (void)setPressed:(BOOL)a3
{
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_pressed != a3)
  {
    if (a3)
    {
      [(TappableDayNumber *)self _loadPressIfNeeded];
      self->_pressed = a3;
    }
    else
    {
      self->_pressed = 0;
      if (a4)
      {
        v6[0] = _NSConcreteStackBlock;
        v6[1] = 3221225472;
        v6[2] = sub_10006CCB8;
        v6[3] = &unk_1001D2740;
        v6[4] = self;
        +[UIView animateWithDuration:327680 delay:v6 options:0 animations:0.5 completion:0.0];
LABEL_7:
        [(TappableDayNumber *)self setNeedsLayout];
        self->_needsToForceLayout = 1;
        return;
      }
    }
    [(TappableDayNumber *)self _updateSubviewAlpha];
    goto LABEL_7;
  }
}

- (CGRect)contentFrame
{
  [(TappableDayNumber *)self _forceLayoutIfNeeded];
  if (self->_circled)
  {
    [(DayCircleView *)self->_circle frame];
LABEL_7:
    CGFloat x = v3;
    CGFloat y = v4;
    CGFloat width = v5;
    CGFloat height = v6;
    goto LABEL_8;
  }
  [(UILabel *)self->_number frame];
  CGFloat x = v7;
  CGFloat y = v9;
  CGFloat width = v11;
  CGFloat height = v13;
  overlaCGFloat y = self->_overlay;
  if (overlay)
  {
    [(UILabel *)overlay frame];
    v33.origin.CGFloat x = v16;
    v33.origin.CGFloat y = v17;
    v33.size.CGFloat width = v18;
    v33.size.CGFloat height = v19;
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    CGRect v30 = CGRectUnion(v29, v33);
    CGFloat x = v30.origin.x;
    CGFloat y = v30.origin.y;
    CGFloat width = v30.size.width;
    CGFloat height = v30.size.height;
  }
  underline = self->_underline;
  if (underline)
  {
    [(UIView *)underline frame];
    v34.origin.CGFloat x = v21;
    v34.origin.CGFloat y = v22;
    v34.size.CGFloat width = v23;
    v34.size.CGFloat height = v24;
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    *(CGRect *)&CGFloat v3 = CGRectUnion(v31, v34);
    goto LABEL_7;
  }
LABEL_8:
  double v25 = x;
  double v26 = y;
  double v27 = width;
  double v28 = height;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (CGRect)numberFrame
{
  [(TappableDayNumber *)self _forceLayoutIfNeeded];
  if (self->_circled)
  {
    [(UILabel *)self->_numberCircled frame];
LABEL_7:
    CGFloat x = v3;
    CGFloat y = v4;
    CGFloat width = v5;
    CGFloat height = v6;
    goto LABEL_8;
  }
  [(UILabel *)self->_number frame];
  CGFloat x = v7;
  CGFloat y = v9;
  CGFloat width = v11;
  CGFloat height = v13;
  overlaCGFloat y = self->_overlay;
  if (overlay)
  {
    [(UILabel *)overlay frame];
    v33.origin.CGFloat x = v16;
    v33.origin.CGFloat y = v17;
    v33.size.CGFloat width = v18;
    v33.size.CGFloat height = v19;
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    CGRect v30 = CGRectUnion(v29, v33);
    CGFloat x = v30.origin.x;
    CGFloat y = v30.origin.y;
    CGFloat width = v30.size.width;
    CGFloat height = v30.size.height;
  }
  underline = self->_underline;
  if (underline)
  {
    [(UIView *)underline frame];
    v34.origin.CGFloat x = v21;
    v34.origin.CGFloat y = v22;
    v34.size.CGFloat width = v23;
    v34.size.CGFloat height = v24;
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    *(CGRect *)&CGFloat v3 = CGRectUnion(v31, v34);
    goto LABEL_7;
  }
LABEL_8:
  double v25 = x;
  double v26 = y;
  double v27 = width;
  double v28 = height;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (CGRect)primaryNumberFrame
{
  [(TappableDayNumber *)self _forceLayoutIfNeeded];
  if (self->_circled) {
    CGFloat v3 = &OBJC_IVAR___TappableDayNumber__numberCircled;
  }
  else {
    CGFloat v3 = &OBJC_IVAR___TappableDayNumber__number;
  }
  double v4 = *(Class *)((char *)&self->super.super.super.super.isa + *v3);

  [v4 frame];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (double)firstLineBaselineOffsetFromBoundsTop
{
  CGFloat v3 = [(UILabel *)self->_number text];

  if (!v3) {
    return 0.0;
  }
  [(TappableDayNumber *)self _forceLayoutIfNeeded];
  [(UILabel *)self->_number frame];
  double MinY = CGRectGetMinY(v8);
  [(UILabel *)self->_number _firstLineBaselineOffsetFromBoundsTop];
  double v6 = MinY + v5;
  [(TappableDayNumber *)self bounds];
  return v6 - CGRectGetMinY(v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_number, "sizeThatFits:", a3.width, a3.height);
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (UILabel)titleLabel
{
  unsigned int v3 = [(TappableDayNumber *)self circled];
  double v4 = &OBJC_IVAR___TappableDayNumber__number;
  if (v3) {
    double v4 = &OBJC_IVAR___TappableDayNumber__numberCircled;
  }
  double v5 = *(Class *)((char *)&self->super.super.super.super.isa + *v4);

  return (UILabel *)v5;
}

- (id)_overlayFont
{
  unsigned int v3 = objc_opt_class();
  [(TappableDayNumber *)self overlayFontSize];

  return [v3 overlayFontForSize:];
}

+ (double)firstLineBaselineOffsetForFontSize:(double)a3
{
  if (qword_1002166A0 != -1) {
    dispatch_once(&qword_1002166A0, &stru_1001D34F0);
  }
  if (vabdd_f64(*(double *)&qword_1002166A8, a3) >= 2.22044605e-16)
  {
    double v5 = [a1 normalFontForSize:a3];
    [(id)qword_100216698 setFont:v5];

    qword_1002166A8 = *(void *)&a3;
    [(id)qword_100216698 sizeToFit];
  }
  [a1 _yOffsetForNumber];
  double v7 = v6;
  [(id)qword_100216698 _firstLineBaselineOffsetFromBoundsTop];
  return v7 + v8;
}

- (double)underlineThickness
{
  return self->_underlineThickness;
}

- (UIColor)weekendColor
{
  return self->_weekendColor;
}

- (BOOL)isToday
{
  return self->_isToday;
}

- (BOOL)isWeekend
{
  return self->_isWeekend;
}

- (BOOL)circled
{
  return self->_circled;
}

- (BOOL)pressed
{
  return self->_pressed;
}

- (double)circleDiameter
{
  return self->_circleDiameter;
}

- (void)setCircleDiameter:(double)a3
{
  self->_circleDiameter = a3;
}

- (double)overlayFontSize
{
  return self->_overlayFontSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekendColor, 0);
  objc_storeStrong((id *)&self->_circledDefaultDayNumberColor, 0);
  objc_storeStrong((id *)&self->_defaultCircleColor, 0);
  objc_storeStrong((id *)&self->_todayCircleColor, 0);
  objc_storeStrong((id *)&self->_underline, 0);
  objc_storeStrong((id *)&self->_pressCircle, 0);
  objc_storeStrong((id *)&self->_circle, 0);
  objc_storeStrong((id *)&self->_overlayCircled, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_numberCircled, 0);

  objc_storeStrong((id *)&self->_number, 0);
}

@end