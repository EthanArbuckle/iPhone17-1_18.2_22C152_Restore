@interface PREditorNumberingSystemViewController
- (BOOL)isUsingSmallerSizing;
- (CGSize)cellSize;
- (NSArray)cellViews;
- (NSArray)heightCellConstraints;
- (NSArray)widthCellConstraints;
- (NSDictionary)numberSystemImages;
- (NSLayoutConstraint)stackViewLeadingConstraint;
- (NSLayoutConstraint)stackViewTrailingConstraint;
- (NSLocale)displayLocale;
- (NSString)selectedNumberingSystem;
- (PREditingPickerLabeledCellView)selectedCellView;
- (PREditorNumberingSystemViewController)initWithSelectedNumberingSystem:(id)a3 selectedFont:(id)a4;
- (PREditorNumberingSystemViewControllerDelegate)delegate;
- (UIFont)font;
- (double)configuredViewWidth;
- (double)estimatedHeight;
- (double)largestItemHeight;
- (id)baseContentStringForLocale:(id)a3;
- (id)contentStringForFont:(id)a3 locale:(id)a4;
- (id)displayFont;
- (id)localeWithNumberingSystem:(id)a3;
- (void)didSelectNumberingSystem:(id)a3;
- (void)setCellSize:(CGSize)a3;
- (void)setCellViews:(id)a3;
- (void)setConfiguredViewWidth:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFont:(id)a3;
- (void)setHeightCellConstraints:(id)a3;
- (void)setLargestItemHeight:(double)a3;
- (void)setNumberSystemImages:(id)a3;
- (void)setSelectedCellView:(id)a3;
- (void)setSelectedNumberingSystem:(id)a3;
- (void)setStackViewLeadingConstraint:(id)a3;
- (void)setStackViewTrailingConstraint:(id)a3;
- (void)setUsingSmallerSizing:(BOOL)a3;
- (void)setWidthCellConstraints:(id)a3;
- (void)updateLayoutForCurrentSize;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PREditorNumberingSystemViewController

- (PREditorNumberingSystemViewController)initWithSelectedNumberingSystem:(id)a3 selectedFont:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PREditorNumberingSystemViewController *)self init];
  if (v8)
  {
    if (v6)
    {
      v9 = (PREditorNumberingSystemViewController *)[v6 copy];
    }
    else
    {
      PRSystemNumberingSystem();
      self = (PREditorNumberingSystemViewController *)objc_claimAutoreleasedReturnValue();
      v9 = (PREditorNumberingSystemViewController *)[(PREditorNumberingSystemViewController *)self copy];
    }
    objc_storeStrong((id *)&v8->_selectedNumberingSystem, v9);
    if (!v6)
    {

      v9 = self;
    }

    v10 = v7;
    if (!v7)
    {
      v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    }
    objc_storeStrong((id *)&v8->_font, v10);
    if (!v7) {
  }
    }
  return v8;
}

- (void)viewDidLoad
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  v87.receiver = self;
  v87.super_class = (Class)PREditorNumberingSystemViewController;
  [(PREditorNumberingSystemViewController *)&v87 viewDidLoad];
  id v77 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = PRAllNumberingSystems();
  v75 = [(PREditorNumberingSystemViewController *)self selectedNumberingSystem];
  objc_initWeak(&location, self);
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
  if (v4)
  {
    uint64_t v72 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v83 != v72) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = (int)[*(id *)(*((void *)&v82 + 1) + 8 * i) intValue];
        id v7 = PRNumberingSystemStringForType(v6);
        v8 = [(PREditorNumberingSystemViewController *)self localeWithNumberingSystem:v7];
        v9 = PRNumberingSystemDisplayNameForType(v6);
        v10 = [(PREditorNumberingSystemViewController *)self font];
        v11 = [(PREditorNumberingSystemViewController *)self contentStringForFont:v10 locale:v8];

        v12 = objc_alloc_init(PREditingPickerLabeledCellView);
        v13 = [(PREditingPickerLabeledCellView *)v12 contentLabel];
        [v13 setAttributedText:v11];

        v14 = [(PREditingPickerLabeledCellView *)v12 nameLabel];
        [v14 setText:v9];

        v15 = (void *)MEMORY[0x1E4FB13F0];
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __52__PREditorNumberingSystemViewController_viewDidLoad__block_invoke;
        v78[3] = &unk_1E54DB248;
        objc_copyWeak(&v81, &location);
        id v16 = v7;
        id v79 = v16;
        v17 = v12;
        v80 = v17;
        v18 = [v15 actionWithHandler:v78];
        [(PREditingPickerLabeledCellView *)v17 addAction:v18 forControlEvents:0x2000];
        if ([v16 isEqualToString:v75])
        {
          [(PREditingPickerLabeledCellView *)v17 setSelected:1];
          [(PREditorNumberingSystemViewController *)self setSelectedCellView:v17];
        }
        [(PREditingPickerLabeledCellView *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v77 addObject:v17];
        double largestItemHeight = self->_largestItemHeight;
        [v11 size];
        if (largestItemHeight >= v20) {
          double v21 = largestItemHeight;
        }
        else {
          double v21 = v20;
        }
        self->_double largestItemHeight = v21;

        objc_destroyWeak(&v81);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
    }
    while (v4);
  }

  [(PREditorNumberingSystemViewController *)self setCellViews:v77];
  unint64_t v22 = [v77 count];
  if (0xAAAAAAAAAAAAAAABLL * [v77 count] <= 0x5555555555555555) {
    unint64_t v23 = v22 / 3;
  }
  else {
    unint64_t v23 = v22 / 3 + 1;
  }
  v24 = [MEMORY[0x1E4F1CA48] array];
  if (v23)
  {
    uint64_t v25 = 0;
    for (uint64_t j = 0; j != v23; ++j)
    {
      v27 = [MEMORY[0x1E4F1CA48] array];
      for (uint64_t k = 0; k != 3; ++k)
      {
        if ([v77 count] <= (unint64_t)(v25 + k)) {
          break;
        }
        v29 = objc_msgSend(v77, "objectAtIndexedSubscript:");
        [v27 addObject:v29];
      }
      v30 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v27];
      [v30 setAxis:0];
      [v30 setDistribution:1];
      [v30 setAlignment:1];
      [v30 setSpacing:0.0];
      [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v24 addObject:v30];

      v25 += 3;
    }
  }
  id v76 = objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  [v76 setScrollEnabled:1];
  [v76 setAlwaysBounceHorizontal:0];
  [v76 setShowsVerticalScrollIndicator:0];
  [v76 setTranslatesAutoresizingMaskIntoConstraints:0];
  v31 = [(PREditorNumberingSystemViewController *)self view];
  [v31 addSubview:v76];

  v51 = (void *)MEMORY[0x1E4F28DC8];
  v70 = [v76 leadingAnchor];
  v73 = [(PREditorNumberingSystemViewController *)self view];
  v67 = [v73 leadingAnchor];
  v65 = [v70 constraintEqualToAnchor:v67 constant:23.0];
  v89[0] = v65;
  v59 = [v76 trailingAnchor];
  v63 = [(PREditorNumberingSystemViewController *)self view];
  v61 = [v63 trailingAnchor];
  v57 = [v59 constraintEqualToAnchor:v61 constant:-23.0];
  v89[1] = v57;
  v53 = [v76 bottomAnchor];
  v55 = [(PREditorNumberingSystemViewController *)self view];
  v32 = [v55 bottomAnchor];
  v33 = [v53 constraintEqualToAnchor:v32];
  v89[2] = v33;
  v34 = [v76 topAnchor];
  v35 = [(PREditorNumberingSystemViewController *)self view];
  v36 = [v35 topAnchor];
  v37 = [v34 constraintEqualToAnchor:v36];
  v89[3] = v37;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:4];
  [v51 activateConstraints:v38];

  v39 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v24];
  [v39 setAxis:1];
  [v39 setAlignment:0];
  [v39 setSpacing:24.0];
  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v76 addSubview:v39];
  v47 = (void *)MEMORY[0x1E4F28DC8];
  v71 = [v39 leadingAnchor];
  v74 = [v76 contentLayoutGuide];
  v68 = [v74 leadingAnchor];
  v66 = [v71 constraintEqualToAnchor:v68];
  v88[0] = v66;
  v62 = [v39 trailingAnchor];
  v64 = [v76 contentLayoutGuide];
  v60 = [v64 trailingAnchor];
  v58 = [v62 constraintEqualToAnchor:v60];
  v88[1] = v58;
  v54 = [v39 bottomAnchor];
  v56 = [v76 contentLayoutGuide];
  v52 = [v56 bottomAnchor];
  v50 = [v54 constraintEqualToAnchor:v52];
  v88[2] = v50;
  v48 = [v39 topAnchor];
  v49 = [v76 contentLayoutGuide];
  v40 = [v49 topAnchor];
  v41 = [v48 constraintEqualToAnchor:v40];
  v88[3] = v41;
  v42 = [v39 widthAnchor];
  v43 = [v76 frameLayoutGuide];
  v44 = [v43 widthAnchor];
  v45 = [v42 constraintEqualToAnchor:v44];
  v88[4] = v45;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:5];
  [v47 activateConstraints:v46];

  [(PREditorNumberingSystemViewController *)self updateLayoutForCurrentSize];
  objc_destroyWeak(&location);
}

void __52__PREditorNumberingSystemViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setSelectedNumberingSystem:*(void *)(a1 + 32)];
  v2 = [WeakRetained selectedCellView];
  [v2 setSelected:0];

  [WeakRetained setSelectedCellView:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setSelected:1];
  [WeakRetained didSelectNumberingSystem:*(void *)(a1 + 32)];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PREditorNumberingSystemViewController;
  [(PREditorNumberingSystemViewController *)&v8 viewDidLayoutSubviews];
  v3 = [(PREditorNumberingSystemViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  if (v5 > 375.0)
  {
    BOOL v6 = 0;
    if ([(PREditorNumberingSystemViewController *)self isUsingSmallerSizing]) {
      goto LABEL_6;
    }
LABEL_5:
    if (self->_configuredViewWidth == v5) {
      return;
    }
    goto LABEL_6;
  }
  id v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v6 = [v7 userInterfaceIdiom] != 1;

  if (v6 == [(PREditorNumberingSystemViewController *)self isUsingSmallerSizing]) {
    goto LABEL_5;
  }
LABEL_6:
  [(PREditorNumberingSystemViewController *)self setUsingSmallerSizing:v6];
  [(PREditorNumberingSystemViewController *)self updateLayoutForCurrentSize];
}

- (void)updateLayoutForCurrentSize
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PREditorNumberingSystemViewController *)self isUsingSmallerSizing];
  double v4 = (void *)MEMORY[0x1E4F28DC8];
  double v5 = [(PREditorNumberingSystemViewController *)self widthCellConstraints];
  [v4 deactivateConstraints:v5];

  BOOL v6 = (void *)MEMORY[0x1E4F28DC8];
  id v7 = [(PREditorNumberingSystemViewController *)self heightCellConstraints];
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
  v45 = [MEMORY[0x1E4F1CA48] array];
  v44 = [MEMORY[0x1E4F1CA48] array];
  v43 = PRAllNumberingSystemStrings();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = [(PREditorNumberingSystemViewController *)self cellViews];
  uint64_t v46 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v46)
  {
    uint64_t v10 = 0;
    uint64_t v42 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v48 != v42) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v13 = [v43 objectAtIndexedSubscript:v10 + i];
        v14 = [v12 contentLabel];
        v15 = [(PREditorNumberingSystemViewController *)self localeWithNumberingSystem:v13];
        id v16 = [(PREditorNumberingSystemViewController *)self font];
        v17 = [(PREditorNumberingSystemViewController *)self contentStringForFont:v16 locale:v15];

        [v14 setAttributedText:v17];
        v18 = [v12 widthAnchor];
        v19 = [v18 constraintEqualToConstant:v8];
        [v45 addObject:v19];

        double v20 = [v12 heightAnchor];
        double v21 = [v20 constraintEqualToConstant:v9];
        [v44 addObject:v21];
      }
      v10 += i;
      uint64_t v46 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v46);
  }

  unint64_t v22 = (NSArray *)[v45 copy];
  widthCellConstraints = self->_widthCellConstraints;
  self->_widthCellConstraints = v22;

  v24 = (NSArray *)[v44 copy];
  heightCellConstraints = self->_heightCellConstraints;
  self->_heightCellConstraints = v24;

  [MEMORY[0x1E4F28DC8] activateConstraints:v45];
  [MEMORY[0x1E4F28DC8] activateConstraints:v44];
  if ([(PREditorNumberingSystemViewController *)self isViewLoaded])
  {
    v26 = [(PREditorNumberingSystemViewController *)self view];
    [v26 bounds];
    double v28 = v27;

    if (self->_configuredViewWidth != v28)
    {
      double v29 = v28 + v8 * -3.0;
      v30 = [(PREditorNumberingSystemViewController *)self stackViewLeadingConstraint];
      [v30 constant];
      double v32 = v31;
      v33 = [(PREditorNumberingSystemViewController *)self stackViewTrailingConstraint];
      [v33 constant];
      double v35 = v32 - v34;

      if (v29 >= v35) {
        double v36 = 23.0;
      }
      else {
        double v36 = v29 * 0.5;
      }
      v37 = [(PREditorNumberingSystemViewController *)self stackViewLeadingConstraint];
      v38 = v37;
      if (v36 >= 0.0) {
        double v39 = v36;
      }
      else {
        double v39 = 0.0;
      }
      [v37 setConstant:v39];

      v40 = [(PREditorNumberingSystemViewController *)self stackViewTrailingConstraint];
      objc_msgSend(v40, "setConstant:", fmin(-v36, 0.0));

      self->_configuredViewWidth = v28;
    }
  }
}

- (id)baseContentStringForLocale:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4F28EE0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setNumberStyle:1];
  [v5 setLocale:v4];

  BOOL v6 = [v5 stringFromNumber:&unk_1ED9EEC68];

  return v6;
}

- (id)contentStringForFont:(id)a3 locale:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PREditorNumberingSystemViewController *)self baseContentStringForLocale:v6];
  double v9 = PRNumberingSystemDisplayFontForFont(v7);

  uint64_t v10 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v20 = *MEMORY[0x1E4FB06F8];
  v21[0] = v9;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  v12 = [v10 dictionaryWithDictionary:v11];

  v13 = (void *)MEMORY[0x1E4F1CA20];
  v14 = [v6 localeIdentifier];

  v15 = [v13 componentsFromLocaleIdentifier:v14];
  id v16 = [v15 objectForKeyedSubscript:@"numbers"];

  if (PRTimeNumberingSystemRequiresLanguageTagging(v16))
  {
    v17 = PRTimeNumberingSystemLanguageTag(v16);
    [v12 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F284F8]];
  }
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8 attributes:v12];

  return v18;
}

- (void)setFont:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    double v21 = v5;
    objc_storeStrong((id *)&self->_font, a3);
    uint64_t v25 = [(PREditorNumberingSystemViewController *)self displayFont];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = [(PREditorNumberingSystemViewController *)self cellViews];
    uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v24 = *(void *)v27;
      uint64_t v23 = *MEMORY[0x1E4FB06F8];
      uint64_t v8 = *MEMORY[0x1E4F284F8];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v11 = [v10 contentLabel];
          v12 = [v11 attributedText];
          v13 = (void *)MEMORY[0x1E4F1CA60];
          uint64_t v30 = v23;
          double v31 = v25;
          v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
          v15 = [v13 dictionaryWithDictionary:v14];

          id v16 = [v12 attributesAtIndex:0 effectiveRange:0];
          v17 = [v16 objectForKeyedSubscript:v8];

          if (v17 && [v17 length]) {
            [v15 setObject:v17 forKeyedSubscript:v8];
          }
          id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
          v19 = [v12 string];
          uint64_t v20 = (void *)[v18 initWithString:v19 attributes:v15];

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
  BOOL v3 = PRAllNumberingSystems();
  if (([(PREditorNumberingSystemViewController *)self isViewLoaded] & 1) == 0
    && [v3 count])
  {
    BOOL v4 = [(PREditorNumberingSystemViewController *)self isUsingSmallerSizing];
    double v5 = 64.0;
    if (v4) {
      double v5 = 62.0;
    }
    self->_double largestItemHeight = v5;
  }
  unint64_t v6 = [v3 count] / 3uLL;
  if (0xAAAAAAAAAAAAAAABLL * [v3 count] <= 0x5555555555555555) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v6 + 1;
  }
  double v8 = (double)(v7 - 1) * 20.0 + (double)v7 * self->_largestItemHeight + 30.0;

  return v8;
}

- (id)displayFont
{
  v2 = [(PREditorNumberingSystemViewController *)self font];
  BOOL v3 = v2;
  if (v2) {
    [v2 fontWithSize:56.0];
  }
  else {
  BOOL v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:56.0];
  }

  return v4;
}

- (NSLocale)displayLocale
{
  BOOL v3 = [(PREditorNumberingSystemViewController *)self selectedNumberingSystem];
  BOOL v4 = [(PREditorNumberingSystemViewController *)self localeWithNumberingSystem:v3];

  return (NSLocale *)v4;
}

- (id)localeWithNumberingSystem:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = a3;
  double v5 = [v3 currentLocale];
  unint64_t v6 = [v5 localeIdentifier];

  uint64_t v7 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v6];
  double v8 = (void *)[v7 mutableCopy];

  [v8 setObject:v4 forKey:@"numbers"];
  double v9 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v8];
  uint64_t v10 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v9];

  return v10;
}

- (void)didSelectNumberingSystem:(id)a3
{
  id v4 = a3;
  id v5 = [(PREditorNumberingSystemViewController *)self delegate];
  [v5 numberingSystemViewController:self didSelectNumberingSystem:v4];
}

- (UIFont)font
{
  return self->_font;
}

- (NSString)selectedNumberingSystem
{
  return self->_selectedNumberingSystem;
}

- (void)setSelectedNumberingSystem:(id)a3
{
}

- (PREditorNumberingSystemViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PREditorNumberingSystemViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)numberSystemImages
{
  return self->_numberSystemImages;
}

- (void)setNumberSystemImages:(id)a3
{
}

- (NSArray)cellViews
{
  return self->_cellViews;
}

- (void)setCellViews:(id)a3
{
}

- (PREditingPickerLabeledCellView)selectedCellView
{
  return self->_selectedCellView;
}

- (void)setSelectedCellView:(id)a3
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
  objc_storeStrong((id *)&self->_selectedCellView, 0);
  objc_storeStrong((id *)&self->_cellViews, 0);
  objc_storeStrong((id *)&self->_numberSystemImages, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedNumberingSystem, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

@end