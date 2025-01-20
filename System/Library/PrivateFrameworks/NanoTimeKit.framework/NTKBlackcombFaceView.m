@interface NTKBlackcombFaceView
- (BOOL)_backgroundViewShouldUseLongSideTicks;
- (BOOL)_isBlackColor;
- (BOOL)_isComplicationSlotInsideDial:(id)a3;
- (BOOL)_timeViewBehindContentForEditMode:(int64_t)a3;
- (BOOL)_wantsStatusBarIconShadow;
- (NTKBlackcombFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_verticalPaddingForStatusBar;
- (id)_keylineViewForComplicationSlot:(id)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_platterTextColorForEditMode:(int64_t)a3 color:(id)a4;
- (id)_renderBackgroundViewSwatchImageForBlackcombDialColor:(unint64_t)a3;
- (id)_secondHandColor;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_editMode;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyComplicationTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 force:(BOOL)a6;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureTimeView:(id)a3;
- (void)_forceUpdateColors;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_prepareForStatusChange:(BOOL)a3;
- (void)_removeBackgroundView;
- (void)_reorderSwitcherSnapshotView;
- (void)_setupBackgroundView;
- (void)_unloadSnapshotContentViews;
- (void)_updateHandsColors;
- (void)_updateTickLengths;
- (void)layoutSubviews;
- (void)updateBlackcombDialColorStyle:(unint64_t)a3;
- (void)updateWithColorPalette:(id)a3;
@end

@implementation NTKBlackcombFaceView

- (NTKBlackcombFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKBlackcombFaceView;
  v9 = [(NTKAnalogFaceView *)&v13 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    v10 = [[NTKFullscreenSubdialComplicationFactory alloc] initForDevice:v8];
    complicationFactory = v9->_complicationFactory;
    v9->_complicationFactory = v10;
  }
  return v9;
}

- (id)createFaceColorPalette
{
  v3 = objc_alloc_init(NTKBlackcombColorPalette);
  blackcombPalette = self->_blackcombPalette;
  self->_blackcombPalette = v3;

  v5 = self->_blackcombPalette;

  return v5;
}

- (void)_configureTimeView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKBlackcombFaceView;
  id v4 = a3;
  [(NTKAnalogFaceView *)&v7 _configureTimeView:v4];
  [(NTKBlackcombFaceView *)self _updateHandsColors];
  v5 = [v4 secondHandView];

  v6 = [MEMORY[0x1E4FB1618] blackColor];
  [v5 setHandDotColor:v6];
}

- (void)_setupBackgroundView
{
  if (!self->_backgroundContainerView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundContainerView = self->_backgroundContainerView;
    self->_backgroundContainerView = v3;

    v5 = [(NTKFaceView *)self contentView];
    v6 = self->_backgroundContainerView;
    objc_super v7 = [(NTKFaceView *)self complicationContainerView];
    [v5 insertSubview:v6 belowSubview:v7];

    id v8 = [NTKBlackcombBackgroundView alloc];
    v9 = [(NTKFaceView *)self device];
    v10 = [(NTKBlackcombBackgroundView *)v8 initForDevice:v9];
    backgroundView = self->_backgroundView;
    self->_backgroundView = v10;

    [(UIView *)self->_backgroundContainerView addSubview:self->_backgroundView];
    v12 = [(UIView *)self->_backgroundContainerView layer];
    objc_super v13 = [(NTKFaceView *)self device];
    [v13 screenCornerRadius];
    objc_msgSend(v12, "setCornerRadius:");

    id v14 = [(UIView *)self->_backgroundContainerView layer];
    [v14 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  }
}

- (void)_removeBackgroundView
{
  [(NTKBlackcombBackgroundView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  [(UIView *)self->_backgroundContainerView removeFromSuperview];
  backgroundContainerView = self->_backgroundContainerView;
  self->_backgroundContainerView = 0;
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKBlackcombFaceView;
  [(NTKAnalogFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKBlackcombFaceView *)self _setupBackgroundView];
  [(NTKBlackcombFaceView *)self _forceUpdateColors];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKBlackcombFaceView;
  [(NTKAnalogFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKBlackcombFaceView *)self _removeBackgroundView];
}

- (void)_reorderSwitcherSnapshotView
{
  objc_super v3 = [(NTKFaceView *)self switcherSnapshotView];

  if (v3)
  {
    id v4 = [(NTKFaceView *)self switcherSnapshotView];
    [(NTKBlackcombFaceView *)self bringSubviewToFront:v4];
  }
}

- (int64_t)_editMode
{
  [(NTKFaceView *)self editModeTransitionFraction];
  if (v3 <= 0.5)
  {
    return [(NTKFaceView *)self fromEditMode];
  }
  else
  {
    return [(NTKFaceView *)self toEditMode];
  }
}

- (void)_prepareForEditing
{
  v8.receiver = self;
  v8.super_class = (Class)NTKBlackcombFaceView;
  [(NTKAnalogFaceView *)&v8 _prepareForEditing];
  [(NTKBlackcombBackgroundView *)self->_backgroundView setUsesLongSideTicks:0];
  double v3 = [(UIView *)self->_backgroundContainerView layer];
  [v3 setAllowsGroupOpacity:1];

  id v4 = [(NTKFaceView *)self complicationContainerView];
  v5 = [v4 layer];
  [v5 setAllowsGroupOpacity:1];

  v6 = [(NTKFaceView *)self timeView];
  objc_super v7 = [v6 layer];
  [v7 setAllowsGroupOpacity:1];
}

- (void)_cleanupAfterEditing
{
  v9.receiver = self;
  v9.super_class = (Class)NTKBlackcombFaceView;
  [(NTKAnalogFaceView *)&v9 _cleanupAfterEditing];
  [(NTKBlackcombFaceView *)self _updateTickLengths];
  double v3 = [(UIView *)self->_backgroundContainerView layer];
  [v3 setAllowsGroupOpacity:0];

  id v4 = [(NTKFaceView *)self complicationContainerView];
  v5 = [v4 layer];
  [v5 setAllowsGroupOpacity:0];

  v6 = [(NTKFaceView *)self timeView];
  objc_super v7 = [v6 layer];
  [v7 setAllowsGroupOpacity:0];

  objc_super v8 = [(NTKFaceView *)self delegate];
  [v8 faceViewDidChangeWantsStatusBarIconShadow];
}

- (void)_updateTickLengths
{
  BOOL v3 = [(NTKBlackcombFaceView *)self _backgroundViewShouldUseLongSideTicks];
  backgroundView = self->_backgroundView;

  [(NTKBlackcombBackgroundView *)backgroundView setUsesLongSideTicks:v3];
}

- (BOOL)_backgroundViewShouldUseLongSideTicks
{
  BOOL v3 = [(NTKFaceView *)self delegate];
  id v4 = [v3 faceViewComplicationForSlot:@"subdial-left"];
  uint64_t v5 = [v4 complicationType];

  v6 = [(NTKFaceView *)self delegate];
  objc_super v7 = [v6 faceViewComplicationForSlot:@"subdial-right"];
  uint64_t v8 = v5 | [v7 complicationType];

  return v8 == 0;
}

- (BOOL)_timeViewBehindContentForEditMode:(int64_t)a3
{
  return a3 == 1 || a3 == 10;
}

- (void)_configureForEditMode:(int64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)NTKBlackcombFaceView;
  -[NTKAnalogFaceView _configureForEditMode:](&v19, sel__configureForEditMode_);
  if ((unint64_t)a3 > 0xF || (double v5 = 1.0, ((1 << a3) & 0x8401) == 0)) {
    double v5 = 0.2;
  }
  if (a3 == 15) {
    double v6 = 0.2;
  }
  else {
    double v6 = 1.0;
  }
  if (a3 == 15 || a3 == 0) {
    double v8 = 1.0;
  }
  else {
    double v8 = 0.2;
  }
  [(UIView *)self->_backgroundContainerView setAlpha:v5];
  objc_super v9 = [(NTKFaceView *)self complicationContainerView];
  v10 = v9;
  if (a3) {
    double v11 = v6;
  }
  else {
    double v11 = 1.0;
  }
  [v9 setAlpha:v11];

  v12 = [(NTKFaceView *)self timeView];
  [v12 setAlpha:v8];

  objc_super v13 = [(NTKFaceView *)self normalComplicationDisplayWrapperForSlot:@"subdial-top"];
  id v14 = [v13 display];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    blackcombPalette = self->_blackcombPalette;
    id v16 = v14;
    v17 = [(NTKBlackcombColorPalette *)blackcombPalette platterText];
    v18 = [(NTKBlackcombFaceView *)self _platterTextColorForEditMode:a3 color:v17];
    [v16 setForegroundColor:v18];
  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v20.receiver = self;
  v20.super_class = (Class)NTKBlackcombFaceView;
  -[NTKAnalogFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v20, sel__configureForTransitionFraction_fromEditMode_toEditMode_);
  backgroundContainerView = self->_backgroundContainerView;
  CLKInterpolateBetweenFloatsClipped();
  -[UIView setAlpha:](backgroundContainerView, "setAlpha:");
  objc_super v9 = [(NTKFaceView *)self complicationContainerView];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v9, "setAlpha:");

  v10 = [(NTKFaceView *)self timeView];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v10, "setAlpha:");

  double v11 = [(NTKFaceView *)self normalComplicationDisplayWrapperForSlot:@"subdial-top"];
  v12 = [v11 display];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    blackcombPalette = self->_blackcombPalette;
    id v14 = v12;
    v15 = [(NTKBlackcombColorPalette *)blackcombPalette platterText];
    id v16 = [(NTKBlackcombFaceView *)self _platterTextColorForEditMode:a4 color:v15];
    v17 = [(NTKBlackcombColorPalette *)self->_blackcombPalette platterText];
    v18 = [(NTKBlackcombFaceView *)self _platterTextColorForEditMode:a5 color:v17];
    objc_super v19 = NTKInterpolateBetweenColors();

    [v14 setForegroundColor:v19];
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  if (a4 == 10)
  {
    [(NTKBlackcombFaceView *)self updateWithColorPalette:self->_blackcombPalette];
  }
  else if (a4 == 15)
  {
    -[NTKBlackcombFaceView updateBlackcombDialColorStyle:](self, "updateBlackcombDialColorStyle:", [v10 blackcombDialColor]);
    objc_super v9 = [(NTKFaceView *)self delegate];
    [v9 faceViewDidChangeWantsStatusBarIconShadow];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v18 = a4;
  id v12 = a5;
  id v13 = a7;
  if (a6 == 10)
  {
    id v14 = [(NTKFaceView *)self interpolatedColorPalette];
    v15 = [v14 fromPalette];
    id v16 = [(NTKFaceView *)self interpolatedColorPalette];
    v17 = [v16 toPalette];
    [(NTKBlackcombFaceView *)self _applyTransitionFraction:v15 fromColorPalette:v17 toColorPalette:a3];
  }
  else
  {
    if (a6 != 15) {
      goto LABEL_6;
    }
    id v14 = -[NTKBlackcombColorPalette transitionalPaletteFromDialColor:toDialColor:](self->_blackcombPalette, "transitionalPaletteFromDialColor:toDialColor:", [v18 blackcombDialColor], objc_msgSend(v12, "blackcombDialColor"));
    v15 = [v14 fromPalette];
    id v16 = [v14 toPalette];
    [(NTKBlackcombFaceView *)self _applyTransitionFraction:v15 fromColorPalette:v16 toColorPalette:a3];
  }

LABEL_6:
}

- (void)updateWithColorPalette:(id)a3
{
  id v6 = a3;
  if (self->_dialColorStyleTransitionPalette)
  {
    id v4 = [[NTKInterpolatedColorPalette alloc] initWithColorPalette:self->_blackcombPalette];
    dialColorStyleTransitionPalette = self->_dialColorStyleTransitionPalette;
    self->_dialColorStyleTransitionPalette = v4;
  }
  [(NTKBlackcombFaceView *)self _applyTransitionFraction:v6 fromColorPalette:v6 toColorPalette:1 force:0.0];
  [(NTKBlackcombFaceView *)self _updateHandsColors];
}

- (void)updateBlackcombDialColorStyle:(unint64_t)a3
{
  if ([(NTKBlackcombColorPalette *)self->_blackcombPalette dialColorStyle] != a3)
  {
    [(NTKBlackcombColorPalette *)self->_blackcombPalette setDialColorStyle:a3];
    blackcombPalette = self->_blackcombPalette;
    [(NTKBlackcombFaceView *)self updateWithColorPalette:blackcombPalette];
  }
}

- (void)_forceUpdateColors
{
  [(NTKBlackcombFaceView *)self _applyTransitionFraction:self->_blackcombPalette fromColorPalette:self->_blackcombPalette toColorPalette:1 force:0.0];
  [(NTKBlackcombBackgroundView *)self->_backgroundView applyPalette:self->_blackcombPalette];

  [(NTKBlackcombFaceView *)self _updateHandsColors];
}

- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5
{
}

- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 force:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = [v10 complication];
  id v13 = [v11 complication];
  id v14 = NTKInterpolateBetweenColors();
  [(NTKFaceView *)self setInterpolatedComplicationColor:v14];
  if (a6)
  {
    int v15 = 1;
  }
  else
  {
    id v16 = [v10 configuration];
    v17 = [v11 configuration];
    int v15 = [v16 isEqual:v17] ^ 1;
  }
  if (([v10 isMulticolor] & 1) != 0 || objc_msgSend(v11, "isMulticolor"))
  {
    if ([v11 isMulticolor] && !objc_msgSend(v10, "isMulticolor")) {
      a3 = 1.0 - a3;
    }
    char v18 = 1;
  }
  else
  {
    char v18 = 0;
  }
  if ([v11 isMulticolor]) {
    objc_super v19 = v12;
  }
  else {
    objc_super v19 = v13;
  }
  [(NTKFaceView *)self setComplicationColor:v19];
  if (v15)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __87__NTKBlackcombFaceView__applyTransitionFraction_fromColorPalette_toColorPalette_force___block_invoke;
    v24[3] = &unk_1E62C9608;
    v24[4] = self;
    char v25 = v18;
    *(double *)&v24[5] = a3;
    [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v24];
  }
  objc_super v20 = [(NTKBlackcombFaceView *)self _secondHandColor];
  v21 = [(NTKBlackcombFaceView *)self _secondHandColor];
  v22 = NTKInterpolateBetweenColors();
  v23 = [(NTKFaceView *)self timeView];
  [v23 applySecondHandColor:v22];

  [(NTKBlackcombBackgroundView *)self->_backgroundView applyTransitionFraction:v10 fromPalette:v11 toPalette:a3];
  [(NTKBlackcombFaceView *)self _applyComplicationTransitionFraction:v10 fromColorPalette:v11 toColorPalette:a3];
}

void __87__NTKBlackcombFaceView__applyTransitionFraction_fromColorPalette_toColorPalette_force___block_invoke(uint64_t a1, uint64_t a2)
{
  id v8 = [*(id *)(a1 + 32) normalComplicationDisplayWrapperForSlot:a2];
  BOOL v3 = [v8 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v5 = v8;
  if (isKindOfClass)
  {
    id v6 = [v8 display];
    objc_super v7 = v6;
    if (*(unsigned char *)(a1 + 48)) {
      [v6 transitionToMonochromeWithFraction:*(double *)(a1 + 40)];
    }
    else {
      [v6 updateMonochromeColor];
    }

    double v5 = v8;
  }
}

- (void)_applyComplicationTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __93__NTKBlackcombFaceView__applyComplicationTransitionFraction_fromColorPalette_toColorPalette___block_invoke;
  v23[3] = &unk_1E62C9630;
  id v10 = v8;
  id v24 = v10;
  id v11 = v9;
  id v25 = v11;
  double v26 = a3;
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v23];
  id v12 = [(NTKFaceView *)self normalComplicationDisplayWrapperForSlot:@"subdial-top"];
  id v13 = [v12 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int64_t v15 = [(NTKBlackcombFaceView *)self _editMode];
    id v16 = [v10 platterText];
    v17 = [(NTKBlackcombFaceView *)self _platterTextColorForEditMode:v15 color:v16];

    int64_t v18 = [(NTKBlackcombFaceView *)self _editMode];
    objc_super v19 = [v11 platterText];
    objc_super v20 = [(NTKBlackcombFaceView *)self _platterTextColorForEditMode:v18 color:v19];

    v21 = NTKInterpolateBetweenColors();
    v22 = [v12 display];
    [v22 setForegroundColor:v21];
  }
}

void __93__NTKBlackcombFaceView__applyComplicationTransitionFraction_fromColorPalette_toColorPalette___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = [v7 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v7 display];
    objc_msgSend(v6, "transitThemeFromTheme:toTheme:fraction:", objc_msgSend(*(id *)(a1 + 32), "richComplicationViewTheme"), objc_msgSend(*(id *)(a1 + 40), "richComplicationViewTheme"), *(double *)(a1 + 48));
  }
}

- (id)_secondHandColor
{
  return (id)[(NTKBlackcombColorPalette *)self->_blackcombPalette secondHand];
}

- (void)_updateHandsColors
{
  id v7 = [(NTKBlackcombFaceView *)self _secondHandColor];
  BOOL v3 = [(NTKFaceView *)self timeView];
  [v3 applySecondHandColor:v7];

  id v4 = [(NTKFaceView *)self timeView];
  double v5 = [MEMORY[0x1E4FB1618] whiteColor];
  id v6 = [MEMORY[0x1E4FB1618] blackColor];
  [v4 applyHourMinuteHandsStrokeColor:v5 fillColor:v6];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v18.receiver = self;
  v18.super_class = (Class)NTKBlackcombFaceView;
  -[NTKFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v18, sel__applyBreathingFraction_forCustomEditMode_slot_, a4, a5);
  double v8 = NTKScaleForRubberBandingFraction(a3);
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, v8, v8);
  double v9 = NTKAlphaForRubberBandingFraction(a3);
  if (a4 == 10)
  {
    id v14 = [(NTKFaceView *)self complicationContainerView];
    CGAffineTransform v16 = v17;
    [v14 setTransform:&v16];

    id v13 = [(NTKFaceView *)self complicationContainerView];
  }
  else
  {
    if (a4 != 15) {
      return;
    }
    id v10 = [(NTKFaceView *)self contentView];
    CGAffineTransform v16 = v17;
    [v10 setTransform:&v16];

    id v11 = [(NTKFaceView *)self contentView];
    [v11 setAlpha:v9];

    id v12 = [(NTKFaceView *)self timeView];
    CGAffineTransform v16 = v17;
    [v12 setTransform:&v16];

    id v13 = [(NTKFaceView *)self timeView];
  }
  int64_t v15 = v13;
  [v13 setAlpha:v9];
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)NTKBlackcombFaceView;
  -[NTKFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v14, sel__applyBreathingFraction_forCustomEditMode_slot_, a4, a5);
  double v8 = NTKLargeElementScaleForBreathingFraction(a3);
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeScale(&v13, v8, v8);
  if (a4 == 10)
  {
    id v10 = [(NTKFaceView *)self complicationContainerView];
  }
  else
  {
    if (a4 != 15) {
      return;
    }
    double v9 = [(NTKFaceView *)self contentView];
    CGAffineTransform v12 = v13;
    [v9 setTransform:&v12];

    id v10 = [(NTKFaceView *)self timeView];
  }
  id v11 = v10;
  CGAffineTransform v12 = v13;
  [v10 setTransform:&v12];
}

- (id)_platterTextColorForEditMode:(int64_t)a3 color:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 != 15 && a3)
  {
    id v7 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    id v7 = v5;
  }
  double v8 = v7;

  return v8;
}

- (void)_loadLayoutRules
{
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return [(NTKFullscreenSubdialComplicationFactory *)self->_complicationFactory newLegacyViewForComplication:a3 family:a4 slot:a5 faceView:self];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  [(NTKFullscreenSubdialComplicationFactory *)self->_complicationFactory configureComplicationView:v12 forSlot:v6 faceView:self];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    if ([v6 isEqualToString:@"subdial-top"])
    {
      int64_t v8 = [(NTKBlackcombFaceView *)self _editMode];
      double v9 = [(NTKBlackcombColorPalette *)self->_blackcombPalette platterText];
      id v10 = [(NTKBlackcombFaceView *)self _platterTextColorForEditMode:v8 color:v9];
      [v7 setForegroundColor:v10];
    }
    if ([(NTKFaceColorPalette *)self->_blackcombPalette isMulticolor]) {
      [v7 transitionToMonochromeWithFraction:0.0];
    }
    else {
      [v7 updateMonochromeColor];
    }
    int64_t v11 = [(NTKBlackcombColorPalette *)self->_blackcombPalette richComplicationViewTheme];
    [v7 transitThemeFromTheme:v11 toTheme:v11 fraction:1.0];
  }
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return [(NTKFaceViewComplicationFactory *)self->_complicationFactory legacyLayoutOverrideforComplicationType:a3 slot:a4 faceView:self];
}

- (BOOL)_isComplicationSlotInsideDial:(id)a3
{
  return 1;
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return [(NTKFullscreenSubdialComplicationFactory *)self->_complicationFactory complicationPickerStyleForSlot:a3];
}

- (id)_keylineViewForComplicationSlot:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKFullscreenSubdialComplicationFactory *)self->_complicationFactory keylineViewForComplicationSlot:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKBlackcombFaceView;
    id v7 = [(NTKFaceView *)&v10 _keylineViewForComplicationSlot:v4];
  }
  int64_t v8 = v7;

  return v8;
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  return [(NTKFaceViewComplicationFactory *)self->_complicationFactory keylineStyleForComplicationSlot:a3];
}

- (double)_verticalPaddingForStatusBar
{
  return 1.0;
}

- (void)_prepareForStatusChange:(BOOL)a3
{
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NTKBlackcombFaceView;
  [(NTKAnalogFaceView *)&v12 layoutSubviews];
  BOOL v3 = [(NTKFaceView *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_backgroundContainerView, "ntk_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_backgroundView, "ntk_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
  if (![(NTKFaceView *)self editing]) {
    [(NTKBlackcombFaceView *)self _updateTickLengths];
  }
}

- (BOOL)_wantsStatusBarIconShadow
{
  return ![(NTKBlackcombFaceView *)self _isBlackColor];
}

- (BOOL)_isBlackColor
{
  v2 = [(NTKFaceView *)self optionForCustomEditMode:15 slot:0];
  BOOL v3 = [v2 blackcombDialColor] == 0;

  return v3;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 15)
  {
    if (!_swatchImageForEditOption_mode_withSelectedOptions__cache)
    {
      uint64_t v10 = objc_opt_new();
      double v11 = (void *)_swatchImageForEditOption_mode_withSelectedOptions__cache;
      _swatchImageForEditOption_mode_withSelectedOptions__cache = v10;
    }
    uint64_t v12 = [v8 blackcombDialColor];
    CGAffineTransform v13 = [NSNumber numberWithUnsignedInteger:v12];
    objc_super v14 = [v13 description];

    int64_t v15 = [(id)_swatchImageForEditOption_mode_withSelectedOptions__cache objectForKey:v14];
    if (!v15)
    {
      int64_t v15 = [(NTKBlackcombFaceView *)self _renderBackgroundViewSwatchImageForBlackcombDialColor:v12];
      [(id)_swatchImageForEditOption_mode_withSelectedOptions__cache setObject:v15 forKey:v14];
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)NTKBlackcombFaceView;
    int64_t v15 = [(NTKFaceView *)&v17 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
  }

  return v15;
}

- (id)_renderBackgroundViewSwatchImageForBlackcombDialColor:(unint64_t)a3
{
  double v5 = [(NTKFaceView *)self timeView];

  if (!v5) {
    [(NTKBlackcombFaceView *)self _loadSnapshotContentViews];
  }
  unint64_t v6 = [(NTKBlackcombColorPalette *)self->_blackcombPalette dialColorStyle];
  BOOL v7 = [(NTKBlackcombBackgroundView *)self->_backgroundView usesLongSideTicks];
  [(NTKBlackcombFaceView *)self updateBlackcombDialColorStyle:a3];
  [(NTKBlackcombFaceView *)self layoutIfNeeded];
  [(NTKBlackcombBackgroundView *)self->_backgroundView setUsesLongSideTicks:1];
  [(UIView *)self->_backgroundContainerView bounds];
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithBounds:", v8, v9, v10, v11);
  objc_initWeak(&location, self);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  objc_super v17 = __78__NTKBlackcombFaceView__renderBackgroundViewSwatchImageForBlackcombDialColor___block_invoke;
  objc_super v18 = &unk_1E62C9658;
  objc_copyWeak(&v19, &location);
  CGAffineTransform v13 = [v12 imageWithActions:&v15];
  -[NTKBlackcombFaceView updateBlackcombDialColorStyle:](self, "updateBlackcombDialColorStyle:", v6, v15, v16, v17, v18);
  [(NTKBlackcombBackgroundView *)self->_backgroundView setUsesLongSideTicks:v7];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

void __78__NTKBlackcombFaceView__renderBackgroundViewSwatchImageForBlackcombDialColor___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = WeakRetained;
  if (WeakRetained)
  {
    double v5 = [WeakRetained[111] layer];
    objc_msgSend(v5, "renderInContext:", objc_msgSend(v8, "CGContext"));

    unint64_t v6 = [v4 timeView];
    BOOL v7 = [v6 layer];
    objc_msgSend(v7, "renderInContext:", objc_msgSend(v8, "CGContext"));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialColorStyleTransitionPalette, 0);
  objc_storeStrong((id *)&self->_blackcombPalette, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundContainerView, 0);

  objc_storeStrong((id *)&self->_complicationFactory, 0);
}

@end