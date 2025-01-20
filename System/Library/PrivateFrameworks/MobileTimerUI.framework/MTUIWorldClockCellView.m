@interface MTUIWorldClockCellView
+ (double)defaultHeight;
+ (id)dayAndTimeZoneOffsetStringFromDate:(id)a3 withTimeZoneOffset:(int64_t)a4 timeZoneAbbreviation:(id)a5 spaceBeforeTimeDesignator:(BOOL)a6;
+ (id)dayAndTimeZoneOffsetStringFromDate:(id)a3 withTimeZoneOffset:(int64_t)a4 timeZoneAbbreviation:(id)a5 spaceBeforeTimeDesignator:(BOOL)a6 hoursOnly:(BOOL)a7;
- (BOOL)shouldStackViews;
- (BOOL)started;
- (MTUIDigitalClockLabel)digitalClock;
- (MTUIWorldClockCellView)initWithFrame:(CGRect)a3;
- (MTUIWorldClockCellViewDelegate)delegate;
- (UILabel)combinedLabel;
- (UILabel)nameLabel;
- (double)coarseUpdateInterval;
- (double)updateInterval;
- (int64_t)runMode;
- (void)_configureFonts;
- (void)handleTextSizeChange:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setShouldStackViews:(BOOL)a3;
- (void)setTimeZone:(id)a3;
- (void)significantTimeChange:(id)a3;
- (void)start;
- (void)stop;
- (void)updateLabelAdjustFontSize;
- (void)updateTime;
- (void)updateTimeContinuously:(int64_t)a3;
@end

@implementation MTUIWorldClockCellView

+ (double)defaultHeight
{
  v2 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2B8]];
  v3 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2F8]];
  [v2 _scaledValueForValue:36.0];
  double v5 = v4;
  [v3 _scaledValueForValue:33.0];
  double v7 = v6;
  [v2 _scaledValueForValue:27.0];
  double v9 = v5 + v7 + v8;
  v10 = [MEMORY[0x263F1C920] mainScreen];
  v11 = [v10 _defaultTraitCollection];
  v12 = [v11 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

  if (IsAccessibilityCategory)
  {
    [v3 _scaledValueForValue:16.0];
    double v9 = v9 + v14 + 40.0;
  }

  return v9;
}

- (MTUIWorldClockCellView)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)MTUIWorldClockCellView;
  v3 = -[MTUIWorldClockCellView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(MTUIWorldClockCellView *)v3 setPreservesSuperviewLayoutMargins:1];
    double v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v4 selector:sel_significantTimeChange_ name:*MEMORY[0x263F1D0A0] object:0];

    double v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v4 selector:sel_localeChange_ name:*MEMORY[0x263EFF458] object:0];

    BOOL v7 = [(UIView *)v4 mtui_isRTL];
    double v8 = objc_alloc_init(MTUIDigitalClockLabel);
    digitalClock = v4->_digitalClock;
    v4->_digitalClock = v8;

    v10 = objc_msgSend(MEMORY[0x263F1C658], "mtui_thinTimeFont");
    [(MTUIDateLabel *)v4->_digitalClock setFont:v10];

    v11 = objc_msgSend(MEMORY[0x263F1C658], "mtui_defaultTimeDesignatorFont");
    [(MTUIDateLabel *)v4->_digitalClock setTimeDesignatorFont:v11];

    v12 = objc_msgSend(MEMORY[0x263F1C550], "mtui_primaryTextColor");
    [(MTUIDateLabel *)v4->_digitalClock setTextColor:v12];

    v13 = [(MTUIDateLabel *)v4->_digitalClock dateLabel];
    double v14 = v13;
    if (v7) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = 2;
    }
    if (v7) {
      uint64_t v16 = 8;
    }
    else {
      uint64_t v16 = 7;
    }
    [v13 setTextAlignment:v15];

    [(MTUIWorldClockCellView *)v4 addSubview:v4->_digitalClock];
    id v17 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v18 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = (UILabel *)v18;

    v20 = objc_msgSend(MEMORY[0x263F1C550], "mtui_primaryTextColor");
    [(UILabel *)v4->_nameLabel setTextColor:v20];

    v21 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v4->_nameLabel setBackgroundColor:v21];

    [(UILabel *)v4->_nameLabel setContentMode:v16];
    [(MTUIWorldClockCellView *)v4 addSubview:v4->_nameLabel];
    v22 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    combinedLabel = v4->_combinedLabel;
    v4->_combinedLabel = v22;

    v24 = objc_msgSend(MEMORY[0x263F1C550], "mtui_secondaryTextColor");
    [(UILabel *)v4->_combinedLabel setTextColor:v24];

    v25 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v4->_combinedLabel setBackgroundColor:v25];

    [(UILabel *)v4->_combinedLabel setContentMode:v16];
    [(MTUIWorldClockCellView *)v4 addSubview:v4->_combinedLabel];
    v4->_shouldStackViews = 0;
    [(MTUIWorldClockCellView *)v4 _configureFonts];
    v26 = [MEMORY[0x263F08A00] defaultCenter];
    [v26 addObserver:v4 selector:sel_handleTextSizeChange_ name:*MEMORY[0x263F1D158] object:0];
  }
  return v4;
}

- (void)_configureFonts
{
  [(MTUIWorldClockCellView *)self updateLabelAdjustFontSize];
  id v10 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2F8]];
  v3 = [v10 fontDescriptor];
  double v4 = [v3 fontDescriptorWithSymbolicTraits:0x8000];
  double v5 = [MEMORY[0x263F1C658] fontWithDescriptor:v4 size:0.0];
  [(UILabel *)self->_nameLabel setFont:v5];
  double v6 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2B8]];
  BOOL v7 = [v6 fontDescriptor];
  double v8 = [v7 fontDescriptorWithSymbolicTraits:0x8000];
  double v9 = [MEMORY[0x263F1C658] fontWithDescriptor:v8 size:0.0];
  [(UILabel *)self->_combinedLabel setFont:v9];
}

- (void)updateLabelAdjustFontSize
{
  BOOL v3 = !self->_shouldStackViews;
  [(UILabel *)self->_nameLabel setAdjustsFontSizeToFitWidth:v3];
  combinedLabel = self->_combinedLabel;

  [(UILabel *)combinedLabel setAdjustsFontSizeToFitWidth:v3];
}

- (void)handleTextSizeChange:(id)a3
{
  gLabelMetrics_0 = 0;
  [(MTUIWorldClockCellView *)self _configureFonts];

  [(MTUIWorldClockCellView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  if ((gLabelMetrics_0 & 1) == 0)
  {
    gLabelMetrics_0 = 1;
    -[UILabel effectiveLayoutSizeFittingSize:](self->_nameLabel, "effectiveLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
    gLabelMetrics_1 = v3;
    [(UILabel *)self->_nameLabel effectiveFirstBaselineOffsetFromTop];
    gLabelMetrics_2 = v4;
    double v5 = [(UILabel *)self->_nameLabel font];
    [v5 _scaledValueForValue:33.0];
    gLabelMetrics_3 = v6;

    -[UILabel effectiveLayoutSizeFittingSize:](self->_combinedLabel, "effectiveLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
    gLabelMetrics_4 = v7;
    [(UILabel *)self->_combinedLabel effectiveFirstBaselineOffsetFromTop];
    gLabelMetrics_5 = v8;
    double v9 = [(UILabel *)self->_combinedLabel font];
    [v9 _scaledValueForValue:36.0];
    gLabelMetrics_6 = v10;
  }
  v48.receiver = self;
  v48.super_class = (Class)MTUIWorldClockCellView;
  [(MTUIWorldClockCellView *)&v48 layoutSubviews];
  [(MTUIWorldClockCellView *)self layoutMargins];
  double v12 = v11;
  double v14 = v13;
  [(MTUIWorldClockCellView *)self bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  BOOL v23 = [(UIView *)self mtui_isRTL];
  double v43 = *(double *)&gLabelMetrics_5;
  double v44 = *(double *)&gLabelMetrics_6;
  double v41 = *(double *)&gLabelMetrics_2;
  double v42 = *(double *)&gLabelMetrics_3;
  if (v23) {
    double v24 = v14;
  }
  else {
    double v24 = v12;
  }
  double v46 = v24;
  v49.origin.x = v16;
  v49.origin.y = v18;
  v49.size.width = v20;
  v49.size.height = v22;
  double v25 = CGRectGetWidth(v49) - v12;
  -[MTUIDigitalClockLabel effectiveLayoutSizeFittingSize:](self->_digitalClock, "effectiveLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  double v47 = v26;
  double rect = v27;
  double v28 = v12;
  if (!self->_shouldStackViews)
  {
    double v28 = v12;
    if (!v23)
    {
      v50.origin.x = v16;
      v50.origin.y = v18;
      v50.size.width = v20;
      v50.size.height = v22;
      double v28 = CGRectGetMaxX(v50) - v47 - v14;
    }
  }
  double v29 = v25 - v14;
  if (!self->_editing && !self->_shouldStackViews)
  {
    uint64_t v30 = 0;
    double v31 = v28;
    double v32 = v47;
    double v33 = rect;
    if (v23)
    {
      CGFloat v34 = CGRectGetMaxX(*(CGRect *)&v31) + 8.0;
      v51.origin.x = v16;
      v51.origin.y = v18;
      v51.size.width = v20;
      v51.size.height = v22;
      double v46 = v34;
      double v29 = CGRectGetMaxX(v51) - v34 - v14;
    }
    else
    {
      double v29 = CGRectGetMinX(*(CGRect *)&v31) + -8.0 - v12;
      double v46 = v12;
    }
  }
  double v35 = *(double *)&gLabelMetrics_1;
  double v36 = *(double *)&gLabelMetrics_4;
  double v37 = *(double *)&gLabelMetrics_6 + *(double *)&gLabelMetrics_3;
  if (self->_shouldStackViews)
  {
    v38 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2F8]];
    [v38 _scaledValueForValue:16.0];
    double v37 = v37 + v39 + 40.0;
  }
  [(MTUIDigitalClockLabel *)self->_digitalClock effectiveFirstBaselineOffsetFromTop];
  -[MTUIDigitalClockLabel setFrame:](self->_digitalClock, "setFrame:", v28, v37 - v40 + 0.0, v47, rect);
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", v46, v44 + v42 - v41, v29, v35);
  -[UILabel setFrame:](self->_combinedLabel, "setFrame:", v46, v44 - v43, v29, v36);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing == a3) {
    return;
  }
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_editing = a3;
  if (a4) {
    [MEMORY[0x263F1CB60] beginAnimations:@"WorldClockCell" context:0];
  }
  if (!self->_shouldStackViews)
  {
    [(MTUIDigitalClockLabel *)self->_digitalClock setHidden:v5];
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v4) {
LABEL_6:
  }
    [MEMORY[0x263F1CB60] commitAnimations];
LABEL_7:

  [(MTUIWorldClockCellView *)self setNeedsLayout];
}

- (void)significantTimeChange:(id)a3
{
  objc_msgSend(MEMORY[0x263EFFA18], "resetSystemTimeZone", a3);
  [(MTUIWorldClockCellView *)self updateTime];
  BOOL v4 = (void *)gTodayFormatter;
  if (gTodayFormatter)
  {
    id v5 = [MEMORY[0x263EFFA18] systemTimeZone];
    [v4 setTimeZone:v5];
  }
}

- (void)start
{
  if (!self->_started)
  {
    [(MTUIWorldClockCellView *)self updateTime];
    self->_started = 1;
    +[MTUIAnalogClockView registerClock:self];
  }
}

- (void)stop
{
  if (self->_started)
  {
    self->_started = 0;
    +[MTUIAnalogClockView unregisterClock:self];
  }
}

- (int64_t)runMode
{
  return 2;
}

- (void)updateTimeContinuously:(int64_t)a3
{
  if (self->_nowInMinutes != a3)
  {
    self->_nowInMinutes = a3;
    [(MTUIWorldClockCellView *)self updateTime];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained timeDidChangeForClockCell:self];
  }
}

- (double)updateInterval
{
  return 1.0;
}

- (double)coarseUpdateInterval
{
  return 60.0;
}

- (void)updateTime
{
  timeZone = self->_timeZone;
  if (timeZone)
  {
    uint64_t v4 = [(NSTimeZone *)timeZone secondsFromGMT];
    id v5 = [MEMORY[0x263EFFA18] systemTimeZone];
    uint64_t v6 = v4 - [v5 secondsFromGMT];

    id v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)v6];
    uint64_t v7 = [(id)objc_opt_class() dayAndTimeZoneOffsetStringFromDate:v11 withTimeZoneOffset:v6 timeZoneAbbreviation:0 spaceBeforeTimeDesignator:0];
    uint64_t v8 = [(UILabel *)self->_combinedLabel text];
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0) {
      [(UILabel *)self->_combinedLabel setText:v7];
    }
    uint64_t v10 = [MEMORY[0x263EFF910] date];
    [(MTUIDateLabel *)self->_digitalClock setDate:v10];

    [(MTUIWorldClockCellView *)self setNeedsLayout];
  }
}

- (void)setTimeZone:(id)a3
{
  id v5 = (NSTimeZone *)a3;
  uint64_t v6 = v5;
  if (self->_timeZone != v5)
  {
    uint64_t v7 = v5;
    [(MTUIDateLabel *)self->_digitalClock setTimeZone:v5];
    objc_storeStrong((id *)&self->_timeZone, a3);
    self->_nowInMinutes = vcvtmd_s64_f64(CFAbsoluteTimeGetCurrent() / 60.0);
    id v5 = (NSTimeZone *)[(MTUIWorldClockCellView *)self updateTime];
    uint64_t v6 = v7;
  }

  MEMORY[0x270F9A758](v5, v6);
}

+ (id)dayAndTimeZoneOffsetStringFromDate:(id)a3 withTimeZoneOffset:(int64_t)a4 timeZoneAbbreviation:(id)a5 spaceBeforeTimeDesignator:(BOOL)a6
{
  return (id)[a1 dayAndTimeZoneOffsetStringFromDate:a3 withTimeZoneOffset:a4 timeZoneAbbreviation:a5 spaceBeforeTimeDesignator:a6 hoursOnly:0];
}

+ (id)dayAndTimeZoneOffsetStringFromDate:(id)a3 withTimeZoneOffset:(int64_t)a4 timeZoneAbbreviation:(id)a5 spaceBeforeTimeDesignator:(BOOL)a6 hoursOnly:(BOOL)a7
{
  BOOL v53 = a7;
  BOOL v7 = a6;
  id v10 = a3;
  id v11 = a5;
  if (!gNumberFormatter)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F08A30]);
    double v13 = (void *)gNumberFormatter;
    gNumberFormatter = (uint64_t)v12;

    [(id)gNumberFormatter setNumberStyle:1];
    id v14 = objc_alloc_init(MEMORY[0x263F08790]);
    double v15 = (void *)gTodayFormatter;
    gTodayFormatter = (uint64_t)v14;

    CGFloat v16 = [MEMORY[0x263EFFA18] systemTimeZone];
    [(id)gTodayFormatter setTimeZone:v16];
    [(id)gTodayFormatter setDateStyle:2];
    [(id)gTodayFormatter setTimeStyle:0];
    [(id)gTodayFormatter setDoesRelativeDateFormatting:1];
    [(id)gTodayFormatter setFormattingContext:4];
    uint64_t v17 = objc_opt_new();
    CGFloat v18 = (void *)gDateComponentsFormatter;
    gDateComponentsFormatter = v17;

    [(id)gDateComponentsFormatter setUnitsStyle:0];
  }
  double v19 = (void *)gTodayFormatter;
  CGFloat v20 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)a4];
  double v21 = [v19 stringFromDate:v20];

  v54 = v10;
  if (!a4)
  {
    double v31 = [(id)gNumberFormatter stringFromNumber:&unk_26E929EA0];
    double v25 = @"DAY_FORMAT_HOURS_AHEAD";
    double v26 = @"HOURS_AHEAD";
    if (!v11) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (a4 >= 0) {
    unint64_t v22 = a4;
  }
  else {
    unint64_t v22 = -a4;
  }
  if (v22 <= 0xE0F)
  {
    BOOL v23 = @"DAY_FORMAT_MINUTES_BEHIND";
    if (a4 <= 0)
    {
      double v24 = @"MINUTES_BEHIND";
    }
    else
    {
      BOOL v23 = @"DAY_FORMAT_MINUTES_AHEAD";
      double v24 = @"MINUTES_AHEAD";
    }
    double v25 = v23;
    double v26 = v24;
    double v27 = (void *)gNumberFormatter;
    if (a4 / 60 >= 0) {
      int64_t v28 = a4 / 60;
    }
    else {
      int64_t v28 = a4 / -60;
    }
    double v29 = [NSNumber numberWithInteger:v28];
    uint64_t v30 = [v27 stringFromNumber:v29];
    goto LABEL_31;
  }
  if (v22 == 3600)
  {
    double v32 = @"DAY_FORMAT_ONE_HOUR_BEHIND";
    if (a4 <= 0)
    {
      double v33 = @"ONE_HOUR_BEHIND";
    }
    else
    {
      double v32 = @"DAY_FORMAT_ONE_HOUR_AHEAD";
      double v33 = @"ONE_HOUR_AHEAD";
    }
    double v25 = v32;
    double v26 = v33;
    double v31 = [(id)gNumberFormatter stringFromNumber:&unk_26E929EB8];
    if (!v11) {
      goto LABEL_33;
    }
LABEL_32:
    uint64_t v37 = [(__CFString *)v25 stringByAppendingString:@"_TZ"];

    double v25 = (__CFString *)v37;
    goto LABEL_33;
  }
  if (a4 / 3600 >= 0) {
    int64_t v34 = a4 / 3600;
  }
  else {
    int64_t v34 = a4 / -3600;
  }
  if (a4 % 3600)
  {
    double v35 = @"DAY_FORMAT_HOURS_MINUTES_BEHIND";
    if (a4 <= 0)
    {
      double v36 = @"HOURS_MINUTES_BEHIND";
    }
    else
    {
      double v35 = @"DAY_FORMAT_HOURS_MINUTES_AHEAD";
      double v36 = @"HOURS_MINUTES_AHEAD";
    }
    double v25 = v35;
    double v26 = v36;
    double v29 = objc_opt_new();
    [v29 setHour:v34];
    [v29 setMinute:(2185 * (v22 % 0xE10)) >> 17];
    uint64_t v30 = [(id)gDateComponentsFormatter stringFromDateComponents:v29];
LABEL_31:
    double v31 = (void *)v30;

    if (!v11) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  objc_super v48 = @"DAY_FORMAT_HOURS_BEHIND";
  if (a4 > 0) {
    objc_super v48 = @"DAY_FORMAT_HOURS_AHEAD";
  }
  int64_t v49 = v34;
  if (a4 <= 0) {
    CGRect v50 = @"HOURS_BEHIND";
  }
  else {
    CGRect v50 = @"HOURS_AHEAD";
  }
  double v25 = v48;
  double v26 = v50;
  CGRect v51 = (void *)gNumberFormatter;
  v52 = [NSNumber numberWithInteger:v49];
  double v31 = [v51 stringFromNumber:v52];

  if (v11) {
    goto LABEL_32;
  }
LABEL_33:
  v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v39 = [v38 localizedStringForKey:v25 value:&stru_26E926B18 table:@"MobileTimerUI"];

  if (v7)
  {
    uint64_t v40 = [(__CFString *)v26 stringByAppendingString:@"_SPACE"];

    double v26 = (__CFString *)v40;
  }
  double v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v42 = [v41 localizedStringForKey:v26 value:&stru_26E926B18 table:@"MobileTimerUI"];

  double v43 = objc_msgSend(NSString, "stringWithFormat:", v42, v31);
  double v44 = objc_msgSend(NSString, "stringWithFormat:", v39, v21, v43, v11);
  v45 = v44;
  if (v53) {
    double v44 = v43;
  }
  id v46 = v44;

  return v46;
}

- (MTUIWorldClockCellViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTUIWorldClockCellViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (MTUIDigitalClockLabel)digitalClock
{
  return self->_digitalClock;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (UILabel)combinedLabel
{
  return self->_combinedLabel;
}

- (BOOL)shouldStackViews
{
  return self->_shouldStackViews;
}

- (void)setShouldStackViews:(BOOL)a3
{
  self->_shouldStackViews = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_digitalClock, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end