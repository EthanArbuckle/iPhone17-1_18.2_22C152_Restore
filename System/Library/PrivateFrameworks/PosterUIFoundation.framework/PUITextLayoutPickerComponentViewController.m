@interface PUITextLayoutPickerComponentViewController
- (BOOL)isUsingSmallerSizing;
- (BOOL)isUsingVerticalLanguage;
- (NSArray)cellViews;
- (NSArray)heightCellConstraints;
- (PUIStylePickerButton)selectedCellView;
- (PUITextLayoutPickerComponentViewController)initWithLayout:(unint64_t)a3;
- (PUITextLayoutPickerComponentViewController)initWithLayouts:(id)a3 selectedLayout:(unint64_t)a4;
- (PUITextLayoutPickerComponentViewControllerDelegate)delegate;
- (PUITextLayoutSet)layouts;
- (UIStackView)stackView;
- (double)cellHeight;
- (double)estimatedHeight;
- (double)largestItemHeight;
- (id)cellViewFor:(unint64_t)a3 largestItemHeight:(double *)a4;
- (unint64_t)selectedLayout;
- (void)loadView;
- (void)setCellViews:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeightCellConstraints:(id)a3;
- (void)setLargestItemHeight:(double)a3;
- (void)setSelectedCellView:(id)a3;
- (void)setSelectedLayout:(unint64_t)a3;
- (void)setStackView:(id)a3;
- (void)setUsingSmallerSizing:(BOOL)a3;
- (void)setselectedLayout:(unint64_t)a3;
- (void)updateLayoutForCurrentSize;
- (void)viewDidLayoutSubviews;
@end

@implementation PUITextLayoutPickerComponentViewController

- (PUITextLayoutPickerComponentViewController)initWithLayout:(unint64_t)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  v5 = [PUITextLayoutSet alloc];
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  v11[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v8 = [(PUITextLayoutSet *)v5 initWithTextLayouts:v7];
  v9 = [(PUITextLayoutPickerComponentViewController *)self initWithLayouts:v8 selectedLayout:a3];

  return v9;
}

- (PUITextLayoutPickerComponentViewController)initWithLayouts:(id)a3 selectedLayout:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUITextLayoutPickerComponentViewController;
  v7 = [(PUITextLayoutPickerComponentViewController *)&v11 initWithNibName:0 bundle:0];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    layouts = v7->_layouts;
    v7->_layouts = (PUITextLayoutSet *)v8;

    v7->_selectedLayout = a4;
  }

  return v7;
}

- (BOOL)isUsingVerticalLanguage
{
  v2 = PUIBundle();
  v3 = [v2 localizedStringForKey:@"POSTER_LAYOUT_VERTICAL" value:&stru_270801C00 table:0];
  char v4 = objc_msgSend(v3, "pui_isSuitableForVerticalLayout");

  return v4;
}

- (double)cellHeight
{
  BOOL v3 = [(PUITextLayoutPickerComponentViewController *)self isUsingVerticalLanguage];
  BOOL v4 = [(PUITextLayoutPickerComponentViewController *)self isUsingSmallerSizing];
  double result = 84.0;
  if (v4) {
    double result = 82.0;
  }
  double v6 = 64.0;
  if (v4) {
    double v6 = 62.0;
  }
  if (!v3) {
    return v6;
  }
  return result;
}

- (id)cellViewFor:(unint64_t)a3 largestItemHeight:(double *)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  if ([(PUITextLayoutPickerComponentViewController *)self isUsingVerticalLanguage])
  {
    double v6 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
    BOOL IsVertical = PUITextLayoutIsVertical(a3);
    uint64_t v8 = PUIBundle();
    v9 = v8;
    if (IsVertical) {
      v10 = @"POSTER_LAYOUT_VERTICAL";
    }
    else {
      v10 = @"POSTER_LAYOUT_HORIZONTAL";
    }
    objc_super v11 = [v8 localizedStringForKey:v10 value:&stru_270801C00 table:0];

    id v12 = objc_alloc(MEMORY[0x263F089B8]);
    uint64_t v30 = *MEMORY[0x263F1C238];
    v31[0] = v6;
    v13 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v14 = (void *)[v12 initWithString:v11 attributes:v13];

    BOOL v15 = PUITextLayoutIsVertical(a3);
    [v14 size];
    if (a4)
    {
      if (!v15) {
        double v16 = v17;
      }
      if (*a4 >= v16) {
        double v16 = *a4;
      }
      *a4 = v16;
    }
    unint64_t v18 = a3;
    if (PUITextLayoutIsVertical(a3))
    {
      if (_AXSPrefersHorizontalTextLayout()) {
        unint64_t v18 = 0;
      }
      else {
        unint64_t v18 = a3;
      }
    }
    v19 = objc_alloc_init(PUIStyleTitleLayoutPickerButton);
    [(PUIStyleTitleLayoutPickerButton *)v19 setFont:v6];
    [(PUIStyleTitleLayoutPickerButton *)v19 setLayout:v18];
    [(PUIStyleTitleLayoutPickerButton *)v19 setText:v11];
    [(PUIStyleTitleLayoutPickerButton *)v19 setTag:a3];
  }
  else
  {
    v19 = objc_alloc_init(PUIStylePickerImageButton);
    v20 = [(PUIStyleTitleLayoutPickerButton *)v19 contentImageView];
    v21 = [MEMORY[0x263F1C550] blackColor];
    [v20 setTintColor:v21];

    v22 = [(PUIStyleTitleLayoutPickerButton *)v19 contentImageView];
    [v22 setContentMode:1];

    [(PUIStyleTitleLayoutPickerButton *)v19 setTag:a3];
    double v6 = [MEMORY[0x263F1C6C8] configurationWithScale:3];
    if (PUITextLayoutIsVertical(a3)) {
      v23 = @"textbox.vertical.filled.topright.iphone";
    }
    else {
      v23 = @"textbox.horizontal.filled.top.iphone";
    }
    [(PUIStyleTitleLayoutPickerButton *)v19 configureWithSystemImageNamed:v23 configuration:v6];
    if (a4)
    {
      double v24 = *a4;
      v25 = [(PUIStyleTitleLayoutPickerButton *)v19 contentImageView];
      [v25 frame];
      double v27 = v26;

      if (v24 >= v27) {
        double v28 = v24;
      }
      else {
        double v28 = v27;
      }
      *a4 = v28;
    }
  }

  return v19;
}

- (void)loadView
{
  v28[4] = *MEMORY[0x263EF8340];
  id v23 = objc_alloc_init(MEMORY[0x263F1CB60]);
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_initWeak(&location, self);
  BOOL v4 = [(PUITextLayoutPickerComponentViewController *)self layouts];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __54__PUITextLayoutPickerComponentViewController_loadView__block_invoke;
  v24[3] = &unk_265471200;
  objc_copyWeak(&v26, &location);
  id v22 = v3;
  id v25 = v22;
  [v4 enumerateTextLayouts:v24];

  [(PUITextLayoutPickerComponentViewController *)self setCellViews:v22];
  v21 = [MEMORY[0x263EFF980] array];
  [v21 addObjectsFromArray:v22];
  v5 = (UIStackView *)[objc_alloc(MEMORY[0x263F1C9B8]) initWithArrangedSubviews:v21];
  stackView = self->_stackView;
  self->_stackView = v5;

  [(UIStackView *)self->_stackView setAxis:0];
  [(UIStackView *)self->_stackView setAlignment:1];
  [(UIStackView *)self->_stackView setDistribution:1];
  [(UIStackView *)self->_stackView setSpacing:20.0];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v23 addSubview:self->_stackView];
  double v16 = (void *)MEMORY[0x263F08938];
  v20 = [(UIStackView *)self->_stackView leadingAnchor];
  v19 = [v23 leadingAnchor];
  unint64_t v18 = [v20 constraintEqualToAnchor:v19 constant:24.0];
  v28[0] = v18;
  double v17 = [(UIStackView *)self->_stackView trailingAnchor];
  v7 = [v23 trailingAnchor];
  uint64_t v8 = [v17 constraintEqualToAnchor:v7 constant:-24.0];
  v28[1] = v8;
  v9 = [(UIStackView *)self->_stackView bottomAnchor];
  v10 = [v23 bottomAnchor];
  objc_super v11 = [v9 constraintEqualToAnchor:v10];
  v28[2] = v11;
  id v12 = [(UIStackView *)self->_stackView topAnchor];
  v13 = [v23 topAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v28[3] = v14;
  BOOL v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
  [v16 activateConstraints:v15];

  [(PUITextLayoutPickerComponentViewController *)self updateLayoutForCurrentSize];
  [(PUITextLayoutPickerComponentViewController *)self setView:v23];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __54__PUITextLayoutPickerComponentViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  BOOL v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = [WeakRetained cellViewFor:a2 largestItemHeight:WeakRetained + 129];
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x263F1C3C0];
      uint64_t v10 = MEMORY[0x263EF8330];
      uint64_t v11 = 3221225472;
      id v12 = __54__PUITextLayoutPickerComponentViewController_loadView__block_invoke_2;
      v13 = &unk_2654711D8;
      objc_copyWeak(v14, v4);
      v14[1] = a2;
      v9 = [v8 actionWithHandler:&v10];
      objc_msgSend(v7, "addAction:forControlEvents:", v9, 0x2000, v10, v11, v12, v13);
      if ((void *)v6[124] == a2)
      {
        [v7 setSelected:1];
        [v6 setSelectedCellView:v7];
      }
      [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
      [*(id *)(a1 + 32) addObject:v7];

      objc_destroyWeak(v14);
    }
  }
}

void __54__PUITextLayoutPickerComponentViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setSelectedLayout:*(void *)(a1 + 40)];
    id v3 = [v4 delegate];
    [v3 textLayoutPickerComponentViewController:v4 didSelectTextLayout:*(void *)(a1 + 40) userSelected:1];

    id WeakRetained = v4;
  }
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PUITextLayoutPickerComponentViewController;
  [(PUITextLayoutPickerComponentViewController *)&v6 viewDidLayoutSubviews];
  id v3 = [(PUITextLayoutPickerComponentViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  if ([(PUITextLayoutPickerComponentViewController *)self isUsingSmallerSizing] != v5 <= 375.0)
  {
    self->_usingSmallerSizing = v5 <= 375.0;
    [(PUITextLayoutPickerComponentViewController *)self updateLayoutForCurrentSize];
  }
}

- (void)updateLayoutForCurrentSize
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F08938];
  double v4 = [(PUITextLayoutPickerComponentViewController *)self heightCellConstraints];
  [v3 deactivateConstraints:v4];

  double v5 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v6 = [(PUITextLayoutPickerComponentViewController *)self cellViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) heightAnchor];
        [(PUITextLayoutPickerComponentViewController *)self cellHeight];
        id v12 = objc_msgSend(v11, "constraintEqualToConstant:");
        [v5 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = (NSArray *)[v5 copy];
  heightCellConstraints = self->_heightCellConstraints;
  self->_heightCellConstraints = v13;

  [MEMORY[0x263F08938] activateConstraints:v5];
}

- (void)setselectedLayout:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_selectedLayout != a3)
  {
    self->_selectedLayout = a3;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v5 = [(PUITextLayoutPickerComponentViewController *)self cellViews];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v10 tag] == a3)
          {
            uint64_t v11 = [(PUITextLayoutPickerComponentViewController *)self selectedCellView];
            [v11 setSelected:0];

            [(PUITextLayoutPickerComponentViewController *)self setSelectedCellView:v10];
            [v10 setSelected:1];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (double)estimatedHeight
{
  [(PUITextLayoutPickerComponentViewController *)self cellHeight];
  return v2 + 48.0;
}

- (PUITextLayoutPickerComponentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUITextLayoutPickerComponentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)selectedLayout
{
  return self->_selectedLayout;
}

- (void)setSelectedLayout:(unint64_t)a3
{
  self->_selectedLayout = a3;
}

- (PUITextLayoutSet)layouts
{
  return self->_layouts;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (PUIStylePickerButton)selectedCellView
{
  return self->_selectedCellView;
}

- (void)setSelectedCellView:(id)a3
{
}

- (NSArray)cellViews
{
  return self->_cellViews;
}

- (void)setCellViews:(id)a3
{
}

- (BOOL)isUsingSmallerSizing
{
  return self->_usingSmallerSizing;
}

- (void)setUsingSmallerSizing:(BOOL)a3
{
  self->_usingSmallerSizing = a3;
}

- (double)largestItemHeight
{
  return self->_largestItemHeight;
}

- (void)setLargestItemHeight:(double)a3
{
  self->_largestItemHeight = a3;
}

- (NSArray)heightCellConstraints
{
  return self->_heightCellConstraints;
}

- (void)setHeightCellConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightCellConstraints, 0);
  objc_storeStrong((id *)&self->_cellViews, 0);
  objc_storeStrong((id *)&self->_selectedCellView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end