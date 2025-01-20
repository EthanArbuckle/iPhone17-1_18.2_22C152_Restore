@interface NTKDualTimeView
- (BOOL)editing;
- (BOOL)isFrozen;
- (BOOL)shouldUseCustomDialBackground;
- (BOOL)useMonospacedDigitalNumbers;
- (CGSize)_hourTickSize;
- (CGSize)_minuteTickSize;
- (CGSize)_secondTickSize;
- (CLKDevice)device;
- (CLKUIDualTimeAnalogTicksView)analogTickContainerView;
- (NTKAnalogHandsView)analogHandsView;
- (NTKDigitalTimeLabel)digitalTimeLabel;
- (NTKDualTimeDigitalTicksView)digitalTicksContainerView;
- (NTKDualTimeView)initWithFrame:(CGRect)a3 style:(unint64_t)a4 andDevice:(id)a5;
- (NTKFaceColorPalette)colorPalette;
- (UIView)analogContainerView;
- (UIView)dialBackgroundView;
- (UIView)dialContainerView;
- (UIView)digitalContainerView;
- (double)_digitalTimeLabelFontSize;
- (double)_minuteTickInset;
- (double)_secondTickInset;
- (id)_activeTimeView;
- (id)_customDialBackgroundView;
- (id)_dialColorForColorPalette:(id)a3;
- (id)_digitalLabelFont;
- (id)_digitalStyle;
- (id)_digitalTimeLabelColorForColorPalette:(id)a3;
- (id)_hourMinuteHandFillColorForColorPalette:(id)a3;
- (id)_hourMinuteHandStrokeColorForColorPalette:(id)a3;
- (id)_hourTickColorForColorPalette:(id)a3;
- (id)_minuteTickColorForColorPalette:(id)a3;
- (id)_secondHandColorForColorPalette:(id)a3;
- (id)_secondTickActiveColorForColorPalette:(id)a3;
- (id)_secondTickInactiveColorForColorPalette:(id)a3;
- (id)activeColorForDualTimeDigitalTicksView:(id)a3;
- (id)inactiveColorForDualTimeDigitalTicksView:(id)a3;
- (unint64_t)_hourTickCount;
- (unint64_t)_minuteTickCount;
- (unint64_t)style;
- (void)_applyColorToAnalogHands;
- (void)_applyColorToDigitalLabelAndTicks;
- (void)_colorizeAnalogTicksWithHourColor:(id)a3 minuteColor:(id)a4;
- (void)_refreshDigitalTicks;
- (void)_refreshDigitalTimeLabel;
- (void)_setupAnalogHandsView;
- (void)_setupAnalogTimeViews;
- (void)_setupDial;
- (void)_setupDigitalTicks;
- (void)_setupDigitalTimeViews;
- (void)_startDigitalTicksAnimation;
- (void)_stopDigitalTicksAnimation;
- (void)_tearDownAnalogContainerView;
- (void)_tearDownDigitalContainerView;
- (void)applyGossamerColorPalette:(id)a3;
- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5;
- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 ignoreTimeView:(BOOL)a6;
- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAnalogContainerView:(id)a3;
- (void)setAnalogHandsView:(id)a3;
- (void)setColorPalette:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDialBackgroundView:(id)a3;
- (void)setDialContainerView:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setForcedNumberSystemForDigitalTimeLabel:(unint64_t)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setSecondsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setStyle:(unint64_t)a3;
- (void)setTimeOffset:(double)a3;
- (void)setUseMonospacedDigitalNumbers:(BOOL)a3;
- (void)setupTimeViews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NTKDualTimeView

- (NTKDualTimeView)initWithFrame:(CGRect)a3 style:(unint64_t)a4 andDevice:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NTKDualTimeView;
  v13 = -[NTKDualTimeView initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_device, a5);
    v14->_style = a4;
    v15 = [(NTKDualTimeView *)v14 layer];
    [v15 setAllowsGroupOpacity:1];

    [(NTKDualTimeView *)v14 _setupDial];
    [(NTKDualTimeView *)v14 setupTimeViews];
    [(NTKDualTimeView *)v14 setStyle:v14->_style];
    v16 = objc_alloc_init(NTKFaceColorPalette);
    v17 = +[NTKPigmentEditOption pigmentNamed:@"seasons.spring2015.white"];
    [(NTKFaceColorPalette *)v16 setPigmentEditOption:v17];

    [(NTKDualTimeView *)v14 setColorPalette:v16];
    v18 = objc_alloc_init(NTKFaceColorPalette);
    blackPalette = v14->_blackPalette;
    v14->_blackPalette = v18;

    v20 = +[NTKPigmentEditOption pigmentNamed:@"seasons.black"];
    [(NTKFaceColorPalette *)v14->_blackPalette setPigmentEditOption:v20];

    [(NTKDualTimeView *)v14 setColorPalette:v14->_blackPalette];
  }

  return v14;
}

- (void)dealloc
{
  [(NTKDualTimeView *)self _stopDigitalTicksAnimation];
  [(NTKDualTimeView *)self _tearDownAnalogContainerView];
  [(NTKDualTimeView *)self _tearDownDigitalContainerView];
  v3.receiver = self;
  v3.super_class = (Class)NTKDualTimeView;
  [(NTKDualTimeView *)&v3 dealloc];
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
  -[NTKDualTimeDigitalTicksView setEditing:](self->_digitalTicksContainerView, "setEditing:");

  [(NTKDualTimeView *)self _refreshDigitalTicks];
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)NTKDualTimeView;
  [(NTKDualTimeView *)&v16 layoutSubviews];
  [(NTKDualTimeView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_analogContainerView, "ntk_setBoundsAndPositionFromFrame:");
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_digitalContainerView, "ntk_setBoundsAndPositionFromFrame:", v4, v6, v8, v10);
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_dialBackgroundView, "ntk_setBoundsAndPositionFromFrame:", v4, v6, v8, v10);
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_dialContainerView, "ntk_setBoundsAndPositionFromFrame:", v4, v6, v8, v10);
  v11 = [(UIView *)self->_dialContainerView layer];
  [v11 setCornerRadius:v8 * 0.5];

  id v12 = [(UIView *)self->_dialBackgroundView layer];
  [v12 setCornerRadius:v8 * 0.5];

  double v13 = MEMORY[0x1C1874A70](v4, v6, v8, v10);
  double v15 = v14;
  -[NTKAnalogHandsView setCenter:](self->_analogHandsView, "setCenter:");
  -[CLKUIDualTimeAnalogTicksView setCenter:](self->_analogTickContainerView, "setCenter:", v13, v15);
  -[NTKDigitalTimeLabel setCenter:](self->_digitalTimeLabel, "setCenter:", v13, v15);
  -[NTKDualTimeDigitalTicksView setFrame:](self->_digitalTicksContainerView, "setFrame:", v4, v6, v8, v10);
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKDualTimeView;
  [(NTKDualTimeView *)&v6 traitCollectionDidChange:a3];
  digitalTimeLabel = self->_digitalTimeLabel;
  double v5 = [(NTKDualTimeView *)self _digitalStyle];
  [(NTKDigitalTimeLabel *)digitalTimeLabel setStyle:v5];

  [(NTKDualTimeView *)self setNeedsLayout];
}

- (void)setupTimeViews
{
  [(NTKDualTimeView *)self _setupAnalogTimeViews];
  [(NTKDualTimeView *)self _setupDigitalTimeViews];

  [(NTKDualTimeView *)self _didFinishTimeViewSetup];
}

- (void)_setupDial
{
  double v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  dialContainerView = self->_dialContainerView;
  self->_dialContainerView = v3;

  double v5 = self->_dialContainerView;
  [(NTKDualTimeView *)self bounds];
  -[UIView ntk_setBoundsAndPositionFromFrame:](v5, "ntk_setBoundsAndPositionFromFrame:");
  objc_super v6 = [(UIView *)self->_dialContainerView layer];
  [(NTKDualTimeView *)self bounds];
  [v6 setCornerRadius:v7 * 0.5];

  [(NTKDualTimeView *)self addSubview:self->_dialContainerView];
  if ([(NTKDualTimeView *)self shouldUseCustomDialBackground])
  {
    double v8 = [(NTKDualTimeView *)self _customDialBackgroundView];
  }
  else
  {
    double v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  }
  dialBackgroundView = self->_dialBackgroundView;
  self->_dialBackgroundView = v8;

  double v10 = self->_dialBackgroundView;
  [(NTKDualTimeView *)self bounds];
  -[UIView ntk_setBoundsAndPositionFromFrame:](v10, "ntk_setBoundsAndPositionFromFrame:");
  v11 = [(UIView *)self->_dialBackgroundView layer];
  [(NTKDualTimeView *)self bounds];
  [v11 setCornerRadius:v12 * 0.5];

  double v13 = self->_dialContainerView;
  double v14 = self->_dialBackgroundView;

  [(UIView *)v13 addSubview:v14];
}

- (BOOL)shouldUseCustomDialBackground
{
  return 0;
}

- (id)_customDialBackgroundView
{
  return 0;
}

- (void)_setupAnalogTimeViews
{
  if (!self->_analogContainerView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NTKDualTimeView *)self bounds];
    double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    analogContainerView = self->_analogContainerView;
    self->_analogContainerView = v4;

    objc_super v6 = [(UIView *)self->_analogContainerView layer];
    [v6 setAllowsGroupOpacity:1];

    [(UIView *)self->_dialContainerView insertSubview:self->_analogContainerView aboveSubview:self->_dialBackgroundView];
    [(NTKDualTimeView *)self _setupAnalogHandsView];
    unint64_t v7 = [(NTKDualTimeView *)self _minuteTickCount];
    unint64_t v8 = [(NTKDualTimeView *)self _hourTickCount];
    [(NTKDualTimeView *)self _minuteTickSize];
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    [(NTKDualTimeView *)self _hourTickSize];
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    [(NTKDualTimeView *)self _minuteTickInset];
    uint64_t v18 = v17;
    [(NTKDualTimeView *)self _hourTickInset];
    uint64_t v20 = v19;
    id v21 = objc_alloc((Class)off_1E62BDB68);
    [(NTKDualTimeView *)self bounds];
    v24[0] = v7;
    v24[1] = v8;
    v24[2] = v10;
    v24[3] = v12;
    v24[4] = v14;
    v24[5] = v16;
    v24[6] = v18;
    v24[7] = v20;
    v24[8] = 0;
    objc_super v22 = (CLKUIDualTimeAnalogTicksView *)objc_msgSend(v21, "initWithFrame:configuration:", v24);
    analogTickContainerView = self->_analogTickContainerView;
    self->_analogTickContainerView = v22;

    [(UIView *)self->_analogContainerView addSubview:self->_analogTickContainerView];
    [(NTKDualTimeView *)self bringSubviewToFront:self->_analogHandsView];
  }
}

- (void)_setupAnalogHandsView
{
  id v3 = [(NTKAnalogHandsView *)[NTKDualTimeAnalogHandsView alloc] initForDevice:self->_device];
  analogHandsView = self->_analogHandsView;
  self->_analogHandsView = v3;

  double v5 = self->_analogHandsView;

  [(NTKDualTimeView *)self addSubview:v5];
}

- (void)_tearDownAnalogContainerView
{
  [(NTKAnalogHandsView *)self->_analogHandsView removeFromSuperview];
  analogContainerView = self->_analogContainerView;

  [(UIView *)analogContainerView removeFromSuperview];
}

- (void)_colorizeAnalogTicksWithHourColor:(id)a3 minuteColor:(id)a4
{
}

- (void)_setupDigitalTimeViews
{
  if (!self->_digitalContainerView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NTKDualTimeView *)self bounds];
    double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    digitalContainerView = self->_digitalContainerView;
    self->_digitalContainerView = v4;

    objc_super v6 = [(UIView *)self->_digitalContainerView layer];
    [v6 setAllowsGroupOpacity:1];

    [(UIView *)self->_dialContainerView insertSubview:self->_digitalContainerView aboveSubview:self->_dialBackgroundView];
    unint64_t v7 = [[NTKDigitalTimeLabel alloc] initWithTimeLabelOptions:1 forDevice:self->_device];
    digitalTimeLabel = self->_digitalTimeLabel;
    self->_digitalTimeLabel = v7;

    uint64_t v9 = self->_digitalTimeLabel;
    uint64_t v10 = [(NTKDualTimeView *)self _digitalStyle];
    [(NTKDigitalTimeLabel *)v9 setStyle:v10];

    uint64_t v11 = self->_digitalTimeLabel;
    MEMORY[0x1C1874A70]([(NTKDualTimeView *)self bounds]);
    -[NTKDigitalTimeLabel setCenter:](v11, "setCenter:");
    [(UIView *)self->_digitalContainerView addSubview:self->_digitalTimeLabel];
    [(NTKDualTimeView *)self _setupDigitalTicks];
    [(UIView *)self->_digitalContainerView bringSubviewToFront:self->_digitalTimeLabel];
    [(NTKDualTimeView *)self _startDigitalTicksAnimation];
  }
}

- (void)_tearDownDigitalContainerView
{
  [(NTKDualTimeView *)self _stopDigitalTicksAnimation];
  [(NTKDigitalTimeLabel *)self->_digitalTimeLabel removeFromSuperview];
  digitalContainerView = self->_digitalContainerView;

  [(UIView *)digitalContainerView removeFromSuperview];
}

- (void)_setupDigitalTicks
{
  [(NTKDualTimeView *)self _secondTickSize];
  uint64_t v25 = v4;
  uint64_t v26 = v3;
  [(NTKDualTimeView *)self _cardinalSecondTickSize];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  [(NTKDualTimeView *)self _secondTickInset];
  uint64_t v10 = v9;
  [(NTKDualTimeView *)self _cardinalSecondTickInset];
  uint64_t v12 = v11;
  uint64_t v13 = [NTKDualTimeDigitalTicksView alloc];
  [(NTKDualTimeView *)self bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  objc_super v22 = [MEMORY[0x1E4F196B0] sharedInstance];
  v27[0] = v26;
  v27[1] = v25;
  v27[2] = v6;
  v27[3] = v8;
  v27[4] = v10;
  v27[5] = v12;
  v23 = -[NTKDualTimeDigitalTicksView initWithFrame:configuration:timer:](v13, "initWithFrame:configuration:timer:", v27, v22, v15, v17, v19, v21);
  digitalTicksContainerView = self->_digitalTicksContainerView;
  self->_digitalTicksContainerView = v23;

  [(NTKDualTimeDigitalTicksView *)self->_digitalTicksContainerView setDelegate:self];
  [(UIView *)self->_digitalContainerView addSubview:self->_digitalTicksContainerView];
}

- (void)_startDigitalTicksAnimation
{
}

- (void)_stopDigitalTicksAnimation
{
}

- (void)_refreshDigitalTicks
{
}

- (void)_refreshDigitalTimeLabel
{
  digitalTimeLabel = self->_digitalTimeLabel;
  id v3 = [(NTKDualTimeView *)self _digitalStyle];
  [(NTKDigitalTimeLabel *)digitalTimeLabel setStyle:v3];
}

- (void)setUseMonospacedDigitalNumbers:(BOOL)a3
{
  if (self->_useMonospacedDigitalNumbers != a3)
  {
    self->_useMonospacedDigitalNumbers = a3;
    digitalTimeLabel = self->_digitalTimeLabel;
    id v4 = [(NTKDualTimeView *)self _digitalStyle];
    [(NTKDigitalTimeLabel *)digitalTimeLabel setStyle:v4];
  }
}

- (id)_digitalLabelFont
{
  id v3 = (void *)MEMORY[0x1E4F19A50];
  [(NTKDualTimeView *)self _digitalTimeLabelFontSize];
  id v4 = objc_msgSend(v3, "systemFontOfSize:weight:design:", *MEMORY[0x1E4F19680]);
  uint64_t v5 = [v4 CLKFontWithAlternativePunctuation];

  if (self->_useMonospacedDigitalNumbers)
  {
    id v6 = [v5 CLKFontWithMonospacedNumbers];
  }
  else
  {
    id v6 = v5;
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)_digitalStyle
{
  id v3 = [(NTKDualTimeView *)self _digitalLabelFont];
  id v4 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 0, v3, self->_device, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), 0.0, 0.0);

  return v4;
}

- (id)_activeTimeView
{
  if (self->_style) {
    v2 = &OBJC_IVAR___NTKDualTimeView__digitalTimeLabel;
  }
  else {
    v2 = &OBJC_IVAR___NTKDualTimeView__analogHandsView;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v2);
}

- (void)setColorPalette:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_colorPalette, a3);
  if (![(NTKDualTimeView *)self shouldUseCustomDialBackground])
  {
    uint64_t v5 = [(NTKDualTimeView *)self _dialColorForColorPalette:v7];
    [(UIView *)self->_dialBackgroundView setBackgroundColor:v5];
    id v6 = [(CLKUIAnalogHandsView *)self->_analogHandsView secondHandView];
    [v6 setHandDotColor:v5];
  }
  [(NTKDualTimeView *)self _applyColorToAnalogHands];
  [(NTKDualTimeView *)self _applyColorToDigitalLabelAndTicks];
}

- (void)_applyColorToAnalogHands
{
  analogHandsView = self->_analogHandsView;
  id v4 = [(NTKDualTimeView *)self _hourMinuteHandStrokeColorForColorPalette:self->_colorPalette];
  uint64_t v5 = [(NTKDualTimeView *)self _hourMinuteHandFillColorForColorPalette:self->_colorPalette];
  [(CLKUIAnalogHandsView *)analogHandsView applyHourMinuteHandsStrokeColor:v4 fillColor:v5];

  id v6 = self->_analogHandsView;
  id v7 = [(NTKDualTimeView *)self _secondHandColorForColorPalette:self->_colorPalette];
  [(NTKAnalogHandsView *)v6 applySecondHandColor:v7];

  id v9 = [(NTKDualTimeView *)self _hourTickColorForColorPalette:self->_colorPalette];
  uint64_t v8 = [(NTKDualTimeView *)self _minuteTickColorForColorPalette:self->_colorPalette];
  [(NTKDualTimeView *)self _colorizeAnalogTicksWithHourColor:v9 minuteColor:v8];
}

- (void)_applyColorToDigitalLabelAndTicks
{
  digitalTimeLabel = self->_digitalTimeLabel;
  id v4 = [(NTKDualTimeView *)self _digitalTimeLabelColorForColorPalette:self->_colorPalette];
  [(NTKDigitalTimeLabel *)digitalTimeLabel setColor:v4];

  [(NTKDualTimeView *)self _refreshDigitalTicks];
}

- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5
{
}

- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 ignoreTimeView:(BOOL)a6
{
  id v46 = a4;
  id v10 = a5;
  uint64_t v11 = [v46 configuration];
  uint64_t v12 = [v10 configuration];
  int v13 = [v11 isEqual:v12];

  if (v13)
  {
    [(NTKDualTimeView *)self setColorPalette:v46];
  }
  else
  {
    if (![(NTKDualTimeView *)self shouldUseCustomDialBackground])
    {
      double v14 = [(NTKDualTimeView *)self _dialColorForColorPalette:v46];
      double v15 = [(NTKDualTimeView *)self _dialColorForColorPalette:v10];
      double v16 = NTKInterpolateBetweenColors();
      [(UIView *)self->_dialBackgroundView setBackgroundColor:v16];
      double v17 = [(CLKUIAnalogHandsView *)self->_analogHandsView secondHandView];
      [v17 setHandDotColor:v16];
    }
    id v18 = v46;
    if (!a6)
    {
      analogHandsView = self->_analogHandsView;
      double v20 = [(NTKDualTimeView *)self _hourMinuteHandStrokeColorForColorPalette:v46];
      double v21 = [(NTKDualTimeView *)self _hourMinuteHandFillColorForColorPalette:v46];
      objc_super v22 = [(NTKDualTimeView *)self _hourMinuteHandStrokeColorForColorPalette:v10];
      v23 = [(NTKDualTimeView *)self _hourMinuteHandFillColorForColorPalette:v10];
      [(NTKAnalogHandsView *)analogHandsView applyHourMinuteHandsTransitionFraction:v20 fromStrokeColor:v21 fromFillColor:v22 toStrokeColor:v23 toFillColor:a3];

      v24 = [(NTKDualTimeView *)self _secondHandColorForColorPalette:v46];
      uint64_t v25 = [(NTKDualTimeView *)self _secondHandColorForColorPalette:v10];
      uint64_t v26 = NTKInterpolateBetweenColors();
      [(NTKAnalogHandsView *)self->_analogHandsView applySecondHandColor:v26];

      id v18 = v46;
    }
    uint64_t v27 = [(NTKDualTimeView *)self _hourTickColorForColorPalette:v18];
    v44 = [(NTKDualTimeView *)self _hourTickColorForColorPalette:v10];
    v45 = (void *)v27;
    uint64_t v28 = NTKInterpolateBetweenColors();
    uint64_t v29 = [(NTKDualTimeView *)self _minuteTickColorForColorPalette:v46];
    uint64_t v40 = [(NTKDualTimeView *)self _minuteTickColorForColorPalette:v10];
    v42 = (void *)v29;
    v30 = NTKInterpolateBetweenColors();
    v43 = (void *)v28;
    [(NTKDualTimeView *)self _colorizeAnalogTicksWithHourColor:v28 minuteColor:v30];
    if (!a6)
    {
      v31 = -[NTKDualTimeView _digitalTimeLabelColorForColorPalette:](self, "_digitalTimeLabelColorForColorPalette:", v46, v40, v29);
      v32 = [(NTKDualTimeView *)self _digitalTimeLabelColorForColorPalette:v10];
      v33 = NTKInterpolateBetweenColors();
      [(NTKDigitalTimeLabel *)self->_digitalTimeLabel setColor:v33];
    }
    v34 = -[NTKDualTimeView _secondTickActiveColorForColorPalette:](self, "_secondTickActiveColorForColorPalette:", v46, v40);
    v35 = [(NTKDualTimeView *)self _secondTickActiveColorForColorPalette:v10];
    v36 = NTKInterpolateBetweenColors();
    v37 = [(NTKDualTimeView *)self _secondTickInactiveColorForColorPalette:v46];
    v38 = [(NTKDualTimeView *)self _secondTickInactiveColorForColorPalette:v10];
    v39 = NTKInterpolateBetweenColors();
    [(NTKDualTimeDigitalTicksView *)self->_digitalTicksContainerView setActiveTickColor:v36];
    [(NTKDualTimeDigitalTicksView *)self->_digitalTicksContainerView setInactiveTickColor:v39];
    [(NTKDualTimeView *)self _refreshDigitalTicks];
  }
}

- (void)applyGossamerColorPalette:(id)a3
{
  dialBackgroundView = self->_dialBackgroundView;
  id v5 = a3;
  id v6 = [v5 dialColor];
  [(UIView *)dialBackgroundView setBackgroundColor:v6];

  id v7 = [(CLKUIAnalogHandsView *)self->_analogHandsView secondHandView];
  uint64_t v8 = [v5 dialColor];
  [v7 setHandDotColor:v8];

  analogHandsView = self->_analogHandsView;
  id v10 = [v5 hourMinuteHandStrokeColor];
  uint64_t v11 = [v5 hourMinuteHandFillColor];
  [(CLKUIAnalogHandsView *)analogHandsView applyHourMinuteHandsStrokeColor:v10 fillColor:v11];

  uint64_t v12 = self->_analogHandsView;
  int v13 = [v5 secondHandColor];
  [(NTKAnalogHandsView *)v12 applySecondHandColor:v13];

  double v14 = [v5 hourTickColor];
  double v15 = [v5 minuteTickColor];
  [(NTKDualTimeView *)self _colorizeAnalogTicksWithHourColor:v14 minuteColor:v15];

  digitalTimeLabel = self->_digitalTimeLabel;
  double v17 = [v5 digitalTimeLabelColor];
  [(NTKDigitalTimeLabel *)digitalTimeLabel setColor:v17];

  id v18 = [v5 secondTickActiveColor];
  [(NTKDualTimeDigitalTicksView *)self->_digitalTicksContainerView setActiveTickColor:v18];

  double v19 = [v5 secondTickInactiveColor];

  [(NTKDualTimeDigitalTicksView *)self->_digitalTicksContainerView setInactiveTickColor:v19];

  [(NTKDualTimeView *)self _refreshDigitalTicks];
}

- (void)setSecondsHidden:(BOOL)a3 animated:(BOOL)a4
{
  double v4 = 1.0;
  if (a3) {
    double v4 = 0.0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__NTKDualTimeView_setSecondsHidden_animated___block_invoke;
  v5[3] = &unk_1E62C91D0;
  v5[4] = self;
  BOOL v6 = v4 != 0.0;
  BOOL v7 = a3;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:animations:", v5, a4, 0.1);
}

void __45__NTKDualTimeView_setSecondsHidden_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) style];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    double v4 = *(void **)(v3 + 488);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 41);
    [v4 setHideActiveTicks:v5];
  }
  else
  {
    BOOL v6 = [*(id *)(v3 + 464) secondHandView];
    id v8 = v6;
    double v7 = 0.0;
    if (*(unsigned char *)(a1 + 40)) {
      double v7 = 1.0;
    }
    [v6 setAlpha:v7];
  }
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  if (a3 == 1)
  {
    [(UIView *)self->_analogContainerView setAlpha:0.0];
    [(NTKAnalogHandsView *)self->_analogHandsView setAlpha:0.0];
    [(UIView *)self->_digitalContainerView setAlpha:1.0];
    digitalContainerView = self->_digitalContainerView;
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v8 = *MEMORY[0x1E4F1DAB8];
    long long v9 = v7;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(UIView *)digitalContainerView setTransform:&v8];
    [(NTKDualTimeView *)self _startDigitalTicksAnimation];
  }
  else if (!a3)
  {
    [(UIView *)self->_analogContainerView setAlpha:1.0];
    [(NTKAnalogHandsView *)self->_analogHandsView setAlpha:1.0];
    analogHandsView = self->_analogHandsView;
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v8 = *MEMORY[0x1E4F1DAB8];
    long long v9 = v5;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(NTKAnalogHandsView *)analogHandsView setTransform:&v8];
    [(UIView *)self->_digitalContainerView setAlpha:0.0];
    [(NTKDualTimeView *)self _stopDigitalTicksAnimation];
  }
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  if (a4 == a5)
  {
    [(NTKDualTimeView *)self setStyle:a3];
  }
  else
  {
    CLKInterpolateBetweenFloatsClipped();
    double v9 = v8;
    long long v10 = &OBJC_IVAR___NTKDualTimeView__digitalContainerView;
    if (a4) {
      uint64_t v11 = &OBJC_IVAR___NTKDualTimeView__digitalContainerView;
    }
    else {
      uint64_t v11 = &OBJC_IVAR___NTKDualTimeView__analogContainerView;
    }
    uint64_t v12 = *(Class *)((char *)&self->super.super.super.isa + *v11);
    double v13 = 1.0 - v8;
    if (!a5) {
      long long v10 = &OBJC_IVAR___NTKDualTimeView__analogContainerView;
    }
    id v14 = *(id *)((char *)&self->super.super.super.isa + *v10);
    double v16 = v12;
    [(UIView *)v16 setAlpha:v13];
    [v14 setAlpha:v9];
    if (v16 == self->_analogContainerView) {
      double v15 = v13;
    }
    else {
      double v15 = v9;
    }
    [(NTKAnalogHandsView *)self->_analogHandsView setAlpha:v15];
  }
}

- (id)_dialColorForColorPalette:(id)a3
{
  if ([a3 isWhiteColor]) {
    double v3 = 0.898039216;
  }
  else {
    double v3 = 0.129411765;
  }
  double v4 = [MEMORY[0x1E4FB1618] colorWithRed:v3 green:v3 blue:v3 alpha:1.0];

  return v4;
}

- (double)_minuteTickInset
{
  return 4.0;
}

- (CGSize)_hourTickSize
{
  uint64_t v2 = [(NTKDualTimeView *)self device];
  CLKSizeForDeviceMetrics();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)_minuteTickSize
{
  uint64_t v2 = [(NTKDualTimeView *)self device];
  CLKSizeForDeviceMetrics();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (unint64_t)_hourTickCount
{
  return 12;
}

- (unint64_t)_minuteTickCount
{
  return 60;
}

- (id)_hourTickColorForColorPalette:(id)a3
{
  int v3 = [a3 isWhiteColor];
  double v4 = 1.0;
  if (v3) {
    double v4 = 0.0;
  }
  double v5 = [MEMORY[0x1E4FB1618] colorWithWhite:v4 alpha:1.0];

  return v5;
}

- (id)_minuteTickColorForColorPalette:(id)a3
{
  int v3 = [a3 isWhiteColor];
  double v4 = 0.4;
  if (v3) {
    double v4 = 0.6;
  }
  double v5 = [MEMORY[0x1E4FB1618] colorWithWhite:v4 alpha:1.0];

  return v5;
}

- (id)_hourMinuteHandFillColorForColorPalette:(id)a3
{
  if ([a3 isWhiteColor]) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  int v3 = [MEMORY[0x1E4FB1618] whiteColor];
  }

  return v3;
}

- (id)_hourMinuteHandStrokeColorForColorPalette:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "whiteColor", a3);
}

- (id)_secondHandColorForColorPalette:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "systemOrangeColor", a3);
}

- (double)_secondTickInset
{
  return 4.0;
}

- (CGSize)_secondTickSize
{
  CLKSizeForDeviceMetrics();
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (double)_digitalTimeLabelFontSize
{
  CLKValueForDeviceMetrics();
  return result;
}

- (id)_digitalTimeLabelColorForColorPalette:(id)a3
{
  if ([a3 isWhiteColor]) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  double v3 = [MEMORY[0x1E4FB1618] whiteColor];
  }

  return v3;
}

- (id)_secondTickActiveColorForColorPalette:(id)a3
{
  int v3 = [a3 isWhiteColor];
  double v4 = 1.0;
  if (v3) {
    double v4 = 0.0;
  }
  double v5 = [MEMORY[0x1E4FB1618] colorWithWhite:v4 alpha:1.0];

  return v5;
}

- (id)_secondTickInactiveColorForColorPalette:(id)a3
{
  int v3 = [a3 isWhiteColor];
  double v4 = 0.4;
  if (v3) {
    double v4 = 0.7;
  }
  double v5 = [MEMORY[0x1E4FB1618] colorWithWhite:v4 alpha:1.0];

  return v5;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  double v7 = (NSDate *)a3;
  if (self->_overrideDate != v7)
  {
    double v8 = v7;
    [(NTKAnalogHandsView *)self->_analogHandsView setOverrideDate:v7 duration:a4];
    [(NTKDigitalTimeLabel *)self->_digitalTimeLabel setOverrideDate:v8 duration:a4];
    objc_storeStrong((id *)&self->_overrideDate, a3);
    [(NTKDualTimeDigitalTicksView *)self->_digitalTicksContainerView setOverrideDate:v8];
    [(NTKDualTimeView *)self _refreshDigitalTicks];
    double v7 = v8;
  }
}

- (void)setTimeOffset:(double)a3
{
  -[NTKAnalogHandsView setTimeOffset:](self->_analogHandsView, "setTimeOffset:");
  digitalTimeLabel = self->_digitalTimeLabel;

  [(NTKDigitalTimeLabel *)digitalTimeLabel setTimeOffset:a3];
}

- (void)setFrozen:(BOOL)a3
{
  BOOL v3 = a3;
  self->_frozen = a3;
  -[CLKUIAnalogHandsView setFrozen:](self->_analogHandsView, "setFrozen:");
  [(NTKDigitalTimeLabel *)self->_digitalTimeLabel setFrozen:v3];
  [(NTKDualTimeDigitalTicksView *)self->_digitalTicksContainerView setFrozen:v3];

  [(NTKDualTimeView *)self _refreshDigitalTicks];
}

- (void)setForcedNumberSystemForDigitalTimeLabel:(unint64_t)a3
{
  id v4 = [(NTKDualTimeView *)self digitalTimeLabel];
  [v4 setForcedNumberSystem:a3];
}

- (id)activeColorForDualTimeDigitalTicksView:(id)a3
{
  return [(NTKDualTimeView *)self _secondTickActiveColorForColorPalette:self->_colorPalette];
}

- (id)inactiveColorForDualTimeDigitalTicksView:(id)a3
{
  return [(NTKDualTimeView *)self _secondTickInactiveColorForColorPalette:self->_colorPalette];
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)useMonospacedDigitalNumbers
{
  return self->_useMonospacedDigitalNumbers;
}

- (unint64_t)style
{
  return self->_style;
}

- (NTKFaceColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (UIView)dialBackgroundView
{
  return self->_dialBackgroundView;
}

- (void)setDialBackgroundView:(id)a3
{
}

- (NTKAnalogHandsView)analogHandsView
{
  return self->_analogHandsView;
}

- (void)setAnalogHandsView:(id)a3
{
}

- (NTKDigitalTimeLabel)digitalTimeLabel
{
  return self->_digitalTimeLabel;
}

- (UIView)digitalContainerView
{
  return self->_digitalContainerView;
}

- (NTKDualTimeDigitalTicksView)digitalTicksContainerView
{
  return self->_digitalTicksContainerView;
}

- (UIView)dialContainerView
{
  return self->_dialContainerView;
}

- (void)setDialContainerView:(id)a3
{
}

- (UIView)analogContainerView
{
  return self->_analogContainerView;
}

- (void)setAnalogContainerView:(id)a3
{
}

- (CLKUIDualTimeAnalogTicksView)analogTickContainerView
{
  return self->_analogTickContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analogTickContainerView, 0);
  objc_storeStrong((id *)&self->_analogContainerView, 0);
  objc_storeStrong((id *)&self->_dialContainerView, 0);
  objc_storeStrong((id *)&self->_digitalTicksContainerView, 0);
  objc_storeStrong((id *)&self->_digitalContainerView, 0);
  objc_storeStrong((id *)&self->_digitalTimeLabel, 0);
  objc_storeStrong((id *)&self->_analogHandsView, 0);
  objc_storeStrong((id *)&self->_dialBackgroundView, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_blackPalette, 0);

  objc_storeStrong((id *)&self->_overrideDate, 0);
}

@end