@interface WeekDayInitialsHeaderView
+ (id)dayInitialFont;
- (BOOL)useCustomDayFrames;
- (WeekDayInitialsHeaderView)initWithFrame:(CGRect)a3;
- (double)bottomPadding;
- (double)dayFrameRightInset;
- (id)_automaticDayFrames;
- (id)dayFrames;
- (id)weekdayAbbreviations;
- (int64_t)dayInitialTextAlignment;
- (void)drawRect:(CGRect)a3;
- (void)setDayFrames:(id)a3;
- (void)setUseCustomDayFrames:(BOOL)a3;
@end

@implementation WeekDayInitialsHeaderView

- (WeekDayInitialsHeaderView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WeekDayInitialsHeaderView;
  v3 = -[WeekDayInitialsHeaderView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(WeekDayInitialsHeaderView *)v3 setOpaque:0];
    [(WeekDayInitialsHeaderView *)v4 setClearsContextBeforeDrawing:1];
    v5 = [(WeekDayInitialsHeaderView *)v4 layer];
    [v5 setValue:&__kCFBooleanTrue forKeyPath:@"separatedOptions.enableContext"];
    [v5 setNeedsDisplay];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  v36 = [(WeekDayInitialsHeaderView *)self weekdayAbbreviations];
  v4 = [(id)objc_opt_class() dayInitialFont];
  v34 = +[UIColor labelColor];
  v33 = WeekendTextColor();
  v5 = [(WeekDayInitialsHeaderView *)self dayFrames];
  [v4 lineHeight];
  CalCeilToScreenScale();
  double v7 = v6;
  v35 = v4;
  [v4 descender];
  int64_t v8 = [(WeekDayInitialsHeaderView *)self dayInitialTextAlignment];
  id v32 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v32 setAlignment:v8];
  uint64_t v9 = CUIKZeroIndexedWeekStart();
  if (CalTimeDirectionIsLeftToRight())
  {
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v9 = ((uint64_t)[v5 count] + v9 - 1) % 7;
    uint64_t v10 = -1;
  }
  uint64_t v31 = v10;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  id v11 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v30 = *(void *)v38;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v15 = [v36 objectAtIndexedSubscript:v9];
        int IsWeekend = CUIKDayOfWeekIsWeekend();
        v17 = v34;
        if (IsWeekend) {
          v17 = v33;
        }
        v41[0] = NSFontAttributeName;
        v41[1] = NSForegroundColorAttributeName;
        v42[0] = v35;
        v42[1] = v17;
        v41[2] = NSParagraphStyleAttributeName;
        v42[2] = v32;
        id v18 = v17;
        v19 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];
        id v20 = [objc_alloc((Class)NSAttributedString) initWithString:v15 attributes:v19];
        [v14 CGRectValue];
        double v22 = v21;
        CGFloat v24 = v23;
        double v26 = v25;

        [(WeekDayInitialsHeaderView *)self bounds];
        CGRectGetMaxY(v44);
        [(WeekDayInitialsHeaderView *)self bottomPadding];
        v45.origin.x = v22;
        v45.origin.y = v24;
        v45.size.width = v26;
        v45.size.height = v7;
        CGRectGetHeight(v45);
        CalRoundToScreenScale();
        [v20 drawInRect:v22, v27, v26, v7];
        uint64_t v28 = v9 + v31;
        if (v9 + v31 < 0) {
          v28 += (uint64_t)[obj count];
        }
        uint64_t v9 = v28 % 7;
      }
      id v12 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v12);
  }
}

- (void)setDayFrames:(id)a3
{
  id v18 = a3;
  self->_useCustomDayFrames = 1;
  v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v18 count]];
  if ([v18 count])
  {
    unint64_t v5 = 0;
    do
    {
      double v6 = [v18 objectAtIndexedSubscript:v5];
      [v6 CGRectValue];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      [(WeekDayInitialsHeaderView *)self dayFrameRightInset];
      v16 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v8, v10, v12 - v15, v14);
      [(NSArray *)v4 addObject:v16];

      ++v5;
    }
    while (v5 < (unint64_t)[v18 count]);
  }
  dayFrames = self->_dayFrames;
  self->_dayFrames = v4;

  [(WeekDayInitialsHeaderView *)self setNeedsDisplay];
}

- (double)dayFrameRightInset
{
  return 0.0;
}

- (id)weekdayAbbreviations
{
  v2 = +[NSLocale currentLocale];
  v3 = [v2 localeIdentifier];
  unsigned int v4 = [v3 hasPrefix:@"ar"];

  if (v4) {
    CUIKWeekdayAbbreviations();
  }
  else {
  unint64_t v5 = CUIKWeekdayVeryShortAbbreviations();
  }

  return v5;
}

- (int64_t)dayInitialTextAlignment
{
  return 1;
}

- (id)dayFrames
{
  if (self->_useCustomDayFrames)
  {
    v2 = self->_dayFrames;
  }
  else
  {
    v2 = [(WeekDayInitialsHeaderView *)self _automaticDayFrames];
  }

  return v2;
}

- (void)setUseCustomDayFrames:(BOOL)a3
{
  self->_useCustomDayFrames = a3;
  [(WeekDayInitialsHeaderView *)self setNeedsDisplay];
}

- (double)bottomPadding
{
  return 7.0;
}

- (id)_automaticDayFrames
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:7];
  unsigned int v4 = [(WeekDayInitialsHeaderView *)self weekdayAbbreviations];
  unint64_t v5 = (char *)[v4 count];

  [(WeekDayInitialsHeaderView *)self bounds];
  if (v5)
  {
    double v7 = (v6 + -1.0) / (double)(unint64_t)v5;
    double v8 = 0.5;
    do
    {
      [(WeekDayInitialsHeaderView *)self bounds];
      double v10 = v9;
      double v12 = v11;
      CalRoundToScreenScale();
      double v14 = v13;
      CalFloorToScreenScale();
      CalRoundToScreenScale();
      v16 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v14, v10, v15, v12);
      [v3 addObject:v16];

      double v8 = v7 + v8;
      --v5;
    }
    while (v5);
  }

  return v3;
}

- (BOOL)useCustomDayFrames
{
  return self->_useCustomDayFrames;
}

- (void).cxx_destruct
{
}

+ (id)dayInitialFont
{
  objc_opt_class();
  NSRequestConcreteImplementation();

  return (id)_UISystemFontForSize(10);
}

@end