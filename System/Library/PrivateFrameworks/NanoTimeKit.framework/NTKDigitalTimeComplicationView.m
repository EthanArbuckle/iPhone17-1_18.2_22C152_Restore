@interface NTKDigitalTimeComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (BOOL)showsSeconds;
- (CDComplicationDisplayObserver)displayObserver;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKComplicationTemplate)template;
- (CLKDevice)device;
- (NSDate)timeTravelDate;
- (NTKDigitalTimeComplicationView)init;
- (NTKDigitalTimeLabel)timeLabel;
- (UIColor)textColor;
- (UIFont)font;
- (id)_createLabelViewWithFont:(id)a3;
- (id)_labelFont;
- (id)complicationTemplate;
- (unint64_t)textLayoutStyle;
- (unint64_t)timelineAnimationFadeTypeOverride;
- (void)layoutSubviews;
- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4;
- (void)setDevice:(id)a3;
- (void)setDisplayObserver:(id)a3;
- (void)setFont:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)setShowsSeconds:(BOOL)a3;
- (void)setTemplate:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextLayoutStyle:(unint64_t)a3;
- (void)setTimeLabel:(id)a3;
- (void)setTimeTravelDate:(id)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
- (void)timeOffsetChanged;
- (void)updateDate;
@end

@implementation NTKDigitalTimeComplicationView

- (NTKDigitalTimeComplicationView)init
{
  v11.receiver = self;
  v11.super_class = (Class)NTKDigitalTimeComplicationView;
  v2 = [(NTKDigitalTimeComplicationView *)&v11 init];
  if (v2)
  {
    v3 = +[CLKRenderingContext sharedRenderingContext];
    uint64_t v4 = [v3 device];
    device = v2->_device;
    v2->_device = (CLKDevice *)v4;

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel_timeOffsetChanged name:@"NTKTimeOffsetChangedNotification" object:0];

    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(NTKDigitalTimeComplicationView *)v2 setBackgroundColor:v7];

    v2->_showsSeconds = 1;
    v8 = [(NTKDigitalTimeComplicationView *)v2 _labelFont];
    v9 = [(NTKDigitalTimeComplicationView *)v2 _createLabelViewWithFont:v8];
    [(NTKDigitalTimeComplicationView *)v2 addSubview:v9];
  }
  return v2;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKDigitalTimeComplicationView;
  [(NTKDigitalTimeComplicationView *)&v3 layoutSubviews];
  MEMORY[0x1C1874A70]([(NTKDigitalTimeComplicationView *)self bounds]);
  -[NTKDigitalTimeLabel setCenter:](self->_timeLabel, "setCenter:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[CLKUITimeLabel sizeThatFits:](self->_timeLabel, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  v8 = [(NTKDigitalTimeComplicationView *)self device];
  _LayoutConstants_43(v8);
  double v10 = v9;

  double v11 = v5 + v10;
  double v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)_labelFont
{
  v2 = [(NTKDigitalTimeComplicationView *)self device];
  double v3 = _LayoutConstants_43(v2);

  double v4 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:v3 design:*MEMORY[0x1E4FB09E0]];
  double v5 = [v4 CLKFontWithAlternativePunctuation];

  return v5;
}

- (id)_createLabelViewWithFont:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKDigitalTimeComplicationView *)self device];
  double v6 = +[CLKUITimeLabel labelWithOptions:0 forDevice:v5];
  timeLabel = self->_timeLabel;
  self->_timeLabel = v6;

  v8 = [MEMORY[0x1E4FB1618] clearColor];
  [(NTKDigitalTimeLabel *)self->_timeLabel setBackgroundColor:v8];

  [(CLKUITimeLabel *)self->_timeLabel setShowSeconds:self->_showsSeconds];
  [(CLKUITimeLabel *)self->_timeLabel setFont:v4];

  [(NTKDigitalTimeComplicationView *)self timeOffsetChanged];
  double v9 = self->_timeLabel;
  return v9;
}

- (void)timeOffsetChanged
{
  timeLabel = self->_timeLabel;
  id v3 = +[NTKTimeOffsetManager sharedManager];
  [v3 timeOffset];
  -[NTKDigitalTimeLabel setTimeOffset:](timeLabel, "setTimeOffset:");
}

- (void)setOverrideDate:(id)a3
{
  [(NTKDigitalTimeLabel *)self->_timeLabel setOverrideDate:a3 duration:0.0];
  [(CLKUITimeLabel *)self->_timeLabel sizeToFit];
  [(NTKDigitalTimeComplicationView *)self setNeedsLayout];
}

- (void)setTextColor:(id)a3
{
  id v6 = a3;
  id v4 = [(CLKUITimeLabel *)self->_timeLabel textColor];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0) {
    [(NTKDigitalTimeLabel *)self->_timeLabel setTextColor:v6];
  }
}

- (UIColor)textColor
{
  return [(CLKUITimeLabel *)self->_timeLabel textColor];
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  id v4 = [(CLKUITimeLabel *)self->_timeLabel font];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0)
  {
    [(CLKUITimeLabel *)self->_timeLabel setFont:v6];
    [(CLKUITimeLabel *)self->_timeLabel sizeToFit];
  }
}

- (UIFont)font
{
  return [(CLKUITimeLabel *)self->_timeLabel font];
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4
{
  objc_storeStrong((id *)&self->_template, a3);
  [(NTKDigitalTimeComplicationView *)self updateDate];
  [(NTKDigitalTimeComplicationView *)self setNeedsLayout];
}

- (id)complicationTemplate
{
  return self->_template;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return *MEMORY[0x1E4F19650] == a3;
}

- (unint64_t)timelineAnimationFadeTypeOverride
{
  v2 = [(CLKComplicationTemplate *)self->_template metadata];
  id v3 = [v2 objectForKeyedSubscript:@"NTKComplicationTimelineAnimationFadeType"];

  if (v3) {
    unint64_t v4 = [v3 integerValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v6 = +[NTKTimeOffsetManager sharedManager];
  [v6 timeOffset];
  objc_msgSend(v5, "dateByAddingTimeInterval:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [(NTKDigitalTimeComplicationView *)self setTimeTravelDate:v7];
  [(NTKDigitalTimeComplicationView *)self updateDate];
}

- (void)updateDate
{
  id v3 = [(NTKDigitalTimeComplicationView *)self template];
  id v9 = [v3 metadata];

  unint64_t v4 = [v9 objectForKeyedSubscript:@"NTKTimerComplicationMetadataShouldDisplayIdealizedStateKey"];
  int v5 = [v4 BOOLValue];

  id v6 = [(NTKDigitalTimeComplicationView *)self timeTravelDate];

  if (v6)
  {
    uint64_t v7 = [(NTKDigitalTimeComplicationView *)self timeTravelDate];
LABEL_5:
    v8 = (void *)v7;
    [(NTKDigitalTimeComplicationView *)self setOverrideDate:v7];

    goto LABEL_7;
  }
  if (v5)
  {
    uint64_t v7 = NTKIdealizedDate();
    goto LABEL_5;
  }
  [(NTKDigitalTimeComplicationView *)self setOverrideDate:0];
LABEL_7:
}

- (CDComplicationDisplayObserver)displayObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->displayObserver);
  return (CDComplicationDisplayObserver *)WeakRetained;
}

- (void)setDisplayObserver:(id)a3
{
}

- (unint64_t)textLayoutStyle
{
  return self->textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->textLayoutStyle = a3;
}

- (BOOL)showsSeconds
{
  return self->_showsSeconds;
}

- (void)setShowsSeconds:(BOOL)a3
{
  self->_showsSeconds = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NTKDigitalTimeLabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (CLKComplicationTemplate)template
{
  return self->_template;
}

- (void)setTemplate:(id)a3
{
}

- (NSDate)timeTravelDate
{
  return self->_timeTravelDate;
}

- (void)setTimeTravelDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
  objc_storeStrong((id *)&self->_template, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->displayObserver);
}

@end