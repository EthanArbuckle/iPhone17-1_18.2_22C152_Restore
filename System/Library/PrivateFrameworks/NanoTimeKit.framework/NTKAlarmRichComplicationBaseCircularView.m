@interface NTKAlarmRichComplicationBaseCircularView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (BOOL)_pairedDeviceSupportsComplicationSymbols;
- (NTKAlarmRichComplicationBaseCircularView)initWithFamily:(int64_t)a3;
- (int64_t)_backgroundFilterStyle;
- (int64_t)_foregroundFilterStyle;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKAlarmRichComplicationBaseCircularView

- (NTKAlarmRichComplicationBaseCircularView)initWithFamily:(int64_t)a3
{
  v76[2] = *MEMORY[0x1E4F143B8];
  v75.receiver = self;
  v75.super_class = (Class)NTKAlarmRichComplicationBaseCircularView;
  v3 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v75, sel_initWithFamily_);
  v4 = v3;
  if (!v3) {
    return v4;
  }
  v3->_layout = 0;
  id v5 = [(CDRichComplicationView *)v3 device];
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_38);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_38);
  if (!WeakRetained) {
    goto LABEL_6;
  }
  id v7 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_38);
  if (v7 != v5)
  {

LABEL_6:
    id v10 = objc_storeWeak(&_LayoutConstants___cachedDevice_38, v5);
    _LayoutConstants___previousCLKDeviceVersion_38 = [v5 version];

    ___LayoutConstants_block_invoke_35(v11, (uint64_t)v5);
    goto LABEL_7;
  }
  uint64_t v8 = [v5 version];
  BOOL v9 = v8 == _LayoutConstants___previousCLKDeviceVersion_38;

  if (!v9) {
    goto LABEL_6;
  }
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_38);
  if (a3 == 12)
  {
    v13 = &_LayoutConstants___constantsGraphicExtraLarge_2;
  }
  else
  {
    if (a3 != 10)
    {
      v12 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        _LayoutConstants_cold_1(a3, v12);
      }
    }
    v13 = &_LayoutConstants___constantsGraphicCircular_2;
  }
  long long v14 = v13[6];
  long long v15 = v13[7];
  long long v16 = v13[4];
  long long v71 = v13[5];
  long long v72 = v14;
  long long v17 = v13[8];
  long long v73 = v15;
  long long v74 = v17;
  long long v18 = v13[2];
  long long v69 = v13[3];
  long long v70 = v16;
  long long v19 = *v13;
  long long v67 = v13[1];
  long long v68 = v18;
  *(_OWORD *)location = v19;

  *(_OWORD *)&v4->_layoutConstants.designatorLabelFontSize = v71;
  *(_OWORD *)&v4->_layoutConstants.designatorLabel12HourTimeLeadingLayoutBottom = v72;
  *(_OWORD *)&v4->_layoutConstants.snoozeIconTop = v73;
  *(_OWORD *)&v4->_layoutConstants.alarmSymbolPointSize = v74;
  *(_OWORD *)&v4->_layoutConstants.timeLabel12HourTimeLeadingLayoutBottom = v67;
  *(_OWORD *)&v4->_layoutConstants.timeLabel24HourLayoutFontSize = v68;
  *(_OWORD *)&v4->_layoutConstants.timeLabel24HourLayoutBottom = v69;
  *(_OWORD *)&v4->_layoutConstants.timeLabelSnoozeLayoutMaxWidth = v70;
  *(_OWORD *)&v4->_layoutConstants.timeLabel12HourLayoutFontSize = *(_OWORD *)location;

  objc_initWeak(location, v4);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__NTKAlarmRichComplicationBaseCircularView_initWithFamily___block_invoke;
  aBlock[3] = &unk_1E62C0068;
  objc_copyWeak(&v65, location);
  v59 = _Block_copy(aBlock);
  v20 = (CLKUIColoringLabel *)objc_alloc_init((Class)off_1E62BDB58);
  timeLabel = v4->_timeLabel;
  v4->_timeLabel = v20;

  [(CLKUIColoringLabel *)v4->_timeLabel setInTimeTravel:0];
  [(CLKUIColoringLabel *)v4->_timeLabel setNeedsResizeHandler:v59];
  [(CLKUIColoringLabel *)v4->_timeLabel setHidden:1];
  objc_initWeak(&from, v4);
  v22 = v4->_timeLabel;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __59__NTKAlarmRichComplicationBaseCircularView_initWithFamily___block_invoke_2;
  v61[3] = &unk_1E62C0040;
  objc_copyWeak(&v62, &from);
  [(CLKUIColoringLabel *)v22 setNowProvider:v61];
  v23 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)v4->_timeLabel setTextColor:v23];

  v24 = [(NTKRichComplicationCircularBaseView *)v4 contentView];
  [v24 addSubview:v4->_timeLabel];

  v25 = (CLKUIColoringLabel *)objc_alloc_init((Class)off_1E62BDB58);
  designatorLabel = v4->_designatorLabel;
  v4->_designatorLabel = v25;

  [(CLKUIColoringLabel *)v4->_designatorLabel setInTimeTravel:0];
  [(CLKUIColoringLabel *)v4->_designatorLabel setNeedsResizeHandler:v59];
  [(CLKUIColoringLabel *)v4->_designatorLabel setHidden:1];
  v27 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:v4->_layoutConstants.designatorLabelFontSize design:*MEMORY[0x1E4FB09E0]];
  v58 = [v27 CLKFontWithAlternativePunctuation];

  [(CLKUIColoringLabel *)v4->_designatorLabel setFont:v58];
  v28 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [(CLKUIColoringLabel *)v4->_designatorLabel setTextColor:v28];

  v29 = [(NTKRichComplicationCircularBaseView *)v4 contentView];
  [v29 addSubview:v4->_designatorLabel];

  if (![(NTKAlarmRichComplicationBaseCircularView *)v4 _pairedDeviceSupportsComplicationSymbols])
  {
    id v46 = objc_alloc(MEMORY[0x1E4FB1838]);
    if (a3 == 12) {
      v47 = @"graphicExtraLargeAlarm";
    }
    else {
      v47 = @"graphicCircularAlarm";
    }
    NTKImageNamed(v47);
  }
  v30 = [MEMORY[0x1E4FB1830] configurationWithPointSize:v4->_layoutConstants.alarmSymbolPointSize];
  v31 = (void *)MEMORY[0x1E4FB1830];
  v32 = [MEMORY[0x1E4FB1618] whiteColor];
  v76[0] = v32;
  v33 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  v76[1] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
  v35 = [v31 _configurationWithHierarchicalColors:v34];

  v36 = [v30 configurationByApplyingConfiguration:v35];
  v37 = [MEMORY[0x1E4FB1818] systemImageNamed:@"alarm" withConfiguration:v36];
  v38 = [MEMORY[0x1E4FB1830] configurationWithPointSize:v4->_layoutConstants.snoozeSymbolPointSize];
  v39 = [MEMORY[0x1E4FB1818] systemImageNamed:@"zzz" withConfiguration:v38];
  v40 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  v41 = [v39 imageWithTintColor:v40 renderingMode:1];

  uint64_t v42 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v37];
  idleImageView = v4->_idleImageView;
  v4->_idleImageView = (UIImageView *)v42;

  uint64_t v44 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v41];
  snoozeImageView = v4->_snoozeImageView;
  v4->_snoozeImageView = (UIImageView *)v44;

  [(UIImageView *)v4->_idleImageView setHidden:0];
  v48 = [(NTKRichComplicationCircularBaseView *)v4 contentView];
  [v48 addSubview:v4->_idleImageView];

  [(UIImageView *)v4->_snoozeImageView setHidden:1];
  v49 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [(UIImageView *)v4->_snoozeImageView setTintColor:v49];

  v50 = [(NTKRichComplicationCircularBaseView *)v4 contentView];
  [v50 addSubview:v4->_snoozeImageView];

  v51 = [NTKRichComplicationRingProgressView alloc];
  double snoozeRingStrokeWidth = v4->_layoutConstants.snoozeRingStrokeWidth;
  v53 = [(CDRichComplicationView *)v4 device];
  uint64_t v54 = [(NTKRichComplicationRingProgressView *)v51 initWithFamily:a3 curveWidth:v53 padding:snoozeRingStrokeWidth forDevice:0.0];
  snoozeProgressView = v4->_snoozeProgressView;
  v4->_snoozeProgressView = (NTKRichComplicationRingProgressView *)v54;

  [(CDRichComplicationProgressView *)v4->_snoozeProgressView setFilterProvider:v4];
  [(CDRichComplicationProgressView *)v4->_snoozeProgressView setStyle:1];
  [(NTKRichComplicationRingProgressView *)v4->_snoozeProgressView setHidden:1];
  v56 = [(NTKRichComplicationCircularBaseView *)v4 contentView];
  [v56 addSubview:v4->_snoozeProgressView];

  objc_destroyWeak(&v62);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v65);
  objc_destroyWeak(location);
  return v4;
}

void __59__NTKAlarmRichComplicationBaseCircularView_initWithFamily___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

id __59__NTKAlarmRichComplicationBaseCircularView_initWithFamily___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = (id)MEMORY[0x1E4F19A20];
  }
  v3 = [WeakRetained complicationDate];

  return v3;
}

- (BOOL)_pairedDeviceSupportsComplicationSymbols
{
  v2 = [(CDRichComplicationView *)self device];
  char v3 = [v2 isRunningGloryGMOrLater];

  return v3;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)NTKAlarmRichComplicationBaseCircularView;
  [(NTKRichComplicationCircularBaseView *)&v36 layoutSubviews];
  char v3 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v3 bounds];
  uint64_t v32 = v5;
  uint64_t v34 = v4;
  double v7 = v6;
  double v9 = v8;

  unint64_t layout = self->_layout;
  switch(layout)
  {
    case 2uLL:
      p_timeLabel12HourLayoutMaxWidth = &self->_layoutConstants.timeLabel12HourLayoutMaxWidth;
      p_timeLabel12HourDesignatorLeadingLayoutBottom = &self->_layoutConstants.timeLabel12HourDesignatorLeadingLayoutBottom;
      double designatorLabel12HourDesignatorLeadingLayoutBottom = self->_layoutConstants.designatorLabel12HourDesignatorLeadingLayoutBottom;
      goto LABEL_9;
    case 3uLL:
      p_timeLabel12HourLayoutMaxWidth = &self->_layoutConstants.timeLabel24HourLayoutMaxWidth;
      p_timeLabel12HourDesignatorLeadingLayoutBottom = &self->_layoutConstants.timeLabel24HourLayoutBottom;
      goto LABEL_7;
    case 4uLL:
      p_timeLabel12HourLayoutMaxWidth = &self->_layoutConstants.timeLabelSnoozeLayoutMaxWidth;
      p_timeLabel12HourDesignatorLeadingLayoutBottom = &self->_layoutConstants.timeLabelSnoozeLayoutBottom;
LABEL_7:
      double designatorLabel12HourDesignatorLeadingLayoutBottom = 0.0;
      goto LABEL_9;
  }
  p_timeLabel12HourLayoutMaxWidth = &self->_layoutConstants.timeLabel12HourLayoutMaxWidth;
  p_timeLabel12HourDesignatorLeadingLayoutBottom = &self->_layoutConstants.timeLabel12HourTimeLeadingLayoutBottom;
  double designatorLabel12HourDesignatorLeadingLayoutBottom = self->_layoutConstants.designatorLabel12HourTimeLeadingLayoutBottom;
LABEL_9:
  double v14 = *p_timeLabel12HourLayoutMaxWidth;
  double v15 = *p_timeLabel12HourDesignatorLeadingLayoutBottom;
  -[CLKUIColoringLabel setMaxWidth:](self->_timeLabel, "setMaxWidth:", *p_timeLabel12HourLayoutMaxWidth, v32, v34);
  [(CLKUIColoringLabel *)self->_timeLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_timeLabel frame];
  double v18 = v17;
  if (v16 < v14) {
    double v14 = v16;
  }
  long long v19 = [(CLKUIColoringLabel *)self->_timeLabel font];
  [v19 ascender];
  *(float *)&double v20 = v15 - v20;
  double v21 = ceilf(*(float *)&v20);

  -[CLKUIColoringLabel setFrame:](self->_timeLabel, "setFrame:", (v7 - v14) * 0.5, v21, v14, v18);
  [(CLKUIColoringLabel *)self->_designatorLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_designatorLabel frame];
  double v24 = v23;
  if (v22 >= self->_layoutConstants.designatorLabelMaxWidth) {
    double designatorLabelMaxWidth = self->_layoutConstants.designatorLabelMaxWidth;
  }
  else {
    double designatorLabelMaxWidth = v22;
  }
  v26 = [(CLKUIColoringLabel *)self->_designatorLabel font];
  [v26 ascender];
  *(float *)&double v27 = designatorLabel12HourDesignatorLeadingLayoutBottom - v27;
  double v28 = ceilf(*(float *)&v27);

  -[CLKUIColoringLabel setFrame:](self->_designatorLabel, "setFrame:", (v7 - designatorLabelMaxWidth) * 0.5, v28, designatorLabelMaxWidth, v24);
  [(UIImageView *)self->_idleImageView sizeToFit];
  [(UIImageView *)self->_idleImageView frame];
  -[UIImageView setFrame:](self->_idleImageView, "setFrame:", (v7 - v29) * 0.5, (v9 - v30) * 0.5);
  [(UIImageView *)self->_snoozeImageView sizeToFit];
  [(UIImageView *)self->_snoozeImageView frame];
  -[UIImageView setFrame:](self->_snoozeImageView, "setFrame:", (v7 - v31) * 0.5, self->_layoutConstants.snoozeIconTop);
  -[NTKRichComplicationRingProgressView setFrame:](self->_snoozeProgressView, "setFrame:", v35, v33, v7, v9);
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v26 = a3;
  uint64_t v5 = [v26 metadata];
  double v6 = [v5 objectForKeyedSubscript:@"NTKAlarmComplicationMetadataStateKey"];

  if ([v6 isEqualToString:@"NTKAlarmComplicationMetadataStateValue_Idle"])
  {
    self->_unint64_t layout = 0;
    [(UIImageView *)self->_idleImageView setHidden:0];
    [(CLKUIColoringLabel *)self->_timeLabel setHidden:1];
    [(CLKUIColoringLabel *)self->_designatorLabel setHidden:1];
    [(UIImageView *)self->_snoozeImageView setHidden:1];
    [(NTKRichComplicationRingProgressView *)self->_snoozeProgressView setHidden:1];
    goto LABEL_17;
  }
  double v7 = [v26 metadata];
  double v8 = [v7 objectForKeyedSubscript:@"NTKAlarmComplicationMetadataTimeTextProviderKey"];

  if ([v6 isEqualToString:@"NTKAlarmComplicationMetadataStateValue_Set"])
  {
    double v9 = [v26 metadata];
    id v10 = [v9 objectForKeyedSubscript:@"NTKAlarmComplicationMetadataDesignatorTextProviderKey"];

    uint64_t v11 = [v26 metadata];
    v12 = [v11 objectForKeyedSubscript:@"NTKAlarmComplicationMetadataDesignatorExistsKey"];
    int v13 = [v12 BOOLValue];

    if (v8 && v10 && v13)
    {
      [(UIImageView *)self->_idleImageView setHidden:1];
      double v14 = [v26 metadata];
      double v15 = [v14 objectForKeyedSubscript:@"NTKAlarmComplicationMetadataDesignatorLeadsKey"];
      int v16 = [v15 BOOLValue];

      if (v16) {
        unint64_t v17 = 2;
      }
      else {
        unint64_t v17 = 1;
      }
      self->_unint64_t layout = v17;
      [(CLKUIColoringLabel *)self->_timeLabel setHidden:0];
      [(CLKUIColoringLabel *)self->_timeLabel setTextProvider:v8];
      double v18 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:self->_layoutConstants.timeLabel12HourLayoutFontSize design:*MEMORY[0x1E4FB09E0]];
      long long v19 = [v18 CLKFontWithAlternativePunctuation];
      [(CLKUIColoringLabel *)self->_timeLabel setFont:v19];

      [(CLKUIColoringLabel *)self->_designatorLabel setHidden:0];
      [(CLKUIColoringLabel *)self->_designatorLabel setTextProvider:v10];
    }
    else
    {
      self->_unint64_t layout = 3;
      [(UIImageView *)self->_idleImageView setHidden:1];
      [(CLKUIColoringLabel *)self->_timeLabel setHidden:0];
      [(CLKUIColoringLabel *)self->_timeLabel setTextProvider:v8];
      double v24 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:self->_layoutConstants.timeLabel24HourLayoutFontSize design:*MEMORY[0x1E4FB09E0]];
      v25 = [v24 CLKFontWithAlternativePunctuation];
      [(CLKUIColoringLabel *)self->_timeLabel setFont:v25];

      [(CLKUIColoringLabel *)self->_designatorLabel setHidden:1];
    }
    [(UIImageView *)self->_snoozeImageView setHidden:1];
    [(NTKRichComplicationRingProgressView *)self->_snoozeProgressView setHidden:1];
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"NTKAlarmComplicationMetadataStateValue_Snooze"])
  {
    self->_unint64_t layout = 4;
    [(UIImageView *)self->_idleImageView setHidden:1];
    [(CLKUIColoringLabel *)self->_timeLabel setHidden:0];
    [(CLKUIColoringLabel *)self->_timeLabel setTextProvider:v8];
    double v20 = [(CLKUIColoringLabel *)self->_timeLabel textProvider];
    [v20 setPaused:0];

    double v21 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:self->_layoutConstants.timeLabelSnoozeLayoutFontSize design:*MEMORY[0x1E4FB09E0]];
    double v22 = [v21 CLKFontWithAlternativePunctuation];
    [(CLKUIColoringLabel *)self->_timeLabel setFont:v22];

    [(CLKUIColoringLabel *)self->_designatorLabel setHidden:1];
    [(UIImageView *)self->_snoozeImageView setHidden:0];
    [(NTKRichComplicationRingProgressView *)self->_snoozeProgressView setHidden:0];
    double v23 = [v26 metadata];
    id v10 = [v23 objectForKeyedSubscript:@"NTKAlarmComplicationMetadataGaugeProviderKey"];

    [(CDRichComplicationProgressView *)self->_snoozeProgressView setGaugeProvider:v10];
LABEL_15:
  }
LABEL_17:
  [(NTKAlarmRichComplicationBaseCircularView *)self setNeedsLayout];
  [(NTKRichComplicationCircularBaseView *)self _updatePlatterColor];
}

- (int64_t)_backgroundFilterStyle
{
  return 0;
}

- (int64_t)_foregroundFilterStyle
{
  return 2;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NTKAlarmRichComplicationBaseCircularView;
  -[NTKRichComplicationCircularBaseView transitionToMonochromeWithFraction:](&v13, sel_transitionToMonochromeWithFraction_);
  uint64_t v5 = [(CDRichComplicationView *)self filterProvider];
  double v6 = objc_msgSend(v5, "filtersForView:style:fraction:", self, -[NTKAlarmRichComplicationBaseCircularView _backgroundFilterStyle](self, "_backgroundFilterStyle"), a3);

  if (v6)
  {
    double v7 = [(UIImageView *)self->_idleImageView layer];
    [v7 setFilters:v6];

    double v8 = [(CLKUIColoringLabel *)self->_designatorLabel layer];
    [v8 setFilters:v6];

    double v9 = [(UIImageView *)self->_snoozeImageView layer];
    [v9 setFilters:v6];
  }
  id v10 = [(CDRichComplicationView *)self filterProvider];
  uint64_t v11 = objc_msgSend(v10, "filtersForView:style:fraction:", self, -[NTKAlarmRichComplicationBaseCircularView _foregroundFilterStyle](self, "_foregroundFilterStyle"), a3);

  if (v11)
  {
    v12 = [(CLKUIColoringLabel *)self->_timeLabel layer];
    [v12 setFilters:v11];
  }
  [(CDRichComplicationProgressView *)self->_snoozeProgressView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  v11.receiver = self;
  v11.super_class = (Class)NTKAlarmRichComplicationBaseCircularView;
  [(NTKRichComplicationCircularBaseView *)&v11 updateMonochromeColor];
  char v3 = [(CDRichComplicationView *)self filterProvider];
  uint64_t v4 = objc_msgSend(v3, "filtersForView:style:", self, -[NTKAlarmRichComplicationBaseCircularView _backgroundFilterStyle](self, "_backgroundFilterStyle"));

  if (v4)
  {
    uint64_t v5 = [(UIImageView *)self->_idleImageView layer];
    [v5 setFilters:v4];

    double v6 = [(CLKUIColoringLabel *)self->_designatorLabel layer];
    [v6 setFilters:v4];

    double v7 = [(UIImageView *)self->_snoozeImageView layer];
    [v7 setFilters:v4];
  }
  double v8 = [(CDRichComplicationView *)self filterProvider];
  double v9 = objc_msgSend(v8, "filtersForView:style:", self, -[NTKAlarmRichComplicationBaseCircularView _foregroundFilterStyle](self, "_foregroundFilterStyle"));

  if (v9)
  {
    id v10 = [(CLKUIColoringLabel *)self->_timeLabel layer];
    [v10 setFilters:v9];
  }
  [(CDRichComplicationProgressView *)self->_snoozeProgressView updateMonochromeColor];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snoozeProgressView, 0);
  objc_storeStrong((id *)&self->_snoozeImageView, 0);
  objc_storeStrong((id *)&self->_designatorLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_idleImageView, 0);
}

@end