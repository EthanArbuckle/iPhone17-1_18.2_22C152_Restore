@interface PUINumberingSystemPickerComponentViewController
- (BOOL)isUsingSmallerSizing;
- (CGSize)cellSize;
- (NSArray)heightCellConstraints;
- (NSArray)symbolViews;
- (NSArray)widthCellConstraints;
- (NSDictionary)numberSystemImages;
- (NSLayoutConstraint)stackViewLeadingConstraint;
- (NSLayoutConstraint)stackViewTrailingConstraint;
- (NSLocale)displayLocale;
- (PUINumberingSystem)selectedNumberingSystem;
- (PUINumberingSystemPickerComponentViewController)initWithNumberingSystem:(id)a3 font:(id)a4;
- (PUINumberingSystemPickerComponentViewControllerDelegate)delegate;
- (PUIStylePickerLabeledButton)selectedSymbolView;
- (UIFont)font;
- (double)configuredViewWidth;
- (double)estimatedHeight;
- (double)largestItemHeight;
- (id)baseContentStringForLocale:(id)a3;
- (id)contentStringForFont:(id)a3 locale:(id)a4;
- (id)displayFont;
- (void)didSelectNumberingSystem:(id)a3;
- (void)setCellSize:(CGSize)a3;
- (void)setConfiguredViewWidth:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFont:(id)a3;
- (void)setHeightCellConstraints:(id)a3;
- (void)setLargestItemHeight:(double)a3;
- (void)setNumberSystemImages:(id)a3;
- (void)setSelectedNumberingSystem:(id)a3;
- (void)setSelectedSymbolView:(id)a3;
- (void)setStackViewLeadingConstraint:(id)a3;
- (void)setStackViewTrailingConstraint:(id)a3;
- (void)setSymbolViews:(id)a3;
- (void)setUsingSmallerSizing:(BOOL)a3;
- (void)setWidthCellConstraints:(id)a3;
- (void)updateLayoutForCurrentSize;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PUINumberingSystemPickerComponentViewController

- (PUINumberingSystemPickerComponentViewController)initWithNumberingSystem:(id)a3 font:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUINumberingSystemPickerComponentViewController;
  v8 = [(PUINumberingSystemPickerComponentViewController *)&v13 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = (void *)[v6 copy];
    v10 = v9;
    if (!v9)
    {
      v10 = +[PUINumberingSystem systemDefaultNumberingSystem];
    }
    objc_storeStrong((id *)&v8->_selectedNumberingSystem, v10);
    if (!v9) {

    }
    v11 = v7;
    if (!v7)
    {
      v11 = [MEMORY[0x263F1C658] systemFontOfSize:12.0];
    }
    objc_storeStrong((id *)&v8->_font, v11);
    if (!v7) {
  }
    }
  return v8;
}

- (void)viewDidLoad
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  v63.receiver = self;
  v63.super_class = (Class)PUINumberingSystemPickerComponentViewController;
  [(PUINumberingSystemPickerComponentViewController *)&v63 viewDidLoad];
  id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
  v3 = +[PUINumberingSystem supportedNumberingSystemTypes];
  v51 = [(PUINumberingSystemPickerComponentViewController *)self selectedNumberingSystem];
  objc_initWeak(&location, self);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (v4)
  {
    uint64_t v49 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v59 != v49) {
          objc_enumerationMutation(obj);
        }
        id v6 = [[PUINumberingSystem alloc] initWithNumberingSystemType:*(void *)(*((void *)&v58 + 1) + 8 * i)];
        id v7 = [(PUINumberingSystem *)v6 locale];
        v8 = [(PUINumberingSystem *)v6 localizedDisplayName];
        v9 = [(PUINumberingSystemPickerComponentViewController *)self font];
        v10 = [(PUINumberingSystemPickerComponentViewController *)self contentStringForFont:v9 locale:v7];

        v11 = objc_alloc_init(PUIStylePickerLabeledButton);
        v12 = [(PUIStylePickerLabeledButton *)v11 contentLabel];
        [v12 setAttributedText:v10];

        objc_super v13 = [(PUIStylePickerLabeledButton *)v11 nameLabel];
        [v13 setText:v8];

        v14 = (void *)MEMORY[0x263F1C3C0];
        v54[0] = MEMORY[0x263EF8330];
        v54[1] = 3221225472;
        v54[2] = __62__PUINumberingSystemPickerComponentViewController_viewDidLoad__block_invoke;
        v54[3] = &unk_265471CF8;
        objc_copyWeak(&v57, &location);
        v15 = v6;
        v55 = v15;
        v16 = v11;
        v56 = v16;
        v17 = [v14 actionWithHandler:v54];
        [(PUIStylePickerLabeledButton *)v16 addAction:v17 forControlEvents:0x2000];
        if ([(PUINumberingSystem *)v15 isEqual:v51])
        {
          [(PUIStylePickerLabeledButton *)v16 setSelected:1];
          [(PUINumberingSystemPickerComponentViewController *)self setSelectedSymbolView:v16];
        }
        [(PUIStylePickerLabeledButton *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v53 addObject:v16];
        double largestItemHeight = self->_largestItemHeight;
        [v10 size];
        if (largestItemHeight >= v19) {
          double v20 = largestItemHeight;
        }
        else {
          double v20 = v19;
        }
        self->_double largestItemHeight = v20;

        objc_destroyWeak(&v57);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
    }
    while (v4);
  }

  [(PUINumberingSystemPickerComponentViewController *)self setSymbolViews:v53];
  unint64_t v21 = [v53 count];
  if (0xAAAAAAAAAAAAAAABLL * [v53 count] <= 0x5555555555555555) {
    unint64_t v22 = v21 / 3;
  }
  else {
    unint64_t v22 = v21 / 3 + 1;
  }
  v23 = [MEMORY[0x263EFF980] array];
  if (v22)
  {
    uint64_t v24 = 0;
    for (uint64_t j = 0; j != v22; ++j)
    {
      v26 = [MEMORY[0x263EFF980] array];
      for (uint64_t k = 0; k != 3; ++k)
      {
        if ([v53 count] <= (unint64_t)(v24 + k)) {
          break;
        }
        v28 = objc_msgSend(v53, "objectAtIndexedSubscript:");
        [v26 addObject:v28];
      }
      v29 = (void *)[objc_alloc(MEMORY[0x263F1C9B8]) initWithArrangedSubviews:v26];
      [v29 setAxis:0];
      [v29 setDistribution:1];
      [v29 setAlignment:1];
      [v29 setSpacing:0.0];
      [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v23 addObject:v29];

      v24 += 3;
    }
  }
  v30 = (void *)[objc_alloc(MEMORY[0x263F1C9B8]) initWithArrangedSubviews:v23];
  [v30 setAxis:1];
  [v30 setSpacing:24.0];
  [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
  v31 = [(PUINumberingSystemPickerComponentViewController *)self view];
  [v31 addSubview:v30];

  v39 = (void *)MEMORY[0x263F08938];
  v48 = [v30 leadingAnchor];
  v52 = [(PUINumberingSystemPickerComponentViewController *)self view];
  v50 = [v52 leadingAnchor];
  v46 = [v48 constraintEqualToAnchor:v50 constant:23.0];
  v64[0] = v46;
  v44 = [v30 trailingAnchor];
  v45 = [(PUINumberingSystemPickerComponentViewController *)self view];
  v43 = [v45 trailingAnchor];
  v42 = [v44 constraintEqualToAnchor:v43 constant:-23.0];
  v64[1] = v42;
  v40 = [v30 bottomAnchor];
  v41 = [(PUINumberingSystemPickerComponentViewController *)self view];
  v32 = [v41 bottomAnchor];
  v33 = [v40 constraintEqualToAnchor:v32];
  v64[2] = v33;
  v34 = [v30 topAnchor];
  v35 = [(PUINumberingSystemPickerComponentViewController *)self view];
  v36 = [v35 topAnchor];
  v37 = [v34 constraintEqualToAnchor:v36];
  v64[3] = v37;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:4];
  [v39 activateConstraints:v38];

  [(PUINumberingSystemPickerComponentViewController *)self updateLayoutForCurrentSize];
  objc_destroyWeak(&location);
}

void __62__PUINumberingSystemPickerComponentViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setSelectedNumberingSystem:*(void *)(a1 + 32)];
  v2 = [WeakRetained selectedSymbolView];
  [v2 setSelected:0];

  [WeakRetained setSelectedSymbolView:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setSelected:1];
  [WeakRetained didSelectNumberingSystem:*(void *)(a1 + 32)];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PUINumberingSystemPickerComponentViewController;
  [(PUINumberingSystemPickerComponentViewController *)&v8 viewDidLayoutSubviews];
  v3 = [(PUINumberingSystemPickerComponentViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  if (v5 > 375.0)
  {
    BOOL v6 = 0;
    if ([(PUINumberingSystemPickerComponentViewController *)self isUsingSmallerSizing]) {
      goto LABEL_6;
    }
LABEL_5:
    if (self->_configuredViewWidth == v5) {
      return;
    }
    goto LABEL_6;
  }
  id v7 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v6 = [v7 userInterfaceIdiom] != 1;

  if (v6 == [(PUINumberingSystemPickerComponentViewController *)self isUsingSmallerSizing]) {
    goto LABEL_5;
  }
LABEL_6:
  [(PUINumberingSystemPickerComponentViewController *)self setUsingSmallerSizing:v6];
  [(PUINumberingSystemPickerComponentViewController *)self updateLayoutForCurrentSize];
}

- (void)updateLayoutForCurrentSize
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  BOOL v3 = [(PUINumberingSystemPickerComponentViewController *)self isUsingSmallerSizing];
  double v4 = (void *)MEMORY[0x263F08938];
  double v5 = [(PUINumberingSystemPickerComponentViewController *)self widthCellConstraints];
  [v4 deactivateConstraints:v5];

  BOOL v6 = (void *)MEMORY[0x263F08938];
  id v7 = [(PUINumberingSystemPickerComponentViewController *)self heightCellConstraints];
  [v6 deactivateConstraints:v7];

  if (v3) {
    double v8 = 86.0;
  }
  else {
    double v8 = 89.0;
  }
  if (v3) {
    double v9 = 88.0;
  }
  else {
    double v9 = 90.0;
  }
  v47 = [MEMORY[0x263EFF980] array];
  v46 = [MEMORY[0x263EFF980] array];
  v45 = [(PUINumberingSystemPickerComponentViewController *)self font];
  v10 = +[PUINumberingSystem supportedNumberingSystemTypes];
  v44 = [v10 array];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = [(PUINumberingSystemPickerComponentViewController *)self symbolViews];
  uint64_t v48 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v48)
  {
    uint64_t v11 = 0;
    uint64_t v43 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v50 != v43) {
          objc_enumerationMutation(obj);
        }
        objc_super v13 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v14 = [v44 objectAtIndexedSubscript:v11];
        v15 = [[PUINumberingSystem alloc] initWithNumberingSystemType:v14];
        v16 = [v13 contentLabel];
        v17 = [(PUINumberingSystem *)v15 locale];
        v18 = [(PUINumberingSystemPickerComponentViewController *)self contentStringForFont:v45 locale:v17];

        [v16 setAttributedText:v18];
        double v19 = [v13 widthAnchor];
        double v20 = [v19 constraintEqualToConstant:v8];
        [v47 addObject:v20];

        unint64_t v21 = [v13 heightAnchor];
        unint64_t v22 = [v21 constraintEqualToConstant:v9];
        [v46 addObject:v22];

        v11 += 2;
      }
      uint64_t v48 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v48);
  }

  v23 = (NSArray *)[v47 copy];
  widthCellConstraints = self->_widthCellConstraints;
  self->_widthCellConstraints = v23;

  v25 = (NSArray *)[v46 copy];
  heightCellConstraints = self->_heightCellConstraints;
  self->_heightCellConstraints = v25;

  [MEMORY[0x263F08938] activateConstraints:v47];
  [MEMORY[0x263F08938] activateConstraints:v46];
  if ([(PUINumberingSystemPickerComponentViewController *)self isViewLoaded])
  {
    v27 = [(PUINumberingSystemPickerComponentViewController *)self view];
    [v27 bounds];
    double v29 = v28;

    if (self->_configuredViewWidth != v29)
    {
      double v30 = v29 + v8 * -3.0;
      v31 = [(PUINumberingSystemPickerComponentViewController *)self stackViewLeadingConstraint];
      [v31 constant];
      double v33 = v32;
      v34 = [(PUINumberingSystemPickerComponentViewController *)self stackViewTrailingConstraint];
      [v34 constant];
      double v36 = v33 - v35;

      if (v30 >= v36) {
        double v37 = 23.0;
      }
      else {
        double v37 = v30 * 0.5;
      }
      v38 = [(PUINumberingSystemPickerComponentViewController *)self stackViewLeadingConstraint];
      v39 = v38;
      if (v37 >= 0.0) {
        double v40 = v37;
      }
      else {
        double v40 = 0.0;
      }
      [v38 setConstant:v40];

      v41 = [(PUINumberingSystemPickerComponentViewController *)self stackViewTrailingConstraint];
      objc_msgSend(v41, "setConstant:", fmin(-v37, 0.0));

      self->_configuredViewWidth = v29;
    }
  }
}

- (id)baseContentStringForLocale:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x263F08A30];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setNumberStyle:1];
  [v5 setLocale:v4];

  BOOL v6 = [v5 stringFromNumber:&unk_27081B3F8];

  return v6;
}

- (id)contentStringForFont:(id)a3 locale:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v5 = [(PUINumberingSystemPickerComponentViewController *)self baseContentStringForLocale:a4];
  BOOL v6 = [(PUINumberingSystemPickerComponentViewController *)self selectedNumberingSystem];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  double v9 = v8;

  v10 = [(PUINumberingSystemPickerComponentViewController *)self font];
  uint64_t v11 = +[PUINumberingSystem numberingSystemDisplayFontForFont:v10];

  v12 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v21 = *MEMORY[0x263F1C238];
  v22[0] = v11;
  objc_super v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v14 = [v12 dictionaryWithDictionary:v13];

  v15 = [v9 type];
  int v16 = PUINumberingSystemTypeRequiresLanguageTagging(v15);

  if (v16)
  {
    v17 = [v9 type];
    v18 = PUINumberingTypeSystemLanguageTag(v17);
    [v14 setObject:v18 forKeyedSubscript:*MEMORY[0x263F081E8]];
  }
  double v19 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5 attributes:v14];

  return v19;
}

- (void)setFont:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    uint64_t v21 = v5;
    objc_storeStrong((id *)&self->_font, a3);
    v25 = [(PUINumberingSystemPickerComponentViewController *)self displayFont];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = [(PUINumberingSystemPickerComponentViewController *)self symbolViews];
    uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v24 = *(void *)v27;
      uint64_t v23 = *MEMORY[0x263F1C238];
      uint64_t v8 = *MEMORY[0x263F081E8];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v11 = [v10 contentLabel];
          v12 = [v11 attributedText];
          objc_super v13 = (void *)MEMORY[0x263EFF9A0];
          uint64_t v30 = v23;
          v31 = v25;
          v14 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
          v15 = [v13 dictionaryWithDictionary:v14];

          int v16 = [v12 attributesAtIndex:0 effectiveRange:0];
          v17 = [v16 objectForKeyedSubscript:v8];

          if (v17 && [v17 length]) {
            [v15 setObject:v17 forKeyedSubscript:v8];
          }
          id v18 = objc_alloc(MEMORY[0x263F086A0]);
          double v19 = [v12 string];
          double v20 = (void *)[v18 initWithString:v19 attributes:v15];

          [v11 setAttributedText:v20];
          [v10 invalidateIntrinsicContentSize];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v7);
    }

    id v5 = v21;
  }
}

- (double)estimatedHeight
{
  BOOL v3 = +[PUINumberingSystem supportedNumberingSystemTypes];
  id v4 = [v3 array];

  if (([(PUINumberingSystemPickerComponentViewController *)self isViewLoaded] & 1) == 0
    && [v4 count])
  {
    BOOL v5 = [(PUINumberingSystemPickerComponentViewController *)self isUsingSmallerSizing];
    double v6 = 64.0;
    if (v5) {
      double v6 = 62.0;
    }
    self->_double largestItemHeight = v6;
  }
  unint64_t v7 = [v4 count] / 3uLL;
  if (0xAAAAAAAAAAAAAAABLL * [v4 count] <= 0x5555555555555555) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v7 + 1;
  }
  double v9 = (double)(v8 - 1) * 20.0 + (double)v8 * self->_largestItemHeight + 30.0;

  return v9;
}

- (id)displayFont
{
  v2 = [(PUINumberingSystemPickerComponentViewController *)self font];
  BOOL v3 = v2;
  if (v2) {
    [v2 fontWithSize:56.0];
  }
  else {
  id v4 = [MEMORY[0x263F1C658] systemFontOfSize:56.0];
  }

  return v4;
}

- (NSLocale)displayLocale
{
  v2 = [(PUINumberingSystemPickerComponentViewController *)self selectedNumberingSystem];
  BOOL v3 = [v2 locale];

  return (NSLocale *)v3;
}

- (void)didSelectNumberingSystem:(id)a3
{
  id v4 = a3;
  id v5 = [(PUINumberingSystemPickerComponentViewController *)self delegate];
  [v5 numberingSystemPickerViewController:self didSelectNumberingSystem:v4];
}

- (PUINumberingSystem)selectedNumberingSystem
{
  return self->_selectedNumberingSystem;
}

- (void)setSelectedNumberingSystem:(id)a3
{
}

- (PUINumberingSystemPickerComponentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUINumberingSystemPickerComponentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (NSDictionary)numberSystemImages
{
  return self->_numberSystemImages;
}

- (void)setNumberSystemImages:(id)a3
{
}

- (NSArray)symbolViews
{
  return self->_symbolViews;
}

- (void)setSymbolViews:(id)a3
{
}

- (PUIStylePickerLabeledButton)selectedSymbolView
{
  return self->_selectedSymbolView;
}

- (void)setSelectedSymbolView:(id)a3
{
}

- (double)largestItemHeight
{
  return self->_largestItemHeight;
}

- (void)setLargestItemHeight:(double)a3
{
  self->_double largestItemHeight = a3;
}

- (BOOL)isUsingSmallerSizing
{
  return self->_usingSmallerSizing;
}

- (void)setUsingSmallerSizing:(BOOL)a3
{
  self->_usingSmallerSizing = a3;
}

- (double)configuredViewWidth
{
  return self->_configuredViewWidth;
}

- (void)setConfiguredViewWidth:(double)a3
{
  self->_configuredViewWidth = a3;
}

- (CGSize)cellSize
{
  double width = self->_cellSize.width;
  double height = self->_cellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (NSArray)widthCellConstraints
{
  return self->_widthCellConstraints;
}

- (void)setWidthCellConstraints:(id)a3
{
}

- (NSArray)heightCellConstraints
{
  return self->_heightCellConstraints;
}

- (void)setHeightCellConstraints:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_heightCellConstraints, 0);
  objc_storeStrong((id *)&self->_widthCellConstraints, 0);
  objc_storeStrong((id *)&self->_selectedSymbolView, 0);
  objc_storeStrong((id *)&self->_symbolViews, 0);
  objc_storeStrong((id *)&self->_numberSystemImages, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedNumberingSystem, 0);
}

@end