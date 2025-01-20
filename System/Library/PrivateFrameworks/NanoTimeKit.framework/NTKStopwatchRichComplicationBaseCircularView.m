@interface NTKStopwatchRichComplicationBaseCircularView
- (BOOL)templateWantsPlatter;
- (NTKStopwatchRichComplicationBaseCircularView)initWithFamily:(int64_t)a3;
- (double)_stopwatchCurrentTime;
- (int64_t)_backgroundFilterStyle;
- (int64_t)_foregroundFilterStyle;
- (void)_applyPausedUpdate;
- (void)_editingDidEnd;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)_updateDialProgress;
- (void)dealloc;
- (void)layoutSubviews;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKStopwatchRichComplicationBaseCircularView

- (NTKStopwatchRichComplicationBaseCircularView)initWithFamily:(int64_t)a3
{
  v55.receiver = self;
  v55.super_class = (Class)NTKStopwatchRichComplicationBaseCircularView;
  v3 = [(NTKRichComplicationCircularBaseView *)&v55 initWithFamily:a3];
  v4 = v3;
  if (!v3) {
    return v4;
  }
  p_stopwatchImageConfigPointSize = &v3->_layoutConstants.stopwatchImageConfigPointSize;
  v6 = [(CDRichComplicationView *)v3 device];
  uint64_t v7 = [(CDRichComplicationView *)v4 family];
  id v8 = v6;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_37);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_37);
  if (!WeakRetained) {
    goto LABEL_6;
  }
  v10 = WeakRetained;
  id v11 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_37);
  if (v11 != v8)
  {

LABEL_6:
    id v14 = objc_storeWeak(&_LayoutConstants___cachedDevice_37, v8);
    _LayoutConstants___previousCLKDeviceVersion_37 = [v8 version];

    ___LayoutConstants_block_invoke_34(v15, v8);
    goto LABEL_7;
  }
  uint64_t v12 = [v8 version];
  uint64_t v13 = _LayoutConstants___previousCLKDeviceVersion_37;

  if (v12 != v13) {
    goto LABEL_6;
  }
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_37);
  if (v7 == 12)
  {
    v17 = &_LayoutConstants___constantsGraphicExtraLarge_1;
  }
  else
  {
    if (v7 != 10)
    {
      v16 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        _LayoutConstants_cold_1(v7, v16);
      }
    }
    v17 = &_LayoutConstants___constantsGraphicCircular_1;
  }
  long long v18 = v17[2];
  long long v19 = v17[3];
  long long v20 = *v17;
  long long v51 = v17[1];
  long long v52 = v18;
  long long v53 = v19;
  CGFloat v54 = *((double *)v17 + 8);
  *(_OWORD *)location = v20;

  *(_OWORD *)&v4->_layoutConstants.timeLabelMaxWidth = v51;
  *(_OWORD *)&v4->_layoutConstants.dialDiameter = v52;
  *(_OWORD *)&v4->_layoutConstants.largeTickSize.height = v53;
  v4->_layoutConstants.smallTickSize.height = v54;
  *(_OWORD *)p_stopwatchImageConfigPointSize = *(_OWORD *)location;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__NTKStopwatchRichComplicationBaseCircularView_initWithFamily___block_invoke;
  aBlock[3] = &unk_1E62C5590;
  v21 = v4;
  v49 = v21;
  v22 = (void (**)(void *, void *))_Block_copy(aBlock);
  v23 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  v24 = [v23 colorWithAlphaComponent:0.4];
  uint64_t v25 = v22[2](v22, v24);
  id v26 = v21[74];
  v21[74] = (id)v25;

  v27 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  uint64_t v28 = v22[2](v22, v27);
  id v29 = v21[73];
  v21[73] = (id)v28;

  id v30 = objc_alloc_init((Class)off_1E62BDB58);
  id v31 = v21[72];
  v21[72] = v30;

  objc_initWeak(location, v21);
  id v32 = v21[72];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __63__NTKStopwatchRichComplicationBaseCircularView_initWithFamily___block_invoke_2;
  v46[3] = &unk_1E62C0040;
  objc_copyWeak(&v47, location);
  [v32 setNowProvider:v46];
  [v21[72] setInTimeTravel:0];
  id v33 = v21[72];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __63__NTKStopwatchRichComplicationBaseCircularView_initWithFamily___block_invoke_3;
  v44[3] = &unk_1E62C0068;
  objc_copyWeak(&v45, location);
  [v33 setNeedsResizeHandler:v44];
  [v21[72] setMaxWidth:v4->_layoutConstants.timeLabelMaxWidth];
  v34 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:v4->_layoutConstants.timeLabelFontSize design:*MEMORY[0x1E4FB09E0]];
  v35 = [v34 CLKFontWithAlternativePunctuation];

  [v21[72] setFont:v35];
  [v21[72] setHidden:1];
  v36 = [v21 contentView];
  [v36 addSubview:v21[72]];

  v37 = [MEMORY[0x1E4FB1830] configurationWithPointSize:*p_stopwatchImageConfigPointSize];
  v38 = [MEMORY[0x1E4FB1818] systemImageNamed:@"stopwatch" withConfiguration:v37];
  uint64_t v39 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v38];
  id v40 = v21[71];
  v21[71] = (id)v39;

  v41 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v21[71] setTintColor:v41];

  v42 = [v21 contentView];
  [v42 addSubview:v21[71]];

  objc_destroyWeak(&v45);
  objc_destroyWeak(&v47);
  objc_destroyWeak(location);

  return v4;
}

NTKRichComplicationDialView *__63__NTKStopwatchRichComplicationBaseCircularView_initWithFamily___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = -[NTKRichComplicationDialView initWithLargeTickCount:smallTickCountPerLargeTick:largeTickSize:smallTickSize:dialRange:startAngle:]([NTKRichComplicationDialView alloc], "initWithLargeTickCount:smallTickCountPerLargeTick:largeTickSize:smallTickSize:dialRange:startAngle:", 12, 5, *(double *)(*(void *)(a1 + 32) + 648), *(double *)(*(void *)(a1 + 32) + 656), *(double *)(*(void *)(a1 + 32) + 664), *(double *)(*(void *)(a1 + 32) + 672), 6.28318531, 0.0);
  id v5 = v3;
  uint64_t v6 = [v5 CGColor];
  uint64_t v7 = [(NTKRichComplicationDialView *)v4 largeTickLayer];
  [v7 setBackgroundColor:v6];

  id v8 = v5;
  uint64_t v9 = [v8 CGColor];

  v10 = [(NTKRichComplicationDialView *)v4 smallTickLayer];
  [v10 setBackgroundColor:v9];

  [(NTKRichComplicationDialView *)v4 setHidden:1];
  id v11 = [*(id *)(a1 + 32) contentView];
  [v11 addSubview:v4];

  return v4;
}

id __63__NTKStopwatchRichComplicationBaseCircularView_initWithFamily___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = (id)MEMORY[0x1E4F19A20];
  }
  id v3 = [WeakRetained complicationDate];

  return v3;
}

void __63__NTKStopwatchRichComplicationBaseCircularView_initWithFamily___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

- (void)dealloc
{
  if (self->_updateToken)
  {
    id v3 = [(CLKUIColoringLabel *)self->_timeLabel textProvider];
    [v3 stopUpdatesForToken:self->_updateToken];

    updateToken = self->_updateToken;
    self->_updateToken = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NTKStopwatchRichComplicationBaseCircularView;
  [(NTKStopwatchRichComplicationBaseCircularView *)&v5 dealloc];
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)NTKStopwatchRichComplicationBaseCircularView;
  [(NTKRichComplicationCircularBaseView *)&v27 layoutSubviews];
  id v3 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  id v8 = [(CDRichComplicationView *)self device];
  CLKSizeCenteredInRectForDevice();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  -[NTKRichComplicationDialView setFrame:](self->_backDial, "setFrame:", v10, v12, v14, v16);
  -[NTKRichComplicationDialView setFrame:](self->_frontDial, "setFrame:", v10, v12, v14, v16);
  [(CLKUIColoringLabel *)self->_timeLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_timeLabel frame];
  double v19 = v18;
  double timeLabelBottom = self->_layoutConstants.timeLabelBottom;
  if (v17 >= self->_layoutConstants.timeLabelMaxWidth) {
    double timeLabelMaxWidth = self->_layoutConstants.timeLabelMaxWidth;
  }
  else {
    double timeLabelMaxWidth = v17;
  }
  v22 = [(CLKUIColoringLabel *)self->_timeLabel font];
  [v22 ascender];
  *(float *)&double v23 = timeLabelBottom - v23;
  double v24 = ceilf(*(float *)&v23);

  -[CLKUIColoringLabel setFrame:](self->_timeLabel, "setFrame:", (v5 - timeLabelMaxWidth) * 0.5, v24, timeLabelMaxWidth, v19);
  [(UIImageView *)self->_stopwatchImageView sizeToFit];
  [(UIImageView *)self->_stopwatchImageView frame];
  -[UIImageView setFrame:](self->_stopwatchImageView, "setFrame:", (v5 - v25) * 0.5, (v7 - v26) * 0.5 + v7 * -0.02);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  if (self->_updateToken)
  {
    double v6 = [(CLKUIColoringLabel *)self->_timeLabel textProvider];
    [v6 stopUpdatesForToken:self->_updateToken];

    updateToken = self->_updateToken;
    self->_updateToken = 0;
  }
  id v8 = [v5 metadata];
  double v9 = [v8 objectForKeyedSubscript:@"NTKStopwatchComplicationMetadataStateKey"];

  if ([v9 isEqualToString:@"NTKStopwatchComplicationMetadataStateValue_Running"])
  {
    self->_showPlatter = 0;
    [(NTKRichComplicationDialView *)self->_backDial setHidden:0];
    [(NTKRichComplicationDialView *)self->_frontDial setHidden:0];
    uint64_t v10 = [MEMORY[0x1E4FB1618] whiteColor];
LABEL_7:
    double v11 = (void *)v10;
    [(CLKUIColoringLabel *)self->_timeLabel setTextColor:v10];

    uint64_t v12 = 0;
    uint64_t v13 = 1;
    goto LABEL_9;
  }
  if ([v9 isEqualToString:@"NTKStopwatchComplicationMetadataStateValue_Paused"])
  {
    self->_showPlatter = 0;
    [(NTKRichComplicationDialView *)self->_backDial setHidden:0];
    [(NTKRichComplicationDialView *)self->_frontDial setHidden:0];
    uint64_t v10 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.5];
    goto LABEL_7;
  }
  uint64_t v12 = 1;
  self->_showPlatter = 1;
  [(NTKRichComplicationDialView *)self->_backDial setHidden:1];
  [(NTKRichComplicationDialView *)self->_frontDial setHidden:1];
  uint64_t v13 = 0;
LABEL_9:
  [(CLKUIColoringLabel *)self->_timeLabel setHidden:v12];
  [(UIImageView *)self->_stopwatchImageView setHidden:v13];
  [(NTKRichComplicationCircularBaseView *)self _updatePlatterColor];
  if (([(CLKUIColoringLabel *)self->_timeLabel isHidden] & 1) == 0)
  {
    double v14 = [v5 metadata];
    double v15 = [v14 objectForKeyedSubscript:@"NTKStopwatchComplicationMetadataTimeTextProviderKey"];

    double v16 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    [v15 setTintColor:v16];

    [v15 setPaused:0];
    [(CLKUIColoringLabel *)self->_timeLabel setTextProvider:v15];
  }
  objc_initWeak(&location, self);
  double v17 = [(CLKUIColoringLabel *)self->_timeLabel textProvider];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__NTKStopwatchRichComplicationBaseCircularView__handleTemplate_reason___block_invoke;
  v20[3] = &unk_1E62C0068;
  objc_copyWeak(&v21, &location);
  double v18 = [v17 startUpdatesWithHandler:v20];
  double v19 = self->_updateToken;
  self->_updateToken = v18;

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __71__NTKStopwatchRichComplicationBaseCircularView__handleTemplate_reason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDialProgress];
}

- (void)_editingDidEnd
{
}

- (void)_applyPausedUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)NTKStopwatchRichComplicationBaseCircularView;
  [(CDRichComplicationView *)&v5 _applyPausedUpdate];
  BOOL v3 = [(CDRichComplicationView *)self paused];
  double v4 = [(UIImageView *)self->_stopwatchImageView layer];
  [v4 setShouldRasterize:v3];
}

- (void)_updateDialProgress
{
  [(NTKStopwatchRichComplicationBaseCircularView *)self _stopwatchCurrentTime];
  float v4 = v3;
  float v5 = fmodf(v4, 120.0);
  *(float *)&double v6 = fmodf(v4, 60.0);
  frontDial = self->_frontDial;
  float v8 = *(float *)&v6 / 60.0;
  if (v5 >= 60.0)
  {
    LODWORD(v6) = -1.0;
    [(NTKRichComplicationDialView *)frontDial setProgressDirection:v6];
    float v8 = 1.0 - v8;
  }
  else
  {
    LODWORD(v6) = 1.0;
    [(NTKRichComplicationDialView *)frontDial setProgressDirection:v6];
  }
  uint64_t v10 = self->_frontDial;
  *(float *)&double v9 = v8;
  [(NTKRichComplicationDialView *)v10 setProgress:v9];
}

- (double)_stopwatchCurrentTime
{
  return 0.0;
}

- (BOOL)templateWantsPlatter
{
  return self->_showPlatter;
}

- (int64_t)_backgroundFilterStyle
{
  v2 = [(CDRichComplicationView *)self device];
  int v3 = NTKShowGossamerUI(v2);

  if (v3) {
    return 2;
  }
  else {
    return 0;
  }
}

- (int64_t)_foregroundFilterStyle
{
  v2 = [(CDRichComplicationView *)self device];
  int v3 = NTKShowGossamerUI(v2);

  if (v3) {
    return 0;
  }
  else {
    return 2;
  }
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NTKStopwatchRichComplicationBaseCircularView;
  -[NTKRichComplicationCircularBaseView transitionToMonochromeWithFraction:](&v13, sel_transitionToMonochromeWithFraction_);
  float v5 = [(CDRichComplicationView *)self filterProvider];
  double v6 = objc_msgSend(v5, "filtersForView:style:fraction:", self, -[NTKStopwatchRichComplicationBaseCircularView _backgroundFilterStyle](self, "_backgroundFilterStyle"), a3);

  if (v6)
  {
    double v7 = [(UIImageView *)self->_stopwatchImageView layer];
    [v7 setFilters:v6];

    float v8 = [(NTKRichComplicationDialView *)self->_backDial layer];
    [v8 setFilters:v6];

    double v9 = [(NTKRichComplicationDialView *)self->_frontDial layer];
    [v9 setFilters:v6];
  }
  uint64_t v10 = [(CDRichComplicationView *)self filterProvider];
  double v11 = objc_msgSend(v10, "filtersForView:style:fraction:", self, -[NTKStopwatchRichComplicationBaseCircularView _foregroundFilterStyle](self, "_foregroundFilterStyle"), a3);

  if (v11)
  {
    uint64_t v12 = [(CLKUIColoringLabel *)self->_timeLabel layer];
    [v12 setFilters:v11];
  }
}

- (void)updateMonochromeColor
{
  v11.receiver = self;
  v11.super_class = (Class)NTKStopwatchRichComplicationBaseCircularView;
  [(NTKRichComplicationCircularBaseView *)&v11 updateMonochromeColor];
  int v3 = [(CDRichComplicationView *)self filterProvider];
  float v4 = objc_msgSend(v3, "filtersForView:style:", self, -[NTKStopwatchRichComplicationBaseCircularView _backgroundFilterStyle](self, "_backgroundFilterStyle"));

  if (v4)
  {
    float v5 = [(UIImageView *)self->_stopwatchImageView layer];
    [v5 setFilters:v4];

    double v6 = [(NTKRichComplicationDialView *)self->_backDial layer];
    [v6 setFilters:v4];

    double v7 = [(NTKRichComplicationDialView *)self->_frontDial layer];
    [v7 setFilters:v4];
  }
  float v8 = [(CDRichComplicationView *)self filterProvider];
  double v9 = objc_msgSend(v8, "filtersForView:style:", self, -[NTKStopwatchRichComplicationBaseCircularView _foregroundFilterStyle](self, "_foregroundFilterStyle"));

  if (v9)
  {
    uint64_t v10 = [(CLKUIColoringLabel *)self->_timeLabel layer];
    [v10 setFilters:v9];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateToken, 0);
  objc_storeStrong((id *)&self->_backDial, 0);
  objc_storeStrong((id *)&self->_frontDial, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_stopwatchImageView, 0);
}

@end