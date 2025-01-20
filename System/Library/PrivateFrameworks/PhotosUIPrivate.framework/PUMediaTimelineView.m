@interface PUMediaTimelineView
+ (id)_stringFromTimeInterval:(double)a3;
- (BOOL)isLoading;
- (BOOL)isPlaying;
- (BOOL)showsTimeLabels;
- (CGSize)intrinsicContentSize;
- (NSArray)highlightedTimeRanges;
- (PUMediaTimelineView)initWithFrame:(CGRect)a3;
- (PUMediaTimelineViewDelegate)delegate;
- (UIColor)labelColor;
- (UIFont)labelFont;
- (double)whiteValue;
- (float)currentValue;
- (float)maxValue;
- (float)minValue;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_sliderFluidInteractionWillBegin:(id)a3 withLocation:(CGPoint)a4;
- (void)_sliderFluidInteractionWillEnd:(id)a3;
- (void)_sliderValueChanged:(id)a3;
- (void)_updateCurrentTimeText;
- (void)_updateDurationText;
- (void)_updateSliderConfiguration;
- (void)layoutSubviews;
- (void)outputEventSignaledForCoalescer:(id)a3;
- (void)setCurrentValue:(float)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlightedTimeRanges:(id)a3;
- (void)setLabelColor:(id)a3;
- (void)setLabelFont:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setMaxValue:(float)a3;
- (void)setMinValue:(float)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setShowsTimeLabels:(BOOL)a3;
- (void)setWhiteValue:(double)a3;
@end

@implementation PUMediaTimelineView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->highlightedTimeRanges, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_eventCoalescer, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_currentTimeLabel, 0);
  objc_storeStrong((id *)&self->_slider, 0);
}

- (double)whiteValue
{
  return self->_whiteValue;
}

- (BOOL)showsTimeLabels
{
  return self->_showsTimeLabels;
}

- (void)setHighlightedTimeRanges:(id)a3
{
}

- (NSArray)highlightedTimeRanges
{
  return self->highlightedTimeRanges;
}

- (void)setDelegate:(id)a3
{
}

- (PUMediaTimelineViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (PUMediaTimelineViewDelegate *)WeakRetained;
}

- (void)setPlaying:(BOOL)a3
{
  self->playing = a3;
}

- (BOOL)isPlaying
{
  return self->playing;
}

- (void)setLoading:(BOOL)a3
{
  self->loading = a3;
}

- (BOOL)isLoading
{
  return self->loading;
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (void)_sliderFluidInteractionWillEnd:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F91248], "delayedCoalescerWithDelay:", a3, 0.1);
  v4 = (PXEventCoalescer *)objc_claimAutoreleasedReturnValue();
  eventCoalescer = self->_eventCoalescer;
  self->_eventCoalescer = v4;

  [(PXEventCoalescer *)self->_eventCoalescer registerObserver:self];
  v6 = self->_eventCoalescer;
  [(PXEventCoalescer *)v6 inputEvent];
}

- (void)_sliderFluidInteractionWillBegin:(id)a3 withLocation:(CGPoint)a4
{
  id v5 = [(PUMediaTimelineView *)self delegate];
  [v5 mediaTimelineControlViewWillBeginChanging:self];
}

- (void)_updateSliderConfiguration
{
  id v8 = objc_alloc_init(MEMORY[0x1E4FB22B8]);
  v3 = (void *)MEMORY[0x1E4FB14C8];
  v4 = (void *)MEMORY[0x1E4FB1618];
  [(PUMediaTimelineView *)self whiteValue];
  id v5 = objc_msgSend(v4, "colorWithWhite:alpha:");
  v6 = [v3 _effectWithTintColor:v5];
  [v8 setMinimumTrackEffect:v6];

  v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:20];
  [v8 setMaximumTrackEffect:v7];

  [v8 setDelegate:self];
  [(UISlider *)self->_slider _setSliderConfiguration:v8];
}

- (void)outputEventSignaledForCoalescer:(id)a3
{
  if (self->_eventCoalescer == a3)
  {
    v4 = [(PUMediaTimelineView *)self delegate];
    [v4 mediaTimelineControlViewDidEndChanging:self];

    eventCoalescer = self->_eventCoalescer;
    self->_eventCoalescer = 0;
  }
}

- (void)_updateDurationText
{
  v3 = objc_opt_class();
  [(PUMediaTimelineView *)self maxValue];
  id v5 = [v3 _stringFromTimeInterval:v4];
  [(UILabel *)self->_durationLabel setText:v5];
}

- (void)_updateCurrentTimeText
{
  v3 = objc_opt_class();
  [(PUMediaTimelineView *)self currentValue];
  id v5 = [v3 _stringFromTimeInterval:v4];
  [(UILabel *)self->_currentTimeLabel setText:v5];
}

- (void)_sliderValueChanged:(id)a3
{
  [(PXEventCoalescer *)self->_eventCoalescer inputEvent];
  id v4 = [(PUMediaTimelineView *)self delegate];
  [v4 mediaTimelineControlViewDidChangeValue:self];
}

- (void)setCurrentValue:(float)a3
{
  [(UISlider *)self->_slider value];
  if (*(float *)&v5 != a3)
  {
    *(float *)&double v5 = a3;
    [(UISlider *)self->_slider setValue:v5];
    [(PUMediaTimelineView *)self _updateCurrentTimeText];
  }
}

- (float)currentValue
{
  [(UISlider *)self->_slider value];
  return result;
}

- (float)minValue
{
  [(UISlider *)self->_slider minimumValue];
  return result;
}

- (void)setMinValue:(float)a3
{
  [(UISlider *)self->_slider minimumValue];
  if (*(float *)&v5 != a3)
  {
    slider = self->_slider;
    *(float *)&double v5 = a3;
    [(UISlider *)slider setMinimumValue:v5];
  }
}

- (float)maxValue
{
  [(UISlider *)self->_slider maximumValue];
  return result;
}

- (void)setMaxValue:(float)a3
{
  [(UISlider *)self->_slider maximumValue];
  if (*(float *)&v5 != a3)
  {
    *(float *)&double v5 = a3;
    [(UISlider *)self->_slider setMaximumValue:v5];
    [(PUMediaTimelineView *)self _updateDurationText];
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setShowsTimeLabels:(BOOL)a3
{
  if (self->_showsTimeLabels != a3)
  {
    self->_showsTimeLabels = a3;
    [(PUMediaTimelineView *)self setNeedsLayout];
  }
}

- (void)setLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_labelColor, a3);
  id v5 = a3;
  [(UILabel *)self->_currentTimeLabel setTextColor:v5];
  [(UILabel *)self->_durationLabel setTextColor:v5];
}

- (void)setLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_labelFont, a3);
  id v5 = a3;
  [(UILabel *)self->_currentTimeLabel setFont:v5];
  [(UILabel *)self->_durationLabel setFont:v5];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PUMediaTimelineView;
  -[PUMediaTimelineView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  slider = (PUMediaTimelineView *)objc_claimAutoreleasedReturnValue();
  v6 = slider;
  if (slider == self) {
    slider = (PUMediaTimelineView *)self->_slider;
  }
  v7 = slider;

  return v7;
}

- (void)setWhiteValue:(double)a3
{
  if (self->_whiteValue != a3)
  {
    self->_whiteValue = a3;
    [(PUMediaTimelineView *)self _updateSliderConfiguration];
  }
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)PUMediaTimelineView;
  [(PUMediaTimelineView *)&v19 layoutSubviews];
  [(PUMediaTimelineView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UIVisualEffectView setFrame:](self->_platterView, "setFrame:");
  PXRectGetCenter();
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  CGRectGetWidth(v20);
  PXRectWithCenterAndSize();
  -[UISlider setFrame:](self->_slider, "setFrame:");
  [(UISlider *)self->_slider frame];
  double MaxY = CGRectGetMaxY(v21);
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  double Width = CGRectGetWidth(v22);
  v13 = [(PUMediaTimelineView *)self labelFont];
  [v13 lineHeight];
  -[UILabel setFrame:](self->_currentTimeLabel, "setFrame:", 0.0, MaxY, Width, v14);

  [(UISlider *)self->_slider frame];
  double v15 = CGRectGetMaxY(v23);
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  double v16 = CGRectGetWidth(v24);
  v17 = [(PUMediaTimelineView *)self labelFont];
  [v17 lineHeight];
  -[UILabel setFrame:](self->_durationLabel, "setFrame:", 0.0, v15, v16, v18);

  [(UILabel *)self->_durationLabel setHidden:[(PUMediaTimelineView *)self showsTimeLabels] ^ 1];
  [(UILabel *)self->_currentTimeLabel setHidden:[(PUMediaTimelineView *)self showsTimeLabels] ^ 1];
}

- (PUMediaTimelineView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)PUMediaTimelineView;
  double v3 = -[PUMediaTimelineView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1C38]);
    [(PUMediaTimelineView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    slider = v3->_slider;
    v3->_slider = (UISlider *)v5;

    [(UISlider *)v3->_slider addTarget:v3 action:sel__sliderValueChanged_ forControlEvents:4096];
    [(UISlider *)v3->_slider _setSliderStyle:110];
    v3->_whiteValue = 1.0;
    id v7 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v8 = [v7 CGColor];
    double v9 = [(UISlider *)v3->_slider layer];
    [v9 setShadowColor:v8];

    double v10 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v12 = [(UISlider *)v3->_slider layer];
    objc_msgSend(v12, "setShadowOffset:", v10, v11);

    v13 = [(UISlider *)v3->_slider layer];
    LODWORD(v14) = 1050253722;
    [v13 setShadowOpacity:v14];

    double v15 = [(UISlider *)v3->_slider layer];
    [v15 setShadowRadius:5.0];

    [(PUMediaTimelineView *)v3 addSubview:v3->_slider];
    uint64_t v16 = [MEMORY[0x1E4FB1618] labelColor];
    labelColor = v3->_labelColor;
    v3->_labelColor = (UIColor *)v16;

    uint64_t v18 = PXFontWithTextStyleAndWeight();
    labelFont = v3->_labelFont;
    v3->_labelFont = (UIFont *)v18;

    CGRect v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    currentTimeLabel = v3->_currentTimeLabel;
    v3->_currentTimeLabel = v20;

    [(UILabel *)v3->_currentTimeLabel setTextAlignment:0];
    [(UILabel *)v3->_currentTimeLabel setFont:v3->_labelFont];
    [(UILabel *)v3->_currentTimeLabel setTextColor:v3->_labelColor];
    CGRect v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    durationLabel = v3->_durationLabel;
    v3->_durationLabel = v22;

    [(UILabel *)v3->_durationLabel setTextAlignment:2];
    [(UILabel *)v3->_durationLabel setFont:v3->_labelFont];
    [(UILabel *)v3->_durationLabel setTextColor:v3->_labelColor];
    [(PUMediaTimelineView *)v3 addSubview:v3->_currentTimeLabel];
    [(PUMediaTimelineView *)v3 addSubview:v3->_durationLabel];
    [(PUMediaTimelineView *)v3 _updateCurrentTimeText];
    [(PUMediaTimelineView *)v3 _updateSliderConfiguration];
  }
  return v3;
}

+ (id)_stringFromTimeInterval:(double)a3
{
  if (_stringFromTimeInterval__onceToken_86022 != -1) {
    dispatch_once(&_stringFromTimeInterval__onceToken_86022, &__block_literal_global_86023);
  }
  id v4 = &_stringFromTimeInterval__hourMinuteSecondFormatter_86024;
  if (a3 < 3600.0) {
    id v4 = &_stringFromTimeInterval__minuteSecondFormatter_86025;
  }
  uint64_t v5 = (void *)*v4;
  return (id)[v5 stringFromTimeInterval:a3];
}

uint64_t __47__PUMediaTimelineView__stringFromTimeInterval___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v1 = (void *)_stringFromTimeInterval__minuteSecondFormatter_86025;
  _stringFromTimeInterval__minuteSecondFormatter_86025 = (uint64_t)v0;

  [(id)_stringFromTimeInterval__minuteSecondFormatter_86025 setAllowedUnits:192];
  [(id)_stringFromTimeInterval__minuteSecondFormatter_86025 setUnitsStyle:0];
  [(id)_stringFromTimeInterval__minuteSecondFormatter_86025 setZeroFormattingBehavior:0x10000];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  double v3 = (void *)_stringFromTimeInterval__hourMinuteSecondFormatter_86024;
  _stringFromTimeInterval__hourMinuteSecondFormatter_86024 = (uint64_t)v2;

  [(id)_stringFromTimeInterval__hourMinuteSecondFormatter_86024 setAllowedUnits:224];
  [(id)_stringFromTimeInterval__hourMinuteSecondFormatter_86024 setUnitsStyle:0];
  id v4 = (void *)_stringFromTimeInterval__hourMinuteSecondFormatter_86024;
  return [v4 setZeroFormattingBehavior:0x10000];
}

@end