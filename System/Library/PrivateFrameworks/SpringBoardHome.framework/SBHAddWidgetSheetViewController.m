@interface SBHAddWidgetSheetViewController
- ($A8FDFC956663B0B54E66E9982D7A2B15)sheetIconMetrics;
- (BOOL)_canShowContentUnavailableConfiguration;
- (BOOL)_isSearchVisible;
- (BOOL)_shouldAnimateChanges;
- (BOOL)_shouldShowCustomApplicationsSection;
- (BOOL)_shouldShowDisfavoredSection;
- (BOOL)_shouldShowGallery;
- (BOOL)_shouldShowSuggestionsListItem;
- (BOOL)_shouldShowTitleAndSubtitle;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)isShowingDisfavoredApplicationWidgetCollections;
- (BOOL)shouldCenterAppCells;
- (BOOL)shouldShowGalleryOnly;
- (BOOL)wantsBottomAttachedPresentation;
- (CGRect)keyboardFrameIntersect;
- (MTMaterialView)backgroundView;
- (NSArray)applicationWidgetCollections;
- (NSArray)customApplicationWidgetCollections;
- (NSArray)disfavoredApplicationWidgetCollections;
- (NSArray)favoredApplicationWidgetCollections;
- (NSArray)filteredApplicationWidgetCollections;
- (NSArray)galleryItems;
- (NSArray)searchBarGradientMaskLayers;
- (NSDirectionalEdgeInsets)applicationsSectionInsets;
- (NSDirectionalEdgeInsets)contentInsets;
- (NSMutableDictionary)suggestedItemsByGalleryLayoutSize;
- (NSMutableDictionary)userInfo;
- (SBHAddWidgetSheetConfiguration)configuration;
- (SBHAddWidgetSheetViewController)initWithConfiguration:(id)a3;
- (SBHAddWidgetSheetViewController)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 allowedWidgets:(SBHWidgetFilteringParameters)a5 appCellConfigurator:(id)a6 addWidgetSheetStyle:(unint64_t)a7;
- (SBHPadAddWidgetSheetMetrics)_metricsForCurrentOrientation;
- (SBHPadAddWidgetSheetMetrics)_metricsForOrientation:(SEL)a3;
- (SBHWidgetAddSheetTransitionContext)transitionContext;
- (SBHWidgetDragHandling)widgetDragHandler;
- (SBHWidgetSearchController)externalSearchController;
- (SBHWidgetSearchController)searchController;
- (SBHWidgetSheetViewControllerPresenter)presenter;
- (UIButton)closeButton;
- (UIViewController)barSwipeViewController;
- (_SBHAddWidgetSheetCollectionView)collectionView;
- (double)_horizontalSpacingForListLayout:(id)a3;
- (double)horizontalSpacing;
- (double)searchBarHeightAdjustment;
- (id)_collectionViewLayoutApplicationsSectionWithStyle:(unint64_t)a3;
- (id)_collectionViewLayoutGallerySectionWithWidth:(double)a3 sizeClasses:(id)a4;
- (id)_currentPresenter;
- (id)_effectiveSearchController;
- (id)_generateLayoutSectionForSectionIdx:(unint64_t)a3 width:(double)a4;
- (id)_generateSnapshotDiffedFromSnapshot:(id)a3;
- (id)_itemsArrayWithSizeClasses:(id)a3 nSmallsGroup:(id)a4 mediumAndSmallGroup:(id)a5 usesThreeColumnLayout:(BOOL)a6;
- (id)_listLayoutForWidgetSizing;
- (id)_materialViewForVisualStyling;
- (id)_newBackgroundView;
- (id)_newPadCollectionViewLayoutGallerySectionWithWidth:(double)a3 sizeClasses:(id)a4;
- (id)_newWrapperViewControllerWithGalleryItem:(id)a3 sizeClass:(int64_t)a4;
- (id)_otherDescriptionLabel;
- (id)_podsArrayWithSizeClasses:(id)a3 columnCount:(int64_t)a4;
- (id)_presentedGalleryViewController;
- (id)_searchTextForSearchController:(id)a3;
- (id)_sizeClasses;
- (id)_suggestedItems;
- (id)_updatedContentUnavailableConfigurationUsingState:(id)a3;
- (id)applicationWidgetCollectionsToUse;
- (id)backgroundViewMatchingMaterialBeneathAddWidgetSheetViewController:(id)a3;
- (id)backgroundViewMatchingMaterialBeneathWrapperViewController:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)contentUnavailableConfigurationState;
- (id)suggestedItemsForGalleryLayoutSize:(unint64_t)a3;
- (int64_t)widgetWrapperViewControllerBackgroundType;
- (unint64_t)_applicationWidgetCollectionIndexForItemIndex:(unint64_t)a3;
- (unint64_t)_itemIndexForApplicationWidgetCollectionIndex:(unint64_t)a3;
- (unint64_t)_sectionIndexForSection:(unint64_t)a3;
- (unint64_t)addWidgetSheetLocation;
- (unint64_t)galleryLayoutSize;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addBarSwipeView;
- (void)_backgroundTapped:(id)a3;
- (void)_clearDetailViewController;
- (void)_collectionView:(id)a3 updateSeparatorVisibility:(BOOL)a4 forHighlightAtIndexPath:(id)a5;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_keyboardWillDismiss:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_layoutCollectionViewForScalingIfNeeded;
- (void)_layoutSearchBarGradientMaskLayers;
- (void)_makeFakeGalleryItemsFromHomeScreenItems:(id)a3;
- (void)_makeGalleryItemsFromHomeScreenItems:(id)a3;
- (void)_presentDetailSheetForGalleryCellAtIndexPath:(id)a3;
- (void)_presentDetailSheetViewControllerForApplicationWidgetCollection:(id)a3;
- (void)_presentDetailSheetViewControllerForApplicationWidgetCollection:(id)a3 configuredWithGalleryItem:(id)a4 selectedSizeClass:(int64_t)a5 fromCell:(id)a6 atIndexPath:(id)a7;
- (void)_presentDetailViewController:(id)a3 fromCell:(id)a4;
- (void)_presentGalleryCell;
- (void)_refreshData:(BOOL)a3;
- (void)_reloadData;
- (void)_reloadData:(BOOL)a3;
- (void)_selectFirstItem;
- (void)_splitApplicationWidgetCollections;
- (void)_toggleShowingDisfavoredApplicationWidgetCollections;
- (void)_updateCollectionViewInsets;
- (void)_updateHorizontalSpacing;
- (void)_updateSearchBarContentInsets;
- (void)_updateSearchBarOverrideUserInterfaceStyle;
- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4;
- (void)addWidgetSheetViewControllerDidCancel:(id)a3;
- (void)closeButtonTapped:(id)a3;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)didDismissSearchController:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAddWidgetSheetLocation:(unint64_t)a3;
- (void)setApplicationWidgetCollections:(id)a3;
- (void)setApplicationsSectionInsets:(NSDirectionalEdgeInsets)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBarSwipeViewController:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentInsets:(NSDirectionalEdgeInsets)a3;
- (void)setCustomApplicationWidgetCollections:(id)a3;
- (void)setDisfavoredApplicationWidgetCollections:(id)a3;
- (void)setExternalSearchController:(id)a3;
- (void)setFavoredApplicationWidgetCollections:(id)a3;
- (void)setFilteredApplicationWidgetCollections:(id)a3;
- (void)setGalleryItems:(id)a3;
- (void)setGalleryLayoutSize:(unint64_t)a3;
- (void)setHorizontalSpacing:(double)a3;
- (void)setIsShowingDisfavoredApplicationWidgetCollections:(BOOL)a3;
- (void)setKeyboardFrameIntersect:(CGRect)a3;
- (void)setPresenter:(id)a3;
- (void)setSearchBarGradientMaskLayers:(id)a3;
- (void)setSearchBarHeightAdjustment:(double)a3;
- (void)setSearchController:(id)a3;
- (void)setShouldCenterAppCells:(BOOL)a3;
- (void)setShouldShowGalleryOnly:(BOOL)a3;
- (void)setSuggestedItems:(id)a3 forGalleryLayoutSize:(unint64_t)a4;
- (void)setSuggestedItemsByGalleryLayoutSize:(id)a3;
- (void)setTransitionContext:(id)a3;
- (void)setWantsBottomAttachedPresentation:(BOOL)a3;
- (void)updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willPresentSearchController:(id)a3;
@end

@implementation SBHAddWidgetSheetViewController

- (SBHAddWidgetSheetViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [v4 listLayoutProvider];
  v6 = [v4 iconViewProvider];
  uint64_t v7 = [v4 style];
  uint64_t v8 = SBHWidgetFilteringParametersNone();
  v13.receiver = self;
  v13.super_class = (Class)SBHAddWidgetSheetViewController;
  v10 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:](&v13, sel_initWithListLayoutProvider_iconViewProvider_allowedWidgets_appCellConfigurator_addWidgetSheetStyle_, v5, v6, v8, v9, 0, v7);
  v11 = v10;
  if (v10) {
    [(SBHAddWidgetSheetViewController *)v10 setConfiguration:v4];
  }

  return v11;
}

- (SBHAddWidgetSheetViewController)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 allowedWidgets:(SBHWidgetFilteringParameters)a5 appCellConfigurator:(id)a6 addWidgetSheetStyle:(unint64_t)a7
{
  v34.receiver = self;
  v34.super_class = (Class)SBHAddWidgetSheetViewController;
  uint64_t v7 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:](&v34, sel_initWithListLayoutProvider_iconViewProvider_allowedWidgets_appCellConfigurator_addWidgetSheetStyle_, a3, a4, a5.families, *(void *)&a5.includesNonStackable, a6, a7);
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_galleryLayoutSize = 4;
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    suggestedItemsByGalleryLayoutSize = v8->_suggestedItemsByGalleryLayoutSize;
    v8->_suggestedItemsByGalleryLayoutSize = (NSMutableDictionary *)v9;

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v8 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

    if ([(SBHAddWidgetSheetViewControllerBase *)v8 addWidgetSheetStyle] == 1)
    {
      unint64_t v12 = SBHScreenTypeForCurrentDevice();
      SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation(v12, 3, (uint64_t)&v26);
      long long v13 = v26;
      long long v14 = v27;
      long long v15 = v29;
      *(_OWORD *)&v8->_landscapeMetrics.trailingPadding = v28;
      *(_OWORD *)&v8->_landscapeMetrics.widgetScaleFactor = v15;
      *(_OWORD *)&v8->_landscapeMetrics.sheetMargin = v13;
      *(_OWORD *)&v8->_landscapeMetrics.sidebarWidth = v14;
      long long v16 = v30;
      CGSize v17 = v31;
      long long v18 = v32;
      v8->_landscapeMetrics.detailPageControlTopSpacing = v33;
      v8->_landscapeMetrics.detailWidgetPadding = v17;
      *(_OWORD *)&v8->_landscapeMetrics.detailAddButtonTopSpacing = v18;
      *(_OWORD *)&v8->_landscapeMetrics.scaledWidgetSize.height = v16;
      SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation(v12, 1, (uint64_t)&v26);
      long long v19 = v26;
      long long v20 = v27;
      long long v21 = v29;
      *(_OWORD *)&v8->_portraitMetrics.trailingPadding = v28;
      *(_OWORD *)&v8->_portraitMetrics.widgetScaleFactor = v21;
      *(_OWORD *)&v8->_portraitMetrics.sheetMargin = v19;
      *(_OWORD *)&v8->_portraitMetrics.sidebarWidth = v20;
      long long v22 = v30;
      CGSize v23 = v31;
      long long v24 = v32;
      v8->_portraitMetrics.detailPageControlTopSpacing = v33;
      v8->_portraitMetrics.detailWidgetPadding = v23;
      *(_OWORD *)&v8->_portraitMetrics.detailAddButtonTopSpacing = v24;
      *(_OWORD *)&v8->_portraitMetrics.scaledWidgetSize.height = v22;
    }
    else if (![(SBHAddWidgetSheetViewControllerBase *)v8 addWidgetSheetStyle])
    {
      [(SBHAddWidgetSheetViewController *)v8 setWantsBottomAttachedPresentation:1];
    }
    v8->_widgetScaleFactor = 1.0;
    v8->_isShowingDisfavoredApplicationWidgetCollections = 0;
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetSheetViewController;
  [(SBHAddWidgetSheetViewController *)&v4 dealloc];
}

- (unint64_t)supportedInterfaceOrientations
{
  if ([(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)setSuggestedItems:(id)a3 forGalleryLayoutSize:(unint64_t)a4
{
  id v12 = a3;
  suggestedItemsByGalleryLayoutSize = self->_suggestedItemsByGalleryLayoutSize;
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a4];
  id v8 = [(NSMutableDictionary *)suggestedItemsByGalleryLayoutSize objectForKeyedSubscript:v7];

  if (v8 != v12)
  {
    uint64_t v9 = self->_suggestedItemsByGalleryLayoutSize;
    v10 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v9 setObject:v12 forKeyedSubscript:v10];

    if ([(SBHAddWidgetSheetViewController *)self isViewLoaded]
      && self->_galleryLayoutSize == a4)
    {
      [(SBHAddWidgetSheetViewController *)self _makeGalleryItemsFromHomeScreenItems:v12];
    }
    v11 = [(SBHAddWidgetSheetViewController *)self _presentedGalleryViewController];
    [v11 setSuggestedItems:v12 forGalleryLayoutSize:a4];
  }
}

- (id)suggestedItemsForGalleryLayoutSize:(unint64_t)a3
{
  suggestedItemsByGalleryLayoutSize = self->_suggestedItemsByGalleryLayoutSize;
  objc_super v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSMutableDictionary *)suggestedItemsByGalleryLayoutSize objectForKeyedSubscript:v4];

  return v5;
}

- (id)_suggestedItems
{
  suggestedItemsByGalleryLayoutSize = self->_suggestedItemsByGalleryLayoutSize;
  v3 = [NSNumber numberWithUnsignedInteger:self->_galleryLayoutSize];
  objc_super v4 = [(NSMutableDictionary *)suggestedItemsByGalleryLayoutSize objectForKeyedSubscript:v3];

  return v4;
}

- (void)setApplicationWidgetCollections:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBHAddWidgetSheetViewControllerBase *)self allowedWidgets];
  applicationWidgetCollections = self->_applicationWidgetCollections;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__SBHAddWidgetSheetViewController_setApplicationWidgetCollections___block_invoke;
  v15[3] = &__block_descriptor_48_e40_B16__0__SBHApplicationWidgetCollection_8l;
  v15[4] = v5;
  v15[5] = v7;
  objc_msgSend(v4, "bs_filter:", v15);
  id v8 = (NSArray *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = self->_applicationWidgetCollections;
  self->_applicationWidgetCollections = v8;

  applicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = self->_applicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
  if (applicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable)
  {
    [(NSMapTable *)applicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable removeAllObjects];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    id v12 = self->_applicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
    self->_applicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = v11;
  }
  long long v13 = self->_applicationWidgetCollections;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__SBHAddWidgetSheetViewController_setApplicationWidgetCollections___block_invoke_3;
  v14[3] = &unk_1E6AAE8A8;
  v14[4] = self;
  [(NSArray *)v13 enumerateObjectsUsingBlock:v14];
  [(SBHAddWidgetSheetViewController *)self _splitApplicationWidgetCollections];
  if (applicationWidgetCollections) {
    [(SBHAddWidgetSheetViewController *)self _refreshData:[(SBHAddWidgetSheetViewController *)self _shouldAnimateChanges]];
  }
  else {
    [(SBHAddWidgetSheetViewController *)self _reloadData];
  }
}

uint64_t __67__SBHAddWidgetSheetViewController_setApplicationWidgetCollections___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 widgetDescriptors];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__SBHAddWidgetSheetViewController_setApplicationWidgetCollections___block_invoke_2;
  v6[3] = &__block_descriptor_48_e40_B16__0___SBHAddWidgetSheetGalleryItem__8l;
  long long v7 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "bs_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __67__SBHAddWidgetSheetViewController_setApplicationWidgetCollections___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SBHWidgetFilteringParametersNone();
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6 == v4 && (v5 & 1) == *(unsigned char *)(a1 + 40) && ((v5 >> 8) & 1) == *(unsigned char *)(a1 + 41)) {
    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "sbh_supportedSizeClasses") & v6) == 0
    || !*(unsigned char *)(a1 + 40) && !objc_msgSend(v3, "sbh_canBeAddedToStack"))
  {
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  if (!*(unsigned char *)(a1 + 41))
  {
LABEL_10:
    uint64_t v7 = 1;
    goto LABEL_11;
  }
  uint64_t v7 = objc_msgSend(v3, "sbh_supportsRemovableBackgroundOrAccessoryFamilies");
LABEL_11:

  return v7;
}

void __67__SBHAddWidgetSheetViewController_setApplicationWidgetCollections___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1512);
  id v3 = a2;
  id v4 = [v3 collectionIdentifier];
  [v2 setObject:v3 forKey:v4];
}

- (void)setFavoredApplicationWidgetCollections:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = SBLogAddWidgetSheet();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "setFavoredApplicationWidgetCollections:%@", buf, 0xCu);
  }

  objc_storeStrong((id *)&self->_favoredApplicationWidgetCollections, a3);
  favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = self->_favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
  if (favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable)
  {
    [(NSMapTable *)favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable removeAllObjects];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    uint64_t v9 = self->_favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
    self->_favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = v8;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__SBHAddWidgetSheetViewController_setFavoredApplicationWidgetCollections___block_invoke;
  v10[3] = &unk_1E6AAE8A8;
  v10[4] = self;
  [v5 enumerateObjectsUsingBlock:v10];
}

void __74__SBHAddWidgetSheetViewController_setFavoredApplicationWidgetCollections___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1520);
  id v3 = a2;
  id v4 = [v3 collectionIdentifier];
  [v2 setObject:v3 forKey:v4];
}

- (void)setDisfavoredApplicationWidgetCollections:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = SBLogAddWidgetSheet();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "setDisFavoredApplicationWidgetCollections:%@", buf, 0xCu);
  }

  objc_storeStrong((id *)&self->_disfavoredApplicationWidgetCollections, a3);
  disfavoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = self->_disfavoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
  if (disfavoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable)
  {
    [(NSMapTable *)disfavoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable removeAllObjects];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    uint64_t v9 = self->_disfavoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
    self->_disfavoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = v8;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__SBHAddWidgetSheetViewController_setDisfavoredApplicationWidgetCollections___block_invoke;
  v10[3] = &unk_1E6AAE8A8;
  v10[4] = self;
  [v5 enumerateObjectsUsingBlock:v10];
}

void __77__SBHAddWidgetSheetViewController_setDisfavoredApplicationWidgetCollections___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1528);
  id v3 = a2;
  id v4 = [v3 collectionIdentifier];
  [v2 setObject:v3 forKey:v4];
}

- (void)setCustomApplicationWidgetCollections:(id)a3
{
  id v5 = a3;
  customApplicationWidgetCollections = self->_customApplicationWidgetCollections;
  objc_storeStrong((id *)&self->_customApplicationWidgetCollections, a3);
  customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = self->_customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
  if (customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable)
  {
    [(NSMapTable *)customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable removeAllObjects];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    uint64_t v9 = self->_customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable;
    self->_customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable = v8;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__SBHAddWidgetSheetViewController_setCustomApplicationWidgetCollections___block_invoke;
  v10[3] = &unk_1E6AAE8A8;
  v10[4] = self;
  [v5 enumerateObjectsUsingBlock:v10];
  if (customApplicationWidgetCollections) {
    [(SBHAddWidgetSheetViewController *)self _refreshData:[(SBHAddWidgetSheetViewController *)self _shouldAnimateChanges]];
  }
  else {
    [(SBHAddWidgetSheetViewController *)self _reloadData];
  }
}

void __73__SBHAddWidgetSheetViewController_setCustomApplicationWidgetCollections___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1536);
  id v3 = a2;
  id v4 = [v3 collectionIdentifier];
  [v2 setObject:v3 forKey:v4];
}

- (void)setAddWidgetSheetLocation:(unint64_t)a3
{
  self->_addWidgetSheetLocation = a3;
  [(SBHAddWidgetSheetViewController *)self _splitApplicationWidgetCollections];
}

- (void)setGalleryLayoutSize:(unint64_t)a3
{
  if (self->_galleryLayoutSize != a3)
  {
    self->_galleryLayoutSize = a3;
    if ([(SBHAddWidgetSheetViewController *)self _shouldShowGallery]
      && ![(SBHAddWidgetSheetViewController *)self shouldShowGalleryOnly])
    {
      [(SBHAddWidgetSheetViewController *)self _reloadData];
    }
    else
    {
      id v5 = [(SBHAddWidgetSheetViewController *)self _suggestedItems];
      [(SBHAddWidgetSheetViewController *)self _makeGalleryItemsFromHomeScreenItems:v5];
    }
    id v6 = [(SBHAddWidgetSheetViewController *)self _presentedGalleryViewController];
    [v6 setGalleryLayoutSize:a3];
  }
}

- (void)setWantsBottomAttachedPresentation:(BOOL)a3
{
  if (self->_wantsBottomAttachedPresentation != a3)
  {
    BOOL v3 = a3;
    self->_wantsBottomAttachedPresentation = a3;
    -[SBHWidgetSearchController setShouldInsetContentForGrabber:](self->_searchController, "setShouldInsetContentForGrabber:");
    id v5 = [(SBHAddWidgetSheetViewController *)self sheetPresentationController];
    [v5 _setWantsBottomAttached:v3];
  }
}

- (void)loadView
{
  v54[1] = *MEMORY[0x1E4F143B8];
  v53.receiver = self;
  v53.super_class = (Class)SBHAddWidgetSheetViewController;
  [(SBHAddWidgetSheetViewController *)&v53 loadView];
  BOOL v3 = [(SBHAddWidgetSheetViewController *)self view];
  id v4 = [(SBHAddWidgetSheetViewController *)self configuration];
  if ([(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] != 1)
  {
    id v5 = [(SBHAddWidgetSheetViewController *)self _newBackgroundView];
    backgroundView = self->_backgroundView;
    self->_backgroundView = v5;

    uint64_t v7 = self->_backgroundView;
    [v3 bounds];
    -[MTMaterialView setFrame:](v7, "setFrame:");
    [(MTMaterialView *)self->_backgroundView setAutoresizingMask:18];
    [v3 addSubview:self->_backgroundView];
  }
  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x1E4FB1580]);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __43__SBHAddWidgetSheetViewController_loadView__block_invoke;
  v50[3] = &unk_1E6AAE8D0;
  v44 = &v51;
  objc_copyWeak(&v51, &location);
  uint64_t v9 = (void *)[v8 initWithSectionProvider:v50];
  id v10 = objc_alloc_init(MEMORY[0x1E4FB1588]);
  [v10 setInterSectionSpacing:16.0];
  [v9 setConfiguration:v10];
  v11 = [_SBHAddWidgetSheetCollectionView alloc];
  [v3 bounds];
  id v12 = -[_SBHAddWidgetSheetCollectionView initWithFrame:collectionViewLayout:](v11, "initWithFrame:collectionViewLayout:", v9);
  collectionView = self->_collectionView;
  self->_collectionView = v12;

  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView setDelegate:self];
  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView setDelaysContentTouches:0];
  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView setAccessibilityIdentifier:@"add-sheet-collection-view"];
  -[_SBHAddWidgetSheetCollectionView setContainsInteractiveUIControls:](self->_collectionView, "setContainsInteractiveUIControls:", [v4 contentContainsInteractiveUIControls]);
  id v14 = objc_alloc(MEMORY[0x1E4FB1598]);
  long long v15 = self->_collectionView;
  uint64_t v45 = MEMORY[0x1E4F143A8];
  uint64_t v46 = 3221225472;
  v47 = __43__SBHAddWidgetSheetViewController_loadView__block_invoke_2;
  v48 = &unk_1E6AAE8F8;
  v42 = &v49;
  objc_copyWeak(&v49, &location);
  long long v16 = (UICollectionViewDiffableDataSource *)[v14 initWithCollectionView:v15 cellProvider:&v45];
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v16;

  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView setAutoresizingMask:18];
  long long v18 = self->_collectionView;
  long long v19 = [MEMORY[0x1E4FB1618] clearColor];
  [(_SBHAddWidgetSheetCollectionView *)v18 setBackgroundColor:v19];

  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView setKeyboardDismissMode:2];
  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kSBHAddWidgetSheetGalleryCellReuseIdentifier"];
  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kSBHAddWidgetSheetViewControllerCollectionViewReuseIdentifier"];
  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kSBHAddWidgetSheetViewControllerListCellReuseIdentifier"];
  [v3 addSubview:self->_collectionView];
  unint64_t v20 = [(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle];
  if (v20 != 1)
  {
    long long v21 = objc_msgSend(v4, "searchPlaceholderText", &v49, &v51, v45, v46, v47, v48);
    long long v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      long long v24 = SBHBundle();
      id v23 = [v24 localizedStringForKey:@"WIDGET_ADD_SHEET_SEARCH_PLACEHOLDER" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    }
    v25 = [[SBHWidgetSearchController alloc] initWithAddWidgetSheetStyle:v20 placeholderText:v23];
    searchController = self->_searchController;
    self->_searchController = v25;

    [(SBHWidgetSearchController *)self->_searchController setObscuresBackgroundDuringPresentation:0];
    [(SBHWidgetSearchController *)self->_searchController setDelegate:self];
    [(SBHWidgetSearchController *)self->_searchController setSearchResultsUpdater:self];
    [(SBHWidgetSearchController *)self->_searchController setShouldInsetContentForGrabber:self->_wantsBottomAttachedPresentation];
    -[SBHWidgetSearchController setApplicationCellIncludesGalleryListView:](self->_searchController, "setApplicationCellIncludesGalleryListView:", [v4 applicationCellIncludesGalleryListView]);
    long long v27 = self->_searchController;
    long long v28 = [v4 listLayoutProvider];
    [(SBHWidgetSearchController *)v27 setListLayoutProvider:v28];

    long long v29 = self->_searchController;
    long long v30 = [v4 gridSizeClassForContentWidth];
    [(SBHWidgetSearchController *)v29 setWidthDefiningGridSizeClass:v30];

    CGSize v31 = [(SBHWidgetSearchController *)self->_searchController searchBar];
    [(SBHAddWidgetSheetViewController *)self _updateSearchBarContentInsets];
    [v31 sizeToFit];
    long long v32 = [v4 searchTintColor];
    if (v32) {
      [v31 setTintColor:v32];
    }
    [(SBHAddWidgetSheetViewController *)self _updateSearchBarOverrideUserInterfaceStyle];
    [v3 addSubview:v31];
    [(SBHAddWidgetSheetViewController *)self _updateCollectionViewInsets];
    double v33 = [MEMORY[0x1E4FA5F00] configureGradientMaskForFeatherBlurRecipe:4 onContentView:self->_collectionView];
    searchBarGradientMaskLayers = self->_searchBarGradientMaskLayers;
    self->_searchBarGradientMaskLayers = v33;

    [(SBHAddWidgetSheetViewController *)self _layoutSearchBarGradientMaskLayers];
  }
  v35 = [(SBHAddWidgetSheetViewController *)self _materialViewForVisualStyling];
  v36 = [v35 visualStylingProviderForCategory:2];

  v37 = [(SBHWidgetSearchController *)self->_searchController searchBarTextFieldBackgroundView];
  [v36 automaticallyUpdateView:v37 withStyle:2];

  v38 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__backgroundTapped_];
  [v38 setCancelsTouchesInView:0];
  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView addGestureRecognizer:v38];
  v39 = self;
  v54[0] = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
  id v41 = (id)[(SBHAddWidgetSheetViewController *)self registerForTraitChanges:v40 withAction:sel__updateSearchBarOverrideUserInterfaceStyle];

  [(SBHAddWidgetSheetViewController *)self _addBarSwipeView];
  objc_destroyWeak(v43);

  objc_destroyWeak(v44);
  objc_destroyWeak(&location);
}

id __43__SBHAddWidgetSheetViewController_loadView__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v7 = [v5 container];
    [v7 contentSize];
    double v9 = v8;

    id v10 = [WeakRetained _generateLayoutSectionForSectionIdx:a2 width:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

id __43__SBHAddWidgetSheetViewController_loadView__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  v11 = [WeakRetained collectionView:v9 cellForItemAtIndexPath:v8 itemIdentifier:v7];

  return v11;
}

- (id)_newBackgroundView
{
  v2 = [(SBHAddWidgetSheetViewController *)self configuration];
  BOOL v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 backgroundMaterial];
    if (v4 > 2) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = qword_1D81E50C0[v4];
    }
  }
  else
  {
    uint64_t v5 = 54;
  }
  id v6 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:v5];
  [v6 setBackdropScaleAdjustment:&__block_literal_global_18];
  [v6 setGroupNameBase:@"Add-Sheet"];

  return v6;
}

double __53__SBHAddWidgetSheetViewController__newBackgroundView__block_invoke()
{
  return 0.25;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  collectionView = self->_collectionView;
  id v5 = a3;
  [(_SBHAddWidgetSheetCollectionView *)collectionView contentInset];
  double v7 = v6;
  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView contentOffset];
  double v9 = v8;
  id v11 = [(SBHAddWidgetSheetViewController *)self _effectiveSearchController];
  [v11 _contentSizeCategoryDidChange:v5];

  id v10 = [v11 searchBar];
  [v10 sizeToFit];
  [v10 layoutIfNeeded];
  [(SBHAddWidgetSheetViewController *)self _updateCollectionViewInsets];
  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView contentInset];
  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView contentOffset];
  if (v9 == -v7) {
    -[_SBHAddWidgetSheetCollectionView setContentOffset:](self->_collectionView, "setContentOffset:");
  }
  [(SBHAddWidgetSheetViewController *)self _layoutSearchBarGradientMaskLayers];
  [(SBHAddWidgetSheetViewController *)self scrollViewDidScroll:self->_collectionView];
}

- ($A8FDFC956663B0B54E66E9982D7A2B15)sheetIconMetrics
{
  p_height = (char *)&self[36].var1.size.height;
  if (self[36].var1.size.height == 0.0)
  {
    id v5 = self;
    double v6 = [($A8FDFC956663B0B54E66E9982D7A2B15 *)self traitCollection];
    [v6 displayScale];
    double v8 = v7;

    double v9 = [($A8FDFC956663B0B54E66E9982D7A2B15 *)v5 configuration];
    int v10 = [v9 applicationCellIncludesGalleryListView];

    if (v10)
    {
      SBHAddWidgetSheetListViewIconMetricsForScale((uint64_t)v13, v8);
LABEL_8:
      long long v11 = v13[1];
      *(_OWORD *)p_height = v13[0];
      *((_OWORD *)p_height + 1) = v11;
      *((void *)p_height + 4) = v14;
      goto LABEL_9;
    }
    self = ($A8FDFC956663B0B54E66E9982D7A2B15 *)[($A8FDFC956663B0B54E66E9982D7A2B15 *)v5 addWidgetSheetStyle];
    if (self == ($A8FDFC956663B0B54E66E9982D7A2B15 *)1)
    {
      SBHAddWidgetSheetSplitViewIconMetricsForScale((uint64_t)v13, v8);
      goto LABEL_8;
    }
    if (!self)
    {
      SBHAddWidgetSheetCompactViewIconMetricsForScale((uint64_t)v13, v8);
      goto LABEL_8;
    }
  }
LABEL_9:
  long long v12 = *((_OWORD *)p_height + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)p_height;
  *(_OWORD *)&retstr->var1.size.height = v12;
  retstr->var1.continuousCornerRadius = *((double *)p_height + 4);
  return self;
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBHAddWidgetSheetViewController;
  [(SBHAddWidgetSheetViewController *)&v11 viewWillAppear:a3];
  unint64_t v4 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  [v4 addWidgetSheetViewControllerWillAppear:self];

  id v5 = [(SBHAddWidgetSheetViewController *)self _suggestedItems];
  if ([(SBHAddWidgetSheetViewController *)self _shouldShowGallery] && v5 && !self->_galleryItems) {
    [(SBHAddWidgetSheetViewController *)self _makeGalleryItemsFromHomeScreenItems:v5];
  }
  double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

  double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__keyboardWillDismiss_ name:*MEMORY[0x1E4FB2C50] object:0];

  if ([(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] == 1)
  {
    double v8 = [(SBHAddWidgetSheetViewController *)self navigationController];
    [v8 setNavigationBarHidden:1];

    if (!self->_performedInitialSelection)
    {
      self->_performedInitialSelection = 1;
      if (![(SBHAddWidgetSheetViewController *)self shouldShowGalleryOnly])
      {
        [(SBHAddWidgetSheetViewController *)self _selectFirstItem];
        if (!self->_lastSelectedIndexPath)
        {
          [(SBHAddWidgetSheetViewController *)self _presentGalleryCell];
          double v9 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:2];
          lastSelectedIndexPath = self->_lastSelectedIndexPath;
          self->_lastSelectedIndexPath = v9;
        }
      }
    }
  }
  else if (!self->_performedInitialSelection)
  {
    self->_performedInitialSelection = 1;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBHAddWidgetSheetViewController;
  [(SBHAddWidgetSheetViewController *)&v7 viewDidAppear:a3];
  unint64_t v4 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  [v4 addWidgetSheetViewControllerDidAppear:self];

  if (!__sb__runningInSpringBoard())
  {
    id v5 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6) {
      goto LABEL_7;
    }
LABEL_6:
    [(_SBHAddWidgetSheetCollectionView *)self->_collectionView setClipsToBounds:0];
    [(_SBHAddWidgetSheetCollectionView *)self->_collectionView setAutoresizingMask:34];
    goto LABEL_7;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_6;
  }
LABEL_7:
  [(SBHAddWidgetSheetViewController *)self _updateCollectionViewInsets];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHAddWidgetSheetViewController;
  [(SBHAddWidgetSheetViewController *)&v5 viewWillDisappear:a3];
  unint64_t v4 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  [v4 addWidgetSheetViewControllerWillDisappear:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBHAddWidgetSheetViewController;
  [(SBHAddWidgetSheetViewController *)&v8 viewDidDisappear:a3];
  unint64_t v4 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  [v4 addWidgetSheetViewControllerDidDisappear:self];

  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4FB2C58] object:0];

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4FB2C50] object:0];

  objc_super v7 = [(SBHAddWidgetSheetViewController *)self _effectiveSearchController];
  [v7 updateSearchBarBackgroundForScrollDistance:self forClient:2.22507386e-308];

  self->_sheetIconMetrics.horizontalSpacing = 0.0;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetSheetViewController;
  [(SBHAddWidgetSheetViewController *)&v3 viewWillLayoutSubviews];
  [(SBHAddWidgetSheetViewController *)self _layoutSearchBarGradientMaskLayers];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBHAddWidgetSheetViewController;
  [(SBHAddWidgetSheetViewController *)&v5 viewDidLayoutSubviews];
  [(SBHAddWidgetSheetViewController *)self _updateSearchBarContentInsets];
  [(SBHAddWidgetSheetViewController *)self _layoutCollectionViewForScalingIfNeeded];
  objc_super v3 = [(SBHWidgetSearchController *)self->_searchController searchBar];
  [v3 layoutIfNeeded];

  if (![(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle])
  {
    unint64_t v4 = [(SBHAddWidgetSheetViewController *)self sheetPresentationController];
    [(SBHWidgetSearchController *)self->_searchController grabberTopSpacing];
    objc_msgSend(v4, "_setGrabberTopSpacing:");
  }
}

- (void)_layoutCollectionViewForScalingIfNeeded
{
  if ([(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] == 1
    && [(SBHAddWidgetSheetViewController *)self shouldShowGalleryOnly])
  {
    objc_super v3 = [(SBHAddWidgetSheetViewController *)self view];
    uint64_t v31 = 0;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
    [(SBHAddWidgetSheetViewController *)self _metricsForCurrentOrientation];
    [v3 bounds];
    double v21 = v4;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [v3 bounds];
    UIRectGetCenter();
    double v12 = v11;
    double v14 = v13;
    [(_SBHAddWidgetSheetCollectionView *)self->_collectionView contentOffset];
    double v16 = v15;
    double v18 = v17;
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v23.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v23.c = v19;
    *(_OWORD *)&v23.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    if ((BSFloatIsOne() & 1) == 0)
    {
      CGAffineTransformMakeScale(&v23, *(CGFloat *)&v27, *(CGFloat *)&v27);
      double v8 = *((double *)&v25 + 1) + *(double *)&v26 + (v8 - (*((double *)&v25 + 1) + *(double *)&v26)) / 0.0;
      double v10 = v10 / 0.0;
    }
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      collectionView = self->_collectionView;
      CGAffineTransform v22 = v23;
      [(_SBHAddWidgetSheetCollectionView *)collectionView setTransform:&v22];
      -[_SBHAddWidgetSheetCollectionView setCenter:](self->_collectionView, "setCenter:", v12, v14);
      -[_SBHAddWidgetSheetCollectionView setBounds:](self->_collectionView, "setBounds:", v21, v6, v8, v10);
      -[_SBHAddWidgetSheetCollectionView setContentOffset:](self->_collectionView, "setContentOffset:", v16, v18);
      *(void *)&self->_widgetScaleFactor = v27;
    }
  }
}

- (void)_layoutSearchBarGradientMaskLayers
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4FA5F00] gradientMaskLayerInsetsForFeatherBlurRecipe:4];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(SBHWidgetSearchController *)self->_searchController searchBarBackgroundView];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v20 = self->_searchBarGradientMaskLayers;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    double v23 = v19 - (v4 + v8);
    double v24 = v17 - (v6 + v10);
    double v25 = v4 + v15;
    double v26 = v6 + v13;
    uint64_t v27 = *(void *)v30;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v28++), "setFrame:", v26, v25, v24, v23, (void)v29);
      }
      while (v22 != v28);
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v22);
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBHAddWidgetSheetViewController;
  [(SBHAddWidgetSheetViewController *)&v10 didMoveToParentViewController:a3];
  if ([(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] == 1
    && [(SBHAddWidgetSheetViewController *)self shouldShowGalleryOnly])
  {
    double v4 = [(SBHAddWidgetSheetViewController *)self splitViewController];
    double v5 = [v4 view];

    double v6 = self->_collectionView;
    double v7 = v6;
    if (v6) {
      BOOL v8 = v6 == v5;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      do
      {
        double v9 = v7;
        [(_SBHAddWidgetSheetCollectionView *)v7 setClipsToBounds:0];
        double v7 = [(_SBHAddWidgetSheetCollectionView *)v7 superview];
      }
      while (v7 && v7 != v5);
    }
  }
}

- (void)setGalleryItems:(id)a3
{
  double v4 = (NSArray *)a3;
  if (self->_galleryItems != v4)
  {
    galleryIdentifierToGalleryItemLookupTable = self->_galleryIdentifierToGalleryItemLookupTable;
    if (galleryIdentifierToGalleryItemLookupTable)
    {
      [(NSMapTable *)galleryIdentifierToGalleryItemLookupTable removeAllObjects];
    }
    else
    {
      double v6 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
      double v7 = self->_galleryIdentifierToGalleryItemLookupTable;
      self->_galleryIdentifierToGalleryItemLookupTable = v6;
    }
    BOOL v8 = ((unint64_t)v4 | (unint64_t)self->_galleryItems) != 0;
    if (v4) {
      double v9 = (NSArray *)[(NSArray *)v4 copy];
    }
    else {
      double v9 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    galleryItems = self->_galleryItems;
    self->_galleryItems = v9;

    double v11 = self->_galleryItems;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__SBHAddWidgetSheetViewController_setGalleryItems___block_invoke;
    v12[3] = &unk_1E6AAE920;
    v12[4] = self;
    [(NSArray *)v11 enumerateObjectsUsingBlock:v12];
    if (v8) {
      [(SBHAddWidgetSheetViewController *)self _refreshData:[(SBHAddWidgetSheetViewController *)self _shouldAnimateChanges]];
    }
    else {
      [(SBHAddWidgetSheetViewController *)self _reloadData];
    }
  }
}

void __51__SBHAddWidgetSheetViewController_setGalleryItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1504);
  id v3 = a2;
  id v5 = [v3 galleryItem];
  double v4 = objc_msgSend(v5, "sbh_galleryItemIdentifier");
  [v2 setObject:v3 forKey:v4];
}

- (void)setBarSwipeViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  if (self->_barSwipeViewController != v5)
  {
    double v7 = v5;
    -[SBHAddWidgetSheetViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    objc_storeStrong((id *)&self->_barSwipeViewController, a3);
    int v6 = [(SBHAddWidgetSheetViewController *)self isViewLoaded];
    id v5 = v7;
    if (v6)
    {
      [(SBHAddWidgetSheetViewController *)self _addBarSwipeView];
      id v5 = v7;
    }
  }
}

- (void)_addBarSwipeView
{
  [(SBHAddWidgetSheetViewController *)self bs_addChildViewController:self->_barSwipeViewController];
  id v4 = [(UIViewController *)self->_barSwipeViewController view];
  id v3 = [(SBHAddWidgetSheetViewController *)self view];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");

  [v4 setUserInteractionEnabled:0];
  [v4 setAutoresizingMask:18];
}

- (void)setExternalSearchController:(id)a3
{
  id v5 = (SBHWidgetSearchController *)a3;
  if (self->_externalSearchController != v5)
  {
    int v6 = v5;
    objc_storeStrong((id *)&self->_externalSearchController, a3);
    [(SBHAddWidgetSheetViewController *)self _updateSearchBarOverrideUserInterfaceStyle];
    id v5 = v6;
  }
}

- (void)closeButtonTapped:(id)a3
{
  id v4 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 addWidgetSheetViewControllerDidCancel:self];
  }
}

- (void)_backgroundTapped:(id)a3
{
  collectionView = self->_collectionView;
  [a3 locationInView:collectionView];
  id v5 = -[_SBHAddWidgetSheetCollectionView indexPathForItemAtPoint:](collectionView, "indexPathForItemAtPoint:");

  if (!v5)
  {
    int v6 = [(SBHAddWidgetSheetViewController *)self searchController];
    int v7 = [v6 isActive];

    if (v7)
    {
      id v8 = [(SBHAddWidgetSheetViewController *)self searchController];
      [v8 setActive:0];
    }
  }
}

- (void)_keyboardWillShow:(id)a3
{
  id v27 = [a3 userInfo];
  id v4 = [(SBHAddWidgetSheetViewController *)self view];
  id v5 = [v27 valueForKey:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = [(SBHAddWidgetSheetViewController *)self view];
  objc_msgSend(v14, "convertRect:fromView:", 0, v7, v9, v11, v13);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  [v4 bounds];
  v30.origin.x = v23;
  v30.origin.y = v24;
  v30.size.width = v25;
  v30.size.height = v26;
  v29.origin.x = v16;
  v29.origin.y = v18;
  v29.size.width = v20;
  v29.size.height = v22;
  self->_keyboardFrameIntersect = CGRectIntersection(v29, v30);
  [(SBHAddWidgetSheetViewController *)self _updateCollectionViewInsets];
}

- (void)_keyboardWillDismiss:(id)a3
{
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_keyboardFrameIntersect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_keyboardFrameIntersect.size = v3;
  [(SBHAddWidgetSheetViewController *)self _updateCollectionViewInsets];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x1E4FB1EB0] _isInAnimationBlock] & 1) == 0)
  {
    [v9 adjustedContentInset];
    double v5 = v4;
    [v9 contentOffset];
    double v7 = v6;
    double v8 = [(SBHAddWidgetSheetViewController *)self _effectiveSearchController];
    [v8 updateSearchBarBackgroundForScrollDistance:self forClient:v5 + v7];

    [(SBHAddWidgetSheetViewController *)self _layoutSearchBarGradientMaskLayers];
  }
}

- (id)_generateSnapshotDiffedFromSnapshot:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke;
  aBlock[3] = &unk_1E6AAE990;
  id v5 = v4;
  id v16 = v5;
  double v6 = (void (**)(void *, void *, id))_Block_copy(aBlock);
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  uint64_t v8 = 0;
  while (1)
  {
    if (!v8)
    {
      if ([(SBHAddWidgetSheetViewController *)self _shouldShowGallery])
      {
LABEL_8:
        double v10 = [(SBHAddWidgetSheetViewController *)self galleryItems];
        v6[2](v6, v10, v7);
LABEL_12:
      }
      goto LABEL_13;
    }
    if (![(SBHAddWidgetSheetViewController *)self shouldShowGalleryOnly]) {
      break;
    }
LABEL_13:
    if (++v8 == 4) {
      goto LABEL_14;
    }
  }
  switch(v8)
  {
    case 1:
      uint64_t v9 = [(SBHAddWidgetSheetViewController *)self _shouldShowCustomApplicationsSection];
      if (v9) {
        __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_5(v9, self->_customApplicationWidgetCollections, v7);
      }
      goto LABEL_13;
    case 2:
      double v10 = [(SBHAddWidgetSheetViewController *)self applicationWidgetCollectionsToUse];
      uint64_t v11 = [(SBHAddWidgetSheetViewController *)self _shouldShowSuggestionsListItem];
      if (v11) {
        __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_4(v11, v7);
      }
      __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_7(v11, v10, v7);
      goto LABEL_12;
    case 3:
      uint64_t v13 = [(SBHAddWidgetSheetViewController *)self _shouldShowDisfavoredSection];
      if (v13)
      {
        __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_9(v13, v7);
        if (self->_isShowingDisfavoredApplicationWidgetCollections) {
          __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_10(v14, self->_disfavoredApplicationWidgetCollections, v7);
        }
      }
      break;
    default:
      goto LABEL_8;
  }
LABEL_14:

  return v7;
}

void __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = [v6 sectionIdentifiers];
    char v8 = [v7 containsObject:@"SBHAddSheetCollectionViewSectionGallery"];

    if ((v8 & 1) == 0)
    {
      v16[0] = @"SBHAddSheetCollectionViewSectionGallery";
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      [v6 appendSectionsWithIdentifiers:v9];
    }
    double v10 = objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_97);
    [v6 appendItemsWithIdentifiers:v10];
    uint64_t v11 = [*(id *)(a1 + 32) sectionIdentifiers];
    int v12 = [v11 containsObject:@"SBHAddSheetCollectionViewSectionGallery"];

    if (v12)
    {
      uint64_t v13 = [*(id *)(a1 + 32) itemIdentifiersInSectionWithIdentifier:@"SBHAddSheetCollectionViewSectionGallery"];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_3;
      v14[3] = &unk_1E6AAE968;
      id v15 = v6;
      [v13 enumerateObjectsUsingBlock:v14];
    }
  }
}

id __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 galleryItem];
  CGSize v3 = objc_msgSend(v2, "sbh_galleryItemIdentifier");

  return v3;
}

void __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_3(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) indexOfItemIdentifier:v3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = *(void **)(a1 + 32);
    v6[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [v4 reconfigureItemsWithIdentifiers:v5];
  }
}

void __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_4(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 sectionIdentifiers];
  char v4 = [v3 containsObject:@"SBHAddSheetCollectionViewSectionApplications"];

  if ((v4 & 1) == 0)
  {
    v8[0] = @"SBHAddSheetCollectionViewSectionApplications";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v2 appendSectionsWithIdentifiers:v5];
  }
  id v7 = @"kSBHAddWidgetSheetGallerySuggestionsItemIdentifier";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  [v2 appendItemsWithIdentifiers:v6];
}

void __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = [v5 sectionIdentifiers];
  char v7 = [v6 containsObject:@"SBHAddSheetCollectionViewSectionCustomApplications"];

  if ((v7 & 1) == 0)
  {
    v10[0] = @"SBHAddSheetCollectionViewSectionCustomApplications";
    char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v5 appendSectionsWithIdentifiers:v8];
  }
  uint64_t v9 = objc_msgSend(v4, "bs_mapNoNulls:", &__block_literal_global_107);
  [v5 appendItemsWithIdentifiers:v9];
}

uint64_t __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 collectionIdentifier];
}

void __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if ([v4 count])
  {
    id v6 = [v5 sectionIdentifiers];
    char v7 = [v6 containsObject:@"SBHAddSheetCollectionViewSectionApplications"];

    if ((v7 & 1) == 0)
    {
      v10[0] = @"SBHAddSheetCollectionViewSectionApplications";
      char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      [v5 appendSectionsWithIdentifiers:v8];
    }
    uint64_t v9 = objc_msgSend(v4, "bs_mapNoNulls:", &__block_literal_global_111);
    [v5 appendItemsWithIdentifiers:v9];
  }
}

uint64_t __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 collectionIdentifier];
}

void __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_9(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 sectionIdentifiers];
  char v4 = [v3 containsObject:@"SBHAddSheetCollectionViewSectionDisfavoredApplications"];

  if ((v4 & 1) == 0)
  {
    v8[0] = @"SBHAddSheetCollectionViewSectionDisfavoredApplications";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v2 appendSectionsWithIdentifiers:v5];
  }
  char v7 = @"kSBHAddWidgetSheetOtherItemIdentifier";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  [v2 appendItemsWithIdentifiers:v6];
}

void __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 sectionIdentifiers];
  char v7 = [v6 containsObject:@"SBHAddSheetCollectionViewSectionDisfavoredApplications"];

  if ((v7 & 1) == 0)
  {
    v12[0] = @"SBHAddSheetCollectionViewSectionDisfavoredApplications";
    char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v4 appendSectionsWithIdentifiers:v8];
  }
  uint64_t v11 = @"kSBHAddWidgetSheetOtherDescriptionItemIdentifier";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  [v4 appendItemsWithIdentifiers:v9];

  double v10 = objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_117);

  if (v10) {
    [v4 appendItemsWithIdentifiers:v10];
  }
}

uint64_t __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 collectionIdentifier];
}

- (void)_refreshData:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UICollectionViewDiffableDataSource *)self->_diffableDataSource snapshot];
  id v6 = [(SBHAddWidgetSheetViewController *)self _generateSnapshotDiffedFromSnapshot:v5];

  [(UICollectionViewDiffableDataSource *)self->_diffableDataSource applySnapshot:v6 animatingDifferences:v3];
}

- (void)_reloadData
{
}

- (void)_reloadData:(BOOL)a3
{
  id v7 = [(SBHAddWidgetSheetViewController *)self _generateSnapshotDiffedFromSnapshot:0];
  if (a3
    || ([(UICollectionViewDiffableDataSource *)self->_diffableDataSource snapshot],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v7 isEqual:v5],
        v5,
        (v6 & 1) == 0))
  {
    [(UICollectionViewDiffableDataSource *)self->_diffableDataSource applySnapshotUsingReloadData:v7];
  }
}

- (unint64_t)_sectionIndexForSection:(unint64_t)a3
{
  BOOL v5 = [(SBHAddWidgetSheetViewController *)self _shouldShowGallery];
  BOOL v6 = [(SBHAddWidgetSheetViewController *)self _shouldShowCustomApplicationsSection];
  if (v5 && v6) {
    return a3;
  }
  if (!v5 && !v6)
  {
    a3 -= 2;
    return a3;
  }
  if (v6) {
    return --a3;
  }
  if (a3) {
    return a3 - 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)_applicationWidgetCollectionIndexForItemIndex:(unint64_t)a3
{
  BOOL v4 = [(SBHAddWidgetSheetViewController *)self _shouldShowSuggestionsListItem];
  unint64_t v5 = a3 - 1;
  if (!a3) {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v4) {
    return v5;
  }
  else {
    return a3;
  }
}

- (unint64_t)_itemIndexForApplicationWidgetCollectionIndex:(unint64_t)a3
{
  return a3 + [(SBHAddWidgetSheetViewController *)self _shouldShowSuggestionsListItem];
}

- (BOOL)_shouldAnimateChanges
{
  int v3 = [(SBHAddWidgetSheetViewController *)self isViewLoaded];
  if (v3)
  {
    LOBYTE(v3) = [(SBHAddWidgetSheetViewController *)self bs_isAppearingOrAppeared];
  }
  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 section];
  if (v11 != [(SBHAddWidgetSheetViewController *)self _sectionIndexForSection:0])
  {
    uint64_t v22 = [v9 section];
    if (v22 != [(SBHAddWidgetSheetViewController *)self _sectionIndexForSection:2])
    {
      uint64_t v23 = [v9 section];
      if (v23 != [(SBHAddWidgetSheetViewController *)self _sectionIndexForSection:3])
      {
        uint64_t v24 = [v9 section];
        if (v24 != [(SBHAddWidgetSheetViewController *)self _sectionIndexForSection:1])
        {
          int v12 = 0;
          goto LABEL_67;
        }
      }
    }
    double v106 = 0.0;
    long long v104 = 0u;
    long long v105 = 0u;
    [(SBHAddWidgetSheetViewController *)self sheetIconMetrics];
    CGFloat v25 = [(SBHAddWidgetSheetViewController *)self configuration];
    if ([v25 applicationCellIncludesGalleryListView])
    {
      int v12 = [v8 dequeueReusableCellWithReuseIdentifier:@"kSBHAddWidgetSheetViewControllerListCellReuseIdentifier" forIndexPath:v9];
      objc_msgSend(v12, "setIconImageInfo:", *((double *)&v104 + 1), v105, v106);
      uint64_t v26 = [v9 section];
      if (v26 == [(SBHAddWidgetSheetViewController *)self _sectionIndexForSection:1])
      {
        id v27 = [(NSMapTable *)self->_customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable objectForKey:v10];
        uint64_t v28 = [v27 displayName];
        uint64_t v29 = [v28 length];

        if (!v29) {
          [v12 setWantsHeaderView:0];
        }
      }
      else
      {
        id v27 = [(NSMapTable *)self->_favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable objectForKey:v10];
      }
      v40 = [v27 customImage];

      id v98 = v8;
      if (v40)
      {
        uint64_t v41 = [v27 customImage];
        v42 = [v27 customImageBackgroundColor];
      }
      else
      {
        v48 = [v8 traitCollection];
        id v49 = [v27 icon];
        v50 = [v49 applicationBundleID];
        uint64_t v41 = SBHGetApplicationIconImageWithTraitCollection(v50, (uint64_t)v48, 0, *((double *)&v104 + 1), *(double *)&v105, *((double *)&v105 + 1));

        v42 = 0;
      }
      v92 = (void *)v41;
      [v12 setIconImage:v41];
      [v12 setIconBackgroundColor:v42];
      id v51 = [v27 displayName];
      [v12 setTitle:v51];

      v52 = [v12 iconListView];
      uint64_t v53 = [(SBIconListView *)v52 model];
      v54 = (void *)v53;
      id v93 = v10;
      if (v52)
      {
        v91 = v52;
        v99 = (void *)v53;
      }
      else
      {
        v89 = v42;
        v55 = [(SBHAddWidgetSheetViewController *)self _listLayoutForWidgetSizing];
        uint64_t v56 = (unsigned __int16)[v55 numberOfColumnsForOrientation:1];
        int v57 = [v55 numberOfRowsForOrientation:1];
        if (objc_opt_respondsToSelector())
        {
          v58 = [v55 iconGridSizeClassSizes];
        }
        else
        {
          v58 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
        }
        v96 = v58;
        v60 = [[SBIconListModel alloc] initWithFolder:0 gridSize:(v57 << 16) | (unint64_t)(unsigned __int16)v56 gridSizeClassSizes:v58];

        [(SBIconListModel *)v60 setIconLayoutBehavior:3];
        v61 = [v25 gridSizeClassDomain];
        [(SBIconListModel *)v60 setGridSizeClassDomain:v61];

        if (objc_opt_respondsToSelector())
        {
          v62 = [v55 supportedIconGridSizeClasses];
          [(SBIconListModel *)v60 setAllowedGridSizeClasses:v62];
        }
        v63 = [SBIconListView alloc];
        v64 = [(SBHAddWidgetSheetViewControllerBase *)self listLayoutProvider];
        v65 = [(SBHAddWidgetSheetViewControllerBase *)self iconViewProvider];
        v99 = v60;
        v66 = [(SBIconListView *)v63 initWithModel:v60 layoutProvider:v64 iconLocation:@"SBIconLocationRoot" orientation:1 iconViewProvider:v65];

        [(SBIconListView *)v66 setIconViewConfigurationOptions:82];
        [(SBIconListView *)v66 setIconSpacing:SBHIconListLayoutListIconSpacingWithDefault(v55, 1, 12.0)];
        v91 = v66;
        [v12 setIconListView:v66];

        v42 = v89;
      }
      id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v68 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
      v69 = [v27 filteredWidgetDescriptors];
      id v8 = v98;
      v95 = v27;
      if ([v69 count]) {
        [v27 filteredWidgetDescriptors];
      }
      else {
      v97 = [v27 widgetDescriptors];
      }

      if (objc_opt_respondsToSelector())
      {
        v90 = v42;
        v94 = v25;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        id v70 = v97;
        uint64_t v71 = [v70 countByEnumeratingWithState:&v100 objects:v107 count:16];
        if (v71)
        {
          uint64_t v72 = v71;
          uint64_t v73 = *(void *)v101;
          do
          {
            for (uint64_t i = 0; i != v72; ++i)
            {
              if (*(void *)v101 != v73) {
                objc_enumerationMutation(v70);
              }
              v75 = [v68 addWidgetSheetViewController:self widgetIconForGalleryItem:*(void *)(*((void *)&v100 + 1) + 8 * i)];
              objc_msgSend(v67, "bs_safeAddObject:", v75);
            }
            uint64_t v72 = [v70 countByEnumeratingWithState:&v100 objects:v107 count:16];
          }
          while (v72);
        }

        id v8 = v98;
        CGFloat v25 = v94;
        v42 = v90;
      }
      [v99 setIcons:v67];
      uint64_t v76 = [v8 numberOfSections] - 1;
      uint64_t v77 = objc_msgSend(v8, "numberOfItemsInSection:", objc_msgSend(v9, "section"));
      BOOL v78 = [v9 section] != v76 || objc_msgSend(v9, "item") != v77 - 1;
      [v12 setSeparatorVisible:v78];
      v79 = [v12 visualStylingProvider];
      v80 = v95;
      if (!v79)
      {
        v81 = [(SBHAddWidgetSheetViewController *)self _materialViewForVisualStyling];
        v79 = [v81 visualStylingProviderForCategory:1];

        v80 = v95;
        [v12 setVisualStylingProvider:v79];
      }

      id v10 = v93;
LABEL_66:

      goto LABEL_67;
    }
    int v12 = [v8 dequeueReusableCellWithReuseIdentifier:@"kSBHAddWidgetSheetViewControllerCollectionViewReuseIdentifier" forIndexPath:v9];
    unint64_t v30 = [(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle];
    [v12 setAddWidgetSheetStyle:v30];
    [v12 setSeparatorAlignedToLabels:1];
    double leading = 12.0;
    double trailing = 12.0;
    if (!v30)
    {
      double leading = self->_contentInsets.leading;
      double trailing = self->_contentInsets.trailing;
    }
    objc_msgSend(v12, "setContentInsets:", 12.0, leading, 12.0, trailing);
    [v12 setContentHorizontalSpacing:*(double *)&v104];
    objc_msgSend(v12, "setSeparatorVisible:", objc_msgSend(v9, "item") != objc_msgSend(v8, "numberOfItemsInSection:", objc_msgSend(v9, "section")) - 1);
    objc_msgSend(v12, "setIconImageInfo:", *((double *)&v104 + 1), v105, v106);
    uint64_t v33 = [v9 section];
    if (v33 == [(SBHAddWidgetSheetViewController *)self _sectionIndexForSection:2])
    {
      if ([v10 isEqual:@"kSBHAddWidgetSheetGallerySuggestionsItemIdentifier"])
      {
        uint64_t v34 = [v12 textLabel];
        v35 = SBHBundle();
        v36 = [v35 localizedStringForKey:@"ADD_WIDGET_SHEET_SUGGESTIONS_CELL_LABEL" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
        [v34 setText:v36];

        v37 = [v12 imageView];
        v38 = (void *)MEMORY[0x1E4FB1818];
        v39 = @"rectangle.3.offgrid";
LABEL_27:
        v47 = [v38 systemImageNamed:v39];
        [v37 setImage:v47];

        [v12 setImageViewRequiresVisualStyling:1];
        goto LABEL_62;
      }
      uint64_t v59 = 1520;
    }
    else
    {
      uint64_t v43 = [v9 section];
      if (v43 != [(SBHAddWidgetSheetViewController *)self _sectionIndexForSection:3]) {
        goto LABEL_62;
      }
      if ([v10 isEqual:@"kSBHAddWidgetSheetOtherItemIdentifier"])
      {
        v44 = [v12 textLabel];
        uint64_t v45 = SBHBundle();
        uint64_t v46 = [v45 localizedStringForKey:@"ADD_WIDGET_SHEET_OTHER_CELL_LABEL" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
        [v44 setText:v46];

        v37 = [v12 imageView];
        v38 = (void *)MEMORY[0x1E4FB1818];
        v39 = @"ellipsis";
        goto LABEL_27;
      }
      if ([v10 isEqual:@"kSBHAddWidgetSheetOtherDescriptionItemIdentifier"])
      {
        v82 = [(SBHAddWidgetSheetViewController *)self _otherDescriptionLabel];
        [v12 setDetailText:v82];
        v83 = [v12 imageView];
        [v83 setHidden:1];

        [v12 setUserInteractionEnabled:0];
LABEL_61:

LABEL_62:
        uint64_t v85 = [v12 visualStylingProvider];
        v80 = (void *)v85;
        if (v30 == 1 && !v85)
        {
          v86 = [(SBHAddWidgetSheetViewController *)self _materialViewForVisualStyling];
          uint64_t v87 = [v86 visualStylingProviderForCategory:1];

          v80 = (void *)v87;
          [v12 setVisualStylingProvider:v87];
        }
        [v12 setFocusEffect:0];
        goto LABEL_66;
      }
      uint64_t v59 = 1528;
    }
    v82 = [*(id *)((char *)&self->super.super.super.super.isa + v59) objectForKey:v10];
    v84 = [(SBHAddWidgetSheetViewControllerBase *)self appCellConfigurator];
    [v84 configureCell:v12 withApplicationWidgetCollection:v82];

    [v12 setImageViewRequiresVisualStyling:0];
    goto LABEL_61;
  }
  int v12 = [v8 dequeueReusableCellWithReuseIdentifier:@"kSBHAddWidgetSheetGalleryCellReuseIdentifier" forIndexPath:v9];
  uint64_t v13 = [NSString stringWithFormat:@"%ld/%@", objc_msgSend(v9, "item"), v10];
  uint64_t v14 = [v12 debugLabel];
  [v14 setText:v13];

  id v15 = [(NSMapTable *)self->_galleryIdentifierToGalleryItemLookupTable objectForKey:v10];
  id v16 = [v12 widgetWrapperViewController];

  if (v16 != v15)
  {
    double v17 = [v15 parentViewController];
    if (v17 == self)
    {
      CGFloat v18 = [v15 view];
      [v18 removeFromSuperview];

      [v15 removeFromParentViewController];
      double v17 = 0;
    }
    [v12 setWidgetWrapperViewController:v15];
    if (v17 != self)
    {
      double v19 = [v12 widgetWrapperViewController];
      [v12 contentView];
      v21 = id v20 = v10;
      [(SBHAddWidgetSheetViewController *)self bs_addChildViewController:v19 withSuperview:v21];

      id v10 = v20;
    }
  }
LABEL_67:

  return v12;
}

- (id)applicationWidgetCollectionsToUse
{
  filteredApplicationWidgetCollections = self->_filteredApplicationWidgetCollections;
  if (!filteredApplicationWidgetCollections) {
    filteredApplicationWidgetCollections = self->_favoredApplicationWidgetCollections;
  }
  int v3 = filteredApplicationWidgetCollections;
  return v3;
}

- (void)_splitApplicationWidgetCollections
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  int v3 = [(SBHAddWidgetSheetViewController *)self applicationWidgetCollections];
  uint64_t v28 = self;
  uint64_t v4 = [(SBHAddWidgetSheetViewControllerBase *)self allowedWidgets];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v3;
  uint64_t v23 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  id v5 = 0;
  if (v23)
  {
    uint64_t v24 = 0;
    uint64_t v22 = *(void *)v34;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v6;
        id v7 = *(void **)(*((void *)&v33 + 1) + 8 * v6);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v8 = [v7 widgetDescriptors];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
        id v26 = v5;
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = 0;
          id v27 = 0;
          int v12 = 0;
          uint64_t v13 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v30 != v13) {
                objc_enumerationMutation(v8);
              }
              id v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              uint64_t v16 = [(SBHAddWidgetSheetViewController *)v28 addWidgetSheetLocation];
              if ((objc_msgSend(v15, "sbh_disfavoredSizeClassesForAddWidgetSheetLocation:", v16) & v4) == 0) {
                goto LABEL_15;
              }
              if (!v11) {
                uint64_t v11 = (void *)[v7 copy];
              }
              [v11 setDisfavored:1];
              if ((objc_msgSend(v15, "sbh_favoredSizeClassesForAddWidgetSheetLocation:", v16) & v4) == 0)
              {
                id v17 = v27;
                if (!v27) {
                  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                id v27 = v17;
                [v17 addObject:v15];
              }
              else
              {
LABEL_15:
                if (!v12) {
                  int v12 = (void *)[v7 copy];
                }
                [v12 setDisfavored:0];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v10);
        }
        else
        {
          uint64_t v11 = 0;
          id v27 = 0;
          int v12 = 0;
        }

        CGFloat v18 = [v12 widgetDescriptors];
        double v19 = (void *)[v18 mutableCopy];

        [v19 removeObjectsInArray:v27];
        [v12 setWidgetDescriptors:v19];
        if (v12)
        {
          id v20 = v24;
          id v5 = v26;
          if (!v24) {
            id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          uint64_t v24 = v20;
          [v20 addObject:v12];
        }
        else
        {
          id v5 = v26;
        }
        if (v11)
        {
          if (!v5) {
            id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v5 addObject:v11];
        }

        uint64_t v6 = v25 + 1;
      }
      while (v25 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v23);
  }
  else
  {
    uint64_t v24 = 0;
  }

  [(SBHAddWidgetSheetViewController *)v28 setFavoredApplicationWidgetCollections:v24];
  [(SBHAddWidgetSheetViewController *)v28 setDisfavoredApplicationWidgetCollections:v5];
}

- (id)_otherDescriptionLabel
{
  unint64_t v2 = [(SBHAddWidgetSheetViewController *)self addWidgetSheetLocation];
  if (v2 == 2)
  {
    int v3 = @"ADD_WIDGET_SHEET_OTHER_LOCATION_LABEL_AMBIENT";
  }
  else if (v2 == 1)
  {
    int v3 = @"ADD_WIDGET_SHEET_OTHER_LOCATION_LABEL_IPAD_LOCK_SCREEN";
  }
  else if (v2)
  {
    int v3 = 0;
  }
  else
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2)
      {
LABEL_6:
        int v3 = @"ADD_WIDGET_SHEET_OTHER_LOCATION_LABEL_IPAD_HOME_SCREEN";
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v5 = [v4 userInterfaceIdiom];

      if (v5 == 1) {
        goto LABEL_6;
      }
    }
    int v3 = @"ADD_WIDGET_SHEET_OTHER_LOCATION_LABEL_IPHONE_HOME_SCREEN";
  }
LABEL_12:
  uint64_t v6 = NSString;
  id v7 = SBHBundle();
  id v8 = [v7 localizedStringForKey:@"ADD_WIDGET_SHEET_OTHER_DESCRIPTION_LABEL" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  uint64_t v9 = SBHBundle();
  uint64_t v10 = [v9 localizedStringForKey:v3 value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  uint64_t v11 = objc_msgSend(v6, "stringWithFormat:", v8, v10);

  return v11;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 indexPathsForSelectedItems];
  char v7 = [v6 containsObject:v5];

  return v7 ^ 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, a4);
  uint64_t v7 = [v6 section];
  if (v7 == [(SBHAddWidgetSheetViewController *)self _sectionIndexForSection:0])
  {
    [(SBHAddWidgetSheetViewController *)self _presentDetailSheetForGalleryCellAtIndexPath:v6];
  }
  else
  {
    uint64_t v8 = [v6 section];
    if (v8 == [(SBHAddWidgetSheetViewController *)self _sectionIndexForSection:2]
      || (uint64_t v9 = [v6 section],
          v9 == [(SBHAddWidgetSheetViewController *)self _sectionIndexForSection:1]))
    {
      unint64_t v10 = -[SBHAddWidgetSheetViewController _applicationWidgetCollectionIndexForItemIndex:](self, "_applicationWidgetCollectionIndexForItemIndex:", [v6 item]);
      uint64_t v11 = [(SBHAddWidgetSheetViewController *)self configuration];
      char v12 = [v11 applicationCellIncludesGalleryListView];

      if ((v12 & 1) == 0)
      {
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [(SBHAddWidgetSheetViewController *)self _presentGalleryCell];
        }
        else
        {
          uint64_t v16 = [(SBHAddWidgetSheetViewController *)self applicationWidgetCollectionsToUse];
          id v17 = [v16 objectAtIndex:v10];
          [(SBHAddWidgetSheetViewController *)self _presentDetailSheetViewControllerForApplicationWidgetCollection:v17];
        }
      }
    }
    else
    {
      uint64_t v13 = [v6 section];
      if (v13 == [(SBHAddWidgetSheetViewController *)self _sectionIndexForSection:3])
      {
        uint64_t v14 = [v6 item];
        uint64_t v15 = v14 - 2;
        if (v14 >= 2)
        {
          CGFloat v18 = [(NSArray *)self->_disfavoredApplicationWidgetCollections objectAtIndex:v15];
          [(SBHAddWidgetSheetViewController *)self _presentDetailSheetViewControllerForApplicationWidgetCollection:v18];
        }
        else
        {
          [(SBHAddWidgetSheetViewController *)self _toggleShowingDisfavoredApplicationWidgetCollections];
          [v19 deselectItemAtIndexPath:v6 animated:1];
        }
      }
    }
  }
}

- (void)_presentGalleryCell
{
  int v3 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v3 galleryViewControllerForAddWidgetSheetViewController:self],
        (uint64_t v16 = (SBHAddWidgetSheetViewController *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v4 = [SBHAddWidgetSheetViewController alloc];
    id v5 = [(SBHAddWidgetSheetViewControllerBase *)self listLayoutProvider];
    id v6 = [(SBHAddWidgetSheetViewControllerBase *)self iconViewProvider];
    uint64_t v7 = [(SBHAddWidgetSheetViewControllerBase *)self allowedWidgets];
    uint64_t v9 = v8;
    unint64_t v10 = [(SBHAddWidgetSheetViewControllerBase *)self appCellConfigurator];
    uint64_t v16 = -[SBHAddWidgetSheetViewController initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:](v4, "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:", v5, v6, v7, v9, v10, [(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle]);

    [(SBHAddWidgetSheetViewController *)v16 setAddWidgetSheetLocation:[(SBHAddWidgetSheetViewController *)self addWidgetSheetLocation]];
    [(SBHAddWidgetSheetViewControllerBase *)v16 setAddWidgetSheetWidgetBackgroundType:[(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetWidgetBackgroundType]];
    [(SBHAddWidgetSheetViewControllerBase *)v16 setAllowsFakeWidgets:[(SBHAddWidgetSheetViewControllerBase *)self allowsFakeWidgets]];
    [(SBHAddWidgetSheetViewController *)v16 setShouldShowGalleryOnly:1];
    [(SBHAddWidgetSheetViewControllerBase *)v16 setExternalBackgroundView:self->_backgroundView];
    [(SBHAddWidgetSheetViewController *)v16 setApplicationWidgetCollections:self->_favoredApplicationWidgetCollections];
    [(SBHAddWidgetSheetViewControllerBase *)v16 setDelegate:self];
    uint64_t v11 = [(SBHAddWidgetSheetViewController *)self _suggestedItems];
    [(SBHAddWidgetSheetViewController *)v16 setSuggestedItems:v11 forGalleryLayoutSize:self->_galleryLayoutSize];

    char v12 = [(SBHAddWidgetSheetViewController *)self externalSearchController];
    [(SBHAddWidgetSheetViewController *)v16 setExternalSearchController:v12];

    uint64_t v13 = [(SBHAddWidgetSheetViewController *)v16 view];
    uint64_t v14 = [MEMORY[0x1E4FB1618] clearColor];
    [v13 setBackgroundColor:v14];

    uint64_t v15 = [(SBHAddWidgetSheetViewController *)v16 navigationController];
    [v15 setNavigationBarHidden:1];

    [(SBHAddWidgetSheetViewController *)v16 setGalleryLayoutSize:self->_galleryLayoutSize];
  }
  [(SBHAddWidgetSheetViewController *)self _presentDetailViewController:v16 fromCell:0];
}

- (void)_toggleShowingDisfavoredApplicationWidgetCollections
{
  self->_isShowingDisfavoredApplicationWidgetCollections ^= 1u;
  BOOL v3 = [(SBHAddWidgetSheetViewController *)self _shouldAnimateChanges];
  [(SBHAddWidgetSheetViewController *)self _refreshData:v3];
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
}

- (void)_collectionView:(id)a3 updateSeparatorVisibility:(BOOL)a4 forHighlightAtIndexPath:(id)a5
{
  BOOL v6 = a4;
  id v14 = a3;
  id v7 = a5;
  objc_opt_class();
  uint64_t v8 = [v14 cellForItemAtIndexPath:v7];
  uint64_t v9 = SBFSafeCast();

  [v9 setSeparatorVisible:v6];
  unint64_t v10 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v7, "row") - 1, objc_msgSend(v7, "section"));
  uint64_t v11 = [v7 row];

  if ((v11 & 0x8000000000000000) == 0)
  {
    objc_opt_class();
    char v12 = [v14 cellForItemAtIndexPath:v10];
    uint64_t v13 = SBFSafeCast();

    [v13 setSeparatorVisible:v6];
  }
}

- (void)_presentDetailSheetViewControllerForApplicationWidgetCollection:(id)a3
{
}

- (void)_presentDetailSheetViewControllerForApplicationWidgetCollection:(id)a3 configuredWithGalleryItem:(id)a4 selectedSizeClass:(int64_t)a5 fromCell:(id)a6 atIndexPath:(id)a7
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = [v9 widgetDescriptors];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([(SBHAddWidgetSheetViewController *)v13 addWidgetSheetViewController:self detailViewControllerForWidgetCollection:v9], (id v14 = (SBHAddWidgetDetailSheetViewController *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      unint64_t v15 = [(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle];
      uint64_t v16 = [SBHAddWidgetDetailSheetViewController alloc];
      id v17 = [(SBHAddWidgetSheetViewControllerBase *)self listLayoutProvider];
      CGFloat v18 = [(SBHAddWidgetSheetViewControllerBase *)self iconViewProvider];
      uint64_t v19 = [(SBHAddWidgetSheetViewControllerBase *)self allowedWidgets];
      uint64_t v21 = v20;
      [(SBHAddWidgetSheetViewControllerBase *)self appCellConfigurator];
      uint64_t v22 = v28 = v10;
      id v14 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:](v16, "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:", v17, v18, v19, v21, v22, v15);

      [(SBHAddWidgetSheetViewController *)self _metricsForCurrentOrientation];
      [(SBHAddWidgetSheetViewControllerBase *)v14 setAddWidgetSheetMetrics:v29];
      if (v15 == 1) {
        uint64_t v23 = v13;
      }
      else {
        uint64_t v23 = self;
      }
      [(SBHAddWidgetSheetViewControllerBase *)v14 setDelegate:v23];
      [(SBHAddWidgetDetailSheetViewController *)v14 setApplicationWidgetCollection:v9];
      [(SBHAddWidgetSheetViewControllerBase *)v14 setAddWidgetSheetLocation:[(SBHAddWidgetSheetViewController *)self addWidgetSheetLocation]];
      uint64_t v24 = [(SBHAddWidgetSheetViewControllerBase *)self externalBackgroundView];
      [(SBHAddWidgetSheetViewControllerBase *)v14 setExternalBackgroundView:v24];

      [(SBHAddWidgetDetailSheetViewController *)v14 setExternalSearchController:self->_externalSearchController];
      uint64_t v25 = [(SBHAddWidgetSheetViewController *)self presenter];
      [(SBHAddWidgetDetailSheetViewController *)v14 setPresenter:v25];

      id v10 = v28;
      [(SBHAddWidgetSheetViewControllerBase *)v14 setAddWidgetSheetWidgetBackgroundType:[(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetWidgetBackgroundType]];
    }
    [(SBHAddWidgetSheetViewController *)self _presentDetailViewController:v14 fromCell:v10];
  }
  else
  {
    id v26 = SBLogAddWidgetSheet();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[SBHAddWidgetSheetViewController _presentDetailSheetViewControllerForApplicationWidgetCollection:configuredWithGalleryItem:selectedSizeClass:fromCell:atIndexPath:]((uint64_t)v9, v26);
    }

    collectionView = self->_collectionView;
    id v14 = [(_SBHAddWidgetSheetCollectionView *)collectionView indexPathsForSelectedItems];
    uint64_t v13 = [(SBHAddWidgetDetailSheetViewController *)v14 firstObject];
    [(_SBHAddWidgetSheetCollectionView *)collectionView deselectItemAtIndexPath:v13 animated:1];
  }
}

- (void)_presentDetailViewController:(id)a3 fromCell:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] == 1)
  {
    uint64_t v8 = [(SBHAddWidgetSheetViewController *)self splitViewController];
    id v9 = [v8 viewControllerForColumn:2];
    uint64_t v10 = objc_opt_class();
    id v11 = v9;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    id v23 = v12;

    if (v23 || ([v11 navigationController], (id v23 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v31[0] = v6;
      uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
      [v23 setViewControllers:v24];
    }
    else
    {
      id v23 = (id)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
      [v23 setNavigationBarHidden:1];
      [(SBHAddWidgetSheetViewController *)self showDetailViewController:v23 sender:self];
    }

    if (v7)
    {
      uint64_t v25 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v27 = [v7 widgetWrapperViewController];
        id v28 = [v27 galleryItem];
        long long v29 = [v7 widgetWrapperViewController];
        objc_msgSend(v6, "configureForGalleryItem:selectedSizeClass:", v28, objc_msgSend(v29, "selectedSizeClass"));
      }
    }
    long long v30 = [(SBHAddWidgetSheetViewController *)self _effectiveSearchController];
    uint64_t v19 = [v30 searchBar];

    [v19 resignFirstResponder];
    goto LABEL_24;
  }
  [v6 setModalPresentationStyle:2];
  [(SBHAddWidgetSheetViewController *)self preferredContentSize];
  objc_msgSend(v6, "setPreferredContentSize:");
  if (v7)
  {
    uint64_t v13 = [[SBHWidgetAddSheetTransitionContext alloc] initWithSourceCell:v7];
    [v6 setTransitioningDelegate:v13];
    [(SBHAddWidgetSheetViewController *)self setTransitionContext:v13];
  }
  uint64_t v8 = [(SBHAddWidgetSheetViewController *)self sheetPresentationController];
  id v11 = [v6 sheetPresentationController];
  [v11 _setShouldDismissWhenTappedOutside:1];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v14 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v15 = [v14 userInterfaceIdiom];

  if (v15 != 1)
  {
LABEL_12:
    [v11 setPrefersGrabberVisible:1];
    [v8 _additionalMinimumTopInset];
    objc_msgSend(v11, "_setAdditionalMinimumTopInset:");
    [v8 _grabberTopSpacing];
    objc_msgSend(v11, "_setGrabberTopSpacing:");
  }
LABEL_13:
  [v8 preferredCornerRadius];
  objc_msgSend(v11, "setPreferredCornerRadius:");
  [v11 setDelegate:self];
  uint64_t v16 = [(SBHAddWidgetSheetViewController *)self view];
  [v11 setSourceView:v16];

  id v17 = [(SBHAddWidgetSheetViewController *)self traitCollection];
  CGFloat v18 = self;
  uint64_t v19 = [v17 objectForTrait:v18];

  if (v19)
  {
    uint64_t v20 = [v6 traitOverrides];
    uint64_t v21 = self;
    [v20 setObject:v19 forTrait:v21];
  }
  uint64_t v22 = [(SBHAddWidgetSheetViewController *)self _currentPresenter];
  [v22 presentViewController:v6 animated:1 completion:0];

LABEL_24:
}

- (void)_clearDetailViewController
{
  v13[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBHAddWidgetSheetViewController *)self splitViewController];
  uint64_t v4 = [v3 viewControllerForColumn:2];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  uint64_t v10 = v9;
  if (v8)
  {
    v13[0] = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v8 setViewControllers:v11];
  }
  else
  {
    [(SBHAddWidgetSheetViewController *)self showDetailViewController:v9 sender:self];
  }
  uint64_t v12 = [v10 navigationController];
  [v12 setNavigationBarHidden:1];
}

- (void)_presentDetailSheetForGalleryCellAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_SBHAddWidgetSheetCollectionView *)self->_collectionView cellForItemAtIndexPath:v4];
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

  if (v7)
  {
    uint64_t v10 = [v9 widgetWrapperViewController];
    id v11 = [v10 galleryItem];
    p_favoredApplicationWidgetCollections = &self->_favoredApplicationWidgetCollections;
    favoredApplicationWidgetCollections = self->_favoredApplicationWidgetCollections;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __80__SBHAddWidgetSheetViewController__presentDetailSheetForGalleryCellAtIndexPath___block_invoke;
    v29[3] = &unk_1E6AAE9B8;
    id v14 = v11;
    id v30 = v14;
    uint64_t v15 = [(NSArray *)favoredApplicationWidgetCollections indexOfObjectPassingTest:v29];
    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_17;
    }
    uint64_t v16 = v15;
    id v17 = [(NSArray *)*p_favoredApplicationWidgetCollections objectAtIndex:v15];
    if ([(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] == 1)
    {
      id v28 = v14;
      id v27 = [(SBHAddWidgetSheetViewController *)self parentViewController];
      CGFloat v18 = [v27 parentViewController];
      uint64_t v19 = objc_opt_class();
      id v20 = v18;
      if (v19)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v21 = v20;
        }
        else {
          uint64_t v21 = 0;
        }
      }
      else
      {
        uint64_t v21 = 0;
      }
      id v22 = v21;

      id v23 = [v22 viewControllerForColumn:0];

      uint64_t v24 = [v23 collectionView];
      uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v23, "_itemIndexForApplicationWidgetCollectionIndex:", v16), 0);
      [v24 selectItemAtIndexPath:v25 animated:1 scrollPosition:2];

      p_favoredApplicationWidgetCollections = &self->_favoredApplicationWidgetCollections;
      id v14 = v28;
    }
    if (!v17)
    {
LABEL_17:
      id v17 = SBLogAddWidgetSheet();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        [(SBHAddWidgetSheetViewController *)(uint64_t)v10 _presentDetailSheetForGalleryCellAtIndexPath:v17];
      }
    }
    else
    {
      id v26 = [v10 galleryItem];
      -[SBHAddWidgetSheetViewController _presentDetailSheetViewControllerForApplicationWidgetCollection:configuredWithGalleryItem:selectedSizeClass:fromCell:atIndexPath:](self, "_presentDetailSheetViewControllerForApplicationWidgetCollection:configuredWithGalleryItem:selectedSizeClass:fromCell:atIndexPath:", v17, v26, [v10 selectedSizeClass], v9, v4);
    }
  }
}

uint64_t __80__SBHAddWidgetSheetViewController__presentDetailSheetForGalleryCellAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsWidgetDescriptorMatchingDescriptor:*(void *)(a1 + 32)];
}

- (id)_currentPresenter
{
  BOOL v3 = [(SBHAddWidgetSheetViewController *)self searchController];
  id v4 = [v3 presentingViewController];
  if (v4 == self)
  {
    uint64_t v5 = [(SBHAddWidgetSheetViewController *)self searchController];
  }
  else
  {
    uint64_t v5 = self;
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)_presentedGalleryViewController
{
  unint64_t v2 = [(SBHAddWidgetSheetViewController *)self splitViewController];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = [v2 viewControllerForColumn:2];
    uint64_t v5 = objc_opt_class();
    id v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    id v8 = v7;

    if (!v8)
    {
      uint64_t v9 = objc_opt_class();
      id v10 = v6;
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

      uint64_t v13 = [v12 topViewController];

      uint64_t v14 = objc_opt_class();
      id v15 = v13;
      if (v14)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v16 = v15;
        }
        else {
          uint64_t v16 = 0;
        }
      }
      else
      {
        uint64_t v16 = 0;
      }
      id v8 = v16;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSMutableDictionary)userInfo
{
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (void)didDismissSearchController:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_filteredApplicationWidgetCollections;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9++), "setFilteredWidgetDescriptors:", v8, (void)v14);
      }
      while (v6 != v9);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  filteredApplicationWidgetCollections = self->_filteredApplicationWidgetCollections;
  self->_filteredApplicationWidgetCollections = 0;

  id v11 = [(SBHAddWidgetSheetViewController *)self view];
  [v11 bringSubviewToFront:self->_closeButton];

  [(SBHAddWidgetSheetViewController *)self _reloadData];
  if ([(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] == 1
    && ![(SBHAddWidgetSheetViewController *)self shouldShowGalleryOnly])
  {
    [(SBHAddWidgetSheetViewController *)self _selectFirstItem];
    [(SBHAddWidgetSheetViewController *)self _presentGalleryCell];
    id v12 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:2];
    lastSelectedIndexPath = self->_lastSelectedIndexPath;
    self->_lastSelectedIndexPath = v12;
  }
}

- (void)willPresentSearchController:(id)a3
{
  if ([(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] == 1)
  {
    [(SBHAddWidgetSheetViewController *)self _clearDetailViewController];
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBHAddWidgetSheetViewController *)self _searchTextForSearchController:a3];
  uint64_t v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v23 = v4;
  uint64_t v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __74__SBHAddWidgetSheetViewController_updateSearchResultsForSearchController___block_invoke;
        v29[3] = &unk_1E6AAEA08;
        void v29[4] = v12;
        v29[5] = self;
        uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:v29];
        [v7 addObject:v13];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v9);
  }

  long long v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v7];
  if ([v4 isEqualToString:&stru_1F2FA0300])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v15 = self->_filteredApplicationWidgetCollections;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      uint64_t v19 = MEMORY[0x1E4F1CBF0];
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * j) setFilteredWidgetDescriptors:v19];
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v17);
    }

    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = [(NSArray *)self->_favoredApplicationWidgetCollections filteredArrayUsingPredicate:v14];
  }
  filteredApplicationWidgetCollections = self->_filteredApplicationWidgetCollections;
  self->_filteredApplicationWidgetCollections = v21;

  [(SBHAddWidgetSheetViewController *)self _reloadData];
  if ([(SBHAddWidgetSheetViewController *)self _canShowContentUnavailableConfiguration])
  {
    [(SBHAddWidgetSheetViewController *)self setNeedsUpdateContentUnavailableConfiguration];
  }
}

BOOL __74__SBHAddWidgetSheetViewController_updateSearchResultsForSearchController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 displayName];
  uint64_t v5 = v4;
  if (v4 && ([v4 rangeOfString:*(void *)(a1 + 32) options:129], v6))
  {
    [v3 setFilteredWidgetDescriptors:MEMORY[0x1E4F1CBF0]];
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 40) configuration];
    char v9 = [v8 applicationCellIncludesGalleryListView];

    if (v9)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __74__SBHAddWidgetSheetViewController_updateSearchResultsForSearchController___block_invoke_2;
      v14[3] = &unk_1E6AAE9E0;
      void v14[4] = *(void *)(a1 + 32);
      uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:v14];
      id v11 = [v3 widgetDescriptors];
      uint64_t v12 = [v11 filteredArrayUsingPredicate:v10];

      [v3 setFilteredWidgetDescriptors:v12];
      BOOL v7 = [v12 count] != 0;
    }
    else
    {
      [v3 setFilteredWidgetDescriptors:MEMORY[0x1E4F1CBF0]];
      BOOL v7 = 0;
    }
  }

  return v7;
}

BOOL __74__SBHAddWidgetSheetViewController_updateSearchResultsForSearchController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "sbh_widgetName");
  id v4 = v3;
  if (v3)
  {
    [v3 rangeOfString:*(void *)(a1 + 32) options:129];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_searchTextForSearchController:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  uint64_t v5 = [v3 whitespaceCharacterSet];
  BOOL v6 = [v4 searchBar];

  BOOL v7 = [v6 text];
  uint64_t v8 = [v7 stringByTrimmingCharactersInSet:v5];

  return v8;
}

- (BOOL)_isSearchVisible
{
  return self->_filteredApplicationWidgetCollections != 0;
}

- (id)contentUnavailableConfigurationState
{
  v7.receiver = self;
  v7.super_class = (Class)SBHAddWidgetSheetViewController;
  id v3 = [(SBHAddWidgetSheetViewController *)&v7 contentUnavailableConfigurationState];
  id v4 = [(SBHAddWidgetSheetViewController *)self _effectiveSearchController];
  uint64_t v5 = [(SBHAddWidgetSheetViewController *)self _searchTextForSearchController:v4];
  [v3 setSearchText:v5];

  return v3;
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v5 = a3;
  if ([(SBHAddWidgetSheetViewController *)self _canShowContentUnavailableConfiguration])
  {
    id v4 = [(SBHAddWidgetSheetViewController *)self _updatedContentUnavailableConfigurationUsingState:v5];
  }
  else
  {
    id v4 = 0;
  }
  [(SBHAddWidgetSheetViewController *)self setContentUnavailableConfiguration:v4];
}

- (id)_updatedContentUnavailableConfigurationUsingState:(id)a3
{
  id v4 = a3;
  id v5 = [v4 searchText];
  if ([v5 length])
  {
    NSUInteger v6 = [(NSArray *)self->_filteredApplicationWidgetCollections count];

    if (v6)
    {
      objc_super v7 = 0;
      goto LABEL_7;
    }
    id v5 = [MEMORY[0x1E4FB1658] searchConfiguration];
    objc_super v7 = [v5 updatedConfigurationForState:v4];
  }
  else
  {
    objc_super v7 = 0;
  }

LABEL_7:
  return v7;
}

- (BOOL)_canShowContentUnavailableConfiguration
{
  return [(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] == 0;
}

- (SBHWidgetDragHandling)widgetDragHandler
{
  unint64_t v2 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  id v3 = [v2 widgetDragHandler];

  return (SBHWidgetDragHandling *)v3;
}

- (id)backgroundViewMatchingMaterialBeneathWrapperViewController:(id)a3
{
  return [(SBHAddWidgetSheetViewController *)self backgroundViewMatchingMaterialBeneathAddWidgetSheetViewController:self];
}

- (void)presentationControllerWillDismiss:(id)a3
{
  collectionView = self->_collectionView;
  id v5 = [(_SBHAddWidgetSheetCollectionView *)collectionView indexPathsForSelectedItems];
  NSUInteger v6 = [v5 firstObject];
  [(_SBHAddWidgetSheetCollectionView *)collectionView deselectItemAtIndexPath:v6 animated:1];

  [(SBHWidgetAddSheetTransitionContext *)self->_transitionContext interruptAnimation];
  [(SBHAddWidgetSheetViewController *)self setTransitionContext:0];
}

- (void)addWidgetSheetViewControllerDidCancel:(id)a3
{
  id v4 = [(SBHAddWidgetSheetViewController *)self _currentPresenter];
  [v4 dismissViewControllerAnimated:1 completion:0];

  collectionView = self->_collectionView;
  NSUInteger v6 = [(_SBHAddWidgetSheetCollectionView *)collectionView indexPathsForSelectedItems];
  objc_super v7 = [v6 firstObject];
  [(_SBHAddWidgetSheetCollectionView *)collectionView deselectItemAtIndexPath:v7 animated:1];

  [(SBHWidgetAddSheetTransitionContext *)self->_transitionContext interruptAnimation];
  [(SBHAddWidgetSheetViewController *)self setTransitionContext:0];
}

- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
  id v6 = a4;
  id v5 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 addWidgetSheetViewController:self didSelectWidgetIconView:v6];
  }
}

- (id)backgroundViewMatchingMaterialBeneathAddWidgetSheetViewController:(id)a3
{
  id v3 = [(SBHAddWidgetSheetViewController *)self _newBackgroundView];
  return v3;
}

- (void)_makeGalleryItemsFromHomeScreenItems:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(SBHAddWidgetSheetViewControllerBase *)self allowedWidgets];
  char v63 = v5;
  [(SBHAddWidgetSheetViewControllerBase *)self allowedWidgets];
  __int16 v62 = v6;
  [(SBHAddWidgetSheetViewControllerBase *)self allowedWidgets];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v86 objects:v94 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v87;
    id v60 = v7;
    v61 = self;
    uint64_t v59 = *(void *)v87;
    do
    {
      uint64_t v11 = 0;
      uint64_t v64 = v9;
      do
      {
        if (*(void *)v87 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v86 + 1) + 8 * v11) suggestedSize];
        char v13 = 1;
        uint64_t v14 = 1;
        switch(v12)
        {
          case 0:
            break;
          case 1:
            char v13 = 1;
            uint64_t v14 = 2;
            break;
          case 2:
            char v13 = 1;
            uint64_t v14 = 3;
            break;
          case 3:
            char v13 = 1;
            uint64_t v14 = 6;
            break;
          case 4:
            char v13 = 1;
            uint64_t v14 = 4;
            break;
          default:
            char v13 = 0;
            uint64_t v14 = 0;
            break;
        }
        char v69 = v13;
        if (CHSWidgetFamilyMaskContainsFamily())
        {
          uint64_t v65 = v14;
          uint64_t v67 = v11;
          objc_opt_class();
          v68 = SBFSafeCast();
          long long v15 = [v68 widgetKind];
          int v16 = [v15 containsString:@"SBHSpecialAvocadoDescriptor"];

          if ([(SBHAddWidgetSheetViewControllerBase *)self allowsFakeWidgets] || !v16)
          {
            objc_opt_class();
            uint64_t v17 = SBFSafeCast();
            v66 = v17;
            if (v68 || !v17)
            {
              if (v68)
              {
                uint64_t v18 = [v68 avocadoDescriptor];
                v50 = [v18 sanitizedDescriptor];
                goto LABEL_56;
              }
              v50 = 0;
            }
            else
            {
              uint64_t v18 = objc_opt_new();
              long long v82 = 0u;
              long long v83 = 0u;
              long long v84 = 0u;
              long long v85 = 0u;
              uint64_t v19 = [v17 smallDefaultStack];
              uint64_t v20 = [v19 countByEnumeratingWithState:&v82 objects:v93 count:16];
              if (v20)
              {
                uint64_t v21 = v20;
                uint64_t v22 = *(void *)v83;
                do
                {
                  for (uint64_t i = 0; i != v21; ++i)
                  {
                    if (*(void *)v83 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v24 = [*(id *)(*((void *)&v82 + 1) + 8 * i) avocadoDescriptor];
                    long long v25 = [v24 sanitizedDescriptor];

                    if (v25) {
                      [v18 addObject:v25];
                    }
                  }
                  uint64_t v21 = [v19 countByEnumeratingWithState:&v82 objects:v93 count:16];
                }
                while (v21);
              }

              long long v26 = objc_opt_new();
              long long v78 = 0u;
              long long v79 = 0u;
              long long v80 = 0u;
              long long v81 = 0u;
              long long v27 = [v66 mediumDefaultStack];
              uint64_t v28 = [v27 countByEnumeratingWithState:&v78 objects:v92 count:16];
              if (v28)
              {
                uint64_t v29 = v28;
                uint64_t v30 = *(void *)v79;
                do
                {
                  for (uint64_t j = 0; j != v29; ++j)
                  {
                    if (*(void *)v79 != v30) {
                      objc_enumerationMutation(v27);
                    }
                    long long v32 = [*(id *)(*((void *)&v78 + 1) + 8 * j) avocadoDescriptor];
                    long long v33 = [v32 sanitizedDescriptor];

                    if (v33) {
                      [v26 addObject:v33];
                    }
                  }
                  uint64_t v29 = [v27 countByEnumeratingWithState:&v78 objects:v92 count:16];
                }
                while (v29);
              }

              long long v34 = objc_opt_new();
              long long v74 = 0u;
              long long v75 = 0u;
              long long v76 = 0u;
              long long v77 = 0u;
              long long v35 = [v66 largeDefaultStack];
              uint64_t v36 = [v35 countByEnumeratingWithState:&v74 objects:v91 count:16];
              if (v36)
              {
                uint64_t v37 = v36;
                uint64_t v38 = *(void *)v75;
                do
                {
                  for (uint64_t k = 0; k != v37; ++k)
                  {
                    if (*(void *)v75 != v38) {
                      objc_enumerationMutation(v35);
                    }
                    v40 = [*(id *)(*((void *)&v74 + 1) + 8 * k) avocadoDescriptor];
                    uint64_t v41 = [v40 sanitizedDescriptor];

                    if (v41) {
                      [v34 addObject:v41];
                    }
                  }
                  uint64_t v37 = [v35 countByEnumeratingWithState:&v74 objects:v91 count:16];
                }
                while (v37);
              }

              v42 = objc_opt_new();
              long long v70 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              uint64_t v43 = [v66 extraLargeDefaultStack];
              uint64_t v44 = [v43 countByEnumeratingWithState:&v70 objects:v90 count:16];
              if (v44)
              {
                uint64_t v45 = v44;
                uint64_t v46 = *(void *)v71;
                do
                {
                  for (uint64_t m = 0; m != v45; ++m)
                  {
                    if (*(void *)v71 != v46) {
                      objc_enumerationMutation(v43);
                    }
                    v48 = [*(id *)(*((void *)&v70 + 1) + 8 * m) avocadoDescriptor];
                    id v49 = [v48 sanitizedDescriptor];

                    if (v49) {
                      [v42 addObject:v49];
                    }
                  }
                  uint64_t v45 = [v43 countByEnumeratingWithState:&v70 objects:v90 count:16];
                }
                while (v45);
              }

              v50 = [[SBHWidgetStackDescriptor alloc] initWithSmallStackDescriptors:v18 mediumStackDescriptors:v26 largeStackDescriptors:v34 extraLargeStackDescriptors:v42];
              id v7 = v60;
              self = v61;
              uint64_t v10 = v59;
              uint64_t v9 = v64;
LABEL_56:
            }
            int v51 = (CHSWidgetFamilyIsAccessory() & 1) != 0
               || [(SBHWidgetStackDescriptor *)v50 sbh_supportsRemovableBackground];
            char v52 = v69 ^ 1;
            if (!v50) {
              char v52 = 1;
            }
            if ((v52 & 1) == 0)
            {
              if ((v63 & 1) == 0)
              {
                BOOL v53 = [(SBHWidgetStackDescriptor *)v50 sbh_canBeAddedToStack];
                if ((v62 & 0x100) != 0) {
                  char v54 = v51;
                }
                else {
                  char v54 = 1;
                }
                if (!v53 || (v54 & 1) == 0) {
                  goto LABEL_75;
                }
LABEL_74:
                id v56 = [(SBHAddWidgetSheetViewController *)self _newWrapperViewControllerWithGalleryItem:v50 sizeClass:v65];
                [v58 addObject:v56];

                goto LABEL_75;
              }
              if ((v62 & 0x100) != 0) {
                int v55 = v51;
              }
              else {
                int v55 = 1;
              }
              if (v55 == 1) {
                goto LABEL_74;
              }
            }
LABEL_75:
          }
          uint64_t v11 = v67;
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v57 = [v7 countByEnumeratingWithState:&v86 objects:v94 count:16];
      uint64_t v9 = v57;
    }
    while (v57);
  }

  [(SBHAddWidgetSheetViewController *)self setGalleryItems:v58];
}

- (void)_makeFakeGalleryItemsFromHomeScreenItems:(id)a3
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(SBHAddWidgetSheetViewControllerBase *)self allowedWidgets];
  char v7 = v6;
  [(SBHAddWidgetSheetViewControllerBase *)self allowedWidgets];
  __int16 v92 = v8;
  uint64_t v9 = [(SBHAddWidgetSheetViewControllerBase *)self allowedWidgets];
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v114 objects:v123 count:16];
  long long v79 = v10;
  if (!v11)
  {
    v90 = 0;
    v91 = 0;
    long long v89 = 0;
    id v93 = 0;
    goto LABEL_88;
  }
  uint64_t v12 = v11;
  v90 = 0;
  v91 = 0;
  long long v89 = 0;
  id v93 = 0;
  uint64_t v13 = *(void *)v115;
  char v80 = v7;
  long long v77 = self;
  id v78 = v5;
  uint64_t v75 = *(void *)v115;
  uint64_t v76 = v9;
  do
  {
    uint64_t v14 = 0;
    uint64_t v82 = v12;
    do
    {
      if (*(void *)v115 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v114 + 1) + 8 * v14), "suggestedSize", v75, v76, v77, v78);
      int v16 = 0;
      int v17 = 1;
      int v18 = 1;
      char v19 = 1;
      switch(v15)
      {
        case 0:
          break;
        case 1:
          int v17 = 0;
          int v16 = 1;
          break;
        case 2:
          int v18 = 0;
          int v16 = 1;
          int v17 = 1;
          break;
        case 3:
          int v16 = 1;
          int v17 = 1;
          break;
        case 4:
          char v19 = 0;
          int v16 = 1;
          int v17 = 1;
          break;
        default:
          int v16 = 1;
          int v17 = 1;
          int v18 = 1;
          char v19 = 1;
          break;
      }
      char v84 = v19;
      int v85 = v18;
      int v86 = v17;
      int v87 = v16;
      if (!CHSWidgetFamilyMaskContainsFamily()) {
        goto LABEL_84;
      }
      objc_opt_class();
      uint64_t v20 = SBFSafeCast();
      objc_opt_class();
      uint64_t v21 = v20;
      uint64_t v22 = SBFSafeCast();
      if (v22) {
        BOOL v23 = v20 == 0;
      }
      else {
        BOOL v23 = 0;
      }
      uint64_t v83 = v14;
      long long v88 = (void *)v22;
      if (v23)
      {
        long long v81 = v20;
        long long v26 = (void *)v22;
        uint64_t v24 = objc_opt_new();
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        long long v27 = [v26 smallDefaultStack];
        uint64_t v28 = [v27 countByEnumeratingWithState:&v110 objects:v122 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v111;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v111 != v30) {
                objc_enumerationMutation(v27);
              }
              long long v32 = [*(id *)(*((void *)&v110 + 1) + 8 * i) avocadoDescriptor];
              long long v33 = [v32 sanitizedDescriptor];

              if (v33) {
                [v24 addObject:v33];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v110 objects:v122 count:16];
          }
          while (v29);
        }

        long long v34 = objc_opt_new();
        long long v106 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v35 = [v88 mediumDefaultStack];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v106 objects:v121 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v107;
          do
          {
            for (uint64_t j = 0; j != v37; ++j)
            {
              if (*(void *)v107 != v38) {
                objc_enumerationMutation(v35);
              }
              v40 = [*(id *)(*((void *)&v106 + 1) + 8 * j) avocadoDescriptor];
              uint64_t v41 = [v40 sanitizedDescriptor];

              if (v41) {
                [v34 addObject:v41];
              }
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v106 objects:v121 count:16];
          }
          while (v37);
        }

        v42 = objc_opt_new();
        long long v102 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        uint64_t v43 = [v88 largeDefaultStack];
        uint64_t v44 = [v43 countByEnumeratingWithState:&v102 objects:v120 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v103;
          do
          {
            for (uint64_t k = 0; k != v45; ++k)
            {
              if (*(void *)v103 != v46) {
                objc_enumerationMutation(v43);
              }
              v48 = [*(id *)(*((void *)&v102 + 1) + 8 * k) avocadoDescriptor];
              id v49 = [v48 sanitizedDescriptor];

              if (v49) {
                [v42 addObject:v49];
              }
            }
            uint64_t v45 = [v43 countByEnumeratingWithState:&v102 objects:v120 count:16];
          }
          while (v45);
        }

        v50 = objc_opt_new();
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        int v51 = [v88 extraLargeDefaultStack];
        uint64_t v52 = [v51 countByEnumeratingWithState:&v98 objects:v119 count:16];
        if (v52)
        {
          uint64_t v53 = v52;
          uint64_t v54 = *(void *)v99;
          do
          {
            for (uint64_t m = 0; m != v53; ++m)
            {
              if (*(void *)v99 != v54) {
                objc_enumerationMutation(v51);
              }
              id v56 = [*(id *)(*((void *)&v98 + 1) + 8 * m) avocadoDescriptor];
              uint64_t v57 = [v56 sanitizedDescriptor];

              if (v57) {
                [v50 addObject:v57];
              }
            }
            uint64_t v53 = [v51 countByEnumeratingWithState:&v98 objects:v119 count:16];
          }
          while (v53);
        }

        long long v25 = [[SBHWidgetStackDescriptor alloc] initWithSmallStackDescriptors:v24 mediumStackDescriptors:v34 largeStackDescriptors:v42 extraLargeStackDescriptors:v50];
        self = v77;
        id v5 = v78;
        id v10 = v79;
        uint64_t v13 = v75;
        uint64_t v21 = v81;
        goto LABEL_56;
      }
      if (v20)
      {
        uint64_t v24 = [v20 avocadoDescriptor];
        long long v25 = [v24 sanitizedDescriptor];
LABEL_56:

        char v7 = v80;
        goto LABEL_57;
      }
      long long v25 = 0;
LABEL_57:
      int v58 = v87;
      if (v93) {
        int v58 = 1;
      }
      if (v58 != 1)
      {
        id v93 = v25;
LABEL_77:
        __int16 v62 = v91;
LABEL_78:
        char v63 = v25;
        v91 = v62;
        goto LABEL_79;
      }
      if (v90) {
        int v59 = 1;
      }
      else {
        int v59 = v86;
      }
      if (v59 != 1)
      {
        v90 = v25;
        goto LABEL_77;
      }
      if (v89) {
        int v60 = 1;
      }
      else {
        int v60 = v85;
      }
      if (v60 != 1)
      {
        long long v89 = v25;
        goto LABEL_77;
      }
      if (v91) {
        char v61 = 1;
      }
      else {
        char v61 = v84;
      }
      __int16 v62 = v25;
      if ((v61 & 1) == 0) {
        goto LABEL_78;
      }
LABEL_79:

      if (v93)
      {
        uint64_t v12 = v82;
        uint64_t v14 = v83;
        if (v90 && v89) {
          goto LABEL_88;
        }
      }
      else
      {
        uint64_t v12 = v82;
        uint64_t v14 = v83;
      }
LABEL_84:
      ++v14;
    }
    while (v14 != v12);
    uint64_t v12 = [v10 countByEnumeratingWithState:&v114 objects:v123 count:16];
  }
  while (v12);
LABEL_88:

  unint64_t galleryLayoutSize = self->_galleryLayoutSize;
  if (galleryLayoutSize > 4) {
    uint64_t v65 = &unk_1F300F180;
  }
  else {
    uint64_t v65 = (void *)qword_1E6AAEB20[galleryLayoutSize];
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v66 = [v65 countByEnumeratingWithState:&v94 objects:v118 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v95;
    do
    {
      for (uint64_t n = 0; n != v67; ++n)
      {
        if (*(void *)v95 != v68) {
          objc_enumerationMutation(v65);
        }
        uint64_t v70 = [*(id *)(*((void *)&v94 + 1) + 8 * n) integerValue];
        long long v71 = v93;
        switch(v70)
        {
          case 1:
            goto LABEL_100;
          case 2:
            long long v71 = v90;
            goto LABEL_100;
          case 3:
            long long v71 = v89;
            goto LABEL_100;
          case 4:
            long long v71 = v91;
LABEL_100:
            long long v72 = v71;
            long long v73 = v72;
            if (v72
              && ((v7 & 1) != 0 || [(SBHWidgetStackDescriptor *)v72 sbh_canBeAddedToStack])
              && ((v92 & 0x100) == 0
               || [(SBHWidgetStackDescriptor *)v73 sbh_supportsRemovableBackground]))
            {
              id v74 = [(SBHAddWidgetSheetViewController *)self _newWrapperViewControllerWithGalleryItem:v73 sizeClass:v70];
              [v5 addObject:v74];
            }
            break;
          default:
            long long v73 = 0;
            break;
        }
      }
      uint64_t v67 = [v65 countByEnumeratingWithState:&v94 objects:v118 count:16];
    }
    while (v67);
  }
  [(SBHAddWidgetSheetViewController *)self setGalleryItems:v5];
}

- (id)_sizeClasses
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_galleryItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "selectedSizeClass", (void)v11));
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_itemsArrayWithSizeClasses:(id)a3 nSmallsGroup:(id)a4 mediumAndSmallGroup:(id)a5 usesThreeColumnLayout:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v25 = a4;
  id v27 = a5;
  id v10 = objc_opt_new();
  uint64_t v11 = [v9 count];
  if (v11)
  {
    unint64_t v12 = v11;
    uint64_t v13 = 0;
    int v14 = 0;
    int v15 = !v6;
    if (v6) {
      int v16 = 2;
    }
    else {
      int v16 = 1;
    }
    while (1)
    {
      int v17 = objc_msgSend(v9, "objectAtIndex:", v13, v25);
      uint64_t v18 = [v17 integerValue];
      int v19 = v14 + 1;
      int v20 = SBHItemAtIndexIsOfSize(v9, v14 + 1);
      int v21 = v20;
      if (v18 != 1) {
        break;
      }
      int v23 = SBHItemAtIndexIsOfSize(v9, v14 + 2);
      id v22 = v25;
      if ((v21 & (v15 | v23)) == 1) {
        goto LABEL_10;
      }
LABEL_11:

      v14 += v16;
      uint64_t v13 = v14;
      if (v12 <= v14) {
        goto LABEL_12;
      }
    }
    if (v18 != 2) {
      goto LABEL_11;
    }
    id v22 = v27;
    int v19 = v14;
    if (((v15 | v20) & 1) == 0) {
      goto LABEL_11;
    }
LABEL_10:
    [v10 addObject:v22];
    int v14 = v19;
    goto LABEL_11;
  }
LABEL_12:
  if (!objc_msgSend(v10, "count", v25)) {
    [v10 addObject:v27];
  }

  return v10;
}

- (id)_collectionViewLayoutGallerySectionWithWidth:(double)a3 sizeClasses:(id)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  BOOL v48 = self->_galleryLayoutSize == 1;
  if (self->_galleryLayoutSize == 1) {
    unint64_t v6 = 3;
  }
  else {
    unint64_t v6 = 2;
  }
  id v47 = a4;
  int v51 = [(SBHAddWidgetSheetViewController *)self _listLayoutForWidgetSizing];
  double v7 = SBHIconListLayoutIconImageInfoForGridSizeClass(v51, @"SBHIconGridSizeClassSmall");
  double v9 = v8;
  double v10 = SBHIconListLayoutIconImageInfoForGridSizeClass(v51, @"SBHIconGridSizeClassMedium");
  double v12 = v11;
  [(SBHAddWidgetSheetViewController *)self _horizontalSpacingForListLayout:v51];
  self->_horizontalSpacing = v13;
  CGFloat v14 = (a3 - (v13 * (double)(v6 - 1) + (double)v6 * v7)) * 0.5;
  self->_contentInsets.top = 0.0;
  self->_contentInsets.double leading = v14;
  self->_contentInsets.bottouint64_t m = 0.0;
  self->_contentInsets.double trailing = v14;
  int v15 = (void *)MEMORY[0x1E4FB1338];
  int v16 = [MEMORY[0x1E4FB1308] absoluteDimension:v7];
  int v17 = [MEMORY[0x1E4FB1308] estimatedDimension:v9];
  v50 = [v15 sizeWithWidthDimension:v16 heightDimension:v17];

  uint64_t v18 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v50];
  int v19 = (void *)MEMORY[0x1E4FB1338];
  int v20 = [MEMORY[0x1E4FB1308] absoluteDimension:v10];
  int v21 = [MEMORY[0x1E4FB1308] estimatedDimension:v12];
  id v49 = [v19 sizeWithWidthDimension:v20 heightDimension:v21];

  uint64_t v45 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v49];
  id v22 = (void *)MEMORY[0x1E4FB1338];
  int v23 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  uint64_t v24 = [MEMORY[0x1E4FB1308] estimatedDimension:v9 * 0.5];
  id v25 = [v22 sizeWithWidthDimension:v23 heightDimension:v24];

  long long v26 = (void *)MEMORY[0x1E4FB1318];
  uint64_t v46 = (void *)v18;
  v53[0] = v18;
  id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  uint64_t v28 = [v26 horizontalGroupWithLayoutSize:v25 subitems:v27];

  uint64_t v29 = [MEMORY[0x1E4FB1340] fixedSpacing:self->_horizontalSpacing];
  [v28 setInterItemSpacing:v29];

  uint64_t v30 = (void *)MEMORY[0x1E4FB1318];
  v52[0] = v45;
  v52[1] = v18;
  long long v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  long long v32 = [v30 horizontalGroupWithLayoutSize:v25 subitems:v31];

  long long v33 = [MEMORY[0x1E4FB1340] fixedSpacing:self->_horizontalSpacing];
  [v32 setInterItemSpacing:v33];

  long long v34 = v28;
  long long v35 = [(SBHAddWidgetSheetViewController *)self _itemsArrayWithSizeClasses:v47 nSmallsGroup:v28 mediumAndSmallGroup:v32 usesThreeColumnLayout:v48];

  unint64_t v36 = [v35 count];
  uint64_t v37 = (void *)MEMORY[0x1E4FB1338];
  uint64_t v38 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  uint64_t v39 = [MEMORY[0x1E4FB1308] estimatedDimension:(double)(v36 - 1) * 16.0 + (double)v36 * (v9 + 30.0)];
  v40 = [v37 sizeWithWidthDimension:v38 heightDimension:v39];

  uint64_t v41 = [MEMORY[0x1E4FB1318] verticalGroupWithLayoutSize:v40 subitems:v35];
  v42 = [MEMORY[0x1E4FB1340] fixedSpacing:16.0];
  [v41 setInterItemSpacing:v42];

  uint64_t v43 = [MEMORY[0x1E4FB1330] sectionWithGroup:v41];
  [v43 setInterGroupSpacing:16.0];
  objc_msgSend(v43, "setContentInsets:", self->_searchBarHeightAdjustment, self->_contentInsets.leading, 8.0, self->_contentInsets.trailing);

  return v43;
}

- (id)_newPadCollectionViewLayoutGallerySectionWithWidth:(double)a3 sizeClasses:(id)a4
{
  id v66 = a4;
  uint64_t v5 = [(SBHAddWidgetSheetViewController *)self _listLayoutForWidgetSizing];
  double v6 = SBHIconListLayoutIconImageInfoForGridSizeClass(v5, @"SBHIconGridSizeClassSmall");
  uint64_t v8 = v7;
  double v9 = SBHIconListLayoutIconImageInfoForGridSizeClass(v5, @"SBHIconGridSizeClassMedium");
  uint64_t v11 = v10;
  double v12 = SBHIconListLayoutIconImageInfoForGridSizeClass(v5, @"SBHIconGridSizeClassLarge");
  double v14 = v13;
  double v15 = SBHIconListLayoutIconImageInfoForGridSizeClass(v5, @"SBHIconGridSizeClassExtraLarge");
  uint64_t v70 = v16;
  double v72 = v15;
  uint64_t v65 = v5;
  [(SBHAddWidgetSheetViewController *)self _horizontalSpacingForListLayout:v5];
  double v18 = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke;
  aBlock[3] = &__block_descriptor_56_e38_v32__0__NSMutableArray_8_CGPoint_dd_16l;
  *(double *)&void aBlock[4] = v6;
  aBlock[5] = v8;
  *(double *)&aBlock[6] = v17;
  int v19 = _Block_copy(aBlock);
  v107[0] = MEMORY[0x1E4F143A8];
  v107[1] = 3221225472;
  v107[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_2;
  v107[3] = &__block_descriptor_72_e38_v32__0__NSMutableArray_8_CGPoint_dd_16l;
  *(double *)&v107[4] = v6;
  v107[5] = v8;
  *(double *)&v107[6] = v18;
  *(double *)&v107[7] = v9;
  v107[8] = v11;
  int v20 = _Block_copy(v107);
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_3;
  v106[3] = &__block_descriptor_72_e38_v32__0__NSMutableArray_8_CGPoint_dd_16l;
  *(double *)&v106[4] = v9;
  v106[5] = v11;
  *(double *)&v106[6] = v6;
  v106[7] = v8;
  *(double *)&v106[8] = v18;
  int v21 = _Block_copy(v106);
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_4;
  v105[3] = &__block_descriptor_56_e38_v32__0__NSMutableArray_8_CGPoint_dd_16l;
  *(double *)&v105[4] = v9;
  v105[5] = v11;
  *(double *)&v105[6] = v18;
  id v22 = _Block_copy(v105);
  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_5;
  v104[3] = &__block_descriptor_48_e38_v32__0__NSMutableArray_8_CGPoint_dd_16l;
  *(double *)&v104[4] = v12;
  *(double *)&v104[5] = v14;
  int v23 = _Block_copy(v104);
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_6;
  v103[3] = &__block_descriptor_56_e38_v32__0__NSMutableArray_8_CGPoint_dd_16l;
  *(double *)&v103[4] = v6;
  v103[5] = v8;
  *(double *)&v103[6] = v18;
  uint64_t v24 = _Block_copy(v103);
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_7;
  v102[3] = &__block_descriptor_48_e38_v32__0__NSMutableArray_8_CGPoint_dd_16l;
  *(double *)&v102[4] = v72;
  v102[5] = v70;
  id v25 = _Block_copy(v102);
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_8;
  v94[3] = &unk_1E6AAEA90;
  id v64 = v19;
  id v95 = v64;
  id v63 = v20;
  id v96 = v63;
  id v62 = v21;
  id v97 = v62;
  id v61 = v22;
  id v98 = v61;
  id v60 = v23;
  id v99 = v60;
  id v59 = v24;
  id v100 = v59;
  id v58 = v25;
  id v101 = v58;
  long long v73 = _Block_copy(v94);
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_10;
  v92[3] = &unk_1E6AAEAD8;
  id v93 = &__block_literal_global_219;
  long long v26 = (unsigned int (**)(void *, void *, uint64_t))_Block_copy(v92);
  self->_double horizontalSpacing = v18;
  unint64_t galleryLayoutSize = self->_galleryLayoutSize;
  if (galleryLayoutSize == 2) {
    unint64_t v27 = 4;
  }
  else {
    unint64_t v27 = 5;
  }
  double v28 = v18 * (double)(v27 - 1) + (double)v27 * v6;
  self->_contentInsets.top = 0.0;
  CGFloat v29 = (a3 - v28) * 0.5;
  self->_contentInsets.double leading = v29;
  self->_contentInsets.bottouint64_t m = 0.0;
  self->_contentInsets.double trailing = v29;
  if ([(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] == 1)
  {
    uint64_t v91 = 0;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v86 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    [(SBHAddWidgetSheetViewController *)self _metricsForCurrentOrientation];
    self->_contentInsets.double leading = 0.0;
    self->_contentInsets.double trailing = 0.0;
  }
  p_contentInsets = &self->_contentInsets;
  uint64_t v30 = (void *)MEMORY[0x1E4FB1338];
  long long v31 = [MEMORY[0x1E4FB1308] absoluteDimension:v28 + 100.0];
  long long v32 = [MEMORY[0x1E4FB1308] estimatedDimension:v14];
  long long v71 = [v30 sizeWithWidthDimension:v31 heightDimension:v32];

  long long v33 = self;
  long long v34 = [(SBHAddWidgetSheetViewController *)self _podsArrayWithSizeClasses:v66 columnCount:v27];
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v34 count])
  {
    unint64_t v36 = 0;
    uint64_t v37 = 2;
    if (galleryLayoutSize != 2) {
      uint64_t v37 = 3;
    }
    uint64_t v68 = v37;
    long long v67 = *MEMORY[0x1E4F1DAD8];
    do
    {
      id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v39 = [v34 objectAtIndex:v36];
      [v38 addObject:v39];

      if (v26[2](v26, v34, v36) && v26[2](v26, v34, v36 + 1))
      {
        v40 = [v34 objectAtIndex:v36 + 1];
        [v38 addObject:v40];

        unint64_t v41 = v36 + 2;
        if (galleryLayoutSize != 2)
        {
          if (v26[2](v26, v34, v36 + 2))
          {
            uint64_t v43 = [v34 objectAtIndex:v36 + 2];
            [v38 addObject:v43];
          }
          unint64_t v41 = v36 + 3;
          long long v84 = *MEMORY[0x1E4F1DAD8];
LABEL_19:
          double horizontalSpacing = v33->_horizontalSpacing;
          double v42 = v6 + horizontalSpacing;
          long long v75 = COERCE_UNSIGNED_INT64(horizontalSpacing + v9 + v6 + horizontalSpacing);
          unint64_t v36 = v41;
          goto LABEL_20;
        }
        long long v84 = *MEMORY[0x1E4F1DAD8];
      }
      else
      {
        unint64_t v41 = v36 + v68;
        long long v84 = *MEMORY[0x1E4F1DAD8];
        if (galleryLayoutSize != 2) {
          goto LABEL_19;
        }
      }
      double v42 = v12 + v33->_horizontalSpacing;
      unint64_t v36 = v41;
      long long v75 = v67;
LABEL_20:
      uint64_t v45 = (void *)MEMORY[0x1E4FB1318];
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_11;
      v76[3] = &unk_1E6AAEB00;
      id v77 = v38;
      id v78 = v73;
      id v79 = &__block_literal_global_219;
      long long v80 = v84;
      double v81 = v42;
      uint64_t v82 = 0;
      long long v83 = v75;
      id v46 = v38;
      id v47 = [v45 customGroupWithLayoutSize:v71 itemProvider:v76];
      [v35 addObject:v47];
    }
    while (v36 < [v34 count]);
  }
  unint64_t v48 = [v35 count];
  id v49 = (void *)MEMORY[0x1E4FB1338];
  v50 = [MEMORY[0x1E4FB1308] absoluteDimension:v28 + v33->_horizontalSpacing];
  int v51 = [MEMORY[0x1E4FB1308] estimatedDimension:v33->_horizontalSpacing * (double)(v48 - 1) + (double)v48 * v14];
  uint64_t v52 = [v49 sizeWithWidthDimension:v50 heightDimension:v51];

  uint64_t v53 = [MEMORY[0x1E4FB1318] verticalGroupWithLayoutSize:v52 subitems:v35];
  uint64_t v54 = [MEMORY[0x1E4FB1340] fixedSpacing:v33->_horizontalSpacing];
  [v53 setInterItemSpacing:v54];

  int v55 = [MEMORY[0x1E4FB1330] sectionWithGroup:v53];
  [v55 setInterGroupSpacing:v33->_horizontalSpacing];
  objc_msgSend(v55, "setContentInsets:", v33->_searchBarHeightAdjustment, p_contentInsets->leading, 8.0, p_contentInsets->trailing);

  return v55;
}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke(double *a1, void *a2, double a3, double a4)
{
  uint64_t v7 = (void *)MEMORY[0x1E4FB1320];
  double v8 = a1[4];
  double v9 = a1[5];
  id v10 = a2;
  uint64_t v11 = objc_msgSend(v7, "customItemWithFrame:", a3, a4, v8, v9);
  [v10 addObject:v11];

  double v12 = objc_msgSend(MEMORY[0x1E4FB1320], "customItemWithFrame:", a3 + a1[4] + a1[6], a4, a1[4], a1[5]);
  [v10 addObject:v12];

  double v13 = objc_msgSend(MEMORY[0x1E4FB1320], "customItemWithFrame:", a3, a4 + a1[5] + a1[6], a1[4]);
  [v10 addObject:v13];

  objc_msgSend(MEMORY[0x1E4FB1320], "customItemWithFrame:", a3 + a1[4] + a1[6], a1[6] + a4 + a1[5]);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v10 addObject:v14];
}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_2(double *a1, void *a2, double a3, double a4)
{
  uint64_t v7 = (void *)MEMORY[0x1E4FB1320];
  double v8 = a1[4];
  double v9 = a1[5];
  id v10 = a2;
  uint64_t v11 = objc_msgSend(v7, "customItemWithFrame:", a3, a4, v8, v9);
  [v10 addObject:v11];

  double v12 = objc_msgSend(MEMORY[0x1E4FB1320], "customItemWithFrame:", a3 + a1[4] + a1[6], a4, a1[4], a1[5]);
  [v10 addObject:v12];

  objc_msgSend(MEMORY[0x1E4FB1320], "customItemWithFrame:", a3, a4 + a1[5] + a1[6], a1[7], a1[8]);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v10 addObject:v13];
}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_3(double *a1, void *a2, double a3, double a4)
{
  uint64_t v7 = (void *)MEMORY[0x1E4FB1320];
  double v8 = a1[4];
  double v9 = a1[5];
  id v10 = a2;
  uint64_t v11 = objc_msgSend(v7, "customItemWithFrame:", a3, a4, v8, v9);
  [v10 addObject:v11];

  double v12 = objc_msgSend(MEMORY[0x1E4FB1320], "customItemWithFrame:", a3, a4 + a1[7] + a1[8], a1[6]);
  [v10 addObject:v12];

  objc_msgSend(MEMORY[0x1E4FB1320], "customItemWithFrame:", a3 + a1[6] + a1[8], a1[8] + a4 + a1[7]);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v10 addObject:v13];
}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_4(double *a1, void *a2, double a3, double a4)
{
  uint64_t v7 = (void *)MEMORY[0x1E4FB1320];
  double v8 = a1[4];
  double v9 = a1[5];
  id v10 = a2;
  uint64_t v11 = objc_msgSend(v7, "customItemWithFrame:", a3, a4, v8, v9);
  [v10 addObject:v11];

  objc_msgSend(MEMORY[0x1E4FB1320], "customItemWithFrame:", a3, a4 + a1[5] + a1[6], a1[4]);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v10 addObject:v12];
}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_5(uint64_t a1, void *a2, double a3, double a4)
{
  double v6 = (void *)MEMORY[0x1E4FB1320];
  double v7 = *(double *)(a1 + 32);
  double v8 = *(double *)(a1 + 40);
  id v9 = a2;
  objc_msgSend(v6, "customItemWithFrame:", a3, a4, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v9 addObject:v10];
}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_6(double *a1, void *a2, double a3, double a4)
{
  double v7 = (void *)MEMORY[0x1E4FB1320];
  double v8 = a1[4];
  double v9 = a1[5];
  id v10 = a2;
  uint64_t v11 = objc_msgSend(v7, "customItemWithFrame:", a3, a4, v8, v9);
  [v10 addObject:v11];

  objc_msgSend(MEMORY[0x1E4FB1320], "customItemWithFrame:", a3, a4 + a1[5] + a1[6], a1[4]);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v10 addObject:v12];
}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_7(uint64_t a1, void *a2, double a3, double a4)
{
  double v6 = (void *)MEMORY[0x1E4FB1320];
  double v7 = *(double *)(a1 + 32);
  double v8 = *(double *)(a1 + 40);
  id v9 = a2;
  objc_msgSend(v6, "customItemWithFrame:", a3, a4, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v9 addObject:v10];
}

void __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, double a4, double a5)
{
  id v9 = a2;
  switch(a3)
  {
    case 0:
      uint64_t v10 = a1 + 72;
      goto LABEL_9;
    case 1:
      uint64_t v10 = a1 + 32;
      goto LABEL_9;
    case 2:
      uint64_t v10 = a1 + 40;
      goto LABEL_9;
    case 3:
      uint64_t v10 = a1 + 48;
      goto LABEL_9;
    case 4:
      uint64_t v10 = a1 + 56;
      goto LABEL_9;
    case 5:
      uint64_t v10 = a1 + 64;
      goto LABEL_9;
    case 6:
      uint64_t v10 = a1 + 80;
LABEL_9:
      id v11 = v9;
      (*(void (**)(double, double))(*(void *)v10 + 16))(a4, a5);
      id v9 = v11;
      break;
    default:
      break;
  }
}

uint64_t __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_9(uint64_t a1, void *a2)
{
  unint64_t v2 = objc_msgSend(a2, "objectAtIndex:");
  uint64_t v3 = [v2 integerValue];

  return v3;
}

BOOL __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_10(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  BOOL v6 = [v5 count] > a3 && (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() != 6;

  return v6;
}

id __98__SBHAddWidgetSheetViewController__newPadCollectionViewLayoutGallerySectionWithWidth_sizeClasses___block_invoke_11(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    (*(void (**)(uint64_t, id, uint64_t, double, double))(v3 + 16))(v3, v2, v4, *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    (*(void (**)(uint64_t, id, uint64_t, double, double))(v5 + 16))(v5, v2, v6, *(double *)(a1 + 72), *(double *)(a1 + 80));
  }
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 3)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    (*(void (**)(uint64_t, id, uint64_t, double, double))(v7 + 16))(v7, v2, v8, *(double *)(a1 + 88), *(double *)(a1 + 96));
  }
  return v2;
}

- (id)_podsArrayWithSizeClasses:(id)a3 columnCount:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a4 >= 0) {
    int64_t v7 = a4;
  }
  else {
    int64_t v7 = a4 + 1;
  }
  unint64_t v8 = [v5 count];
  id v9 = objc_opt_new();
  if (v8)
  {
    unint64_t v10 = 0;
    unint64_t v11 = (a4 & 1) + (v7 >> 1);
    do
    {
      unint64_t v12 = [v9 count];
      if ((a4 & 1) != 0 && !(v12 % v11))
      {
        uint64_t v20 = SBHSizeClassForItemAtIndex(v6, v10);
        unint64_t v21 = SBHSizeClassForItemAtIndex(v6, v10 + 1);
        if (v20 == 1 && v21 <= 1)
        {
          [v9 addObject:&unk_1F300EC68];
          v10 += 2;
        }
      }
      else
      {
        uint64_t v13 = SBHSizeClassForItemAtIndex(v6, v10);
        unint64_t v14 = SBHSizeClassForItemAtIndex(v6, v10 + 1);
        unint64_t v15 = SBHSizeClassForItemAtIndex(v6, v10 + 2);
        unint64_t v16 = SBHSizeClassForItemAtIndex(v6, v10 + 3);
        uint64_t v17 = v13 - 1;
        double v18 = &unk_1F300EC50;
        uint64_t v19 = 1;
        switch(v17)
        {
          case 0:
            if (v14 > 1) {
              goto LABEL_27;
            }
            if (v15 <= 1 && v16 < 2)
            {
              double v18 = &unk_1F300EBF0;
              uint64_t v19 = 4;
              goto LABEL_26;
            }
            if (v14 != 1 || (v15 | 2) != 2) {
              goto LABEL_27;
            }
            double v18 = &unk_1F300EC08;
            goto LABEL_25;
          case 1:
            if (v14 >= 2)
            {
              if (v14 == 2)
              {
                double v18 = &unk_1F300EC38;
                uint64_t v19 = 2;
LABEL_26:
                [v9 addObject:v18];
                goto LABEL_28;
              }
            }
            else if (v15 < 2)
            {
              double v18 = &unk_1F300EC20;
LABEL_25:
              uint64_t v19 = 3;
              goto LABEL_26;
            }
LABEL_27:
            uint64_t v19 = 0;
LABEL_28:
            v10 += v19;
            break;
          case 2:
            goto LABEL_26;
          case 3:
            double v18 = &unk_1F300EC80;
            uint64_t v19 = 1;
            goto LABEL_26;
          default:
            goto LABEL_27;
        }
      }
    }
    while (v10 < v8);
  }
  if (![v9 count]) {
    [v9 addObject:&unk_1F300EBF0];
  }

  return v9;
}

- (id)_collectionViewLayoutApplicationsSectionWithStyle:(unint64_t)a3
{
  id v5 = (void *)MEMORY[0x1E4FB1338];
  uint64_t v6 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  int64_t v7 = [MEMORY[0x1E4FB1308] estimatedDimension:80.0];
  unint64_t v8 = [v5 sizeWithWidthDimension:v6 heightDimension:v7];

  id v9 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v8];
  unint64_t v10 = (void *)MEMORY[0x1E4FB1338];
  unint64_t v11 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  unint64_t v12 = [MEMORY[0x1E4FB1308] estimatedDimension:80.0];
  uint64_t v13 = [v10 sizeWithWidthDimension:v11 heightDimension:v12];

  unint64_t v14 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v13 repeatingSubitem:v9 count:1];
  unint64_t v15 = [MEMORY[0x1E4FB1330] sectionWithGroup:v14];
  if (a3)
  {
    [(SBHAddWidgetSheetViewController *)self _updateHorizontalSpacing];
    double top = 0.0;
    [v15 setInterGroupSpacing:0.0];
    __asm { FMOV            V1.2D, #20.0 }
    *(_OWORD *)&self->_applicationsSectionInsets.double top = xmmword_1D81E50B0;
    *(_OWORD *)&self->_applicationsSectionInsets.bottouint64_t m = _Q1;
    if (a3 == 1)
    {
      [(SBHAddWidgetSheetViewController *)self _metricsForCurrentOrientation];
      self->_applicationsSectionInsets.double leading = 0.0;
      self->_applicationsSectionInsets.double trailing = 0.0;
      double top = self->_applicationsSectionInsets.top;
    }
  }
  else
  {
    CGFloat v22 = self->_contentInsets.leading + -12.0;
    self->_applicationsSectionInsets.double top = 0.0;
    self->_applicationsSectionInsets.double leading = 0.0;
    self->_applicationsSectionInsets.bottouint64_t m = v22;
    self->_applicationsSectionInsets.double trailing = 0.0;
    double top = 0.0;
  }
  objc_msgSend(v15, "setContentInsets:", top, self->_applicationsSectionInsets.leading, self->_applicationsSectionInsets.bottom, self->_applicationsSectionInsets.trailing);

  return v15;
}

- (BOOL)_shouldShowGallery
{
  if ([(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] == 1
    && ![(SBHAddWidgetSheetViewController *)self shouldShowGalleryOnly]
    || [(SBHAddWidgetSheetViewController *)self _isSearchVisible])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    uint64_t v4 = [(SBHAddWidgetSheetViewController *)self configuration];
    int v3 = [v4 applicationCellIncludesGalleryListView] ^ 1;
  }
  return v3;
}

- (BOOL)_shouldShowCustomApplicationsSection
{
  int v3 = [(SBHAddWidgetSheetViewController *)self configuration];
  int v4 = [v3 wantsCustomApplicationsSection];

  NSUInteger v5 = [(NSArray *)self->_customApplicationWidgetCollections count];
  BOOL result = 0;
  if (v4)
  {
    if (v5) {
      return ![(SBHAddWidgetSheetViewController *)self _isSearchVisible];
    }
  }
  return result;
}

- (BOOL)_shouldShowSuggestionsListItem
{
  if ([(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] == 1) {
    return ![(SBHAddWidgetSheetViewController *)self _isSearchVisible];
  }
  else {
    return 0;
  }
}

- (BOOL)_shouldShowDisfavoredSection
{
  if (self->_disfavoredApplicationWidgetCollections) {
    return ![(SBHAddWidgetSheetViewController *)self _isSearchVisible];
  }
  else {
    return 0;
  }
}

- (id)_materialViewForVisualStyling
{
  backgroundView = [(SBHAddWidgetSheetViewControllerBase *)self externalBackgroundView];
  int v4 = backgroundView;
  if (!backgroundView) {
    backgroundView = self->_backgroundView;
  }
  id v5 = backgroundView;

  return v5;
}

- (BOOL)_shouldShowTitleAndSubtitle
{
  if (__sb__runningInSpringBoard())
  {
    return !SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1;
  }
  else
  {
    int v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v2 = [v3 userInterfaceIdiom] == 0;
  }
  return v2;
}

- (id)_newWrapperViewControllerWithGalleryItem:(id)a3 sizeClass:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [SBHWidgetWrapperViewController alloc];
  BOOL v8 = [(SBHAddWidgetSheetViewController *)self _shouldShowTitleAndSubtitle];
  id v9 = [(SBHAddWidgetSheetViewControllerBase *)self listLayoutProvider];
  unint64_t v10 = [(SBHAddWidgetSheetViewControllerBase *)self iconViewProvider];
  unint64_t v11 = [(SBHWidgetWrapperViewController *)v7 initWithGalleryItem:v6 titleAndSubtitleVisible:v8 listLayoutProvider:v9 iconViewProvider:v10];

  if ([(SBHAddWidgetSheetViewController *)self addWidgetSheetLocation] == 2) {
    [(SBHWidgetWrapperViewController *)v11 setUsesAmbientScaleFactorForRemovableBackgroundItems:1];
  }
  [(SBHWidgetWrapperViewController *)v11 setDelegate:self];
  [(SBHWidgetWrapperViewController *)v11 setSelectedSizeClass:a4];
  [(SBHWidgetWrapperViewController *)v11 setBackgroundType:[(SBHAddWidgetSheetViewController *)self widgetWrapperViewControllerBackgroundType]];
  return v11;
}

- (int64_t)widgetWrapperViewControllerBackgroundType
{
  int64_t result = [(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetWidgetBackgroundType];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (void)_updateSearchBarOverrideUserInterfaceStyle
{
  id v4 = [(SBHAddWidgetSheetViewController *)self _effectiveSearchController];
  int v3 = [(SBHAddWidgetSheetViewController *)self traitCollection];
  objc_msgSend(v4, "setOverrideUserInterfaceStyle:", objc_msgSend(v3, "userInterfaceStyle"));
}

- (void)_updateSearchBarContentInsets
{
  searchController = self->_searchController;
  id v4 = [(SBHAddWidgetSheetViewController *)self view];
  [v4 bounds];
  [(SBHWidgetSearchController *)searchController updateSearchBarContentInsetsWithWidth:v5];

  [(SBHAddWidgetSheetViewController *)self _updateCollectionViewInsets];
}

- (void)_updateCollectionViewInsets
{
  int v3 = [(SBHAddWidgetSheetViewController *)self _listLayoutForWidgetSizing];
  id v4 = [(SBHAddWidgetSheetViewController *)self configuration];
  uint64_t v5 = [v4 gridSizeClassForContentWidth];
  id v6 = (void *)v5;
  int64_t v7 = @"SBHIconGridSizeClassMedium";
  if (v5) {
    int64_t v7 = (__CFString *)v5;
  }
  BOOL v8 = v7;

  double v9 = SBHIconListLayoutIconImageInfoForGridSizeClass(v3, v8);
  unint64_t v10 = [(SBHAddWidgetSheetViewController *)self view];
  [v10 frame];
  double v12 = (v11 - v9) * -0.5;

  unint64_t v13 = [(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle];
  unint64_t v14 = [(SBHAddWidgetSheetViewController *)self searchController];
  [v14 textFieldToWidgetsSpacing];
  double v16 = v15;

  double v17 = v16 + 12.0 + v12;
  if (v13 == 1) {
    double v17 = 0.0;
  }
  self->_searchBarHeightAdjustment = v17;
  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView contentInset];
  double v19 = v18;
  double v21 = v20;
  if (v13 == 1)
  {
    [(SBHAddWidgetSheetViewController *)self _metricsForCurrentOrientation];
    CGFloat v22 = [(SBHAddWidgetSheetViewController *)self _effectiveSearchController];
    int v23 = [v22 searchBar];
    uint64_t v24 = [v23 searchField];
    [v24 frame];
    CGFloat v25 = CGRectGetMaxY(v42) + 0.0;

    double v26 = v25 / 0.0;
  }
  else
  {
    unint64_t v27 = [(SBHAddWidgetSheetViewController *)self _effectiveSearchController];
    double v28 = [v27 searchBar];
    [v28 frame];
    double v30 = v29;

    double v26 = v30 - self->_searchBarHeightAdjustment;
  }
  double Height = CGRectGetHeight(self->_keyboardFrameIntersect);
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      double Height = Height - self->_applicationsSectionInsets.bottom;
    }
  }
  else
  {
    long long v32 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v32 userInterfaceIdiom] != 1) {
      double Height = Height - self->_applicationsSectionInsets.bottom;
    }
  }
  double v33 = fmax(Height, 0.0);
  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView contentInset];
  if (v37 != v19 || v34 != v26 || v36 != v21 || v35 != v33)
  {
    -[_SBHAddWidgetSheetCollectionView setContentInset:](self->_collectionView, "setContentInset:", v26, v19, v33, v21);
    [(_SBHAddWidgetSheetCollectionView *)self->_collectionView contentOffset];
    if (v39 == *MEMORY[0x1E4F1DAD8] && v38 == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
    {
      collectionView = self->_collectionView;
      [(_SBHAddWidgetSheetCollectionView *)collectionView contentInset];
      -[_SBHAddWidgetSheetCollectionView setContentOffset:](collectionView, "setContentOffset:", 0.0, -v41);
    }
  }
}

- (void)_selectFirstItem
{
  id v3 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  [(_SBHAddWidgetSheetCollectionView *)self->_collectionView selectItemAtIndexPath:v3 animated:0 scrollPosition:0];
}

- (id)_effectiveSearchController
{
  externalSearchController = self->_externalSearchController;
  if (!externalSearchController) {
    externalSearchController = self->_searchController;
  }
  return externalSearchController;
}

- (SBHPadAddWidgetSheetMetrics)_metricsForOrientation:(SEL)a3
{
  if ((unint64_t)(a4 - 3) >= 2) {
    id v4 = &OBJC_IVAR___SBHAddWidgetSheetViewController__portraitMetrics;
  }
  else {
    id v4 = &OBJC_IVAR___SBHAddWidgetSheetViewController__landscapeMetrics;
  }
  uint64_t v5 = (char *)self + *v4;
  CGSize v6 = (CGSize)*((_OWORD *)v5 + 5);
  *(_OWORD *)&retstr->scaledWidgetSize.height = *((_OWORD *)v5 + 4);
  retstr->detailWidgetPadding = v6;
  *(_OWORD *)&retstr->detailAddButtonTopSpacing = *((_OWORD *)v5 + 6);
  retstr->detailPageControlTopSpacing = *((double *)v5 + 14);
  long long v7 = *((_OWORD *)v5 + 1);
  *(_OWORD *)&retstr->sheetMargiuint64_t n = *(_OWORD *)v5;
  *(_OWORD *)&retstr->sidebarWidth = v7;
  long long v8 = *((_OWORD *)v5 + 3);
  *(_OWORD *)&retstr->trailingPadding = *((_OWORD *)v5 + 2);
  *(_OWORD *)&retstr->widgetScaleFactor = v8;
  return self;
}

- (SBHPadAddWidgetSheetMetrics)_metricsForCurrentOrientation
{
  id v4 = [(SBHAddWidgetSheetViewController *)self view];
  long long v7 = [v4 window];

  uint64_t v5 = v7;
  if (!v7) {
    uint64_t v5 = self;
  }
  [(SBHAddWidgetSheetViewController *)self _metricsForOrientation:[(SBHAddWidgetSheetViewController *)v5 interfaceOrientation]];

  return result;
}

- (id)_generateLayoutSectionForSectionIdx:(unint64_t)a3 width:(double)a4
{
  if ([(SBHAddWidgetSheetViewController *)self _sectionIndexForSection:0] == a3)
  {
    unint64_t v7 = [(SBHAddWidgetSheetViewController *)self galleryLayoutSize];
    long long v8 = [(SBHAddWidgetSheetViewController *)self _sizeClasses];
    if (v7 > 1)
    {
      id v9 = [(SBHAddWidgetSheetViewController *)self _newPadCollectionViewLayoutGallerySectionWithWidth:v8 sizeClasses:a4];
    }
    else
    {
      id v9 = [(SBHAddWidgetSheetViewController *)self _collectionViewLayoutGallerySectionWithWidth:v8 sizeClasses:a4];
    }
    unint64_t v10 = v9;
  }
  else if ([(SBHAddWidgetSheetViewController *)self _sectionIndexForSection:2] == a3 {
         || [(SBHAddWidgetSheetViewController *)self _sectionIndexForSection:3] == a3
  }
         || [(SBHAddWidgetSheetViewController *)self _sectionIndexForSection:1] == a3)
  {
    unint64_t v10 = [(SBHAddWidgetSheetViewController *)self _collectionViewLayoutApplicationsSectionWithStyle:[(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle]];
  }
  else
  {
    unint64_t v10 = 0;
  }
  return v10;
}

- (id)_listLayoutForWidgetSizing
{
  BOOL v2 = [(SBHAddWidgetSheetViewControllerBase *)self listLayoutProvider];
  id v3 = [v2 layoutForIconLocation:@"SBIconLocationRoot"];

  return v3;
}

- (void)_updateHorizontalSpacing
{
  id v4 = [(SBHAddWidgetSheetViewController *)self _listLayoutForWidgetSizing];
  [(SBHAddWidgetSheetViewController *)self _horizontalSpacingForListLayout:v4];
  self->_double horizontalSpacing = v3;
}

- (double)_horizontalSpacingForListLayout:(id)a3
{
  id v3 = a3;
  double v4 = SBHIconListLayoutIconImageInfoForGridSizeClass(v3, @"SBHIconGridSizeClassSmall");
  double v5 = SBHIconListLayoutIconImageInfoForGridSizeClass(v3, @"SBHIconGridSizeClassMedium");

  double result = v5 + v4 * -2.0;
  if (v5 <= v4) {
    return 20.0;
  }
  return result;
}

- (SBHWidgetSheetViewControllerPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (SBHWidgetSheetViewControllerPresenter *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (NSMutableDictionary)suggestedItemsByGalleryLayoutSize
{
  return self->_suggestedItemsByGalleryLayoutSize;
}

- (void)setSuggestedItemsByGalleryLayoutSize:(id)a3
{
}

- (NSArray)applicationWidgetCollections
{
  return self->_applicationWidgetCollections;
}

- (NSArray)favoredApplicationWidgetCollections
{
  return self->_favoredApplicationWidgetCollections;
}

- (NSArray)disfavoredApplicationWidgetCollections
{
  return self->_disfavoredApplicationWidgetCollections;
}

- (NSArray)customApplicationWidgetCollections
{
  return self->_customApplicationWidgetCollections;
}

- (unint64_t)addWidgetSheetLocation
{
  return self->_addWidgetSheetLocation;
}

- (unint64_t)galleryLayoutSize
{
  return self->_galleryLayoutSize;
}

- (BOOL)wantsBottomAttachedPresentation
{
  return self->_wantsBottomAttachedPresentation;
}

- (UIViewController)barSwipeViewController
{
  return self->_barSwipeViewController;
}

- (SBHWidgetSearchController)externalSearchController
{
  return self->_externalSearchController;
}

- (BOOL)shouldShowGalleryOnly
{
  return self->_shouldShowGalleryOnly;
}

- (void)setShouldShowGalleryOnly:(BOOL)a3
{
  self->_shouldShowGalleryOnly = a3;
}

- (BOOL)shouldCenterAppCells
{
  return self->_shouldCenterAppCells;
}

- (void)setShouldCenterAppCells:(BOOL)a3
{
  self->_shouldCenterAppCells = a3;
}

- (SBHAddWidgetSheetConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (_SBHAddWidgetSheetCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (SBHWidgetSearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (NSArray)searchBarGradientMaskLayers
{
  return self->_searchBarGradientMaskLayers;
}

- (void)setSearchBarGradientMaskLayers:(id)a3
{
}

- (NSArray)filteredApplicationWidgetCollections
{
  return self->_filteredApplicationWidgetCollections;
}

- (void)setFilteredApplicationWidgetCollections:(id)a3
{
}

- (NSArray)galleryItems
{
  return self->_galleryItems;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (double)horizontalSpacing
{
  return self->_horizontalSpacing;
}

- (void)setHorizontalSpacing:(double)a3
{
  self->_double horizontalSpacing = a3;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double leading = self->_contentInsets.leading;
  bottouint64_t m = self->_contentInsets.bottom;
  double trailing = self->_contentInsets.trailing;
  result.double trailing = trailing;
  result.bottouint64_t m = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (NSDirectionalEdgeInsets)applicationsSectionInsets
{
  double top = self->_applicationsSectionInsets.top;
  double leading = self->_applicationsSectionInsets.leading;
  bottouint64_t m = self->_applicationsSectionInsets.bottom;
  double trailing = self->_applicationsSectionInsets.trailing;
  result.double trailing = trailing;
  result.bottouint64_t m = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setApplicationsSectionInsets:(NSDirectionalEdgeInsets)a3
{
  self->_applicationsSectionInsets = a3;
}

- (double)searchBarHeightAdjustment
{
  return self->_searchBarHeightAdjustment;
}

- (void)setSearchBarHeightAdjustment:(double)a3
{
  self->_searchBarHeightAdjustment = a3;
}

- (CGRect)keyboardFrameIntersect
{
  double x = self->_keyboardFrameIntersect.origin.x;
  double y = self->_keyboardFrameIntersect.origin.y;
  double width = self->_keyboardFrameIntersect.size.width;
  double height = self->_keyboardFrameIntersect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setKeyboardFrameIntersect:(CGRect)a3
{
  self->_keyboardFrameIntersect = a3;
}

- (SBHWidgetAddSheetTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
}

- (BOOL)isShowingDisfavoredApplicationWidgetCollections
{
  return self->_isShowingDisfavoredApplicationWidgetCollections;
}

- (void)setIsShowingDisfavoredApplicationWidgetCollections:(BOOL)a3
{
  self->_isShowingDisfavoredApplicationWidgetCollections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_galleryItems, 0);
  objc_storeStrong((id *)&self->_filteredApplicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_searchBarGradientMaskLayers, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_externalSearchController, 0);
  objc_storeStrong((id *)&self->_barSwipeViewController, 0);
  objc_storeStrong((id *)&self->_customApplicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_disfavoredApplicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_favoredApplicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_applicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_suggestedItemsByGalleryLayoutSize, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_customApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable, 0);
  objc_storeStrong((id *)&self->_disfavoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable, 0);
  objc_storeStrong((id *)&self->_favoredApplicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable, 0);
  objc_storeStrong((id *)&self->_applicationWidgetCollectionForApplicationWidgetCollectionIdentifierLookupTable, 0);
  objc_storeStrong((id *)&self->_galleryIdentifierToGalleryItemLookupTable, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

- (void)_presentDetailSheetViewControllerForApplicationWidgetCollection:(uint64_t)a1 configuredWithGalleryItem:(NSObject *)a2 selectedSizeClass:fromCell:atIndexPath:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Cannot present detail sheet for application collection with 0 descriptors: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_presentDetailSheetForGalleryCellAtIndexPath:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "widgetWrapperViewController: %{public}@ not found in known applicationWidgetCollections: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end