@interface PRWidgetSuggestionsViewController
- (BOOL)usingSidebarLayout;
- (NSArray)suggestionSets;
- (PRWidgetSuggestionsView)widgetSuggestionsView;
- (PRWidgetSuggestionsViewController)initWithSuggestionSets:(id)a3 listLayoutProvider:(id)a4 iconViewProvider:(id)a5 widgetDragHandler:(id)a6 usingSidebarLayout:(BOOL)a7;
- (PRWidgetSuggestionsViewControllerDelegate)delegate;
- (SBHWidgetDragHandling)widgetDragHandler;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconViewProviding)iconViewProvider;
- (UICollectionViewDiffableDataSource)dataSource;
- (id)_galleryItemForComplicationDescriptor:(id)a3 iconImageHidden:(BOOL)a4;
- (id)backgroundViewMatchingMaterialBeneathWrapperViewController:(id)a3;
- (id)complicationDescriptorForItemAtIndexPath:(id)a3;
- (void)_configureWidgetCell:(id)a3 forItem:(id)a4 atIndexPath:(id)a5;
- (void)iconTapped:(id)a3;
- (void)loadView;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIconViewProvider:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setSuggestionSets:(id)a3;
- (void)setUsingSidebarLayout:(BOOL)a3;
- (void)setWidgetSuggestionsView:(id)a3;
- (void)viewDidLoad;
@end

@implementation PRWidgetSuggestionsViewController

- (PRWidgetSuggestionsViewController)initWithSuggestionSets:(id)a3 listLayoutProvider:(id)a4 iconViewProvider:(id)a5 widgetDragHandler:(id)a6 usingSidebarLayout:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PRWidgetSuggestionsViewController;
  v16 = [(PRWidgetSuggestionsViewController *)&v20 init];
  if (v16)
  {
    uint64_t v17 = objc_msgSend(v12, "bs_compactMap:", &__block_literal_global_2);
    suggestionSets = v16->_suggestionSets;
    v16->_suggestionSets = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_listLayoutProvider, a4);
    objc_storeStrong((id *)&v16->_iconViewProvider, a5);
    objc_storeStrong((id *)&v16->_widgetDragHandler, a6);
    v16->_usingSidebarLayout = a7;
  }

  return v16;
}

PRComplicationSuggestionSet *__133__PRWidgetSuggestionsViewController_initWithSuggestionSets_listLayoutProvider_iconViewProvider_widgetDragHandler_usingSidebarLayout___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 complications];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [v2 complications];
    v6 = objc_msgSend(v5, "bs_compactMap:", &__block_literal_global_4_0);

    v7 = [v2 localizedTitle];
    v8 = [[PRComplicationSuggestionSet alloc] initWithDescriptors:v6 localizedTitle:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

PRComplicationDescriptor *__133__PRWidgetSuggestionsViewController_initWithSuggestionSets_listLayoutProvider_iconViewProvider_widgetDragHandler_usingSidebarLayout___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = PRSharedWidgetDescriptorProvider();
  uint64_t v4 = [v3 descriptorForPersonality:v2];

  if (v4)
  {
    uint64_t v5 = [v4 supportedFamilies];
    [v2 widgetFamily];
    if ((CHSWidgetFamilyMaskFromWidgetFamily() & v5) != 0)
    {
      uint64_t v6 = [v2 widgetFamily];
      v7 = [v2 intent];
      v8 = [v4 widgetForFamily:v6 intent:v7];

      v9 = [PRComplicationDescriptor alloc];
      v10 = [MEMORY[0x1E4F29128] UUID];
      v11 = [v10 UUIDString];
      id v12 = [(PRComplicationDescriptor *)v9 initWithUniqueIdentifier:v11 widget:v8];

      [(PRComplicationDescriptor *)v12 setSuggestedComplication:v2];
      goto LABEL_9;
    }
    id v13 = PRLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __133__PRWidgetSuggestionsViewController_initWithSuggestionSets_listLayoutProvider_iconViewProvider_widgetDragHandler_usingSidebarLayout___block_invoke_2_cold_2((uint64_t)v4, v2, v13);
    }
  }
  else
  {
    id v13 = PRLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __133__PRWidgetSuggestionsViewController_initWithSuggestionSets_listLayoutProvider_iconViewProvider_widgetDragHandler_usingSidebarLayout___block_invoke_2_cold_1(v13);
    }
  }

  id v12 = 0;
LABEL_9:

  return v12;
}

- (void)loadView
{
  v3 = [[PRWidgetSuggestionsView alloc] initWithLayoutDelegate:self usingSidebarLayout:self->_usingSidebarLayout];
  widgetSuggestionsView = self->_widgetSuggestionsView;
  self->_widgetSuggestionsView = v3;

  uint64_t v5 = self->_widgetSuggestionsView;
  [(PRWidgetSuggestionsViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v24[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v4 = objc_opt_class();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __48__PRWidgetSuggestionsViewController_viewDidLoad__block_invoke;
  v21[3] = &unk_1E54DAC28;
  objc_copyWeak(&v22, &location);
  uint64_t v5 = [v3 registrationWithCellClass:v4 configurationHandler:v21];
  uint64_t v6 = [(PRWidgetSuggestionsView *)self->_widgetSuggestionsView collectionView];
  [v6 setDelegate:self];
  id v7 = objc_alloc(MEMORY[0x1E4FB1598]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__PRWidgetSuggestionsViewController_viewDidLoad__block_invoke_2;
  v18[3] = &unk_1E54DAC50;
  id v8 = v6;
  id v19 = v8;
  id v9 = v5;
  id v20 = v9;
  v10 = (UICollectionViewDiffableDataSource *)[v7 initWithCollectionView:v8 cellProvider:v18];
  dataSource = self->_dataSource;
  self->_dataSource = v10;

  id v12 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  id v13 = [(NSArray *)self->_suggestionSets bs_map:&__block_literal_global_17];
  id v14 = objc_msgSend(v13, "bs_flatten");
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__PRWidgetSuggestionsViewController_viewDidLoad__block_invoke_4;
  v17[3] = &unk_1E54DAC98;
  v17[4] = self;
  id v15 = objc_msgSend(v14, "bs_map:", v17);

  v24[0] = @"PRWidgetSuggestionsSectionIdentifier";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [v12 appendSectionsWithIdentifiers:v16];

  [v12 appendItemsWithIdentifiers:v15];
  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v12 animatingDifferences:0];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __48__PRWidgetSuggestionsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _configureWidgetCell:v9 forItem:v7 atIndexPath:v8];
}

id __48__PRWidgetSuggestionsViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  id v12 = [*(id *)(a1 + 32) dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 40) forIndexPath:v7 item:v11];

  return v12;
}

uint64_t __48__PRWidgetSuggestionsViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 descriptors];
}

uint64_t __48__PRWidgetSuggestionsViewController_viewDidLoad__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _galleryItemForComplicationDescriptor:a2 iconImageHidden:0];
}

- (id)_galleryItemForComplicationDescriptor:(id)a3 iconImageHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 widget];
  id v7 = [PRComplicationDescriptor alloc];
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = [v8 UUIDString];
  v10 = [(PRComplicationDescriptor *)v7 initWithUniqueIdentifier:v9 widget:v6];

  id v11 = [v5 suggestedComplication];

  [(PRComplicationDescriptor *)v10 setSuggestedComplication:v11];
  id v12 = [PRComplicationGalleryWidgetItem alloc];
  id v13 = PRSharedWidgetDescriptorProvider();
  id v14 = [v13 descriptorForPersonality:v6];
  id v15 = [v14 displayName];
  v16 = [(PRComplicationGalleryWidgetItem *)v12 initWithDisplayName:v15 selected:0 iconImageHidden:v4 descriptor:v10];

  return v16;
}

- (void)_configureWidgetCell:(id)a3 forItem:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a4 descriptor];
  id v11 = [v10 widget];

  id v12 = PRSharedWidgetDescriptorProvider();
  v32 = [v12 descriptorForPersonality:v11];

  id v13 = objc_alloc(MEMORY[0x1E4FA63A8]);
  id v14 = [(PRWidgetSuggestionsViewController *)self listLayoutProvider];
  id v15 = [(PRWidgetSuggestionsViewController *)self iconViewProvider];
  v16 = (void *)[v13 initWithGalleryItem:v32 titleAndSubtitleVisible:0 listLayoutProvider:v14 iconViewProvider:v15];

  objc_msgSend(v16, "setSelectedSizeClass:", objc_msgSend(v11, "family"));
  [v16 setDelegate:self];
  [v16 setUsesAmbientScaleFactorForRemovableBackgroundItems:0];
  uint64_t v17 = [v16 wrapperView];
  [v17 setBackgroundType:0];

  v18 = [v16 wrapperView];
  [v18 setCornerRadius:PRWidgetPlatterCornerRadius()];

  [v8 setWidgetWrapperViewController:v16];
  id v19 = +[PRWidgetMetricsProvider sharedInstance];
  id v20 = [v19 systemMetricsForWidget:v11];

  v21 = [(PRWidgetSuggestionsViewController *)self traitCollection];
  [v21 displayScale];
  double v23 = v22;

  [v20 _effectiveSizePixelAlignedForDisplayScale:v23];
  objc_msgSend(v8, "setContentSize:");
  v24 = [(PRWidgetSuggestionsView *)self->_widgetSuggestionsView collectionView];
  v25 = [v11 extensionIdentity];
  v26 = [v25 extensionBundleIdentifier];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __78__PRWidgetSuggestionsViewController__configureWidgetCell_forItem_atIndexPath___block_invoke;
  v33[3] = &unk_1E54DACC0;
  id v34 = v24;
  id v35 = v8;
  id v36 = v9;
  id v27 = v9;
  id v28 = v8;
  id v29 = v24;
  +[PRComplicationGalleryIconProvider loadIconImageForExtensionBundleIdentifier:v26 atWidth:v33 completion:20.0];

  v30 = [v16 view];
  v31 = [v30 superview];
  [(PRWidgetSuggestionsViewController *)self bs_addChildViewController:v16 withSuperview:v31];
}

void __78__PRWidgetSuggestionsViewController__configureWidgetCell_forItem_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) indexPathForCell:*(void *)(a1 + 40)];
  int v4 = [v3 isEqual:*(void *)(a1 + 48)];

  if (v4) {
    [*(id *)(a1 + 40) setIconImage:v5];
  }
}

- (id)complicationDescriptorForItemAtIndexPath:(id)a3
{
  v3 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:a3];
  int v4 = [v3 descriptor];

  return v4;
}

- (SBHWidgetDragHandling)widgetDragHandler
{
  return self->_widgetDragHandler;
}

- (id)backgroundViewMatchingMaterialBeneathWrapperViewController:(id)a3
{
  return 0;
}

- (void)iconTapped:(id)a3
{
  int v4 = [a3 wrapperView];
  id v6 = [v4 contentView];

  if (v6)
  {
    id v5 = [(PRWidgetSuggestionsViewController *)self delegate];
    [v5 widgetSuggestionsViewController:self didSelectWidgetIconView:v6];
  }
}

- (PRWidgetSuggestionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRWidgetSuggestionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PRWidgetSuggestionsView)widgetSuggestionsView
{
  return self->_widgetSuggestionsView;
}

- (void)setWidgetSuggestionsView:(id)a3
{
}

- (NSArray)suggestionSets
{
  return self->_suggestionSets;
}

- (void)setSuggestionSets:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
}

- (SBIconViewProviding)iconViewProvider
{
  return self->_iconViewProvider;
}

- (void)setIconViewProvider:(id)a3
{
}

- (BOOL)usingSidebarLayout
{
  return self->_usingSidebarLayout;
}

- (void)setUsingSidebarLayout:(BOOL)a3
{
  self->_usingSidebarLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconViewProvider, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_suggestionSets, 0);
  objc_storeStrong((id *)&self->_widgetSuggestionsView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widgetDragHandler, 0);
}

void __133__PRWidgetSuggestionsViewController_initWithSuggestionSets_listLayoutProvider_iconViewProvider_widgetDragHandler_usingSidebarLayout___block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_18C1C4000, log, OS_LOG_TYPE_ERROR, "Suggested complication %@ not found in set of descriptors", (uint8_t *)&v1, 0xCu);
}

void __133__PRWidgetSuggestionsViewController_initWithSuggestionSets_listLayoutProvider_iconViewProvider_widgetDragHandler_usingSidebarLayout___block_invoke_2_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [a2 widgetFamily];
  id v5 = NSStringFromWidgetFamily();
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_18C1C4000, a3, OS_LOG_TYPE_ERROR, "Suggested complication %@ does not support provided widget family %@", (uint8_t *)&v6, 0x16u);
}

@end