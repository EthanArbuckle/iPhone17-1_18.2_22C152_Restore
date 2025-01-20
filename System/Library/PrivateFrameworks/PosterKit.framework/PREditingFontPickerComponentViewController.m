@interface PREditingFontPickerComponentViewController
+ (id)defaultFontIdentifiersForRole:(id)a3 titleString:(id)a4;
+ (id)defaultItemsForRole:(id)a3 titleString:(id)a4;
- (BOOL)_shouldShowWeightSlider;
- (BOOL)isUsingSmallerSizing;
- (NSArray)cellViews;
- (NSArray)heightCellConstraints;
- (NSArray)items;
- (NSArray)widthCellConstraints;
- (NSLayoutConstraint)stackViewLeadingConstraint;
- (NSLayoutConstraint)stackViewTrailingConstraint;
- (NSLocale)locale;
- (NSString)role;
- (NSString)titleString;
- (PREditingFontPickerCellView)selectedCellView;
- (PREditingFontPickerComponentViewController)initWithItems:(id)a3 selectedItem:(id)a4 role:(id)a5 titleString:(id)a6;
- (PREditingFontPickerComponentViewControllerDelegate)delegate;
- (PREditingFontPickerItem)selectedItem;
- (UISlider)fontWeightSlider;
- (double)configuredViewWidth;
- (double)estimatedHeight;
- (double)fontSize;
- (double)fontWeight;
- (double)largestItemHeight;
- (id)configureFontPickerViewIfNecessary;
- (id)contentStringForFont:(id)a3 locale:(id)a4;
- (id)contentStringNumberFormatter;
- (void)_updateWeightSliderVisibility;
- (void)filterFontViewsByLocale;
- (void)fontSliderDidUpdateWeight:(id)a3;
- (void)loadView;
- (void)setCellViews:(id)a3;
- (void)setConfiguredViewWidth:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setFontWeight:(double)a3;
- (void)setFontWeightSlider:(id)a3;
- (void)setHeightCellConstraints:(id)a3;
- (void)setLargestItemHeight:(double)a3;
- (void)setLocale:(id)a3;
- (void)setRole:(id)a3;
- (void)setSelectedCellView:(id)a3;
- (void)setSelectedItem:(id)a3;
- (void)setStackViewLeadingConstraint:(id)a3;
- (void)setStackViewTrailingConstraint:(id)a3;
- (void)setTitleString:(id)a3;
- (void)setUsingSmallerSizing:(BOOL)a3;
- (void)setWidthCellConstraints:(id)a3;
- (void)updateLayoutForCurrentSize;
- (void)viewDidLayoutSubviews;
@end

@implementation PREditingFontPickerComponentViewController

+ (id)defaultFontIdentifiersForRole:(id)a3 titleString:(id)a4
{
  v15[4] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([a3 isEqual:@"PRPosterRoleIncomingCall"])
  {
    v15[0] = @"PRTimeFontIdentifierSFPro";
    v15[1] = @"PRTimeFontIdentifierSFRounded";
    v15[2] = @"PRTimeFontIdentifierNewYorkAlpha";
    v15[3] = @"PRTimeFontIdentifierSFCondensed";
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
    if ([v5 length])
    {
      uint64_t v7 = +[PRIncomingCallFontsProvider timeFontIdentifiersForText:v5 availableFonts:v6];
    }
    else
    {
      uint64_t v7 = [v6 copy];
    }
    v11 = (void *)v7;
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      v14[0] = @"PRTimeFontIdentifierSoft";
      v14[1] = @"PRTimeFontIdentifierRounded";
      v14[2] = @"PRTimeFontIdentifierStencil";
      v14[3] = @"PRTimeFontIdentifierNewYork";
      v14[4] = @"PRTimeFontIdentifierSlab";
      v14[5] = @"PRTimeFontIdentifierRail";
      v8 = (void *)MEMORY[0x1E4F1C978];
      v9 = v14;
      uint64_t v10 = 6;
    }
    else
    {
      v13[0] = @"PRTimeFontIdentifierSoft";
      v13[1] = @"PRTimeFontIdentifierSoftLight";
      v13[2] = @"PRTimeFontIdentifierRounded";
      v13[3] = @"PRTimeFontIdentifierStencil";
      v13[4] = @"PRTimeFontIdentifierNewYork";
      v13[5] = @"PRTimeFontIdentifierNewYorkHeavy";
      v13[6] = @"PRTimeFontIdentifierSlab";
      v13[7] = @"PRTimeFontIdentifierRail";
      v8 = (void *)MEMORY[0x1E4F1C978];
      v9 = v13;
      uint64_t v10 = 8;
    }
    v11 = [v8 arrayWithObjects:v9 count:v10];
  }

  return v11;
}

+ (id)defaultItemsForRole:(id)a3 titleString:(id)a4
{
  v4 = [a1 defaultFontIdentifiersForRole:a3 titleString:a4];
  id v5 = objc_msgSend(v4, "bs_map:", &__block_literal_global_29);

  return v5;
}

PREditingFontPickerItem *__78__PREditingFontPickerComponentViewController_defaultItemsForRole_titleString___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PRTimeFontConfiguration alloc] initWithTimeFontIdentifier:v2];

  v4 = [[PREditingFontPickerItem alloc] initWithFontConfiguration:v3 systemItem:1];
  return v4;
}

- (PREditingFontPickerComponentViewController)initWithItems:(id)a3 selectedItem:(id)a4 role:(id)a5 titleString:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PREditingFontPickerComponentViewController;
  v14 = [(PREditingFontPickerComponentViewController *)&v21 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    items = v14->_items;
    v14->_items = (NSArray *)v15;

    v17 = v11;
    if (!v11)
    {
      v17 = [v10 firstObject];
    }
    objc_storeStrong((id *)&v14->_selectedItem, v17);
    if (!v11) {

    }
    objc_storeStrong((id *)&v14->_role, a5);
    objc_storeStrong((id *)&v14->_titleString, a6);
    uint64_t v18 = [MEMORY[0x1E4F1CA20] currentLocale];
    locale = v14->_locale;
    v14->_locale = (NSLocale *)v18;

    v14->_fontSize = 50.0;
  }

  return v14;
}

- (id)contentStringNumberFormatter
{
  if (contentStringNumberFormatter___once != -1) {
    dispatch_once(&contentStringNumberFormatter___once, &__block_literal_global_30);
  }
  v3 = (void *)contentStringNumberFormatter_numberFormatter;
  v4 = [(PREditingFontPickerComponentViewController *)self locale];
  [v3 setLocale:v4];

  id v5 = (void *)contentStringNumberFormatter_numberFormatter;
  return v5;
}

uint64_t __74__PREditingFontPickerComponentViewController_contentStringNumberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)contentStringNumberFormatter_numberFormatter;
  contentStringNumberFormatter_numberFormatter = (uint64_t)v0;

  id v2 = (void *)contentStringNumberFormatter_numberFormatter;
  return [v2 setNumberStyle:1];
}

- (id)contentStringForFont:(id)a3 locale:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = [(PREditingFontPickerComponentViewController *)self role];
  int v10 = [v9 isEqualToString:@"PRPosterRoleIncomingCall"];

  if (v10)
  {
    id v11 = (void *)+[PRIncomingCallFontsProvider sampleStringForFont:v8 displayingText:self->_titleString];
    id v13 = v12;

    v14 = v13;
  }
  else
  {
    id v13 = [(PREditingFontPickerComponentViewController *)self contentStringNumberFormatter];
    id v11 = [v13 stringFromNumber:&unk_1ED9EEDE8];
    v14 = v8;
  }

  uint64_t v15 = [v14 fontWithSize:self->_fontSize];
  v16 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v26 = *MEMORY[0x1E4FB06F8];
  v27[0] = v15;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  uint64_t v18 = [v16 dictionaryWithDictionary:v17];

  v19 = (void *)MEMORY[0x1E4F1CA20];
  v20 = [v7 localeIdentifier];
  objc_super v21 = [v19 componentsFromLocaleIdentifier:v20];
  v22 = [v21 objectForKeyedSubscript:@"numbers"];

  if (PRTimeNumberingSystemRequiresLanguageTagging(v22))
  {
    v23 = PRTimeNumberingSystemLanguageTag(v22);
    [v18 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F284F8]];
  }
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11 attributes:v18];

  return v24;
}

- (void)loadView
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  uint64_t v4 = [(PREditingFontPickerComponentViewController *)self configureFontPickerViewIfNecessary];
  id v5 = objc_alloc_init(PRFontWeightSlider);
  fontWeightSlider = self->_fontWeightSlider;
  self->_fontWeightSlider = &v5->super;

  [(UISlider *)self->_fontWeightSlider addTarget:self action:sel_fontSliderDidUpdateWeight_ forControlEvents:4096];
  [(UISlider *)self->_fontWeightSlider setHidden:[(PREditingFontPickerComponentViewController *)self _shouldShowWeightSlider] ^ 1];
  id v7 = self->_fontWeightSlider;
  BOOL v8 = [(PREditingFontPickerComponentViewController *)self _shouldShowWeightSlider];
  double v9 = 0.0;
  if (v8) {
    double v9 = 1.0;
  }
  [(UISlider *)v7 setAlpha:v9];
  int v10 = self->_fontWeightSlider;
  [(PREditingFontPickerComponentViewController *)self fontWeight];
  *(float *)&double v11 = v11;
  [(UISlider *)v10 setValue:v11];
  [(UISlider *)self->_fontWeightSlider setTranslatesAutoresizingMaskIntoConstraints:0];
  id v12 = (void *)MEMORY[0x1E4F1CA48];
  v45[0] = self->_fontWeightSlider;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  v14 = [v12 arrayWithArray:v13];

  if (v4)
  {
    [v3 addSubview:v4];
    [v14 insertObject:v4 atIndex:0];
  }
  v41 = v14;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v14];
  [v15 setAxis:1];
  [v15 setAlignment:3];
  [v15 setSpacing:16.0];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v15];
  v33 = (void *)MEMORY[0x1E4F28DC8];
  v40 = [v15 leadingAnchor];
  v39 = [v3 leadingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v44[0] = v38;
  v37 = [v15 trailingAnchor];
  v36 = [v3 trailingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v44[1] = v35;
  v34 = [v15 topAnchor];
  v32 = [v3 topAnchor];
  v31 = [v34 constraintEqualToAnchor:v32];
  v44[2] = v31;
  v30 = [v15 bottomAnchor];
  v42 = v3;
  v29 = [v3 bottomAnchor];
  v16 = [v30 constraintEqualToAnchor:v29];
  v44[3] = v16;
  v17 = [(UISlider *)self->_fontWeightSlider widthAnchor];
  uint64_t v18 = [v15 widthAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 constant:-72.0];
  v44[4] = v19;
  v20 = [(UISlider *)self->_fontWeightSlider heightAnchor];
  objc_super v21 = [v20 constraintEqualToConstant:34.0];
  v44[5] = v21;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:6];
  v23 = v22 = (void *)v4;
  [v33 activateConstraints:v23];

  if (v22)
  {
    v24 = (void *)MEMORY[0x1E4F28DC8];
    v25 = [v22 widthAnchor];
    uint64_t v26 = [v15 widthAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v43 = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    [v24 activateConstraints:v28];
  }
  [(PREditingFontPickerComponentViewController *)self updateLayoutForCurrentSize];
  [(PREditingFontPickerComponentViewController *)self filterFontViewsByLocale];
  [(PREditingFontPickerComponentViewController *)self setView:v42];
}

- (id)configureFontPickerViewIfNecessary
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = [(PREditingFontPickerComponentViewController *)self items];
  unint64_t v4 = [v3 count];

  if (v4 > 1)
  {
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_initWeak(&location, self);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v6 = [(PREditingFontPickerComponentViewController *)self items];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v7)
    {
      uint64_t v43 = *(void *)v53;
      id obj = v6;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v53 != v43) {
            objc_enumerationMutation(obj);
          }
          double v9 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          int v10 = [v9 fontConfiguration];
          double v11 = [v10 effectiveFontForRole:self->_role ignoringWeight:1];
          id v12 = [v11 fontWithSize:self->_fontSize];

          id v13 = [(PREditingFontPickerComponentViewController *)self locale];
          v14 = [(PREditingFontPickerComponentViewController *)self contentStringForFont:v12 locale:v13];

          double largestItemHeight = self->_largestItemHeight;
          [v14 size];
          if (largestItemHeight >= v16) {
            double v17 = largestItemHeight;
          }
          else {
            double v17 = v16;
          }
          self->_double largestItemHeight = v17;
          uint64_t v18 = [(PREditingFontPickerComponentViewController *)self role];
          id v19 = objc_alloc_init(+[PREditingFontPickerCellView fontPickerCellViewClassForRole:v18]);

          [v19 configureWithAttributedString:v14];
          objc_initWeak(&from, v19);
          v20 = (void *)MEMORY[0x1E4FB13F0];
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __80__PREditingFontPickerComponentViewController_configureFontPickerViewIfNecessary__block_invoke;
          v48[3] = &unk_1E54DC0E0;
          objc_copyWeak(&v49, &location);
          objc_copyWeak(&v50, &from);
          v48[4] = v9;
          objc_super v21 = [v20 actionWithHandler:v48];
          [v19 addAction:v21 forControlEvents:0x2000];
          if (BSEqualObjects())
          {
            [v19 setSelected:1];
            [(PREditingFontPickerComponentViewController *)self setSelectedCellView:v19];
          }
          [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v45 addObject:v19];

          objc_destroyWeak(&v50);
          objc_destroyWeak(&v49);
          objc_destroyWeak(&from);
        }
        id v6 = obj;
        uint64_t v7 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v7);
    }

    [(PREditingFontPickerComponentViewController *)self setCellViews:v45];
    v22 = [MEMORY[0x1E4F1CA48] array];
    [v22 addObjectsFromArray:v45];
    v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v22];
    [v23 setAxis:0];
    [v23 setAlignment:1];
    [v23 setSpacing:20.0];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = v22;
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    objc_msgSend(v5, "setContentInset:", 0.0, 36.0, 0.0, 36.0);
    [v5 setShowsVerticalScrollIndicator:0];
    [v5 setShowsHorizontalScrollIndicator:0];
    [v5 setClipsToBounds:0];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:v23];
    if ([v23 effectiveUserInterfaceLayoutDirection] == 1)
    {
      CGAffineTransformMakeRotation(&v47, 3.14159265);
      [v23 setTransform:&v47];
      CGAffineTransformMakeRotation(&v46, 3.14159265);
      [v5 setTransform:&v46];
    }
    v34 = (void *)MEMORY[0x1E4F28DC8];
    v44 = [v23 leadingAnchor];
    v42 = [v5 leadingAnchor];
    id obja = [v44 constraintEqualToAnchor:v42];
    v57[0] = obja;
    v39 = [v23 trailingAnchor];
    v38 = [v5 trailingAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v57[1] = v37;
    v36 = [v23 topAnchor];
    v35 = [v5 topAnchor];
    v24 = [v36 constraintEqualToAnchor:v35];
    v57[2] = v24;
    v25 = [v23 bottomAnchor];
    uint64_t v26 = [v5 bottomAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v57[3] = v27;
    v28 = [v23 heightAnchor];
    v29 = [v5 heightAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v57[4] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:5];
    [v34 activateConstraints:v31];

    objc_destroyWeak(&location);
  }
  else
  {
    id v5 = 0;
    self->_double largestItemHeight = 0.0;
  }
  return v5;
}

void __80__PREditingFontPickerComponentViewController_configureFontPickerViewIfNecessary__block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v2 = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained selectedItem];
  id v4 = a1[4];

  if (v3 == v4)
  {
    id v5 = [a1[4] fontConfiguration];
    id v6 = [WeakRetained role];
    uint64_t v7 = [v5 effectiveFontForRole:v6 ignoringWeight:1];

    unint64_t v8 = objc_msgSend(v7, "pr_variantWeightRange");
    unint64_t v10 = v9;
    double v11 = [a1[4] fontConfiguration];
    [v11 weight];
    double v13 = (v12 - (double)v8) / ((double)v10 - (double)v8);

    [WeakRetained setFontWeight:v13];
  }
  [WeakRetained setSelectedItem:a1[4]];
  v14 = [WeakRetained selectedCellView];
  [v14 setSelected:0];

  [WeakRetained setSelectedCellView:v2];
  [v2 setSelected:1];
  uint64_t v15 = [WeakRetained delegate];
  [v15 fontPickerComponentViewController:WeakRetained didSelectItem:a1[4]];

  [WeakRetained _updateWeightSliderVisibility];
}

- (void)setFontWeight:(double)a3
{
  if (self->_fontWeight != a3)
  {
    self->_fontWeight = a3;
    *(float *)&a3 = a3;
    [(UISlider *)self->_fontWeightSlider setValue:a3];
  }
}

- (void)fontSliderDidUpdateWeight:(id)a3
{
  id v4 = a3;
  [v4 value];
  self->_fontWeight = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [v4 value];
  float v7 = v6;

  [WeakRetained fontPickerComponentViewController:self didChangeFontWeight:v7];
}

- (BOOL)_shouldShowWeightSlider
{
  id v3 = [(PREditingFontPickerComponentViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  float v5 = [(PREditingFontPickerComponentViewController *)self delegate];
  char v6 = [v5 fontPickerComponentViewControllerShouldShowWeightSliderForSelectedFont:self];

  return v6;
}

- (void)_updateWeightSliderVisibility
{
  BOOL v3 = [(PREditingFontPickerComponentViewController *)self _shouldShowWeightSlider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__PREditingFontPickerComponentViewController__updateWeightSliderVisibility__block_invoke;
  v11[3] = &unk_1E54DB3F0;
  v11[4] = self;
  BOOL v12 = v3;
  char v4 = (void (**)(void))MEMORY[0x192F91830](v11);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__PREditingFontPickerComponentViewController__updateWeightSliderVisibility__block_invoke_2;
  v9[3] = &unk_1E54DB3F0;
  v9[4] = self;
  BOOL v10 = v3;
  float v5 = (void *)MEMORY[0x192F91830](v9);
  if (v3)
  {
    v4[2](v4);
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v5 options:0 animations:0.15 completion:0.3];
  }
  else
  {
    char v6 = (void *)MEMORY[0x1E4FB1EB0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75__PREditingFontPickerComponentViewController__updateWeightSliderVisibility__block_invoke_3;
    v7[3] = &unk_1E54DC108;
    unint64_t v8 = v4;
    [v6 animateWithDuration:v5 animations:v7 completion:0.15];
  }
}

void __75__PREditingFontPickerComponentViewController__updateWeightSliderVisibility__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fontWeightSlider];
  [v2 setHidden:*(unsigned char *)(a1 + 40) == 0];

  BOOL v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 fontPickerComponentViewControllerDidChangeHeight:*(void *)(a1 + 32)];
  }
}

void __75__PREditingFontPickerComponentViewController__updateWeightSliderVisibility__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fontWeightSlider];
  id v4 = v2;
  double v3 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 0.0;
  }
  [v2 setAlpha:v3];
}

uint64_t __75__PREditingFontPickerComponentViewController__updateWeightSliderVisibility__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateLayoutForCurrentSize
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PREditingFontPickerComponentViewController *)self isUsingSmallerSizing];
  id v4 = (void *)MEMORY[0x1E4F28DC8];
  id v5 = [(PREditingFontPickerComponentViewController *)self widthCellConstraints];
  [v4 deactivateConstraints:v5];

  char v6 = (void *)MEMORY[0x1E4F28DC8];
  float v7 = [(PREditingFontPickerComponentViewController *)self heightCellConstraints];
  [v6 deactivateConstraints:v7];

  double v8 = 52.0;
  if (v3) {
    double v8 = 50.0;
  }
  self->_fontSize = v8;
  uint64_t v43 = [MEMORY[0x1E4F1CA48] array];
  v42 = [MEMORY[0x1E4F1CA48] array];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  unint64_t v9 = [(PREditingFontPickerComponentViewController *)self cellViews];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v15 = [v14 contentFont];
        double v16 = [(PREditingFontPickerComponentViewController *)self locale];
        double v17 = [(PREditingFontPickerComponentViewController *)self contentStringForFont:v15 locale:v16];

        [v14 configureWithAttributedString:v17];
        [v14 setUsingSmallerSizing:v3];
        uint64_t v18 = [v14 widthCellConstraint];
        [v43 addObject:v18];

        id v19 = [v14 heightCellConstraint];
        [v42 addObject:v19];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v11);
  }

  v20 = (NSArray *)[v43 copy];
  widthCellConstraints = self->_widthCellConstraints;
  self->_widthCellConstraints = v20;

  v22 = (NSArray *)[v42 copy];
  heightCellConstraints = self->_heightCellConstraints;
  self->_heightCellConstraints = v22;

  if ([(PREditingFontPickerComponentViewController *)self isViewLoaded])
  {
    v24 = [(PREditingFontPickerComponentViewController *)self view];
    [v24 bounds];
    double v26 = v25;

    if (self->_configuredViewWidth != v26)
    {
      v27 = [(PREditingFontPickerComponentViewController *)self role];
      v28 = +[PREditingFontPickerCellView fontPickerCellViewClassForRole:v27];

      [(objc_class *)v28 defaultCellSizeUsingSmallerSizing:v3];
      double v30 = v26 - v29;
      v31 = [(PREditingFontPickerComponentViewController *)self stackViewLeadingConstraint];
      [v31 constant];
      double v33 = v32;
      v34 = [(PREditingFontPickerComponentViewController *)self stackViewTrailingConstraint];
      [v34 constant];
      double v36 = v33 - v35;

      if (v30 >= v36) {
        double v37 = 36.0;
      }
      else {
        double v37 = v30 * 0.5;
      }
      v38 = [(PREditingFontPickerComponentViewController *)self stackViewLeadingConstraint];
      v39 = v38;
      if (v37 >= 0.0) {
        double v40 = v37;
      }
      else {
        double v40 = 0.0;
      }
      [v38 setConstant:v40];

      v41 = [(PREditingFontPickerComponentViewController *)self stackViewTrailingConstraint];
      objc_msgSend(v41, "setConstant:", fmin(-v37, 0.0));

      self->_configuredViewWidth = v26;
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PREditingFontPickerComponentViewController;
  [(PREditingFontPickerComponentViewController *)&v8 viewDidLayoutSubviews];
  BOOL v3 = [(PREditingFontPickerComponentViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  if (v5 > 375.0)
  {
    LOBYTE(v6) = 0;
    if ([(PREditingFontPickerComponentViewController *)self isUsingSmallerSizing]) {
      goto LABEL_6;
    }
LABEL_5:
    if (self->_configuredViewWidth == v5) {
      return;
    }
    goto LABEL_6;
  }
  float v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v6 = [v7 userInterfaceIdiom] != 1;

  if (((v6 ^ [(PREditingFontPickerComponentViewController *)self isUsingSmallerSizing]) & 1) == 0) {
    goto LABEL_5;
  }
LABEL_6:
  self->_usingSmallerSizing = v6;
  [(PREditingFontPickerComponentViewController *)self updateLayoutForCurrentSize];
}

- (void)setLocale:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = (NSLocale *)a3;
  if (self->_locale != v5)
  {
    objc_storeStrong((id *)&self->_locale, a3);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v6 = [(PREditingFontPickerComponentViewController *)self cellViews];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = [v11 contentFont];
          double v13 = [(PREditingFontPickerComponentViewController *)self locale];
          v14 = [(PREditingFontPickerComponentViewController *)self contentStringForFont:v12 locale:v13];

          [v11 configureWithAttributedString:v14];
          [v11 invalidateIntrinsicContentSize];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    [(PREditingFontPickerComponentViewController *)self filterFontViewsByLocale];
  }
}

- (void)filterFontViewsByLocale
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (![(NSString *)self->_role isEqualToString:@"PRPosterRoleIncomingCall"])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = [(PREditingFontPickerComponentViewController *)self cellViews];
    uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = 0;
      uint64_t v19 = *(void *)v21;
      uint64_t v6 = *MEMORY[0x1E4FB08F8];
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v21 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v9 = [v8 contentFont];
          uint64_t v10 = [(PREditingFontPickerComponentViewController *)self locale];
          uint64_t v11 = [(PREditingFontPickerComponentViewController *)self contentStringForFont:v9 locale:v10];
          uint64_t v12 = [v11 string];

          double v13 = [v8 contentFont];
          v14 = [v13 fontDescriptor];
          long long v15 = [v14 objectForKey:v6];

          if ([v12 length])
          {
            unint64_t v16 = 0;
            do
            {
              int v17 = objc_msgSend(v15, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v16));
              if ((v17 & 1) == 0) {
                break;
              }
              ++v16;
            }
            while (v16 < [v12 length]);
          }
          else
          {
            int v17 = 1;
          }
          [v8 setHidden:v17 ^ 1u];
          if (((v17 ^ 1) & 1) == 0 && !v5) {
            id v5 = v8;
          }
          if (((v17 | [v8 isSelected] ^ 1) & 1) == 0) {
            [v5 sendActionsForControlEvents:0x2000];
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v4);
    }
    else
    {
      id v5 = 0;
    }
  }
}

- (double)estimatedHeight
{
  if (([(PREditingFontPickerComponentViewController *)self isViewLoaded] & 1) == 0
    && [(NSArray *)self->_items count] >= 2)
  {
    BOOL v3 = [(PREditingFontPickerComponentViewController *)self isUsingSmallerSizing];
    double v4 = 64.0;
    if (v3) {
      double v4 = 62.0;
    }
    self->_double largestItemHeight = v4;
  }
  double largestItemHeight = self->_largestItemHeight;
  if ([(PREditingFontPickerComponentViewController *)self isViewLoaded]
    && [(PREditingFontPickerComponentViewController *)self _shouldShowWeightSlider])
  {
    if ([(NSArray *)self->_items count] > 1) {
      double largestItemHeight = largestItemHeight + 16.0;
    }
    [(UISlider *)self->_fontWeightSlider bounds];
    return largestItemHeight + v6;
  }
  return largestItemHeight;
}

- (NSArray)items
{
  return self->_items;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (PREditingFontPickerComponentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PREditingFontPickerComponentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PREditingFontPickerItem)selectedItem
{
  return self->_selectedItem;
}

- (void)setSelectedItem:(id)a3
{
}

- (double)fontWeight
{
  return self->_fontWeight;
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
}

- (PREditingFontPickerCellView)selectedCellView
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

- (double)largestItemHeight
{
  return self->_largestItemHeight;
}

- (void)setLargestItemHeight:(double)a3
{
  self->_double largestItemHeight = a3;
}

- (UISlider)fontWeightSlider
{
  return self->_fontWeightSlider;
}

- (void)setFontWeightSlider:(id)a3
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

- (double)configuredViewWidth
{
  return self->_configuredViewWidth;
}

- (void)setConfiguredViewWidth:(double)a3
{
  self->_configuredViewWidth = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
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
  objc_storeStrong((id *)&self->_fontWeightSlider, 0);
  objc_storeStrong((id *)&self->_cellViews, 0);
  objc_storeStrong((id *)&self->_selectedCellView, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end