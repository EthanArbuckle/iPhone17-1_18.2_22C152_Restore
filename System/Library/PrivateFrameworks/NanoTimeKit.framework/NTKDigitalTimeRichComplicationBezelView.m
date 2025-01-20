@interface NTKDigitalTimeRichComplicationBezelView
- (NTKDigitalTimeRichComplicationBezelView)init;
- (id)_createLabelViewWithFont:(id)a3;
- (void)dealloc;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
- (void)timeOffsetChanged;
- (void)updateDate;
@end

@implementation NTKDigitalTimeRichComplicationBezelView

- (NTKDigitalTimeRichComplicationBezelView)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKDigitalTimeRichComplicationBezelView;
  v2 = [(NTKRichComplicationBezelBaseTextView *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_timeOffsetChanged name:@"NTKTimeOffsetChangedNotification" object:0];

    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(NTKDigitalTimeRichComplicationBezelView *)v2 setBackgroundColor:v4];

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKDigitalTimeRichComplicationBezelView;
  [(NTKDigitalTimeRichComplicationBezelView *)&v4 dealloc];
}

- (id)_createLabelViewWithFont:(id)a3
{
  id v4 = a3;
  v5 = [(CDRichComplicationView *)self device];
  v6 = +[CLKUITimeLabel labelWithOptions:1 forDevice:v5];
  timeLabel = self->_timeLabel;
  self->_timeLabel = v6;

  [(CLKUITimeLabel *)self->_timeLabel setShowSeconds:1];
  [(CLKUITimeLabel *)self->_timeLabel setFont:v4];

  [(NTKDigitalTimeRichComplicationBezelView *)self timeOffsetChanged];
  v8 = self->_timeLabel;
  return v8;
}

- (void)timeOffsetChanged
{
  timeLabel = self->_timeLabel;
  id v3 = +[NTKTimeOffsetManager sharedManager];
  [v3 timeOffset];
  -[NTKDigitalTimeLabel setTimeOffset:](timeLabel, "setTimeOffset:");
}

- (void)updateDate
{
  id v3 = [(CDRichComplicationTemplateView *)self template];
  id v10 = [v3 metadata];

  id v4 = [v10 objectForKeyedSubscript:@"NTKTimerComplicationMetadataShouldDisplayIdealizedStateKey"];
  int v5 = [v4 BOOLValue];

  v6 = [(CDRichComplicationView *)self timeTravelDate];

  timeLabel = self->_timeLabel;
  if (v6)
  {
    uint64_t v8 = [(CDRichComplicationView *)self timeTravelDate];
LABEL_5:
    v9 = (void *)v8;
    [(NTKDigitalTimeLabel *)timeLabel setOverrideDate:v8 duration:0.0];

    goto LABEL_7;
  }
  if (v5)
  {
    uint64_t v8 = NTKIdealizedDate();
    goto LABEL_5;
  }
  [(NTKDigitalTimeLabel *)self->_timeLabel setOverrideDate:0 duration:0.0];
LABEL_7:
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = +[NTKTimeOffsetManager sharedManager];
  [v7 timeOffset];
  uint64_t v8 = objc_msgSend(v6, "dateByAddingTimeInterval:");

  v9.receiver = self;
  v9.super_class = (Class)NTKDigitalTimeRichComplicationBezelView;
  [(CDRichComplicationTemplateView *)&v9 setTimeTravelDate:v8 animated:v4];
  [(NTKDigitalTimeRichComplicationBezelView *)self updateDate];
}

- (void).cxx_destruct
{
}

@end