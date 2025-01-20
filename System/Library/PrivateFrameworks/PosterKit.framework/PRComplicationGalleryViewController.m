@interface PRComplicationGalleryViewController
- (NSArray)applicationWidgetCollections;
- (PRComplicationGalleryViewController)initWithSuggestionSets:(id)a3 applicationWidgetCollections:(id)a4 listLayoutProvider:(id)a5 iconViewProvider:(id)a6;
- (PRComplicationGalleryViewControllerDelegate)delegate;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconViewProviding)iconViewProvider;
- (id)_buildSnapshot;
- (id)_descriptorFromWidgetIcon:(id)a3;
- (id)_galleryItemForComplicationDescriptor:(id)a3 iconImageHidden:(BOOL)a4;
- (id)_galleryItemForWidgetDescriptor:(id)a3 family:(int64_t)a4 iconImageHidden:(BOOL)a5;
- (id)_galleryItemsForWidgetDescriptors:(id)a3 iconImageHidden:(BOOL)a4;
- (id)backgroundViewMatchingMaterialBeneathWrapperViewController:(id)a3;
- (id)widgetIconForDescriptor:(id)a3 sizeClass:(int64_t)a4;
- (id)widgetIconForDescriptors:(id)a3 sizeClass:(int64_t)a4;
- (id)widgetIconForGalleryItem:(id)a3 sizeClass:(int64_t)a4;
- (int64_t)layoutStyleForSectionIndex:(int64_t)a3;
- (void)_closeButtonTapped:(id)a3;
- (void)_configureWidgetCell:(id)a3 forItem:(id)a4 atIndexPath:(id)a5;
- (void)_configureWidgetHostViewController:(id)a3 forWidgetDescriptor:(id)a4;
- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4;
- (void)addWidgetSheetViewControllerDidCancel:(id)a3;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)didBeginDraggingWidgetIcon:(id)a3;
- (void)iconTapped:(id)a3;
- (void)loadView;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setApplicationWidgetCollections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIconViewProvider:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)viewDidLoad;
@end

@implementation PRComplicationGalleryViewController

- (PRComplicationGalleryViewController)initWithSuggestionSets:(id)a3 applicationWidgetCollections:(id)a4 listLayoutProvider:(id)a5 iconViewProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PRComplicationGalleryViewController;
  v14 = [(PRComplicationGalleryViewController *)&v20 initWithNibName:0 bundle:0];
  if (v14)
  {
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    widgetHostViewControllersPerReason = v14->_widgetHostViewControllersPerReason;
    v14->_widgetHostViewControllersPerReason = v15;

    uint64_t v17 = objc_msgSend(v10, "bs_compactMap:", &__block_literal_global_6);
    suggestionSets = v14->_suggestionSets;
    v14->_suggestionSets = (NSArray *)v17;

    objc_storeStrong((id *)&v14->_applicationWidgetCollections, a4);
    objc_storeStrong((id *)&v14->_listLayoutProvider, a5);
    objc_storeStrong((id *)&v14->_iconViewProvider, a6);
  }

  return v14;
}

PRComplicationSuggestionSet *__127__PRComplicationGalleryViewController_initWithSuggestionSets_applicationWidgetCollections_listLayoutProvider_iconViewProvider___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 complications];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [v2 complications];
    v6 = objc_msgSend(v5, "bs_compactMap:", &__block_literal_global_13);

    v7 = [v2 localizedTitle];
    v8 = [[PRComplicationSuggestionSet alloc] initWithDescriptors:v6 localizedTitle:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

PRComplicationDescriptor *__127__PRComplicationGalleryViewController_initWithSuggestionSets_applicationWidgetCollections_listLayoutProvider_iconViewProvider___block_invoke_2(uint64_t a1, void *a2)
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
      id v10 = [MEMORY[0x1E4F29128] UUID];
      id v11 = [v10 UUIDString];
      id v12 = [(PRComplicationDescriptor *)v9 initWithUniqueIdentifier:v11 widget:v8];

      [(PRComplicationDescriptor *)v12 setSuggestedComplication:v2];
      goto LABEL_9;
    }
    id v13 = PRLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __127__PRComplicationGalleryViewController_initWithSuggestionSets_applicationWidgetCollections_listLayoutProvider_iconViewProvider___block_invoke_2_cold_2((uint64_t)v4, v2);
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
  v3 = [PRComplicationGalleryView alloc];
  uint64_t v4 = -[PRComplicationGalleryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  complicationGalleryView = self->_complicationGalleryView;
  self->_complicationGalleryView = v4;

  [(PRComplicationGalleryView *)self->_complicationGalleryView setDelegate:self];
  uint64_t v6 = self->_complicationGalleryView;
  [(PRComplicationGalleryViewController *)self setView:v6];
}

- (void)viewDidLoad
{
  v37.receiver = self;
  v37.super_class = (Class)PRComplicationGalleryViewController;
  [(PRComplicationGalleryViewController *)&v37 viewDidLoad];
  v3 = [(PRComplicationGalleryViewController *)self navigationController];
  uint64_t v4 = [v3 navigationBar];
  uint64_t v5 = [v4 topItem];

  [v5 _setManualScrollEdgeAppearanceProgress:0.0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:self action:sel__closeButtonTapped_];
  [v5 setRightBarButtonItem:v6];
  v7 = PRBundle();
  v8 = [v7 localizedStringForKey:@"COMPLICATION_GALLERY_TITLE" value:&stru_1ED9A3120 table:@"PosterKit"];
  [(PRComplicationGalleryViewController *)self setTitle:v8];

  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v10 = objc_opt_class();
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke;
  v34[3] = &unk_1E54DAC28;
  objc_copyWeak(&v35, &location);
  id v11 = [v9 registrationWithCellClass:v10 configurationHandler:v34];
  id v12 = [(PRComplicationGalleryView *)self->_complicationGalleryView collectionView];
  [v12 setDelegate:self];
  id v13 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v14 = objc_opt_class();
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke_2;
  v32[3] = &unk_1E54DADE0;
  id v15 = v12;
  id v33 = v15;
  v16 = [v13 registrationWithCellClass:v14 configurationHandler:v32];
  id v17 = objc_alloc(MEMORY[0x1E4FB1598]);
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke_4;
  v28 = &unk_1E54DAE08;
  id v18 = v15;
  id v29 = v18;
  id v19 = v16;
  id v30 = v19;
  id v20 = v11;
  id v31 = v20;
  v21 = (UICollectionViewDiffableDataSource *)[v17 initWithCollectionView:v18 cellProvider:&v25];
  dataSource = self->_dataSource;
  self->_dataSource = v21;

  objc_msgSend(v18, "setContentInset:", 8.0, 0.0, 0.0, 0.0, v25, v26, v27, v28);
  v23 = self->_dataSource;
  v24 = [(PRComplicationGalleryViewController *)self _buildSnapshot];
  [(UICollectionViewDiffableDataSource *)v23 applySnapshot:v24 animatingDifferences:0];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

void __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _configureWidgetCell:v9 forItem:v7 atIndexPath:v8];
}

void __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 icon];
  id v11 = v10;
  if (!v10) {
    uint64_t v10 = v9;
  }
  id v12 = [v10 displayName];
  id v13 = [v7 titleView];
  [v13 setTitle:v12];

  uint64_t v14 = [v11 applicationBundleID];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [v9 iconImageApplicationBundleIdentifier];
  }
  id v17 = v16;

  +[PRComplicationGalleryApplicationTitleView iconImageSize];
  double v19 = v18;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke_3;
  v22[3] = &unk_1E54DACC0;
  id v23 = *(id *)(a1 + 32);
  id v24 = v7;
  id v25 = v8;
  id v20 = v8;
  id v21 = v7;
  +[PRComplicationGalleryIconProvider loadIconImageForApplicationBundleIdentifier:v17 atWidth:v22 completion:v19];
  objc_msgSend(v21, "setSeparatorVisible:", objc_msgSend(v20, "item") != objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", objc_msgSend(v20, "section"))- 1);
}

void __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [*(id *)(a1 + 32) indexPathForCell:*(void *)(a1 + 40)];
  int v4 = [v3 isEqual:*(void *)(a1 + 48)];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) titleView];
    [v5 setIconImage:v6];
  }
}

id __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke_4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  id v12 = [v11 applicationWidgetCollection];

  id v13 = (void *)a1[4];
  if (v12)
  {
    uint64_t v14 = a1[5];
    [v11 applicationWidgetCollection];
  }
  else
  {
    uint64_t v14 = a1[6];
    [v11 widgetItem];
  id v15 = };

  id v16 = [v13 dequeueConfiguredReusableCellWithRegistration:v14 forIndexPath:v6 item:v15];

  return v16;
}

- (void)setApplicationWidgetCollections:(id)a3
{
  id v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_applicationWidgetCollections, a3);
    dataSource = self->_dataSource;
    id v6 = [(PRComplicationGalleryViewController *)self _buildSnapshot];
    [(UICollectionViewDiffableDataSource *)dataSource applySnapshot:v6 animatingDifferences:0];
  }
}

- (id)_buildSnapshot
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  if ([(NSArray *)self->_suggestionSets count])
  {
    int v4 = [(NSArray *)self->_suggestionSets bs_map:&__block_literal_global_46];
    uint64_t v5 = objc_msgSend(v4, "bs_flatten");
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__PRComplicationGalleryViewController__buildSnapshot__block_invoke_2;
    v11[3] = &unk_1E54DAE30;
    v11[4] = self;
    id v6 = objc_msgSend(v5, "bs_map:", v11);

    v13[0] = @"PRComplicationSuggestionsSectionIdentifier";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v3 appendSectionsWithIdentifiers:v7];

    [v3 appendItemsWithIdentifiers:v6];
  }
  uint64_t v8 = [(NSArray *)self->_applicationWidgetCollections bs_map:&__block_literal_global_51];
  id v12 = @"PRComplicationApplicationsSectionIdentifier";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v3 appendSectionsWithIdentifiers:v9];

  [v3 appendItemsWithIdentifiers:v8];
  return v3;
}

uint64_t __53__PRComplicationGalleryViewController__buildSnapshot__block_invoke(uint64_t a1, void *a2)
{
  return [a2 descriptors];
}

uint64_t __53__PRComplicationGalleryViewController__buildSnapshot__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _galleryItemForComplicationDescriptor:a2 iconImageHidden:0];
}

PRComplicationGalleryItem *__53__PRComplicationGalleryViewController__buildSnapshot__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PRComplicationGalleryItem alloc] initWithApplicationWidgetCollection:v2];

  return v3;
}

- (id)_galleryItemForComplicationDescriptor:(id)a3 iconImageHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 widget];
  id v7 = [PRComplicationDescriptor alloc];
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = [v8 UUIDString];
  uint64_t v10 = [(PRComplicationDescriptor *)v7 initWithUniqueIdentifier:v9 widget:v6];

  id v11 = [v5 suggestedComplication];

  [(PRComplicationDescriptor *)v10 setSuggestedComplication:v11];
  id v12 = [PRComplicationGalleryWidgetItem alloc];
  id v13 = PRSharedWidgetDescriptorProvider();
  uint64_t v14 = [v13 descriptorForPersonality:v6];
  id v15 = [v14 displayName];
  id v16 = [(PRComplicationGalleryWidgetItem *)v12 initWithDisplayName:v15 selected:0 iconImageHidden:v4 descriptor:v10];

  id v17 = [[PRComplicationGalleryItem alloc] initWithWidgetItem:v16];
  return v17;
}

- (id)_galleryItemsForWidgetDescriptors:(id)a3 iconImageHidden:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v13, "supportedFamilies", (void)v18) & 0x400) != 0)
        {
          uint64_t v14 = [(PRComplicationGalleryViewController *)self _galleryItemForWidgetDescriptor:v13 family:10 iconImageHidden:v4];
          [v7 addObject:v14];
        }
        if (([v13 supportedFamilies] & 0x800) != 0)
        {
          id v15 = [(PRComplicationGalleryViewController *)self _galleryItemForWidgetDescriptor:v13 family:11 iconImageHidden:v4];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v16 = (void *)[v7 copy];
  return v16;
}

- (id)_galleryItemForWidgetDescriptor:(id)a3 family:(int64_t)a4 iconImageHidden:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = [v7 widgetForFamily:a4 intent:0];
  uint64_t v9 = [PRComplicationDescriptor alloc];
  uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v11 = [v10 UUIDString];
  id v12 = [(PRComplicationDescriptor *)v9 initWithUniqueIdentifier:v11 widget:v8];

  id v13 = [PRComplicationGalleryWidgetItem alloc];
  uint64_t v14 = [v7 displayName];

  id v15 = [(PRComplicationGalleryWidgetItem *)v13 initWithDisplayName:v14 selected:0 iconImageHidden:v5 descriptor:v12];
  id v16 = [[PRComplicationGalleryItem alloc] initWithWidgetItem:v15];

  return v16;
}

- (void)_configureWidgetCell:(id)a3 forItem:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [a4 descriptor];
  uint64_t v11 = [v10 widget];

  id v12 = PRSharedWidgetDescriptorProvider();
  v32 = [v12 descriptorForPersonality:v11];

  id v13 = objc_alloc(MEMORY[0x1E4FA63A8]);
  uint64_t v14 = [(PRComplicationGalleryViewController *)self listLayoutProvider];
  id v15 = [(PRComplicationGalleryViewController *)self iconViewProvider];
  id v16 = (void *)[v13 initWithGalleryItem:v32 titleAndSubtitleVisible:0 listLayoutProvider:v14 iconViewProvider:v15];

  objc_msgSend(v16, "setSelectedSizeClass:", objc_msgSend(v11, "family"));
  [v16 setDelegate:self];
  [v16 setUsesAmbientScaleFactorForRemovableBackgroundItems:0];
  id v17 = [v16 wrapperView];
  [v17 setBackgroundType:0];

  long long v18 = [v16 wrapperView];
  [v18 setCornerRadius:PRWidgetPlatterCornerRadius()];

  [v8 setWidgetWrapperViewController:v16];
  long long v19 = +[PRWidgetMetricsProvider sharedInstance];
  long long v20 = [v19 systemMetricsForWidget:v11];

  long long v21 = [(PRComplicationGalleryViewController *)self traitCollection];
  [v21 displayScale];
  double v23 = v22;

  [v20 _effectiveSizePixelAlignedForDisplayScale:v23];
  objc_msgSend(v8, "setContentSize:");
  id v24 = [(PRComplicationGalleryView *)self->_complicationGalleryView collectionView];
  id v25 = [v11 extensionIdentity];
  uint64_t v26 = [v25 extensionBundleIdentifier];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __80__PRComplicationGalleryViewController__configureWidgetCell_forItem_atIndexPath___block_invoke;
  v33[3] = &unk_1E54DACC0;
  id v34 = v24;
  id v35 = v8;
  id v36 = v9;
  id v27 = v9;
  id v28 = v8;
  id v29 = v24;
  +[PRComplicationGalleryIconProvider loadIconImageForExtensionBundleIdentifier:v26 atWidth:v33 completion:20.0];

  id v30 = [v16 view];
  id v31 = [v30 superview];
  [(PRComplicationGalleryViewController *)self bs_addChildViewController:v16 withSuperview:v31];
}

void __80__PRComplicationGalleryViewController__configureWidgetCell_forItem_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) indexPathForCell:*(void *)(a1 + 40)];
  int v4 = [v3 isEqual:*(void *)(a1 + 48)];

  if (v4) {
    [*(id *)(a1 + 40) setIconImage:v5];
  }
}

- (void)_configureWidgetHostViewController:(id)a3 forWidgetDescriptor:(id)a4
{
  id v5 = a3;
  id v6 = [a4 widget];
  id v7 = PRSharedWidgetDescriptorProvider();
  id v8 = [v7 descriptorForPersonality:v6];

  uint64_t v9 = [v8 intentType];
  if (v9
    && (uint64_t v10 = (void *)v9,
        [v6 intent],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    id v12 = [v8 defaultIntent];
    if (v12)
    {
      id v13 = [v6 widgetByReplacingIntent:v12];
      [v5 setWidget:v13];
    }
    else
    {
      id v13 = PRLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[PRComplicationGalleryViewController _configureWidgetHostViewController:forWidgetDescriptor:](v6);
      }
    }
  }
  else
  {
    [v5 setWidget:v6];
  }
}

- (void)_closeButtonTapped:(id)a3
{
  [(PRComplicationGalleryViewController *)self dismissViewControllerAnimated:1 completion:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained complicationGalleryViewControllerDidFinish:self];
}

- (id)_descriptorFromWidgetIcon:(id)a3
{
  id v3 = a3;
  int v4 = [v3 activeWidget];
  id v5 = [v3 gridSizeClass];

  uint64_t v6 = PRWidgetFamilyForIconGridSizeClass(v5);
  id v7 = objc_alloc(MEMORY[0x1E4F58DD8]);
  id v8 = [v4 extensionBundleIdentifier];
  uint64_t v9 = [v4 containerBundleIdentifier];
  uint64_t v10 = [v4 kind];
  uint64_t v11 = (void *)[v7 initWithExtensionBundleIdentifier:v8 containerBundleIdentifier:v9 kind:v10 family:v6 intent:0];

  id v12 = [PRComplicationDescriptor alloc];
  id v13 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v14 = [v13 UUIDString];
  id v15 = [(PRComplicationDescriptor *)v12 initWithUniqueIdentifier:v14 widget:v11];

  return v15;
}

- (int64_t)layoutStyleForSectionIndex:(int64_t)a3
{
  int v4 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  id v5 = [v4 sectionIdentifiers];
  uint64_t v6 = [v5 objectAtIndexedSubscript:a3];
  int64_t v7 = v6 != @"PRComplicationSuggestionsSectionIdentifier";

  return v7;
}

- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
  id v13 = a4;
  id v5 = [v13 icon];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  id v11 = v13;
  if (v9)
  {
    id v12 = [(PRComplicationGalleryViewController *)self delegate];
    [v12 complicationGalleryViewController:self didSelectWidgetIconView:v13];

    id v11 = v13;
  }
  MEMORY[0x1F41817F8](v10, v11);
}

- (void)addWidgetSheetViewControllerDidCancel:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(PRComplicationGalleryViewController *)self dismissViewControllerAnimated:1 completion:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v4 = [(PRComplicationGalleryView *)self->_complicationGalleryView collectionView];
  id v5 = [v4 indexPathsForSelectedItems];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = [(PRComplicationGalleryView *)self->_complicationGalleryView collectionView];
        [v11 deselectItemAtIndexPath:v10 animated:1];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v17 = a3;
  id v5 = a4;
  uint64_t v6 = [v17 cellForItemAtIndexPath:v5];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  [v10 setSeparatorVisible:0];
  if ([v5 item] >= 1)
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v5, "item") - 1, objc_msgSend(v5, "section"));
    long long v12 = [v17 cellForItemAtIndexPath:v11];
    uint64_t v13 = objc_opt_class();
    id v14 = v12;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        long long v15 = v14;
      }
      else {
        long long v15 = 0;
      }
    }
    else
    {
      long long v15 = 0;
    }
    id v16 = v15;

    [v16 setSeparatorVisible:0];
  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v17 = a3;
  id v5 = a4;
  uint64_t v6 = [v17 cellForItemAtIndexPath:v5];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  objc_msgSend(v10, "setSeparatorVisible:", objc_msgSend(v5, "item") != objc_msgSend(v17, "numberOfItemsInSection:", objc_msgSend(v5, "section")) - 1);
  if ([v5 item] >= 1)
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v5, "item") - 1, objc_msgSend(v5, "section"));
    long long v12 = [v17 cellForItemAtIndexPath:v11];
    uint64_t v13 = objc_opt_class();
    id v14 = v12;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        long long v15 = v14;
      }
      else {
        long long v15 = 0;
      }
    }
    else
    {
      long long v15 = 0;
    }
    id v16 = v15;

    [v16 setSeparatorVisible:1];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v7];
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v12 = v11;

  uint64_t v13 = [v12 applicationWidgetCollection];

  if (v13)
  {
    id v52 = v7;
    id v14 = [v6 cellForItemAtIndexPath:v7];
    uint64_t v15 = objc_opt_class();
    id v16 = v14;
    id v53 = v6;
    if (v15)
    {
      if (objc_opt_isKindOfClass()) {
        id v17 = v16;
      }
      else {
        id v17 = 0;
      }
    }
    else
    {
      id v17 = 0;
    }
    id v18 = v17;

    long long v19 = [(SBIconListLayoutProvider *)self->_listLayoutProvider layoutForIconLocation:*MEMORY[0x1E4FA66D0]];
    [v19 iconImageInfo];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA62A0]), "initWithName:iconImageInfo:", @"iconImages", v21, v23, v25, v27);
    id v29 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v30 = [v29 userInterfaceIdiom];

    v50 = (void *)v28;
    id v31 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:]([PRComplicationGalleryDetailViewController alloc], "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", self->_listLayoutProvider, self->_iconViewProvider, 3072, 256, v28, (v30 & 0xFFFFFFFFFFFFFFFBLL) == 1);
    v32 = [v12 applicationWidgetCollection];
    [(PRComplicationGalleryDetailViewController *)v31 setApplicationWidgetCollection:v32];
    id v33 = [v32 icon];
    id v34 = v33;
    if (!v33) {
      id v33 = v32;
    }
    uint64_t v35 = [v33 displayName];
    [(SBHAddWidgetSheetViewControllerBase *)v31 setDelegate:self];
    v49 = (void *)v35;
    [(PRComplicationGalleryDetailViewController *)v31 setAppName:v35];
    v51 = v18;
    id v36 = [v18 titleView];
    objc_super v37 = [v36 iconImage];
    [(PRComplicationGalleryDetailViewController *)v31 setIconImage:v37];

    v38 = [(PRComplicationGalleryDetailViewController *)v31 presentationController];
    uint64_t v39 = objc_opt_class();
    id v40 = v38;
    if (v39)
    {
      if (objc_opt_isKindOfClass()) {
        v41 = v40;
      }
      else {
        v41 = 0;
      }
    }
    else
    {
      v41 = 0;
    }
    id v42 = v41;

    v43 = [MEMORY[0x1E4FB1C30] customDetentWithIdentifier:@"ComplicationGalleryDodge" resolver:&__block_literal_global_71];
    v54[0] = v43;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
    [v42 setDetents:v44];

    [v42 setLargestUndimmedDetentIdentifier:@"ComplicationGalleryDodge"];
    [v42 setPreferredCornerRadius:PRSheetCornerRadius()];
    v45 = [v42 dimmingView];
    v46 = [v45 layer];
    [v46 setHitTestsAsOpaque:0];

    v47 = [v42 _confinedDimmingView];
    v48 = [v47 layer];
    [v48 setHitTestsAsOpaque:0];

    [v42 setDelegate:self];
    [(PRComplicationGalleryViewController *)self presentViewController:v31 animated:1 completion:0];

    id v7 = v52;
    id v6 = v53;
  }
}

double __79__PRComplicationGalleryViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  [a2 maximumDetentValue];
  return v2 * 0.6;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v11 = a3;
  if (([MEMORY[0x1E4FB1EB0] _isInAnimationBlock] & 1) == 0)
  {
    [v11 adjustedContentInset];
    double v5 = v4;
    [v11 contentOffset];
    double v7 = fmin(fmax((v5 + v6) * 0.0625, 0.0), 1.0);
    id v8 = [(PRComplicationGalleryViewController *)self navigationController];
    uint64_t v9 = [v8 navigationBar];
    id v10 = [v9 topItem];

    [v10 _setManualScrollEdgeAppearanceProgress:v7];
  }
}

- (void)presentationControllerWillDismiss:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v4 = [(PRComplicationGalleryView *)self->_complicationGalleryView collectionView];
  double v5 = [v4 indexPathsForSelectedItems];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = [(PRComplicationGalleryView *)self->_complicationGalleryView collectionView];
        [v11 deselectItemAtIndexPath:v10 animated:1];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)didBeginDraggingWidgetIcon:(id)a3
{
  id v5 = [(PRComplicationGalleryViewController *)self _descriptorFromWidgetIcon:a3];
  double v4 = [(PRComplicationGalleryViewController *)self delegate];
  [v4 complicationGalleryViewController:self didBeginDraggingComplication:v5];
}

- (id)widgetIconForGalleryItem:(id)a3 sizeClass:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = [(PRComplicationGalleryViewController *)self widgetIconForDescriptor:v10 sizeClass:a4];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)widgetIconForDescriptor:(id)a3 sizeClass:(int64_t)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4FA6388];
  id v6 = a3;
  id v7 = [v5 alloc];
  id v8 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v9 = [v8 UUIDString];
  id v10 = [v6 kind];
  id v11 = [v6 extensionIdentity];
  long long v12 = [v11 extensionBundleIdentifier];
  long long v13 = [v6 extensionIdentity];

  long long v14 = [v13 containerBundleIdentifier];
  long long v15 = (void *)[v7 initWithUniqueIdentifier:v9 kind:v10 extensionBundleIdentifier:v12 containerBundleIdentifier:v14];

  id v16 = (void *)[objc_alloc(MEMORY[0x1E4FA6488]) initWithWidget:v15];
  uint64_t v17 = PRIconGridSizeClassForWidgetFamily(a4);
  [v16 setGridSizeClass:v17];

  return v16;
}

- (id)widgetIconForDescriptors:(id)a3 sizeClass:(int64_t)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PRComplicationGalleryViewController.m" lineNumber:511 description:@"We shouldn't be showing widget stacks in the lock screen widget gallery"];

  return 0;
}

- (id)backgroundViewMatchingMaterialBeneathWrapperViewController:(id)a3
{
  return 0;
}

- (void)iconTapped:(id)a3
{
  double v4 = [a3 wrapperView];
  id v6 = [v4 contentView];

  if (v6)
  {
    id v5 = [(PRComplicationGalleryViewController *)self delegate];
    [v5 complicationGalleryViewController:self didSelectWidgetIconView:v6];
  }
}

- (PRComplicationGalleryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRComplicationGalleryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)applicationWidgetCollections
{
  return self->_applicationWidgetCollections;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationWidgetCollections, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconViewProvider, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_widgetHostViewControllersPerReason, 0);
  objc_storeStrong((id *)&self->_suggestionSets, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_complicationGalleryView, 0);
}

void __127__PRComplicationGalleryViewController_initWithSuggestionSets_applicationWidgetCollections_listLayoutProvider_iconViewProvider___block_invoke_2_cold_2(uint64_t a1, void *a2)
{
  [a2 widgetFamily];
  id v8 = NSStringFromWidgetFamily();
  OUTLINED_FUNCTION_0_1(&dword_18C1C4000, v2, v3, "Suggested complication %@ does not support provided widget family %@", v4, v5, v6, v7, 2u);
}

- (void)_configureWidgetHostViewController:(void *)a1 forWidgetDescriptor:.cold.1(void *a1)
{
  uint64_t v2 = [a1 extensionBundleIdentifier];
  uint64_t v9 = [a1 kind];
  OUTLINED_FUNCTION_0_1(&dword_18C1C4000, v3, v4, "Default intent asked for but not provided: %@ - %@", v5, v6, v7, v8, 2u);
}

@end