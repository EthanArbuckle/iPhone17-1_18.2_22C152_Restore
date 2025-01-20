@interface PUIStylePickerHomeScreenComponentViewController
- (BOOL)_gestureRecognizer:(id)a3 canBeCancelledByGestureRecognizer:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 canCancelGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (PUIStylePickerHomeScreenComponentViewController)initWithHomeScreenConfiguration:(id)a3;
- (PUIStylePickerHomeScreenComponentViewControllerDelegate)delegate;
- (PUIStylePickerHomeScreenConfiguration)homeScreenConfiguration;
- (PUIStyleVariationSlider)gradientColorSlider;
- (PUIStyleVariationSlider)lumaSlider;
- (double)_calculateEstimatedHeight;
- (double)_calculateStyleItemSpacing;
- (double)estimatedHeight;
- (unint64_t)selectedHomescreenStyleType;
- (void)_accentColorSlidersDidChangeValue:(id)a3;
- (void)_mutateHomeScreenConfiguration:(id)a3;
- (void)_notifyDelegateOfUpdatedEstimatedHeight;
- (void)_notifyDelegateOfUpdatedHomeScreenConfiguration;
- (void)_selectedHomeScreenStyleTypeDidChange:(id)a3;
- (void)_updateItemMarginsForHomeScreenConfiguration:(id)a3;
- (void)_updateLayoutConstraints;
- (void)_updateSelectionForType:(unint64_t)a3 animated:(BOOL)a4;
- (void)_updateViewControllerForHomeScreenConfiguration:(id)a3 animated:(BOOL)a4;
- (void)navigateHomeScreenColorPickerSlidersToColor:(id)a3;
- (void)navigateHomeScreenColorPickerSlidersToColor:(id)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setEstimatedHeight:(double)a3;
- (void)setEstimatedHeight:(double)a3 notifyDelegate:(BOOL)a4;
- (void)setGradientColorSlider:(id)a3;
- (void)setHomeScreenConfiguration:(id)a3;
- (void)setLumaSlider:(id)a3;
- (void)setSelectedHomescreenStyleType:(unint64_t)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUIStylePickerHomeScreenComponentViewController

- (PUIStylePickerHomeScreenComponentViewController)initWithHomeScreenConfiguration:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUIStylePickerHomeScreenComponentViewController;
  v5 = [(PUIStylePickerHomeScreenComponentViewController *)&v18 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    homeScreenConfiguration = v5->_homeScreenConfiguration;
    v5->_homeScreenConfiguration = (PUIStylePickerHomeScreenConfiguration *)v6;

    v8 = [v4 accentStyle];
    v9 = [[_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl alloc] initWithStyle:v8];
    lumaSliderUICoordinatorImpl = v5->_lumaSliderUICoordinatorImpl;
    v5->_lumaSliderUICoordinatorImpl = v9;

    v11 = [[PUIStyleUICoordinator alloc] initWithInitialStyle:v8 suggested:0 coordinator:v5->_lumaSliderUICoordinatorImpl];
    lumaSliderUICoordinator = v5->_lumaSliderUICoordinator;
    v5->_lumaSliderUICoordinator = v11;

    v13 = [(PUIStyleUICoordinatorImpl *)[_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl alloc] initWithStyle:v8];
    gradientColorSliderUICoordinatorImpl = v5->_gradientColorSliderUICoordinatorImpl;
    v5->_gradientColorSliderUICoordinatorImpl = v13;

    v15 = [[PUIStyleUICoordinator alloc] initWithInitialStyle:v8 suggested:0 coordinator:v5->_gradientColorSliderUICoordinatorImpl];
    gradientColorSliderUICoordinator = v5->_gradientColorSliderUICoordinator;
    v5->_gradientColorSliderUICoordinator = v15;
  }
  return v5;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PUIStylePickerHomeScreenComponentViewController;
  [(PUIStylePickerHomeScreenComponentViewController *)&v3 viewDidLoad];
  [(PUIStylePickerHomeScreenComponentViewController *)self _updateViewControllerForHomeScreenConfiguration:0 animated:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIStylePickerHomeScreenComponentViewController;
  [(PUIStylePickerHomeScreenComponentViewController *)&v4 viewWillAppear:a3];
  [(PUIStylePickerHomeScreenComponentViewController *)self _updateLayoutConstraints];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUIStylePickerHomeScreenComponentViewController;
  [(PUIStylePickerHomeScreenComponentViewController *)&v3 viewDidLayoutSubviews];
  [(PUIStylePickerHomeScreenComponentViewController *)self _updateItemMarginsForHomeScreenConfiguration:0];
}

- (void)setEstimatedHeight:(double)a3
{
}

- (void)setEstimatedHeight:(double)a3 notifyDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_estimatedHeight = a3;
    [(PUIStylePickerHomeScreenComponentViewController *)self _updateLayoutConstraints];
    if (v4)
    {
      [(PUIStylePickerHomeScreenComponentViewController *)self _notifyDelegateOfUpdatedEstimatedHeight];
    }
  }
}

- (void)_selectedHomeScreenStyleTypeDidChange:(id)a3
{
  uint64_t v4 = [a3 tag];
  v5 = [(PUIStylePickerHomeScreenComponentViewController *)self homeScreenConfiguration];
  uint64_t v6 = [v5 styleType];

  if (v6 == v4)
  {
    if (v4 == 3)
    {
      v7 = [(PUIStylePickerHomeScreenComponentViewController *)self homeScreenConfiguration];
      id v8 = [v7 suggestedAccentColor];

      [(PUIStylePickerHomeScreenComponentViewController *)self navigateHomeScreenColorPickerSlidersToColor:v8 animated:1];
    }
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __89__PUIStylePickerHomeScreenComponentViewController__selectedHomeScreenStyleTypeDidChange___block_invoke;
    v9[3] = &__block_descriptor_40_e54_v16__0__PUIMutableStylePickerHomeScreenConfiguration_8l;
    v9[4] = v4;
    [(PUIStylePickerHomeScreenComponentViewController *)self _mutateHomeScreenConfiguration:v9];
  }
}

uint64_t __89__PUIStylePickerHomeScreenComponentViewController__selectedHomeScreenStyleTypeDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStyleType:*(void *)(a1 + 32)];
}

- (void)_mutateHomeScreenConfiguration:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void (**)(id, id))a3;
    v5 = [(PUIStylePickerHomeScreenComponentViewController *)self homeScreenConfiguration];
    uint64_t v6 = (void *)[v5 mutableCopy];
    v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = (id)objc_opt_new();
    }
    id v9 = v8;

    v4[2](v4, v9);
    [(PUIStylePickerHomeScreenComponentViewController *)self _updateViewControllerForHomeScreenConfiguration:v9 animated:1];
    [(PUIStylePickerHomeScreenComponentViewController *)self _notifyDelegateOfUpdatedHomeScreenConfiguration];
  }
}

- (void)navigateHomeScreenColorPickerSlidersToColor:(id)a3
{
}

- (void)navigateHomeScreenColorPickerSlidersToColor:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __104__PUIStylePickerHomeScreenComponentViewController_navigateHomeScreenColorPickerSlidersToColor_animated___block_invoke;
  v16[3] = &unk_265470E78;
  id v17 = v5;
  id v6 = v5;
  [(PUIStylePickerHomeScreenComponentViewController *)self _mutateHomeScreenConfiguration:v16];
  v7 = [(PUIStylePickerHomeScreenConfiguration *)self->_homeScreenConfiguration accentStyle];
  id v8 = [(PUIStyleUICoordinatorImpl *)[_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl alloc] initWithStyle:v7];
  gradientColorSliderUICoordinatorImpl = self->_gradientColorSliderUICoordinatorImpl;
  self->_gradientColorSliderUICoordinatorImpl = v8;

  v10 = [[PUIStyleUICoordinator alloc] initWithInitialStyle:v7 suggested:0 coordinator:self->_gradientColorSliderUICoordinatorImpl];
  gradientColorSliderUICoordinator = self->_gradientColorSliderUICoordinator;
  self->_gradientColorSliderUICoordinator = v10;

  [(PUIStyleVariationSlider *)self->_gradientColorSlider setStyleCoordinator:self->_gradientColorSliderUICoordinator animated:1];
  v12 = [[_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl alloc] initWithStyle:v7];
  lumaSliderUICoordinatorImpl = self->_lumaSliderUICoordinatorImpl;
  self->_lumaSliderUICoordinatorImpl = v12;

  v14 = [[PUIStyleUICoordinator alloc] initWithInitialStyle:v7 suggested:0 coordinator:self->_lumaSliderUICoordinatorImpl];
  lumaSliderUICoordinator = self->_lumaSliderUICoordinator;
  self->_lumaSliderUICoordinator = v14;

  [(PUIStyleVariationSlider *)self->_lumaSlider setStyleCoordinator:self->_lumaSliderUICoordinator animated:1];
}

void __104__PUIStylePickerHomeScreenComponentViewController_navigateHomeScreenColorPickerSlidersToColor_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setAccentColor:v2];
  [v3 setStyleType:3];
}

- (void)_updateViewControllerForHomeScreenConfiguration:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v6 = (PUIStylePickerHomeScreenConfiguration *)a3;
  homeScreenConfiguration = self->_homeScreenConfiguration;
  if (v6)
  {
    if ([(PUIStylePickerHomeScreenConfiguration *)homeScreenConfiguration isEqual:v6]) {
      goto LABEL_25;
    }
    id v8 = (PUIStylePickerHomeScreenConfiguration *)[(PUIStylePickerHomeScreenConfiguration *)v6 copy];
    id v9 = self->_homeScreenConfiguration;
    self->_homeScreenConfiguration = v8;
  }
  else
  {
    id v6 = homeScreenConfiguration;
  }
  uint64_t v10 = [(PUIStylePickerHomeScreenConfiguration *)v6 styleType];
  BOOL v46 = v10 == 3;
  uint64_t v11 = objc_opt_new();
  v12 = (void *)v11;
  itemViews = self->_itemViews;
  if (!itemViews)
  {
    uint64_t v43 = v10;
    v45 = (void *)v11;
    v14 = objc_opt_new();
    v61[0] = xmmword_25A113390;
    v61[1] = unk_25A1133A0;
    v15 = [MEMORY[0x263F088C8] indexPathWithIndexes:v61 length:4];
    if ([v15 length])
    {
      unint64_t v16 = 0;
      do
      {
        uint64_t v17 = objc_msgSend(v15, "indexAtPosition:", v16, v43);
        objc_super v18 = objc_alloc_init(PUIStylePickerHomeScreenItemView);
        [(PUIStylePickerHomeScreenItemView *)v18 addTarget:self action:sel__selectedHomeScreenStyleTypeDidChange_ forControlEvents:64];
        [(PUIStylePickerHomeScreenItemView *)v18 setTag:v17];
        [v14 addObject:v18];

        ++v16;
      }
      while (v16 < [v15 length]);
    }
    v19 = (NSMutableArray *)objc_msgSend(v14, "copy", v43);
    v20 = self->_itemViews;
    self->_itemViews = v19;

    itemViews = self->_itemViews;
    v12 = v45;
    uint64_t v10 = v44;
  }
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke;
  v58[3] = &unk_265470EA0;
  id v6 = v6;
  v59 = v6;
  [(NSMutableArray *)itemViews enumerateObjectsUsingBlock:v58];
  if (!self->_homeScreenItemTypeHorizontalStackView)
  {
    v21 = (UIStackView *)[objc_alloc(MEMORY[0x263F1C9B8]) initWithArrangedSubviews:self->_itemViews];
    [(UIStackView *)v21 setAxis:0];
    [(UIStackView *)v21 setDistribution:1];
    [(UIStackView *)v21 setAlignment:1];
    [(UIStackView *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    homeScreenItemTypeHorizontalStackView = self->_homeScreenItemTypeHorizontalStackView;
    self->_homeScreenItemTypeHorizontalStackView = v21;
  }
  [(PUIStylePickerHomeScreenComponentViewController *)self _updateItemMarginsForHomeScreenConfiguration:v6];
  objc_msgSend(v12, "bs_safeAddObject:", self->_homeScreenItemTypeHorizontalStackView);
  if (!self->_gradientColorSlider)
  {
    v23 = [(PUIStyleVariationSlider *)[_PUIStylePickerHomeScreenVariationSlider alloc] initWithStyleCoordinator:self->_gradientColorSliderUICoordinator contextIdentifier:@"_gradientColorSlider"];
    gradientColorSlider = self->_gradientColorSlider;
    self->_gradientColorSlider = &v23->super;

    [(PUIStyleVariationSlider *)self->_gradientColorSlider setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUIStyleVariationSlider *)self->_gradientColorSlider addTarget:self action:sel__accentColorSlidersDidChangeValue_ forControlEvents:4096];
    v25 = [(PUIStyleVariationSlider *)self->_gradientColorSlider sliderGestureRecognizer];
    [v25 setDelegate:self];
  }
  lumaSlider = self->_lumaSlider;
  if (!lumaSlider)
  {
    v27 = [(PUIStyleVariationSlider *)[_PUIStylePickerHomeScreenVariationSlider alloc] initWithStyleCoordinator:self->_lumaSliderUICoordinator contextIdentifier:@"_lumaSlider"];
    v28 = self->_lumaSlider;
    self->_lumaSlider = &v27->super;

    [(PUIStyleVariationSlider *)self->_lumaSlider setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUIStyleVariationSlider *)self->_lumaSlider addTarget:self action:sel__accentColorSlidersDidChangeValue_ forControlEvents:4096];
    v29 = [(PUIStyleVariationSlider *)self->_lumaSlider sliderGestureRecognizer];
    [v29 setDelegate:self];

    lumaSlider = self->_lumaSlider;
  }
  v60[0] = self->_gradientColorSlider;
  v60[1] = lumaSlider;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:2];
  [v12 addObjectsFromArray:v30];

  primaryVerticalStackView = self->_primaryVerticalStackView;
  if (!primaryVerticalStackView)
  {
    v32 = (UIStackView *)[objc_alloc(MEMORY[0x263F1C9B8]) initWithArrangedSubviews:v12];
    [(UIStackView *)v32 setAxis:1];
    [(UIStackView *)v32 setDistribution:0];
    [(UIStackView *)v32 setAlignment:0];
    [(UIStackView *)v32 setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = self->_primaryVerticalStackView;
    self->_primaryVerticalStackView = v32;

    primaryVerticalStackView = self->_primaryVerticalStackView;
  }
  [(UIStackView *)primaryVerticalStackView setCustomSpacing:self->_homeScreenItemTypeHorizontalStackView afterView:32.0];
  [(UIStackView *)self->_primaryVerticalStackView setCustomSpacing:self->_gradientColorSlider afterView:22.0];
  if ([(PUIStylePickerHomeScreenComponentViewController *)self isViewLoaded])
  {
    v34 = [(UIStackView *)self->_primaryVerticalStackView superview];

    if (!v34)
    {
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_2;
      v57[3] = &unk_265470EC8;
      v57[4] = self;
      [MEMORY[0x263F1CB60] performWithoutAnimation:v57];
    }
  }
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_3;
  v54[3] = &unk_265470EF0;
  v54[4] = self;
  v54[5] = v10;
  BOOL v55 = v4;
  BOOL v56 = v46;
  v35 = (void *)MEMORY[0x25A2F6090](v54);
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_4;
  v53[3] = &unk_265470EC8;
  v53[4] = self;
  uint64_t v36 = MEMORY[0x25A2F6090](v53);
  v37 = (void *)v36;
  v38 = (void *)MEMORY[0x263F1CB60];
  if (v4)
  {
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_5;
    v50[3] = &unk_265470F18;
    v39 = (id *)&v51;
    uint64_t v51 = v36;
    v40 = &v52;
    id v52 = v35;
    id v41 = v37;
    [v38 animateWithSpringDuration:4 bounce:v50 initialSpringVelocity:0 delay:0.3 options:0.0 animations:0.0 completion:0.0];
  }
  else
  {
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_6;
    v47[3] = &unk_265470F18;
    v39 = (id *)&v48;
    uint64_t v48 = v36;
    v40 = &v49;
    id v49 = v35;
    id v42 = v37;
    [v38 performWithoutAnimation:v47];
  }

LABEL_25:
}

void __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F088C8];
  v20[0] = xmmword_25A113390;
  v20[1] = unk_25A1133A0;
  id v6 = a2;
  v7 = [v5 indexPathWithIndexes:v20 length:4];
  uint64_t v8 = [v7 indexAtPosition:a3];

  id v9 = _PUIStylePickerHomeScreenCAAssetFromPUIHomeScreenStyleType(v8);
  if (v8 == 1)
  {
    uint64_t v11 = [MEMORY[0x263F1C550] colorWithRed:0.08 green:0.08 blue:0.08 alpha:1.0];
    v12 = objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", 0.19, 0.19, 0.19, 1.0, v11);
    uint64_t v10 = 0;
    v18[1] = v12;
    v13 = v18;
  }
  else
  {
    if (v8 != 3)
    {
      v14 = 0;
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    uint64_t v10 = [*(id *)(a1 + 32) accentColor];
    uint64_t v11 = [MEMORY[0x263F1C550] colorWithRed:0.08 green:0.08 blue:0.08 alpha:1.0];
    v19[0] = v11;
    v12 = [MEMORY[0x263F1C550] colorWithRed:0.19 green:0.19 blue:0.19 alpha:1.0];
    v19[1] = v12;
    v13 = v19;
  }
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

LABEL_7:
  [*(id *)(a1 + 32) iconContinuousCornerRadius];
  objc_msgSend(v6, "setIconContinuousCornerRadius:");
  [*(id *)(a1 + 32) iconSize];
  objc_msgSend(v6, "setIconSize:");
  v15 = [v6 assetView];
  [v9 configureAssetPackageView:v15 withColorStops:v14 accentColor:v10];

  unint64_t v16 = [v6 label];

  uint64_t v17 = LocalizedNSStringFromPUIHomeScreenStyle(v8);
  [v16 setText:v17];
}

void __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 addSubview:*(void *)(*(void *)(a1 + 32) + 976)];
}

uint64_t __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSelectionForType:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
  LOBYTE(v2) = *(unsigned char *)(a1 + 49);
  [*(id *)(*(void *)(a1 + 32) + 1096) setAlpha:(double)v2];
  id v3 = *(void **)(*(void *)(a1 + 32) + 1088);
  LOBYTE(v4) = *(unsigned char *)(a1 + 49);
  double v5 = (double)v4;
  return [v3 setAlpha:v5];
}

uint64_t __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_4(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  [v2 _calculateEstimatedHeight];
  objc_msgSend(v2, "setEstimatedHeight:notifyDelegate:", 0);
  id v3 = *(void **)(a1 + 32);
  return [v3 _notifyDelegateOfUpdatedEstimatedHeight];
}

uint64_t __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  unint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __108__PUIStylePickerHomeScreenComponentViewController__updateViewControllerForHomeScreenConfiguration_animated___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  unint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_updateLayoutConstraints
{
  v60[5] = *MEMORY[0x263EF8340];
  if ([(PUIStylePickerHomeScreenComponentViewController *)self isViewLoaded])
  {
    id v3 = [(PUIStylePickerHomeScreenComponentViewController *)self homeScreenConfiguration];
    uint64_t v4 = [v3 styleType];
    v50 = v3;
    [v3 iconSize];
    double v6 = v5;
    double v8 = v7;
    id v9 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    double v11 = 31.0;
    double v12 = 31.0;
    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      v13 = [(PUIStylePickerHomeScreenComponentViewController *)self homeScreenConfiguration];
      [v13 layoutInsets];
      double v12 = v14;
      double v11 = v15;
    }
    id v49 = objc_opt_new();
    unint64_t v16 = objc_opt_new();
    v59[0] = @"leadingMargin";
    uint64_t v17 = [NSNumber numberWithDouble:v12];
    v60[0] = v17;
    v59[1] = @"trailingMargin";
    objc_super v18 = [NSNumber numberWithDouble:v11];
    v60[1] = v18;
    v59[2] = @"itemMinHeight";
    v19 = NSNumber;
    +[PUIStylePickerHomeScreenItemView defaultSizeForIconSize:](PUIStylePickerHomeScreenItemView, "defaultSizeForIconSize:", v6, v8);
    uint64_t v21 = [v19 numberWithDouble:v20];
    void v60[2] = v21;
    v59[3] = @"topMargin";
    v22 = [NSNumber numberWithInt:0];
    v60[3] = v22;
    v59[4] = @"bottomMargin";
    if (v4 == 3) {
      uint64_t v23 = 21;
    }
    else {
      uint64_t v23 = 18;
    }
    v24 = [NSNumber numberWithInt:v23];
    v60[4] = v24;
    v25 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:5];

    homeScreenItemTypeHorizontalStackView = self->_homeScreenItemTypeHorizontalStackView;
    v57[0] = @"homeScreenItemHorizStackView";
    v57[1] = @"primaryVerticalStackView";
    primaryVerticalStackView = self->_primaryVerticalStackView;
    v58[0] = homeScreenItemTypeHorizontalStackView;
    v58[1] = primaryVerticalStackView;
    uint64_t v28 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
    if (self->_primaryLayoutConstraints)
    {
      objc_msgSend(v16, "addObjectsFromArray:");
      primaryLayoutConstraints = self->_primaryLayoutConstraints;
      self->_primaryLayoutConstraints = 0;
    }
    uint64_t v46 = 1040;
    uint64_t v48 = v16;
    v30 = objc_opt_new();
    v31 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-topMargin-[primaryVerticalStackView]-bottomMargin-|" options:512 metrics:v25 views:v28];
    [v30 addObjectsFromArray:v31];

    v32 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-leadingMargin-[primaryVerticalStackView]-trailingMargin-|" options:512 metrics:v25 views:v28];
    [v30 addObjectsFromArray:v32];

    v47 = (void *)v28;
    v33 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[homeScreenItemHorizStackView(>=itemMinHeight)]" options:512 metrics:v25 views:v28];
    [v30 addObjectsFromArray:v33];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    lumaSlider = self->_lumaSlider;
    v55[0] = self->_gradientColorSlider;
    v55[1] = lumaSlider;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v52 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          id v41 = objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v40, 7, 1, self->_primaryVerticalStackView, 7, 1.0, 0.0, v46);
          [v30 addObject:v41];

          id v42 = [v40 heightAnchor];
          +[PUIStyleVariationSlider defaultHeight];
          uint64_t v43 = objc_msgSend(v42, "constraintEqualToConstant:");
          [v30 addObject:v43];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v37);
    }

    uint64_t v44 = (objc_class *)[v30 copy];
    v45 = *(Class *)((char *)&self->super.super.super.isa + v46);
    *(Class *)((char *)&self->super.super.super.isa + v46) = v44;

    [v49 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.isa + v46)];
    if ([v48 count]) {
      [MEMORY[0x263F08938] deactivateConstraints:v48];
    }
    if (objc_msgSend(v49, "count", v46)) {
      [MEMORY[0x263F08938] activateConstraints:v49];
    }
  }
}

- (double)_calculateEstimatedHeight
{
  id v3 = [MEMORY[0x263F29CA0] sharedInstance];
  int v4 = [v3 deviceClass];

  double v5 = [MEMORY[0x263F29CA0] sharedInstance];
  uint64_t v6 = [v5 homeButtonType];

  double v7 = [(PUIStylePickerHomeScreenComponentViewController *)self homeScreenConfiguration];
  uint64_t v8 = [v7 styleType];
  [v7 iconSize];
  +[PUIStylePickerHomeScreenItemView defaultSizeForIconSize:](PUIStylePickerHomeScreenItemView, "defaultSizeForIconSize:");
  double v10 = v9;
  if (v8 == 3)
  {
    +[PUIStyleVariationSlider defaultHeight];
    double v12 = v11 + v10 + 0.0 + 32.0 + v11 + 22.0;
    double v13 = 21.0;
  }
  else
  {
    double v12 = v9 + 0.0;
    double v13 = 18.0;
  }
  double v14 = v12 + v13;
  if (v6 != 2 && v4 == 0) {
    double v16 = v14 + 33.0;
  }
  else {
    double v16 = v14;
  }
  uint64_t v17 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v18 = [v17 userInterfaceIdiom];

  if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v16 = v16 + 22.0;
  }

  return v16;
}

- (double)_calculateStyleItemSpacing
{
  id v3 = [(PUIStylePickerHomeScreenComponentViewController *)self homeScreenConfiguration];
  [v3 iconSpacing];
  int v4 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    uint64_t v6 = [(PUIStylePickerHomeScreenComponentViewController *)self view];
    [v6 bounds];
  }
  double v7 = [(PUIStylePickerHomeScreenComponentViewController *)self traitCollection];
  [v7 displayScale];
  UIRoundToScale();
  double v9 = v8;

  return v9;
}

- (void)_updateItemMarginsForHomeScreenConfiguration:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(PUIStylePickerHomeScreenComponentViewController *)self homeScreenConfiguration];
  }
  id v13 = v4;
  [(PUIStylePickerHomeScreenComponentViewController *)self _calculateStyleItemSpacing];
  double v6 = v5;
  double v7 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v9 = 0.0;
    double v10 = v6;
    double v11 = v6;
    double v12 = 0.0;
  }
  else
  {
    [v13 layoutInsets];
  }
  -[UIStackView setLayoutMargins:](self->_homeScreenItemTypeHorizontalStackView, "setLayoutMargins:", v9, v10, v12, v11);
  [(UIStackView *)self->_homeScreenItemTypeHorizontalStackView setSpacing:v6];
}

- (void)_updateSelectionForType:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  v11[0] = xmmword_25A113390;
  v11[1] = unk_25A1133A0;
  double v7 = [MEMORY[0x263F088C8] indexPathWithIndexes:v11 length:4];
  if ([v7 length])
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [v7 indexAtPosition:v8];
      double v10 = [(NSMutableArray *)self->_itemViews objectAtIndexedSubscript:v8];
      [v10 setSelected:v9 == a3 animated:v4];

      ++v8;
    }
    while (v8 < [v7 length]);
  }
}

- (void)_accentColorSlidersDidChangeValue:(id)a3
{
  if (self->_gradientColorSlider == a3)
  {
    [(_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl *)self->_gradientColorSliderUICoordinatorImpl resetSaturation];
    lumaSliderUICoordinatorImpl = self->_lumaSliderUICoordinatorImpl;
    double v5 = [(PUIStyleUICoordinatorImpl *)self->_gradientColorSliderUICoordinatorImpl style];
    [(_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl *)lumaSliderUICoordinatorImpl gradientSliderDidChange:v5];
  }
  double v6 = [(PUIStyleUICoordinatorImpl *)self->_lumaSliderUICoordinatorImpl style];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__PUIStylePickerHomeScreenComponentViewController__accentColorSlidersDidChangeValue___block_invoke;
  v8[3] = &unk_265470E78;
  id v9 = v6;
  id v7 = v6;
  [(PUIStylePickerHomeScreenComponentViewController *)self _mutateHomeScreenConfiguration:v8];
}

uint64_t __85__PUIStylePickerHomeScreenComponentViewController__accentColorSlidersDidChangeValue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAccentStyle:*(void *)(a1 + 32)];
}

- (void)_notifyDelegateOfUpdatedHomeScreenConfiguration
{
  id v3 = [(PUIStylePickerHomeScreenComponentViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(PUIStylePickerHomeScreenComponentViewController *)self delegate];
    double v5 = [(PUIStylePickerHomeScreenComponentViewController *)self homeScreenConfiguration];
    [v6 homeScreenComponentViewController:self didUpdateHomeScreenConfiguration:v5];
  }
}

- (void)_notifyDelegateOfUpdatedEstimatedHeight
{
  id v3 = [(PUIStylePickerHomeScreenComponentViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PUIStylePickerHomeScreenComponentViewController *)self delegate];
    [v5 homeScreenComponentViewControllerUpdatedEstimatedHeight:self];
  }
}

- (BOOL)_gestureRecognizer:(id)a3 canBeCancelledByGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)_gestureRecognizer:(id)a3 canCancelGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (PUIStylePickerHomeScreenConfiguration)homeScreenConfiguration
{
  return self->_homeScreenConfiguration;
}

- (void)setHomeScreenConfiguration:(id)a3
{
}

- (PUIStylePickerHomeScreenComponentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUIStylePickerHomeScreenComponentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)estimatedHeight
{
  return self->_estimatedHeight;
}

- (unint64_t)selectedHomescreenStyleType
{
  return self->_selectedHomescreenStyleType;
}

- (void)setSelectedHomescreenStyleType:(unint64_t)a3
{
  self->_selectedHomescreenStyleType = a3;
}

- (PUIStyleVariationSlider)gradientColorSlider
{
  return self->_gradientColorSlider;
}

- (void)setGradientColorSlider:(id)a3
{
}

- (PUIStyleVariationSlider)lumaSlider
{
  return self->_lumaSlider;
}

- (void)setLumaSlider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lumaSlider, 0);
  objc_storeStrong((id *)&self->_gradientColorSlider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeScreenConfiguration, 0);
  objc_storeStrong((id *)&self->_sliderLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_primaryLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_hiddenView, 0);
  objc_storeStrong((id *)&self->_lumaSliderUICoordinatorImpl, 0);
  objc_storeStrong((id *)&self->_gradientColorSliderUICoordinatorImpl, 0);
  objc_storeStrong((id *)&self->_lumaSliderUICoordinator, 0);
  objc_storeStrong((id *)&self->_gradientColorSliderUICoordinator, 0);
  objc_storeStrong((id *)&self->_homeScreenItemTypeHorizontalStackView, 0);
  objc_storeStrong((id *)&self->_itemViews, 0);
  objc_storeStrong((id *)&self->_primaryVerticalStackView, 0);
}

@end