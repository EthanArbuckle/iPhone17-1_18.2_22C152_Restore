@interface PREditingContentStylePickerComponentViewController
- (BOOL)shouldShowContentStyleItems;
- (BOOL)showsHeader;
- (PREditingContentStyleItemsDataSource)dataSource;
- (PREditingContentStyleItemsViewController)itemsViewController;
- (PREditingContentStylePickerComponentViewController)init;
- (PREditingContentStylePickerComponentViewController)initWithConfiguration:(id)a3;
- (PREditingContentStylePickerComponentViewControllerDelegate)delegate;
- (PREditingPosterContentStyleCoordinator)uiKitColorPickerContentStyleCoordinator;
- (PREditingVariationSlider)sliderView;
- (PREditorContentStylePickerConfiguration)configuration;
- (PUIColorWell)colorWell;
- (PUIColorWellView)colorWellView;
- (UIColor)selectedColor;
- (UIStackView)verticalStack;
- (double)contentsLuminance;
- (double)estimatedHeight;
- (id)coordinatorForStyle:(id)a3 isSuggestedStyle:(BOOL)a4 fromDataSource:(id)a5;
- (void)_didSelectContentStyle:(id)a3 isSuggestedStyle:(BOOL)a4;
- (void)colorSliderDidUpdateVariation:(id)a3;
- (void)contentStyleItemsViewController:(id)a3 didSelectContentStyleCoordinator:(id)a4;
- (void)contentStyleItemsViewControllerDidUpdateEstimatedSize:(id)a3;
- (void)loadItemsViewControllerIfNeeded;
- (void)loadView;
- (void)setColorWell:(id)a3;
- (void)setColorWellView:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentsLuminance:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItemsViewController:(id)a3;
- (void)setSelectedColor:(id)a3;
- (void)setShowsHeader:(BOOL)a3;
- (void)setSliderView:(id)a3;
- (void)setUiKitColorPickerContentStyleCoordinator:(id)a3;
- (void)setVerticalStack:(id)a3;
- (void)updateSliderVisibility:(BOOL)a3;
@end

@implementation PREditingContentStylePickerComponentViewController

- (PREditingContentStylePickerComponentViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PREditingContentStylePickerComponentViewController;
  v6 = [(PREditingContentStylePickerComponentViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (PREditingContentStylePickerComponentViewController)init
{
  v3 = objc_alloc_init(PREditorContentStylePickerConfiguration);
  v4 = [(PREditingContentStylePickerComponentViewController *)self initWithConfiguration:v3];

  return v4;
}

- (void)loadItemsViewControllerIfNeeded
{
  if (!self->_itemsViewController)
  {
    v13 = [[PREditingContentStyleItemsDataSource alloc] initWithConfiguration:self->_configuration includesSuggestedStyle:1 delegate:self];
    objc_storeStrong((id *)&self->_dataSource, v13);
    if ([(PREditorContentStylePickerConfiguration *)self->_configuration isForTitleStylePicker]
      && ([MEMORY[0x1E4FB16C8] currentDevice],
          v3 = objc_claimAutoreleasedReturnValue(),
          uint64_t v4 = [v3 userInterfaceIdiom],
          v3,
          (v4 & 0xFFFFFFFFFFFFFFFBLL) != 1))
    {
      v6 = [(PREditingContentStyleItemsViewController *)[PREditingContentStyleItemsScrollableStackViewController alloc] initWithDataSource:v13 configuration:self->_configuration];
      [(PREditingContentStyleItemsViewController *)v6 setDelegate:self];
    }
    else
    {
      id v5 = [[PREditingContentStyleItemsViewController alloc] initWithDataSource:v13 configuration:self->_configuration];
      [(PREditingContentStyleItemsViewController *)v5 setDelegate:self];
      v6 = v5;
      if ([(PREditorContentStylePickerConfiguration *)self->_configuration colorWellDisplayMode] == 2)
      {
        v7 = [(PREditingContentStyleItemsViewController *)v6 colorWellView];
        colorWellView = self->_colorWellView;
        self->_colorWellView = v7;
        objc_super v9 = v7;

        v10 = [(PUIColorWellView *)v9 colorWell];
        colorWell = self->_colorWell;
        self->_colorWell = v10;
      }
    }
    [(PREditingContentStyleItemsViewController *)v6 setContentsLuminance:self->_contentsLuminance];
    itemsViewController = self->_itemsViewController;
    self->_itemsViewController = &v6->super;
  }
}

- (void)loadView
{
  v77[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  if (self->_showsHeader)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    id v5 = PRBundle();
    v6 = [v5 localizedStringForKey:@"COLOR_HEADING" value:&stru_1ED9A3120 table:@"PosterKit"];
    [v4 setText:v6];

    v7 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:18.0];
    [v4 setFont:v7];

    v8 = [MEMORY[0x1E4FB1618] labelColor];
    [v4 setTextColor:v8];

    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 addSubview:v4];
  }
  else
  {
    id v4 = 0;
  }
  [(PREditingContentStylePickerComponentViewController *)self loadItemsViewControllerIfNeeded];
  objc_super v9 = [(PREditingContentStylePickerComponentViewController *)self itemsViewController];
  v10 = [v9 view];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  unint64_t v11 = 0x1E4F1C000uLL;
  v12 = [MEMORY[0x1E4F1CA48] array];
  v71 = v10;
  [v12 addObject:v10];
  uint64_t v13 = [v9 selectedContentStyleCoordinator];
  v14 = [(PREditingContentStyleItemsDataSource *)self->_dataSource firstCoordinatorPassingTest:&__block_literal_global_369];

  v70 = (void *)v13;
  if (!v13)
  {
    v15 = [(PREditingContentStylePickerComponentViewController *)self delegate];
    v16 = [0 style];
    objc_msgSend(v15, "contentStylePickerComponentViewController:didSelectStyle:isSuggestedStyle:userSelected:", self, v16, objc_msgSend(0, "isSuggested"), 0);
  }
  if (v14)
  {
    v17 = [PREditingVariationSlider alloc];
    v18 = [(PREditorContentStylePickerConfiguration *)self->_configuration identifier];
    v19 = [(PREditingVariationSlider *)v17 initWithStyleCoordinator:v70 contextIdentifier:v18];

    [(PREditingVariationSlider *)v19 addTarget:self action:sel_colorSliderDidUpdateVariation_ forControlEvents:4096];
    v20 = [v9 selectedContentStyleCoordinator];
    v21 = [v20 style];
    char v22 = [v21 allowsVariation];

    v23 = v19;
    if ((v22 & 1) == 0) {
      [(PREditingVariationSlider *)v19 setHidden:1];
    }
    objc_storeStrong((id *)&self->_sliderView, v19);
    [v12 addObject:v19];
    unint64_t v11 = 0x1E4F1C000;
  }
  else
  {
    v23 = 0;
  }
  v66 = v12;
  v24 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v12];
  [v24 setAxis:1];
  [v24 setAlignment:3];
  [v24 setSpacing:24.0];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_storeStrong((id *)&self->_verticalStack, v24);
  [v3 addSubview:v24];
  [(PREditingContentStylePickerComponentViewController *)self addChildViewController:v9];
  [(PREditingContentStylePickerComponentViewController *)self setView:v3];
  v67 = v9;
  [v9 didMoveToParentViewController:self];
  v25 = [*(id *)(v11 + 2632) array];
  v72 = v3;
  v73 = v23;
  v68 = v4;
  if (self->_showsHeader)
  {
    v62 = [v4 leadingAnchor];
    uint64_t v64 = [v3 leadingAnchor];
    uint64_t v60 = [v62 constraintEqualToAnchor:v64 constant:20.0];
    v77[0] = v60;
    v26 = [v4 topAnchor];
    v27 = [v3 topAnchor];
    v28 = [v26 constraintEqualToAnchor:v27 constant:10.0];
    v77[1] = v28;
    v29 = [v24 topAnchor];
    v30 = [v4 bottomAnchor];
    v31 = [v29 constraintEqualToAnchor:v30 constant:20.0];
    v77[2] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:3];
    v33 = v25;
    [v25 addObjectsFromArray:v32];

    v34 = (void *)v60;
    v35 = v62;

    v36 = (void *)v64;
    v23 = v73;
  }
  else
  {
    v35 = [v24 topAnchor];
    v36 = [v3 topAnchor];
    v34 = [v35 constraintEqualToAnchor:v36];
    v76 = v34;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
    v33 = v25;
    [v25 addObjectsFromArray:v26];
  }
  v69 = v33;

  unint64_t v37 = 0x1E4F1C000;
  if (v23)
  {
    v38 = [(PREditingVariationSlider *)v73 heightAnchor];
    +[PREditingVariationSlider defaultHeight];
    v39 = objc_msgSend(v38, "constraintEqualToConstant:");
    v75[0] = v39;
    v40 = [(PREditingVariationSlider *)v73 leadingAnchor];
    v41 = [v24 leadingAnchor];
    v42 = [v40 constraintEqualToAnchor:v41 constant:36.0];
    v75[1] = v42;
    v43 = [(PREditingVariationSlider *)v73 trailingAnchor];
    v44 = [v24 trailingAnchor];
    v45 = [v43 constraintEqualToAnchor:v44 constant:-36.0];
    v75[2] = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:3];
    [v69 addObjectsFromArray:v46];

    unint64_t v37 = 0x1E4F1C000uLL;
  }
  v65 = [v71 leadingAnchor];
  v63 = [v24 leadingAnchor];
  v61 = [v65 constraintEqualToAnchor:v63];
  v74[0] = v61;
  v59 = [v71 trailingAnchor];
  v58 = [v24 trailingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v74[1] = v57;
  v56 = [v24 leadingAnchor];
  v55 = [v72 leadingAnchor];
  v47 = [v56 constraintEqualToAnchor:v55];
  v74[2] = v47;
  v48 = [v24 trailingAnchor];
  v49 = [v72 trailingAnchor];
  v50 = [v48 constraintEqualToAnchor:v49];
  v74[3] = v50;
  v51 = [v24 bottomAnchor];
  v52 = [v72 bottomAnchor];
  v53 = [v51 constraintEqualToAnchor:v52];
  v74[4] = v53;
  v54 = [*(id *)(v37 + 2424) arrayWithObjects:v74 count:5];
  [v69 addObjectsFromArray:v54];

  [MEMORY[0x1E4F28DC8] activateConstraints:v69];
}

uint64_t __62__PREditingContentStylePickerComponentViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 style];
  uint64_t v3 = [v2 allowsVariation];

  return v3;
}

- (BOOL)shouldShowContentStyleItems
{
  v2 = [(PREditingContentStylePickerComponentViewController *)self itemsViewController];
  uint64_t v3 = [v2 configuration];
  id v4 = [v3 stylePalette];
  id v5 = [v4 styles];
  unint64_t v6 = [v5 count];

  return v6 < 2;
}

- (void)setContentsLuminance:(double)a3
{
  self->_contentsLuminance = a3;
  if ([(PREditingContentStylePickerComponentViewController *)self isViewLoaded])
  {
    itemsViewController = self->_itemsViewController;
    [(PREditingContentStyleItemsViewController *)itemsViewController setContentsLuminance:a3];
  }
}

- (double)estimatedHeight
{
  [(PREditingContentStylePickerComponentViewController *)self loadItemsViewControllerIfNeeded];
  [(PREditingContentStyleItemsViewController *)self->_itemsViewController estimatedHeight];
  double v4 = v3;
  if (self->_sliderView)
  {
    id v5 = [(PREditingContentStyleItemsViewController *)self->_itemsViewController selectedContentStyleCoordinator];
    unint64_t v6 = [v5 style];
    if ([v6 allowsVariation])
    {
      BOOL v7 = [(PREditingContentStylePickerComponentViewController *)self shouldShowContentStyleItems];

      if (!v7) {
        return v4 + 58.0;
      }
    }
    else
    {
    }
  }
  return v4;
}

- (void)contentStyleItemsViewController:(id)a3 didSelectContentStyleCoordinator:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [v5 style];
  uint64_t v7 = [v6 allowsVariation];

  v8 = [(PREditingContentStyleItemsDataSource *)self->_dataSource firstCoordinatorPassingTest:&__block_literal_global_374];

  if (v8 && v7 == [(PREditingVariationSlider *)self->_sliderView isHidden]) {
    [(PREditingContentStylePickerComponentViewController *)self updateSliderVisibility:v7];
  }
  [(PREditingVariationSlider *)self->_sliderView setStyleCoordinator:v5];
  id v10 = [v5 style];
  uint64_t v9 = [v5 isSuggested];

  [(PREditingContentStylePickerComponentViewController *)self _didSelectContentStyle:v10 isSuggestedStyle:v9];
}

uint64_t __119__PREditingContentStylePickerComponentViewController_contentStyleItemsViewController_didSelectContentStyleCoordinator___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 style];
  uint64_t v3 = [v2 allowsVariation];

  return v3;
}

- (void)contentStyleItemsViewControllerDidUpdateEstimatedSize:(id)a3
{
  id v4 = [(PREditingContentStylePickerComponentViewController *)self delegate];
  [v4 contentStylePickerComponentViewControllerDidChangeHeight:self];
}

- (void)updateSliderVisibility:(BOOL)a3
{
  [(PREditingVariationSlider *)self->_sliderView setHidden:!a3];
  id v4 = [(PREditingContentStylePickerComponentViewController *)self delegate];
  [v4 contentStylePickerComponentViewControllerDidChangeHeight:self];
}

- (void)_didSelectContentStyle:(id)a3 isSuggestedStyle:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PREditingContentStylePickerComponentViewController *)self delegate];
  [v7 contentStylePickerComponentViewController:self didSelectStyle:v6 isSuggestedStyle:v4 userSelected:1];
}

- (void)colorSliderDidUpdateVariation:(id)a3
{
  BOOL v4 = [(PREditingContentStyleItemsViewController *)self->_itemsViewController selectedContentStyleCoordinator];
  if (v4)
  {
    id v6 = v4;
    id v5 = [v4 style];
    -[PREditingContentStylePickerComponentViewController _didSelectContentStyle:isSuggestedStyle:](self, "_didSelectContentStyle:isSuggestedStyle:", v5, [v6 isSuggested]);

    BOOL v4 = v6;
  }
}

- (id)coordinatorForStyle:(id)a3 isSuggestedStyle:(BOOL)a4 fromDataSource:(id)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  v8 = [(PREditingContentStylePickerComponentViewController *)self delegate];
  uint64_t v9 = [v8 contentStylePickerComponentViewController:self coordinatorForStyle:v7 isSuggested:v5];

  return v9;
}

- (PREditingContentStylePickerComponentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PREditingContentStylePickerComponentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PREditingPosterContentStyleCoordinator)uiKitColorPickerContentStyleCoordinator
{
  return self->_uiKitColorPickerContentStyleCoordinator;
}

- (void)setUiKitColorPickerContentStyleCoordinator:(id)a3
{
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (PUIColorWellView)colorWellView
{
  return self->_colorWellView;
}

- (void)setColorWellView:(id)a3
{
}

- (PUIColorWell)colorWell
{
  return self->_colorWell;
}

- (void)setColorWell:(id)a3
{
}

- (PREditorContentStylePickerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (PREditingContentStyleItemsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
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

- (PREditingContentStyleItemsViewController)itemsViewController
{
  return self->_itemsViewController;
}

- (void)setItemsViewController:(id)a3
{
}

- (PREditingVariationSlider)sliderView
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
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_colorWell, 0);
  objc_storeStrong((id *)&self->_colorWellView, 0);
  objc_storeStrong((id *)&self->_uiKitColorPickerContentStyleCoordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end