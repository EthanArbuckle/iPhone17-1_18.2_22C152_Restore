@interface UIDatePickerWeekMonthDayView
- (BOOL)_canBeReusedInPickerView;
- (BOOL)weekdayLast;
- (NSString)formattedDateString;
- (UIDatePickerWeekMonthDayView)initWithFrame:(CGRect)a3;
- (UILabel)dateLabel;
- (UILabel)weekdayLabel;
- (double)weekdayWidth;
- (void)layoutSubviews;
- (void)setFormattedDateString:(id)a3;
- (void)setWeekdayLast:(BOOL)a3;
- (void)setWeekdayWidth:(double)a3;
@end

@implementation UIDatePickerWeekMonthDayView

- (UIDatePickerWeekMonthDayView)initWithFrame:(CGRect)a3
{
  v31.receiver = self;
  v31.super_class = (Class)UIDatePickerWeekMonthDayView;
  v3 = -[UIView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(UIView *)v3 setBackgroundColor:v4];

    v5 = [UILabel alloc];
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = -[UILabel initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    dateLabel = v3->_dateLabel;
    v3->_dateLabel = (UILabel *)v10;

    v12 = v3->_dateLabel;
    v13 = +[UIColor clearColor];
    [(UIView *)v12 setBackgroundColor:v13];

    v14 = v3->_dateLabel;
    v15 = +[UIColor whiteColor];
    [(UILabel *)v14 setShadowColor:v15];

    -[UILabel setShadowOffset:](v3->_dateLabel, "setShadowOffset:", 0.0, 1.0);
    v16 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v6, v7, v8, v9);
    weekdayLabel = v3->_weekdayLabel;
    v3->_weekdayLabel = v16;

    [(UILabel *)v3->_weekdayLabel setAdjustsFontSizeToFitWidth:1];
    v18 = v3->_weekdayLabel;
    v19 = +[UIColor clearColor];
    [(UIView *)v18 setBackgroundColor:v19];

    if (!_MergedGlobals_15_3)
    {
      v20 = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.45];
      v21 = (void *)_MergedGlobals_15_3;
      _MergedGlobals_15_3 = (uint64_t)v20;
    }
    -[UILabel setTextColor:](v3->_weekdayLabel, "setTextColor:");
    if (!qword_1EB25E958)
    {
      v22 = [[UIColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
      v23 = (void *)qword_1EB25E958;
      qword_1EB25E958 = (uint64_t)v22;
    }
    -[UILabel setShadowColor:](v3->_weekdayLabel, "setShadowColor:");
    -[UILabel setShadowOffset:](v3->_weekdayLabel, "setShadowOffset:", 0.0, 1.0);
    if (!qword_1EB25E960)
    {
      v24 = [(UIView *)v3 traitCollection];
      v25 = +[UIPickerView _styleForIdiom:](UIPickerView, "_styleForIdiom:", [v24 userInterfaceIdiom]);

      v26 = [(UIView *)v3 traitCollection];
      uint64_t v27 = [v25 centerCellFontWithTraitCollection:v26];
      v28 = (void *)qword_1EB25E960;
      qword_1EB25E960 = v27;
    }
    -[UILabel setFont:](v3->_weekdayLabel, "setFont:");
    [(UILabel *)v3->_weekdayLabel setTextAlignment:2];
    [(UIView *)v3 addSubview:v3->_dateLabel];
    [(UIView *)v3 addSubview:v3->_weekdayLabel];
    v29 = v3;
  }

  return v3;
}

- (BOOL)_canBeReusedInPickerView
{
  return 1;
}

- (void)setWeekdayWidth:(double)a3
{
  self->_weekdayWidth = a3;
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v59.size.height = *(CGFloat *)MEMORY[0x1E4F143B8];
  int v3 = *((_DWORD *)&self->super._viewFlags + 4);
  [(UIView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = MEMORY[0x1E4F1DAD8];
  v59.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  [(UILabel *)self->_dateLabel textRectForBounds:1 limitedToNumberOfLines:v4];
  double rect = v13;
  double v15 = v14;
  -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_weekdayLabel, "textRectForBounds:limitedToNumberOfLines:", 1, v5, v7, v9, v11);
  double v56 = v16;
  double v58 = v17;
  double v18 = 4.0;
  if ((v3 & 0x80000) == 0)
  {
    if (*(unsigned char *)&self->_datePickerWeekMonthDayViewFlags)
    {
      CGFloat v19 = *(double *)(v12 + 8);
      v60.origin.double x = v5;
      v60.origin.y = v7;
      v60.size.width = v9;
      v60.size.height = v11;
      CGFloat v20 = CGRectGetWidth(v60) - (self->_weekdayWidth + 2.0 + 5.0);
      v61.origin.double x = v59.origin.x;
      v61.origin.y = v19;
      v61.size.width = rect;
      v61.size.height = v15;
      double v18 = v20 - CGRectGetWidth(v61);
    }
    else
    {
      double v18 = self->_weekdayWidth + 2.0 + 5.0;
    }
  }
  v21 = [(UILabel *)self->_dateLabel font];
  [v21 capHeight];
  double v23 = v22;

  v62.origin.double x = v5;
  v62.origin.y = v7;
  v62.size.width = v9;
  v62.size.height = v11;
  double v24 = v23 * 0.5 + CGRectGetMidY(v62);
  [(UILabel *)self->_dateLabel _baselineOffsetFromBottom];
  double v55 = v24 + v25 - v15;
  [(UILabel *)self->_weekdayLabel _baselineOffsetFromBottom];
  double v54 = v24 + v26 - v58;
  uint64_t v27 = [(UILabel *)self->_weekdayLabel text];

  if (!v27)
  {
    if ((v3 & 0x80000) != 0)
    {
      double v28 = v15;
      double v18 = 4.0;
    }
    else
    {
      formattedDateString = self->_formattedDateString;
      v59.origin.y = *(CGFloat *)off_1E52D2040;
      v32 = [(UILabel *)self->_dateLabel font];
      *(void *)&v59.size.width = v32;
      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59.size forKeys:&v59.origin.y count:1];
      [(NSString *)formattedDateString sizeWithAttributes:v33];
      double v35 = v34;

      double v36 = v35 + self->_weekdayWidth + 2.0 + 5.0;
      v64.origin.double x = v18;
      v64.origin.y = v55;
      v64.size.width = rect;
      v64.size.height = v15;
      double v37 = v36 - CGRectGetWidth(v64);
      v65.origin.double x = v37;
      v65.origin.y = v55;
      v65.size.width = rect;
      double v28 = v15;
      v65.size.height = v15;
      if (CGRectGetMinX(v65) >= 7.0) {
        double v18 = v37;
      }
      else {
        double v18 = 7.0;
      }
    }
LABEL_17:
    double v39 = v18;
    CGFloat v41 = v55;
    CGFloat v43 = rect;
    CGFloat v45 = v28;
    double x = v59.origin.x;
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_datePickerWeekMonthDayViewFlags)
  {
    double v28 = v15;
    v66.origin.double x = v5;
    v66.origin.y = v7;
    v66.size.width = v9;
    v66.size.height = v11;
    double v30 = CGRectGetWidth(v66) - (self->_weekdayWidth + 2.0);
  }
  else if ((v3 & 0x80000) != 0)
  {
    v67.origin.double x = v18;
    v67.origin.y = v55;
    v67.size.width = rect;
    double v28 = v15;
    v67.size.height = v15;
    double v30 = CGRectGetWidth(v67) + 2.0 + 5.0;
  }
  else
  {
    double v28 = v15;
    double v29 = self->_weekdayWidth + 2.0;
    v63.origin.double x = v59.origin.x;
    v63.origin.y = v54;
    v63.size.width = v56;
    v63.size.height = v58;
    double v30 = v29 - CGRectGetWidth(v63);
  }
  [(UIView *)self _currentScreenScale];
  double v39 = UIRectIntegralWithScale(v30, v54, v56, v58, v38);
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  double v58 = v44;
  v59.origin.double x = v39;
  double v54 = v40;
  double v56 = v42;
  double x = v18;
  if ((*(unsigned char *)&self->_datePickerWeekMonthDayViewFlags & 1) == 0) {
    goto LABEL_17;
  }
LABEL_18:
  v68.origin.double x = v39;
  v68.origin.y = v41;
  v68.size.width = v43;
  v68.size.height = v45;
  double MaxX = CGRectGetMaxX(v68);
  [(UIView *)self bounds];
  if (MaxX > v48)
  {
    v69.origin.double x = v39;
    v69.origin.y = v41;
    v69.size.width = v43;
    v69.size.height = v45;
    double v49 = CGRectGetMaxX(v69);
    [(UIView *)self bounds];
    double v51 = v49 - v50;
    if (x - (v49 - v50) < 0.0) {
      double v51 = x;
    }
    double v52 = 0.0;
    if (v27) {
      double v52 = v51;
    }
    v59.origin.double x = v59.origin.x - v52;
    double v18 = v18 - v51;
  }
  if (v27) {
    -[UILabel setFrame:](self->_weekdayLabel, "setFrame:", v59.origin.x, v54, v56, v58);
  }
  [(UIView *)self _currentScreenScale];
  [(UILabel *)self->_dateLabel setFrame:UIRectIntegralWithScale(v18, v55, rect, v28, v53)];
}

- (BOOL)weekdayLast
{
  return *(unsigned char *)&self->_datePickerWeekMonthDayViewFlags & 1;
}

- (void)setWeekdayLast:(BOOL)a3
{
  *(unsigned char *)&self->_datePickerWeekMonthDayViewFlags = *(unsigned char *)&self->_datePickerWeekMonthDayViewFlags & 0xFE | a3;
  [(UIView *)self setNeedsLayout];
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (UILabel)weekdayLabel
{
  return self->_weekdayLabel;
}

- (NSString)formattedDateString
{
  return self->_formattedDateString;
}

- (void)setFormattedDateString:(id)a3
{
}

- (double)weekdayWidth
{
  return self->_weekdayWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedDateString, 0);
  objc_storeStrong((id *)&self->_weekdayLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end