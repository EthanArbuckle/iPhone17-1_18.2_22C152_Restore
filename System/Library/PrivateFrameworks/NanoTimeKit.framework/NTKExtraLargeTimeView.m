@interface NTKExtraLargeTimeView
- (BOOL)isFrozen;
- (NSArray)fontScaleFactorForNumberSystemOverrides;
- (NTKDigitalTimeLabel)timeHourView;
- (NTKDigitalTimeLabel)timeMinuteView;
- (NTKExtraLargeTimeView)initWithFrame:(CGRect)a3 forDevice:(id)a4;
- (id)_timeLabelFont;
- (void)_configureTimeLabelsFont;
- (void)_updateNumbers;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBottomColor:(id)a3;
- (void)setFontScaleFactorForNumberSystemOverrides:(id)a3;
- (void)setForcedNumberSystem:(unint64_t)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setStatusBarVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setTimeHourView:(id)a3;
- (void)setTimeMinuteView:(id)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTopColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NTKExtraLargeTimeView

- (NTKExtraLargeTimeView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)NTKExtraLargeTimeView;
  v11 = -[NTKExtraLargeTimeView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    p_device = &v11->_device;
    objc_storeStrong((id *)&v11->_device, a4);
    v12->_numberSystem = -1;
    uint64_t v14 = +[CLKUITimeLabel labelWithOptions:1024 forDevice:*p_device];
    timeHourView = v12->_timeHourView;
    v12->_timeHourView = (NTKDigitalTimeLabel *)v14;

    v16 = v12->_timeHourView;
    v17 = [MEMORY[0x1E4FB1618] whiteColor];
    [(NTKDigitalTimeLabel *)v16 setTextColor:v17];

    [(NTKExtraLargeTimeView *)v12 addSubview:v12->_timeHourView];
    uint64_t v18 = +[CLKUITimeLabel labelWithOptions:2057 forDevice:*p_device];
    timeMinuteView = v12->_timeMinuteView;
    v12->_timeMinuteView = (NTKDigitalTimeLabel *)v18;

    v20 = v12->_timeMinuteView;
    v21 = [MEMORY[0x1E4FB1618] whiteColor];
    [(NTKDigitalTimeLabel *)v20 setTextColor:v21];

    [(NTKExtraLargeTimeView *)v12 addSubview:v12->_timeMinuteView];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v12, (CFNotificationCallback)_handleNumbersChangedNotification, @"AppleNumberPreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(NTKExtraLargeTimeView *)v12 _configureTimeLabelsFont];
    v23 = [MEMORY[0x1E4FB1618] clearColor];
    [(NTKExtraLargeTimeView *)v12 setBackgroundColor:v23];
  }
  return v12;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"AppleNumberPreferencesChangedNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)NTKExtraLargeTimeView;
  [(NTKExtraLargeTimeView *)&v4 dealloc];
}

- (NSArray)fontScaleFactorForNumberSystemOverrides
{
  fontScaleFactorForNumberSystemOverrides = self->_fontScaleFactorForNumberSystemOverrides;
  if (!fontScaleFactorForNumberSystemOverrides)
  {
    self->_fontScaleFactorForNumberSystemOverrides = (NSArray *)&unk_1F16E8CE0;

    fontScaleFactorForNumberSystemOverrides = self->_fontScaleFactorForNumberSystemOverrides;
  }
  return fontScaleFactorForNumberSystemOverrides;
}

- (void)layoutSubviews
{
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  _LayoutConstants_3(self->_device, (uint64_t)&v20);
  BOOL IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  [(NTKExtraLargeTimeView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  v8 = (double *)&v23 + 1;
  if (!IsBoldTextEnabled) {
    v8 = (double *)&v21 + 1;
  }
  double v9 = *v8;
  if (IsBoldTextEnabled) {
    id v10 = (double *)&v24;
  }
  else {
    id v10 = (double *)&v22;
  }
  double v11 = *v10;
  if (self->_statusBarVisible)
  {
    v12 = (double *)&v24 + 1;
    if (!IsBoldTextEnabled) {
      v12 = (double *)&v22 + 1;
    }
    double v9 = v9 + *v12;
    v13 = (double *)&v25;
    if (!IsBoldTextEnabled) {
      v13 = (double *)&v23;
    }
    double v11 = v11 + *v13;
  }
  double v14 = *(double *)&v21;
  [(CLKUITimeLabel *)self->_timeHourView sizeToFit];
  [(CLKUITimeLabel *)self->_timeMinuteView sizeToFit];
  [(NTKDigitalTimeLabel *)self->_timeHourView frame];
  double v16 = v7 * 0.5;
  -[NTKDigitalTimeLabel setFrame:](self->_timeHourView, "setFrame:", v5 - v15 - v14, v9, v15, v16);
  if (self->_numberSystem == 13) {
    double v17 = 0.0;
  }
  else {
    double v17 = v11;
  }
  [(NTKDigitalTimeLabel *)self->_timeMinuteView frame];
  timeMinuteView = self->_timeMinuteView;
  -[NTKDigitalTimeLabel setFrame:](timeMinuteView, "setFrame:", v5 - v18 - v14, v16 + v17);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKExtraLargeTimeView;
  id v4 = a3;
  [(NTKExtraLargeTimeView *)&v8 traitCollectionDidChange:v4];
  double v5 = [(NTKExtraLargeTimeView *)self traitCollection];
  uint64_t v6 = [v5 legibilityWeight];
  uint64_t v7 = [v4 legibilityWeight];

  if (v6 != v7)
  {
    [(NTKExtraLargeTimeView *)self _configureTimeLabelsFont];
    [(NTKExtraLargeTimeView *)self setNeedsLayout];
  }
}

- (void)setTopColor:(id)a3
{
}

- (void)setBottomColor:(id)a3
{
}

- (void)_configureTimeLabelsFont
{
  id v3 = [(NTKExtraLargeTimeView *)self _timeLabelFont];
  [(CLKUITimeLabel *)self->_timeHourView setTimeFont:v3 designatorFont:v3];
  [(CLKUITimeLabel *)self->_timeMinuteView setTimeFont:v3 designatorFont:v3];
}

- (id)_timeLabelFont
{
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  _LayoutConstants_3(self->_device, (uint64_t)v13);
  BOOL IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  id v4 = (double *)v13 + 1;
  if (!IsBoldTextEnabled) {
    id v4 = (double *)v13;
  }
  double v5 = *v4;
  if (NTKShowIndicScriptNumerals(self->_device))
  {
    if (self->_numberSystem != -1)
    {
      uint64_t v6 = [(NTKExtraLargeTimeView *)self fontScaleFactorForNumberSystemOverrides];
      uint64_t v7 = [v6 objectAtIndexedSubscript:self->_numberSystem];
      [v7 doubleValue];

      CLKRoundForDevice();
      double v5 = v8;
    }
    double v9 = +[NTKSFCompactFont numericSoftFontOfSize:v5 weight:*MEMORY[0x1E4FB09D0]];
  }
  else
  {
    double v9 = [MEMORY[0x1E4F19A50] compactSoftFontOfSize:v5 weight:*MEMORY[0x1E4FB09D0]];
    if (CLKLocaleCurrentNumberSystem() == 2)
    {
      id v10 = [v9 CLKFontWithMonospacedNumbers];
      uint64_t v11 = [v10 CLKFontWithAlternativePunctuation];

      double v9 = (void *)v11;
    }
  }
  return v9;
}

- (void)setStatusBarVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_statusBarVisible != a3)
  {
    BOOL v4 = a4;
    self->_statusBarVisible = a3;
    [(NTKExtraLargeTimeView *)self setNeedsLayout];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__NTKExtraLargeTimeView_setStatusBarVisible_animated___block_invoke;
    aBlock[3] = &unk_1E62BFF20;
    aBlock[4] = self;
    uint64_t v6 = _Block_copy(aBlock);
    uint64_t v7 = v6;
    if (v4) {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:0.2];
    }
    else {
      (*((void (**)(void *))v6 + 2))(v6);
    }
  }
}

uint64_t __54__NTKExtraLargeTimeView_setStatusBarVisible_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  timeHourView = self->_timeHourView;
  id v6 = a3;
  uint64_t v7 = [(CLKUITimeLabel *)timeHourView timeFormatter];
  [v7 setOverrideDate:v6];

  id v8 = [(CLKUITimeLabel *)self->_timeMinuteView timeFormatter];
  [v8 setOverrideDate:v6];
}

- (void)setTimeOffset:(double)a3
{
  -[NTKDigitalTimeLabel setTimeOffset:](self->_timeHourView, "setTimeOffset:");
  timeMinuteView = self->_timeMinuteView;
  [(NTKDigitalTimeLabel *)timeMinuteView setTimeOffset:a3];
}

- (void)setFrozen:(BOOL)a3
{
  self->_BOOL frozen = a3;
  -[CLKUITimeLabel setPaused:](self->_timeHourView, "setPaused:");
  timeMinuteView = self->_timeMinuteView;
  BOOL frozen = self->_frozen;
  [(CLKUITimeLabel *)timeMinuteView setPaused:frozen];
}

- (void)_updateNumbers
{
  [(NTKExtraLargeTimeView *)self _configureTimeLabelsFont];
  [(NTKExtraLargeTimeView *)self setNeedsLayout];
}

- (void)setForcedNumberSystem:(unint64_t)a3
{
  self->_numberSystem = a3;
  double v5 = [(NTKExtraLargeTimeView *)self timeHourView];
  [v5 setForcedNumberSystem:a3];

  id v6 = [(NTKExtraLargeTimeView *)self timeMinuteView];
  [v6 setForcedNumberSystem:a3];

  [(NTKExtraLargeTimeView *)self _configureTimeLabelsFont];
  [(NTKExtraLargeTimeView *)self setNeedsLayout];
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFontScaleFactorForNumberSystemOverrides:(id)a3
{
}

- (NTKDigitalTimeLabel)timeHourView
{
  return self->_timeHourView;
}

- (void)setTimeHourView:(id)a3
{
}

- (NTKDigitalTimeLabel)timeMinuteView
{
  return self->_timeMinuteView;
}

- (void)setTimeMinuteView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeMinuteView, 0);
  objc_storeStrong((id *)&self->_timeHourView, 0);
  objc_storeStrong((id *)&self->_fontScaleFactorForNumberSystemOverrides, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end