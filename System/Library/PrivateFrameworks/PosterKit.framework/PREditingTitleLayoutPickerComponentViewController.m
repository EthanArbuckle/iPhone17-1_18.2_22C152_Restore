@interface PREditingTitleLayoutPickerComponentViewController
+ (id)defaultTitleLayoutsForRole:(id)a3;
- (BOOL)isUsingSmallerSizing;
- (BOOL)isUsingVerticalLanguage;
- (NSArray)cellViews;
- (NSArray)heightCellConstraints;
- (NSArray)titleLayouts;
- (PREditingPickerCellView)selectedCellView;
- (PREditingTitleLayoutPickerComponentViewController)initWithTitleLayouts:(id)a3 selectedLayout:(unint64_t)a4;
- (PREditingTitleLayoutPickerComponentViewControllerDelegate)delegate;
- (UIStackView)stackView;
- (double)cellHeight;
- (double)estimatedHeight;
- (double)largestItemHeight;
- (id)cellViewFor:(unint64_t)a3 largestItemHeight:(double *)a4;
- (unint64_t)selectedTitleLayout;
- (void)loadView;
- (void)setCellViews:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeightCellConstraints:(id)a3;
- (void)setLargestItemHeight:(double)a3;
- (void)setSelectedCellView:(id)a3;
- (void)setSelectedTitleLayout:(unint64_t)a3;
- (void)setStackView:(id)a3;
- (void)setUsingSmallerSizing:(BOOL)a3;
- (void)updateLayoutForCurrentSize;
- (void)viewDidLayoutSubviews;
@end

@implementation PREditingTitleLayoutPickerComponentViewController

+ (id)defaultTitleLayoutsForRole:(id)a3
{
  if ([a3 isEqual:@"PRPosterRoleIncomingCall"]) {
    return &unk_1ED9EEFB0;
  }
  else {
    return &unk_1ED9EEFC8;
  }
}

- (PREditingTitleLayoutPickerComponentViewController)initWithTitleLayouts:(id)a3 selectedLayout:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PREditingTitleLayoutPickerComponentViewController;
  v8 = [(PREditingTitleLayoutPickerComponentViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_titleLayouts, a3);
    v9->_selectedTitleLayout = a4;
  }

  return v9;
}

- (BOOL)isUsingVerticalLanguage
{
  v2 = PRBundle();
  v3 = [v2 localizedStringForKey:@"POSTER_LAYOUT_VERTICAL" value:&stru_1ED9A3120 table:@"PosterKit"];
  char v4 = objc_msgSend(v3, "pr_isSuitableForVerticalLayout");

  return v4;
}

- (double)cellHeight
{
  BOOL v3 = [(PREditingTitleLayoutPickerComponentViewController *)self isUsingVerticalLanguage];
  BOOL v4 = [(PREditingTitleLayoutPickerComponentViewController *)self isUsingSmallerSizing];
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
  v31[1] = *MEMORY[0x1E4F143B8];
  if ([(PREditingTitleLayoutPickerComponentViewController *)self isUsingVerticalLanguage])
  {
    double v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    BOOL IsVertical = PRPosterTitleLayoutIsVertical(a3);
    v8 = PRBundle();
    v9 = v8;
    if (IsVertical) {
      v10 = @"POSTER_LAYOUT_VERTICAL";
    }
    else {
      v10 = @"POSTER_LAYOUT_HORIZONTAL";
    }
    objc_super v11 = [v8 localizedStringForKey:v10 value:&stru_1ED9A3120 table:@"PosterKit"];

    id v12 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v30 = *MEMORY[0x1E4FB06F8];
    v31[0] = v6;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v14 = (void *)[v12 initWithString:v11 attributes:v13];

    BOOL v15 = PRPosterTitleLayoutIsVertical(a3);
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
    if (PRPosterTitleLayoutIsVertical(a3))
    {
      if (_AXSPrefersHorizontalTextLayout()) {
        unint64_t v18 = 0;
      }
      else {
        unint64_t v18 = a3;
      }
    }
    v19 = objc_alloc_init(PREditingTitleLayoutPickerCellView);
    [(PREditingTitleLayoutPickerCellView *)v19 setFont:v6];
    [(PREditingTitleLayoutPickerCellView *)v19 setLayout:v18];
    [(PREditingTitleLayoutPickerCellView *)v19 setText:v11];
    [(PREditingTitleLayoutPickerCellView *)v19 setTag:a3];
  }
  else
  {
    v19 = objc_alloc_init(PREditingPickerImageCellView);
    v20 = [(PREditingTitleLayoutPickerCellView *)v19 contentImageView];
    v21 = [MEMORY[0x1E4FB1618] blackColor];
    [v20 setTintColor:v21];

    v22 = [(PREditingTitleLayoutPickerCellView *)v19 contentImageView];
    [v22 setContentMode:1];

    [(PREditingTitleLayoutPickerCellView *)v19 setTag:a3];
    double v6 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
    if (PRPosterTitleLayoutIsVertical(a3)) {
      v23 = @"textbox.vertical.filled.topright.iphone";
    }
    else {
      v23 = @"textbox.horizontal.filled.top.iphone";
    }
    [(PREditingTitleLayoutPickerCellView *)v19 configureWithSystemImageNamed:v23 configuration:v6];
    if (a4)
    {
      double v24 = *a4;
      v25 = [(PREditingTitleLayoutPickerCellView *)v19 contentImageView];
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
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v27 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  BOOL v3 = [(PREditingTitleLayoutPickerComponentViewController *)self titleLayouts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v34;
    id obj = v3;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(obj);
        }
        unint64_t v7 = [*(id *)(*((void *)&v33 + 1) + 8 * v6) unsignedIntValue];
        v8 = [(PREditingTitleLayoutPickerComponentViewController *)self cellViewFor:v7 largestItemHeight:&self->_largestItemHeight];
        v9 = (void *)MEMORY[0x1E4FB13F0];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        void v31[2] = __61__PREditingTitleLayoutPickerComponentViewController_loadView__block_invoke;
        v31[3] = &unk_1E54DAB90;
        objc_copyWeak(v32, &location);
        v32[1] = (id)v7;
        v31[4] = self;
        v10 = [v9 actionWithHandler:v31];
        [v8 addAction:v10 forControlEvents:0x2000];
        if (BSEqualDoubles())
        {
          [v8 setSelected:1];
          [(PREditingTitleLayoutPickerComponentViewController *)self setSelectedCellView:v8];
        }
        [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v30 addObject:v8];

        objc_destroyWeak(v32);
        ++v6;
      }
      while (v4 != v6);
      BOOL v3 = obj;
      uint64_t v4 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v4);
  }

  [(PREditingTitleLayoutPickerComponentViewController *)self setCellViews:v30];
  id obja = [MEMORY[0x1E4F1CA48] array];
  [obja addObjectsFromArray:v30];
  objc_super v11 = (UIStackView *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:obja];
  stackView = self->_stackView;
  self->_stackView = v11;

  [(UIStackView *)self->_stackView setAxis:0];
  [(UIStackView *)self->_stackView setAlignment:1];
  [(UIStackView *)self->_stackView setDistribution:1];
  [(UIStackView *)self->_stackView setSpacing:20.0];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v27 addSubview:self->_stackView];
  v21 = (void *)MEMORY[0x1E4F28DC8];
  double v26 = [(UIStackView *)self->_stackView leadingAnchor];
  v25 = [v27 leadingAnchor];
  double v24 = [v26 constraintEqualToAnchor:v25 constant:24.0];
  v38[0] = v24;
  v23 = [(UIStackView *)self->_stackView trailingAnchor];
  v22 = [v27 trailingAnchor];
  v13 = [v23 constraintEqualToAnchor:v22 constant:-24.0];
  v38[1] = v13;
  v14 = [(UIStackView *)self->_stackView bottomAnchor];
  BOOL v15 = [v27 bottomAnchor];
  double v16 = [v14 constraintEqualToAnchor:v15];
  v38[2] = v16;
  double v17 = [(UIStackView *)self->_stackView topAnchor];
  unint64_t v18 = [v27 topAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v38[3] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  [v21 activateConstraints:v20];

  [(PREditingTitleLayoutPickerComponentViewController *)self updateLayoutForCurrentSize];
  [(PREditingTitleLayoutPickerComponentViewController *)self setView:v27];

  objc_destroyWeak(&location);
}

void __61__PREditingTitleLayoutPickerComponentViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setSelectedTitleLayout:*(void *)(a1 + 48)];
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 titleLayoutPickerComponentViewController:*(void *)(a1 + 32) didSelectTitleLayout:*(void *)(a1 + 48) userSelected:1];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PREditingTitleLayoutPickerComponentViewController;
  [(PREditingTitleLayoutPickerComponentViewController *)&v6 viewDidLayoutSubviews];
  BOOL v3 = [(PREditingTitleLayoutPickerComponentViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  if ([(PREditingTitleLayoutPickerComponentViewController *)self isUsingSmallerSizing] != v5 <= 375.0)
  {
    self->_usingSmallerSizing = v5 <= 375.0;
    [(PREditingTitleLayoutPickerComponentViewController *)self updateLayoutForCurrentSize];
  }
}

- (void)updateLayoutForCurrentSize
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F28DC8];
  double v4 = [(PREditingTitleLayoutPickerComponentViewController *)self heightCellConstraints];
  [v3 deactivateConstraints:v4];

  double v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v6 = [(PREditingTitleLayoutPickerComponentViewController *)self cellViews];
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
        objc_super v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) heightAnchor];
        [(PREditingTitleLayoutPickerComponentViewController *)self cellHeight];
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

  [MEMORY[0x1E4F28DC8] activateConstraints:v5];
}

- (void)setSelectedTitleLayout:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_selectedTitleLayout != a3)
  {
    self->_selectedTitleLayout = a3;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v5 = [(PREditingTitleLayoutPickerComponentViewController *)self cellViews];
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
            objc_super v11 = [(PREditingTitleLayoutPickerComponentViewController *)self selectedCellView];
            [v11 setSelected:0];

            [(PREditingTitleLayoutPickerComponentViewController *)self setSelectedCellView:v10];
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
  [(PREditingTitleLayoutPickerComponentViewController *)self cellHeight];
  return v2 + 48.0;
}

- (NSArray)titleLayouts
{
  return self->_titleLayouts;
}

- (unint64_t)selectedTitleLayout
{
  return self->_selectedTitleLayout;
}

- (PREditingTitleLayoutPickerComponentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PREditingTitleLayoutPickerComponentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (PREditingPickerCellView)selectedCellView
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleLayouts, 0);
}

@end