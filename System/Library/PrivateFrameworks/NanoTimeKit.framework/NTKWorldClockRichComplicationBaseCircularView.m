@interface NTKWorldClockRichComplicationBaseCircularView
- (BOOL)_shouldAnimateWithTemplateUpdateReason:(int64_t)a3;
- (NTKWorldClockRichComplicationBaseCircularView)initWithFamily:(int64_t)a3;
- (UIColor)daytimeBackgroundColor;
- (UIColor)daytimeHandsColor;
- (UIColor)daytimeHandsDotColor;
- (UIColor)nighttimeBackgroundColor;
- (UIColor)nighttimeHandsColor;
- (UIColor)nighttimeHandsDotColor;
- (int64_t)tritiumUpdateMode;
- (void)_applyPaused;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)_startClockUpdates;
- (void)_stopClockUpdates;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDaytimeBackgroundColor:(id)a3;
- (void)setDaytimeHandsColor:(id)a3;
- (void)setDaytimeHandsDotColor:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setNighttimeBackgroundColor:(id)a3;
- (void)setNighttimeHandsColor:(id)a3;
- (void)setNighttimeHandsDotColor:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setTintedFraction:(double)a3;
- (void)setTintedPlatterColor:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKWorldClockRichComplicationBaseCircularView

- (NTKWorldClockRichComplicationBaseCircularView)initWithFamily:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NTKWorldClockRichComplicationBaseCircularView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v13, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    v6 = [(CDRichComplicationView *)v4 device];
    if (a3 == 12)
    {
      v7 = NTKWorldClockGraphicCircularExtraLargeView;
    }
    else
    {
      if (a3 != 10)
      {
        p_super = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          -[NTKWorldClockRichComplicationBaseCircularView initWithFamily:](a3, p_super);
        }
        goto LABEL_9;
      }
      v7 = NTKWorldClockGraphicCircularView;
    }
    uint64_t v8 = [[v7 alloc] initFullColorImageViewWithDevice:v6];
    p_super = &v5->_worldClockCircularView->super.super.super;
    v5->_worldClockCircularView = (NTKWorldClockGraphicCircularView *)v8;
LABEL_9:

    [(NTKWorldClockRichComplicationBaseCircularView *)v5 _applyPaused];
    v10 = [(CDRichComplicationView *)v5 filterProvider];
    [(NTKWorldClockGraphicCircularView *)v5->_worldClockCircularView setFilterProvider:v10];

    v11 = [(NTKRichComplicationCircularBaseView *)v5 contentView];
    [v11 addSubview:v5->_worldClockCircularView];
  }
  return v5;
}

- (void)dealloc
{
  [(NTKWorldClockRichComplicationBaseCircularView *)self _stopClockUpdates];
  v3.receiver = self;
  v3.super_class = (Class)NTKWorldClockRichComplicationBaseCircularView;
  [(NTKWorldClockRichComplicationBaseCircularView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NTKWorldClockRichComplicationBaseCircularView;
  [(NTKRichComplicationCircularBaseView *)&v12 layoutSubviews];
  objc_super v3 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[NTKWorldClockGraphicCircularView setFrame:](self->_worldClockCircularView, "setFrame:", v5, v7, v9, v11);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v20 = [a3 metadata];
  double v6 = [v20 objectForKeyedSubscript:@"NTKWorldClockComplicationShowIdealizedTimeKey"];
  int v7 = [v6 BOOLValue];

  double v8 = [v20 objectForKeyedSubscript:@"NTKWorldClockComplicationIsPrivacyKey"];
  uint64_t v9 = [v8 BOOLValue];

  if (!v9)
  {
    double v11 = [(CDRichComplicationView *)self timeTravelDate];

    if (v11)
    {
      double v10 = [(CDRichComplicationView *)self timeTravelDate];
      if (!v10) {
        goto LABEL_9;
      }
      goto LABEL_6;
    }
    if (!v7) {
      goto LABEL_9;
    }
  }
  double v10 = NTKIdealizedDate();
  if (!v10)
  {
LABEL_9:
    id v12 = +[NTKDate faceDate];
    objc_super v13 = 0;
    if (!v9) {
      goto LABEL_10;
    }
LABEL_7:
    v14 = NTKClockFaceLocalizedString(@"WORLDCLOCK_PRIVACY_REDACTION_TEXT", @"--");
    v15 = objc_msgSend(off_1E62BDB30, "transitInfoForDate:location:", v12, 0.0, 0.0);
    goto LABEL_11;
  }
LABEL_6:
  id v12 = v10;
  objc_super v13 = v12;
  if (v9) {
    goto LABEL_7;
  }
LABEL_10:
  v16 = [v20 objectForKeyedSubscript:@"NTKWorldClockComplicationCityKey"];
  v14 = NTKWorldClockCityAbbreviation(v16);
  v17 = [v16 alCity];
  v15 = [off_1E62BDB30 transitInfoForDate:v12 city:v17];

LABEL_11:
  v18 = [v20 objectForKeyedSubscript:@"NTKWorldClockComplicationTimeZoneKey"];
  v19 = [[NTKWorldClockGraphicCircularViewConfiguration alloc] initWithTimeZone:v18 labelText:v14 transitInfo:v15 inTritium:0 overrideDate:v13 isPrivacy:v9];
  [(NTKWorldClockGraphicCircularView *)self->_worldClockCircularView applyConfiguration:v19 animated:[(NTKWorldClockRichComplicationBaseCircularView *)self _shouldAnimateWithTemplateUpdateReason:a4]];
  [(NTKWorldClockRichComplicationBaseCircularView *)self _applyPaused];
}

- (void)setPaused:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKWorldClockRichComplicationBaseCircularView;
  [(CDRichComplicationView *)&v4 setPaused:a3];
  [(NTKWorldClockRichComplicationBaseCircularView *)self _applyPaused];
}

- (BOOL)_shouldAnimateWithTemplateUpdateReason:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 3;
}

- (void)_applyPaused
{
  if ([(CDRichComplicationView *)self paused])
  {
    [(NTKWorldClockRichComplicationBaseCircularView *)self _stopClockUpdates];
  }
  else
  {
    [(NTKWorldClockRichComplicationBaseCircularView *)self _startClockUpdates];
  }
}

- (void)_startClockUpdates
{
}

- (void)_stopClockUpdates
{
}

- (UIColor)daytimeBackgroundColor
{
  return [(NTKWorldClockGraphicCircularView *)self->_worldClockCircularView daytimeBackgroundColor];
}

- (void)setDaytimeBackgroundColor:(id)a3
{
}

- (UIColor)daytimeHandsColor
{
  return [(NTKWorldClockGraphicCircularView *)self->_worldClockCircularView daytimeHandsColor];
}

- (void)setDaytimeHandsColor:(id)a3
{
}

- (UIColor)nighttimeBackgroundColor
{
  return [(NTKWorldClockGraphicCircularView *)self->_worldClockCircularView nighttimeBackgroundColor];
}

- (void)setNighttimeBackgroundColor:(id)a3
{
}

- (UIColor)nighttimeHandsColor
{
  return [(NTKWorldClockGraphicCircularView *)self->_worldClockCircularView nighttimeHandsColor];
}

- (void)setNighttimeHandsColor:(id)a3
{
}

- (int64_t)tritiumUpdateMode
{
  return 1;
}

- (void)setTintedFraction:(double)a3
{
}

- (void)setTintedPlatterColor:(id)a3
{
}

- (void)setFilterProvider:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKWorldClockRichComplicationBaseCircularView;
  id v4 = a3;
  [(CDRichComplicationView *)&v5 setFilterProvider:v4];
  -[NTKWorldClockGraphicCircularView setFilterProvider:](self->_worldClockCircularView, "setFilterProvider:", v4, v5.receiver, v5.super_class);
}

- (void)updateMonochromeColor
{
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
}

- (UIColor)daytimeHandsDotColor
{
  return self->_daytimeHandsDotColor;
}

- (void)setDaytimeHandsDotColor:(id)a3
{
}

- (UIColor)nighttimeHandsDotColor
{
  return self->_nighttimeHandsDotColor;
}

- (void)setNighttimeHandsDotColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nighttimeHandsDotColor, 0);
  objc_storeStrong((id *)&self->_daytimeHandsDotColor, 0);
  objc_storeStrong((id *)&self->_worldClockCircularView, 0);
}

- (void)initWithFamily:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  objc_super v3 = "-[NTKWorldClockRichComplicationBaseCircularView initWithFamily:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Unhandled complication family in %s world clock rich circular view creation: %ld", (uint8_t *)&v2, 0x16u);
}

@end