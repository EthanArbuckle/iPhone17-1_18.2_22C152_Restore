@interface PREditingColorItemsViewController
- (NSArray)allItemViews;
- (NSArray)allViews;
- (NSArray)horizontalStackViews;
- (NSLayoutConstraint)stackViewLeadingConstraint;
- (NSLayoutConstraint)stackViewTrailingConstraint;
- (PREditingColorItem)selectedColorItem;
- (PREditingColorItemView)selectedColorItemView;
- (PREditingColorItemsDataSource)dataSource;
- (PREditingColorItemsViewController)initWithDataSource:(id)a3 configuration:(id)a4 variationStore:(id)a5;
- (PREditingColorItemsViewControllerDelegate)delegate;
- (PREditingColorVariationStore)variationStore;
- (PREditorColorPickerConfiguration)configuration;
- (PUIColorWell)colorWell;
- (PUIColorWellView)colorWellView;
- (UIStackView)stackView;
- (double)configuredViewWidth;
- (double)contentsLuminance;
- (double)estimatedHeight;
- (double)interitemSpacing;
- (id)selectedColorItemForColor:(id)a3 fromDataSource:(id)a4 withVariationStore:(id)a5 contextIdentifier:(id)a6 isDataLayerPicker:(BOOL)a7;
- (id)selectedColorItemForColor:(id)a3 fromVariationStore:(id)a4 inDataSource:(id)a5 contextIdentifier:(id)a6 isDataLayerPicker:(BOOL)a7;
- (void)colorWellDidUpdateColor:(id)a3;
- (void)deselectSelectedColor;
- (void)didSelectColorItem:(id)a3;
- (void)didTapColorItem:(id)a3;
- (void)didTapToResetColorItem:(id)a3;
- (void)layoutWithItemViews:(id)a3;
- (void)setAllItemViews:(id)a3;
- (void)setAllViews:(id)a3;
- (void)setColorWell:(id)a3;
- (void)setColorWellView:(id)a3;
- (void)setConfiguredViewWidth:(double)a3;
- (void)setContentsLuminance:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHorizontalStackViews:(id)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setSelectedColorItem:(id)a3;
- (void)setSelectedColorItemView:(id)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewLeadingConstraint:(id)a3;
- (void)setStackViewTrailingConstraint:(id)a3;
- (void)setVariationStore:(id)a3;
- (void)setupItemViews;
- (void)sliderDidChangeForColorItem:(id)a3;
- (void)updateLayoutForCurrentSize;
- (void)updateVibrantMaterialItemForLuminance;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PREditingColorItemsViewController

- (PREditingColorItemsViewController)initWithDataSource:(id)a3 configuration:(id)a4 variationStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PREditingColorItemsViewController;
  v12 = [(PREditingColorItemsViewController *)&v24 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a3);
    objc_storeStrong((id *)&v13->_configuration, a4);
    objc_storeStrong((id *)&v13->_variationStore, a5);
    v14 = [v10 selectedColor];
    if (v14)
    {
      v15 = [v10 identifier];
      uint64_t v16 = [v10 context];
      [(PREditingColorItemsViewController *)v13 selectedColorItemForColor:v14 fromVariationStore:v11 inDataSource:v9 contextIdentifier:v15 isDataLayerPicker:v16 == 1];
      v17 = (PREditingColorItem *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        [(PREditingColorItemsViewController *)v13 selectedColorItemForColor:v14 fromDataSource:v9 withVariationStore:v11 contextIdentifier:v15 isDataLayerPicker:v16 == 1];
        v17 = (PREditingColorItem *)objc_claimAutoreleasedReturnValue();
      }

      if (v17) {
        goto LABEL_14;
      }
    }
    else
    {
      v17 = [(PREditingColorItemsDataSource *)v13->_dataSource colorItemForIndex:0];
      if (v17)
      {
LABEL_14:
        selectedColorItem = v13->_selectedColorItem;
        v13->_selectedColorItem = v17;

        goto LABEL_15;
      }
    }
    if ([v10 context] == 1)
    {
      uint64_t v18 = [v14 preferredStyle];
      v19 = [PREditorColorPickerVibrantColor alloc];
      double v20 = 0.0;
      if (v18 == 1) {
        double v20 = 1.0;
      }
    }
    else
    {
      v19 = [PREditorColorPickerConstantColor alloc];
      double v20 = 0.0;
    }
    v21 = [(PREditorColorPickerVibrantColor *)v19 initWithColor:v14 initialVariation:v20];
    v17 = [[PREditingColorItem alloc] initWithPickerColor:v21 variation:[(PREditorColorPickerConfiguration *)v13->_configuration context] context:0.0];
    [(PREditingColorItem *)v17 setFromUIKitColorPicker:1];

    goto LABEL_14;
  }
LABEL_15:

  return v13;
}

- (id)selectedColorItemForColor:(id)a3 fromVariationStore:(id)a4 inDataSource:(id)a5 contextIdentifier:(id)a6 isDataLayerPicker:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a5;
  double v27 = 0.0;
  id v13 = a6;
  id v14 = a4;
  v15 = [a3 color];
  uint64_t v16 = [v14 baseColorForVariedColor:v15 forContextIdentifier:v13 variation:&v27 forDataLayerPicker:v7];

  if (v16)
  {
    v17 = [[PRPosterColor alloc] initWithColor:v16];
    if ([(PREditorColorPickerConfiguration *)self->_configuration context] == 1) {
      uint64_t v18 = PREditorColorPickerVibrantColor;
    }
    else {
      uint64_t v18 = PREditorColorPickerConstantColor;
    }
    id v20 = [v18 alloc];
    v21 = (void *)[v20 initWithColor:v17 initialVariation:v27];
    v22 = [PREditingColorItem alloc];
    [v21 initialVariation];
    v19 = [(PREditingColorItem *)v22 initWithPickerColor:v21 variation:[(PREditorColorPickerConfiguration *)self->_configuration context] context:v23];
    uint64_t v24 = [v12 indexForItem:v19];
    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(PREditingColorItem *)v19 setFromUIKitColorPicker:1];
    }
    else
    {
      v25 = [v12 colorItemForIndex:v24];
      -[PREditingColorItem setShowsSlider:](v19, "setShowsSlider:", [v25 shouldShowSlider]);
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)selectedColorItemForColor:(id)a3 fromDataSource:(id)a4 withVariationStore:(id)a5 contextIdentifier:(id)a6 isDataLayerPicker:(BOOL)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __133__PREditingColorItemsViewController_selectedColorItemForColor_fromDataSource_withVariationStore_contextIdentifier_isDataLayerPicker___block_invoke;
  v30[3] = &unk_1E54DB970;
  id v14 = v12;
  id v31 = v14;
  id v15 = v13;
  id v32 = v15;
  id v16 = v10;
  id v33 = v16;
  v17 = [v11 firstColorItemPassingTest:v30];
  if (!v17)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __133__PREditingColorItemsViewController_selectedColorItemForColor_fromDataSource_withVariationStore_contextIdentifier_isDataLayerPicker___block_invoke_2;
    v28[3] = &unk_1E54DB998;
    id v18 = v16;
    id v29 = v18;
    v19 = [v11 firstColorItemPassingTest:v28];
    if (v19)
    {
      id v20 = v19;
      v21 = [v19 pickerColor];
      if ([v21 isVibrantColor])
      {
        v22 = [v18 color];
        double v27 = 1.0;
        [v22 getWhite:0 alpha:&v27];
        [v21 variationForAlpha:v27];
      }
      else
      {
        v22 = [v18 hslValues];
        [v22 luminance];
        objc_msgSend(v21, "variationForLuminance:");
      }
      double v24 = v23;

      v25 = [[PREditingColorItem alloc] initWithPickerColor:v21 variation:0 context:v24];
    }
  }
  return v17;
}

uint64_t __133__PREditingColorItemsViewController_selectedColorItemForColor_fromDataSource_withVariationStore_contextIdentifier_isDataLayerPicker___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 pickerColor];
  v5 = [*(id *)(a1 + 32) variationForPickerColor:v4 forContextIdentifier:*(void *)(a1 + 40)];
  [v4 initialVariation];
  if (v5) {
    [v5 doubleValue];
  }
  double v7 = v6;
  v8 = [v3 pickerColor];
  id v9 = [v8 colorWithVariation:v7];

  char v10 = [v9 isEqual:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 48) isVibrantMaterialColor]) {
    int v11 = 0;
  }
  else {
    int v11 = [*(id *)(a1 + 48) isVibrantMonochromeColor] ^ 1;
  }
  id v12 = [v9 colorValues];
  id v13 = [*(id *)(a1 + 48) colorValues];
  unsigned int v14 = [v12 isEqual:v13];

  if (v10) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = v11 & v14;
  }

  return v15;
}

uint64_t __133__PREditingColorItemsViewController_selectedColorItemForColor_fromDataSource_withVariationStore_contextIdentifier_isDataLayerPicker___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 pickerColor];
  if ([v3 isCustomColor])
  {
    uint64_t v4 = 0;
  }
  else
  {
    v5 = [v3 baseColor];
    double v6 = [*(id *)(a1 + 32) hslValues];
    double v7 = [v5 hslValues];
    if ([v3 isVibrantColor])
    {
      [v6 hue];
      double v9 = v8;
      [v7 hue];
      if (v9 == v10)
      {
        [v6 saturation];
        double v12 = v11;
        [v7 saturation];
        if (v12 == v13)
        {
          [v6 luminance];
          double v15 = v14;
          [v7 luminance];
          if (v15 == v16) {
            goto LABEL_9;
          }
        }
      }
    }
    [v6 hue];
    double v18 = v17;
    [v7 hue];
    if (v18 == v19 && ([v6 saturation], double v21 = v20, objc_msgSend(v7, "saturation"), v21 == v22)) {
LABEL_9:
    }
      uint64_t v4 = 1;
    else {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PREditingColorItemsViewController;
  [(PREditingColorItemsViewController *)&v3 viewDidLoad];
  [(PREditingColorItemsViewController *)self setupItemViews];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PREditingColorItemsViewController;
  [(PREditingColorItemsViewController *)&v3 viewDidLayoutSubviews];
  [(PREditingColorItemsViewController *)self updateLayoutForCurrentSize];
}

- (void)setupItemViews
{
  id v18 = [(PREditingColorItemsViewController *)self selectedColorItem];
  uint64_t v3 = [(PREditingColorItemsDataSource *)self->_dataSource numberOfItems];
  double v19 = [MEMORY[0x1E4F1CA48] array];
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      v5 = [(PREditingColorItemsDataSource *)self->_dataSource colorItemForIndex:v4];
      double v6 = [[PREditingColorItemView alloc] initWithColorItem:v5];
      double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didTapColorItem_];
      [(PREditingColorItemView *)v6 addGestureRecognizer:v7];
      if ([v5 isEqual:v18])
      {
        [(PRSelectableEditingItemView *)v6 setSelected:1];
        [(PREditingColorItemsViewController *)self setSelectedColorItemView:v6];
      }
      [(PREditingColorItemView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v19 addObject:v6];
      ++v4;
    }
    while (v3 != v4);
  }
  double v8 = (NSArray *)[v19 copy];
  allItemViews = self->_allItemViews;
  self->_allItemViews = v8;

  [(PREditingColorItemsViewController *)self updateVibrantMaterialItemForLuminance];
  double v10 = [MEMORY[0x1E4F1CA48] arrayWithArray:v19];
  if ([(PREditorColorPickerConfiguration *)self->_configuration colorWellDisplayMode] == 1)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F927B8]);
    double v12 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v13 = [v12 colorWell];
    [v13 addTarget:self action:sel_colorWellDidUpdateColor_ forControlEvents:4096];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(NSArray *)v10 addObject:v12];
    objc_storeStrong((id *)&self->_colorWell, v13);
    if ([(PREditingColorItem *)self->_selectedColorItem isFromUIKitColorPicker])
    {
      double v14 = [(PREditingColorItem *)self->_selectedColorItem displayColor];
      double v15 = [v14 color];
      [v13 setSelectedColor:v15];
    }
  }
  allViews = self->_allViews;
  self->_allViews = v10;
  double v17 = v10;

  [(PREditingColorItemsViewController *)self layoutWithItemViews:v17];
}

- (void)didTapColorItem:(id)a3
{
  id v6 = [a3 view];
  uint64_t v4 = [v6 colorItem];
  if ([v6 isSelected])
  {
    v5 = [v4 pickerColor];
    [v5 initialVariation];
    objc_msgSend(v4, "setVariation:");

    [v6 updateForChangedColor];
    [(PREditingColorItemsViewController *)self didTapToResetColorItem:v4];
  }
  else
  {
    [(PREditingColorItemsViewController *)self setSelectedColorItem:v4];
    [(PREditingColorItemsViewController *)self didSelectColorItem:v4];
  }
}

- (void)layoutWithItemViews:(id)a3
{
  v45[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v5 = [v3 count] / 6uLL;
  if (__ROR8__(0xAAAAAAAAAAAAAAABLL * [v3 count], 1) <= 0x2AAAAAAAAAAAAAAAuLL) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v5 + 1;
  }
  double v7 = [MEMORY[0x1E4F1CA48] array];
  if (v6)
  {
    uint64_t v8 = 0;
    for (uint64_t i = 0; i != v6; ++i)
    {
      double v10 = [MEMORY[0x1E4F1CA48] array];
      for (uint64_t j = 0; j != 6; ++j)
      {
        if ([v3 count] <= (unint64_t)(v8 + j)) {
          break;
        }
        double v12 = objc_msgSend(v3, "objectAtIndexedSubscript:");
        [v10 addObject:v12];
      }
      double v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v10];
      [v13 setAxis:0];
      [v13 setDistribution:3];
      [v13 setAlignment:1];
      [v13 setSpacing:14.0];
      [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v7 addObject:v13];
      [v4 addObject:v13];

      v8 += 6;
    }
  }
  v43 = v7;
  double v14 = (UIStackView *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v7];
  [(UIStackView *)v14 setAxis:1];
  [(UIStackView *)v14 setDistribution:3];
  [(UIStackView *)v14 setAlignment:3];
  [(UIStackView *)v14 setSpacing:14.0];
  [(UIStackView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  stackView = self->_stackView;
  self->_stackView = v14;
  double v16 = v14;

  v42 = v4;
  double v17 = (NSArray *)[v4 copy];
  horizontalStackViews = self->_horizontalStackViews;
  self->_horizontalStackViews = v17;

  double v19 = [(PREditingColorItemsViewController *)self view];
  [v19 addSubview:v16];

  double v20 = v16;
  double v21 = [(UIStackView *)v16 leadingAnchor];
  double v22 = [(PREditingColorItemsViewController *)self view];
  double v23 = [v22 leadingAnchor];
  double v24 = [v21 constraintEqualToAnchor:v23 constant:31.0];

  stackViewLeadingConstraint = self->_stackViewLeadingConstraint;
  self->_stackViewLeadingConstraint = v24;
  v41 = v24;

  v26 = [(UIStackView *)v16 trailingAnchor];
  double v27 = [(PREditingColorItemsViewController *)self view];
  v28 = [v27 trailingAnchor];
  id v29 = [v26 constraintEqualToAnchor:v28 constant:-31.0];

  stackViewTrailingConstraint = self->_stackViewTrailingConstraint;
  self->_stackViewTrailingConstraint = v29;
  v40 = v29;

  v45[0] = v41;
  v45[1] = v40;
  v38 = [(UIStackView *)v16 bottomAnchor];
  v39 = [(PREditingColorItemsViewController *)self view];
  id v31 = [v39 bottomAnchor];
  id v32 = [v38 constraintEqualToAnchor:v31];
  v45[2] = v32;
  id v33 = [(UIStackView *)v16 topAnchor];
  v34 = [(PREditingColorItemsViewController *)self view];
  v35 = [v34 topAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  v45[3] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v37];
  [(PREditingColorItemsViewController *)self updateLayoutForCurrentSize];
}

- (void)updateLayoutForCurrentSize
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(PREditingColorItemsViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  double v6 = (v5 + -326.0) / 5.0;
  if (v6 != self->_interitemSpacing)
  {
    self->_interitemSpacing = v6;
    [(UIStackView *)self->_stackView setSpacing:(v5 + -326.0) / 5.0];
    [(UIStackView *)self->_stackView setNeedsLayout];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v7 = self->_horizontalStackViews;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          objc_msgSend(v12, "setSpacing:", (v5 + -326.0) / 5.0, (void)v25);
          [v12 setNeedsLayout];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v9);
    }

    double v13 = [(PREditingColorItemsViewController *)self delegate];
    [v13 colorItemsViewControllerDidUpdateEstimatedSize:self];
  }
  if (v5 != self->_configuredViewWidth)
  {
    double v14 = [(PREditingColorItemsViewController *)self stackViewLeadingConstraint];
    [v14 constant];
    double v16 = v15;
    double v17 = [(PREditingColorItemsViewController *)self stackViewTrailingConstraint];
    [v17 constant];
    double v19 = v16 - v18;

    if (v5 + -264.0 >= v19) {
      double v20 = 31.0;
    }
    else {
      double v20 = (v5 + -264.0) * 0.5;
    }
    double v21 = [(PREditingColorItemsViewController *)self stackViewLeadingConstraint];
    double v22 = v21;
    if (v20 >= 0.0) {
      double v23 = v20;
    }
    else {
      double v23 = 0.0;
    }
    [v21 setConstant:v23];

    double v24 = [(PREditingColorItemsViewController *)self stackViewTrailingConstraint];
    objc_msgSend(v24, "setConstant:", fmin(-v20, 0.0));

    self->_configuredViewWidth = v5;
  }
}

- (double)estimatedHeight
{
  uint64_t v3 = [(PREditingColorItemsDataSource *)self->_dataSource numberOfItems];
  if ([(PREditorColorPickerConfiguration *)self->_configuration colorWellDisplayMode] == 1) {
    uint64_t v4 = v3 + 1;
  }
  else {
    uint64_t v4 = v3;
  }
  if (v4 % 6) {
    uint64_t v5 = v4 / 6 + 1;
  }
  else {
    uint64_t v5 = v4 / 6;
  }
  return self->_interitemSpacing * (double)(v5 - 1) + (double)v5 * 44.0;
}

- (void)setContentsLuminance:(double)a3
{
  self->_contentsLuminance = a3;
  if ([(PREditingColorItemsViewController *)self isViewLoaded])
  {
    [(PREditingColorItemsViewController *)self updateVibrantMaterialItemForLuminance];
  }
}

- (void)updateVibrantMaterialItemForLuminance
{
  uint64_t v3 = [(PREditingColorItemsDataSource *)self->_dataSource firstColorItemPassingTest:&__block_literal_global_15];
  if (v3)
  {
    id v6 = v3;
    uint64_t v4 = [v3 pickerColor];
    [v4 setContentsLuminance:self->_contentsLuminance];
    uint64_t v5 = [(NSArray *)self->_allItemViews objectAtIndex:[(PREditingColorItemsDataSource *)self->_dataSource indexForItem:v6]];
    [v5 updateForChangedColor];

    uint64_t v3 = v6;
  }
}

uint64_t __74__PREditingColorItemsViewController_updateVibrantMaterialItemForLuminance__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 color];
  uint64_t v3 = [v2 isVibrantMonochromeColor];

  return v3;
}

- (void)didSelectColorItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PREditingColorItemsViewController *)self delegate];
  [v5 colorItemsViewController:self didSelectColorItem:v4];
}

- (void)didTapToResetColorItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PREditingColorItemsViewController *)self delegate];
  [v5 colorItemsViewController:self didTapToResetColorItem:v4];
}

- (void)deselectSelectedColor
{
  [(PRSelectableEditingItemView *)self->_selectedColorItemView setSelected:0];
  selectedColorItemView = self->_selectedColorItemView;
  self->_selectedColorItemView = 0;

  selectedColorItem = self->_selectedColorItem;
  self->_selectedColorItem = 0;

  [(PUIColorWell *)self->_colorWell setSelectedColor:0];
  [(PUIColorWell *)self->_colorWell invalidateIntrinsicContentSize];
  colorWellView = self->_colorWellView;
  [(PUIColorWellView *)colorWellView setNeedsLayout];
}

- (void)setSelectedColorItem:(id)a3
{
  id v5 = a3;
  id v16 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  if ([v5 isFromUIKitColorPicker])
  {
    [(PRSelectableEditingItemView *)self->_selectedColorItemView setSelected:0];
    selectedColorItemView = self->_selectedColorItemView;
    self->_selectedColorItemView = 0;

    objc_storeStrong((id *)&self->_selectedColorItem, a3);
    goto LABEL_11;
  }
  uint64_t v7 = [(PREditingColorItemsDataSource *)self->_dataSource indexForItem:v16];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [(NSArray *)self->_allItemViews objectAtIndexedSubscript:v7];
    objc_storeStrong((id *)&self->_selectedColorItem, a3);
    uint64_t v9 = [(PREditingColorItemsViewController *)self configuration];
    uint64_t v10 = [v9 identifier];

    id v11 = [v16 pickerColor];
    if (v11)
    {
      double v12 = [(PREditingColorVariationStore *)self->_variationStore variationForPickerColor:v11 forContextIdentifier:v10];
      if (!v12)
      {
        variationStore = self->_variationStore;
        [v11 initialVariation];
        -[PREditingColorVariationStore setVariation:forPickerColor:forContextIdentifier:](variationStore, "setVariation:forPickerColor:forContextIdentifier:", v11, v10);
      }
    }
    [(PRSelectableEditingItemView *)self->_selectedColorItemView setSelected:0];
    double v14 = self->_selectedColorItemView;
    self->_selectedColorItemView = v8;
    double v15 = v8;

    [(PRSelectableEditingItemView *)v15 setSelected:1];
  }
  else
  {
LABEL_5:
    [(PREditingColorItemsViewController *)self deselectSelectedColor];
  }
LABEL_11:
}

- (void)colorWellDidUpdateColor:(id)a3
{
  selectedColorItemView = self->_selectedColorItemView;
  id v5 = a3;
  [(PRSelectableEditingItemView *)selectedColorItemView setSelected:0];
  id v6 = self->_selectedColorItemView;
  self->_selectedColorItemView = 0;

  uint64_t v7 = [(PREditingColorItemsViewController *)self colorWell];
  [v7 invalidateIntrinsicContentSize];

  uint64_t v8 = [(PREditingColorItemsViewController *)self colorWellView];
  [v8 setNeedsLayout];

  uint64_t v9 = [PRPosterColor alloc];
  uint64_t v10 = [v5 selectedColor];

  id v11 = [(PRPosterColor *)v9 initWithColor:v10];
  unint64_t v12 = [(PREditorColorPickerConfiguration *)self->_configuration context];
  if (v12 == 1) {
    double v13 = 1.0;
  }
  else {
    double v13 = 0.0;
  }
  double v14 = off_1E54D9E70;
  if (v12 != 1) {
    double v14 = off_1E54D9E68;
  }
  id v22 = (id)[objc_alloc(*v14) initWithColor:v11 initialVariation:v13];
  double v15 = [PREditingColorItem alloc];
  [v22 initialVariation];
  double v17 = [(PREditingColorItem *)v15 initWithPickerColor:v22 variation:[(PREditorColorPickerConfiguration *)self->_configuration context] context:v16];
  [(PREditingColorItem *)v17 setFromUIKitColorPicker:1];
  objc_storeStrong((id *)&self->_selectedColorItem, v17);
  double v18 = [(PREditingColorItemsViewController *)self configuration];
  double v19 = [v18 identifier];

  double v20 = [(PREditingColorVariationStore *)self->_variationStore variationForPickerColor:v22 forContextIdentifier:v19];
  if (!v20)
  {
    variationStore = self->_variationStore;
    [v22 initialVariation];
    -[PREditingColorVariationStore setVariation:forPickerColor:forContextIdentifier:](variationStore, "setVariation:forPickerColor:forContextIdentifier:", v22, v19);
  }
  [(PREditingColorItemsViewController *)self didSelectColorItem:v17];
}

- (void)sliderDidChangeForColorItem:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v10 = v4;
    if (self->_colorWell && (id v4 = (id)[v4 isFromUIKitColorPicker], v5 = v10, v4))
    {
      colorWell = self->_colorWell;
      uint64_t v7 = [v10 color];
      uint64_t v8 = [v7 color];
      [(PUIColorWell *)colorWell setSelectedColor:v8];
    }
    else
    {
      if (!self->_selectedColorItemView) {
        goto LABEL_11;
      }
      uint64_t v7 = [v5 baseColor];
      uint64_t v8 = [(PREditingColorItem *)self->_selectedColorItem baseColor];
      if ([v7 isEqual:v8])
      {
        uint64_t v9 = [v10 itemView];

        id v5 = v10;
        if (v9) {
          goto LABEL_11;
        }
        id v4 = (id)[(PREditingColorItemView *)self->_selectedColorItemView updateForChangedColor];
        goto LABEL_10;
      }
    }

LABEL_10:
    id v5 = v10;
  }
LABEL_11:
  MEMORY[0x1F41817F8](v4, v5);
}

- (PREditingColorItemsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PREditingColorItemsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PREditingColorItem)selectedColorItem
{
  return self->_selectedColorItem;
}

- (PREditingColorItemView)selectedColorItemView
{
  return self->_selectedColorItemView;
}

- (void)setSelectedColorItemView:(id)a3
{
}

- (PREditorColorPickerConfiguration)configuration
{
  return self->_configuration;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (PREditingColorItemsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (PREditingColorVariationStore)variationStore
{
  return self->_variationStore;
}

- (void)setVariationStore:(id)a3
{
}

- (NSArray)allItemViews
{
  return self->_allItemViews;
}

- (void)setAllItemViews:(id)a3
{
}

- (NSArray)allViews
{
  return self->_allViews;
}

- (void)setAllViews:(id)a3
{
}

- (double)configuredViewWidth
{
  return self->_configuredViewWidth;
}

- (void)setConfiguredViewWidth:(double)a3
{
  self->_configuredViewWidth = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (NSLayoutConstraint)stackViewLeadingConstraint
{
  return self->_stackViewLeadingConstraint;
}

- (void)setStackViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewTrailingConstraint
{
  return self->_stackViewTrailingConstraint;
}

- (void)setStackViewTrailingConstraint:(id)a3
{
}

- (NSArray)horizontalStackViews
{
  return self->_horizontalStackViews;
}

- (void)setHorizontalStackViews:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (PUIColorWell)colorWell
{
  return self->_colorWell;
}

- (void)setColorWell:(id)a3
{
}

- (PUIColorWellView)colorWellView
{
  return self->_colorWellView;
}

- (void)setColorWellView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorWellView, 0);
  objc_storeStrong((id *)&self->_colorWell, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_horizontalStackViews, 0);
  objc_storeStrong((id *)&self->_stackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_allViews, 0);
  objc_storeStrong((id *)&self->_allItemViews, 0);
  objc_storeStrong((id *)&self->_variationStore, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_selectedColorItemView, 0);
  objc_storeStrong((id *)&self->_selectedColorItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end