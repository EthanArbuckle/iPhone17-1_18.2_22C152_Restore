@interface PUIStylePickerComponentViewController
- (BOOL)shouldShowContentStyleItems;
- (BOOL)showsHeader;
- (PUIColorWell)colorWell;
- (PUIColorWellView)colorWellView;
- (PUIStyleConfiguration)configuration;
- (PUIStyleConfiguration)styleConfiguration;
- (PUIStyleItemsDataSource)dataSource;
- (PUIStyleItemsViewController)itemsViewController;
- (PUIStylePickerComponentViewController)init;
- (PUIStylePickerComponentViewController)initWithConfiguration:(id)a3;
- (PUIStylePickerComponentViewControllerDelegate)delegate;
- (PUIStyleUICoordinator)uiKitColorPickerContentStyleCoordinator;
- (PUIStyleVariationSlider)sliderView;
- (UIColor)selectedColor;
- (UIStackView)verticalStack;
- (double)contentsLuminance;
- (double)estimatedHeight;
- (id)coordinatorForStyle:(id)a3 isSuggestedStyle:(BOOL)a4 fromDataSource:(id)a5;
- (id)stylePickerComponentViewController:(id)a3 coordinatorForStyle:(id)a4 isSuggested:(BOOL)a5;
- (void)_didSelectContentStyle:(id)a3 isSuggestedStyle:(BOOL)a4;
- (void)colorSliderDidUpdateVariation:(id)a3;
- (void)loadItemsViewControllerIfNeeded;
- (void)loadView;
- (void)setConfiguration:(id)a3;
- (void)setContentsLuminance:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItemsViewController:(id)a3;
- (void)setSelectedColor:(id)a3;
- (void)setShowsHeader:(BOOL)a3;
- (void)setSliderView:(id)a3;
- (void)setVerticalStack:(id)a3;
- (void)styleItemsViewController:(id)a3 didSelectContentStyleCoordinator:(id)a4;
- (void)styleItemsViewControllerDidUpdateEstimatedSize:(id)a3;
- (void)stylePickerComponentViewController:(id)a3 didSelectStyle:(id)a4 isSuggestedStyle:(BOOL)a5 userSelected:(BOOL)a6;
- (void)stylePickerComponentViewControllerDidChangeHeight:(id)a3;
- (void)updateSliderVisibility:(BOOL)a3;
@end

@implementation PUIStylePickerComponentViewController

- (PUIStylePickerComponentViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUIStylePickerComponentViewController;
  v6 = [(PUIStylePickerComponentViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (PUIStylePickerComponentViewController)init
{
  v3 = objc_alloc_init(PUIStyleConfiguration);
  v4 = [(PUIStylePickerComponentViewController *)self initWithConfiguration:v3];

  return v4;
}

- (void)loadItemsViewControllerIfNeeded
{
  if (!self->_itemsViewController)
  {
    v13 = [[PUIStyleItemsDataSource alloc] initWithConfiguration:self->_configuration includesSuggestedStyle:1 delegate:self];
    objc_storeStrong((id *)&self->_dataSource, v13);
    if ([(PUIStyleConfiguration *)self->_configuration isForTitleStylePicker]
      && ([MEMORY[0x263F1C5C0] currentDevice],
          v3 = objc_claimAutoreleasedReturnValue(),
          uint64_t v4 = [v3 userInterfaceIdiom],
          v3,
          (v4 & 0xFFFFFFFFFFFFFFFBLL) != 1))
    {
      v6 = [(PUIStyleItemsViewController *)[PUIStyleItemsScrollableStackViewController alloc] initWithDataSource:v13 configuration:self->_configuration];
      [(PUIStyleItemsViewController *)v6 setDelegate:self];
    }
    else
    {
      id v5 = [[PUIStyleItemsViewController alloc] initWithDataSource:v13 configuration:self->_configuration];
      [(PUIStyleItemsViewController *)v5 setDelegate:self];
      v6 = v5;
      if ([(PUIStyleConfiguration *)self->_configuration colorWellDisplayMode] == 2)
      {
        v7 = [(PUIStyleItemsViewController *)v6 colorWellView];
        colorWellView = self->_colorWellView;
        self->_colorWellView = v7;
        objc_super v9 = v7;

        v10 = [(PUIColorWellView *)v9 colorWell];
        colorWell = self->_colorWell;
        self->_colorWell = v10;
      }
    }
    [(PUIStyleItemsViewController *)v6 setContentsLuminance:self->_contentsLuminance];
    itemsViewController = self->_itemsViewController;
    self->_itemsViewController = &v6->super;
  }
}

- (void)loadView
{
  v77[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F1CB60]);
  if (self->_showsHeader)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1C768]);
    id v5 = PUIBundle();
    v6 = [v5 localizedStringForKey:@"COLOR_HEADING" value:&stru_270801C00 table:0];
    [v4 setText:v6];

    v7 = [MEMORY[0x263F1C658] boldSystemFontOfSize:18.0];
    [v4 setFont:v7];

    v8 = [MEMORY[0x263F1C550] labelColor];
    [v4 setTextColor:v8];

    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 addSubview:v4];
  }
  else
  {
    id v4 = 0;
  }
  [(PUIStylePickerComponentViewController *)self loadItemsViewControllerIfNeeded];
  objc_super v9 = [(PUIStylePickerComponentViewController *)self itemsViewController];
  v10 = [v9 view];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  unint64_t v11 = 0x263EFF000uLL;
  v12 = [MEMORY[0x263EFF980] array];
  v71 = v10;
  [v12 addObject:v10];
  uint64_t v13 = [v9 selectedStyleCoordinator];
  v14 = [(PUIStyleItemsDataSource *)self->_dataSource firstCoordinatorPassingTest:&__block_literal_global_6];

  v70 = (void *)v13;
  if (!v13)
  {
    v15 = [(PUIStylePickerComponentViewController *)self delegate];
    v16 = [0 style];
    objc_msgSend(v15, "stylePickerComponentViewController:didSelectStyle:isSuggestedStyle:userSelected:", self, v16, objc_msgSend(0, "isSuggested"), 0);
  }
  if (v14)
  {
    v17 = [PUIStyleVariationSlider alloc];
    v18 = [(PUIStyleConfiguration *)self->_configuration identifier];
    v19 = [(PUIStyleVariationSlider *)v17 initWithStyleCoordinator:v70 contextIdentifier:v18];

    [(PUIStyleVariationSlider *)v19 addTarget:self action:sel_colorSliderDidUpdateVariation_ forControlEvents:4096];
    v20 = [v9 selectedStyleCoordinator];
    v21 = [v20 style];
    char v22 = [v21 allowsVariation];

    v23 = v19;
    if ((v22 & 1) == 0) {
      [(PUIStyleVariationSlider *)v19 setHidden:1];
    }
    objc_storeStrong((id *)&self->_sliderView, v19);
    [v12 addObject:v19];
    unint64_t v11 = 0x263EFF000;
  }
  else
  {
    v23 = 0;
  }
  v66 = v12;
  v24 = (void *)[objc_alloc(MEMORY[0x263F1C9B8]) initWithArrangedSubviews:v12];
  [v24 setAxis:1];
  [v24 setAlignment:3];
  [v24 setSpacing:24.0];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_storeStrong((id *)&self->_verticalStack, v24);
  [v3 addSubview:v24];
  [(PUIStylePickerComponentViewController *)self addChildViewController:v9];
  [(PUIStylePickerComponentViewController *)self setView:v3];
  v67 = v9;
  [v9 didMoveToParentViewController:self];
  v25 = [*(id *)(v11 + 2432) array];
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
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:3];
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
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:1];
    v33 = v25;
    [v25 addObjectsFromArray:v26];
  }
  v69 = v33;

  unint64_t v37 = 0x263EFF000;
  if (v23)
  {
    v38 = [(PUIStyleVariationSlider *)v73 heightAnchor];
    +[PUIStyleVariationSlider defaultHeight];
    v39 = objc_msgSend(v38, "constraintEqualToConstant:");
    v75[0] = v39;
    v40 = [(PUIStyleVariationSlider *)v73 leadingAnchor];
    v41 = [v24 leadingAnchor];
    v42 = [v40 constraintEqualToAnchor:v41 constant:36.0];
    v75[1] = v42;
    v43 = [(PUIStyleVariationSlider *)v73 trailingAnchor];
    v44 = [v24 trailingAnchor];
    v45 = [v43 constraintEqualToAnchor:v44 constant:-36.0];
    v75[2] = v45;
    v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:3];
    [v69 addObjectsFromArray:v46];

    unint64_t v37 = 0x263EFF000uLL;
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
  v54 = [*(id *)(v37 + 2240) arrayWithObjects:v74 count:5];
  [v69 addObjectsFromArray:v54];

  [MEMORY[0x263F08938] activateConstraints:v69];
}

uint64_t __49__PUIStylePickerComponentViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 style];
  uint64_t v3 = [v2 allowsVariation];

  return v3;
}

- (BOOL)shouldShowContentStyleItems
{
  v2 = [(PUIStylePickerComponentViewController *)self itemsViewController];
  uint64_t v3 = [v2 configuration];
  id v4 = [v3 stylePalette];
  id v5 = [v4 styles];
  unint64_t v6 = [v5 count];

  return v6 < 2;
}

- (void)setContentsLuminance:(double)a3
{
  self->_contentsLuminance = a3;
  if ([(PUIStylePickerComponentViewController *)self isViewLoaded])
  {
    itemsViewController = self->_itemsViewController;
    [(PUIStyleItemsViewController *)itemsViewController setContentsLuminance:a3];
  }
}

- (double)estimatedHeight
{
  [(PUIStylePickerComponentViewController *)self loadItemsViewControllerIfNeeded];
  [(PUIStyleItemsViewController *)self->_itemsViewController estimatedHeight];
  double v4 = v3;
  if (self->_sliderView)
  {
    id v5 = [(PUIStyleItemsViewController *)self->_itemsViewController selectedStyleCoordinator];
    unint64_t v6 = [v5 style];
    if ([v6 allowsVariation])
    {
      BOOL v7 = [(PUIStylePickerComponentViewController *)self shouldShowContentStyleItems];

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

- (void)updateSliderVisibility:(BOOL)a3
{
  [(PUIStyleVariationSlider *)self->_sliderView setHidden:!a3];
  id v4 = [(PUIStylePickerComponentViewController *)self delegate];
  [v4 stylePickerComponentViewControllerDidChangeHeight:self];
}

- (void)_didSelectContentStyle:(id)a3 isSuggestedStyle:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PUIStylePickerComponentViewController *)self delegate];
  [v7 stylePickerComponentViewController:self didSelectStyle:v6 isSuggestedStyle:v4 userSelected:1];
}

- (void)colorSliderDidUpdateVariation:(id)a3
{
  BOOL v4 = [(PUIStyleItemsViewController *)self->_itemsViewController selectedStyleCoordinator];
  if (v4)
  {
    id v6 = v4;
    id v5 = [v4 style];
    -[PUIStylePickerComponentViewController _didSelectContentStyle:isSuggestedStyle:](self, "_didSelectContentStyle:isSuggestedStyle:", v5, [v6 isSuggested]);

    BOOL v4 = v6;
  }
}

- (void)styleItemsViewController:(id)a3 didSelectContentStyleCoordinator:(id)a4
{
  id v5 = a4;
  id v6 = [v5 style];
  uint64_t v7 = [v6 allowsVariation];

  v8 = [(PUIStyleItemsDataSource *)self->_dataSource firstCoordinatorPassingTest:&__block_literal_global_20];

  if (v8 && v7 == [(PUIStyleVariationSlider *)self->_sliderView isHidden]) {
    [(PUIStylePickerComponentViewController *)self updateSliderVisibility:v7];
  }
  [(PUIStyleVariationSlider *)self->_sliderView setStyleCoordinator:v5];
  id v10 = [v5 style];
  uint64_t v9 = [v5 isSuggested];

  [(PUIStylePickerComponentViewController *)self _didSelectContentStyle:v10 isSuggestedStyle:v9];
}

uint64_t __99__PUIStylePickerComponentViewController_styleItemsViewController_didSelectContentStyleCoordinator___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 style];
  uint64_t v3 = [v2 allowsVariation];

  return v3;
}

- (void)styleItemsViewControllerDidUpdateEstimatedSize:(id)a3
{
  id v4 = [(PUIStylePickerComponentViewController *)self delegate];
  [v4 stylePickerComponentViewControllerDidChangeHeight:self];
}

- (id)stylePickerComponentViewController:(id)a3 coordinatorForStyle:(id)a4 isSuggested:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v8 = [(PUIStylePickerComponentViewController *)self delegate];
  uint64_t v9 = [v8 stylePickerComponentViewController:self coordinatorForStyle:v7 isSuggested:v5];

  return v9;
}

- (void)stylePickerComponentViewController:(id)a3 didSelectStyle:(id)a4 isSuggestedStyle:(BOOL)a5 userSelected:(BOOL)a6
{
  BOOL v6 = a5;
  id v10 = a4;
  v8 = [(PUIStylePickerComponentViewController *)self delegate];
  id v9 = (id)[v8 stylePickerComponentViewController:self coordinatorForStyle:v10 isSuggested:v6];
}

- (void)stylePickerComponentViewControllerDidChangeHeight:(id)a3
{
  id v4 = [(PUIStylePickerComponentViewController *)self delegate];
  [v4 stylePickerComponentViewControllerDidChangeHeight:self];
}

- (id)coordinatorForStyle:(id)a3 isSuggestedStyle:(BOOL)a4 fromDataSource:(id)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  v8 = [(PUIStylePickerComponentViewController *)self delegate];
  id v9 = [v8 stylePickerComponentViewController:self coordinatorForStyle:v7 isSuggested:v5];

  return v9;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (PUIStyleUICoordinator)uiKitColorPickerContentStyleCoordinator
{
  return self->_uiKitColorPickerContentStyleCoordinator;
}

- (PUIStyleConfiguration)styleConfiguration
{
  return self->_styleConfiguration;
}

- (PUIColorWellView)colorWellView
{
  return self->_colorWellView;
}

- (PUIColorWell)colorWell
{
  return self->_colorWell;
}

- (PUIStylePickerComponentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUIStylePickerComponentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PUIStyleConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (PUIStyleItemsDataSource)dataSource
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

- (PUIStyleItemsViewController)itemsViewController
{
  return self->_itemsViewController;
}

- (void)setItemsViewController:(id)a3
{
}

- (PUIStyleVariationSlider)sliderView
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_colorWell, 0);
  objc_storeStrong((id *)&self->_colorWellView, 0);
  objc_storeStrong((id *)&self->_styleConfiguration, 0);
  objc_storeStrong((id *)&self->_uiKitColorPickerContentStyleCoordinator, 0);
}

@end