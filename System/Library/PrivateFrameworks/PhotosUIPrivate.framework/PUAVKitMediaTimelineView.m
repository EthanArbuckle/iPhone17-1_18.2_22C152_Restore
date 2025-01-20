@interface PUAVKitMediaTimelineView
+ (id)_stringFromTimeInterval:(double)a3;
- (AVMediaTimelineControl)timelineControl;
- (BOOL)isLoading;
- (BOOL)isPlaying;
- (BOOL)showsTimeLabels;
- (CGSize)intrinsicContentSize;
- (CGSize)timeRangeMark:(id)a3 sizeInFrame:(CGRect)a4;
- (NSArray)highlightedTimeRanges;
- (NSArray)timeRangeMarks;
- (NSString)currentValueText;
- (NSString)maxValueText;
- (PUAVKitMediaTimelineView)initWithFrame:(CGRect)a3;
- (PUMediaTimelineViewDelegate)delegate;
- (UIColor)labelColor;
- (UIFont)labelFont;
- (double)whiteValue;
- (float)currentValue;
- (float)maxValue;
- (float)minValue;
- (id)uiProxyForTimeRangeMark:(id)a3 withSource:(id)a4;
- (void)_updateCurrentValueText;
- (void)_updateMaxValueText;
- (void)_updateTimeRangeMarks;
- (void)_updateTimelineConfiguration;
- (void)dealloc;
- (void)invalidateIntrinsicContentSize;
- (void)mediaTimelineControl:(id)a3 didChangeValue:(float)a4;
- (void)mediaTimelineControlDidEndChanging:(id)a3;
- (void)mediaTimelineControlWillBeginChanging:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCurrentValue:(float)a3;
- (void)setCurrentValueText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlightedTimeRanges:(id)a3;
- (void)setLabelColor:(id)a3;
- (void)setLabelFont:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setMaxValue:(float)a3;
- (void)setMaxValueText:(id)a3;
- (void)setMinValue:(float)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setShowsTimeLabels:(BOOL)a3;
- (void)setTimeRangeMarks:(id)a3;
- (void)setWhiteValue:(double)a3;
@end

@implementation PUAVKitMediaTimelineView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentValueText, 0);
  objc_storeStrong((id *)&self->_maxValueText, 0);
  objc_storeStrong((id *)&self->_timelineControl, 0);
  objc_storeStrong((id *)&self->timeRangeMarks, 0);
  objc_storeStrong((id *)&self->_highlightedTimeRanges, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
}

- (void)setCurrentValueText:(id)a3
{
}

- (NSString)currentValueText
{
  return self->_currentValueText;
}

- (void)setMaxValueText:(id)a3
{
}

- (NSString)maxValueText
{
  return self->_maxValueText;
}

- (AVMediaTimelineControl)timelineControl
{
  return self->_timelineControl;
}

- (double)whiteValue
{
  return self->_whiteValue;
}

- (BOOL)showsTimeLabels
{
  return self->_showsTimeLabels;
}

- (void)setTimeRangeMarks:(id)a3
{
}

- (NSArray)timeRangeMarks
{
  return self->timeRangeMarks;
}

- (NSArray)highlightedTimeRanges
{
  return self->_highlightedTimeRanges;
}

- (float)currentValue
{
  return self->_currentValue;
}

- (void)setDelegate:(id)a3
{
}

- (PUMediaTimelineViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUMediaTimelineViewDelegate *)WeakRetained;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void)setMinValue:(float)a3
{
  self->_minValue = a3;
}

- (float)minValue
{
  return self->_minValue;
}

- (float)maxValue
{
  return self->_maxValue;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (void)mediaTimelineControlDidEndChanging:(id)a3
{
  id v4 = [(PUAVKitMediaTimelineView *)self delegate];
  [v4 mediaTimelineControlViewDidEndChanging:self];
}

- (void)mediaTimelineControlWillBeginChanging:(id)a3
{
  id v4 = [(PUAVKitMediaTimelineView *)self delegate];
  [v4 mediaTimelineControlViewWillBeginChanging:self];
}

- (void)mediaTimelineControl:(id)a3 didChangeValue:(float)a4
{
  [(PUAVKitMediaTimelineView *)self setCurrentValue:a3];
  id v5 = [(PUAVKitMediaTimelineView *)self delegate];
  [v5 mediaTimelineControlViewDidChangeValue:self];
}

- (void)invalidateIntrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)PUAVKitMediaTimelineView;
  [(PUAVKitMediaTimelineView *)&v4 invalidateIntrinsicContentSize];
  v3 = [(PUAVKitMediaTimelineView *)self delegate];
  [v3 mediaTimelineControlIntrinsicContentSizeDidChange:self];
}

- (void)_updateTimelineConfiguration
{
  id v12 = [MEMORY[0x1E4F16730] defaultConfiguration];
  if (objc_opt_respondsToSelector())
  {
    v3 = (void *)MEMORY[0x1E4FB14C8];
    objc_super v4 = (void *)MEMORY[0x1E4FB1618];
    [(PUAVKitMediaTimelineView *)self whiteValue];
    id v5 = objc_msgSend(v4, "colorWithWhite:alpha:");
    v6 = [v3 _effectWithTintColor:v5];
    [v12 setCurrentValueVisualEffect:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:20];
    [v12 setMaxValueVisualEffect:v7];
  }
  v8 = [MEMORY[0x1E4F16738] belowConfiguration];
  v9 = [(PUAVKitMediaTimelineView *)self labelColor];
  [v8 setTextColor:v9];

  v10 = [(PUAVKitMediaTimelineView *)self labelFont];
  [v8 setTextFont:v10];

  [v12 setLabelsConfiguration:v8];
  if ([(PUAVKitMediaTimelineView *)self showsTimeLabels]) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 2;
  }
  [v8 setLabelsStyle:v11];
  [(AVMediaTimelineControl *)self->_timelineControl setConfiguration:v12];
  [(PUAVKitMediaTimelineView *)self invalidateIntrinsicContentSize];
}

- (void)_updateMaxValueText
{
  v3 = objc_opt_class();
  [(PUAVKitMediaTimelineView *)self maxValue];
  id v5 = [v3 _stringFromTimeInterval:v4];
  [(PUAVKitMediaTimelineView *)self setMaxValueText:v5];

  [(PUAVKitMediaTimelineView *)self invalidateIntrinsicContentSize];
}

- (void)_updateCurrentValueText
{
  v3 = objc_opt_class();
  [(PUAVKitMediaTimelineView *)self currentValue];
  id v5 = [v3 _stringFromTimeInterval:v4];
  [(PUAVKitMediaTimelineView *)self setCurrentValueText:v5];

  [(PUAVKitMediaTimelineView *)self invalidateIntrinsicContentSize];
}

- (void)_updateTimeRangeMarks
{
  v3 = [(PUAVKitMediaTimelineView *)self highlightedTimeRanges];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(PUAVKitMediaTimelineView *)self highlightedTimeRanges];
    v6 = PXMap();
    [(PUAVKitMediaTimelineView *)self setTimeRangeMarks:v6];
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
    [(PUAVKitMediaTimelineView *)self setTimeRangeMarks:v7];
  }
}

id __49__PUAVKitMediaTimelineView__updateTimeRangeMarks__block_invoke(uint64_t a1, void *a2)
{
  memset(&v11, 0, sizeof(v11));
  if (a2) {
    [a2 CMTimeRangeValue];
  }
  id v3 = objc_alloc(MEMORY[0x1E4F16758]);
  *(_OWORD *)&v9.start.value = *(_OWORD *)&v11.start.value;
  v9.start.epoch = v11.start.epoch;
  float Seconds = CMTimeGetSeconds(&v9.start);
  CMTimeRange v9 = v11;
  CMTimeRangeGetEnd(&time, &v9);
  Float64 v5 = CMTimeGetSeconds(&time);
  *(float *)&double v6 = v5;
  *(float *)&Float64 v5 = Seconds;
  uint64_t v7 = (void *)[v3 initWithStartValue:&stru_1F06BE7B8 endValue:*(void *)(a1 + 32) identifier:v5 markUIProvider:v6];
  return v7;
}

- (id)uiProxyForTimeRangeMark:(id)a3 withSource:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F16760];
  Float64 v5 = objc_msgSend(MEMORY[0x1E4FB1618], "systemBlueColor", a3, a4);
  double v6 = [v5 colorWithAlphaComponent:0.85];
  LODWORD(v7) = 4.0;
  v8 = [v4 timeRangeMarkUIProxyWithBackgroundColor:v6 cornerRadius:v7];

  return v8;
}

- (CGSize)timeRangeMark:(id)a3 sizeInFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  double width = a4.size.width;
  id v7 = a3;
  [(PUAVKitMediaTimelineView *)self maxValue];
  if (v8 == 0.0)
  {
    double v9 = *MEMORY[0x1E4F1DB30];
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    float v10 = v8;
    [v7 endValue];
    float v12 = v11;
    [v7 startValue];
    double v9 = width * (float)(v12 - v13) / v10;
  }

  double v14 = v9;
  double v15 = height;
  result.CGFloat height = v15;
  result.double width = v14;
  return result;
}

- (void)setHighlightedTimeRanges:(id)a3
{
  if (self->_highlightedTimeRanges != a3)
  {
    uint64_t v4 = (NSArray *)[a3 copy];
    highlightedTimeRanges = self->_highlightedTimeRanges;
    self->_highlightedTimeRanges = v4;

    [(PUAVKitMediaTimelineView *)self _updateTimeRangeMarks];
  }
}

- (void)setWhiteValue:(double)a3
{
  if (self->_whiteValue != a3)
  {
    self->_whiteValue = a3;
    [(PUAVKitMediaTimelineView *)self _updateTimelineConfiguration];
  }
}

- (void)setShowsTimeLabels:(BOOL)a3
{
  if (self->_showsTimeLabels != a3)
  {
    self->_showsTimeLabels = a3;
    [(PUAVKitMediaTimelineView *)self _updateTimelineConfiguration];
    [(PUAVKitMediaTimelineView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setMaxValue:(float)a3
{
  if (self->_maxValue != a3)
  {
    self->_maxValue = a3;
    [(PUAVKitMediaTimelineView *)self _updateMaxValueText];
    timelineControl = self->_timelineControl;
    [(AVMediaTimelineControl *)timelineControl setNeedsLayout];
  }
}

- (void)setCurrentValue:(float)a3
{
  if (self->_currentValue != a3)
  {
    self->_currentValue = a3;
    [(PUAVKitMediaTimelineView *)self _updateCurrentValueText];
  }
}

- (void)setLabelFont:(id)a3
{
  Float64 v5 = (UIFont *)a3;
  if (self->_labelFont != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_labelFont, a3);
    [(PUAVKitMediaTimelineView *)self _updateTimelineConfiguration];
    [(PUAVKitMediaTimelineView *)self invalidateIntrinsicContentSize];
    Float64 v5 = v6;
  }
}

- (void)setLabelColor:(id)a3
{
  Float64 v5 = (UIColor *)a3;
  if (self->_labelColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_labelColor, a3);
    [(PUAVKitMediaTimelineView *)self _updateTimelineConfiguration];
    Float64 v5 = v6;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v16 = a3;
  float v10 = (AVMediaTimelineControl *)a4;
  id v11 = a5;
  if (self->_timelineControl != v10)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUAVKitMediaTimelineView.m", 91, @"Unexpected observed object %@", v10 object file lineNumber description];
  }
  float v12 = NSStringFromSelector(sel_intrinsicContentSize);
  char v13 = [v16 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUAVKitMediaTimelineView.m", 92, @"Unexpected observed key path %@", v16 object file lineNumber description];
  }
  [(PUAVKitMediaTimelineView *)self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize
{
  [(AVMediaTimelineControl *)self->_timelineControl intrinsicContentSize];
  result.CGFloat height = v3;
  result.double width = v2;
  return result;
}

- (void)dealloc
{
  timelineControl = self->_timelineControl;
  uint64_t v4 = NSStringFromSelector(sel_intrinsicContentSize);
  [(AVMediaTimelineControl *)timelineControl removeObserver:self forKeyPath:v4];

  v5.receiver = self;
  v5.super_class = (Class)PUAVKitMediaTimelineView;
  [(PUAVKitMediaTimelineView *)&v5 dealloc];
}

- (PUAVKitMediaTimelineView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)PUAVKitMediaTimelineView;
  double v3 = -[PUAVKitMediaTimelineView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_whiteValue = 1.0;
    uint64_t v5 = [MEMORY[0x1E4FB1618] labelColor];
    labelColor = v4->_labelColor;
    v4->_labelColor = (UIColor *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F16728]) initWithSource:v4];
    timelineControl = v4->_timelineControl;
    v4->_timelineControl = (AVMediaTimelineControl *)v7;

    [(PUAVKitMediaTimelineView *)v4 bounds];
    -[AVMediaTimelineControl setFrame:](v4->_timelineControl, "setFrame:");
    [(AVMediaTimelineControl *)v4->_timelineControl setDelegate:v4];
    [(AVMediaTimelineControl *)v4->_timelineControl setEnabled:1];
    [(AVMediaTimelineControl *)v4->_timelineControl setAutoresizingMask:18];
    id v9 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v10 = [v9 CGColor];
    id v11 = [(AVMediaTimelineControl *)v4->_timelineControl layer];
    [v11 setShadowColor:v10];

    float v12 = [(AVMediaTimelineControl *)v4->_timelineControl layer];
    LODWORD(v13) = 1050253722;
    [v12 setShadowOpacity:v13];

    double v14 = [(AVMediaTimelineControl *)v4->_timelineControl layer];
    [v14 setShadowRadius:5.0];

    [(PUAVKitMediaTimelineView *)v4 _updateTimelineConfiguration];
    [(PUAVKitMediaTimelineView *)v4 addSubview:v4->_timelineControl];
    double v15 = v4->_timelineControl;
    id v16 = NSStringFromSelector(sel_intrinsicContentSize);
    [(AVMediaTimelineControl *)v15 addObserver:v4 forKeyPath:v16 options:0 context:0];

    [(PUAVKitMediaTimelineView *)v4 setPlaying:1];
    [(PUAVKitMediaTimelineView *)v4 setLoading:0];
    [(PUAVKitMediaTimelineView *)v4 setMaxValue:0.0];
    [(PUAVKitMediaTimelineView *)v4 setMinValue:0.0];
    LODWORD(v17) = 0.5;
    [(PUAVKitMediaTimelineView *)v4 setCurrentValue:v17];
    [(PUAVKitMediaTimelineView *)v4 setClipsToBounds:0];
  }
  return v4;
}

+ (id)_stringFromTimeInterval:(double)a3
{
  if (_stringFromTimeInterval__onceToken != -1) {
    dispatch_once(&_stringFromTimeInterval__onceToken, &__block_literal_global_27278);
  }
  uint64_t v4 = &_stringFromTimeInterval__hourMinuteSecondFormatter;
  if (a3 < 3600.0) {
    uint64_t v4 = &_stringFromTimeInterval__minuteSecondFormatter;
  }
  uint64_t v5 = (void *)*v4;
  return (id)[v5 stringFromTimeInterval:a3];
}

uint64_t __52__PUAVKitMediaTimelineView__stringFromTimeInterval___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v1 = (void *)_stringFromTimeInterval__minuteSecondFormatter;
  _stringFromTimeInterval__minuteSecondFormatter = (uint64_t)v0;

  [(id)_stringFromTimeInterval__minuteSecondFormatter setAllowedUnits:192];
  [(id)_stringFromTimeInterval__minuteSecondFormatter setUnitsStyle:0];
  [(id)_stringFromTimeInterval__minuteSecondFormatter setZeroFormattingBehavior:0x10000];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  double v3 = (void *)_stringFromTimeInterval__hourMinuteSecondFormatter;
  _stringFromTimeInterval__hourMinuteSecondFormatter = (uint64_t)v2;

  [(id)_stringFromTimeInterval__hourMinuteSecondFormatter setAllowedUnits:224];
  [(id)_stringFromTimeInterval__hourMinuteSecondFormatter setUnitsStyle:0];
  uint64_t v4 = (void *)_stringFromTimeInterval__hourMinuteSecondFormatter;
  return [v4 setZeroFormattingBehavior:0x10000];
}

@end