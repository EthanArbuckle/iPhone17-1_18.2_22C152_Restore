@interface NTKWhistlerSubdialsFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_isAnalog;
- (BOOL)_wantsStatusBarIconShadow;
- (BOOL)showGossamerUI;
- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (CGRect)_timeViewFrameRelativeToFaceView;
- (NSArray)complicationPlaceholderViews;
- (NSCache)backgroundSwatchesCache;
- (NSCache)styleSwatchesCache;
- (NTKFace)swatchesFace;
- (NTKFaceViewController)swatchesFaceViewController;
- (NTKGradientComposedView)composedView;
- (NTKInterpolatedColorPalette)editingComplicationsPalette;
- (NTKMonochromeModel)bottomFilterProvider;
- (NTKMonochromeModel)centerFilterProvider;
- (NTKMonochromeModel)topFilterProvider;
- (NTKWhistlerSubdialsFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_horizontalPaddingForStatusBar;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_minimumBreathingScaleForComplicationSlot:(id)a3;
- (double)_timeViewAlphaForEditMode:(int64_t)a3;
- (double)_verticalPaddingForStatusBar;
- (double)monochromeFraction;
- (double)scaleFactor;
- (double)tintedFraction;
- (id)_filterProviderForSlot:(id)a3;
- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_renderDialSwatchImageForStyle:(unint64_t)a3 colorOption:(id)a4;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (id)dialView;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (unint64_t)backgroundStyle;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyColorsFromPalette:(id)a3;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromNumeralOption:(unint64_t)a4 toNumeralOption:(unint64_t)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_removeDialView;
- (void)_setNumerals:(unint64_t)a3;
- (void)_setupDialView;
- (void)_unloadSnapshotContentViews;
- (void)dealloc;
- (void)layoutSubviews;
- (void)loadComplicationPlaceholderViews;
- (void)rectangularViewDidBecomeInteractive:(id)a3;
- (void)rectangularViewDidEndInteractive:(id)a3;
- (void)sensitiveUIStateChanged;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setComposedView:(id)a3;
- (void)setEditingComplicationsPalette:(id)a3;
- (void)setMonochromeFraction:(double)a3;
- (void)setScaleFactor:(double)a3;
- (void)setTintedFraction:(double)a3;
- (void)updateMonochromeColorForRichComplicationView:(id)a3;
- (void)updateWithColorPalette:(id)a3;
@end

@implementation NTKWhistlerSubdialsFaceView

- (BOOL)showGossamerUI
{
  int v3 = [(NTKWhistlerSubdialsFaceView *)self isMemberOfClass:objc_opt_class()];
  if (v3)
  {
    v4 = [(NTKFaceView *)self device];
    char v5 = NTKShowGossamerUI(v4);

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (NTKWhistlerSubdialsFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [[NTKMonochromeModel alloc] initWithDevice:v9];
  topFilterProvider = self->_topFilterProvider;
  self->_topFilterProvider = v10;

  v12 = [[NTKMonochromeModel alloc] initWithDevice:v9];
  centerFilterProvider = self->_centerFilterProvider;
  self->_centerFilterProvider = v12;

  v14 = [[NTKMonochromeModel alloc] initWithDevice:v9];
  bottomFilterProvider = self->_bottomFilterProvider;
  self->_bottomFilterProvider = v14;

  v22.receiver = self;
  v22.super_class = (Class)NTKWhistlerSubdialsFaceView;
  v16 = [(NTKFaceView *)&v22 initWithFaceStyle:a3 forDevice:v9 clientIdentifier:v8];

  if (v16)
  {
    uint64_t v17 = objc_opt_new();
    timeViewContainerView = v16->_timeViewContainerView;
    v16->_timeViewContainerView = (UIView *)v17;

    v19 = [(NTKFaceView *)v16 contentView];
    [v19 addSubview:v16->_timeViewContainerView];

    v20 = [MEMORY[0x1E4F19A98] sharedMonitor];
    [v20 addSensitiveUIObserver:v16];

    v16->_numberSystem = -1;
  }
  return v16;
}

- (void)dealloc
{
  int v3 = [MEMORY[0x1E4F19A98] sharedMonitor];
  [v3 removeSensitiveUIObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKWhistlerSubdialsFaceView;
  [(NTKFaceView *)&v4 dealloc];
}

- (id)createFaceColorPalette
{
  os_unfair_lock_lock((os_unfair_lock_t)&createFaceColorPalette___lock);
  id WeakRetained = objc_loadWeakRetained(&createFaceColorPalette___cachedDevice);
  if (WeakRetained)
  {
    objc_super v4 = WeakRetained;
    id v5 = [(NTKFaceView *)self device];
    id v6 = objc_loadWeakRetained(&createFaceColorPalette___cachedDevice);
    if (v5 == v6)
    {
      v7 = [(NTKFaceView *)self device];
      uint64_t v8 = [v7 version];
      uint64_t v9 = createFaceColorPalette___previousCLKDeviceVersion;

      if (v8 == v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v10 = [(NTKFaceView *)self device];
  objc_storeWeak(&createFaceColorPalette___cachedDevice, v10);

  id v11 = objc_loadWeakRetained(&createFaceColorPalette___cachedDevice);
  createFaceColorPalette___previousCLKDeviceVersion = [v11 version];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__NTKWhistlerSubdialsFaceView_createFaceColorPalette__block_invoke;
  v15[3] = &unk_1E62C26B8;
  v15[4] = self;
  v12 = [(NTKFaceView *)self device];
  ((void (*)(void *, void *))__53__NTKWhistlerSubdialsFaceView_createFaceColorPalette__block_invoke)(v15, v12);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&createFaceColorPalette___lock);
  v13 = objc_alloc_init(NTKGossamerColorPalette);
  [(NTKGossamerColorPalette *)v13 setBackgroundStyle:self->_backgroundStyle];
  -[NTKGossamerColorPalette setApproximateComplicationPositions:](v13, "setApproximateComplicationPositions:", *(double *)&createFaceColorPalette__approximateComplicationPositions_0, *(double *)&createFaceColorPalette__approximateComplicationPositions_1, *(double *)&createFaceColorPalette__approximateComplicationPositions_2);
  return v13;
}

void __53__NTKWhistlerSubdialsFaceView_createFaceColorPalette__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadLayoutRules];
  [*(id *)(a1 + 32) bounds];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__NTKWhistlerSubdialsFaceView_createFaceColorPalette__block_invoke_2;
  v4[3] = &unk_1E62C9140;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = v2;
  int v3 = (double (**)(void *, __CFString *))_Block_copy(v4);
  createFaceColorPalette__approximateComplicationPositions_0 = v3[2](v3, @"top");
  createFaceColorPalette__approximateComplicationPositions_1 = v3[2](v3, @"center");
  createFaceColorPalette__approximateComplicationPositions_2 = v3[2](v3, @"bottom");
}

CGFloat __53__NTKWhistlerSubdialsFaceView_createFaceColorPalette__block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v3 = [*(id *)(a1 + 32) complicationLayoutforSlot:a2];
  objc_super v4 = [v3 defaultLayoutRuleForState:0];
  [v4 referenceFrame];
  CGFloat v5 = CGRectGetMidY(v7) / *(double *)(a1 + 40);

  return v5;
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (a4 == 11)
  {
    uint64_t v9 = off_1E62BEFA0;
  }
  else
  {
    if (a4 != 10)
    {
      v10 = 0;
      goto LABEL_7;
    }
    uint64_t v9 = off_1E62BEE48;
  }
  v10 = -[__objc2_class viewWithLegacyComplicationType:](*v9, "viewWithLegacyComplicationType:", [v7 complicationType]);
LABEL_7:

  return v10;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 setDelegate:self];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v7;
    [v5 transitThemeFromTheme:1 toTheme:1 fraction:1.0];
    if ([(NTKWhistlerSubdialsFaceView *)self showGossamerUI])
    {
      if ([v5 conformsToProtocol:&unk_1FCD6BD68])
      {
        id v6 = [MEMORY[0x1E4FB1618] clearColor];
        [v5 setPlatterColor:v6];
      }
      if ([v5 conformsToProtocol:&unk_1FCD92938]) {
        [v5 setTintedFraction:self->_tintedFraction];
      }
      [v5 transitionToMonochromeWithFraction:self->_monochromeFraction];
    }
    else
    {
      [(NTKWhistlerSubdialsFaceView *)self updateMonochromeColorForRichComplicationView:v5];
    }
  }
}

- (id)_filterProviderForSlot:(id)a3
{
  id v4 = a3;
  if ([(NTKWhistlerSubdialsFaceView *)self showGossamerUI])
  {
    if ([v4 isEqualToString:@"top"])
    {
      id v5 = &OBJC_IVAR___NTKWhistlerSubdialsFaceView__topFilterProvider;
LABEL_8:
      self = *(NTKWhistlerSubdialsFaceView **)((char *)&self->super.super.super.super.isa + *v5);
      goto LABEL_9;
    }
    if ([v4 isEqualToString:@"center"])
    {
      id v5 = &OBJC_IVAR___NTKWhistlerSubdialsFaceView__centerFilterProvider;
      goto LABEL_8;
    }
    if ([v4 isEqualToString:@"bottom"])
    {
      id v5 = &OBJC_IVAR___NTKWhistlerSubdialsFaceView__bottomFilterProvider;
      goto LABEL_8;
    }
  }
LABEL_9:
  id v6 = self;

  return v6;
}

- (void)updateMonochromeColorForRichComplicationView:(id)a3
{
  id v7 = a3;
  id v4 = [(NTKFaceView *)self faceColorPalette];
  if ([v4 isWhiteColor])
  {

LABEL_4:
    [v7 transitionToMonochromeWithFraction:0.0];
    goto LABEL_6;
  }
  id v5 = [(NTKFaceView *)self faceColorPalette];
  char v6 = [v5 isBlackColor];

  if (v6) {
    goto LABEL_4;
  }
  [v7 updateMonochromeColor];
LABEL_6:
}

- (void)_loadSnapshotContentViews
{
  v8.receiver = self;
  v8.super_class = (Class)NTKWhistlerSubdialsFaceView;
  [(NTKFaceView *)&v8 _loadSnapshotContentViews];
  if (!self->_composedView && [(NTKWhistlerSubdialsFaceView *)self showGossamerUI])
  {
    int v3 = [(NTKFaceView *)self rootContainerView];
    [v3 removeFromSuperview];
    id v4 = [NTKGradientComposedView alloc];
    id v5 = [(NTKFaceView *)self device];
    char v6 = [(NTKGradientComposedView *)v4 initWithDevice:v5];
    composedView = self->_composedView;
    self->_composedView = v6;

    [(NTKGradientComposedView *)self->_composedView setRootContainerView:v3];
    [(NTKWhistlerSubdialsFaceView *)self addSubview:self->_composedView];
  }
  [(NTKWhistlerSubdialsFaceView *)self _setupDialView];
}

- (void)_unloadSnapshotContentViews
{
  v7.receiver = self;
  v7.super_class = (Class)NTKWhistlerSubdialsFaceView;
  [(NTKFaceView *)&v7 _unloadSnapshotContentViews];
  composedView = self->_composedView;
  if (composedView)
  {
    [(NTKGradientComposedView *)composedView removeFromSuperview];
    id v4 = self->_composedView;
    self->_composedView = 0;

    id v5 = [(NTKFaceView *)self rootContainerView];
    [v5 removeFromSuperview];
    char v6 = [(NTKFaceView *)self timeView];
    [(NTKWhistlerSubdialsFaceView *)self insertSubview:v5 aboveSubview:v6];
  }
  [(NTKWhistlerSubdialsFaceView *)self _removeDialView];
}

- (void)_setupDialView
{
  int v3 = [(NTKWhistlerSubdialsFaceView *)self dialView];
  [(NTKFaceView *)self setTimeView:v3];

  timeViewContainerView = self->_timeViewContainerView;
  id v5 = [(NTKFaceView *)self timeView];
  [(UIView *)timeViewContainerView addSubview:v5];

  char v6 = self->_timeViewContainerView;
  id v7 = [(NTKFaceView *)self timeView];
  [v7 bounds];
  -[UIView setBounds:](v6, "setBounds:");
}

- (id)dialView
{
  int v3 = [(NTKFaceView *)self device];
  _LayoutConstants_46(v3, (uint64_t)v11);
  double v4 = v11[0];

  id v5 = [NTKWhistlerSubdialsTimeView alloc];
  char v6 = [(NTKFaceView *)self device];
  id v7 = -[NTKWhistlerSubdialsTimeView initWithFrame:style:andDevice:](v5, "initWithFrame:style:andDevice:", 0, v6, 0.0, 0.0, v4, v4);

  BOOL v8 = [(NTKWhistlerSubdialsFaceView *)self showGossamerUI];
  uint64_t v9 = [(NTKFaceView *)self faceColorPalette];
  if (v8) {
    [(NTKDualTimeView *)v7 applyGossamerColorPalette:v9];
  }
  else {
    [(NTKDualTimeView *)v7 setColorPalette:v9];
  }

  [(NTKWhistlerSubdialsTimeView *)v7 setForcedNumberSystemForDigitalTimeLabel:self->_numberSystem];
  return v7;
}

- (void)_removeDialView
{
  int v3 = [(NTKFaceView *)self timeView];
  [v3 removeFromSuperview];

  [(NTKFaceView *)self setTimeView:0];
}

- (BOOL)_isAnalog
{
  uint64_t v2 = [(NTKFaceView *)self optionForCustomEditMode:15 slot:0];
  BOOL v3 = [v2 style] == 0;

  return v3;
}

- (void)updateWithColorPalette:(id)a3
{
  id v4 = a3;
  [(NTKWhistlerSubdialsFaceView *)self _applyTransitionFraction:v4 fromPalette:v4 toPalette:0.0];
  id v5 = [(NTKFaceView *)self timeView];
  [v5 setColorPalette:v4];
}

- (BOOL)_wantsStatusBarIconShadow
{
  return self->_backgroundStyle != 0;
}

- (void)_loadLayoutRules
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__NTKWhistlerSubdialsFaceView__loadLayoutRules__block_invoke;
  v2[3] = &unk_1E62C3620;
  v2[4] = self;
  NTKEnumerateComplicationStates(v2);
}

void __47__NTKWhistlerSubdialsFaceView__loadLayoutRules__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  uint64_t v59 = 0;
  *(_OWORD *)sx = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v12 = [*(id *)(a1 + 32) device];
  _LayoutConstants_46(v12, (uint64_t)&v49);

  double v45 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v46 = *MEMORY[0x1E4FB2848];
  double v43 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  double v44 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v13 = *((double *)&v53 + 1);
  long long v15 = v54;
  double v14 = *(double *)&v55;
  unint64_t v16 = a2 & 0xFFFFFFFFFFFFFFFELL;
  double v41 = sx[0];
  v60.origin.x = v5;
  v60.origin.y = v7;
  v60.size.width = v9;
  v60.size.height = v11;
  double MaxY = CGRectGetMaxY(v60);
  double v17 = *(double *)&v53;
  double v18 = *((double *)&v50 + 1);
  double v38 = *(double *)&v51;
  double v39 = *((double *)&v52 + 1);
  double v20 = *((double *)&v51 + 1);
  double v19 = *(double *)&v52;
  v21 = [*(id *)(a1 + 32) device];
  double v42 = v14;
  objc_super v22 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v21, 3, 3, v17, v18, v20, v19, v13, v15, v14);

  v23 = [*(id *)(a1 + 32) complicationLayoutforSlot:@"top"];
  [v23 setDefaultLayoutRule:v22 forState:a2];

  v61.origin.x = v17;
  v61.origin.y = v18;
  v61.size.width = v20;
  v61.size.height = v19;
  double v24 = CGRectGetMaxY(v61);
  double v25 = 0.0;
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    double v25 = v41;
  }
  double v26 = MaxY - v38 - v25 - v39;
  if (v16 == 2) {
    double v27 = (v26 + v39 * (1.0 - sx[1]) * 0.5 - v24 - v19) * 0.5;
  }
  else {
    double v27 = *(double *)&v50;
  }
  double v28 = v24 + v27;
  v29 = [*(id *)(a1 + 32) device];
  v30 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v29, 3, 3, v17, v28, v20, v19, v13, v15, v42);

  v31 = [*(id *)(a1 + 32) complicationLayoutforSlot:@"center"];
  [v31 setDefaultLayoutRule:v30 forState:a2];

  v32 = [*(id *)(a1 + 32) device];
  [v32 screenBounds];
  double v34 = v33;

  v35 = [*(id *)(a1 + 32) device];
  v36 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v35, 3, 3, 0.0, v26, v34, v39, v46, v45, v44, v43);

  if (v16 == 2)
  {
    CGAffineTransformMakeScale(&v48, sx[1], sx[1]);
    CGAffineTransform v47 = v48;
    [v36 setEditingTransform:&v47];
  }
  v37 = [*(id *)(a1 + 32) complicationLayoutforSlot:@"bottom"];
  [v37 setDefaultLayoutRule:v36 forState:a2];
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"bottom"])
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKWhistlerSubdialsFaceView;
    int64_t v5 = [(NTKFaceView *)&v7 _keylineStyleForComplicationSlot:v4];
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)NTKWhistlerSubdialsFaceView;
  [(NTKFaceView *)&v19 layoutSubviews];
  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = [(NTKFaceView *)self device];
  _LayoutConstants_46(v3, (uint64_t)&v13);

  id v4 = [(NTKFaceView *)self timeView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  [(NTKWhistlerSubdialsFaceView *)self bounds];
  -[UIView setCenter:](self->_timeViewContainerView, "setCenter:", CGRectGetMaxX(v20) - *(double *)&v15 - v6 * 0.5, v8 * 0.5 + *((double *)&v14 + 1));
  double v9 = MEMORY[0x1C1874A70]([(UIView *)self->_timeViewContainerView bounds]);
  double v11 = v10;
  v12 = [(NTKFaceView *)self timeView];
  objc_msgSend(v12, "setCenter:", v9, v11);
}

- (double)_horizontalPaddingForStatusBar
{
  uint64_t v2 = [(NTKFaceView *)self device];
  _LayoutConstants_46(v2, (uint64_t)v5);
  double v3 = v6;

  return v3;
}

- (double)_verticalPaddingForStatusBar
{
  v9.receiver = self;
  v9.super_class = (Class)NTKWhistlerSubdialsFaceView;
  [(NTKFaceView *)&v9 _verticalPaddingForStatusBar];
  double v4 = v3;
  if (self->_backgroundStyle == 1)
  {
    double v5 = [(NTKFaceView *)self device];
    _LayoutConstants_46(v5, (uint64_t)v7);
    double v4 = v4 + v8;
  }
  return v4;
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"bottom"])
  {
    double v5 = [(NTKFaceView *)self device];
    +[NTKModuleView cornerRadiusForComplicationFamily:1 forDevice:v5];
    double v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKWhistlerSubdialsFaceView;
    [(NTKFaceView *)&v10 _keylineCornerRadiusForComplicationSlot:v4];
    double v7 = v8;
  }

  return v7;
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  int v3 = [a3 isEqualToString:@"bottom"];
  id v4 = (double *)&NTKLargeElementMinimumBreathingScale;
  if (!v3) {
    id v4 = (double *)&NTKSmallElementMinimumBreathingScale;
  }
  return *v4;
}

- (void)_prepareForEditing
{
  int v3 = [(NTKFaceView *)self timeView];
  [v3 setEditing:1];

  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:&__block_literal_global_160];
}

void __49__NTKWhistlerSubdialsFaceView__prepareForEditing__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 layer];
  [v3 setAllowsGroupOpacity:1];
}

- (void)_cleanupAfterEditing
{
  id v3 = [(NTKFaceView *)self timeView];
  [v3 setEditing:0];

  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:&__block_literal_global_47_1];
}

void __51__NTKWhistlerSubdialsFaceView__cleanupAfterEditing__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 layer];
  [v3 setAllowsGroupOpacity:0];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v15 = a3;
  if ([(NTKWhistlerSubdialsFaceView *)self showGossamerUI])
  {
    if (a4 != 15)
    {
      double v7 = [(NTKFaceView *)self faceColorPalette];
      double v8 = v7;
      if (self->_complicationPlaceholderViews) {
        [v7 setIsSwatchPreview:1];
      }
      switch(a4)
      {
        case 10:
          [(NTKWhistlerSubdialsFaceView *)self _applyColorsFromPalette:v8];
          break;
        case 19:
          -[NTKWhistlerSubdialsFaceView _setNumerals:](self, "_setNumerals:", [v15 numeralOption]);
          break;
        case 17:
          uint64_t v9 = [v15 backgroundStyle];
          [v8 setBackgroundStyle:v9];
          [(NTKWhistlerSubdialsFaceView *)self setBackgroundStyle:v9];
          [(NTKWhistlerSubdialsFaceView *)self _applyColorsFromPalette:v8];
          objc_super v10 = [(NTKFaceView *)self delegate];
          [v10 faceViewWantsComplicationKeylineFramesReloaded];

          double v11 = [(NTKFaceView *)self delegate];
          [v11 faceViewDidChangeWantsStatusBarIconShadow];

          v12 = [(NTKFaceView *)self delegate];
          [v12 faceViewDidChangePaddingForStatusBar];

          break;
      }
LABEL_17:

      goto LABEL_18;
    }
  }
  else
  {
    if (a4 == 19)
    {
      -[NTKWhistlerSubdialsFaceView _setNumerals:](self, "_setNumerals:", [v15 numeralOption]);
      goto LABEL_18;
    }
    if (a4 != 15)
    {
      long long v13 = v15;
      if (a4 != 10) {
        goto LABEL_19;
      }
      double v8 = [(NTKFaceView *)self faceColorPalette];
      [(NTKWhistlerSubdialsFaceView *)self updateWithColorPalette:v8];
      goto LABEL_17;
    }
  }
  long long v14 = [(NTKFaceView *)self timeView];
  objc_msgSend(v14, "setStyle:", objc_msgSend(v15, "style"));

LABEL_18:
  long long v13 = v15;
LABEL_19:
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v26 = a4;
  id v11 = a5;
  if ([(NTKWhistlerSubdialsFaceView *)self showGossamerUI])
  {
    if (a6 != 15)
    {
      v12 = [(NTKFaceView *)self interpolatedColorPalette];
      long long v13 = [v12 fromPalette];
      long long v14 = [v12 toPalette];
      if (self->_complicationPlaceholderViews)
      {
        [v13 setIsSwatchPreview:1];
        [v14 setIsSwatchPreview:1];
      }
      switch(a6)
      {
        case 10:
          unint64_t v25 = [(NTKWhistlerSubdialsFaceView *)self backgroundStyle];
          [v13 setBackgroundStyle:v25];
          [v14 setBackgroundStyle:v25];
          [(NTKWhistlerSubdialsFaceView *)self _applyColorsFromPalette:v12];
          break;
        case 19:
          -[NTKWhistlerSubdialsFaceView _applyTransitionFraction:fromNumeralOption:toNumeralOption:](self, "_applyTransitionFraction:fromNumeralOption:toNumeralOption:", [v26 numeralOption], objc_msgSend(v11, "numeralOption"), a3);
          break;
        case 17:
          uint64_t v15 = [v26 backgroundStyle];
          uint64_t v16 = [v11 backgroundStyle];
          long long v17 = [(NTKFaceView *)self faceColorPalette];
          uint64_t v18 = [v17 pigmentEditOption];

          [v13 setPigmentEditOption:v18];
          [v13 setBackgroundStyle:v15];
          [v14 setPigmentEditOption:v18];
          [v14 setBackgroundStyle:v16];
          [v12 setTransitionFraction:a3];
          [(NTKWhistlerSubdialsFaceView *)self _applyColorsFromPalette:v12];

          break;
      }

      goto LABEL_18;
    }
LABEL_13:
    double v24 = [(NTKFaceView *)self timeView];
    objc_msgSend(v24, "applyTransitionFraction:fromStyle:toStyle:", objc_msgSend(v26, "style"), objc_msgSend(v11, "style"), a3);

    goto LABEL_18;
  }
  switch(a6)
  {
    case 19:
      -[NTKWhistlerSubdialsFaceView _applyTransitionFraction:fromNumeralOption:toNumeralOption:](self, "_applyTransitionFraction:fromNumeralOption:toNumeralOption:", [v26 numeralOption], objc_msgSend(v11, "numeralOption"), a3);
      break;
    case 15:
      goto LABEL_13;
    case 10:
      objc_super v19 = [(NTKFaceView *)self interpolatedColorPalette];
      CGRect v20 = [v19 fromPalette];

      v21 = [(NTKFaceView *)self interpolatedColorPalette];
      objc_super v22 = [v21 toPalette];

      v23 = [(NTKFaceView *)self timeView];
      [v23 applyTransitionFraction:v20 fromColorPalette:v22 toColorPalette:a3];

      [(NTKWhistlerSubdialsFaceView *)self _applyTransitionFraction:v20 fromPalette:v22 toPalette:a3];
      break;
  }
LABEL_18:
}

- (void)_applyTransitionFraction:(double)a3 fromNumeralOption:(unint64_t)a4 toNumeralOption:(unint64_t)a5
{
  if ([(NTKFaceView *)self isAnalog])
  {
    uint64_t v9 = self;
    unint64_t v10 = a5;
LABEL_5:
    [(NTKWhistlerSubdialsFaceView *)v9 _setNumerals:v10];
    return;
  }
  if (a4 == a5)
  {
    uint64_t v9 = self;
    unint64_t v10 = a4;
    goto LABEL_5;
  }
  CLKMapFractionIntoRange();
  if (a3 >= 0.5)
  {
    double v12 = v11;
    a4 = a5;
  }
  else
  {
    double v12 = v11;
  }
  CLKMapFractionIntoRange();
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, v13, v13);
  [(NTKWhistlerSubdialsFaceView *)self _setNumerals:a4];
  long long v14 = [(NTKFaceView *)self timeView];
  uint64_t v15 = [v14 digitalTimeLabel];

  [v15 setAlpha:v12];
  CGAffineTransform v16 = v17;
  [v15 setTransform:&v16];
}

- (void)_applyColorsFromPalette:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 scaleFactor];
  [v5 doubleValue];
  self->_scaleFactor = v6;

  memset(&v40, 0, sizeof(v40));
  CGAffineTransformMakeScale(&v40, self->_scaleFactor, self->_scaleFactor);
  double v7 = [(NTKFaceView *)self rootContainerView];
  CGAffineTransform v39 = v40;
  [v7 setTransform:&v39];

  [(NTKGradientComposedView *)self->_composedView applyGossamerColorPalette:v4];
  double v8 = [(NTKFaceView *)self timeView];
  [v8 applyGossamerColorPalette:v4];

  uint64_t v9 = [v4 foregroundColor];
  topFilterProvider = self->_topFilterProvider;
  double v11 = [v4 topAccentColor];
  [(NTKMonochromeModel *)topFilterProvider setAccentColor:v11];

  [(NTKMonochromeModel *)self->_topFilterProvider setNonAccentColor:v9];
  double v12 = self->_topFilterProvider;
  CGFloat v13 = [v4 topApproximateBackgroundColor];
  [(NTKMonochromeModel *)v12 setBackgroundColor:v13];

  centerFilterProvider = self->_centerFilterProvider;
  uint64_t v15 = [v4 centerAccentColor];
  [(NTKMonochromeModel *)centerFilterProvider setAccentColor:v15];

  [(NTKMonochromeModel *)self->_centerFilterProvider setNonAccentColor:v9];
  CGAffineTransform v16 = self->_centerFilterProvider;
  CGAffineTransform v17 = [v4 centerApproximateBackgroundColor];
  [(NTKMonochromeModel *)v16 setBackgroundColor:v17];

  bottomFilterProvider = self->_bottomFilterProvider;
  objc_super v19 = [v4 bottomAccentColor];
  [(NTKMonochromeModel *)bottomFilterProvider setAccentColor:v19];

  [(NTKMonochromeModel *)self->_bottomFilterProvider setNonAccentColor:v9];
  CGRect v20 = self->_bottomFilterProvider;
  v21 = [v4 bottomApproximateBackgroundColor];
  [(NTKMonochromeModel *)v20 setBackgroundColor:v21];

  objc_super v22 = [v4 monochromeFraction];
  [v22 doubleValue];
  self->_double monochromeFraction = v23;

  double v24 = [v4 tintedFraction];
  [v24 doubleValue];
  self->_double tintedFraction = v25;

  double monochromeFraction = self->_monochromeFraction;
  double tintedFraction = self->_tintedFraction;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __55__NTKWhistlerSubdialsFaceView__applyColorsFromPalette___block_invoke;
  v38[3] = &__block_descriptor_48_e56_v24__0__NSString_8__NTKComplicationDisplayWrapperView_16l;
  *(double *)&v38[4] = tintedFraction;
  *(double *)&v38[5] = monochromeFraction;
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v38];
  if (self->_complicationPlaceholderViews)
  {
    double v28 = [v4 swatchComplicationPlaceholderColor];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v29 = self->_complicationPlaceholderViews;
    uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v35;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(v29);
          }
          objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v33++), "setBackgroundColor:", v28, (void)v34);
        }
        while (v31 != v33);
        uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v31);
    }
  }
}

void __55__NTKWhistlerSubdialsFaceView__applyColorsFromPalette___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 display];
  if ([v4 conformsToProtocol:&unk_1FCD92938]) {
    [v4 setTintedFraction:*(double *)(a1 + 32)];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 transitionToMonochromeWithFraction:*(double *)(a1 + 40)];
  }
}

- (void)loadComplicationPlaceholderViews
{
  v46[3] = *MEMORY[0x1E4F143B8];
  if (!self->_complicationPlaceholderViews)
  {
    id v3 = [(NTKFaceView *)self normalComplicationDisplayWrapperForSlot:@"top"];
    id v4 = [(NTKFaceView *)self normalComplicationDisplayWrapperForSlot:@"center"];
    double v5 = [(NTKFaceView *)self normalComplicationDisplayWrapperForSlot:@"bottom"];
    [v3 bounds];
    double v7 = v6 * 0.5;
    [v3 frame];
    double MinX = CGRectGetMinX(v47);
    [v4 frame];
    double MinY = CGRectGetMinY(v48);
    [v3 frame];
    double v10 = MinY - CGRectGetMaxY(v49);
    [v5 bounds];
    double v12 = v11;
    long long v36 = v5;
    [v5 bounds];
    double v14 = v12 / v13;
    [(NTKWhistlerSubdialsFaceView *)self bounds];
    double v16 = v15 + MinX * -2.0;
    [v4 frame];
    double v17 = v10 + CGRectGetMaxY(v50);
    id v18 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v38 = v3;
    [v3 frame];
    objc_super v19 = objc_msgSend(v18, "initWithFrame:");
    id v20 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    long long v37 = v4;
    [v4 frame];
    v21 = objc_msgSend(v20, "initWithFrame:");
    objc_super v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", MinX, v17, v16, v16 / v14);
    double v23 = [v19 layer];
    [v23 setCornerRadius:v7];

    double v24 = [v21 layer];
    [v24 setCornerRadius:v7];

    double v25 = [v22 layer];
    id v26 = [(NTKFaceView *)self device];
    _LayoutConstants_46(v26, (uint64_t)v43);
    [v25 setCornerRadius:v44];

    v46[0] = v19;
    v46[1] = v21;
    v46[2] = v22;
    double v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
    complicationPlaceholderViews = self->_complicationPlaceholderViews;
    self->_complicationPlaceholderViews = v27;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v29 = self->_complicationPlaceholderViews;
    uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v40;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v40 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v39 + 1) + 8 * v33);
          long long v35 = [(NTKFaceView *)self complicationContainerView];
          [v35 addSubview:v34];

          ++v33;
        }
        while (v31 != v33);
        uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v31);
    }
  }
}

- (void)_applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = [v8 primaryColor];
  double v11 = [v9 primaryColor];
  if ([v8 isBlackColor]) {
    int v12 = 1;
  }
  else {
    int v12 = [v8 isWhiteColor];
  }
  if ([v9 isBlackColor]) {
    int v13 = 1;
  }
  else {
    int v13 = [v9 isWhiteColor];
  }
  char v14 = v12 & v13;
  char v15 = v12 ^ v13;
  double v16 = 1.0 - a3;
  double v17 = 0.0;
  if ((v12 & v13) == 0) {
    double v17 = a3;
  }
  if (v13 & (v12 ^ v13) ^ 1 | v12) {
    double v18 = v17;
  }
  else {
    double v18 = 1.0 - a3;
  }
  if ((v12 | v13))
  {
    if (v12)
    {
      -[NTKFaceView setInterpolatedComplicationColor:](self, "setInterpolatedComplicationColor:", v11, v16);
      objc_super v19 = self;
      id v20 = v11;
LABEL_18:
      [(NTKFaceView *)v19 setComplicationColor:v20];
      goto LABEL_19;
    }
    if (v13)
    {
      -[NTKFaceView setInterpolatedComplicationColor:](self, "setInterpolatedComplicationColor:", v10, v16);
      objc_super v19 = self;
      id v20 = v10;
      goto LABEL_18;
    }
  }
  else
  {
    v21 = NTKInterpolateBetweenColors();
    [(NTKFaceView *)self setInterpolatedComplicationColor:v21];
    [(NTKFaceView *)self setComplicationColor:v21];
  }
LABEL_19:
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __78__NTKWhistlerSubdialsFaceView__applyTransitionFraction_fromPalette_toPalette___block_invoke;
  v22[3] = &unk_1E62C91A8;
  v22[4] = self;
  char v23 = v15;
  char v24 = v14 & 1;
  *(double *)&v22[5] = v18;
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v22];
}

void __78__NTKWhistlerSubdialsFaceView__applyTransitionFraction_fromPalette_toPalette___block_invoke(uint64_t a1, uint64_t a2)
{
  id v8 = [*(id *)(a1 + 32) normalComplicationDisplayWrapperForSlot:a2];
  id v3 = [v8 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v5 = v8;
  if (isKindOfClass)
  {
    double v6 = [v8 display];
    double v7 = v6;
    if (*(unsigned char *)(a1 + 48) || *(unsigned char *)(a1 + 49)) {
      [v6 transitionToMonochromeWithFraction:*(double *)(a1 + 40)];
    }
    else {
      [v6 updateMonochromeColor];
    }

    double v5 = v8;
  }
}

- (void)_configureForEditMode:(int64_t)a3
{
  CGFloat v5 = 1.0;
  if (a3 == 15)
  {
    double v6 = [(NTKFaceView *)self device];
    _LayoutConstants_46(v6, (uint64_t)v19);
    CGFloat v5 = v20;
  }
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeScale(&v18, v5, v5);
  double v7 = [(NTKFaceView *)self timeView];
  CGAffineTransform v17 = v18;
  [v7 setTransform:&v17];

  id v8 = [(NTKFaceView *)self timeView];
  [(NTKWhistlerSubdialsFaceView *)self _timeViewAlphaForEditMode:a3];
  objc_msgSend(v8, "setAlpha:");

  id v9 = [(NTKFaceView *)self complicationContainerView];
  [(NTKWhistlerSubdialsFaceView *)self _complicationAlphaForEditMode:a3];
  objc_msgSend(v9, "setAlpha:");

  if ([(NTKWhistlerSubdialsFaceView *)self showGossamerUI])
  {
    double v10 = [(NTKFaceView *)self delegate];
    [v10 faceViewWantsCustomKeylineFramesReloadedForEditMode:15];

    editingComplicationsPalette = self->_editingComplicationsPalette;
    if (a3 == 1)
    {
      if (!editingComplicationsPalette)
      {
        int v12 = [(NTKFaceView *)self faceColorPalette];
        int v13 = (void *)[v12 copy];
        [v13 setIsEditingComplications:1];
        char v14 = [[NTKInterpolatedColorPalette alloc] initWithFromPalette:v12 toPalette:v13];
        char v15 = self->_editingComplicationsPalette;
        self->_editingComplicationsPalette = v14;

        editingComplicationsPalette = self->_editingComplicationsPalette;
      }
      [(NTKInterpolatedColorPalette *)editingComplicationsPalette setTransitionFraction:1.0];
      [(NTKWhistlerSubdialsFaceView *)self _applyColorsFromPalette:self->_editingComplicationsPalette];
    }
    else if (editingComplicationsPalette)
    {
      self->_editingComplicationsPalette = 0;

      double v16 = [(NTKFaceView *)self faceColorPalette];
      [(NTKWhistlerSubdialsFaceView *)self _applyColorsFromPalette:v16];
    }
  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  id v8 = [(NTKFaceView *)self device];
  _LayoutConstants_46(v8, (uint64_t)v22);

  CLKInterpolateBetweenFloatsClipped();
  memset(&v21, 0, sizeof(v21));
  CGAffineTransformMakeScale(&v21, v9, v9);
  double v10 = [(NTKFaceView *)self timeView];
  CGAffineTransform v20 = v21;
  [v10 setTransform:&v20];

  double v11 = [(NTKFaceView *)self timeView];
  [(NTKWhistlerSubdialsFaceView *)self _timeViewAlphaForEditMode:a4];
  [(NTKWhistlerSubdialsFaceView *)self _timeViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v11, "setAlpha:");

  int v12 = [(NTKFaceView *)self complicationContainerView];
  [(NTKWhistlerSubdialsFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKWhistlerSubdialsFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v12, "setAlpha:");

  if ([(NTKWhistlerSubdialsFaceView *)self showGossamerUI])
  {
    int v13 = [(NTKFaceView *)self delegate];
    [v13 faceViewWantsCustomKeylineFramesReloadedForEditMode:15];

    editingComplicationsPalette = self->_editingComplicationsPalette;
    if (a4 == 1 || a5 == 1)
    {
      if (!editingComplicationsPalette)
      {
        double v16 = [(NTKFaceView *)self faceColorPalette];
        CGAffineTransform v17 = (void *)[v16 copy];
        [v17 setIsEditingComplications:1];
        CGAffineTransform v18 = [[NTKInterpolatedColorPalette alloc] initWithFromPalette:v16 toPalette:v17];
        objc_super v19 = self->_editingComplicationsPalette;
        self->_editingComplicationsPalette = v18;
      }
      CLKInterpolateBetweenFloatsClipped();
      -[NTKInterpolatedColorPalette setTransitionFraction:](self->_editingComplicationsPalette, "setTransitionFraction:");
      [(NTKWhistlerSubdialsFaceView *)self _applyColorsFromPalette:self->_editingComplicationsPalette];
    }
    else if (editingComplicationsPalette)
    {
      self->_editingComplicationsPalette = 0;

      char v15 = [(NTKFaceView *)self faceColorPalette];
      [(NTKWhistlerSubdialsFaceView *)self _applyColorsFromPalette:v15];
    }
  }
}

- (double)_timeViewAlphaForEditMode:(int64_t)a3
{
  double result = 0.2;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  BOOL v3 = a3 == 19 || a3 == 15;
  double result = 0.2;
  if (!v3) {
    return 1.0;
  }
  return result;
}

- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 15 || a3 == 19)
  {
    [(NTKFaceView *)self _faceEditingScaleForEditMode:a3 slot:v6];
    double v8 = v7;
    CGFloat v9 = [(NTKFaceView *)self device];
    _LayoutConstants_46(v9, (uint64_t)v14);
    double v10 = v14[0];

    if ([(NTKWhistlerSubdialsFaceView *)self showGossamerUI]) {
      double v10 = v10 * self->_scaleFactor;
    }
    uint64_t v11 = NTKKeylineViewWithCircle(v10, v8);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKWhistlerSubdialsFaceView;
    uint64_t v11 = [(NTKFaceView *)&v15 _keylineViewForCustomEditMode:a3 slot:v6];
  }
  int v12 = (void *)v11;

  return v12;
}

- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  unint64_t v7 = 148;
  if (a3 != 15 && a3 != 19)
  {
    v9.receiver = self;
    v9.super_class = (Class)NTKWhistlerSubdialsFaceView;
    unint64_t v7 = [(NTKFaceView *)&v9 _keylineLabelAlignmentForCustomEditMode:a3 slot:v6];
  }

  return v7;
}

- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 19 || a3 == 15)
  {
    [(NTKWhistlerSubdialsFaceView *)self _timeViewFrameRelativeToFaceView];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)NTKWhistlerSubdialsFaceView;
    [(NTKFaceView *)&v19 _relativeKeylineFrameForCustomEditMode:a3 slot:v6];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_timeViewFrameRelativeToFaceView
{
  double scaleFactor = 1.0;
  if ([(NTKWhistlerSubdialsFaceView *)self showGossamerUI]) {
    double scaleFactor = self->_scaleFactor;
  }
  uint64_t v31 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = [(NTKFaceView *)self device];
  _LayoutConstants_46(v4, (uint64_t)&v26);

  CGFloat v5 = [(NTKFaceView *)self device];
  [v5 screenBounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v32.origin.x = v7;
  v32.origin.y = v9;
  v32.size.width = v11;
  v32.size.height = v13;
  double MidX = CGRectGetMidX(v32);
  v33.origin.x = v7;
  v33.origin.y = v9;
  v33.size.width = v11;
  v33.size.height = v13;
  double MidY = CGRectGetMidY(v33);
  double v16 = *(double *)&v26;
  double v17 = [(NTKFaceView *)self device];
  [v17 screenBounds];
  double v19 = v18 - *(double *)&v28 - v16 * 0.5;
  double v20 = v16 * 0.5 + *((double *)&v27 + 1);

  double v21 = scaleFactor * v16;
  double v22 = scaleFactor * v16 * 0.5;
  double v23 = MidX + (v19 - MidX) * scaleFactor - v22;
  double v24 = MidY + (v20 - MidY) * scaleFactor - v22;
  double v25 = scaleFactor * v16;
  result.size.height = v25;
  result.size.width = v21;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  double v7 = NTKLargeElementScaleForBreathingFraction(a3);
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeScale(&v18, v7, v7);
  if ([(NTKWhistlerSubdialsFaceView *)self showGossamerUI])
  {
    switch(a4)
    {
      case 10:
      case 17:
        composedView = self->_composedView;
        CGAffineTransform v17 = v18;
        [(NTKGradientComposedView *)composedView setTransform:&v17];
        timeViewContainerView = (NTKWhistlerSubdialsFaceView *)self->_timeViewContainerView;
        long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v17.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v17.c = v10;
        long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        goto LABEL_11;
      case 15:
      case 19:
        double v15 = self->_composedView;
        long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v17.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v17.c = v16;
        *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        goto LABEL_10;
      default:
        return;
    }
  }
  else
  {
    if (a4 == 19 || a4 == 15)
    {
      long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v17.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v17.c = v14;
      *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      double v15 = self;
LABEL_10:
      objc_msgSend(v15, "setTransform:", &v17, *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);
      timeViewContainerView = (NTKWhistlerSubdialsFaceView *)self->_timeViewContainerView;
      *(_OWORD *)&v17.a = *(_OWORD *)&v18.a;
      *(_OWORD *)&v17.c = *(_OWORD *)&v18.c;
      long long v11 = *(_OWORD *)&v18.tx;
LABEL_11:
      *(_OWORD *)&v17.tx = v11;
    }
    else
    {
      if (a4 != 10) {
        return;
      }
      double v12 = self->_timeViewContainerView;
      long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v17.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v17.c = v13;
      *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(UIView *)v12 setTransform:&v17];
      CGAffineTransform v17 = v18;
      timeViewContainerView = self;
    }
    -[NTKWhistlerSubdialsFaceView setTransform:](timeViewContainerView, "setTransform:", &v17, *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  double v7 = NTKScaleForRubberBandingFraction(a3);
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeScale(&v16, v7, v7);
  if ([(NTKWhistlerSubdialsFaceView *)self showGossamerUI])
  {
    switch(a4)
    {
      case 10:
      case 17:
        composedView = self->_composedView;
        CGAffineTransform v15 = v16;
        [(NTKGradientComposedView *)composedView setTransform:&v15];
        timeViewContainerView = self->_timeViewContainerView;
        long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v15.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v15.c = v10;
        long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        goto LABEL_10;
      case 15:
      case 19:
        long long v13 = self->_composedView;
        long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v15.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v15.c = v14;
        *(_OWORD *)&v15.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        [(NTKGradientComposedView *)v13 setTransform:&v15];
        goto LABEL_9;
      default:
        return;
    }
  }
  else if (a4 == 19 || a4 == 15)
  {
LABEL_9:
    timeViewContainerView = self->_timeViewContainerView;
    *(_OWORD *)&v15.a = *(_OWORD *)&v16.a;
    *(_OWORD *)&v15.c = *(_OWORD *)&v16.c;
    long long v11 = *(_OWORD *)&v16.tx;
LABEL_10:
    *(_OWORD *)&v15.tx = v11;
    [(UIView *)timeViewContainerView setTransform:&v15];
  }
  else if (a4 == 10)
  {
    double v12 = [(NTKFaceView *)self contentView];
    CGAffineTransform v15 = v16;
    [v12 setTransform:&v15];
  }
}

- (void)_setNumerals:(unint64_t)a3
{
  unint64_t v4 = CLKLocaleNumberSystemFromNumeralOption(a3);
  if (self->_numberSystem != v4)
  {
    unint64_t v5 = v4;
    self->_numberSystem = v4;
    double v6 = [(NTKFaceView *)self device];
    int v7 = NTKShowIndicScriptNumerals(v6);

    if (v7)
    {
      double v8 = [(NTKFaceView *)self timeView];
      [v8 setForcedNumberSystemForDigitalTimeLabel:v5];

      [(NTKWhistlerSubdialsFaceView *)self setNeedsLayout];
    }
  }
}

- (void)sensitiveUIStateChanged
{
  unint64_t numberSystem = self->_numberSystem;
  unint64_t v4 = [(NTKFaceView *)self device];
  int v5 = NTKShowIndicScriptNumerals(v4);

  if (v5) {
    uint64_t v6 = numberSystem;
  }
  else {
    uint64_t v6 = -1;
  }
  int v7 = [(NTKFaceView *)self timeView];
  [v7 setForcedNumberSystemForDigitalTimeLabel:v6];

  [(NTKWhistlerSubdialsFaceView *)self setNeedsLayout];
}

- (void)rectangularViewDidBecomeInteractive:(id)a3
{
  id v4 = a3;
  int v5 = [(NTKFaceView *)self timeView];
  uint64_t v6 = [v5 layer];
  [v6 setAllowsGroupOpacity:1];

  int v7 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__NTKWhistlerSubdialsFaceView_rectangularViewDidBecomeInteractive___block_invoke;
  v9[3] = &unk_1E62C09C0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 animateWithDuration:4 delay:v9 options:&__block_literal_global_60 animations:0.3 completion:0.0];
}

void __67__NTKWhistlerSubdialsFaceView_rectangularViewDidBecomeInteractive___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) timeView];
  [v2 setAlpha:0.33];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__NTKWhistlerSubdialsFaceView_rectangularViewDidBecomeInteractive___block_invoke_2;
  v4[3] = &unk_1E62C87B0;
  BOOL v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 enumerateComplicationDisplayWrappersWithBlock:v4];
}

void __67__NTKWhistlerSubdialsFaceView_rectangularViewDidBecomeInteractive___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v4 = [v6 display];
  id v5 = *(void **)(a1 + 32);

  if (v4 != v5) {
    [v6 setAlpha:0.33];
  }
}

- (void)rectangularViewDidEndInteractive:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__NTKWhistlerSubdialsFaceView_rectangularViewDidEndInteractive___block_invoke;
  v4[3] = &unk_1E62BFF20;
  void v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__NTKWhistlerSubdialsFaceView_rectangularViewDidEndInteractive___block_invoke_3;
  v3[3] = &unk_1E62C2648;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v4 options:v3 animations:0.3 completion:0.0];
}

uint64_t __64__NTKWhistlerSubdialsFaceView_rectangularViewDidEndInteractive___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) timeView];
  [v2 setAlpha:1.0];

  BOOL v3 = *(void **)(a1 + 32);
  return [v3 enumerateComplicationDisplayWrappersWithBlock:&__block_literal_global_62_0];
}

uint64_t __64__NTKWhistlerSubdialsFaceView_rectangularViewDidEndInteractive___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setAlpha:1.0];
}

void __64__NTKWhistlerSubdialsFaceView_rectangularViewDidEndInteractive___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) timeView];
  v1 = [v2 layer];
  [v1 setAllowsGroupOpacity:0];
}

- (NSCache)backgroundSwatchesCache
{
  backgroundSwatchesCache = self->_backgroundSwatchesCache;
  if (!backgroundSwatchesCache)
  {
    id v4 = (NSCache *)objc_opt_new();
    id v5 = self->_backgroundSwatchesCache;
    self->_backgroundSwatchesCache = v4;

    backgroundSwatchesCache = self->_backgroundSwatchesCache;
  }
  return backgroundSwatchesCache;
}

- (NSCache)styleSwatchesCache
{
  styleSwatchesCache = self->_styleSwatchesCache;
  if (!styleSwatchesCache)
  {
    id v4 = (NSCache *)objc_opt_new();
    id v5 = self->_styleSwatchesCache;
    self->_styleSwatchesCache = v4;

    styleSwatchesCache = self->_styleSwatchesCache;
  }
  return styleSwatchesCache;
}

- (NTKFace)swatchesFace
{
  swatchesFace = self->_swatchesFace;
  if (!swatchesFace)
  {
    id v4 = [(NTKFaceView *)self device];
    id v5 = +[NTKFace defaultFaceOfStyle:34 forDevice:v4];
    id v6 = self->_swatchesFace;
    self->_swatchesFace = v5;

    int v7 = self->_swatchesFace;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__NTKWhistlerSubdialsFaceView_swatchesFace__block_invoke;
    v9[3] = &unk_1E62C3800;
    v9[4] = self;
    [(NTKFace *)v7 enumerateComplicationSlotsWithBlock:v9];
    swatchesFace = self->_swatchesFace;
  }
  return swatchesFace;
}

void __43__NTKWhistlerSubdialsFaceView_swatchesFace__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 896);
  id v3 = a2;
  id v4 = +[NTKComplication nullComplication];
  [v2 setComplication:v4 forSlot:v3];
}

- (NTKFaceViewController)swatchesFaceViewController
{
  swatchesFaceViewController = self->_swatchesFaceViewController;
  if (!swatchesFaceViewController)
  {
    id v4 = [(NTKWhistlerSubdialsFaceView *)self swatchesFace];
    id v5 = [[NTKFaceViewController alloc] initWithFace:v4 configuration:&__block_literal_global_70_1];
    id v6 = self->_swatchesFaceViewController;
    self->_swatchesFaceViewController = v5;

    [(NTKFaceViewController *)self->_swatchesFaceViewController freeze];
    int v7 = [(NTKFaceViewController *)self->_swatchesFaceViewController view];
    [v7 setNeedsLayout];

    id v8 = [(NTKFaceViewController *)self->_swatchesFaceViewController view];
    [v8 layoutIfNeeded];

    CGFloat v9 = [(NTKFaceViewController *)self->_swatchesFaceViewController faceView];
    [v9 loadComplicationPlaceholderViews];
    [v9 populateFaceViewEditOptionsFromFace:v4 forced:1];

    swatchesFaceViewController = self->_swatchesFaceViewController;
  }
  return swatchesFaceViewController;
}

void __57__NTKWhistlerSubdialsFaceView_swatchesFaceViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setDataMode:3];
  [v2 setShowsCanonicalContent:1];
  [v2 setShowContentForUnadornedSnapshot:1];
  [v2 setShowsLockedUI:0];
  [v2 setIgnoreSnapshotImages:1];
  [v2 setShouldUseSampleTemplate:1];
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  id v4 = &unk_1F16EA678;
  if (a3 != 15) {
    id v4 = 0;
  }
  if (a3 == 17) {
    return &unk_1F16EA660;
  }
  else {
    return v4;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(NTKWhistlerSubdialsFaceView *)self showGossamerUI])
  {
    if (a4 == 15)
    {
LABEL_5:
      if (a4 == 17)
      {
        id v10 = v8;
        id v11 = [v9 objectForKeyedSubscript:&unk_1F16E44A0];
      }
      else
      {
        id v10 = [v9 objectForKeyedSubscript:&unk_1F16E44B8];
        id v11 = v8;
      }
      double v25 = v11;
      long long v26 = [v9 objectForKeyedSubscript:&unk_1F16E4488];
      long long v27 = [v26 pigmentEditOption];
      long long v28 = NSString;
      v64 = v27;
      long long v29 = [v27 identifier];
      long long v30 = [v28 stringWithFormat:@"%@-%@-%@", v10, v25, v29];

      if (a4 == 17) {
        [(NTKWhistlerSubdialsFaceView *)self backgroundSwatchesCache];
      }
      else {
      uint64_t v31 = [(NTKWhistlerSubdialsFaceView *)self styleSwatchesCache];
      }
      id v20 = [v31 objectForKey:v30];

      if (!v20)
      {
        v62 = [(NTKWhistlerSubdialsFaceView *)self swatchesFaceViewController];
        CGRect v60 = [v62 faceView];
        CGRect v61 = [(NTKWhistlerSubdialsFaceView *)self swatchesFace];
        [v61 selectOption:v64 forCustomEditMode:10 slot:0];
        [v61 selectOption:v25 forCustomEditMode:15 slot:0];
        [v61 selectOption:v10 forCustomEditMode:17 slot:0];
        [v60 bounds];
        CGFloat v33 = v32;
        CGFloat v35 = v34;
        CGFloat v37 = v36;
        CGFloat v39 = v38;
        [v60 _timeViewFrameRelativeToFaceView];
        double v41 = v40;
        double v43 = v42;
        double v45 = v44;
        double v47 = v46;
        v67.width = v37;
        v67.height = v39;
        UIGraphicsBeginImageContextWithOptions(v67, 0, 0.0);
        CGRect v48 = [v60 layer];
        [v48 renderInContext:UIGraphicsGetCurrentContext()];

        uint64_t v59 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        CGRect v49 = [(NTKWhistlerSubdialsFaceView *)self backgroundSwatchesCache];
        [v49 setObject:v59 forKey:v30];

        v68.width = v45;
        v68.height = v47;
        UIGraphicsBeginImageContextWithOptions(v68, 0, 0.0);
        CurrentContext = UIGraphicsGetCurrentContext();
        objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v45, v47, v45 * 0.5);
        long long v51 = v26;
        long long v52 = v25;
        id v53 = objc_claimAutoreleasedReturnValue();
        id v63 = v10;
        long long v54 = (const CGPath *)[v53 CGPath];

        double v25 = v52;
        long long v26 = v51;
        CGContextAddPath(CurrentContext, v54);
        CGContextClip(CurrentContext);
        v69.origin.x = v33;
        v69.origin.y = v35;
        v69.size.width = v37;
        v69.size.height = v39;
        CGRect v70 = CGRectOffset(v69, -v41, -v43);
        objc_msgSend(v59, "drawInRect:", v70.origin.x, v70.origin.y, v70.size.width, v70.size.height);
        long long v55 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        long long v56 = [(NTKWhistlerSubdialsFaceView *)self styleSwatchesCache];
        [v56 setObject:v55 forKey:v30];

        if (a4 == 17) {
          v57 = v59;
        }
        else {
          v57 = v55;
        }
        id v20 = v57;

        id v10 = v63;
      }

      goto LABEL_24;
    }
    if (a4 != 19)
    {
      if (a4 == 17) {
        goto LABEL_5;
      }
LABEL_13:
      v65.receiver = self;
      v65.super_class = (Class)NTKWhistlerSubdialsFaceView;
      id v20 = [(NTKFaceView *)&v65 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
      goto LABEL_24;
    }
LABEL_12:
    id v21 = v8;
    double v22 = [(NTKFaceView *)self timeView];
    double v23 = [v22 _digitalLabelFont];
    double v24 = [(NTKFaceView *)self device];
    id v20 = [v21 swatchImageWithFont:v23 device:v24 baseline:0.0];

    goto LABEL_24;
  }
  if (a4 == 19) {
    goto LABEL_12;
  }
  if (a4 != 15) {
    goto LABEL_13;
  }
  double v12 = [(NTKWhistlerSubdialsFaceView *)self styleSwatchesCache];
  uint64_t v13 = [v8 style];
  long long v14 = [v9 objectForKeyedSubscript:&unk_1F16E4488];
  CGAffineTransform v15 = [v14 pigmentEditOption];

  CGAffineTransform v16 = NSString;
  CGAffineTransform v17 = [NSNumber numberWithUnsignedInteger:v13];
  CGAffineTransform v18 = [v15 identifier];
  double v19 = [v16 stringWithFormat:@"%@-%@", v17, v18];

  id v20 = [v12 objectForKey:v19];
  if (!v20)
  {
    id v20 = [(NTKWhistlerSubdialsFaceView *)self _renderDialSwatchImageForStyle:v13 colorOption:v15];
    [v12 setObject:v20 forKey:v19];
  }

LABEL_24:
  return v20;
}

- (id)_renderDialSwatchImageForStyle:(unint64_t)a3 colorOption:(id)a4
{
  id v6 = a4;
  int v7 = [(NTKFaceView *)self timeView];

  if (!v7) {
    [(NTKWhistlerSubdialsFaceView *)self _loadSnapshotContentViews];
  }
  [(NTKFaceView *)self setOption:v6 forCustomEditMode:10 slot:0];
  id v8 = [(NTKFaceView *)self timeView];
  uint64_t v9 = [v8 style];
  [v8 setStyle:a3];
  [v8 bounds];
  long long v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithBounds:", v10, v11, v12, v13);
  [(NTKWhistlerSubdialsFaceView *)self layoutIfNeeded];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__NTKWhistlerSubdialsFaceView__renderDialSwatchImageForStyle_colorOption___block_invoke;
  v18[3] = &unk_1E62C42D8;
  id v19 = v8;
  id v15 = v8;
  CGAffineTransform v16 = [v14 imageWithActions:v18];
  [v15 setStyle:v9];

  return v16;
}

void __74__NTKWhistlerSubdialsFaceView__renderDialSwatchImageForStyle_colorOption___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 layer];
  uint64_t v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (NTKGradientComposedView)composedView
{
  return (NTKGradientComposedView *)objc_getProperty(self, a2, 920, 1);
}

- (void)setComposedView:(id)a3
{
}

- (NTKInterpolatedColorPalette)editingComplicationsPalette
{
  return (NTKInterpolatedColorPalette *)objc_getProperty(self, a2, 928, 1);
}

- (void)setEditingComplicationsPalette:(id)a3
{
}

- (NTKMonochromeModel)topFilterProvider
{
  return self->_topFilterProvider;
}

- (NTKMonochromeModel)centerFilterProvider
{
  return self->_centerFilterProvider;
}

- (NTKMonochromeModel)bottomFilterProvider
{
  return self->_bottomFilterProvider;
}

- (double)monochromeFraction
{
  return self->_monochromeFraction;
}

- (void)setMonochromeFraction:(double)a3
{
  self->_double monochromeFraction = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_double scaleFactor = a3;
}

- (double)tintedFraction
{
  return self->_tintedFraction;
}

- (void)setTintedFraction:(double)a3
{
  self->_double tintedFraction = a3;
}

- (NSArray)complicationPlaceholderViews
{
  return self->_complicationPlaceholderViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationPlaceholderViews, 0);
  objc_storeStrong((id *)&self->_bottomFilterProvider, 0);
  objc_storeStrong((id *)&self->_centerFilterProvider, 0);
  objc_storeStrong((id *)&self->_topFilterProvider, 0);
  objc_storeStrong((id *)&self->_editingComplicationsPalette, 0);
  objc_storeStrong((id *)&self->_composedView, 0);
  objc_storeStrong((id *)&self->_swatchesFaceViewController, 0);
  objc_storeStrong((id *)&self->_swatchesFace, 0);
  objc_storeStrong((id *)&self->_styleSwatchesCache, 0);
  objc_storeStrong((id *)&self->_backgroundSwatchesCache, 0);
  objc_storeStrong((id *)&self->_timeViewContainerView, 0);
}

@end