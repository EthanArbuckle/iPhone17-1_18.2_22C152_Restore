@interface _UIToolbarVisualProviderModernIOS
- (BOOL)toolbarIsSmall;
- (BOOL)useModernAppearance;
- (CGRect)_backgroundFrame;
- (CGRect)backgroundFrame;
- (CGSize)defaultSizeForOrientation:(int64_t)a3;
- (NSDirectionalEdgeInsets)contentViewMargins;
- (double)backgroundTransitionProgress;
- (id)_currentCustomBackground;
- (id)currentBackgroundView;
- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4;
- (int64_t)itemDistribution;
- (void)_itemDidChangeWidth:(id)a3;
- (void)_setViewOwnersAndUpdateContentViewForItems:(id)a3 withOldItems:(id)a4 animated:(BOOL)a5;
- (void)_updateBackgroundLegacyForPosition:(int64_t)a3;
- (void)_updateBackgroundModern;
- (void)_updateContentView;
- (void)prepare;
- (void)setBackgroundTransitionProgress:(double)a3;
- (void)setCustomBackgroundView:(id)a3;
- (void)setItemDistribution:(int64_t)a3;
- (void)setUseModernAppearance:(BOOL)a3;
- (void)updateAppearance;
- (void)updateArchivedSubviews:(id)a3;
- (void)updateBackgroundGroupName;
- (void)updateBarBackground;
- (void)updateBarBackgroundSize;
- (void)updateBarForStyle:(int64_t)a3;
- (void)updateWithItems:(id)a3 fromOldItems:(id)a4 animate:(BOOL)a5;
@end

@implementation _UIToolbarVisualProviderModernIOS

- (void)setBackgroundTransitionProgress:(double)a3
{
  double backgroundTransitionProgress = self->_backgroundTransitionProgress;
  double v4 = fmax(fmin(a3, 1.0), 0.0);
  self->_double backgroundTransitionProgress = v4;
  if (backgroundTransitionProgress != v4) {
    [(_UIToolbarVisualProviderModernIOS *)self updateAppearance];
  }
}

- (void)updateAppearance
{
  [(_UIToolbarVisualProviderModernIOS *)self updateBarBackground];
  [(_UIToolbarVisualProviderModernIOS *)self _updateContentView];
  contentView = self->_contentView;
  [(_UIToolbarContentView *)contentView updateContent];
}

- (CGSize)defaultSizeForOrientation:(int64_t)a3
{
  if (_UIBarsUseNewPadHeights())
  {
    v5 = [(UIView *)self->super._toolbar _screen];
    [v5 bounds];
    double v7 = v6;

    v8 = [(UIView *)self->super._toolbar traitCollection];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9 == 5) {
      double v10 = 38.0;
    }
    else {
      double v10 = 50.0;
    }
  }
  else
  {
    char v11 = _UIUseMiniHeightInLandscape((unint64_t)(a3 - 3) < 2);
    v12 = [(UIView *)self->super._toolbar _screen];
    [v12 bounds];
    double v7 = v13;

    if (v11)
    {
      double v10 = 32.0;
    }
    else
    {
      v14 = self->super._toolbar;
      if (([(UIToolbar *)v14 barPosition] == 4
         || [(UIToolbar *)v14 barPosition] == 1 && _UIBackgroundExtensionForBar(v14) > 0.0)
        && ![(UIToolbar *)v14 isMinibar])
      {
        double v10 = 49.0;
      }
      else
      {
        double v10 = 44.0;
      }
    }
  }
  double v15 = v7;
  double v16 = v10;
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)toolbarIsSmall
{
  v3 = [(UIView *)self->super._toolbar traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  int v5 = _UIUseMiniHeightInLandscape(1u);
  if (v5)
  {
    if (v4 == 5) {
      double v6 = 34.0;
    }
    else {
      double v6 = 44.0;
    }
    [(UIView *)self->super._toolbar bounds];
    LOBYTE(v5) = v7 < v6;
  }
  return v5;
}

- (void)updateBarBackgroundSize
{
  [(_UIToolbarVisualProviderModernIOS *)self _backgroundFrame];
  backgroundView = self->_backgroundView;
  -[UIView setSize:](backgroundView, "setSize:", v3, v4);
}

- (void)updateBarBackground
{
  BOOL v3 = [(UIView *)self->super._toolbar _canDrawContent];
  backgroundView = self->_backgroundView;
  if (v3)
  {
    [(UIView *)backgroundView removeFromSuperview];
    return;
  }
  if (!backgroundView)
  {
    int v5 = [_UIBarBackground alloc];
    [(_UIToolbarVisualProviderModernIOS *)self _backgroundFrame];
    double v6 = -[_UIBarBackground initWithFrame:](v5, "initWithFrame:");
    double v7 = self->_backgroundView;
    self->_backgroundView = v6;
  }
  int64_t v8 = [(UIToolbar *)self->super._toolbar barPosition];
  [(_UIBarBackground *)self->_backgroundView setTopAligned:(v8 & 0xFFFFFFFFFFFFFFFELL) == 2];
  [(_UIBarBackground *)self->_backgroundView setCustomBackgroundView:self->_customBackgroundView];
  if (self->_customBackgroundView)
  {
    backgroundViewLayout = self->_backgroundViewLayout;
    self->_backgroundViewLayout = 0;
LABEL_11:

    goto LABEL_12;
  }
  if (+[_UIBarBackgroundLayoutPrototyping prototypingEnabled])
  {
    double v10 = +[_UIBarBackgroundLayoutPrototyping prototypingLayoutForBarType:2];
    backgroundViewLayout = self->_backgroundViewLayout;
    self->_backgroundViewLayout = v10;
    goto LABEL_11;
  }
  if (self->_useModernAppearance) {
    [(_UIToolbarVisualProviderModernIOS *)self _updateBackgroundModern];
  }
  else {
    [(_UIToolbarVisualProviderModernIOS *)self _updateBackgroundLegacyForPosition:v8];
  }
LABEL_12:
  [(_UIBarBackgroundLayout *)self->_backgroundViewLayout setDisableTinting:[(UIToolbar *)self->super._toolbar _disableBlurTinting]];
  BOOL useModernAppearance = self->_useModernAppearance;
  [(_UIToolbarVisualProviderModernIOS *)self backgroundTransitionProgress];
  if (useModernAppearance) {
    -[_UIBarBackgroundLayout setBackgroundTransitionProgress:](self->_backgroundViewLayout, "setBackgroundTransitionProgress:");
  }
  else {
    [(_UIBarBackgroundLayout *)self->_backgroundViewLayout setBackgroundAlpha:1.0 - v12];
  }
  [(_UIBarBackground *)self->_backgroundView setLayout:self->_backgroundViewLayout];
  [(UIView *)self->super._toolbar insertSubview:self->_backgroundView atIndex:0];
  [(_UIToolbarVisualProviderModernIOS *)self updateBackgroundGroupName];
  [(_UIToolbarVisualProviderModernIOS *)self _backgroundFrame];
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  double v13 = self->_backgroundView;
  [(_UIBarBackground *)v13 transitionBackgroundViews];
}

- (CGRect)_backgroundFrame
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  [(UIView *)self->super._toolbar bounds];
  double v6 = v5;
  double v8 = v7;
  if ([(UIToolbar *)self->super._toolbar barPosition] == 3
    && ([(UIView *)self->super._toolbar traitCollection],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 userInterfaceIdiom],
        v9,
        v10 != 3))
  {
    double v13 = [(UIView *)self->super._toolbar window];
    v14 = __UIStatusBarManagerForWindow(v13);
    [v14 statusBarHeight];
    double v16 = v15;

    double v4 = v4 - v16;
    double v8 = v8 + v16;
  }
  else
  {
    backgroundViewLayout = self->_backgroundViewLayout;
    if (backgroundViewLayout)
    {
      [(_UIBarBackgroundLayout *)backgroundViewLayout topInset];
      double v4 = v4 - v12;
      double v8 = v8 + v12;
    }
  }
  double v17 = v8 + _UIBackgroundExtensionForBar(self->super._toolbar);
  double v18 = v3;
  double v19 = v4;
  double v20 = v6;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)backgroundTransitionProgress
{
  return self->_backgroundTransitionProgress;
}

- (void)updateBackgroundGroupName
{
  id v5 = [(UIView *)self->super._toolbar traitCollection];
  double v3 = self;
  double v4 = [v5 objectForTrait:v3];
  [(_UIBarBackground *)self->_backgroundView setGroupName:v4];
}

- (void)_updateBackgroundModern
{
  p_backgroundViewLayout = &self->_backgroundViewLayout;
  double v20 = self->_backgroundViewLayout;
  if (!v20)
  {
    double v20 = objc_alloc_init(_UIBarBackgroundLayoutModern);
    objc_storeStrong((id *)p_backgroundViewLayout, v20);
  }
  double v4 = [(UIView *)self->super._toolbar traitCollection];
  -[_UIBarBackgroundLayout setInterfaceIdiom:](v20, "setInterfaceIdiom:", [v4 userInterfaceIdiom]);

  id v5 = [(UIView *)self->super._toolbar traitCollection];
  -[_UIBarBackgroundLayout setInterfaceStyle:](v20, "setInterfaceStyle:", [v5 userInterfaceStyle]);

  LODWORD(v5) = _UIBarsApplyChromelessEverywhere();
  BOOL v6 = [(_UIToolbarVisualProviderModernIOS *)self toolbarIsSmall];
  toolbar = self->super._toolbar;
  if (v5)
  {
    if (v6)
    {
      double v8 = toolbar;
      uint64_t v9 = [(UIToolbar *)v8 compactAppearance];
      uint64_t v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [(UIToolbar *)v8 standardAppearance];
      }
      double v16 = v11;

      double v13 = [v16 _backgroundData];

      double v17 = [(UIToolbar *)self->super._toolbar compactScrollEdgeAppearance];
      double v18 = v17;
      if (v17)
      {
        id v19 = v17;
      }
      else
      {
        id v19 = [(UIToolbar *)self->super._toolbar scrollEdgeAppearance];
      }
      v14 = v19;
    }
    else
    {
      double v12 = [(UIToolbar *)toolbar standardAppearance];
      double v13 = [v12 _backgroundData];

      v14 = [(UIToolbar *)self->super._toolbar scrollEdgeAppearance];
    }
    [(_UIBarBackgroundLayoutModern *)v20 setBackgroundData1:v13];
    if (v14) {
      [v14 _backgroundData];
    }
    else {
    double v15 = +[_UIBarBackgroundAppearanceData transparentBackgroundData];
    }
    [(_UIBarBackgroundLayoutModern *)v20 setBackgroundData2:v15];
  }
  else
  {
    if (v6) {
      [(UIToolbar *)toolbar compactAppearance];
    }
    else {
    double v13 = [(UIToolbar *)toolbar standardAppearance];
    }
    double v15 = [v13 _backgroundData];
    [(_UIBarBackgroundLayoutModern *)v20 setBackgroundData1:v15];
  }
}

- (void)_updateBackgroundLegacyForPosition:(int64_t)a3
{
  p_backgroundViewLayout = &self->_backgroundViewLayout;
  BOOL v6 = self->_backgroundViewLayout;
  if (!v6)
  {
    BOOL v6 = objc_alloc_init(_UIBarBackgroundLayoutLegacy);
    objc_storeStrong((id *)p_backgroundViewLayout, v6);
  }
  double v7 = [(UIView *)self->super._toolbar traitCollection];
  -[_UIBarBackgroundLayout setInterfaceIdiom:](*p_backgroundViewLayout, "setInterfaceIdiom:", [v7 userInterfaceIdiom]);

  double v8 = [(UIView *)self->super._toolbar traitCollection];
  -[_UIBarBackgroundLayout setInterfaceStyle:](*p_backgroundViewLayout, "setInterfaceStyle:", [v8 userInterfaceStyle]);

  BOOL v9 = [(UIToolbar *)self->super._toolbar isTranslucent];
  uint64_t v10 = [(UIToolbar *)self->super._toolbar barTintColor];
  UIBarStyle v11 = [(UIToolbar *)self->super._toolbar barStyle];
  if (v11 == 4)
  {
    double v12 = 0;
  }
  else
  {
    double v12 = [(_UIToolbarVisualProviderModernIOS *)self _currentCustomBackground];
  }
  BOOL v13 = [(UIToolbar *)self->super._toolbar _hidesShadow];
  v14 = [(UIToolbar *)self->super._toolbar backgroundEffects];
  unint64_t v15 = a3 & 0xFFFFFFFFFFFFFFFELL;
  BOOL v36 = v13;
  if (v14)
  {
    [(_UIBarBackgroundLayoutLegacy *)v6 configureWithEffects:v14];
LABEL_8:
    BOOL v16 = 0;
    goto LABEL_9;
  }
  if (!v12)
  {
    v31 = [(UIView *)self->super._toolbar traitCollection];
    uint64_t v32 = [v31 userInterfaceIdiom];

    if (v32 == 3) {
      [(_UIBarBackgroundLayoutLegacy *)v6 configureAsTransparent];
    }
    else {
      [(_UIBarBackgroundLayoutLegacy *)v6 configureEffectForStyle:v11 backgroundTintColor:v10 forceOpaque:!v9];
    }
    goto LABEL_8;
  }
  [v12 size];
  double v21 = v20;
  [v12 capInsets];
  BOOL v16 = 0;
  if (a3 == 3 && v22 == 0.0 && v23 == 0.0)
  {
    v35 = v10;
    v24 = [(UIView *)self->super._toolbar window];
    v25 = __UIStatusBarManagerForWindow(v24);
    char v26 = [v25 isStatusBarHidden];

    if (v26)
    {
      BOOL v16 = 0;
    }
    else
    {
      [(UIView *)self->super._toolbar bounds];
      BOOL v16 = v21 == v33;
    }
    uint64_t v10 = v35;
  }
  char v37 = 0;
  [v12 _isInvisibleAndGetIsTranslucent:&v37];
  if (v9)
  {
    [(_UIBarBackgroundLayoutLegacy *)v6 configureImage:v12 forceTranslucent:v37 == 0];
  }
  else
  {
    BOOL v34 = v37 != 0;
    if (v10) {
      [(_UIBarBackgroundLayoutLegacy *)v6 configureImage:v12 forceOpaque:v34 backgroundTintColor:v10];
    }
    else {
      [(_UIBarBackgroundLayoutLegacy *)v6 configureImage:v12 forceOpaque:v34 barStyle:v11];
    }
  }
LABEL_9:
  double v17 = [(UIToolbar *)self->super._toolbar __appearanceStorage];
  double v18 = v17;
  if (v15 == 2) {
    [v17 topShadowImage];
  }
  else {
  id v19 = [v17 shadowImage];
  }

  if (v19)
  {
    [(_UIBarBackgroundLayoutLegacy *)v6 configureShadowImage:v19];
  }
  else if (v36)
  {
    [(_UIBarBackgroundLayoutLegacy *)v6 configureWithoutShadow];
  }
  else
  {
    [(_UIBarBackgroundLayoutLegacy *)v6 configureShadowForBarStyle:v11];
  }
  double v27 = 0.0;
  if (v16)
  {
    v28 = [(UIView *)self->super._toolbar window];
    v29 = __UIStatusBarManagerForWindow(v28);
    [v29 defaultStatusBarHeightInOrientation:1];
    double v27 = v30;
  }
  [(_UIBarBackgroundLayoutLegacy *)v6 setTopInset:v27];
}

- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (self->_useModernAppearance)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = [v7 userInterfaceStyle];
    unint64_t v11 = [(UIToolbar *)self->super._toolbar barStyle] - 1;
    if (v10 == 2 || v11 >= 2) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 2;
    }
  }
  BOOL v13 = [v8 preferredContentSizeCategory];
  v14 = 0;
  if ((_UIBarsUseDynamicType() & 1) == 0 && v13)
  {
    if ([v13 isEqualToString:@"UICTContentSizeCategoryL"]) {
      v14 = 0;
    }
    else {
      v14 = @"UICTContentSizeCategoryL";
    }
  }
  id v15 = v8;
  BOOL v16 = v15;
  if (v9 || (double v17 = v15, v14))
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81___UIToolbarVisualProviderModernIOS_traitCollectionForChild_baseTraitCollection___block_invoke;
    v19[3] = &unk_1E52DF500;
    uint64_t v21 = v9;
    double v20 = v14;
    double v17 = [v16 traitCollectionByModifyingTraits:v19];
  }
  return v17;
}

- (id)_currentCustomBackground
{
  int64_t v3 = [(UIToolbar *)self->super._toolbar _barPosition];
  double v4 = [(UIToolbar *)self->super._toolbar __appearanceStorage];
  id v5 = [v4 backgroundImageForBarPosition:v3 barMetrics:0];

  if (v3 == 3 && v5 == 0) {
    int64_t v3 = 2;
  }
  if (!v5)
  {
    if (v3 == [(UIToolbar *)self->super._toolbar _barPosition])
    {
      id v5 = 0;
    }
    else
    {
      id v7 = [(UIToolbar *)self->super._toolbar __appearanceStorage];
      id v5 = [v7 backgroundImageForBarPosition:v3 barMetrics:0];
    }
  }
  BOOL v8 = [(UIToolbar *)self->super._toolbar isMinibar];
  if (v5) {
    BOOL v9 = !v8;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    uint64_t v10 = [(UIToolbar *)self->super._toolbar __appearanceStorage];
    unint64_t v11 = objc_msgSend(v10, "backgroundImageForBarPosition:barMetrics:", -[UIToolbar _barPosition](self->super._toolbar, "_barPosition"), 1);

    if (v11)
    {
      double v12 = v5;
      id v5 = v11;
    }
    else
    {
      if (v3 == [(UIToolbar *)self->super._toolbar _barPosition])
      {
LABEL_19:

        goto LABEL_20;
      }
      double v12 = [(UIToolbar *)self->super._toolbar __appearanceStorage];
      id v13 = (id)[v12 backgroundImageForBarPosition:v3 barMetrics:1];
    }

    goto LABEL_19;
  }
LABEL_20:
  return v5;
}

- (void)setUseModernAppearance:(BOOL)a3
{
  if (!self->_useModernAppearance || a3)
  {
    if (!self->_useModernAppearance && a3)
    {
      self->_BOOL useModernAppearance = 1;
      backgroundViewLayout = self->_backgroundViewLayout;
      self->_backgroundViewLayout = 0;

      [(_UIToolbarVisualProviderModernIOS *)self updateAppearance];
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_UIToolbarVisualProviderModernIOS.m" lineNumber:260 description:@"Downgrading modern appearance flag from YES to NO not supported"];
  }
}

- (void)_itemDidChangeWidth:(id)a3
{
  contentView = self->_contentView;
  id v4 = [(UIToolbar *)self->super._toolbar items];
  [(_UIToolbarContentView *)contentView reloadWithItems:v4];
}

- (void)updateBarForStyle:(int64_t)a3
{
  id v6 = [(UIToolbar *)self->super._toolbar barTintColor];
  id v5 = [(UIView *)self->super._toolbar _screen];
  LOBYTE(a3) = _UIBarStyleWithTintColorIsTranslucentOnScreen(a3, (uint64_t)v6, v5);

  if ((a3 & 1) == 0) {
    [(UIView *)self->super._toolbar setOpaque:[(UIToolbar *)self->super._toolbar isTranslucent] ^ 1];
  }
}

- (void)prepare
{
  v6.receiver = self;
  v6.super_class = (Class)_UIToolbarVisualProviderModernIOS;
  [(_UIToolbarVisualProvider *)&v6 prepare];
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44___UIToolbarVisualProviderModernIOS_prepare__block_invoke;
  v3[3] = &unk_1E52DE810;
  objc_copyWeak(&v4, &location);
  +[_UIBarBackgroundLayoutPrototyping registerPrototypingCallback:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)updateWithItems:(id)a3 fromOldItems:(id)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  id v8 = a4;
  if (!self->_contentView)
  {
    BOOL v9 = [_UIToolbarContentView alloc];
    [(UIView *)self->super._toolbar bounds];
    uint64_t v10 = -[_UIBarContentView initWithFrame:](v9, "initWithFrame:");
    contentView = self->_contentView;
    self->_contentView = v10;

    _UIBarsSetAccessibilityLimits(self->_contentView);
    [(UIView *)self->super._toolbar addSubview:self->_contentView];
  }
  [(_UIToolbarVisualProviderModernIOS *)self _updateContentView];
  [(_UIToolbarVisualProviderModernIOS *)self _setViewOwnersAndUpdateContentViewForItems:v12 withOldItems:v8 animated:v5];
}

- (void)_updateContentView
{
  if (!self->_contentView) {
    return;
  }
  [(UIView *)self->super._toolbar bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(_UIToolbarContentView *)self->_contentView setItemDistribution:self->_itemDistribution];
  [(_UIBarContentView *)self->_contentView setCenterTextButtons:[(UIToolbar *)self->super._toolbar centerTextButtons]];
  BOOL v11 = [(_UIToolbarVisualProviderModernIOS *)self toolbarIsSmall];
  [(_UIToolbarContentView *)self->_contentView setCompactMetrics:v11];
  id v12 = [(UIView *)self->super._toolbar window];
  id v20 = [v12 windowScene];

  if (v20) {
    uint64_t v13 = [v20 interfaceOrientation];
  }
  else {
    uint64_t v13 = 1;
  }
  [(_UIToolbarVisualProviderModernIOS *)self defaultSizeForOrientation:v13];
  if (v10 == v14)
  {
    [(_UIToolbarVisualProviderModernIOS *)self contentViewMargins];
    -[_UIToolbarContentView setPadding:](self->_contentView, "setPadding:");
  }
  if (self->_useModernAppearance)
  {
    if (_UIBarsApplyChromelessEverywhere())
    {
      [(_UIToolbarVisualProviderModernIOS *)self backgroundTransitionProgress];
      if (v11)
      {
        if (v15 > 0.25)
        {
          BOOL v16 = [(UIToolbar *)self->super._toolbar compactScrollEdgeAppearance];
          if (v16) {
            goto LABEL_23;
          }
          BOOL v16 = [(UIToolbar *)self->super._toolbar scrollEdgeAppearance];
          if (v16) {
            goto LABEL_23;
          }
          int v17 = 1;
          goto LABEL_17;
        }
LABEL_16:
        int v17 = 0;
LABEL_17:
        BOOL v16 = [(UIToolbar *)self->super._toolbar compactAppearance];
        if (v16) {
          goto LABEL_23;
        }
        if (!v17) {
          goto LABEL_22;
        }
LABEL_21:
        BOOL v16 = [(UIToolbar *)self->super._toolbar scrollEdgeAppearance];
        if (!v16) {
          goto LABEL_22;
        }
LABEL_23:
        double v18 = [v16 _plainButtonAppearanceData];
        [(_UIToolbarContentView *)self->_contentView setPlainItemAppearance:v18];

        id v19 = [v16 _doneButtonAppearanceData];
        [(_UIToolbarContentView *)self->_contentView setDoneItemAppearance:v19];

        goto LABEL_24;
      }
      if (v15 > 0.25) {
        goto LABEL_21;
      }
    }
    else if (v11)
    {
      goto LABEL_16;
    }
LABEL_22:
    BOOL v16 = [(UIToolbar *)self->super._toolbar standardAppearance];
    goto LABEL_23;
  }
LABEL_24:
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
}

- (NSDirectionalEdgeInsets)contentViewMargins
{
  double v3 = [(UIView *)self->super._toolbar traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (_UIBarsUseNewPadHeights())
  {
    if (v4 == 5) {
      double v5 = 0.0;
    }
    else {
      double v5 = 3.0;
    }
    double v6 = v5;
  }
  else
  {
    double v7 = self->super._toolbar;
    if ([(UIToolbar *)v7 barPosition] != 4
      && ([(UIToolbar *)v7 barPosition] != 1 || _UIBackgroundExtensionForBar(v7) <= 0.0)
      || (double v6 = 5.0, [(UIToolbar *)v7 isMinibar]))
    {
      double v6 = 0.0;
    }

    double v5 = 0.0;
  }
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = v6;
  result.trailing = v9;
  result.bottom = v5;
  result.leading = v8;
  result.top = v10;
  return result;
}

- (void)_setViewOwnersAndUpdateContentViewForItems:(id)a3 withOldItems:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v8);
        }
        double v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v14 isSystemItem] && objc_msgSend(v14, "systemItem") == 6) {
          [v14 _setViewOwner:self];
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
  [(_UIToolbarContentView *)self->_contentView updateWithItems:v8 fromOldItems:v9 animate:v5];
}

- (void)setItemDistribution:(int64_t)a3
{
  self->_itemDistribution = a3;
  -[_UIToolbarContentView setItemDistribution:](self->_contentView, "setItemDistribution:");
}

- (void)setCustomBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_customBackgroundView, a3);
  id v5 = a3;
  [(_UIBarBackground *)self->_backgroundView setCustomBackgroundView:v5];
}

- (int64_t)itemDistribution
{
  return self->_itemDistribution;
}

- (id)currentBackgroundView
{
  customBackgroundView = (_UIBarBackground *)self->_customBackgroundView;
  if (!customBackgroundView) {
    customBackgroundView = self->_backgroundView;
  }
  return customBackgroundView;
}

- (CGRect)backgroundFrame
{
  [(UIView *)self->_backgroundView frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)useModernAppearance
{
  return self->_useModernAppearance;
}

- (void)updateArchivedSubviews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundViewLayout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end