@interface CompactMonthWeekDayOverlay
+ (id)_attributes;
+ (id)_cachedImageForString:(id)a3 isWeekend:(BOOL)a4 underlineThickness:(double)a5 fontSize:(double)a6 style:(int64_t)a7;
+ (id)_generateImageForString:(id)a3 isWeekend:(BOOL)a4 underlineThickness:(double)a5 fontSize:(double)a6 style:(int64_t)a7;
- (NSDate)date;
- (double)fontSize;
- (void)setDate:(id)a3;
- (void)setFontSize:(double)a3;
- (void)update;
@end

@implementation CompactMonthWeekDayOverlay

+ (id)_attributes
{
  if (qword_1002166B8 != -1) {
    dispatch_once(&qword_1002166B8, &stru_1001D3560);
  }
  v2 = (void *)qword_1002166B0;

  return v2;
}

+ (id)_generateImageForString:(id)a3 isWeekend:(BOOL)a4 underlineThickness:(double)a5 fontSize:(double)a6 style:(int64_t)a7
{
  id v11 = a3;
  v12 = [a1 _attributes];
  if (a4) {
    WeekendTextColor();
  }
  else {
  v13 = +[UIColor labelColor];
  }
  [v12 setObject:v13 forKeyedSubscript:NSForegroundColorAttributeName];

  v14 = [v12 objectForKeyedSubscript:NSFontAttributeName];
  [v14 pointSize];
  if (vabdd_f64(v15, a6) >= 2.22044605e-16)
  {
    v16 = +[UIFont systemFontOfSize:a6];
    [v12 setObject:v16 forKeyedSubscript:NSFontAttributeName];
  }
  [v11 boundingRectWithSize:0 options:v12 attributes:0 context:CGSizeZero.width, CGSizeZero.height];
  CalCeilToScreenScale();
  double v18 = v17;
  CalCeilToScreenScale();
  double v20 = v19;
  double v21 = a5 + 2.0;
  if (a5 <= 0.0) {
    double v21 = -0.0;
  }
  double v22 = v21 + v20;
  v23 = +[UIGraphicsImageRendererFormat defaultFormat];
  id v24 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v23 format:v18];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100071F48;
  v29[3] = &unk_1001D3588;
  double v32 = v18;
  double v33 = v20;
  id v30 = v11;
  id v31 = v12;
  double v34 = a5;
  id v25 = v12;
  id v26 = v11;
  v27 = [v24 imageWithActions:v29];

  return v27;
}

+ (id)_cachedImageForString:(id)a3 isWeekend:(BOOL)a4 underlineThickness:(double)a5 fontSize:(double)a6 style:(int64_t)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  if (qword_1002166C8 != -1) {
    dispatch_once(&qword_1002166C8, &stru_1001D35A8);
  }
  CFStringRef v13 = @"weekday";
  if (v10) {
    CFStringRef v13 = @"weekend";
  }
  v14 = +[NSString stringWithFormat:@"%@:%@:%f:%f:%tu", v12, v13, *(void *)&a5, *(void *)&a6, a7];
  double v15 = [(id)qword_1002166C0 objectForKey:v14];
  if (!v15)
  {
    double v15 = [a1 _generateImageForString:v12 isWeekend:v10 underlineThickness:a7 fontSize:a5 style:a6];
    [(id)qword_1002166C0 setObject:v15 forKey:v14];
  }

  return v15;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);

  [(CompactMonthWeekDayOverlay *)self update];
}

- (void)update
{
  if (self->_date)
  {
    v3 = CUIKGetOverlayCalendar();
    v4 = [v3 components:24 fromDate:self->_date];

    double v5 = 0.0;
    if ([v4 day] == (id)1)
    {
      double v5 = 1.0;
      if ([v4 month] == (id)1)
      {
        if ([v4 isLeapMonth]) {
          double v5 = 1.0;
        }
        else {
          double v5 = 1.5;
        }
      }
    }
    date = self->_date;
    v7 = CUIKGetOverlayCalendar();
    v8 = +[CUIKDateStrings overlayShortStringForDate:date inCalendar:v7];

    v9 = [(CompactMonthWeekDayOverlay *)self traitCollection];
    LODWORD(date) = EKUIUsesLargeTextLayout();

    BOOL v10 = CUIKCalendar();
    unsigned __int8 v11 = [v10 isDateInWeekend:self->_date];

    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = sub_1000724B4;
    v39 = sub_1000724C4;
    id v40 = 0;
    id v12 = [(CompactMonthWeekDayOverlay *)self traitCollection];
    v30[1] = 3221225472;
    v30[0] = _NSConcreteStackBlock;
    v30[2] = sub_1000724CC;
    v30[3] = &unk_1001D35D0;
    if (date) {
      double v5 = v5 + v5;
    }
    double v32 = &v35;
    v30[4] = self;
    id v13 = v8;
    id v31 = v13;
    unsigned __int8 v34 = v11;
    double v33 = v5;
    [v12 performAsCurrentTraitCollection:v30];

    id v14 = [ (id) v36[5] CGImage];
    double v15 = [(CompactMonthWeekDayOverlay *)self layer];
    [v15 setContents:v14];

    [(CompactMonthWeekDayOverlay *)self frame];
    double v17 = v16;
    double v19 = v18;
    [(id)v36[5] size];
    if (v17 != v21 || v19 != v20)
    {
      [(CompactMonthWeekDayOverlay *)self frame];
      double v23 = v22;
      double v25 = v24;
      [(id)v36[5] size];
      -[CompactMonthWeekDayOverlay setFrame:](self, "setFrame:", v23, v25, v26, v27);
      v28 = [(CompactMonthWeekDayOverlay *)self superview];
      [v28 setNeedsLayout];
    }
    _Block_object_dispose(&v35, 8);
  }
  else
  {
    id v29 = [(CompactMonthWeekDayOverlay *)self layer];
    [v29 setContents:0];
  }
}

- (NSDate)date
{
  return self->_date;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void).cxx_destruct
{
}

@end