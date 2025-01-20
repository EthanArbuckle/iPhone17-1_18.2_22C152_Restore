@interface MTAStopwatchLapCell
+ (BOOL)na_supportsAutoLayout;
+ (double)cellHeightWithCellStyle:(unint64_t)a3;
+ (id)labelBaseFontForCellStyle:(unint64_t)a3;
+ (id)lapLabelTextForNumber:(int64_t)a3;
+ (id)textStyleForCellStyle:(unint64_t)a3;
+ (void)ensureLapFormatter;
+ (void)handleLocaleChange;
+ (void)lapLabelBaselineTopOffset:(double *)a3 bottomOffset:(double *)a4 forCellStyle:(unint64_t)a5;
+ (void)resetLapFormatter;
- (MTAStopwatchLapCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)color;
- (UILabel)lapLabel;
- (UILabel)runningTotalLabel;
- (UILabel)timeLabel;
- (double)lapLabelDefaultBaselineBottomOffset;
- (double)lapLabelDefaultBaselineTopOffset;
- (double)runningTotal;
- (double)time;
- (id)_accessibilityFormatTime:(double)a3 showHours:(BOOL *)a4 showSubseconds:(BOOL)a5;
- (int64_t)lap;
- (unint64_t)lapStyle;
- (void)_updateForContentSizeChange;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setLap:(int64_t)a3;
- (void)setLapLabel:(id)a3;
- (void)setLapLabelDefaultBaselineBottomOffset:(double)a3;
- (void)setLapLabelDefaultBaselineTopOffset:(double)a3;
- (void)setLapStyle:(unint64_t)a3;
- (void)setRunningTotal:(double)a3;
- (void)setRunningTotalLabel:(id)a3;
- (void)setTime:(double)a3;
- (void)setTimeLabel:(id)a3;
@end

@implementation MTAStopwatchLapCell

+ (BOOL)na_supportsAutoLayout
{
  return 1;
}

- (MTAStopwatchLapCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v37.receiver = self;
  v37.super_class = (Class)MTAStopwatchLapCell;
  v4 = [(MTAStopwatchLapCell *)&v37 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(MTAStopwatchLapCell *)v4 setSelectionStyle:0];
    v6 = +[UIColor clearColor];
    [(MTAStopwatchLapCell *)v5 setBackgroundColor:v6];

    v7 = [(MTAStopwatchLapCell *)v5 contentView];
    v8 = +[UIColor mtui_primaryTextColor];
    [(MTAStopwatchLapCell *)v5 setColor:v8];

    id v9 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v13 = [v9 initWithFrame:CGRectZero.origin.x, y, width, height];
    [(MTAStopwatchLapCell *)v5 setLapLabel:v13];

    v14 = [(MTAStopwatchLapCell *)v5 lapLabel];
    [v14 setTextAlignment:4];

    v15 = +[UIColor clearColor];
    v16 = [(MTAStopwatchLapCell *)v5 lapLabel];
    [v16 setBackgroundColor:v15];

    v17 = [(MTAStopwatchLapCell *)v5 lapLabel];
    [v7 addSubview:v17];

    id v18 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [(MTAStopwatchLapCell *)v5 setTimeLabel:v18];

    v19 = [(MTAStopwatchLapCell *)v5 timeLabel];
    [v19 setTextAlignment:2];

    v20 = [(MTAStopwatchLapCell *)v5 timeLabel];
    [v20 setMinimumScaleFactor:0.590909091];

    v21 = +[UIColor clearColor];
    v22 = [(MTAStopwatchLapCell *)v5 timeLabel];
    [v22 setBackgroundColor:v21];

    v23 = [(MTAStopwatchLapCell *)v5 timeLabel];
    LODWORD(v24) = 1148846080;
    [v23 setContentHuggingPriority:0 forAxis:v24];

    v25 = [(MTAStopwatchLapCell *)v5 timeLabel];
    [v7 addSubview:v25];

    id v26 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [(MTAStopwatchLapCell *)v5 setRunningTotalLabel:v26];

    v27 = [(MTAStopwatchLapCell *)v5 runningTotalLabel];
    [v27 setTextAlignment:1];

    v28 = [(MTAStopwatchLapCell *)v5 runningTotalLabel];
    [v28 setMinimumScaleFactor:0.590909091];

    v29 = +[UIColor clearColor];
    v30 = [(MTAStopwatchLapCell *)v5 runningTotalLabel];
    [v30 setBackgroundColor:v29];

    v31 = [(MTAStopwatchLapCell *)v5 runningTotalLabel];
    LODWORD(v32) = 1148846080;
    [v31 setContentHuggingPriority:0 forAxis:v32];

    v33 = [(MTAStopwatchLapCell *)v5 runningTotalLabel];
    [v7 addSubview:v33];

    v34 = +[NSNotificationCenter defaultCenter];
    [v34 addObserver:v5 selector:"_updateForContentSizeChange" name:UIContentSizeCategoryDidChangeNotification object:0];

    v35 = v5;
  }

  return v5;
}

+ (double)cellHeightWithCellStyle:(unint64_t)a3
{
  v4 = +[MTAStopwatchLapCell labelBaseFontForCellStyle:](MTAStopwatchLapCell, "labelBaseFontForCellStyle:");
  double v10 = 0.0;
  double v11 = 0.0;
  +[MTAStopwatchLapCell lapLabelBaselineTopOffset:&v11 bottomOffset:&v10 forCellStyle:a3];
  [v4 _scaledValueForValue:v11];
  double v6 = v5;
  [v4 _scaledValueForValue:v10];
  double v8 = v6 - v7;

  return v8;
}

- (void)_updateForContentSizeChange
{
  id v7 = +[MTAStopwatchLapCell labelBaseFontForCellStyle:[(MTAStopwatchLapCell *)self lapStyle]];
  [(UILabel *)self->_lapLabel setFont:v7];
  timeLabel = self->_timeLabel;
  v4 = [v7 mtui_fontByAddingTimeFontAttributes];
  [(UILabel *)timeLabel setFont:v4];

  runningTotalLabel = self->_runningTotalLabel;
  double v6 = [v7 mtui_fontByAddingTimeFontAttributes];
  [(UILabel *)runningTotalLabel setFont:v6];

  [(MTAStopwatchLapCell *)self setNeedsLayout];
}

- (void)setLapStyle:(unint64_t)a3
{
  if (self->_lapStyle != a3)
  {
    self->_lapStyle = a3;
    +[MTAStopwatchLapCell lapLabelBaselineTopOffset:&self->_lapLabelDefaultBaselineTopOffset bottomOffset:&self->_lapLabelDefaultBaselineBottomOffset forCellStyle:a3];
    BOOL v4 = self->_lapStyle == 1;
    double v5 = [(MTAStopwatchLapCell *)self runningTotalLabel];
    [v5 setHidden:v4];

    id v11 = +[MTAStopwatchLapCell labelBaseFontForCellStyle:[(MTAStopwatchLapCell *)self lapStyle]];
    double v6 = [(MTAStopwatchLapCell *)self lapLabel];
    [v6 setFont:v11];

    id v7 = [v11 mtui_fontByAddingTimeFontAttributes];
    double v8 = [(MTAStopwatchLapCell *)self timeLabel];
    [v8 setFont:v7];

    id v9 = [v11 mtui_fontByAddingTimeFontAttributes];
    double v10 = [(MTAStopwatchLapCell *)self runningTotalLabel];
    [v10 setFont:v9];
  }
}

+ (void)lapLabelBaselineTopOffset:(double *)a3 bottomOffset:(double *)a4 forCellStyle:(unint64_t)a5
{
  if (a3 && a4)
  {
    unint64_t v5 = a5 - 2;
    if (a5 - 2 > 2)
    {
      double v7 = -16.0;
      double v6 = 28.0;
    }
    else
    {
      double v6 = dbl_1000827B8[v5];
      double v7 = dbl_1000827D0[v5];
    }
    *a3 = v6;
    *a4 = v7;
  }
}

+ (id)textStyleForCellStyle:(unint64_t)a3
{
  if (a3 - 2 > 2) {
    v3 = (id *)&UIFontTextStyleBody;
  }
  else {
    v3 = (id *)*(&off_1000A1B80 + a3 - 2);
  }
  id v4 = *v3;

  return v4;
}

+ (id)labelBaseFontForCellStyle:(unint64_t)a3
{
  id v4 = (id *)&UIContentSizeCategoryAccessibilityExtraLarge;
  if (a3 == 2) {
    id v4 = (id *)&UIContentSizeCategoryExtraExtraExtraLarge;
  }
  unint64_t v5 = (NSString *)*v4;
  double v6 = +[UIApplication sharedApplication];
  double v7 = [v6 preferredContentSizeCategory];

  if (UIContentSizeCategoryCompareToCategory(v7, v5) == NSOrderedDescending)
  {
    double v8 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v5];
  }
  else
  {
    double v8 = 0;
  }
  id v9 = +[MTAStopwatchLapCell textStyleForCellStyle:a3];
  double v10 = +[UIFont preferredFontForTextStyle:v9 compatibleWithTraitCollection:v8];

  return v10;
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)MTAStopwatchLapCell;
  [(MTAStopwatchLapCell *)&v47 layoutSubviews];
  unsigned int v3 = [(MTAStopwatchLapCell *)self mtui_isRTL];
  id v4 = [(MTAStopwatchLapCell *)self lapLabel];
  unint64_t v5 = [(MTAStopwatchLapCell *)self timeLabel];
  double v6 = [(MTAStopwatchLapCell *)self contentView];
  double v7 = [(id)objc_opt_class() lapLabelTextForNumber:self->_lap];
  [v4 setText:v7];

  double v8 = [(MTAStopwatchLapCell *)self color];
  [v4 setTextColor:v8];

  id v9 = FormatTime();
  [v5 setText:v9];

  double v10 = [(MTAStopwatchLapCell *)self color];
  [v5 setTextColor:v10];

  [v4 sizeToFit];
  [v5 sizeToFit];
  [v4 bounds];
  double v12 = v11;
  double v14 = v13;
  [v5 bounds];
  double v16 = v15;
  double v18 = v17;
  v19 = +[MTAStopwatchLapCell labelBaseFontForCellStyle:[(MTAStopwatchLapCell *)self lapStyle]];
  [(MTAStopwatchLapCell *)self lapLabelDefaultBaselineTopOffset];
  [v19 _scaledValueForValue:];
  double v21 = v20;
  [v4 _lastLineBaseline];
  double v23 = v21 - v22;
  if (v3)
  {
    [v6 bounds];
    double Width = CGRectGetWidth(v48);
    [(MTAStopwatchLapCell *)self separatorInset];
    double v26 = Width - v25;
    v49.origin.x = CGRectZero.origin.x;
    v49.origin.double y = v23;
    v49.size.double width = v12;
    v49.size.double height = v14;
    double v27 = v26 - CGRectGetWidth(v49);
  }
  else
  {
    [(MTAStopwatchLapCell *)self separatorInset];
    double v27 = v28;
  }
  [v4 setFrame:v27, v23, v12, v14];
  if ((id)[(MTAStopwatchLapCell *)self lapStyle] == (id)1)
  {
    if (v3)
    {
      [(MTAStopwatchLapCell *)self separatorInset];
      double v30 = v29;
    }
    else
    {
      [v6 bounds];
      double v41 = CGRectGetWidth(v52);
      [(MTAStopwatchLapCell *)self separatorInset];
      double v43 = v41 - v42;
      [v5 bounds];
      double v30 = v43 - CGRectGetWidth(v53);
    }
    [v5 setFrame:v30, v23, v16, v18];
  }
  else
  {
    [v6 bounds];
    double MidX = CGRectGetMidX(v50);
    [v5 bounds];
    [v5 setFrame:MidX + CGRectGetWidth(v51) * -0.5, v23, v16, v18];
    double v32 = [(MTAStopwatchLapCell *)self runningTotalLabel];
    [(MTAStopwatchLapCell *)self runningTotal];
    v33 = FormatTime();
    [v32 setText:v33];

    v34 = [(MTAStopwatchLapCell *)self color];
    [v32 setTextColor:v34];

    [v32 sizeToFit];
    [v32 bounds];
    double v36 = v35;
    double v38 = v37;
    if (v3)
    {
      [(MTAStopwatchLapCell *)self separatorInset];
      double v40 = v39;
    }
    else
    {
      [v6 bounds];
      double v44 = CGRectGetWidth(v54);
      [(MTAStopwatchLapCell *)self separatorInset];
      double v46 = v44 - v45;
      [v32 bounds];
      double v40 = v46 - CGRectGetWidth(v55);
    }
    [v32 setFrame:v40, v23, v36, v38];
  }
}

+ (void)ensureLapFormatter
{
  if (!qword_1000C7D00)
  {
    id v2 = objc_alloc_init((Class)NSNumberFormatter);
    unsigned int v3 = (void *)qword_1000C7D00;
    qword_1000C7D00 = (uint64_t)v2;

    [(id)qword_1000C7D00 setNumberStyle:0];
    id v4 = +[NSLocale currentLocale];
    [(id)qword_1000C7D00 setLocale:v4];
  }
}

+ (void)resetLapFormatter
{
  if (qword_1000C7D00)
  {
    id v2 = [(id)qword_1000C7D00 locale];
    unsigned int v3 = +[NSLocale currentLocale];
    unsigned __int8 v4 = [v2 isEqual:v3];

    if ((v4 & 1) == 0)
    {
      id v5 = +[NSLocale currentLocale];
      [(id)qword_1000C7D00 setLocale:v5];
    }
  }
}

+ (id)lapLabelTextForNumber:(int64_t)a3
{
  [a1 ensureLapFormatter];
  unsigned __int8 v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"LAP_NUMBER_STOPWATCH" value:&stru_1000A2560 table:0];

  double v6 = (void *)qword_1000C7D00;
  double v7 = +[NSNumber numberWithInteger:a3];
  double v8 = [v6 stringFromNumber:v7];
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v8);

  return v9;
}

+ (void)handleLocaleChange
{
  ResetTimeFormatter();

  _[a1 resetLapFormatter];
}

- (id)_accessibilityFormatTime:(double)a3 showHours:(BOOL *)a4 showSubseconds:(BOOL)a5
{
  return (id)FormatTime();
}

- (int64_t)lap
{
  return self->_lap;
}

- (void)setLap:(int64_t)a3
{
  self->_lap = a3;
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (unint64_t)lapStyle
{
  return self->_lapStyle;
}

- (double)runningTotal
{
  return self->_runningTotal;
}

- (void)setRunningTotal:(double)a3
{
  self->_runningTotal = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (UILabel)lapLabel
{
  return self->_lapLabel;
}

- (void)setLapLabel:(id)a3
{
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (UILabel)runningTotalLabel
{
  return self->_runningTotalLabel;
}

- (void)setRunningTotalLabel:(id)a3
{
}

- (double)lapLabelDefaultBaselineTopOffset
{
  return self->_lapLabelDefaultBaselineTopOffset;
}

- (void)setLapLabelDefaultBaselineTopOffset:(double)a3
{
  self->_lapLabelDefaultBaselineTopOffset = a3;
}

- (double)lapLabelDefaultBaselineBottomOffset
{
  return self->_lapLabelDefaultBaselineBottomOffset;
}

- (void)setLapLabelDefaultBaselineBottomOffset:(double)a3
{
  self->_lapLabelDefaultBaselineBottomOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningTotalLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_lapLabel, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end