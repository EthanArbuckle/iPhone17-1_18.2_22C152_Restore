@interface NTKOlympusTimeView
- (BOOL)_hasWindrunnerWedge;
- (BOOL)_maskingPathStartsFromHourHandForDate:(id)a3;
- (BOOL)isFrozen;
- (BOOL)maskingPathStartsFromHourHand;
- (BOOL)useSmallFont;
- (CGSize)maskingSize;
- (CLKDevice)device;
- (NSDate)date;
- (NTKOlympusColorPalette)currentColorPalette;
- (NTKOlympusTimeContentView)contentView;
- (NTKOlympusTimeContentView)overlayContentView;
- (NTKOlympusTimeView)initWithDevice:(id)a3 dial:(unint64_t)a4 style:(unint64_t)a5 colorPalette:(id)a6 date:(id)a7;
- (NTKOlympusTimeView)initWithDevice:(id)a3 dial:(unint64_t)a4 style:(unint64_t)a5 colorPalette:(id)a6 date:(id)a7 useSmallFont:(BOOL)a8 circularLogoImage:(id)a9;
- (NTKOlympusViewDelegate)delegate;
- (UIImage)circularLogoImage;
- (double)_calculateDeviationBetweenHourAngle:(double)a3 minuteAngle:(double)a4;
- (double)hourHandAngle;
- (double)minuteHandAngle;
- (double)shortestPathBetweenStartAngle:(double)a3 targetAngle:(double)a4;
- (unint64_t)currentDial;
- (unint64_t)currentStyle;
- (void)_createContentViewIfNeeded;
- (void)_createOverlayViewIfNeeded;
- (void)animateClockHandsFromDate:(id)a3 toDate:(id)a4 duration:(double)a5;
- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 animateElements:(BOOL)a6;
- (void)applyTransitionFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5;
- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)applyWindrunnerMaskStartAngle:(double)a3 endAngle:(double)a4;
- (void)applyWindrunnerMaskWithDate:(id)a3;
- (void)applyWindrunnerMaskWithDate:(id)a3 force:(BOOL)a4;
- (void)applyWindrunnerMaskWithHourAngle:(double)a3 minuteAngle:(double)a4;
- (void)cleanupAfterEditing;
- (void)configureViewsForEditing;
- (void)createAndRemoveViewsForCurrentStateIfNeeded;
- (void)layoutSubviews;
- (void)olympusContentView:(id)a3 didHandleLogoTouchUpInsideFromRect:(CGRect)a4;
- (void)olympusContentViewDidHandleLogoHighlighted:(id)a3;
- (void)olympusContentViewDidHandleLogoResetHighlight:(id)a3;
- (void)openVictoryAppFromRect:(CGRect)a3;
- (void)prepareForEditing;
- (void)setCircularLogoImage:(id)a3;
- (void)setContentView:(id)a3;
- (void)setCurrentColorPalette:(id)a3;
- (void)setCurrentDial:(unint64_t)a3;
- (void)setCurrentStyle:(unint64_t)a3;
- (void)setDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setHourHandAngle:(double)a3;
- (void)setMaskingPathStartsFromHourHand:(BOOL)a3;
- (void)setMaskingSize:(CGSize)a3;
- (void)setMinuteHandAngle:(double)a3;
- (void)setOverlayContentView:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setTimeOffset:(double)a3;
- (void)setUseSmallFont:(BOOL)a3;
- (void)setupViewsForCurrentState:(BOOL)a3;
- (void)updateMaskingPathStartPointWithNewHourAngle:(double)a3 newMinuteAngle:(double)a4;
@end

@implementation NTKOlympusTimeView

- (NTKOlympusTimeView)initWithDevice:(id)a3 dial:(unint64_t)a4 style:(unint64_t)a5 colorPalette:(id)a6 date:(id)a7
{
  return [(NTKOlympusTimeView *)self initWithDevice:a3 dial:a4 style:a5 colorPalette:a6 date:a7 useSmallFont:0 circularLogoImage:0];
}

- (NTKOlympusTimeView)initWithDevice:(id)a3 dial:(unint64_t)a4 style:(unint64_t)a5 colorPalette:(id)a6 date:(id)a7 useSmallFont:(BOOL)a8 circularLogoImage:(id)a9
{
  id v15 = a3;
  v16 = (NTKOlympusColorPalette *)a6;
  id v17 = a7;
  id v18 = a9;
  v23.receiver = self;
  v23.super_class = (Class)NTKOlympusTimeView;
  v19 = [(NTKOlympusTimeView *)&v23 init];
  v20 = v19;
  if (v19)
  {
    v19->_maskingPathStartsFromHourHand = [(NTKOlympusTimeView *)v19 _maskingPathStartsFromHourHandForDate:v17];
    objc_storeStrong((id *)&v20->_device, a3);
    v20->_currentStyle = a5;
    v20->_currentDial = a4;
    v20->_currentColorPalette = v16;
    objc_storeStrong((id *)&v20->_date, a7);
    v20->_useSmallFont = a8;
    objc_storeStrong((id *)&v20->_circularLogoImage, a9);
    [(NTKOlympusTimeView *)v20 createAndRemoveViewsForCurrentStateIfNeeded];
  }

  return v20;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)NTKOlympusTimeView;
  [(NTKOlympusTimeView *)&v8 layoutSubviews];
  contentView = self->_contentView;
  [(NTKOlympusTimeView *)self bounds];
  -[UIView ntk_setBoundsAndPositionFromFrame:](contentView, "ntk_setBoundsAndPositionFromFrame:");
  v4 = [(NTKOlympusTimeView *)self device];
  [v4 screenScale];
  CGFloat v6 = -1.0 / v5;

  overlayContentView = self->_overlayContentView;
  [(NTKOlympusTimeView *)self bounds];
  CGRect v10 = CGRectInset(v9, v6, v6);
  -[UIView ntk_setBoundsAndPositionFromFrame:](overlayContentView, "ntk_setBoundsAndPositionFromFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  [(NTKOlympusTimeView *)self applyWindrunnerMaskWithDate:self->_date];
}

- (void)createAndRemoveViewsForCurrentStateIfNeeded
{
  unint64_t currentStyle = self->_currentStyle;
  if (currentStyle - 1 >= 2)
  {
    if (!currentStyle)
    {
      [(NTKOlympusTimeView *)self _createContentViewIfNeeded];
      [(NTKOlympusTimeContentView *)self->_overlayContentView removeFromSuperview];
      overlayContentView = self->_overlayContentView;
      self->_overlayContentView = 0;
    }
  }
  else
  {
    [(NTKOlympusTimeView *)self _createContentViewIfNeeded];
    [(NTKOlympusTimeView *)self _createOverlayViewIfNeeded];
  }
}

- (void)setCurrentDial:(unint64_t)a3
{
  self->_currentDial = a3;
  double v5 = [(NTKOlympusTimeView *)self contentView];
  [v5 setDial:a3];

  id v6 = [(NTKOlympusTimeView *)self overlayContentView];
  [v6 setDial:a3];
}

- (void)setCurrentColorPalette:(id)a3
{
  self->_currentColorPalette = (NTKOlympusColorPalette *)a3;
  id v4 = a3;
  double v5 = [(NTKOlympusTimeView *)self contentView];
  [v5 setColorPalette:v4];

  id v6 = [(NTKOlympusTimeView *)self overlayContentView];
  [v6 setColorPalette:v4];
}

- (void)setCurrentStyle:(unint64_t)a3
{
  self->_unint64_t currentStyle = a3;
  double v5 = [(NTKOlympusTimeView *)self contentView];
  [v5 setStyle:a3];

  id v6 = [(NTKOlympusTimeView *)self overlayContentView];
  [v6 setStyle:a3];
}

- (void)configureViewsForEditing
{
  [(NTKOlympusTimeView *)self _createOverlayViewIfNeeded];

  [(NTKOlympusTimeView *)self _createContentViewIfNeeded];
}

- (void)_createContentViewIfNeeded
{
  contentView = self->_contentView;
  if (!contentView)
  {
    id v4 = [NTKOlympusTimeContentView alloc];
    double v5 = [(NTKOlympusTimeView *)self device];
    id v6 = [(NTKOlympusTimeContentView *)v4 initWithDevice:v5 dial:self->_currentDial style:self->_currentStyle colorPalette:self->_currentColorPalette useSmallFont:self->_useSmallFont circularLogoImage:self->_circularLogoImage];
    v7 = self->_contentView;
    self->_contentView = v6;

    [(NTKOlympusTimeView *)self bounds];
    -[NTKOlympusTimeContentView setFrame:](self->_contentView, "setFrame:");
    [(NTKOlympusTimeContentView *)self->_contentView clipsToBounds];
    [(NTKOlympusTimeContentView *)self->_contentView setDelegate:self];
    [(NTKOlympusTimeContentView *)self->_contentView setOverrideDate:self->_date duration:0.0];
    contentView = self->_contentView;
  }
  objc_super v8 = [(NTKOlympusTimeContentView *)contentView superview];

  if (v8 != self)
  {
    CGRect v9 = self->_contentView;
    if (self->_overlayContentView)
    {
      -[NTKOlympusTimeView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v9);
    }
    else
    {
      [(NTKOlympusTimeView *)self addSubview:v9];
    }
  }
}

- (void)_createOverlayViewIfNeeded
{
  overlayContentView = self->_overlayContentView;
  if (!overlayContentView)
  {
    id v4 = [NTKOlympusTimeContentView alloc];
    double v5 = [(NTKOlympusTimeView *)self device];
    id v6 = [(NTKOlympusTimeContentView *)v4 initWithDevice:v5 dial:self->_currentDial style:self->_currentStyle colorPalette:self->_currentColorPalette useSmallFont:self->_useSmallFont circularLogoImage:self->_circularLogoImage];
    v7 = self->_overlayContentView;
    self->_overlayContentView = v6;

    [(NTKOlympusTimeView *)self bounds];
    -[NTKOlympusTimeContentView setFrame:](self->_overlayContentView, "setFrame:");
    [(NTKOlympusTimeContentView *)self->_overlayContentView setInvertedColors:1];
    objc_super v8 = [(NTKOlympusTimeContentView *)self->_overlayContentView layer];
    [v8 setMasksToBounds:1];

    [(NTKOlympusTimeContentView *)self->_overlayContentView clipsToBounds];
    [(NTKOlympusTimeContentView *)self->_overlayContentView setOverrideDate:self->_date duration:0.0];
    [(NTKOlympusTimeContentView *)self->_overlayContentView setDelegate:self];
    [(NTKOlympusTimeView *)self applyWindrunnerMaskWithDate:self->_date];
    overlayContentView = self->_overlayContentView;
  }
  CGRect v9 = [(NTKOlympusTimeContentView *)overlayContentView superview];

  if (v9 != self)
  {
    CGRect v10 = self->_overlayContentView;
    if (self->_contentView)
    {
      -[NTKOlympusTimeView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v10);
    }
    else
    {
      [(NTKOlympusTimeView *)self addSubview:v10];
    }
  }
}

- (void)prepareForEditing
{
  [(NTKOlympusTimeContentView *)self->_contentView prepareForEditing];
  overlayContentView = self->_overlayContentView;

  [(NTKOlympusTimeContentView *)overlayContentView prepareForEditing];
}

- (void)cleanupAfterEditing
{
  [(NTKOlympusTimeContentView *)self->_contentView cleanupAfterEditing];
  overlayContentView = self->_overlayContentView;

  [(NTKOlympusTimeContentView *)overlayContentView cleanupAfterEditing];
}

- (void)setupViewsForCurrentState:(BOOL)a3
{
  if (!a3) {
    [(NTKOlympusTimeView *)self createAndRemoveViewsForCurrentStateIfNeeded];
  }
  contentView = self->_contentView;
  if (contentView)
  {
    [(NTKOlympusTimeContentView *)contentView setDial:self->_currentDial];
    [(NTKOlympusTimeContentView *)self->_contentView setColorPalette:self->_currentColorPalette];
    [(NTKOlympusTimeContentView *)self->_contentView setStyle:self->_currentStyle];
    if (!a3) {
      [(NTKOlympusTimeContentView *)self->_contentView cleanupAfterEditing];
    }
  }
  overlayContentView = self->_overlayContentView;
  if (overlayContentView)
  {
    [(NTKOlympusTimeContentView *)overlayContentView setDial:self->_currentDial];
    [(NTKOlympusTimeContentView *)self->_overlayContentView setColorPalette:self->_currentColorPalette];
    [(NTKOlympusTimeContentView *)self->_overlayContentView setStyle:self->_currentStyle];
    if (!a3) {
      [(NTKOlympusTimeContentView *)self->_overlayContentView cleanupAfterEditing];
    }
  }
  if (![(NTKOlympusTimeView *)self _hasWindrunnerWedge])
  {
    id v7 = [(NTKOlympusTimeContentView *)self->_overlayContentView layer];
    [v7 setMask:0];
  }
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  CGRect v9 = [(NTKOlympusTimeContentView *)self->_overlayContentView layer];
  CGRect v10 = [v9 mask];
  if (v10)
  {
  }
  else
  {

    if (a4 - 1 < 2 || a5 - 1 <= 1) {
      [(NTKOlympusTimeView *)self applyWindrunnerMaskWithDate:self->_date force:1];
    }
  }
  [(NTKOlympusTimeContentView *)self->_overlayContentView applyTransitionFraction:a4 fromStyle:a5 toStyle:a3];
  [(NTKOlympusTimeContentView *)self->_contentView applyTransitionFraction:a4 fromStyle:a5 toStyle:a3];
  double v11 = 0.0;
  if (a4) {
    double v12 = 1.0;
  }
  else {
    double v12 = 0.0;
  }
  double v13 = 1.0 - a3;
  if (a5) {
    double v13 = v12;
  }
  if (a5 | a4) {
    double v11 = v13;
  }
  overlayContentView = self->_overlayContentView;

  [(NTKOlympusTimeContentView *)overlayContentView setAlpha:v11];
}

- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 animateElements:(BOOL)a6
{
  BOOL v6 = a6;
  contentView = self->_contentView;
  id v11 = a5;
  id v12 = a4;
  [(NTKOlympusTimeContentView *)contentView applyTransitionFraction:v12 fromColorPalette:v11 toColorPalette:v6 animateElements:a3];
  [(NTKOlympusTimeContentView *)self->_overlayContentView applyTransitionFraction:v12 fromColorPalette:v11 toColorPalette:v6 animateElements:a3];
}

- (void)applyTransitionFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5
{
  -[NTKOlympusTimeContentView applyTransitionFraction:fromDial:toDial:](self->_contentView, "applyTransitionFraction:fromDial:toDial:");
  overlayContentView = self->_overlayContentView;

  [(NTKOlympusTimeContentView *)overlayContentView applyTransitionFraction:a4 fromDial:a5 toDial:a3];
}

- (void)animateClockHandsFromDate:(id)a3 toDate:(id)a4 duration:(double)a5
{
}

- (double)shortestPathBetweenStartAngle:(double)a3 targetAngle:(double)a4
{
  double result = a4 - a3;
  double v5 = -result;
  if (result >= 0.0) {
    double v5 = result;
  }
  if (v5 > 180.0)
  {
    double v6 = 180.0 - (v5 + -180.0);
    if (result < 0.0) {
      return v6;
    }
    else {
      return -v6;
    }
  }
  return result;
}

- (void)applyWindrunnerMaskWithDate:(id)a3
{
}

- (void)applyWindrunnerMaskWithDate:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  if ([(NTKOlympusTimeView *)self canUpdateWindrunnerMask] || v4)
  {
    uint64_t v6 = NTKDateHourIn12HourTime(v14);
    id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v8 = [v7 component:64 fromDate:v14];

    CGRect v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v10 = [v9 component:128 fromDate:v14];

    self->_maskingPathStartsFromHourHand = [(NTKOlympusTimeView *)self _maskingPathStartsFromHourHandForDate:v14];
    +[NTKOlympusMask angleForHour:v6 minutes:v8];
    double v12 = v11;
    +[NTKOlympusMask angleForMinute:v8 seconds:v10];
    [(NTKOlympusTimeView *)self applyWindrunnerMaskWithHourAngle:v12 minuteAngle:v13];
  }
}

- (void)updateMaskingPathStartPointWithNewHourAngle:(double)a3 newMinuteAngle:(double)a4
{
  [(NTKOlympusTimeView *)self _calculateDeviationBetweenHourAngle:self->_hourHandAngle minuteAngle:self->_minuteHandAngle];
  BOOL v8 = v7 >= 180.0;
  [(NTKOlympusTimeView *)self _calculateDeviationBetweenHourAngle:a3 minuteAngle:a4];
  if (((v8 ^ (v9 < 180.0)) & 1) == 0 && (v9 < 100.0 || v9 > 260.0)) {
    self->_maskingPathStartsFromHourHand ^= 1u;
  }
}

- (void)applyWindrunnerMaskWithHourAngle:(double)a3 minuteAngle:(double)a4
{
  double v7 = [(NTKOlympusTimeView *)self overlayContentView];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  if (self->_hourHandAngle != a3 || self->_minuteHandAngle != a4) {
    goto LABEL_9;
  }
  if (v9 != self->_maskingSize.width || v11 != self->_maskingSize.height) {
    goto LABEL_9;
  }
  double v13 = [(NTKOlympusTimeView *)self overlayContentView];
  id v14 = [v13 layer];
  id v15 = [v14 mask];

  if (!v15)
  {
LABEL_9:
    self->_double hourHandAngle = a3;
    self->_double minuteHandAngle = a4;
    self->_maskingSize.width = v9;
    self->_maskingSize.height = v11;
    double minuteHandAngle = self->_minuteHandAngle;
    if (self->_maskingPathStartsFromHourHand) {
      double hourHandAngle = self->_hourHandAngle;
    }
    else {
      double hourHandAngle = self->_minuteHandAngle;
    }
    if (!self->_maskingPathStartsFromHourHand) {
      double minuteHandAngle = self->_hourHandAngle;
    }
    [(NTKOlympusTimeView *)self applyWindrunnerMaskStartAngle:hourHandAngle endAngle:minuteHandAngle];
  }
}

- (void)applyWindrunnerMaskStartAngle:(double)a3 endAngle:(double)a4
{
  double v5 = [(NTKOlympusTimeView *)self overlayContentView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v20.origin.x = v7;
  v20.origin.y = v9;
  v20.size.width = v11;
  v20.size.height = v13;
  CGRectGetWidth(v20);
  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  CGRectGetHeight(v21);
  MEMORY[0x1C1874A70](v7, v9, v11, v13);
  id v14 = +[NTKOlympusMask clippingPathFromCenterPoint:startAngle:endAngle:radius:](NTKOlympusMask, "clippingPathFromCenterPoint:startAngle:endAngle:radius:");
  id v15 = [MEMORY[0x1E4F39C88] layer];
  id v18 = v14;
  objc_msgSend(v15, "setPath:", objc_msgSend(v18, "CGPath"));
  v16 = [(NTKOlympusTimeView *)self overlayContentView];
  id v17 = [v16 layer];
  [v17 setMask:v15];
}

- (double)_calculateDeviationBetweenHourAngle:(double)a3 minuteAngle:(double)a4
{
  +[NTKOlympusMask normalizeAngle:a3];
  double v6 = v5;
  +[NTKOlympusMask normalizeAngle:a4];
  double v8 = v7 - v6;
  if (v8 < 0.0) {
    double v8 = v8 + 360.0;
  }
  float v9 = v8;
  return floorf(v9);
}

- (BOOL)_hasWindrunnerWedge
{
  return self->_currentStyle - 1 < 2;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  objc_storeStrong((id *)&self->_date, a3);
  id v7 = a3;
  double v8 = [(NTKOlympusTimeView *)self contentView];
  [v8 setOverrideDate:v7 duration:a4];

  id v9 = [(NTKOlympusTimeView *)self overlayContentView];
  [v9 setOverrideDate:v7 duration:a4];
}

- (void)setTimeOffset:(double)a3
{
  double v5 = [(NTKOlympusTimeView *)self contentView];
  [v5 setTimeOffset:a3];

  id v6 = [(NTKOlympusTimeView *)self overlayContentView];
  [v6 setTimeOffset:a3];
}

- (void)olympusContentViewDidHandleLogoHighlighted:(id)a3
{
  overlayContentView = self->_overlayContentView;
  if (overlayContentView == a3) {
    overlayContentView = self->_contentView;
  }
  [(NTKOlympusTimeContentView *)overlayContentView setLogoButtonHighlighted:1];
}

- (void)olympusContentViewDidHandleLogoResetHighlight:(id)a3
{
  overlayContentView = self->_overlayContentView;
  if (overlayContentView == a3) {
    overlayContentView = self->_contentView;
  }
  [(NTKOlympusTimeContentView *)overlayContentView setLogoButtonHighlighted:0];
}

- (void)olympusContentView:(id)a3 didHandleLogoTouchUpInsideFromRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  overlayContentView = self->_overlayContentView;
  if (overlayContentView == a3) {
    overlayContentView = self->_contentView;
  }
  [(NTKOlympusTimeContentView *)overlayContentView setLogoButtonHighlighted:0];

  -[NTKOlympusTimeView openVictoryAppFromRect:](self, "openVictoryAppFromRect:", x, y, width, height);
}

- (void)openVictoryAppFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(NTKOlympusTimeView *)self delegate];
  objc_msgSend(v8, "olympusView:didTapAppLogoFromRect:", self, x, y, width, height);
}

- (BOOL)_maskingPathStartsFromHourHandForDate:(id)a3
{
  id v3 = a3;
  BOOL v4 = NTKStartOfDayForDate(v3);
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;

  [v3 timeIntervalSinceReferenceDate];
  char v8 = -1;
  do
  {
    double v6 = v6 + 3927.27273;
    ++v8;
  }
  while (v6 < v7);
  BOOL v9 = v8 & 1;

  return v9;
}

- (BOOL)isFrozen
{
  return self->frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->frozen = a3;
}

- (NTKOlympusViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKOlympusViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (double)hourHandAngle
{
  return self->_hourHandAngle;
}

- (void)setHourHandAngle:(double)a3
{
  self->_double hourHandAngle = a3;
}

- (double)minuteHandAngle
{
  return self->_minuteHandAngle;
}

- (void)setMinuteHandAngle:(double)a3
{
  self->_double minuteHandAngle = a3;
}

- (unint64_t)currentStyle
{
  return self->_currentStyle;
}

- (unint64_t)currentDial
{
  return self->_currentDial;
}

- (NTKOlympusColorPalette)currentColorPalette
{
  return self->_currentColorPalette;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NTKOlympusTimeContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (NTKOlympusTimeContentView)overlayContentView
{
  return self->_overlayContentView;
}

- (void)setOverlayContentView:(id)a3
{
}

- (BOOL)maskingPathStartsFromHourHand
{
  return self->_maskingPathStartsFromHourHand;
}

- (void)setMaskingPathStartsFromHourHand:(BOOL)a3
{
  self->_maskingPathStartsFromHourHand = a3;
}

- (BOOL)useSmallFont
{
  return self->_useSmallFont;
}

- (void)setUseSmallFont:(BOOL)a3
{
  self->_useSmallFont = a3;
}

- (UIImage)circularLogoImage
{
  return self->_circularLogoImage;
}

- (void)setCircularLogoImage:(id)a3
{
}

- (CGSize)maskingSize
{
  double width = self->_maskingSize.width;
  double height = self->_maskingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaskingSize:(CGSize)a3
{
  self->_maskingSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularLogoImage, 0);
  objc_storeStrong((id *)&self->_overlayContentView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end