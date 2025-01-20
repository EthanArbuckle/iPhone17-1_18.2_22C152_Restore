@interface NTKOlympusTimeContentView
+ (double)scaleForViewDuringColorChangeTransitionWithFraction:(double)a3;
- (BOOL)containsSubview:(id)a3;
- (BOOL)invertedColors;
- (BOOL)isFrozen;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)useSmallFont;
- (CGSize)logoImageSizeForCircularDial;
- (CLKDevice)device;
- (CLKTimeFormatter)timeFormatter;
- (NTKOlympusColorPalette)colorPalette;
- (NTKOlympusColorPalette)palette;
- (NTKOlympusContentViewDelegate)delegate;
- (NTKOlympusTimeContentView)initWithDevice:(id)a3 dial:(unint64_t)a4 style:(unint64_t)a5 colorPalette:(id)a6;
- (NTKOlympusTimeContentView)initWithDevice:(id)a3 dial:(unint64_t)a4 style:(unint64_t)a5 colorPalette:(id)a6 useSmallFont:(BOOL)a7 circularLogoImage:(id)a8;
- (NTKVictoryLabel)circularLowerTimeLabel;
- (NTKVictoryLabel)circularUpperTimeLabel;
- (NTKVictoryLabel)fullscreenDigitalLowerTimeLabel;
- (NTKVictoryLabel)fullscreenDigitalUpperTimeLabel;
- (NTKVictoryLabel)fullscreenHybridLowerTimeLabel;
- (NTKVictoryTimeLabel)fullscreenHybridUpperTimeLabel;
- (UIButton)circularLogoButton;
- (UIButton)fullscreenLogoButton;
- (UIColor)currentBackgroundColor;
- (UIColor)currentForegroundColor;
- (UIColor)currentLogoColor;
- (UIImage)circularLogoImage;
- (UIView)circularDigitsContainerView;
- (UIView)contentView;
- (UIView)fullscreenDigitsContainerView;
- (double)analogStyleFraction;
- (double)analogStyleSwooshPositionFraction;
- (double)dialFraction;
- (double)digitalStyleFraction;
- (double)olympusAnalogStyleFraction;
- (double)olympusDigitalLabelsPositionFraction;
- (double)olympusDigitalStyleFraction;
- (id)createLogoButtonWithBackgroundImage:(id)a3;
- (id)createTimeLabelWithFont:(id)a3 option:(unint64_t)a4;
- (id)fontForCircularDial;
- (id)fontForDigitalFullscreen;
- (id)fontForHybridFullscreen;
- (id)monospacedFontForCircularDial;
- (id)styleWithFont:(id)a3;
- (id)victoryFontWithSize:(double)a3;
- (unint64_t)dial;
- (unint64_t)style;
- (void)_applyAnimationPopTransitionWithFraction:(double)a3;
- (void)_applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5 fromBackgroundColor:(id)a6 toBackgroundColor:(id)a7 fromLogoColor:(id)a8 toLogoColor:(id)a9;
- (void)_applyTransitionFraction:(double)a3 fromTextColor:(id)a4 toTextColor:(id)a5;
- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 animateElements:(BOOL)a6;
- (void)applyTransitionFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5;
- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)configureViewsForEditing;
- (void)createAndRemoveViewsForCurrentStateIfNeeded;
- (void)createCircularViewsIfNeeded;
- (void)createFullscreenDigitalViewsIfNeeded;
- (void)createFullscreenHybridViewsIfNeeded;
- (void)createFullscreenLogoIfNeeded;
- (void)dealloc;
- (void)ensureVisibleIfNeeded:(id)a3;
- (void)handleLogoButtonHighlighted:(id)a3;
- (void)handleLogoButtonResetHighlight:(id)a3;
- (void)handleLogoButtonTouchUpInside:(id)a3;
- (void)layoutSubviews;
- (void)removeCircularViews;
- (void)removeFullscreenViews;
- (void)setAnalogStyleFraction:(double)a3;
- (void)setAnalogStyleSwooshPositionFraction:(double)a3;
- (void)setCircularDigitsContainerView:(id)a3;
- (void)setCircularLogoButton:(id)a3;
- (void)setCircularLogoImage:(id)a3;
- (void)setCircularLowerTimeLabel:(id)a3;
- (void)setCircularUpperTimeLabel:(id)a3;
- (void)setColorPalette:(id)a3;
- (void)setContentView:(id)a3;
- (void)setCurrentBackgroundColor:(id)a3;
- (void)setCurrentForegroundColor:(id)a3;
- (void)setCurrentLogoColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDial:(unint64_t)a3;
- (void)setDialFraction:(double)a3;
- (void)setDigitalStyleFraction:(double)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setFullscreenDigitalLowerTimeLabel:(id)a3;
- (void)setFullscreenDigitalUpperTimeLabel:(id)a3;
- (void)setFullscreenDigitsContainerView:(id)a3;
- (void)setFullscreenHybridLowerTimeLabel:(id)a3;
- (void)setFullscreenHybridUpperTimeLabel:(id)a3;
- (void)setFullscreenLogoButton:(id)a3;
- (void)setInvertedColors:(BOOL)a3;
- (void)setLabelOutlineAlpha:(double)a3;
- (void)setLabelOutlineColor:(id)a3;
- (void)setLogoButtonHighlighted:(BOOL)a3;
- (void)setLogoImageSizeForCircularDial:(CGSize)a3;
- (void)setOlympusAnalogStyleFraction:(double)a3;
- (void)setOlympusDigitalLabelsPositionFraction:(double)a3;
- (void)setOlympusDigitalStyleFraction:(double)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setPalette:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTimeFormatter:(id)a3;
- (void)setTimeOffset:(double)a3;
- (void)setUseSmallFont:(BOOL)a3;
- (void)setViewsVisibilityForDial:(unint64_t)a3 style:(unint64_t)a4;
- (void)setViewsVisibleForDialTransition;
- (void)setViewsVisibleForStyleTransition;
- (void)timeFormatterTextDidChange:(id)a3;
- (void)updateColors;
- (void)updateLogosFrame;
- (void)updateStylesFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)updateTimeLabelsFrame;
@end

@implementation NTKOlympusTimeContentView

- (NTKOlympusTimeContentView)initWithDevice:(id)a3 dial:(unint64_t)a4 style:(unint64_t)a5 colorPalette:(id)a6
{
  return [(NTKOlympusTimeContentView *)self initWithDevice:a3 dial:a4 style:a5 colorPalette:a6 useSmallFont:0 circularLogoImage:0];
}

- (NTKOlympusTimeContentView)initWithDevice:(id)a3 dial:(unint64_t)a4 style:(unint64_t)a5 colorPalette:(id)a6 useSmallFont:(BOOL)a7 circularLogoImage:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  v33.receiver = self;
  v33.super_class = (Class)NTKOlympusTimeContentView;
  v17 = -[NTKOlympusTimeContentView initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v18 = v17;
  if (v17)
  {
    [(NTKOlympusTimeContentView *)v17 setDevice:v14];
    v18->_style = a5;
    v18->_dial = a4;
    objc_storeStrong((id *)&v18->_colorPalette, a6);
    v18->_useSmallFont = a7;
    objc_storeStrong((id *)&v18->_circularLogoImage, a8);
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F19AD0]) initWithForcesLatinNumbers:1];
    timeFormatter = v18->_timeFormatter;
    v18->_timeFormatter = (CLKTimeFormatter *)v19;

    [(CLKTimeFormatter *)v18->_timeFormatter addObserver:v18];
    id v21 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NTKOlympusTimeContentView *)v18 bounds];
    uint64_t v22 = objc_msgSend(v21, "initWithFrame:");
    contentView = v18->_contentView;
    v18->_contentView = (UIView *)v22;

    [(NTKOlympusTimeContentView *)v18 addSubview:v18->_contentView];
    id v24 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NTKOlympusTimeContentView *)v18 bounds];
    v25 = objc_msgSend(v24, "initWithFrame:");
    [(NTKOlympusTimeContentView *)v18 setFullscreenDigitsContainerView:v25];

    v26 = [(NTKOlympusTimeContentView *)v18 contentView];
    v27 = [(NTKOlympusTimeContentView *)v18 fullscreenDigitsContainerView];
    [v26 addSubview:v27];

    id v28 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NTKOlympusTimeContentView *)v18 bounds];
    v29 = objc_msgSend(v28, "initWithFrame:");
    [(NTKOlympusTimeContentView *)v18 setCircularDigitsContainerView:v29];

    v30 = [(NTKOlympusTimeContentView *)v18 contentView];
    v31 = [(NTKOlympusTimeContentView *)v18 circularDigitsContainerView];
    [v30 addSubview:v31];

    [(NTKOlympusTimeContentView *)v18 createAndRemoveViewsForCurrentStateIfNeeded];
    [(NTKOlympusTimeContentView *)v18 updateColors];
  }

  return v18;
}

- (void)dealloc
{
  [(CLKTimeFormatter *)self->_timeFormatter removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)NTKOlympusTimeContentView;
  [(NTKOlympusTimeContentView *)&v3 dealloc];
}

- (void)createAndRemoveViewsForCurrentStateIfNeeded
{
  unint64_t dial = self->_dial;
  if (dial == 1)
  {
    [(NTKOlympusTimeContentView *)self removeCircularViews];
    [(NTKOlympusTimeContentView *)self createFullscreenLogoIfNeeded];
    unint64_t style = self->_style;
    if (!style)
    {
      [(NTKOlympusTimeContentView *)self createFullscreenDigitalViewsIfNeeded];
      unint64_t style = self->_style;
    }
    if (style == 1) {
      [(NTKOlympusTimeContentView *)self createFullscreenHybridViewsIfNeeded];
    }
  }
  else if (!dial)
  {
    [(NTKOlympusTimeContentView *)self createCircularViewsIfNeeded];
    [(NTKOlympusTimeContentView *)self removeFullscreenViews];
  }
  [(NTKOlympusTimeContentView *)self timeFormatterTextDidChange:self->_timeFormatter];
  [(NTKOlympusTimeContentView *)self setDial:self->_dial];
  [(NTKOlympusTimeContentView *)self setStyle:self->_style];
  colorPalette = self->_colorPalette;
  [(NTKOlympusTimeContentView *)self setColorPalette:colorPalette];
}

- (void)configureViewsForEditing
{
  [(NTKOlympusTimeContentView *)self createCircularViewsIfNeeded];
  [(NTKOlympusTimeContentView *)self createFullscreenLogoIfNeeded];
  [(NTKOlympusTimeContentView *)self createFullscreenDigitalViewsIfNeeded];
  [(NTKOlympusTimeContentView *)self createFullscreenHybridViewsIfNeeded];
  [(NTKOlympusTimeContentView *)self timeFormatterTextDidChange:self->_timeFormatter];
  [(NTKOlympusTimeContentView *)self setDial:self->_dial];
  [(NTKOlympusTimeContentView *)self setStyle:self->_style];
  colorPalette = self->_colorPalette;
  [(NTKOlympusTimeContentView *)self setColorPalette:colorPalette];
}

- (void)createFullscreenLogoIfNeeded
{
  if (!self->_fullscreenLogoButton) {
    NTKImageNamed(@"victoryNTK-fullscreen-logo");
  }
}

- (void)createCircularViewsIfNeeded
{
  if (!self->_circularLogoButton)
  {
    objc_super v3 = [(NTKOlympusTimeContentView *)self circularLogoImage];
    v4 = [(NTKOlympusTimeContentView *)self createLogoButtonWithBackgroundImage:v3];
    circularLogoButton = self->_circularLogoButton;
    self->_circularLogoButton = v4;

    v6 = [(NTKOlympusTimeContentView *)self contentView];
    [v6 addSubview:self->_circularLogoButton];
  }
  if (!self->_circularUpperTimeLabel)
  {
    v7 = objc_alloc_init(NTKVictoryLabel);
    circularUpperTimeLabel = self->_circularUpperTimeLabel;
    self->_circularUpperTimeLabel = v7;

    v9 = [(NTKOlympusTimeContentView *)self device];
    _LayoutConstants_9(v9, v24);
    [(NTKVictoryLabel *)self->_circularUpperTimeLabel setAdditionalPaddingInsets:v24[0]];

    v10 = [(NTKOlympusTimeContentView *)self device];
    _LayoutConstants_9(v10, v22);
    -[NTKVictoryLabel setDrawingRectOffset:](self->_circularUpperTimeLabel, "setDrawingRectOffset:", v23, 0.0);

    v11 = [(NTKOlympusTimeContentView *)self fontForCircularDial];
    [(CLKUIColoringLabel *)self->_circularUpperTimeLabel setFont:v11];

    [(NTKVictoryLabel *)self->_circularUpperTimeLabel setTextAlignment:2];
    v12 = [(NTKOlympusTimeContentView *)self circularDigitsContainerView];
    [v12 addSubview:self->_circularUpperTimeLabel];
  }
  if (!self->_circularLowerTimeLabel)
  {
    v13 = objc_alloc_init(NTKVictoryLabel);
    circularLowerTimeLabel = self->_circularLowerTimeLabel;
    self->_circularLowerTimeLabel = v13;

    id v15 = [(NTKOlympusTimeContentView *)self device];
    _LayoutConstants_9(v15, v21);
    [(NTKVictoryLabel *)self->_circularLowerTimeLabel setAdditionalPaddingInsets:v21[0]];

    id v16 = [(NTKOlympusTimeContentView *)self device];
    _LayoutConstants_9(v16, v19);
    -[NTKVictoryLabel setDrawingRectOffset:](self->_circularLowerTimeLabel, "setDrawingRectOffset:", v20, 0.0);

    v17 = [(NTKOlympusTimeContentView *)self fontForCircularDial];
    [(CLKUIColoringLabel *)self->_circularLowerTimeLabel setFont:v17];

    [(NTKVictoryLabel *)self->_circularLowerTimeLabel setTextAlignment:2];
    id v18 = [(NTKOlympusTimeContentView *)self circularDigitsContainerView];
    [v18 addSubview:self->_circularLowerTimeLabel];
  }
}

- (id)createLogoButtonWithBackgroundImage:(id)a3
{
  id v4 = a3;
  v5 = +[NTKVictoryLogoButton buttonWithType:0];
  [v5 setBackgroundImage:v4 forState:0];

  [v5 setUserInteractionEnabled:1];
  [v5 addTarget:self action:sel_handleLogoButtonHighlighted_ forControlEvents:1];
  [v5 addTarget:self action:sel_handleLogoButtonResetHighlight_ forControlEvents:256];
  [v5 addTarget:self action:sel_handleLogoButtonTouchUpInside_ forControlEvents:64];
  [v5 sizeToFit];
  return v5;
}

- (void)createFullscreenDigitalViewsIfNeeded
{
  if (!self->_fullscreenDigitalUpperTimeLabel)
  {
    objc_super v3 = objc_alloc_init(NTKVictoryLabel);
    fullscreenDigitalUpperTimeLabel = self->_fullscreenDigitalUpperTimeLabel;
    self->_fullscreenDigitalUpperTimeLabel = v3;

    v5 = [(NTKOlympusTimeContentView *)self device];
    _LayoutConstants_9(v5, v20);
    [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel setAdditionalPaddingInsets:v20[0]];

    v6 = [(NTKOlympusTimeContentView *)self device];
    _LayoutConstants_9(v6, v18);
    -[NTKVictoryLabel setDrawingRectOffset:](self->_fullscreenDigitalUpperTimeLabel, "setDrawingRectOffset:", v19, 0.0);

    v7 = [(NTKOlympusTimeContentView *)self fontForDigitalFullscreen];
    [(CLKUIColoringLabel *)self->_fullscreenDigitalUpperTimeLabel setFont:v7];

    [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel setTextAlignment:2];
    v8 = [(NTKOlympusTimeContentView *)self fullscreenDigitsContainerView];
    [v8 addSubview:self->_fullscreenDigitalUpperTimeLabel];
  }
  if (!self->_fullscreenDigitalLowerTimeLabel)
  {
    v9 = objc_alloc_init(NTKVictoryLabel);
    fullscreenDigitalLowerTimeLabel = self->_fullscreenDigitalLowerTimeLabel;
    self->_fullscreenDigitalLowerTimeLabel = v9;

    v11 = [(NTKOlympusTimeContentView *)self device];
    _LayoutConstants_9(v11, v17);
    [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel setAdditionalPaddingInsets:v17[0]];

    v12 = [(NTKOlympusTimeContentView *)self device];
    _LayoutConstants_9(v12, v15);
    -[NTKVictoryLabel setDrawingRectOffset:](self->_fullscreenDigitalLowerTimeLabel, "setDrawingRectOffset:", v16, 0.0);

    v13 = [(NTKOlympusTimeContentView *)self fontForDigitalFullscreen];
    [(CLKUIColoringLabel *)self->_fullscreenDigitalLowerTimeLabel setFont:v13];

    [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel setTextAlignment:2];
    id v14 = [(NTKOlympusTimeContentView *)self fullscreenDigitsContainerView];
    [v14 addSubview:self->_fullscreenDigitalLowerTimeLabel];
  }
}

- (void)createFullscreenHybridViewsIfNeeded
{
  if (!self->_fullscreenHybridUpperTimeLabel)
  {
    objc_super v3 = [(NTKOlympusTimeContentView *)self fontForHybridFullscreen];
    id v4 = [(NTKOlympusTimeContentView *)self createTimeLabelWithFont:v3 option:1024];
    fullscreenHybridUpperTimeLabel = self->_fullscreenHybridUpperTimeLabel;
    self->_fullscreenHybridUpperTimeLabel = v4;

    v6 = [(NTKOlympusTimeContentView *)self fullscreenDigitsContainerView];
    [v6 addSubview:self->_fullscreenHybridUpperTimeLabel];
  }
  if (!self->_fullscreenHybridLowerTimeLabel)
  {
    v7 = objc_alloc_init(NTKVictoryLabel);
    fullscreenHybridLowerTimeLabel = self->_fullscreenHybridLowerTimeLabel;
    self->_fullscreenHybridLowerTimeLabel = v7;

    v9 = [(NTKOlympusTimeContentView *)self device];
    _LayoutConstants_9(v9, v12);
    [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel setAdditionalPaddingInsets:v12[0]];

    v10 = [(NTKOlympusTimeContentView *)self fontForHybridFullscreen];
    [(CLKUIColoringLabel *)self->_fullscreenHybridLowerTimeLabel setFont:v10];

    [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel setTextAlignment:1];
    id v11 = [(NTKOlympusTimeContentView *)self fullscreenDigitsContainerView];
    [v11 addSubview:self->_fullscreenHybridLowerTimeLabel];
  }
}

- (void)removeFullscreenViews
{
  [(UIButton *)self->_fullscreenLogoButton removeFromSuperview];
  fullscreenLogoButton = self->_fullscreenLogoButton;
  self->_fullscreenLogoButton = 0;

  [(NTKVictoryTimeLabel *)self->_fullscreenHybridUpperTimeLabel removeFromSuperview];
  fullscreenHybridUpperTimeLabel = self->_fullscreenHybridUpperTimeLabel;
  self->_fullscreenHybridUpperTimeLabel = 0;

  [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel removeFromSuperview];
  fullscreenHybridLowerTimeLabel = self->_fullscreenHybridLowerTimeLabel;
  self->_fullscreenHybridLowerTimeLabel = 0;

  [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel removeFromSuperview];
  fullscreenDigitalUpperTimeLabel = self->_fullscreenDigitalUpperTimeLabel;
  self->_fullscreenDigitalUpperTimeLabel = 0;

  [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel removeFromSuperview];
  fullscreenDigitalLowerTimeLabel = self->_fullscreenDigitalLowerTimeLabel;
  self->_fullscreenDigitalLowerTimeLabel = 0;
}

- (void)removeCircularViews
{
  [(NTKVictoryLabel *)self->_circularUpperTimeLabel removeFromSuperview];
  circularUpperTimeLabel = self->_circularUpperTimeLabel;
  self->_circularUpperTimeLabel = 0;

  [(NTKVictoryLabel *)self->_circularLowerTimeLabel removeFromSuperview];
  circularLowerTimeLabel = self->_circularLowerTimeLabel;
  self->_circularLowerTimeLabel = 0;

  [(UIButton *)self->_circularLogoButton removeFromSuperview];
  circularLogoButton = self->_circularLogoButton;
  self->_circularLogoButton = 0;
}

- (id)fontForCircularDial
{
  -[NTKOlympusTimeContentView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  objc_super v3 = 0);
  _LayoutConstants_9(v3, &v7);

  if (self->_useSmallFont) {
    id v4 = (double *)&v9;
  }
  else {
    id v4 = (double *)&v8 + 1;
  }
  double v5 = *v4;
  return +[NTKVictoryLabel victoryFontWithSize:0 style:0 monospacedNumbers:v5];
}

- (id)monospacedFontForCircularDial
{
  -[NTKOlympusTimeContentView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  objc_super v3 = 0);
  _LayoutConstants_9(v3, &v7);

  if (self->_useSmallFont) {
    id v4 = (double *)&v9;
  }
  else {
    id v4 = (double *)&v8 + 1;
  }
  double v5 = *v4;
  return +[NTKVictoryLabel victoryFontWithSize:0 style:1 monospacedNumbers:v5];
}

- (id)fontForHybridFullscreen
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  v2 = [(NTKOlympusTimeContentView *)self device];
  _LayoutConstants_9(v2, &v5);

  double v3 = *((double *)&v6 + 1);
  return +[NTKVictoryLabel victoryFontWithSize:0 style:v3];
}

- (id)fontForDigitalFullscreen
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  v2 = [(NTKOlympusTimeContentView *)self device];
  _LayoutConstants_9(v2, &v5);

  double v3 = *(double *)&v6;
  return +[NTKVictoryLabel victoryFontWithSize:0 style:v3];
}

- (id)victoryFontWithSize:(double)a3
{
  return +[NTKVictoryLabel victoryFontWithSize:0 style:a3];
}

- (id)createTimeLabelWithFont:(id)a3 option:(unint64_t)a4
{
  long long v6 = [(NTKOlympusTimeContentView *)self styleWithFont:a3];
  long long v7 = [NTKVictoryTimeLabel alloc];
  device = self->_device;
  long long v9 = [(NTKOlympusTimeContentView *)self device];
  _LayoutConstants_9(v9, v12);
  long long v10 = [(NTKVictoryTimeLabel *)v7 initWithTimeLabelOptions:a4 forDevice:device additionalPaddingInsets:v12[0]];

  [(NTKDigitalTimeLabel *)v10 setStyle:v6];
  return v10;
}

- (id)styleWithFont:(id)a3
{
  return +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 0, a3, self->_device, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), 0.0, 0.0);
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)NTKOlympusTimeContentView;
  [(NTKOlympusTimeContentView *)&v8 layoutSubviews];
  double v3 = [(NTKOlympusTimeContentView *)self contentView];
  [(NTKOlympusTimeContentView *)self bounds];
  objc_msgSend(v3, "ntk_setBoundsAndPositionFromFrame:");

  id v4 = [(NTKOlympusTimeContentView *)self fullscreenDigitsContainerView];
  long long v5 = [(NTKOlympusTimeContentView *)self contentView];
  [v5 bounds];
  objc_msgSend(v4, "ntk_setBoundsAndPositionFromFrame:");

  long long v6 = [(NTKOlympusTimeContentView *)self circularDigitsContainerView];
  long long v7 = [(NTKOlympusTimeContentView *)self contentView];
  [v7 bounds];
  objc_msgSend(v6, "ntk_setBoundsAndPositionFromFrame:");

  [(NTKOlympusTimeContentView *)self updateLogosFrame];
  [(NTKOlympusTimeContentView *)self updateTimeLabelsFrame];
}

- (void)updateLogosFrame
{
  memset(v23, 0, sizeof(v23));
  double v3 = [(NTKOlympusTimeContentView *)self device];
  _LayoutConstants_9(v3, v23);

  [(UIButton *)self->_fullscreenLogoButton bounds];
  CGRectGetWidth(v24);
  [(UIButton *)self->_fullscreenLogoButton bounds];
  CGRectGetHeight(v25);
  [(UIButton *)self->_fullscreenLogoButton bounds];
  CGRectGetWidth(v26);
  [(UIButton *)self->_fullscreenLogoButton bounds];
  CGRectGetHeight(v27);
  CLKInterpolateBetweenFloatsClipped();
  double v5 = v4;
  CLKInterpolateBetweenFloatsClipped();
  -[UIButton setCenter:](self->_fullscreenLogoButton, "setCenter:", v5, v6);
  [(UIButton *)self->_circularLogoButton bounds];
  CGRectGetWidth(v28);
  [(UIButton *)self->_circularLogoButton bounds];
  CGRectGetHeight(v29);
  [(NTKOlympusTimeContentView *)self bounds];
  CGRectGetMidX(v30);
  [(UIButton *)self->_circularLogoButton bounds];
  CGRectGetHeight(v31);
  CLKInterpolateBetweenFloatsClipped();
  double v8 = v7;
  CLKInterpolateBetweenFloatsClipped();
  -[UIButton setCenter:](self->_circularLogoButton, "setCenter:", v8, v9);
  double dialFraction = self->_dialFraction;
  if (dialFraction <= 0.0 || dialFraction >= 1.0)
  {
    fullscreenLogoButton = self->_fullscreenLogoButton;
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v18 = *MEMORY[0x1E4F1DAB8];
    long long v19 = v17;
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v16 = (CGAffineTransform *)&v18;
  }
  else
  {
    CLKCompressFraction();
    [(UIButton *)self->_fullscreenLogoButton center];
    [(UIButton *)self->_circularLogoButton center];
    CLKInterpolateBetweenFloatsClipped();
    double v12 = v11;
    [(UIButton *)self->_fullscreenLogoButton center];
    [(UIButton *)self->_circularLogoButton center];
    CLKInterpolateBetweenFloatsClipped();
    -[UIButton setCenter:](self->_fullscreenLogoButton, "setCenter:", v12, v13);
    [(UIButton *)self->_circularLogoButton bounds];
    [(UIButton *)self->_fullscreenLogoButton bounds];
    CLKInterpolateBetweenFloatsClipped();
    CGAffineTransformMakeScale(&v22, v14, v14);
    fullscreenLogoButton = self->_fullscreenLogoButton;
    CGAffineTransform v21 = v22;
    double v16 = &v21;
  }
  -[UIButton setTransform:](fullscreenLogoButton, "setTransform:", v16, v18, v19, v20, *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx);
}

- (void)updateTimeLabelsFrame
{
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  memset(v94, 0, sizeof(v94));
  double v3 = [(NTKOlympusTimeContentView *)self device];
  _LayoutConstants_9(v3, v94);

  if (self->_useSmallFont)
  {
    double v4 = *((double *)&v100 + 1);
    double v5 = *(double *)&v101;
    [(NTKVictoryLabel *)self->_circularUpperTimeLabel bounds];
    double v6 = v5 + CGRectGetHeight(v103) * -0.5;
    [(NTKVictoryLabel *)self->_circularUpperTimeLabel _baselineOffsetFromBottom];
    double v8 = v6 + v7;
  }
  else
  {
    [(UIView *)self->_circularDigitsContainerView bounds];
    double Width = CGRectGetWidth(v104);
    [(NTKVictoryLabel *)self->_circularUpperTimeLabel bounds];
    double v4 = Width - v10 * 0.5 - *(double *)&v99;
    [(NTKVictoryLabel *)self->_circularUpperTimeLabel bounds];
    double v8 = *((double *)&v98 + 1) + v11 * 0.5;
  }
  -[NTKVictoryLabel setCenter:](self->_circularUpperTimeLabel, "setCenter:", v4, v8);
  if (self->_useSmallFont)
  {
    double v12 = *((double *)&v101 + 1);
    double v13 = *(double *)&v102;
    [(NTKVictoryLabel *)self->_circularLowerTimeLabel bounds];
    double v14 = v13 + CGRectGetHeight(v105) * -0.5;
    [(NTKVictoryLabel *)self->_circularLowerTimeLabel _baselineOffsetFromBottom];
    double v16 = v14 + v15;
  }
  else
  {
    [(NTKVictoryLabel *)self->_circularLowerTimeLabel bounds];
    double v12 = *(double *)&v100 + v17 * 0.5;
    [(NTKVictoryLabel *)self->_circularLowerTimeLabel bounds];
    double v16 = *((double *)&v99 + 1) + v18 * 0.5;
  }
  -[NTKVictoryLabel setCenter:](self->_circularLowerTimeLabel, "setCenter:", v12, v16);
  [(NTKVictoryTimeLabel *)self->_fullscreenHybridUpperTimeLabel bounds];
  double v20 = v19;
  double v22 = v21;
  [(NTKOlympusTimeContentView *)self bounds];
  CGFloat v23 = CGRectGetWidth(v106);
  double v24 = *(double *)&v96;
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_fullscreenHybridUpperTimeLabel, "ntk_setBoundsAndPositionFromFrame:", v23 - v20 - *(double *)&v96, *((double *)&v95 + 1), v20, v22);
  [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel bounds];
  double v26 = v25;
  double v28 = v27;
  [(NTKOlympusTimeContentView *)self bounds];
  CGFloat v29 = CGRectGetWidth(v107);
  double v30 = *((double *)&v97 + 1);
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_fullscreenDigitalUpperTimeLabel, "ntk_setBoundsAndPositionFromFrame:", v29 - v26 - *((double *)&v97 + 1), *(double *)&v97, v26, v28);
  [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel bounds];
  double v32 = v31;
  double v34 = v33;
  [(NTKOlympusTimeContentView *)self bounds];
  CGFloat v35 = CGRectGetWidth(v108) - v32 - v24;
  [(NTKVictoryTimeLabel *)self->_fullscreenHybridUpperTimeLabel frame];
  CGFloat MaxY = CGRectGetMaxY(v109);
  double v37 = *((double *)&v96 + 1);
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_fullscreenHybridLowerTimeLabel, "ntk_setBoundsAndPositionFromFrame:", v35, MaxY + *((double *)&v96 + 1), v32, v34);
  [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel bounds];
  double v39 = v38;
  double v41 = v40;
  [(NTKOlympusTimeContentView *)self bounds];
  CGFloat v42 = CGRectGetWidth(v110) - v39 - v30;
  [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel frame];
  CGFloat v43 = CGRectGetMaxY(v111);
  double v44 = *(double *)&v98;
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_fullscreenDigitalLowerTimeLabel, "ntk_setBoundsAndPositionFromFrame:", v42, v43 + *(double *)&v98, v39, v41);
  [(NTKVictoryTimeLabel *)self->_fullscreenHybridUpperTimeLabel center];
  [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel center];
  double olympusDigitalLabelsPositionFraction = self->_olympusDigitalLabelsPositionFraction;
  if (olympusDigitalLabelsPositionFraction > 0.0 && olympusDigitalLabelsPositionFraction < 1.0)
  {
    CLKInterpolateBetweenFloatsClipped();
    double v85 = v44;
    double v47 = v46;
    CLKInterpolateBetweenFloatsClipped();
    -[NTKVictoryTimeLabel setCenter:](self->_fullscreenHybridUpperTimeLabel, "setCenter:", v47, v48);
    CLKInterpolateBetweenFloatsClipped();
    double v50 = v49;
    CGAffineTransformMakeScale(&v93, v49, v49);
    fullscreenHybridUpperTimeLabel = self->_fullscreenHybridUpperTimeLabel;
    CGAffineTransform v92 = v93;
    [(NTKVictoryTimeLabel *)fullscreenHybridUpperTimeLabel setTransform:&v92];
    [(NTKVictoryTimeLabel *)self->_fullscreenHybridUpperTimeLabel center];
    double v53 = v52;
    [(NTKVictoryTimeLabel *)self->_fullscreenHybridUpperTimeLabel frame];
    double v55 = v53 + v54 * 0.5;
    [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel frame];
    double v57 = v55 - v56 * 0.5;
    [(NTKVictoryTimeLabel *)self->_fullscreenHybridUpperTimeLabel center];
    double v59 = v58;
    [(NTKVictoryTimeLabel *)self->_fullscreenHybridUpperTimeLabel frame];
    double v61 = v37 + v59 + v60 * 0.5;
    [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel frame];
    -[NTKVictoryLabel setCenter:](self->_fullscreenHybridLowerTimeLabel, "setCenter:", v57, v61 + v62 * 0.5);
    CGFloat v63 = v50;
    CGFloat v64 = v50;
    double v44 = v85;
    CGAffineTransformMakeScale(&v91, v63, v64);
    fullscreenHybridLowerTimeLabel = self->_fullscreenHybridLowerTimeLabel;
    CGAffineTransform v90 = v91;
    [(NTKVictoryLabel *)fullscreenHybridLowerTimeLabel setTransform:&v90];
  }
  double digitalStyleFraction = self->_digitalStyleFraction;
  if (digitalStyleFraction > 0.0 && digitalStyleFraction < 1.0)
  {
    CLKInterpolateBetweenFloatsClipped();
    double v68 = v67;
    CLKInterpolateBetweenFloatsClipped();
    -[NTKVictoryLabel setCenter:](self->_fullscreenDigitalUpperTimeLabel, "setCenter:", v68, v69);
    CLKInterpolateBetweenFloatsClipped();
    CGFloat v71 = v70;
    CGAffineTransformMakeScale(&v89, v70, v70);
    fullscreenDigitalUpperTimeLabel = self->_fullscreenDigitalUpperTimeLabel;
    CGAffineTransform v88 = v89;
    [(NTKVictoryLabel *)fullscreenDigitalUpperTimeLabel setTransform:&v88];
    [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel center];
    double v74 = v73;
    [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel frame];
    double v76 = v74 + v75 * 0.5;
    [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel frame];
    double v78 = v76 - v77 * 0.5;
    [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel center];
    double v80 = v79;
    [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel frame];
    double v82 = v44 + v80 + v81 * 0.5;
    [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel frame];
    -[NTKVictoryLabel setCenter:](self->_fullscreenDigitalLowerTimeLabel, "setCenter:", v78, v82 + v83 * 0.5);
    CGAffineTransformMakeScale(&v87, v71, v71);
    fullscreenDigitalLowerTimeLabel = self->_fullscreenDigitalLowerTimeLabel;
    CGAffineTransform v86 = v87;
    [(NTKVictoryLabel *)fullscreenDigitalLowerTimeLabel setTransform:&v86];
  }
}

- (void)setInvertedColors:(BOOL)a3
{
  if (self->_invertedColors != a3)
  {
    self->_invertedColors = a3;
    [(NTKOlympusTimeContentView *)self updateColors];
  }
}

- (void)setDial:(unint64_t)a3
{
  self->_unint64_t dial = a3;
  double v4 = 0.0;
  if (!a3) {
    double v4 = 1.0;
  }
  self->_double dialFraction = v4;
  [(NTKOlympusTimeContentView *)self setViewsVisibilityForDial:self->_dial style:self->_style];
  double v5 = [(NTKOlympusTimeContentView *)self fullscreenDigitsContainerView];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v11[0] = *MEMORY[0x1E4F1DAB8];
  long long v8 = v11[0];
  v11[1] = v9;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v7 = v12;
  [v5 setTransform:v11];

  double v6 = [(NTKOlympusTimeContentView *)self circularDigitsContainerView];
  v10[0] = v8;
  v10[1] = v9;
  v10[2] = v7;
  [v6 setTransform:v10];

  [(NTKOlympusTimeContentView *)self updateLogosFrame];
}

- (void)setStyle:(unint64_t)a3
{
  self->_unint64_t style = a3;
  [(NTKOlympusTimeContentView *)self updateStylesFraction:a3 fromStyle:a3 toStyle:1.0];
  [(NTKOlympusTimeContentView *)self setViewsVisibilityForDial:self->_dial style:self->_style];
  [(NTKOlympusTimeContentView *)self updateLogosFrame];
  [(NTKOlympusTimeContentView *)self updateTimeLabelsFrame];
}

- (void)setColorPalette:(id)a3
{
  p_colorPalette = &self->_colorPalette;
  objc_storeStrong((id *)&self->_colorPalette, a3);
  id v6 = a3;
  objc_storeStrong((id *)&self->_palette, *p_colorPalette);

  [(NTKOlympusTimeContentView *)self updateColors];
}

- (UIImage)circularLogoImage
{
  circularLogoImage = self->_circularLogoImage;
  if (!circularLogoImage) {
    NTKImageNamed(@"VictoryNTK-circular-logo");
  }
  double v3 = circularLogoImage;
  return v3;
}

- (CGSize)logoImageSizeForCircularDial
{
  p_logoImageSizeForCircularDial = &self->_logoImageSizeForCircularDial;
  double width = self->_logoImageSizeForCircularDial.width;
  double height = self->_logoImageSizeForCircularDial.height;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    id v6 = [(NTKOlympusTimeContentView *)self circularLogoImage];
    [v6 size];
    p_logoImageSizeForCircularDial->double width = v7;
    p_logoImageSizeForCircularDial->double height = v8;

    double width = p_logoImageSizeForCircularDial->width;
    double height = p_logoImageSizeForCircularDial->height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)updateColors
{
  double v15 = self->_palette;
  double v3 = [(NTKOlympusColorPalette *)v15 primaryTextColor];
  double v4 = [(NTKOlympusColorPalette *)v15 primaryBackgroundColor];
  double v5 = [(NTKOlympusColorPalette *)v15 primaryLogoColor];
  if (self->_invertedColors)
  {
    uint64_t v6 = [(NTKOlympusColorPalette *)v15 secondaryTextColor];

    uint64_t v7 = [(NTKOlympusColorPalette *)v15 secondaryBackgroundColor];

    uint64_t v8 = [(NTKOlympusColorPalette *)v15 secondaryLogoColor];

    double v3 = (UIColor *)v6;
    double v4 = (UIColor *)v7;
    double v5 = (UIColor *)v8;
  }
  currentForegroundColor = self->_currentForegroundColor;
  self->_currentForegroundColor = v3;
  double v10 = v3;

  currentBackgroundColor = self->_currentBackgroundColor;
  self->_currentBackgroundColor = v4;
  long long v12 = v4;

  currentLogoColor = self->_currentLogoColor;
  self->_currentLogoColor = v5;
  double v14 = v5;

  [(NTKOlympusTimeContentView *)self setBackgroundColor:v12];
  [(CLKUIColoringLabel *)self->_circularUpperTimeLabel setColor:v10];
  [(CLKUIColoringLabel *)self->_circularLowerTimeLabel setColor:v10];
  [(UIButton *)self->_circularLogoButton setTintColor:v14];
  [(UIButton *)self->_fullscreenLogoButton setTintColor:v14];
  [(NTKDigitalTimeLabel *)self->_fullscreenHybridUpperTimeLabel setColor:v10];
  [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel setFillColor:v10];
  [(CLKUIColoringLabel *)self->_fullscreenDigitalUpperTimeLabel setColor:v10];
  [(CLKUIColoringLabel *)self->_fullscreenDigitalLowerTimeLabel setColor:v10];
}

- (void)applyTransitionFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5
{
  if (a4 == a5)
  {
    [(NTKOlympusTimeContentView *)self setDial:a3];
  }
  else
  {
    if (a5 == 1 && a4 == 0) {
      double v7 = 1.0 - a3;
    }
    else {
      double v7 = a3;
    }
    self->_double dialFraction = v7;
    [(NTKOlympusTimeContentView *)self setViewsVisibleForDialTransition];
    CLKCompressFraction();
    double v9 = v8;
    CLKCompressFraction();
    double v11 = v10;
    -[NTKVictoryLabel setAlpha:](self->_circularUpperTimeLabel, "setAlpha:");
    [(NTKVictoryLabel *)self->_circularLowerTimeLabel setAlpha:v11];
    [(NTKVictoryTimeLabel *)self->_fullscreenHybridUpperTimeLabel setAlpha:1.0 - v9];
    [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel setAlpha:1.0 - v9];
    [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel setAlpha:1.0 - v9];
    [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel setAlpha:1.0 - v9];
    CLKInterpolateBetweenFloatsClipped();
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeScale(&v23, v12, v12);
    CGAffineTransform v22 = v23;
    double v13 = [(NTKOlympusTimeContentView *)self fullscreenDigitsContainerView];
    CGAffineTransform v21 = v22;
    [v13 setTransform:&v21];

    CLKInterpolateBetweenFloatsClipped();
    CGAffineTransformMakeScale(&v20, v14, v14);
    CGAffineTransform v23 = v20;
    CGAffineTransform v19 = v20;
    double v15 = [(NTKOlympusTimeContentView *)self circularDigitsContainerView];
    CGAffineTransform v18 = v19;
    [v15 setTransform:&v18];

    if (v7 >= 1.0) {
      double v16 = 0.0;
    }
    else {
      double v16 = 1.0;
    }
    if (v7 >= 1.0) {
      double v17 = 1.0;
    }
    else {
      double v17 = 0.0;
    }
    [(UIButton *)self->_fullscreenLogoButton setAlpha:v16];
    [(UIButton *)self->_circularLogoButton setAlpha:v17];
    [(NTKOlympusTimeContentView *)self updateLogosFrame];
  }
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  if (a4 == a5)
  {
    [(NTKOlympusTimeContentView *)self setStyle:a3];
  }
  else
  {
    [(NTKOlympusTimeContentView *)self setViewsVisibleForStyleTransition];
    [(NTKOlympusTimeContentView *)self updateStylesFraction:a4 fromStyle:a5 toStyle:a3];
    [(NTKOlympusTimeContentView *)self updateTimeLabelsFrame];
    [(NTKOlympusTimeContentView *)self updateLogosFrame];
    [(NTKVictoryTimeLabel *)self->_fullscreenHybridUpperTimeLabel setAlpha:self->_olympusDigitalStyleFraction];
    [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel setAlpha:self->_olympusDigitalStyleFraction];
    [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel setAlpha:self->_digitalStyleFraction];
    [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel setAlpha:self->_digitalStyleFraction];
    double digitalStyleFraction = self->_digitalStyleFraction;
    if (digitalStyleFraction < self->_olympusDigitalStyleFraction) {
      double digitalStyleFraction = self->_olympusDigitalStyleFraction;
    }
    [(NTKVictoryLabel *)self->_circularUpperTimeLabel setAlpha:digitalStyleFraction];
    double olympusDigitalStyleFraction = self->_digitalStyleFraction;
    if (olympusDigitalStyleFraction < self->_olympusDigitalStyleFraction) {
      double olympusDigitalStyleFraction = self->_olympusDigitalStyleFraction;
    }
    [(NTKVictoryLabel *)self->_circularLowerTimeLabel setAlpha:olympusDigitalStyleFraction];
    [(UIButton *)self->_fullscreenLogoButton setAlpha:1.0 - self->_analogStyleFraction];
    [(UIButton *)self->_fullscreenLogoButton alpha];
    -[UIButton setAlpha:](self->_circularLogoButton, "setAlpha:");
    if ((a4 == 1 || a5 == 1) && (a4 == 2 || a5 == 2) && self->_olympusDigitalLabelsPositionFraction == 1.0)
    {
      CLKCompressFraction();
      CLKInterpolateBetweenFloatsClipped();
      memset(&v20, 0, sizeof(v20));
      CGAffineTransformMakeScale(&v20, v11, v11);
      CGAffineTransform v19 = v20;
      CGFloat v12 = [(NTKOlympusTimeContentView *)self fullscreenDigitsContainerView];
      CGAffineTransform v18 = v19;
      [v12 setTransform:&v18];

      CGAffineTransform v17 = v20;
      double v13 = [(NTKOlympusTimeContentView *)self circularDigitsContainerView];
      CGAffineTransform v16 = v17;
      [v13 setTransform:&v16];

      CLKInterpolateBetweenFloatsClipped();
      double v15 = v14;
      -[NTKVictoryTimeLabel setAlpha:](self->_fullscreenHybridUpperTimeLabel, "setAlpha:");
      [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel setAlpha:v15];
      [(NTKVictoryLabel *)self->_circularUpperTimeLabel setAlpha:v15];
      [(NTKVictoryLabel *)self->_circularLowerTimeLabel setAlpha:v15];
    }
  }
}

- (void)updateStylesFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  self->_double digitalStyleFraction = 0.0;
  self->_double olympusDigitalStyleFraction = 0.0;
  self->_olympusAnalogStyleFraction = 0.0;
  self->_analogStyleFraction = 0.0;
  self->_double olympusDigitalLabelsPositionFraction = 0.0;
  if (!a4 || !a5)
  {
    double v5 = 1.0 - a3;
    if (!a5) {
      double v5 = a3;
    }
    self->_double digitalStyleFraction = v5;
  }
  if (a4 == 1 || a5 == 1)
  {
    double v6 = 1.0 - a3;
    if (a5 == 1) {
      double v6 = a3;
    }
    self->_double olympusDigitalStyleFraction = v6;
    self->_double olympusDigitalLabelsPositionFraction = v6;
  }
  if (a4 != 2)
  {
    double v7 = 0.0;
    if (a5 != 2) {
      goto LABEL_17;
    }
  }
  double v7 = 1.0;
  double v8 = 1.0 - a3;
  if (a5 == 2) {
    double v8 = a3;
  }
  self->_olympusAnalogStyleFraction = v8;
  self->_analogStyleSwooshPositionFraction = v8;
  self->_double olympusDigitalLabelsPositionFraction = 1.0;
  if (a4 == 3 || a5 == 3) {
LABEL_17:
  }
    self->_analogStyleSwooshPositionFraction = v7;
  if (a4 == 3 || a5 == 3)
  {
    if (a5 != 3) {
      a3 = 1.0 - a3;
    }
    self->_analogStyleFraction = a3;
  }
}

- (void)setViewsVisibilityForDial:(unint64_t)a3 style:(unint64_t)a4
{
  BOOL v6 = a3 == 0;
  BOOL v7 = a4 != 1 || a3 == 0;
  BOOL v8 = a3 != 0;
  fullscreenHybridUpperTimeLabel = self->_fullscreenHybridUpperTimeLabel;
  if (a3) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = a4 > 1;
  }
  [(CLKUITimeLabel *)fullscreenHybridUpperTimeLabel setHidden:v7];
  [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel setHidden:v7];
  [(NTKOlympusTimeContentView *)self ensureVisibleIfNeeded:self->_fullscreenHybridUpperTimeLabel];
  [(NTKOlympusTimeContentView *)self ensureVisibleIfNeeded:self->_fullscreenHybridLowerTimeLabel];
  if (a4) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v6;
  }
  [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel setHidden:v11];
  [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel setHidden:v11];
  [(NTKOlympusTimeContentView *)self ensureVisibleIfNeeded:self->_fullscreenDigitalUpperTimeLabel];
  [(NTKOlympusTimeContentView *)self ensureVisibleIfNeeded:self->_fullscreenDigitalLowerTimeLabel];
  [(NTKVictoryLabel *)self->_circularUpperTimeLabel setHidden:v10];
  [(NTKVictoryLabel *)self->_circularLowerTimeLabel setHidden:v10];
  [(NTKOlympusTimeContentView *)self ensureVisibleIfNeeded:self->_circularUpperTimeLabel];
  [(NTKOlympusTimeContentView *)self ensureVisibleIfNeeded:self->_circularLowerTimeLabel];
  [(UIButton *)self->_fullscreenLogoButton setHidden:v6];
  [(UIButton *)self->_circularLogoButton setHidden:v8];
  [(NTKOlympusTimeContentView *)self ensureVisibleIfNeeded:self->_fullscreenLogoButton];
  circularLogoButton = self->_circularLogoButton;
  [(NTKOlympusTimeContentView *)self ensureVisibleIfNeeded:circularLogoButton];
}

- (void)setViewsVisibleForDialTransition
{
  unint64_t style = self->_style;
  BOOL v4 = style != 0;
  BOOL v5 = style != 1;
  BOOL v6 = style > 1;
  [(CLKUITimeLabel *)self->_fullscreenHybridUpperTimeLabel setHidden:v5];
  [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel setHidden:v5];
  [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel setHidden:v4];
  [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel setHidden:v4];
  [(NTKVictoryLabel *)self->_circularUpperTimeLabel setHidden:v6];
  [(NTKVictoryLabel *)self->_circularLowerTimeLabel setHidden:v6];
  [(UIButton *)self->_fullscreenLogoButton setHidden:0];
  circularLogoButton = self->_circularLogoButton;
  [(UIButton *)circularLogoButton setHidden:0];
}

- (void)setViewsVisibleForStyleTransition
{
  unint64_t dial = self->_dial;
  BOOL v4 = dial != 0;
  BOOL v5 = dial == 0;
  [(CLKUITimeLabel *)self->_fullscreenHybridUpperTimeLabel setHidden:v5];
  [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel setHidden:v5];
  [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel setHidden:v5];
  [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel setHidden:v5];
  [(NTKVictoryLabel *)self->_circularUpperTimeLabel setHidden:v4];
  [(NTKVictoryLabel *)self->_circularLowerTimeLabel setHidden:v4];
  [(UIButton *)self->_circularLogoButton setHidden:v4];
  [(UIButton *)self->_fullscreenLogoButton setHidden:v5];
  fullscreenDigitalUpperTimeLabel = self->_fullscreenDigitalUpperTimeLabel;
  [(NTKOlympusTimeContentView *)self ensureVisibleIfNeeded:fullscreenDigitalUpperTimeLabel];
}

- (void)ensureVisibleIfNeeded:(id)a3
{
  id v5 = a3;
  int v3 = [v5 isHidden];
  double v4 = 1.0;
  if (v3) {
    double v4 = 0.0;
  }
  [v5 setAlpha:v4];
}

- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 animateElements:(BOOL)a6
{
  BOOL v6 = a6;
  id v23 = a4;
  id v10 = a5;
  if ([v23 isEqual:v10])
  {
    [(NTKOlympusTimeContentView *)self setPalette:v10];
  }
  else
  {
    uint64_t v11 = [v23 primaryTextColor];
    CGFloat v12 = [v10 primaryTextColor];
    double v13 = [v23 primaryBackgroundColor];
    double v14 = [v10 primaryBackgroundColor];
    double v15 = [v10 primaryLogoColor];
    CGAffineTransform v16 = [v23 primaryLogoColor];
    if (self->_invertedColors)
    {
      uint64_t v22 = [v23 secondaryTextColor];

      uint64_t v21 = [v10 secondaryTextColor];

      uint64_t v20 = [v23 secondaryBackgroundColor];

      uint64_t v19 = [v10 secondaryBackgroundColor];

      uint64_t v17 = [v23 secondaryLogoColor];

      uint64_t v18 = [v10 secondaryLogoColor];

      CGFloat v12 = (void *)v21;
      uint64_t v11 = (void *)v22;
      double v14 = (void *)v19;
      double v13 = (void *)v20;
      double v15 = (void *)v18;
      CGAffineTransform v16 = (void *)v17;
    }
    [(NTKOlympusTimeContentView *)self _applyTransitionFraction:v11 fromColor:v12 toColor:v13 fromBackgroundColor:v14 toBackgroundColor:v16 fromLogoColor:v15 toLogoColor:a3];
    if (v6) {
      [(NTKOlympusTimeContentView *)self _applyAnimationPopTransitionWithFraction:a3];
    }
  }
}

- (void)setLabelOutlineAlpha:(double)a3
{
  -[NTKVictoryLabel setOutlineAlpha:](self->_fullscreenHybridLowerTimeLabel, "setOutlineAlpha:");
  [(NTKVictoryTimeLabel *)self->_fullscreenHybridUpperTimeLabel setOutlineAlpha:a3];
  [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel setOutlineAlpha:a3];
  [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel setOutlineAlpha:a3];
  [(NTKVictoryLabel *)self->_circularUpperTimeLabel setOutlineAlpha:a3];
  circularLowerTimeLabel = self->_circularLowerTimeLabel;
  [(NTKVictoryLabel *)circularLowerTimeLabel setOutlineAlpha:a3];
}

- (void)setLabelOutlineColor:(id)a3
{
  fullscreenHybridLowerTimeLabel = self->_fullscreenHybridLowerTimeLabel;
  id v5 = a3;
  [(NTKVictoryLabel *)fullscreenHybridLowerTimeLabel setOutlineColor:v5];
  [(NTKVictoryTimeLabel *)self->_fullscreenHybridUpperTimeLabel setOutlineColor:v5];
  [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel setOutlineColor:v5];
  [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel setOutlineColor:v5];
  [(NTKVictoryLabel *)self->_circularUpperTimeLabel setOutlineColor:v5];
  [(NTKVictoryLabel *)self->_circularLowerTimeLabel setOutlineColor:v5];
}

- (void)_applyAnimationPopTransitionWithFraction:(double)a3
{
  [(id)objc_opt_class() scaleForViewDuringColorChangeTransitionWithFraction:a3];
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeScale(&v13, v4, v4);
  CGAffineTransform v12 = v13;
  [(NTKVictoryLabel *)self->_circularUpperTimeLabel setTransform:&v12];
  CGAffineTransform v11 = v13;
  [(NTKVictoryLabel *)self->_circularLowerTimeLabel setTransform:&v11];
  CGAffineTransform v10 = v13;
  [(UIButton *)self->_fullscreenLogoButton setTransform:&v10];
  CGAffineTransform v9 = v13;
  [(UIButton *)self->_circularLogoButton setTransform:&v9];
  CGAffineTransform v8 = v13;
  [(NTKVictoryTimeLabel *)self->_fullscreenHybridUpperTimeLabel setTransform:&v8];
  CGAffineTransform v7 = v13;
  [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel setTransform:&v7];
  CGAffineTransform v6 = v13;
  [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel setTransform:&v6];
  CGAffineTransform v5 = v13;
  [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel setTransform:&v5];
}

- (void)_applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5 fromBackgroundColor:(id)a6 toBackgroundColor:(id)a7 fromLogoColor:(id)a8 toLogoColor:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  [(NTKOlympusTimeContentView *)self _applyTransitionFraction:a4 fromTextColor:a5 toTextColor:a3];
  uint64_t v20 = NTKInterpolateBetweenColors();

  [(UIButton *)self->_circularLogoButton setTintColor:v20];
  [(UIButton *)self->_fullscreenLogoButton setTintColor:v20];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__NTKOlympusTimeContentView__applyTransitionFraction_fromColor_toColor_fromBackgroundColor_toBackgroundColor_fromLogoColor_toLogoColor___block_invoke;
  aBlock[3] = &__block_descriptor_40_e8_f12__0f8l;
  *(double *)&aBlock[4] = a3;
  uint64_t v21 = (void (**)(double))_Block_copy(aBlock);
  v21[2](0.0);
  uint64_t v22 = NTKInterpolateBetweenColors();

  [(NTKOlympusTimeContentView *)self setBackgroundColor:v22];
}

float __136__NTKOlympusTimeContentView__applyTransitionFraction_fromColor_toColor_fromBackgroundColor_toBackgroundColor_fromLogoColor_toLogoColor___block_invoke(uint64_t a1, float a2)
{
  double v2 = (*(double *)(a1 + 32) - (float)((float)(a2 + 0.4) + -0.1)) / 0.200000003;
  if (v2 > 1.0) {
    double v2 = 1.0;
  }
  return fmax(v2, 0.0);
}

- (void)_applyTransitionFraction:(double)a3 fromTextColor:(id)a4 toTextColor:(id)a5
{
  NTKInterpolateBetweenColors();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(NTKDigitalTimeLabel *)self->_fullscreenHybridUpperTimeLabel setColor:v6];
  [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel setFillColor:v6];
  [(CLKUIColoringLabel *)self->_fullscreenDigitalUpperTimeLabel setColor:v6];
  [(CLKUIColoringLabel *)self->_fullscreenDigitalLowerTimeLabel setColor:v6];
  [(CLKUIColoringLabel *)self->_circularUpperTimeLabel setColor:v6];
  [(CLKUIColoringLabel *)self->_circularLowerTimeLabel setColor:v6];
}

+ (double)scaleForViewDuringColorChangeTransitionWithFraction:(double)a3
{
  CGFloat v4 = NTKVictoryTransitionTimingFunction();
  CGAffineTransform v5 = v4;
  *(float *)&double v6 = a3;
  *(float *)&double v6 = fabsf((float)(*(float *)&v6 + -0.4) / 0.4);
  if (*(float *)&v6 > 1.0) {
    *(float *)&double v6 = 1.0;
  }
  [v4 _solveForInput:v6];
  double v8 = v7 * 0.075 + 0.925;

  return v8;
}

- (void)setLogoButtonHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIButton setHighlighted:](self->_fullscreenLogoButton, "setHighlighted:");
  circularLogoButton = self->_circularLogoButton;
  [(UIButton *)circularLogoButton setHighlighted:v3];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
}

- (void)setTimeOffset:(double)a3
{
}

- (void)handleLogoButtonHighlighted:(id)a3
{
  id v4 = [(NTKOlympusTimeContentView *)self delegate];
  [v4 olympusContentViewDidHandleLogoHighlighted:self];
}

- (void)handleLogoButtonResetHighlight:(id)a3
{
  id v4 = [(NTKOlympusTimeContentView *)self delegate];
  [v4 olympusContentViewDidHandleLogoResetHighlight:self];
}

- (void)handleLogoButtonTouchUpInside:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  objc_msgSend(v4, "convertRect:toView:", self);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  CGAffineTransform v13 = [(NTKOlympusTimeContentView *)self delegate];
  objc_msgSend(v13, "olympusContentView:didHandleLogoTouchUpInsideFromRect:", self, v6, v8, v10, v12);

  id v14 = [(NTKOlympusTimeContentView *)self delegate];
  [v14 olympusContentViewDidHandleLogoResetHighlight:self];
}

- (BOOL)containsSubview:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  BOOL v16 = 0;
  double v5 = [v4 superview];
  BOOL v6 = v5 == self;

  BOOL v16 = v6;
  if (*((unsigned char *)v14 + 24))
  {
    BOOL v7 = 1;
  }
  else
  {
    double v8 = [(NTKOlympusTimeContentView *)self subviews];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__NTKOlympusTimeContentView_containsSubview___block_invoke;
    _OWORD v10[3] = &unk_1E62C28A0;
    double v12 = &v13;
    id v11 = v4;
    [v8 enumerateObjectsUsingBlock:v10];

    BOOL v7 = *((unsigned char *)v14 + 24) != 0;
  }
  _Block_object_dispose(&v13, 8);

  return v7;
}

uint64_t __45__NTKOlympusTimeContentView_containsSubview___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(result + 32) == a2;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(NTKOlympusTimeContentView *)self layer];
  double v9 = [v8 mask];
  double v10 = (const CGPath *)[v9 path];

  if (v10)
  {
    v15.double x = x;
    v15.double y = y;
    BOOL v11 = CGPathContainsPoint(v10, 0, v15, 0);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NTKOlympusTimeContentView;
    BOOL v11 = -[NTKOlympusTimeContentView pointInside:withEvent:](&v14, sel_pointInside_withEvent_, v7, x, y);
  }
  BOOL v12 = v11;

  return v12;
}

- (void)timeFormatterTextDidChange:(id)a3
{
  fullscreenHybridUpperTimeLabel = self->_fullscreenHybridUpperTimeLabel;
  double v5 = [a3 overrideDate];
  [(NTKDigitalTimeLabel *)fullscreenHybridUpperTimeLabel setOverrideDate:v5 duration:0.0];

  BOOL v6 = [(CLKTimeFormatter *)self->_timeFormatter timeSubstringToSeparatorText];
  objc_msgSend(NSString, "stringWithFormat:", @"%02ld", objc_msgSend(v6, "integerValue"));
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v17];
  int v8 = [v17 hasSuffix:@"1"];
  uint64_t v9 = [(NTKOlympusTimeContentView *)self monospacedFontForCircularDial];
  double v10 = (void *)v9;
  BOOL v11 = (void *)MEMORY[0x1E4FB06F8];
  if (!v8 && v9) {
    objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v9, objc_msgSend(v17, "length") - 1, 1);
  }
  BOOL v12 = [(CLKUIColoringLabel *)self->_circularUpperTimeLabel color];
  uint64_t v13 = (void *)MEMORY[0x1E4FB0700];
  if (v12) {
    objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v12, 0, objc_msgSend(v17, "length"));
  }
  [(NTKVictoryLabel *)self->_circularUpperTimeLabel setAttributedText:v7];
  [(NTKVictoryLabel *)self->_circularUpperTimeLabel sizeToFit];
  [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel setText:v17];
  [(NTKVictoryLabel *)self->_fullscreenDigitalUpperTimeLabel sizeToFit];
  [(CLKTimeFormatter *)self->_timeFormatter setIncludeSeparatorInTimeSubstringFromSeparatorText:0];
  objc_super v14 = [(CLKTimeFormatter *)self->_timeFormatter timeSubstringFromSeparatorText];
  [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel setText:v14];
  [(NTKVictoryLabel *)self->_fullscreenHybridLowerTimeLabel sizeToFit];
  [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel setText:v14];
  [(NTKVictoryLabel *)self->_fullscreenDigitalLowerTimeLabel sizeToFit];
  CGPoint v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v14];
  if (![v14 hasPrefix:@"1"] && v10) {
    objc_msgSend(v15, "addAttribute:value:range:", *v11, v10, 0, 1);
  }
  BOOL v16 = [(CLKUIColoringLabel *)self->_circularLowerTimeLabel color];
  if (v16) {
    objc_msgSend(v15, "addAttribute:value:range:", *v13, v16, 0, objc_msgSend(v14, "length"));
  }
  [(NTKVictoryLabel *)self->_circularLowerTimeLabel setAttributedText:v15];
  [(NTKVictoryLabel *)self->_circularLowerTimeLabel sizeToFit];
  [(NTKOlympusTimeContentView *)self updateTimeLabelsFrame];
}

- (BOOL)isFrozen
{
  return self->frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->frozen = a3;
}

- (NTKOlympusContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKOlympusContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)invertedColors
{
  return self->_invertedColors;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (UIButton)fullscreenLogoButton
{
  return self->_fullscreenLogoButton;
}

- (void)setFullscreenLogoButton:(id)a3
{
}

- (UIButton)circularLogoButton
{
  return self->_circularLogoButton;
}

- (void)setCircularLogoButton:(id)a3
{
}

- (void)setCircularLogoImage:(id)a3
{
}

- (NTKVictoryTimeLabel)fullscreenHybridUpperTimeLabel
{
  return self->_fullscreenHybridUpperTimeLabel;
}

- (void)setFullscreenHybridUpperTimeLabel:(id)a3
{
}

- (NTKVictoryLabel)fullscreenHybridLowerTimeLabel
{
  return self->_fullscreenHybridLowerTimeLabel;
}

- (void)setFullscreenHybridLowerTimeLabel:(id)a3
{
}

- (NTKVictoryLabel)fullscreenDigitalUpperTimeLabel
{
  return self->_fullscreenDigitalUpperTimeLabel;
}

- (void)setFullscreenDigitalUpperTimeLabel:(id)a3
{
}

- (NTKVictoryLabel)fullscreenDigitalLowerTimeLabel
{
  return self->_fullscreenDigitalLowerTimeLabel;
}

- (void)setFullscreenDigitalLowerTimeLabel:(id)a3
{
}

- (NTKVictoryLabel)circularUpperTimeLabel
{
  return self->_circularUpperTimeLabel;
}

- (void)setCircularUpperTimeLabel:(id)a3
{
}

- (NTKVictoryLabel)circularLowerTimeLabel
{
  return self->_circularLowerTimeLabel;
}

- (void)setCircularLowerTimeLabel:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)fullscreenDigitsContainerView
{
  return self->_fullscreenDigitsContainerView;
}

- (void)setFullscreenDigitsContainerView:(id)a3
{
}

- (UIView)circularDigitsContainerView
{
  return self->_circularDigitsContainerView;
}

- (void)setCircularDigitsContainerView:(id)a3
{
}

- (CLKTimeFormatter)timeFormatter
{
  return self->_timeFormatter;
}

- (void)setTimeFormatter:(id)a3
{
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)dial
{
  return self->_dial;
}

- (NTKOlympusColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (NTKOlympusColorPalette)palette
{
  return self->_palette;
}

- (void)setPalette:(id)a3
{
}

- (UIColor)currentForegroundColor
{
  return self->_currentForegroundColor;
}

- (void)setCurrentForegroundColor:(id)a3
{
}

- (UIColor)currentBackgroundColor
{
  return self->_currentBackgroundColor;
}

- (void)setCurrentBackgroundColor:(id)a3
{
}

- (UIColor)currentLogoColor
{
  return self->_currentLogoColor;
}

- (void)setCurrentLogoColor:(id)a3
{
}

- (double)dialFraction
{
  return self->_dialFraction;
}

- (void)setDialFraction:(double)a3
{
  self->_double dialFraction = a3;
}

- (double)digitalStyleFraction
{
  return self->_digitalStyleFraction;
}

- (void)setDigitalStyleFraction:(double)a3
{
  self->_double digitalStyleFraction = a3;
}

- (double)olympusDigitalStyleFraction
{
  return self->_olympusDigitalStyleFraction;
}

- (void)setOlympusDigitalStyleFraction:(double)a3
{
  self->_double olympusDigitalStyleFraction = a3;
}

- (double)olympusAnalogStyleFraction
{
  return self->_olympusAnalogStyleFraction;
}

- (void)setOlympusAnalogStyleFraction:(double)a3
{
  self->_olympusAnalogStyleFraction = a3;
}

- (double)analogStyleFraction
{
  return self->_analogStyleFraction;
}

- (void)setAnalogStyleFraction:(double)a3
{
  self->_analogStyleFraction = a3;
}

- (double)olympusDigitalLabelsPositionFraction
{
  return self->_olympusDigitalLabelsPositionFraction;
}

- (void)setOlympusDigitalLabelsPositionFraction:(double)a3
{
  self->_double olympusDigitalLabelsPositionFraction = a3;
}

- (double)analogStyleSwooshPositionFraction
{
  return self->_analogStyleSwooshPositionFraction;
}

- (void)setAnalogStyleSwooshPositionFraction:(double)a3
{
  self->_analogStyleSwooshPositionFraction = a3;
}

- (void)setLogoImageSizeForCircularDial:(CGSize)a3
{
  self->_logoImageSizeForCircularDial = a3;
}

- (BOOL)useSmallFont
{
  return self->_useSmallFont;
}

- (void)setUseSmallFont:(BOOL)a3
{
  self->_useSmallFont = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLogoColor, 0);
  objc_storeStrong((id *)&self->_currentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_currentForegroundColor, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_circularDigitsContainerView, 0);
  objc_storeStrong((id *)&self->_fullscreenDigitsContainerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_circularLowerTimeLabel, 0);
  objc_storeStrong((id *)&self->_circularUpperTimeLabel, 0);
  objc_storeStrong((id *)&self->_fullscreenDigitalLowerTimeLabel, 0);
  objc_storeStrong((id *)&self->_fullscreenDigitalUpperTimeLabel, 0);
  objc_storeStrong((id *)&self->_fullscreenHybridLowerTimeLabel, 0);
  objc_storeStrong((id *)&self->_fullscreenHybridUpperTimeLabel, 0);
  objc_storeStrong((id *)&self->_circularLogoImage, 0);
  objc_storeStrong((id *)&self->_circularLogoButton, 0);
  objc_storeStrong((id *)&self->_fullscreenLogoButton, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end