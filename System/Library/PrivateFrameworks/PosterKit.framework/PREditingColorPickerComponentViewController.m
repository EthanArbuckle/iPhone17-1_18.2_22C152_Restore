@interface PREditingColorPickerComponentViewController
- (BOOL)forFontPicker;
- (BOOL)shouldShowColorItems;
- (BOOL)showsHeader;
- (PREditingColorItemsViewController)itemsViewController;
- (PREditingColorPickerComponentViewController)init;
- (PREditingColorPickerComponentViewController)initWithConfiguration:(id)a3 variationStore:(id)a4;
- (PREditingColorPickerComponentViewControllerDelegate)delegate;
- (PREditingColorSlider)sliderView;
- (PREditingColorVariationStore)variationStore;
- (PREditorColorPickerConfiguration)configuration;
- (UIColor)selectedColor;
- (UIStackView)verticalStack;
- (double)contentsLuminance;
- (double)estimatedHeight;
- (void)colorItemsViewController:(id)a3 didSelectColorItem:(id)a4;
- (void)colorItemsViewController:(id)a3 didTapToResetColorItem:(id)a4;
- (void)colorItemsViewControllerDidUpdateEstimatedSize:(id)a3;
- (void)colorSliderDidUpdateColor:(id)a3;
- (void)didSelectColorItem:(id)a3;
- (void)loadItemsViewControllerIfNeeded;
- (void)loadView;
- (void)setConfiguration:(id)a3;
- (void)setContentsLuminance:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setForFontPicker:(BOOL)a3;
- (void)setItemsViewController:(id)a3;
- (void)setSelectedColor:(id)a3;
- (void)setShowsHeader:(BOOL)a3;
- (void)setSliderView:(id)a3;
- (void)setVariationStore:(id)a3;
- (void)setVerticalStack:(id)a3;
- (void)updateForColorWellSelectedItem:(id)a3;
- (void)updateSliderVisibility:(BOOL)a3;
@end

@implementation PREditingColorPickerComponentViewController

- (PREditingColorPickerComponentViewController)initWithConfiguration:(id)a3 variationStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PREditingColorPickerComponentViewController;
  v9 = [(PREditingColorPickerComponentViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_variationStore, a4);
  }

  return v10;
}

- (PREditingColorPickerComponentViewController)init
{
  v3 = objc_alloc_init(PREditorColorPickerConfiguration);
  v4 = [(PREditingColorPickerComponentViewController *)self initWithConfiguration:v3 variationStore:0];

  return v4;
}

- (void)loadItemsViewControllerIfNeeded
{
  if (!self->_itemsViewController)
  {
    unint64_t v3 = [(PREditorColorPickerConfiguration *)self->_configuration context];
    v4 = [MEMORY[0x1E4F1CA48] array];
    if (v3 == 1)
    {
      v5 = [[PREditingVibrantColorItemsDataSource alloc] initWithConfiguration:self->_configuration variationStore:self->_variationStore];
      [v4 addObject:v5];
    }
    v6 = [[PREditingPaletteColorItemsDataSource alloc] initWithConfiguration:self->_configuration variationStore:self->_variationStore includesSuggestedColor:v3 != 1];
    [v4 addObject:v6];

    if ((unint64_t)[v4 count] < 2)
    {
      v14 = [v4 firstObject];
    }
    else
    {
      id v7 = [PREditingColorItemsAggregateDataSource alloc];
      id v8 = (void *)[v4 copy];
      v14 = [(PREditingColorItemsAggregateDataSource *)v7 initWithDataSources:v8];
    }
    if (v3 == 1
      && ([MEMORY[0x1E4FB16C8] currentDevice],
          v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 userInterfaceIdiom],
          v9,
          (v10 & 0xFFFFFFFFFFFFFFFBLL) != 1))
    {
      v11 = off_1E54D9D08;
    }
    else
    {
      v11 = off_1E54D9D10;
    }
    objc_super v12 = (PREditingColorItemsViewController *)[objc_alloc(*v11) initWithDataSource:v14 configuration:self->_configuration variationStore:self->_variationStore];
    [(PREditingColorItemsViewController *)v12 setDelegate:self];
    [(PREditingColorItemsViewController *)v12 setContentsLuminance:self->_contentsLuminance];
    itemsViewController = self->_itemsViewController;
    self->_itemsViewController = v12;
  }
}

- (void)loadView
{
  v73[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  if (self->_showsHeader)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v5 = PRBundle();
    v6 = [v5 localizedStringForKey:@"COLOR_HEADING" value:&stru_1ED9A3120 table:@"PosterKit"];
    [v4 setText:v6];

    id v7 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:18.0];
    [v4 setFont:v7];

    id v8 = [MEMORY[0x1E4FB1618] labelColor];
    [v4 setTextColor:v8];

    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 addSubview:v4];
  }
  else
  {
    id v4 = 0;
  }
  [(PREditingColorPickerComponentViewController *)self loadItemsViewControllerIfNeeded];
  v9 = [(PREditingColorPickerComponentViewController *)self itemsViewController];
  uint64_t v10 = [v9 view];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  unint64_t v11 = 0x1E4F1C000uLL;
  objc_super v12 = [MEMORY[0x1E4F1CA48] array];
  [v12 addObject:v10];
  if ([(PREditingColorPickerComponentViewController *)self shouldShowColorItems]) {
    [v10 setHidden:1];
  }
  v67 = [v9 selectedColorItem];
  if ([v67 isFromUIKitColorPicker])
  {
    v13 = [(PREditingColorPickerComponentViewController *)self delegate];
    [v13 colorPickerComponentViewController:self didSelectColorItem:v67 userSelected:0];
  }
  v68 = v10;
  if ([(PREditorColorPickerConfiguration *)self->_configuration showsSlider])
  {
    v14 = v12;
    v15 = [PREditingColorSlider alloc];
    variationStore = self->_variationStore;
    v17 = [(PREditorColorPickerConfiguration *)self->_configuration identifier];
    uint64_t v18 = [(PREditingColorSlider *)v15 initWithVariationStore:variationStore contextIdentifier:v17 pickerContext:[(PREditorColorPickerConfiguration *)self->_configuration context]];

    v19 = (void *)v18;
    v20 = [v67 pickerColor];
    [v19 setPickerColor:v20];

    [v19 addTarget:self action:sel_colorSliderDidUpdateColor_ forControlEvents:4096];
    v21 = [v9 selectedColorItem];
    LOBYTE(variationStore) = [v21 shouldShowSlider];

    if ((variationStore & 1) == 0) {
      [v19 setHidden:1];
    }
    objc_storeStrong((id *)&self->_sliderView, v19);
    objc_super v12 = v14;
    [v14 addObject:v19];
    unint64_t v11 = 0x1E4F1C000;
  }
  else
  {
    v19 = 0;
  }
  v66 = v19;
  v62 = v12;
  v22 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v12];
  [v22 setAxis:1];
  [v22 setAlignment:3];
  [v22 setSpacing:24.0];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_storeStrong((id *)&self->_verticalStack, v22);
  [v3 addSubview:v22];
  [(PREditingColorPickerComponentViewController *)self addChildViewController:v9];
  [(PREditingColorPickerComponentViewController *)self setView:v3];
  v63 = v9;
  [v9 didMoveToParentViewController:self];
  v23 = [*(id *)(v11 + 2632) array];
  v69 = v3;
  v64 = v4;
  v65 = v23;
  if (self->_showsHeader)
  {
    v59 = [v4 leadingAnchor];
    uint64_t v57 = [v3 leadingAnchor];
    uint64_t v24 = [v59 constraintEqualToAnchor:v57 constant:20.0];
    v73[0] = v24;
    v25 = [v4 topAnchor];
    v55 = [v3 topAnchor];
    v26 = [v25 constraintEqualToAnchor:v55 constant:10.0];
    v73[1] = v26;
    v27 = [v22 topAnchor];
    v28 = [v4 bottomAnchor];
    v29 = [v27 constraintEqualToAnchor:v28 constant:20.0];
    v73[2] = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
    [v23 addObjectsFromArray:v30];

    v31 = (void *)v24;
    v32 = (void *)v57;

    v33 = v59;
  }
  else
  {
    v33 = [v22 topAnchor];
    v32 = [v3 topAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v72 = v31;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
    [v23 addObjectsFromArray:v25];
  }

  if ([(PREditorColorPickerConfiguration *)self->_configuration showsSlider])
  {
    v34 = [v66 heightAnchor];
    v35 = [v34 constraintEqualToConstant:34.0];
    v71[0] = v35;
    v36 = [v66 leadingAnchor];
    v37 = [v22 leadingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37 constant:36.0];
    v71[1] = v38;
    v39 = [v66 trailingAnchor];
    v40 = [v22 trailingAnchor];
    v41 = [v39 constraintEqualToAnchor:v40 constant:-36.0];
    v71[2] = v41;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:3];
    [v65 addObjectsFromArray:v42];
  }
  v61 = [v68 leadingAnchor];
  v60 = [v22 leadingAnchor];
  v58 = [v61 constraintEqualToAnchor:v60];
  v70[0] = v58;
  v56 = [v68 trailingAnchor];
  v54 = [v22 trailingAnchor];
  v53 = [v56 constraintEqualToAnchor:v54];
  v70[1] = v53;
  v52 = [v22 leadingAnchor];
  v51 = [v69 leadingAnchor];
  v43 = [v52 constraintEqualToAnchor:v51];
  v70[2] = v43;
  v44 = [v22 trailingAnchor];
  v45 = [v69 trailingAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  v70[3] = v46;
  v47 = [v22 bottomAnchor];
  v48 = [v69 bottomAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  v70[4] = v49;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:5];
  [v65 addObjectsFromArray:v50];

  [MEMORY[0x1E4F28DC8] activateConstraints:v65];
}

- (BOOL)shouldShowColorItems
{
  v2 = [(PREditingColorPickerComponentViewController *)self itemsViewController];
  id v3 = [v2 configuration];
  id v4 = [v3 colorPalette];
  v5 = [v4 pickerColors];
  unint64_t v6 = [v5 count];

  return v6 < 2;
}

- (void)setContentsLuminance:(double)a3
{
  self->_contentsLuminance = a3;
  if ([(PREditingColorPickerComponentViewController *)self isViewLoaded])
  {
    itemsViewController = self->_itemsViewController;
    [(PREditingColorItemsViewController *)itemsViewController setContentsLuminance:a3];
  }
}

- (double)estimatedHeight
{
  [(PREditingColorPickerComponentViewController *)self loadItemsViewControllerIfNeeded];
  [(PREditingColorItemsViewController *)self->_itemsViewController estimatedHeight];
  double v4 = v3;
  if ([(PREditorColorPickerConfiguration *)self->_configuration showsSlider])
  {
    v5 = [(PREditingColorItemsViewController *)self->_itemsViewController selectedColorItem];
    if ([v5 shouldShowSlider])
    {
      BOOL v6 = [(PREditingColorPickerComponentViewController *)self shouldShowColorItems];

      if (!v6) {
        return v4 + 58.0;
      }
    }
    else
    {
    }
  }
  return v4;
}

- (void)updateForColorWellSelectedItem:(id)a3
{
  itemsViewController = self->_itemsViewController;
  id v5 = a3;
  [(PREditingColorItemsViewController *)itemsViewController setSelectedColorItem:v5];
  sliderView = self->_sliderView;
  id v7 = [v5 pickerColor];

  [(PREditingColorSlider *)sliderView setPickerColor:v7];
}

- (void)colorItemsViewController:(id)a3 didSelectColorItem:(id)a4
{
  id v9 = a4;
  if ([v9 shouldShowSlider])
  {
    id v5 = [v9 pickerColor];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  if ([(PREditorColorPickerConfiguration *)self->_configuration showsSlider]
    && v6 == [(PREditingColorSlider *)self->_sliderView isHidden])
  {
    [(PREditingColorPickerComponentViewController *)self updateSliderVisibility:v6];
  }
  sliderView = self->_sliderView;
  id v8 = [v9 pickerColor];
  [(PREditingColorSlider *)sliderView setPickerColor:v8];

  [(PREditingColorPickerComponentViewController *)self didSelectColorItem:v9];
}

- (void)colorItemsViewController:(id)a3 didTapToResetColorItem:(id)a4
{
  id v6 = a4;
  if (([(PREditingColorSlider *)self->_sliderView isHidden] & 1) == 0)
  {
    sliderView = self->_sliderView;
    [v6 variation];
    -[PREditingColorSlider setVariation:](sliderView, "setVariation:");
    [(PREditingColorPickerComponentViewController *)self didSelectColorItem:v6];
  }
}

- (void)colorItemsViewControllerDidUpdateEstimatedSize:(id)a3
{
  id v4 = [(PREditingColorPickerComponentViewController *)self delegate];
  [v4 colorPickerComponentViewControllerDidChangeHeight:self];
}

- (void)updateSliderVisibility:(BOOL)a3
{
  [(PREditingColorSlider *)self->_sliderView setHidden:!a3];
  id v4 = [(PREditingColorPickerComponentViewController *)self delegate];
  [v4 colorPickerComponentViewControllerDidChangeHeight:self];
}

- (void)didSelectColorItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PREditingColorPickerComponentViewController *)self delegate];
  [v5 colorPickerComponentViewController:self didSelectColorItem:v4 userSelected:1];
}

- (void)colorSliderDidUpdateColor:(id)a3
{
  id v5 = a3;
  id v4 = [(PREditingColorItemsViewController *)self->_itemsViewController selectedColorItem];
  if (v4)
  {
    [v5 variation];
    objc_msgSend(v4, "setVariation:");
    [(PREditingColorPickerComponentViewController *)self didSelectColorItem:v4];
    [(PREditingColorItemsViewController *)self->_itemsViewController sliderDidChangeForColorItem:v4];
  }
}

- (PREditingColorPickerComponentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PREditingColorPickerComponentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (PREditorColorPickerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (PREditingColorVariationStore)variationStore
{
  return self->_variationStore;
}

- (void)setVariationStore:(id)a3
{
}

- (BOOL)forFontPicker
{
  return self->_forFontPicker;
}

- (void)setForFontPicker:(BOOL)a3
{
  self->_forFontPicker = a3;
}

- (BOOL)showsHeader
{
  return self->_showsHeader;
}

- (void)setShowsHeader:(BOOL)a3
{
  self->_showsHeader = a3;
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
}

- (UIStackView)verticalStack
{
  return self->_verticalStack;
}

- (void)setVerticalStack:(id)a3
{
}

- (PREditingColorItemsViewController)itemsViewController
{
  return self->_itemsViewController;
}

- (void)setItemsViewController:(id)a3
{
}

- (PREditingColorSlider)sliderView
{
  return self->_sliderView;
}

- (void)setSliderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_storeStrong((id *)&self->_itemsViewController, 0);
  objc_storeStrong((id *)&self->_verticalStack, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_variationStore, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end