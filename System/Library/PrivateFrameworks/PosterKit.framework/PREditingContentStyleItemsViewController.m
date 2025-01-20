@interface PREditingContentStyleItemsViewController
- (NSArray)allItemViews;
- (NSArray)allViews;
- (NSArray)horizontalStackViews;
- (NSLayoutConstraint)stackViewLeadingConstraint;
- (NSLayoutConstraint)stackViewTrailingConstraint;
- (PREditingContentStyleItemView)selectedContentStyleItemView;
- (PREditingContentStyleItemsDataSource)dataSource;
- (PREditingContentStyleItemsViewController)initWithDataSource:(id)a3 configuration:(id)a4;
- (PREditingContentStyleItemsViewControllerDelegate)delegate;
- (PREditingPosterContentStyleCoordinator)selectedContentStyleCoordinator;
- (PREditingPosterContentStyleCoordinator)uiKitColorPickerStyleCoordinator;
- (PREditorContentStylePickerConfiguration)configuration;
- (PUIColorWell)colorWell;
- (PUIColorWellView)colorWellView;
- (UIStackView)stackView;
- (double)configuredViewWidth;
- (double)contentsLuminance;
- (double)estimatedHeight;
- (double)interitemSpacing;
- (void)_deselectColorWell;
- (void)_deselectSelectedContentStyle;
- (void)_didSelectContentStyleCoordinator:(id)a3;
- (void)_setupItemViews;
- (void)_updateLayoutForCurrentSize;
- (void)colorWellDidUpdateColor:(id)a3;
- (void)didTapContentStyleItem:(id)a3;
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
- (void)setSelectedContentStyle:(id)a3 fromUIKitPicker:(BOOL)a4;
- (void)setSelectedContentStyleCoordinator:(id)a3;
- (void)setSelectedContentStyleItemView:(id)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewLeadingConstraint:(id)a3;
- (void)setStackViewTrailingConstraint:(id)a3;
- (void)setUiKitColorPickerStyleCoordinator:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PREditingContentStyleItemsViewController

- (PREditingContentStyleItemsViewController)initWithDataSource:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PREditingContentStyleItemsViewController;
  v9 = [(PREditingContentStyleItemsViewController *)&v34 initWithNibName:0 bundle:0];
  v10 = v9;
  if (!v9) {
    goto LABEL_20;
  }
  objc_storeStrong((id *)&v9->_dataSource, a3);
  objc_storeStrong((id *)&v10->_configuration, a4);
  v11 = [v8 selectedStyle];
  char v12 = __77__PREditingContentStyleItemsViewController_initWithDataSource_configuration___block_invoke((uint64_t)v11, v11);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __77__PREditingContentStyleItemsViewController_initWithDataSource_configuration___block_invoke_2;
  v30[3] = &unk_1E54DAD58;
  id v13 = v11;
  char v33 = v12;
  id v31 = v13;
  id v32 = &__block_literal_global_4;
  v14 = [v7 firstCoordinatorPassingTest:v30];
  v15 = v14;
  if (v14)
  {
    v16 = [(PREditingPosterContentStyleCoordinator *)v14 style];
    if ([v16 allowsVariation])
    {
      int v17 = [v13 allowsVariation];

      if (v17)
      {
        [v13 variation];
        -[PREditingPosterContentStyleCoordinator setVariation:](v15, "setVariation:");
      }
    }
    else
    {
    }
  }
  if ([v8 colorWellDisplayMode])
  {
    id v18 = objc_alloc(MEMORY[0x1E4F927B8]);
    uint64_t v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    colorWellView = v10->_colorWellView;
    v10->_colorWellView = (PUIColorWellView *)v19;

    v21 = [(PUIColorWellView *)v10->_colorWellView colorWell];
    [v21 addTarget:v10 action:sel_colorWellDidUpdateColor_ forControlEvents:4096];
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeStrong((id *)&v10->_colorWell, v21);
    if ([v13 allowsVariation]) {
      [v13 variationAppliedColors];
    }
    else {
    v22 = [v13 colors];
    }
    v23 = [v22 firstObject];

    [v21 setSelectedColor:v23];
    if (v23)
    {
      v24 = [(PREditorContentStylePickerConfiguration *)v10->_configuration stylePalette];
      BOOL v25 = [v24 context] == 2;

      uint64_t v26 = +[PREditingPosterContentStyleCoordinator coordinatorForColorWellView:v10->_colorWellView vibrant:v25];
      uiKitColorPickerStyleCoordinator = v10->_uiKitColorPickerStyleCoordinator;
      v10->_uiKitColorPickerStyleCoordinator = (PREditingPosterContentStyleCoordinator *)v26;

      if ([v7 indexForCoordinator:v15] == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_16;
      }
    }
    else
    {
      [v7 indexForCoordinator:v15];
    }
    [(PREditingContentStyleItemsViewController *)v10 _deselectColorWell];
LABEL_16:
  }
  if (!v15) {
    v15 = v10->_uiKitColorPickerStyleCoordinator;
  }
  selectedContentStyleCoordinator = v10->_selectedContentStyleCoordinator;
  v10->_selectedContentStyleCoordinator = v15;

LABEL_20:
  return v10;
}

uint64_t __77__PREditingContentStyleItemsViewController_initWithDataSource_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isMemberOfClass:objc_opt_class()])
  {
    v3 = [v2 identifier];
    uint64_t v4 = [v3 isEqualToString:@"VibrantMaterial"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __77__PREditingContentStyleItemsViewController_initWithDataSource_configuration___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 style];
  uint64_t v4 = 1;
  if (([v3 isEqual:*(void *)(a1 + 32) ignoringVariation:1] & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PREditingContentStyleItemsViewController;
  [(PREditingContentStyleItemsViewController *)&v3 viewDidLoad];
  [(PREditingContentStyleItemsViewController *)self _setupItemViews];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PREditingContentStyleItemsViewController;
  [(PREditingContentStyleItemsViewController *)&v3 viewDidLayoutSubviews];
  [(PREditingContentStyleItemsViewController *)self _updateLayoutForCurrentSize];
}

- (void)_setupItemViews
{
  objc_super v3 = [(PREditingContentStyleItemsViewController *)self selectedContentStyleCoordinator];
  id v16 = [v3 style];

  uint64_t v4 = [(PREditingContentStyleItemsDataSource *)self->_dataSource numberOfCoordinators];
  id v18 = [MEMORY[0x1E4F1CA48] array];
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      v6 = -[PREditingContentStyleItemsDataSource coordinatorForIndex:](self->_dataSource, "coordinatorForIndex:", v5, v16);
      id v7 = [[PREditingContentStyleItemView alloc] initWithContentStyleCoordinator:v6];
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didTapContentStyleItem_];
      [(PREditingContentStyleItemView *)v7 addGestureRecognizer:v8];
      v9 = [v6 style];
      int v10 = [v9 isEqual:v16 ignoringVariation:1];

      if (v10)
      {
        [(PRSelectableEditingItemView *)v7 setSelected:1];
        [(PREditingContentStyleItemsViewController *)self setSelectedContentStyleItemView:v7];
      }
      [(PREditingContentStyleItemView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v18 addObject:v7];
      ++v5;
    }
    while (v4 != v5);
  }
  v11 = (NSArray *)objc_msgSend(v18, "copy", v16);
  allItemViews = self->_allItemViews;
  self->_allItemViews = v11;

  [(PREditingContentStyleItemsDataSource *)self->_dataSource setContentsLuminance:self->_contentsLuminance];
  id v13 = [MEMORY[0x1E4F1CA48] arrayWithArray:v18];
  if ([(PREditorContentStylePickerConfiguration *)self->_configuration colorWellDisplayMode] == 1) {
    [(NSArray *)v13 addObject:self->_colorWellView];
  }
  allViews = self->_allViews;
  self->_allViews = v13;
  v15 = v13;

  [(PREditingContentStyleItemsViewController *)self layoutWithItemViews:v15];
}

- (void)didTapContentStyleItem:(id)a3
{
  id v8 = [a3 view];
  uint64_t v4 = [v8 contentStyleCoordinator];
  [(PREditingContentStyleItemsViewController *)self setSelectedContentStyleCoordinator:v4];
  [(PREditingContentStyleItemsViewController *)self _didSelectContentStyleCoordinator:v4];
  uint64_t v5 = [(PREditingContentStyleItemsViewController *)self dataSource];
  uint64_t v6 = [v5 indexForCoordinator:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PREditingContentStyleItemsViewController *)self _deselectSelectedContentStyle];
  }
  else
  {
    [(PREditingContentStyleItemsViewController *)self _deselectColorWell];
    id v7 = [(PREditingContentStyleItemsViewController *)self selectedContentStyleItemView];
    [v7 setSelected:0];

    [(PREditingContentStyleItemsViewController *)self setSelectedContentStyleItemView:v8];
    [v8 setSelected:1];
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
  id v7 = [MEMORY[0x1E4F1CA48] array];
  if (v6)
  {
    uint64_t v8 = 0;
    for (uint64_t i = 0; i != v6; ++i)
    {
      int v10 = [MEMORY[0x1E4F1CA48] array];
      for (uint64_t j = 0; j != 6; ++j)
      {
        if ([v3 count] <= (unint64_t)(v8 + j)) {
          break;
        }
        char v12 = objc_msgSend(v3, "objectAtIndexedSubscript:");
        [v10 addObject:v12];
      }
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v10];
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
  v14 = (UIStackView *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v7];
  [(UIStackView *)v14 setAxis:1];
  [(UIStackView *)v14 setDistribution:3];
  [(UIStackView *)v14 setAlignment:3];
  [(UIStackView *)v14 setSpacing:14.0];
  [(UIStackView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  stackView = self->_stackView;
  self->_stackView = v14;
  id v16 = v14;

  v42 = v4;
  id v17 = (NSArray *)[v4 copy];
  horizontalStackViews = self->_horizontalStackViews;
  self->_horizontalStackViews = v17;

  uint64_t v19 = [(PREditingContentStyleItemsViewController *)self view];
  [v19 addSubview:v16];

  v20 = v16;
  v21 = [(UIStackView *)v16 leadingAnchor];
  v22 = [(PREditingContentStyleItemsViewController *)self view];
  v23 = [v22 leadingAnchor];
  v24 = [v21 constraintEqualToAnchor:v23 constant:31.0];

  stackViewLeadingConstraint = self->_stackViewLeadingConstraint;
  self->_stackViewLeadingConstraint = v24;
  v41 = v24;

  uint64_t v26 = [(UIStackView *)v16 trailingAnchor];
  v27 = [(PREditingContentStyleItemsViewController *)self view];
  v28 = [v27 trailingAnchor];
  v29 = [v26 constraintEqualToAnchor:v28 constant:-31.0];

  stackViewTrailingConstraint = self->_stackViewTrailingConstraint;
  self->_stackViewTrailingConstraint = v29;
  v40 = v29;

  v45[0] = v41;
  v45[1] = v40;
  v38 = [(UIStackView *)v16 bottomAnchor];
  v39 = [(PREditingContentStyleItemsViewController *)self view];
  id v31 = [v39 bottomAnchor];
  id v32 = [v38 constraintEqualToAnchor:v31];
  v45[2] = v32;
  char v33 = [(UIStackView *)v16 topAnchor];
  objc_super v34 = [(PREditingContentStyleItemsViewController *)self view];
  v35 = [v34 topAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  v45[3] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v37];
  [(PREditingContentStyleItemsViewController *)self _updateLayoutForCurrentSize];
}

- (void)_updateLayoutForCurrentSize
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(PREditingContentStyleItemsViewController *)self view];
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
    id v7 = self->_horizontalStackViews;
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
          char v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          objc_msgSend(v12, "setSpacing:", (v5 + -326.0) / 5.0, (void)v25);
          [v12 setNeedsLayout];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v9);
    }

    id v13 = [(PREditingContentStyleItemsViewController *)self delegate];
    [v13 contentStyleItemsViewControllerDidUpdateEstimatedSize:self];
  }
  if (v5 != self->_configuredViewWidth)
  {
    v14 = [(PREditingContentStyleItemsViewController *)self stackViewLeadingConstraint];
    [v14 constant];
    double v16 = v15;
    id v17 = [(PREditingContentStyleItemsViewController *)self stackViewTrailingConstraint];
    [v17 constant];
    double v19 = v16 - v18;

    if (v5 + -264.0 >= v19) {
      double v20 = 31.0;
    }
    else {
      double v20 = (v5 + -264.0) * 0.5;
    }
    v21 = [(PREditingContentStyleItemsViewController *)self stackViewLeadingConstraint];
    v22 = v21;
    if (v20 >= 0.0) {
      double v23 = v20;
    }
    else {
      double v23 = 0.0;
    }
    [v21 setConstant:v23];

    v24 = [(PREditingContentStyleItemsViewController *)self stackViewTrailingConstraint];
    objc_msgSend(v24, "setConstant:", fmin(-v20, 0.0));

    self->_configuredViewWidth = v5;
  }
}

- (double)estimatedHeight
{
  unint64_t v3 = [(PREditingContentStyleItemsDataSource *)self->_dataSource numberOfCoordinators];
  if ([(PREditorContentStylePickerConfiguration *)self->_configuration colorWellDisplayMode] == 1) {
    int64_t v4 = v3 + 1;
  }
  else {
    int64_t v4 = v3;
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
  if ([(PREditingContentStyleItemsViewController *)self isViewLoaded])
  {
    dataSource = self->_dataSource;
    [(PREditingContentStyleItemsDataSource *)dataSource setContentsLuminance:a3];
  }
}

- (void)_didSelectContentStyleCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(PREditingContentStyleItemsViewController *)self delegate];
  [v5 contentStyleItemsViewController:self didSelectContentStyleCoordinator:v4];
}

- (void)_deselectSelectedContentStyle
{
  [(PRSelectableEditingItemView *)self->_selectedContentStyleItemView setSelected:0];
  selectedContentStyleItemView = self->_selectedContentStyleItemView;
  self->_selectedContentStyleItemView = 0;

  selectedContentStyleCoordinator = self->_selectedContentStyleCoordinator;
  self->_selectedContentStyleCoordinator = 0;

  [(PUIColorWell *)self->_colorWell setSelectedColor:0];
  [(PUIColorWell *)self->_colorWell invalidateIntrinsicContentSize];
  colorWellView = self->_colorWellView;
  [(PUIColorWellView *)colorWellView setNeedsLayout];
}

- (void)_deselectColorWell
{
  [(PUIColorWell *)self->_colorWell setSelectedColor:0];
  [(PUIColorWell *)self->_colorWell invalidateIntrinsicContentSize];
  colorWellView = self->_colorWellView;
  [(PUIColorWellView *)colorWellView setNeedsLayout];
}

- (void)setSelectedContentStyle:(id)a3 fromUIKitPicker:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if (v4)
    {
      [(PRSelectableEditingItemView *)self->_selectedContentStyleItemView setSelected:0];
      selectedContentStyleItemView = self->_selectedContentStyleItemView;
      self->_selectedContentStyleItemView = 0;
    }
    else
    {
      dataSource = self->_dataSource;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __84__PREditingContentStyleItemsViewController_setSelectedContentStyle_fromUIKitPicker___block_invoke;
      v15[3] = &unk_1E54DAD80;
      double v16 = (PREditingContentStyleItemView *)v6;
      uint64_t v10 = [(PREditingContentStyleItemsDataSource *)dataSource firstCoordinatorPassingTest:v15];
      unint64_t v11 = [(PREditingContentStyleItemsDataSource *)self->_dataSource indexForCoordinator:v10];
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [(PREditingContentStyleItemsViewController *)self _deselectSelectedContentStyle];
      }
      else
      {
        char v12 = [(NSArray *)self->_allItemViews objectAtIndexedSubscript:v11];
        objc_storeStrong((id *)&self->_selectedContentStyleCoordinator, v10);
        [(PRSelectableEditingItemView *)self->_selectedContentStyleItemView setSelected:0];
        id v13 = self->_selectedContentStyleItemView;
        self->_selectedContentStyleItemView = v12;
        v14 = v12;

        [(PRSelectableEditingItemView *)v14 setSelected:1];
      }

      selectedContentStyleItemView = v16;
    }
  }
  else
  {
    [(PREditingContentStyleItemsViewController *)self _deselectSelectedContentStyle];
  }
}

uint64_t __84__PREditingContentStyleItemsViewController_setSelectedContentStyle_fromUIKitPicker___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 style];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)colorWellDidUpdateColor:(id)a3
{
  [(PRSelectableEditingItemView *)self->_selectedContentStyleItemView setSelected:0];
  selectedContentStyleItemView = self->_selectedContentStyleItemView;
  self->_selectedContentStyleItemView = 0;

  id v10 = [(PREditingContentStyleItemsViewController *)self colorWellView];
  id v5 = [(PREditingContentStyleItemsViewController *)self colorWell];
  [v5 invalidateIntrinsicContentSize];

  [v10 setNeedsLayout];
  id v6 = [(PREditorContentStylePickerConfiguration *)self->_configuration stylePalette];
  BOOL v7 = [v6 context] == 2;

  uint64_t v8 = +[PREditingPosterContentStyleCoordinator coordinatorForColorWellView:self->_colorWellView vibrant:v7];
  uiKitColorPickerStyleCoordinator = self->_uiKitColorPickerStyleCoordinator;
  self->_uiKitColorPickerStyleCoordinator = v8;

  objc_storeStrong((id *)&self->_selectedContentStyleCoordinator, self->_uiKitColorPickerStyleCoordinator);
  [(PREditingContentStyleItemsViewController *)self setSelectedContentStyleCoordinator:self->_selectedContentStyleCoordinator];
  [(PREditingContentStyleItemsViewController *)self _didSelectContentStyleCoordinator:self->_uiKitColorPickerStyleCoordinator];
}

- (PREditingContentStyleItemsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PREditingContentStyleItemsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PREditingPosterContentStyleCoordinator)selectedContentStyleCoordinator
{
  return self->_selectedContentStyleCoordinator;
}

- (void)setSelectedContentStyleCoordinator:(id)a3
{
}

- (PREditingContentStyleItemView)selectedContentStyleItemView
{
  return self->_selectedContentStyleItemView;
}

- (void)setSelectedContentStyleItemView:(id)a3
{
}

- (PREditorContentStylePickerConfiguration)configuration
{
  return self->_configuration;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (PREditingPosterContentStyleCoordinator)uiKitColorPickerStyleCoordinator
{
  return self->_uiKitColorPickerStyleCoordinator;
}

- (void)setUiKitColorPickerStyleCoordinator:(id)a3
{
}

- (PUIColorWellView)colorWellView
{
  return self->_colorWellView;
}

- (void)setColorWellView:(id)a3
{
}

- (PREditingContentStyleItemsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorWell, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_horizontalStackViews, 0);
  objc_storeStrong((id *)&self->_stackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_allViews, 0);
  objc_storeStrong((id *)&self->_allItemViews, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_colorWellView, 0);
  objc_storeStrong((id *)&self->_uiKitColorPickerStyleCoordinator, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_selectedContentStyleItemView, 0);
  objc_storeStrong((id *)&self->_selectedContentStyleCoordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end