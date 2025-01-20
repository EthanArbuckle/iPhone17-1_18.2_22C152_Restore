@interface SKUIStorePageSectionsViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4;
- (BOOL)collectionView:(id)a3 canScrollCellAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)isDisplayingOverlays;
- (BOOL)performTestWithName:(id)a3 options:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)sections;
- (SKUICollectionViewPullToRefreshDelegate)pullToRefreshDelegate;
- (SKUIColorScheme)colorScheme;
- (SKUIIndexBarControl)indexBarControl;
- (SKUIMetricsController)metricsController;
- (SKUIMetricsImpressionSession)activeMetricsImpressionSession;
- (SKUIResourceLoader)resourceLoader;
- (SKUIStorePageSectionsDelegate)delegate;
- (SKUIStorePageSectionsViewController)initWithCoder:(id)a3;
- (SKUIStorePageSectionsViewController)initWithLayoutStyle:(int64_t)a3;
- (SKUIStorePageSectionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 pinningContentInsetForItemAtIndexPath:(id)a5;
- (id)SKUIStackedBar;
- (id)_childSectionsForMenuComponent:(id)a3 selectedIndex:(int64_t)a4;
- (id)_collectionViewSublayouts;
- (id)_createSectionsForExpandPageComponent:(id)a3 context:(id)a4 newSections:(id)a5 sectionCount:(int64_t)a6 sectionsByViewElement:(id)a7 updateStyle:(int64_t)a8;
- (id)_currentBackdropGroupName;
- (id)_defaultSectionForGridComponent:(id)a3;
- (id)_defaultSectionForSwooshComponent:(id)a3;
- (id)_expandContextForMenuComponent:(id)a3;
- (id)_impressionableViewElements;
- (id)_menuContextForMenuComponent:(id)a3;
- (id)_newSectionContext;
- (id)_newSectionsWithPageComponent:(id)a3;
- (id)_newSectionsWithPageComponents:(id)a3;
- (id)_newStorePageCollectionViewLayout;
- (id)_prepareLayoutForSections;
- (id)_splitForSectionIndex:(int64_t)a3;
- (id)_textLayoutCache;
- (id)_visibleMetricsImpressionsString;
- (id)backgroundColorForSection:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)defaultSectionForComponent:(id)a3;
- (id)indexPathsForGradientItemsInCollectionView:(id)a3 layout:(id)a4;
- (id)indexPathsForPinningItemsInCollectionView:(id)a3 layout:(id)a4;
- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4;
- (int64_t)collectionView:(id)a3 layout:(id)a4 pinningGroupForItemAtIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 layout:(id)a4 pinningStyleForItemAtIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 layout:(id)a4 pinningTransitionStyleForItemAtIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)pinningTransitionStyle;
- (void)_applyColorScheme:(id)a3 toIndexBarControl:(id)a4;
- (void)_beginActiveImpressionsForImpressionableViewElements;
- (void)_beginIgnoringSectionChanges;
- (void)_deselectCellsForAppearance:(BOOL)a3;
- (void)_endAllPendingActiveImpression;
- (void)_endIgnoringSectionChanges;
- (void)_entityProviderDidInvalidateNotification:(id)a3;
- (void)_enumerateSectionContextsUsingBlock:(id)a3;
- (void)_enumerateVisibleSectionsUsingBlock:(id)a3;
- (void)_handleTap:(id)a3;
- (void)_insertSectionsWithComponents:(id)a3 afterSection:(id)a4;
- (void)_invalidateIfLastKnownWidthChanged;
- (void)_invalidateLayoutWithNewSize:(CGSize)a3 transitionCoordinator:(id)a4;
- (void)_longPressAction:(id)a3;
- (void)_pageSectionDidDismissOverlayController:(id)a3;
- (void)_prefetchArtworkForVisibleSections;
- (void)_registerForNotificationsForEntityProvider:(id)a3;
- (void)_reloadCollectionView;
- (void)_reloadRelevantEntityProviders;
- (void)_scrollFirstAppearanceSectionToView;
- (void)_setActiveProductPageOverlayController:(id)a3;
- (void)_setPageSize:(CGSize)a3;
- (void)_setRendersWithParallax:(BOOL)a3;
- (void)_setRendersWithPerspective:(BOOL)a3;
- (void)_setSelectedIndex:(int64_t)a3 forMenuSection:(id)a4;
- (void)_startRefresh:(id)a3;
- (void)_unregisterForNotificationsForEntityProvider:(id)a3;
- (void)_updateCollectionViewWithUpdates:(id)a3;
- (void)_updateSectionsAfterMenuChange;
- (void)_updateSectionsForIndex:(int64_t)a3 menuSection:(id)a4;
- (void)collectionView:(id)a3 didConfirmButtonElement:(id)a4 withClickInfo:(id)a5 forItemAtIndexPath:(id)a6;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didEndEditingItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 editorialView:(id)a4 didSelectLink:(id)a5;
- (void)collectionView:(id)a3 expandEditorialForLabelElement:(id)a4 indexPath:(id)a5;
- (void)collectionView:(id)a3 layout:(id)a4 willApplyLayoutAttributes:(id)a5;
- (void)collectionView:(id)a3 performDefaultActionForViewElement:(id)a4 indexPath:(id)a5;
- (void)collectionView:(id)a3 willBeginEditingItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)dismissOverlays;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)invalidateAndReload;
- (void)itemCollectionView:(id)a3 didConfirmItemOfferForCell:(id)a4;
- (void)itemCollectionView:(id)a3 didTapVideoForCollectionViewCell:(id)a4;
- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4;
- (void)layoutCacheDidFinishBatch:(id)a3;
- (void)loadView;
- (void)previewingContext:(id)a3 commitViewController:(id)a4;
- (void)productPageOverlayDidDismiss:(id)a3;
- (void)reloadSections:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActiveMetricsImpressionSession:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIndexBarControl:(id)a3;
- (void)setMetricsController:(id)a3;
- (void)setPinningTransitionStyle:(int64_t)a3;
- (void)setPullToRefreshDelegate:(id)a3;
- (void)setResourceLoader:(id)a3;
- (void)setSKUIStackedBar:(id)a3;
- (void)setSectionsWithPageComponents:(id)a3;
- (void)setSectionsWithSplitsDescription:(id)a3;
- (void)setUsePullToRefresh:(BOOL)a3;
- (void)showOverlayWithProductPage:(id)a3 metricsPageEvent:(id)a4;
- (void)skuiCollectionViewWillLayoutSubviews:(id)a3;
- (void)skui_viewWillAppear:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5;
@end

@implementation SKUIStorePageSectionsViewController

- (SKUIStorePageSectionsViewController)initWithLayoutStyle:(int64_t)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIStorePageSectionsViewController initWithLayoutStyle:]();
  }
  if (initWithLayoutStyle__onceToken != -1) {
    dispatch_once(&initWithLayoutStyle__onceToken, &__block_literal_global_5);
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIStorePageSectionsViewController;
  v5 = [(SKUIStorePageSectionsViewController *)&v12 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    v5->_layoutStyle = a3;
    v5->_itemsChangedStateWhileDisappeared = 0;
    [(SKUIStorePageSectionsViewController *)v5 setRestorationClass:objc_opt_class()];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [(SKUIStorePageSectionsViewController *)v6 setRestorationIdentifier:v8];

    v9 = +[SKUIItemStateCenter defaultCenter];
    [v9 addObserver:v6];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v6 selector:sel__contentSizeChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v6;
}

void __59__SKUIStorePageSectionsViewController_initWithLayoutStyle___block_invoke()
{
  id v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  __orbSupported = [v0 _supportsForceTouch];
}

- (SKUIStorePageSectionsViewController)initWithCoder:(id)a3
{
  return [(SKUIStorePageSectionsViewController *)self initWithLayoutStyle:0];
}

- (SKUIStorePageSectionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[SKUIStorePageSectionsViewController initWithLayoutStyle:](self, "initWithLayoutStyle:", 0, a4);
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];
  [(SKUIStorePageSplitsDescription *)self->_splitsDescription enumerateSplitsUsingBlock:&__block_literal_global_11];
  v4 = +[SKUIItemStateCenter defaultCenter];
  [v4 removeObserver:self];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_entityProviderToRelevantSections;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        [(SKUIStorePageSectionsViewController *)self _unregisterForNotificationsForEntityProvider:*(void *)(*((void *)&v12 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(SKUICollectionView *)self->_collectionView setDataSource:0];
  [(SKUICollectionView *)self->_collectionView setDelegate:0];
  [(SKUIProductPageOverlayController *)self->_overlayController setDelegate:0];
  [(SKUILayoutCache *)self->_textLayoutCache setDelegate:0];
  if (self->_viewControllerPreviewing)
  {
    -[SKUIStorePageSectionsViewController unregisterPreviewing:](self, "unregisterPreviewing:");
    viewControllerPreviewing = self->_viewControllerPreviewing;
    self->_viewControllerPreviewing = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIStorePageSectionsViewController;
  [(SKUIViewController *)&v11 dealloc];
}

void __46__SKUIStorePageSectionsViewController_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 sectionContext];
  [v2 _setParentViewController:0];
}

- (UICollectionView)collectionView
{
  collectionView = self->_collectionView;
  if (!collectionView)
  {
    id v4 = [(SKUIStorePageSectionsViewController *)self _newStorePageCollectionViewLayout];
    v5 = [SKUICollectionView alloc];
    uint64_t v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 bounds];
    uint64_t v7 = -[SKUICollectionView initWithFrame:collectionViewLayout:](v5, "initWithFrame:collectionViewLayout:", v4);
    uint64_t v8 = self->_collectionView;
    self->_collectionView = v7;

    [(SKUICollectionView *)self->_collectionView setSemanticContentAttribute:storeSemanticContentAttribute()];
    [(SKUICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [(SKUICollectionView *)self->_collectionView setClipsToBounds:!self->_rendersWithPerspective];
    [(SKUICollectionView *)self->_collectionView setIndexBarControl:self->_indexBarControl];
    if (self->_refreshControl) {
      -[SKUICollectionView setRefreshControl:](self->_collectionView, "setRefreshControl:");
    }
    uint64_t v9 = [(SKUIColorScheme *)self->_colorScheme backgroundColor];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    }
    long long v12 = v11;

    [(SKUICollectionView *)self->_collectionView setBackgroundColor:v12];
    [(SKUICollectionView *)self->_collectionView setDataSource:self];
    [(SKUICollectionView *)self->_collectionView setDelegate:self];
    long long v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__longPressAction_];
    [(SKUICollectionView *)self->_collectionView addGestureRecognizer:v13];
    [v13 setCancelsTouchesInView:1];
    [v13 setDelaysTouchesBegan:0];
    long long v14 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTap_];
    collectionViewTapGestureRecognizer = self->_collectionViewTapGestureRecognizer;
    self->_collectionViewTapGestureRecognizer = v14;

    [(SKUICollectionView *)self->_collectionView addGestureRecognizer:self->_collectionViewTapGestureRecognizer];
    [(UITapGestureRecognizer *)self->_collectionViewTapGestureRecognizer setEnabled:0];
    [(UITapGestureRecognizer *)self->_collectionViewTapGestureRecognizer setDelegate:self];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__SKUIStorePageSectionsViewController_collectionView__block_invoke;
    v17[3] = &unk_1E6424708;
    v17[4] = self;
    [(SKUIStorePageSectionsViewController *)self _enumerateSectionContextsUsingBlock:v17];

    collectionView = self->_collectionView;
  }

  return (UICollectionView *)collectionView;
}

uint64_t __53__SKUIStorePageSectionsViewController_collectionView__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setCollectionView:*(void *)(*(void *)(a1 + 32) + 1064)];
}

- (id)defaultSectionForComponent:(id)a3
{
  id v4 = a3;
  v5 = 0;
  switch([v4 componentType])
  {
    case 1:
      uint64_t v6 = SKUIAccountButtonsSection;
      goto LABEL_27;
    case 3:
      uint64_t v7 = [v4 viewElement];

      if (v7) {
        uint64_t v6 = SKUIRowViewElementPageSection;
      }
      else {
        uint64_t v6 = SKUIRowSection;
      }
      goto LABEL_27;
    case 4:
      uint64_t v6 = SKUIDividerPageSection;
      goto LABEL_27;
    case 5:
      uint64_t v6 = SKUIEditorialPageSection;
      goto LABEL_27;
    case 6:
    case 13:
    case 18:
      uint64_t v6 = SKUICarouselPageSection;
      goto LABEL_27;
    case 8:
      uint64_t v8 = [(SKUIStorePageSectionsViewController *)self _defaultSectionForGridComponent:v4];
      goto LABEL_28;
    case 9:
      v5 = [v4 viewElement];

      if (v5) {
        goto LABEL_10;
      }
      break;
    case 10:
      uint64_t v6 = SKUIMediaPageSection;
      goto LABEL_27;
    case 12:
      uint64_t v6 = SKUIQuicklinksPageSection;
      goto LABEL_27;
    case 14:
      uint64_t v6 = SKUISpacePageSection;
      goto LABEL_27;
    case 15:
      uint64_t v8 = [(SKUIStorePageSectionsViewController *)self _defaultSectionForSwooshComponent:v4];
      goto LABEL_28;
    case 16:
      uint64_t v6 = SKUIBrowseItemPageSection;
      goto LABEL_27;
    case 17:
      uint64_t v6 = SKUIBrowseHeaderPageSection;
      goto LABEL_27;
    case 20:
      uint64_t v6 = SKUIFacebookPageSection;
      goto LABEL_27;
    case 21:
      uint64_t v6 = SKUIReviewListPageSection;
      goto LABEL_27;
    case 22:
      uint64_t v9 = objc_opt_class();
      v10 = [v4 viewElement];
      int v11 = [v10 isDynamicContainer];

      if (v11) {
        uint64_t v9 = objc_opt_class();
      }
      uint64_t v6 = (__objc2_class *)v9;
      goto LABEL_27;
    case 23:
      uint64_t v6 = SKUITracklistPageSection;
      goto LABEL_27;
    case 24:
LABEL_10:
      uint64_t v6 = SKUIViewElementPageSection;
      goto LABEL_27;
    case 25:
      uint64_t v6 = SKUISearchBarPageSection;
      goto LABEL_27;
    case 26:
      uint64_t v6 = SKUIKeyValueInfoListPageSection;
      goto LABEL_27;
    case 27:
      uint64_t v6 = SKUIVerticalInfoListPageSection;
LABEL_27:
      uint64_t v8 = [[v6 alloc] initWithPageComponent:v4];
LABEL_28:
      v5 = (void *)v8;
      break;
    default:
      break;
  }

  return v5;
}

- (void)dismissOverlays
{
  [(SKUIProductPageOverlayController *)self->_overlayController setDelegate:0];
  [(SKUIProductPageOverlayController *)self->_overlayController dismiss];
  overlayController = self->_overlayController;
  self->_overlayController = 0;
}

- (void)invalidateAndReload
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(SKUILayoutCache *)self->_textLayoutCache setDelegate:0];
  textLayoutCache = self->_textLayoutCache;
  self->_textLayoutCache = 0;

  id v4 = [(SKUIStorePageSectionsViewController *)self _collectionViewSublayouts];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) invalidateLayout];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }
  uint64_t v9 = [(SKUICollectionView *)self->_collectionView collectionViewLayout];
  [v9 invalidateLayout];

  v10 = [(SKUIStorePageSectionsViewController *)self _textLayoutCache];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v11 = self->_sections;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        uint64_t v17 = objc_msgSend(v16, "context", (void)v18);
        [v17 _setTextLayoutCache:v10];
        [v16 willAppearInContext:v17];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  [v10 commitLayoutRequests];
  [(SKUICollectionView *)self->_collectionView reloadData];
}

- (BOOL)isDisplayingOverlays
{
  return self->_overlayController || self->_initialOverlayURLs != 0;
}

- (void)reloadSections:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4FB1EB0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SKUIStorePageSectionsViewController_reloadSections___block_invoke;
  v7[3] = &unk_1E6421FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWithoutAnimation:v7];
}

uint64_t __54__SKUIStorePageSectionsViewController_reloadSections___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1064) reloadSections:*(void *)(a1 + 40)];
}

- (SKUIResourceLoader)resourceLoader
{
  resourceLoader = self->_resourceLoader;
  if (!resourceLoader)
  {
    id v4 = [SKUIResourceLoader alloc];
    uint64_t v5 = [(SKUIViewController *)self clientContext];
    id v6 = [(SKUIResourceLoader *)v4 initWithClientContext:v5];

    uint64_t v7 = SKUIResourceLoaderGetNameForObject(self);
    [(SKUIResourceLoader *)v6 setName:v7];

    [(SKUIStorePageSectionsViewController *)self setResourceLoader:v6];
    resourceLoader = self->_resourceLoader;
  }

  return resourceLoader;
}

- (void)setColorScheme:(id)a3
{
  if (self->_colorScheme != a3)
  {
    id v4 = (SKUIColorScheme *)[a3 copy];
    colorScheme = self->_colorScheme;
    self->_colorScheme = v4;

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__SKUIStorePageSectionsViewController_setColorScheme___block_invoke;
    v11[3] = &unk_1E6424708;
    v11[4] = self;
    [(SKUIStorePageSectionsViewController *)self _enumerateSectionContextsUsingBlock:v11];
    id v6 = [(SKUIColorScheme *)self->_colorScheme backgroundColor];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    }
    uint64_t v9 = v8;

    [(SKUICollectionView *)self->_collectionView setBackgroundColor:v9];
    if ([(SKUIStorePageSectionsViewController *)self isViewLoaded])
    {
      v10 = [(SKUIStorePageSectionsViewController *)self view];
      [v10 setBackgroundColor:v9];
    }
  }
}

uint64_t __54__SKUIStorePageSectionsViewController_setColorScheme___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setColorScheme:*(void *)(*(void *)(a1 + 32) + 1080)];
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v8 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v8);
  char v6 = objc_opt_respondsToSelector();

  self->_delegateWantsDidScroll = v6 & 1;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  self->_delegateWantsWillScrollToOffsetVisibleRange = objc_opt_respondsToSelector() & 1;
}

- (void)setIndexBarControl:(id)a3
{
  id v5 = (SKUIIndexBarControl *)a3;
  if (self->_indexBarControl != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_indexBarControl, a3);
    [(SKUICollectionView *)self->_collectionView setIndexBarControl:self->_indexBarControl];
    id v5 = v6;
  }
}

- (void)setActiveMetricsImpressionSession:(id)a3
{
  id v5 = (SKUIMetricsImpressionSession *)a3;
  if (self->_activeMetricsImpressionSession != v5)
  {
    objc_storeStrong((id *)&self->_activeMetricsImpressionSession, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__SKUIStorePageSectionsViewController_setActiveMetricsImpressionSession___block_invoke;
    v6[3] = &unk_1E6424708;
    uint64_t v7 = v5;
    [(SKUIStorePageSectionsViewController *)self _enumerateSectionContextsUsingBlock:v6];
  }
}

uint64_t __73__SKUIStorePageSectionsViewController_setActiveMetricsImpressionSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setActiveMetricsImpressionSession:*(void *)(a1 + 32)];
}

- (void)setPinningTransitionStyle:(int64_t)a3
{
  if (self->_pinningTransitionStyle != a3)
  {
    self->_pinningTransitionStyle = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__SKUIStorePageSectionsViewController_setPinningTransitionStyle___block_invoke;
    v5[3] = &unk_1E6424708;
    v5[4] = self;
    [(SKUIStorePageSectionsViewController *)self _enumerateSectionContextsUsingBlock:v5];
    id v4 = [(SKUICollectionView *)self->_collectionView collectionViewLayout];
    [v4 invalidateLayout];
  }
}

uint64_t __65__SKUIStorePageSectionsViewController_setPinningTransitionStyle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setDefaultPinningTransitionStyle:*(void *)(*(void *)(a1 + 32) + 1248)];
}

- (void)setMetricsController:(id)a3
{
  id v5 = (SKUIMetricsController *)a3;
  if (self->_metricsController != v5)
  {
    objc_storeStrong((id *)&self->_metricsController, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__SKUIStorePageSectionsViewController_setMetricsController___block_invoke;
    v6[3] = &unk_1E6424708;
    uint64_t v7 = v5;
    [(SKUIStorePageSectionsViewController *)self _enumerateSectionContextsUsingBlock:v6];
  }
}

uint64_t __60__SKUIStorePageSectionsViewController_setMetricsController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setMetricsController:*(void *)(a1 + 32)];
}

- (void)setSectionsWithPageComponents:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = objc_alloc_init(SKUIStorePageSplitsDescription);
    id v5 = objc_alloc_init(SKUIStorePageSplit);
    [(SKUIStorePageSplit *)v5 setPageComponents:v6];
    [(SKUIStorePageSplitsDescription *)v4 setTopSplit:v5];
    [(SKUIStorePageSectionsViewController *)self setSectionsWithSplitsDescription:v4];
  }
  else
  {
    [(SKUIStorePageSectionsViewController *)self setSectionsWithSplitsDescription:0];
  }
}

- (void)setSectionsWithSplitsDescription:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = (SKUIStorePageSplitsDescription *)a3;
  id v6 = v5;
  if (self->_ignoreSectionsChangeCount < 1)
  {
    if (self->_splitsDescription != v5)
    {
      uint64_t v51 = 0;
      v52 = &v51;
      uint64_t v53 = 0x3032000000;
      v54 = __Block_byref_object_copy__11;
      v55 = __Block_byref_object_dispose__11;
      id v56 = (id)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      uint64_t v31 = 1304;
      uint64_t v7 = self->_sections;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v47 objects:v58 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v48 != v9) {
              objc_enumerationMutation(v7);
            }
            int v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            uint64_t v12 = objc_msgSend(v11, "pageComponent", v31);
            uint64_t v13 = [v12 viewElement];
            uint64_t v14 = [v13 persistenceKey];

            if (v14) {
              [(id)v52[5] setObject:v11 forKey:v14];
            }
          }
          uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v47 objects:v58 count:16];
        }
        while (v8);
      }

      int64_t v15 = [(SKUIStorePageSplitsDescription *)self->_splitsDescription numberOfSplits];
      menuSectionContexts = self->_menuSectionContexts;
      self->_menuSectionContexts = 0;

      expandSectionContexts = self->_expandSectionContexts;
      self->_expandSectionContexts = 0;

      long long v18 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v19 = *(Class *)((char *)&self->super.super.super.super.isa + v31);
      *(Class *)((char *)&self->super.super.super.super.isa + v31) = v18;

      long long v20 = (SKUIStorePageSplitsDescription *)[(SKUIStorePageSplitsDescription *)v6 copy];
      splitsDescription = self->_splitsDescription;
      self->_splitsDescription = v20;

      int64_t v22 = [(SKUIStorePageSplitsDescription *)self->_splitsDescription numberOfSplits];
      uint64_t v43 = 0;
      v44 = &v43;
      uint64_t v45 = 0x2020000000;
      uint64_t v46 = 0;
      if (self->_collectionView
        && self->_didInitialReload
        && (uint64_t v23 = v22, [(id)v52[5] count])
        && v15 < 2 != v23 > 1)
      {
        v44[3] = 1;
      }
      else
      {
        -[SKUILayoutCache setDelegate:](self->_textLayoutCache, "setDelegate:", 0, v31);
        textLayoutCache = self->_textLayoutCache;
        self->_textLayoutCache = 0;
      }
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__11;
      v41 = __Block_byref_object_dispose__11;
      id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __72__SKUIStorePageSectionsViewController_setSectionsWithSplitsDescription___block_invoke;
      v36[3] = &unk_1E6424758;
      v36[4] = self;
      v36[5] = &v37;
      v36[6] = &v51;
      v36[7] = &v43;
      [(SKUIStorePageSectionsViewController *)self _updateCollectionViewWithUpdates:v36];
      if (!v44[3]) {
        goto LABEL_31;
      }
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v27 = (id)v38[5];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v32 objects:v57 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v33 != v29) {
              objc_enumerationMutation(v27);
            }
            objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * j), "prefetchResourcesWithReason:", -1, v31);
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v32 objects:v57 count:16];
        }
        while (v28);
      }

      if (v44[3] != 3) {
LABEL_31:
      }
        [(SKUIStorePageSectionsViewController *)self _reloadRelevantEntityProviders];
      _Block_object_dispose(&v37, 8);

      _Block_object_dispose(&v43, 8);
      _Block_object_dispose(&v51, 8);
    }
  }
  else if (v5)
  {
    if (self->_deferredSplitsDescription != v5) {
      objc_storeStrong(&self->_deferredSplitsDescription, a3);
    }
  }
  else
  {
    long long v24 = [MEMORY[0x1E4F1CA98] null];
    id deferredSplitsDescription = self->_deferredSplitsDescription;
    self->_id deferredSplitsDescription = v24;
  }
}

uint64_t __72__SKUIStorePageSectionsViewController_setSectionsWithSplitsDescription___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  id v2 = (void *)[*(id *)(a1 + 32) _newSectionContext];
  [v2 activePageWidth];
  long long v3 = *(_OWORD *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  id v5 = *(void **)(*(void *)(a1 + 32) + 1312);
  v21[1] = 3221225472;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[2] = __72__SKUIStorePageSectionsViewController_setSectionsWithSplitsDescription___block_invoke_2;
  v21[3] = &unk_1E6424730;
  long long v22 = v3;
  long long v23 = v4;
  long long v24 = &v31;
  long long v25 = &v35;
  v26 = &v27;
  objc_msgSend(v5, "sizeSplitsToFitWidth:usingBlock:", v21);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 1
    && ![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
  {
    uint64_t v6 = v36[3];
    if (v32[3] + v6 == v28[3])
    {
      BOOL v7 = v6 <= 0;
      uint64_t v8 = 2;
      if (v7) {
        uint64_t v8 = 3;
      }
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "objectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * v12), (void)v17);
        uint64_t v14 = [v13 context];
        [v13 willHideInContext:v14];

        [v13 _setContext:0];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v39 count:16];
    }
    while (v10);
  }

  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v15;
}

void __72__SKUIStorePageSectionsViewController_setSectionsWithSplitsDescription___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = (void *)[*(id *)(a1 + 32) _newSectionContext];
  [v6 _setActivePageWidth:a3];
  uint64_t v51 = v6;
  [v5 setSectionContext:v6];
  uint64_t v45 = v5;
  BOOL v7 = [v5 pageComponents];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v56 objects:v61 count:16];
  unint64_t v9 = 0x1EA2B5000uLL;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v50 = 0;
    uint64_t v11 = *(void *)v57;
    uint64_t v46 = v7;
    uint64_t v47 = *(void *)v57;
    while (1)
    {
      uint64_t v12 = 0;
      uint64_t v48 = v10;
      do
      {
        if (*(void *)v57 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v56 + 1) + 8 * v12);
        uint64_t v14 = [v13 viewElement];
        uint64_t v15 = [v14 persistenceKey];

        if ([v13 componentType] == 19)
        {
          v16 = [*(id *)(a1 + 32) _createSectionsForExpandPageComponent:v13 context:v51 newSections:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) sectionCount:v50 sectionsByViewElement:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) updateStyle:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
          uint64_t v17 = [v16 objectAtIndex:3];
          uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
          long long v19 = *(void **)(v18 + 40);
          *(void *)(v18 + 40) = v17;

          long long v20 = [v16 objectAtIndex:4];
          uint64_t v50 = [v20 integerValue];

          long long v21 = [v16 objectAtIndex:1];
          *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += [v21 integerValue];

          long long v22 = [v16 objectAtIndex:0];
          *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += [v22 integerValue];

          uint64_t v23 = [v16 objectAtIndex:2];
          uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
          long long v25 = *(void **)(v24 + 40);
          *(void *)(v24 + 40) = v23;

          v26 = (void *)v15;
          goto LABEL_27;
        }
        if (v15)
        {
          uint64_t v27 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKey:v15];
          if (v27)
          {
            uint64_t v28 = (void *)v27;
            uint64_t v29 = v7;
            uint64_t v30 = (void *)v15;
            uint64_t v31 = *(int *)(v9 + 4020);
            uint64_t v32 = [*(id *)(*(void *)(a1 + 32) + v31) count];
            [v28 setBottomSection:0];
            [v28 setSectionIndex:v32];
            [v28 setTopSection:v50 == 0];
            v16 = v28;
            uint64_t v33 = [v28 updateWithContext:v51 pageComponent:v13];
            if (v33 == 2)
            {
              uint64_t v34 = (void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
              v26 = v30;
              BOOL v7 = v29;
              uint64_t v11 = v47;
              uint64_t v10 = v48;
LABEL_25:
              ++*v34;
            }
            else
            {
              v26 = v30;
              BOOL v7 = v29;
              uint64_t v11 = v47;
              uint64_t v10 = v48;
              if (v33 == 1)
              {
                uint64_t v34 = (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
                goto LABEL_25;
              }
            }
            [*(id *)(*(void *)(a1 + 32) + v31) addObject:v16];
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeObjectForKey:v26];
            ++v50;
            goto LABEL_27;
          }
        }
        uint64_t v49 = v12;
        uint64_t v35 = (void *)[*(id *)(a1 + 32) _newSectionsWithPageComponent:v13];
        uint64_t v36 = *(int *)(v9 + 4020);
        uint64_t v37 = [*(id *)(*(void *)(a1 + 32) + v36) count];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v38 = v35;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v53;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v53 != v41) {
                objc_enumerationMutation(v38);
              }
              uint64_t v43 = *(void **)(*((void *)&v52 + 1) + 8 * i);
              [v43 setBottomSection:0];
              [v43 _setContext:v51];
              [v43 setSectionIndex:v37 + i];
              [v43 setTopSection:v50 + i == 0];
              if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 1) {
                [v43 willAppearInContext:v51];
              }
              [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v43];
              [*(id *)(*(void *)(a1 + 32) + v36) addObject:v43];
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v52 objects:v60 count:16];
            v37 += i;
            v50 += i;
          }
          while (v40);
          BOOL v7 = v46;
          uint64_t v11 = v47;
          unint64_t v9 = 0x1EA2B5000;
        }
        v16 = v38;

        uint64_t v10 = v48;
        v26 = (void *)v15;
        uint64_t v12 = v49;
LABEL_27:

        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (!v10) {
        goto LABEL_31;
      }
    }
  }
  uint64_t v50 = 0;
LABEL_31:
  v44 = [*(id *)(*(void *)(a1 + 32) + *(int *)(v9 + 4020)) lastObject];
  [v44 setBottomSection:1];
  [v45 setNumberOfPageSections:v50];
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += v50;
}

- (void)setSKUIStackedBar:(id)a3
{
  id v5 = a3;
  p_stackedBar = (id *)&self->_stackedBar;
  id v7 = *p_stackedBar;
  if (*p_stackedBar != v5)
  {
    id v8 = v5;
    [v7 removeFromSuperview];
    objc_storeStrong(p_stackedBar, a3);
    id v5 = v8;
  }

  MEMORY[0x1F41817F8](v7, v5);
}

- (void)showOverlayWithProductPage:(id)a3 metricsPageEvent:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (self->_overlayController) {
    [(SKUIStorePageSectionsViewController *)self dismissOverlays];
  }
  id v7 = [[SKUIProductPageOverlayController alloc] initWithParentViewController:self];
  overlayController = self->_overlayController;
  self->_overlayController = v7;

  unint64_t v9 = self->_overlayController;
  uint64_t v10 = [(SKUIViewController *)self clientContext];
  [(SKUIProductPageOverlayController *)v9 setClientContext:v10];

  [(SKUIProductPageOverlayController *)self->_overlayController setDelegate:self];
  [(SKUIProductPageOverlayController *)self->_overlayController showWithInitialProductPage:v11 metricsPageEvent:v6];
  [(SKUIStorePageSectionsViewController *)self _setActiveProductPageOverlayController:self->_overlayController];
}

- (id)SKUIStackedBar
{
  return self->_stackedBar;
}

- (void)setUsePullToRefresh:(BOOL)a3
{
  refreshControl = self->_refreshControl;
  if (a3)
  {
    if (!refreshControl)
    {
      id v5 = (UIRefreshControl *)objc_opt_new();
      id v6 = self->_refreshControl;
      self->_refreshControl = v5;

      [(UIRefreshControl *)self->_refreshControl addTarget:self action:sel__startRefresh_ forControlEvents:4096];
      collectionView = self->_collectionView;
      if (collectionView)
      {
        id v8 = self->_refreshControl;
        [(SKUICollectionView *)collectionView setRefreshControl:v8];
      }
      return;
    }
  }
  else if (!refreshControl)
  {
    return;
  }
  if ([(UIRefreshControl *)refreshControl isRefreshing]) {
    [(UIRefreshControl *)self->_refreshControl endRefreshing];
  }
  [(UIRefreshControl *)self->_refreshControl removeFromSuperview];
  unint64_t v9 = self->_refreshControl;
  self->_refreshControl = 0;
}

- (void)_startRefresh:(id)a3
{
  p_pullToRefreshDelegate = &self->_pullToRefreshDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pullToRefreshDelegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)p_pullToRefreshDelegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_pullToRefreshDelegate);
      [v9 refresh:self->_collectionView refreshControl:self->_refreshControl];
    }
  }
}

- (void)_longPressAction:(id)a3
{
  id v9 = a3;
  BOOL v4 = [v9 state] == 1;
  id v5 = v9;
  if (v4)
  {
    [v9 locationInView:self->_collectionView];
    id v6 = -[SKUICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:");
    id v7 = v6;
    if (v6)
    {
      char v8 = -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", [v6 section]);
      [v8 collectionViewDidLongPressItemAtIndexPath:v7];
    }
    id v5 = v9;
  }
}

- (void)skui_viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  -[SKUIStorePageSectionsViewController _deselectCellsForAppearance:](self, "_deselectCellsForAppearance:");
  v5.receiver = self;
  v5.super_class = (Class)SKUIStorePageSectionsViewController;
  [(SKUIViewController *)&v5 skui_viewWillAppear:v3];
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 0;
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"overlayURLs"];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v6 addObject:v12];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    uint64_t v13 = (NSArray *)[v6 copy];
    initialOverlayURLs = self->_initialOverlayURLs;
    self->_initialOverlayURLs = v13;
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIStorePageSectionsViewController;
  [(SKUIStorePageSectionsViewController *)&v15 decodeRestorableStateWithCoder:v4];
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeOverlayController);
  id v6 = [WeakRetained URLs];

  if ([v6 count]) {
    [v4 encodeObject:v6 forKey:@"overlayURLs"];
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIStorePageSectionsViewController;
  [(SKUIStorePageSectionsViewController *)&v7 encodeRestorableStateWithCoder:v4];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  id v19 = (id)objc_msgSend(v3, "initWithFrame:");

  [(SKUIStorePageSectionsViewController *)self setView:v19];
  objc_super v5 = [(SKUIStorePageSectionsViewController *)self collectionView];
  [v5 setAutoresizingMask:18];
  [v19 bounds];
  objc_msgSend(v5, "setFrame:");
  [v19 addSubview:v5];
  id v6 = [v5 backgroundColor];
  [v19 setBackgroundColor:v6];

  if (self->_stackedBar)
  {
    [v19 bounds];
    double v8 = v7;
    double v10 = v9;
    double v11 = 0.0;
    if ([(SKUIStackedBar *)self->_stackedBar splitViewStyle])
    {
      uint64_t v12 = [(SKUIStorePageSectionsViewController *)self navigationController];
      uint64_t v13 = [v12 navigationBar];
      [v13 frame];
      double Height = CGRectGetHeight(v21);

      objc_super v15 = [MEMORY[0x1E4FB1438] sharedApplication];
      [v15 statusBarFrame];
      double v16 = CGRectGetHeight(v22);

      double v11 = Height + v16;
    }
    [(SKUIStackedBar *)self->_stackedBar setAutoresizingMask:2];
    -[SKUIStackedBar setFrame:](self->_stackedBar, "setFrame:", v8, v11, v10, 0.0);
    [v19 addSubview:self->_stackedBar];
  }
  if (__orbSupported)
  {
    long long v17 = [(SKUIStorePageSectionsViewController *)self registerForPreviewingWithDelegate:self sourceView:v5];
    viewControllerPreviewing = self->_viewControllerPreviewing;
    self->_viewControllerPreviewing = v17;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  initialOverlayURLs = self->_initialOverlayURLs;
  if (initialOverlayURLs)
  {
    if (!self->_overlayController)
    {
      id v6 = [[SKUIProductPageOverlayController alloc] initWithParentViewController:self];
      overlayController = self->_overlayController;
      self->_overlayController = v6;

      double v8 = self->_overlayController;
      double v9 = [(SKUIViewController *)self clientContext];
      [(SKUIProductPageOverlayController *)v8 setClientContext:v9];

      [(SKUIProductPageOverlayController *)self->_overlayController setDelegate:self];
      [(SKUIProductPageOverlayController *)self->_overlayController showWithInitialURLs:self->_initialOverlayURLs];
      [(SKUIStorePageSectionsViewController *)self _setActiveProductPageOverlayController:self->_overlayController];
      initialOverlayURLs = self->_initialOverlayURLs;
    }
    self->_initialOverlayURLs = 0;
  }
  [(SKUICollectionView *)self->_collectionView setClipsToBounds:!self->_rendersWithPerspective];
  [(SKUIResourceLoader *)self->_resourceLoader enterForeground];
  v10.receiver = self;
  v10.super_class = (Class)SKUIStorePageSectionsViewController;
  [(SKUIStorePageSectionsViewController *)&v10 viewDidAppear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(SKUIStorePageSectionsViewController *)self _invalidateIfLastKnownWidthChanged];
  objc_super v5 = [(SKUICollectionView *)self->_collectionView collectionViewLayout];
  id v6 = [(SKUIStorePageSectionsViewController *)self _currentBackdropGroupName];
  [v5 setBackdropGroupName:v6];

  [(SKUIStorePageSectionsViewController *)self _deselectCellsForAppearance:v3];
  [(SKUIStorePageSectionsViewController *)self _beginActiveImpressionsForImpressionableViewElements];
  if (self->_itemsChangedStateWhileDisappeared)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v7 = self->_sections;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v11++) requestLayoutWithReloadReason:2];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    uint64_t v12 = [(SKUIStorePageSectionsViewController *)self _textLayoutCache];
    [v12 commitLayoutRequests];

    self->_itemsChangedStateWhileDisappeared = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIStorePageSectionsViewController;
  [(SKUIViewController *)&v13 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SKUIStorePageSectionsViewController *)self _invalidateIfLastKnownWidthChanged];
  objc_super v5 = NSNumber;
  id v6 = [(SKUIStorePageSectionsViewController *)self view];
  [v6 bounds];
  *(float *)&double v8 = v7;
  uint64_t v9 = [v5 numberWithFloat:v8];
  lastKnownWidth = self->_lastKnownWidth;
  self->_lastKnownWidth = v9;

  [(SKUICollectionView *)self->_collectionView setClipsToBounds:1];
  [(SKUIStorePageSectionsViewController *)self _endAllPendingActiveImpression];
  v11.receiver = self;
  v11.super_class = (Class)SKUIStorePageSectionsViewController;
  [(SKUIStorePageSectionsViewController *)&v11 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIStorePageSectionsViewController;
  [(SKUIStorePageSectionsViewController *)&v4 viewDidDisappear:a3];
  [(SKUIResourceLoader *)self->_resourceLoader enterBackground];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = NSNumber;
  id v8 = a4;
  uint64_t v9 = [(SKUIStorePageSectionsViewController *)self view];
  [v9 bounds];
  *(float *)&double v11 = v10;
  uint64_t v12 = [v7 numberWithFloat:v11];
  lastKnownWidth = self->_lastKnownWidth;
  self->_lastKnownWidth = v12;

  v14.receiver = self;
  v14.super_class = (Class)SKUIStorePageSectionsViewController;
  -[SKUIStorePageSectionsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SKUIStorePageSectionsViewController;
  id v4 = a3;
  [(SKUIStorePageSectionsViewController *)&v12 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "userInterfaceStyle", v12.receiver, v12.super_class);

  id v6 = [(SKUIStorePageSectionsViewController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    id v8 = [(SKUICollectionView *)self->_collectionView collectionViewLayout];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      double v10 = [v9 indexPathsForPinningItems];
      if ([v10 count])
      {
        id v11 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
        [v11 setInvalidateFlowLayoutAttributes:0];
        [v11 setInvalidateFlowLayoutDelegateMetrics:0];
        [v11 setInvalidateItemPinningLayoutInformation:0];
        [v11 setInvalidatePinnedBackdropViewStyle:1];
        [v11 invalidateDecorationElementsOfKind:0x1F1C95828 atIndexPaths:v10];
        [v9 invalidateLayoutWithContext:v11];
      }
    }
  }
}

- (void)collectionView:(id)a3 editorialView:(id)a4 didSelectLink:(id)a5
{
  id v25 = a5;
  id v8 = a4;
  id v9 = a3;
  [v8 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  long long v18 = [v8 superview];

  objc_msgSend(v9, "convertRect:fromView:", v18, v11, v13, v15, v17);
  double v20 = v19;
  double v22 = v21;

  uint64_t v23 = objc_msgSend(v9, "indexPathForItemAtPoint:", v20, v22);

  if (v23)
  {
    uint64_t v24 = -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", [v23 section]);
    [v24 showPageWithLink:v25];
  }
}

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__SKUIStorePageSectionsViewController_itemStateCenter_itemStatesChanged___block_invoke;
  v7[3] = &unk_1E6421FF8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __73__SKUIStorePageSectionsViewController_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v23 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  double v20 = [*(id *)(*(void *)(a1 + 32) + 1064) indexPathsForVisibleItems];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v21 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v34;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v2;
        uint64_t v3 = *(void *)(*((void *)&v33 + 1) + 8 * v2);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v4 = v20;
        uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v30 != v7) {
                objc_enumerationMutation(v4);
              }
              id v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              uint64_t v10 = [v9 section];
              double v11 = [*(id *)(*(void *)(a1 + 32) + 1304) objectAtIndex:v10];
              if ([v11 updateCellWithIndexPath:v9 itemState:v3 animated:0])
              {
                [v24 addObject:v9];
                [v23 addIndex:v10];
              }
            }
            uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v6);
        }

        uint64_t v2 = v22 + 1;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v21);
  }

  if ([v23 count])
  {
    double v12 = [*(id *)(a1 + 32) view];
    double v13 = [v12 window];

    if (!v13) {
      *(unsigned char *)(*(void *)(a1 + 32) + 1352) = 1;
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __73__SKUIStorePageSectionsViewController_itemStateCenter_itemStatesChanged___block_invoke_2;
    v27[3] = &unk_1E6424780;
    v27[4] = *(void *)(a1 + 32);
    id v15 = v14;
    id v28 = v15;
    [v23 enumerateIndexesUsingBlock:v27];
    double v16 = [*(id *)(a1 + 32) _textLayoutCache];
    [v16 commitLayoutRequests];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __73__SKUIStorePageSectionsViewController_itemStateCenter_itemStatesChanged___block_invoke_3;
    v25[3] = &unk_1E64247A8;
    v25[4] = *(void *)(a1 + 32);
    id v26 = v15;
    id v17 = v15;
    [v24 enumerateObjectsUsingBlock:v25];
  }
}

void __73__SKUIStorePageSectionsViewController_itemStateCenter_itemStatesChanged___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1304) objectAtIndex:a2];
  if ([v4 requestLayoutWithReloadReason:2]) {
    [*(id *)(a1 + 40) addIndex:a2];
  }
}

void __73__SKUIStorePageSectionsViewController_itemStateCenter_itemStatesChanged___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 section];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1304) objectAtIndex:v3];
  if ([*(id *)(a1 + 40) containsIndex:v3])
  {
    [v4 reloadVisibleCellsWithReason:2];
    [*(id *)(a1 + 40) removeIndex:v3];
  }
  else
  {
    [v4 reloadCellWithIndexPath:v5 reason:2];
  }
}

- (void)layoutCacheDidFinishBatch:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__SKUIStorePageSectionsViewController_layoutCacheDidFinishBatch___block_invoke;
  v3[3] = &unk_1E6422020;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

uint64_t __65__SKUIStorePageSectionsViewController_layoutCacheDidFinishBatch___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 1304);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "invalidateCachedLayoutInformation", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 1064) reloadData];
}

- (void)productPageOverlayDidDismiss:(id)a3
{
  if (self->_overlayController == a3)
  {
    [(SKUIStorePageSectionsViewController *)self _setActiveProductPageOverlayController:0];
    [(SKUIProductPageOverlayController *)self->_overlayController setDelegate:0];
    overlayController = self->_overlayController;
    self->_overlayController = 0;

    if (![(NSMutableArray *)self->_sections count])
    {
      SKUIViewControllerGetAncestorTabBarController(self);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = [v6 transientViewController];
      if (v5 && SKUIViewControllerIsDescendent(self, v5)) {
        [v6 setTransientViewController:0 animated:0];
      }
    }
  }
}

- (id)backgroundColorForSection:(int64_t)a3
{
  if ([(NSMutableArray *)self->_sections count] <= (unint64_t)a3)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_sections objectAtIndex:a3];
    id v6 = [v5 backgroundColorForSection];
  }

  return v6;
}

- (BOOL)collectionView:(id)a3 canScrollCellAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = v7;
  indexPathOfEditedCell = self->_indexPathOfEditedCell;
  if (!indexPathOfEditedCell
    || (uint64_t v10 = objc_msgSend(v7, "compare:"), indexPathOfEditedCell = self->_indexPathOfEditedCell, !v10))
  {
    if ([(NSIndexPath *)indexPathOfEditedCell compare:v8] == NSOrderedSame) {
      goto LABEL_6;
    }
LABEL_10:
    BOOL v13 = 0;
    goto LABEL_11;
  }
  long long v11 = [(SKUICollectionView *)self->_collectionView cellForItemAtIndexPath:indexPathOfEditedCell];
  if (([v11 isDeleteButtonHidden] & 1) == 0)
  {
    if (([v11 isScrollingCellToHideActionButton] & 1) == 0) {
      [v11 hideDeleteButton];
    }

    goto LABEL_10;
  }
  double v12 = self->_indexPathOfEditedCell;
  self->_indexPathOfEditedCell = 0;

  [(UITapGestureRecognizer *)self->_collectionViewTapGestureRecognizer setEnabled:0];
LABEL_6:
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (void)collectionView:(id)a3 didEndEditingItemAtIndexPath:(id)a4
{
  indexPathOfEditedCell = self->_indexPathOfEditedCell;
  self->_indexPathOfEditedCell = 0;

  collectionViewTapGestureRecognizer = self->_collectionViewTapGestureRecognizer;

  [(UITapGestureRecognizer *)collectionViewTapGestureRecognizer setEnabled:0];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 pinningContentInsetForItemAtIndexPath:(id)a5
{
  sections = self->_sections;
  id v6 = a5;
  id v7 = -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", [v6 section]);
  [v7 pinningContentInsetForItemAtIndexPath:v6];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (int64_t)collectionView:(id)a3 layout:(id)a4 pinningStyleForItemAtIndexPath:(id)a5
{
  sections = self->_sections;
  id v6 = a5;
  id v7 = -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", [v6 section]);
  int64_t v8 = [v7 pinningStyleForItemAtIndexPath:v6];

  return v8;
}

- (int64_t)collectionView:(id)a3 layout:(id)a4 pinningGroupForItemAtIndexPath:(id)a5
{
  sections = self->_sections;
  id v6 = a5;
  id v7 = -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", [v6 section]);
  int64_t v8 = [v7 pinningGroupForItemAtIndexPath:v6];

  return v8;
}

- (int64_t)collectionView:(id)a3 layout:(id)a4 pinningTransitionStyleForItemAtIndexPath:(id)a5
{
  sections = self->_sections;
  id v6 = a5;
  id v7 = -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", [v6 section]);
  int64_t v8 = [v7 pinningTransitionStyleForItemAtIndexPath:v6];

  return v8;
}

- (void)collectionView:(id)a3 layout:(id)a4 willApplyLayoutAttributes:(id)a5
{
  id v8 = a5;
  if (![v8 representedElementCategory])
  {
    id v6 = [v8 indexPath];
    id v7 = -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", [v6 section]);
    [v7 collectionViewWillApplyLayoutAttributes:v8];
  }
}

- (void)collectionView:(id)a3 willBeginEditingItemAtIndexPath:(id)a4
{
  id v10 = a4;
  objc_storeStrong((id *)&self->_indexPathOfEditedCell, a4);
  id v6 = [(SKUICollectionView *)self->_collectionView indexPathsForSelectedItems];
  id v7 = v6;
  if (v6 && [v6 count])
  {
    collectionView = self->_collectionView;
    double v9 = [v7 firstObject];
    [(SKUICollectionView *)collectionView deselectItemAtIndexPath:v9 animated:0];
  }
  [(UITapGestureRecognizer *)self->_collectionViewTapGestureRecognizer setEnabled:1];
}

- (id)indexPathsForPinningItemsInCollectionView:(id)a3 layout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3010000000;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  id v24 = &unk_1C1D0F257;
  id v8 = [(SKUIStorePageSectionsViewController *)self _collectionViewSublayouts];
  if ((unint64_t)[v8 count] > 1)
  {
    splitsDescription = self->_splitsDescription;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __88__SKUIStorePageSectionsViewController_indexPathsForPinningItemsInCollectionView_layout___block_invoke;
    v17[3] = &unk_1E64247D0;
    id v18 = v7;
    id v19 = v8;
    double v20 = &v21;
    [(SKUIStorePageSplitsDescription *)splitsDescription enumerateSplitsUsingBlock:v17];

    id v10 = v22;
    uint64_t v9 = v22[5];
  }
  else
  {
    uint64_t v9 = [(NSMutableArray *)self->_sections count];
    id v10 = v22;
    v22[5] = v9;
  }
  unint64_t v12 = v10[4];
  if (v12 >= v9 + v12)
  {
    double v13 = 0;
  }
  else
  {
    double v13 = 0;
    do
    {
      double v14 = [(NSMutableArray *)self->_sections objectAtIndex:v12];
      double v15 = [v14 indexPathsForPinningItems];
      if ([v15 count])
      {
        if (!v13) {
          double v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
        }
        [v13 addObjectsFromArray:v15];
      }

      ++v12;
    }
    while (v12 < v22[5] + v22[4]);
  }

  _Block_object_dispose(&v21, 8);

  return v13;
}

void __88__SKUIStorePageSectionsViewController_indexPathsForPinningItemsInCollectionView_layout___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 numberOfPageSections];
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) objectAtIndex:a3];

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v8 == v9)
  {
    *(void *)(v10 + 40) = v7;
    *a4 = 1;
  }
  else
  {
    *(void *)(v10 + 32) += v7;
  }
}

- (id)indexPathsForGradientItemsInCollectionView:(id)a3 layout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3010000000;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  id v24 = &unk_1C1D0F257;
  id v8 = [(SKUIStorePageSectionsViewController *)self _collectionViewSublayouts];
  if ((unint64_t)[v8 count] > 1)
  {
    splitsDescription = self->_splitsDescription;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __89__SKUIStorePageSectionsViewController_indexPathsForGradientItemsInCollectionView_layout___block_invoke;
    v17[3] = &unk_1E64247D0;
    id v18 = v7;
    id v19 = v8;
    double v20 = &v21;
    [(SKUIStorePageSplitsDescription *)splitsDescription enumerateSplitsUsingBlock:v17];

    uint64_t v10 = v22;
    uint64_t v9 = v22[5];
  }
  else
  {
    uint64_t v9 = [(NSMutableArray *)self->_sections count];
    uint64_t v10 = v22;
    v22[5] = v9;
  }
  unint64_t v12 = v10[4];
  if (v12 >= v9 + v12)
  {
    double v13 = 0;
  }
  else
  {
    double v13 = 0;
    do
    {
      double v14 = [(NSMutableArray *)self->_sections objectAtIndex:v12];
      double v15 = [v14 indexPathsForBackgroundItems];
      if ([v15 count])
      {
        if (!v13) {
          double v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
        }
        [v13 addObjectsFromArray:v15];
      }

      ++v12;
    }
    while (v12 < v22[5] + v22[4]);
  }

  _Block_object_dispose(&v21, 8);

  return v13;
}

void __89__SKUIStorePageSectionsViewController_indexPathsForGradientItemsInCollectionView_layout___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 numberOfPageSections];
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) objectAtIndex:a3];

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v8 == v9)
  {
    *(void *)(v10 + 40) = v7;
    *a4 = 1;
  }
  else
  {
    *(void *)(v10 + 32) += v7;
  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  uint64_t v7 = -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", a5, a4);
  if ([(NSMutableArray *)self->_sections count] <= (unint64_t)(a5 + 1))
  {
    id v8 = 0;
  }
  else
  {
    id v8 = -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:");
  }
  uint64_t v9 = [v7 pageComponent];
  uint64_t v10 = [v9 viewElement];
  uint64_t v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    unint64_t v12 = [v8 pageComponent];
    double v13 = [v12 viewElement];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();

    if (v14 == v15)
    {
      double v21 = 5.0;
      double v17 = 0.0;
      double v19 = 0.0;
      double v23 = 0.0;
      goto LABEL_8;
    }
  }
  else
  {
  }
  [v7 sectionContentInset];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
LABEL_8:

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.right = v27;
  result.bottom = v26;
  result.left = v25;
  result.top = v24;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(a5, "section", a3, a4)), "cellSizeForIndexPath:", a5);
  double v8 = v7;
  if (Width < 0.00000011920929)
  {
    [a3 bounds];
    double Width = CGRectGetWidth(v11);
  }
  double v9 = 1.0;
  if (v8 >= 0.00000011920929) {
    double v9 = v8;
  }
  result.double height = v9;
  result.double width = Width;
  return result;
}

- (BOOL)performTestWithName:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasPrefix:@"Scroll"])
  {
    double v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    double v9 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v10 = [v9 dateByAddingTimeInterval:4.0];
    [v8 runUntilDate:v10];

    CGRect v11 = [v7 objectForKeyedSubscript:@"iterations"];
    unint64_t v12 = [v7 objectForKeyedSubscript:@"offset"];
    collectionView = self->_collectionView;
    uint64_t v14 = [v11 intValue];
    uint64_t v15 = [v12 intValue];
    [(SKUICollectionView *)self->_collectionView contentSize];
    [(SKUICollectionView *)collectionView _performScrollTest:v6 iterations:v14 delta:v15 length:(int)v16];
  }
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", [v7 section]);
  double v9 = [v8 cellForIndexPath:v7];
  uint64_t v10 = [(SKUIStorePageSectionsViewController *)self metricsController];
  CGRect v11 = [v10 activeImpressionsSession];

  if (v11) {
    [v8 addImpressionsForIndexPath:v7 toSession:v11];
  }
  if (!v9)
  {
    double v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:v7];
  }

  return v9;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(NSMutableArray *)self->_sections objectAtIndex:a4];
  int64_t v5 = [v4 numberOfCells];

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return [(NSMutableArray *)self->_sections count];
}

- (void)collectionView:(id)a3 didConfirmButtonElement:(id)a4 withClickInfo:(id)a5 forItemAtIndexPath:(id)a6
{
  sections = self->_sections;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", [v9 section]);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v12 collectionViewDidConfirmButtonElement:v11 withClickInfo:v10 forItemAtIndexPath:v9];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  unint64_t v8 = [v7 section];
  if (v8 < [(NSMutableArray *)self->_sections count])
  {
    id v9 = [(NSMutableArray *)self->_sections objectAtIndex:v8];
    [v9 collectionViewWillDisplayCellForItemAtIndexPath:v7];
    [v9 registerContextActionsForCell:v10 indexPath:v7 viewController:self];
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  unint64_t v8 = [v7 section];
  if (v8 < [(NSMutableArray *)self->_sections count])
  {
    id v9 = [(NSMutableArray *)self->_sections objectAtIndex:v8];
    [v9 collectionViewDidEndDisplayingCellForItemAtIndexPath:v7];
    [v9 unregisterContextActionsForCell:v10 indexPath:v7 viewController:self];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  sections = self->_sections;
  id v5 = a4;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", [v5 section]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 collectionViewDidSelectItemAtIndexPath:v5];
}

- (void)collectionView:(id)a3 expandEditorialForLabelElement:(id)a4 indexPath:(id)a5
{
  sections = self->_sections;
  id v7 = a5;
  id v8 = a4;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", [v7 section]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 expandEditorialForLabelElement:v8 indexPath:v7];
}

- (void)collectionView:(id)a3 performDefaultActionForViewElement:(id)a4 indexPath:(id)a5
{
  sections = self->_sections;
  id v7 = a4;
  -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", [a5 section]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 performDefaultActionForViewElement:v7];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  sections = self->_sections;
  id v5 = a4;
  id v6 = -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", [v5 section]);
  char v7 = [v6 collectionViewShouldHighlightItemAtIndexPath:v5];

  return v7;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  sections = self->_sections;
  id v5 = a4;
  id v6 = -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", [v5 section]);
  char v7 = [v6 collectionViewShouldSelectItemAtIndexPath:v5];

  return v7;
}

- (void)itemCollectionView:(id)a3 didConfirmItemOfferForCell:(id)a4
{
  id v5 = [a3 indexPathForCell:a4];
  if (v5)
  {
    id v7 = v5;
    id v6 = -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", [v5 section]);
    [v6 collectionViewDidConfirmItemOfferAtIndexPath:v7];

    id v5 = v7;
  }
}

- (void)itemCollectionView:(id)a3 didTapVideoForCollectionViewCell:(id)a4
{
  id v5 = [a3 indexPathForCell:a4];
  if (v5)
  {
    id v7 = v5;
    id v6 = -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", [v5 section]);
    [v6 collectionViewDidTapVideoAtIndexPath:v7];

    id v5 = v7;
  }
}

- (void)skuiCollectionViewWillLayoutSubviews:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIStorePageSectionsViewController *)self view];
  [v5 bounds];
  -[SKUIStorePageSectionsViewController _setPageSize:](self, "_setPageSize:", v6, v7);

  int64_t lastInterfaceOrientation = self->_lastInterfaceOrientation;
  id v9 = [MEMORY[0x1E4FB1438] sharedApplication];
  if (lastInterfaceOrientation == [v9 statusBarOrientation])
  {
    BOOL didInitialReload = self->_didInitialReload;

    if (didInitialReload)
    {
      id v11 = [MEMORY[0x1E4FB1438] sharedApplication];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __76__SKUIStorePageSectionsViewController_skuiCollectionViewWillLayoutSubviews___block_invoke;
      v62[3] = &unk_1E6422020;
      v62[4] = self;
      [v11 _performBlockAfterCATransactionCommits:v62];

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v12 = [MEMORY[0x1E4FB1438] sharedApplication];
  self->_int64_t lastInterfaceOrientation = [v12 statusBarOrientation];

  self->_BOOL didInitialReload = 1;
  double v13 = NSNumber;
  uint64_t v14 = [(SKUIStorePageSectionsViewController *)self view];
  [v14 bounds];
  *(float *)&double v16 = v15;
  double v17 = [v13 numberWithFloat:v16];
  lastKnowndouble Width = self->_lastKnownWidth;
  self->_lastKnowndouble Width = v17;

  [(SKUICollectionView *)self->_collectionView reloadData];
  [(SKUIStorePageSectionsViewController *)self _reloadCollectionView];
  [(SKUIStorePageSectionsViewController *)self _scrollFirstAppearanceSectionToView];
LABEL_6:
  if (skuiCollectionViewWillLayoutSubviews__sLayoutRespondsToFrame == 255) {
    skuiCollectionViewWillLayoutSubviews__sLayoutRespondsToFrame = [MEMORY[0x1E4FB15D0] instancesRespondToSelector:sel__frame];
  }
  double v19 = [(SKUIStorePageSplitsDescription *)self->_splitsDescription leftSplit];
  if (v19
    && ([(SKUIStorePageSplitsDescription *)self->_splitsDescription rightSplit],
        double v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v20)
    && ([v19 dividerColor], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v22 = (void *)v21;
    if (skuiCollectionViewWillLayoutSubviews__sLayoutRespondsToFrame)
    {
      splitsDividerView = self->_splitsDividerView;
      if (!splitsDividerView)
      {
        double v24 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        double v25 = self->_splitsDividerView;
        self->_splitsDividerView = v24;

        [v4 addSubview:self->_splitsDividerView];
        splitsDividerView = self->_splitsDividerView;
      }
      [(UIView *)splitsDividerView setBackgroundColor:v22];
      uint64_t v56 = 0;
      long long v57 = (CGRect *)&v56;
      uint64_t v58 = 0x4010000000;
      long long v59 = &unk_1C1D0F257;
      long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      long long v60 = *MEMORY[0x1E4F1DB28];
      long long v61 = v26;
      double v27 = [(SKUIStorePageSectionsViewController *)self _collectionViewSublayouts];
      splitsDescription = self->_splitsDescription;
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v51 = __76__SKUIStorePageSectionsViewController_skuiCollectionViewWillLayoutSubviews___block_invoke_2;
      long long v52 = &unk_1E64247D0;
      id v53 = v19;
      id v29 = v27;
      id v54 = v29;
      long long v55 = &v56;
      [(SKUIStorePageSplitsDescription *)splitsDescription enumerateSplitsUsingBlock:&v49];
      objc_msgSend(v4, "frame", v49, v50, v51, v52);
      double v31 = v30;
      long long v32 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v32 scale];
      double v34 = v33;

      int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
      CGFloat x = v57[1].origin.x;
      CGFloat y = v57[1].origin.y;
      CGFloat width = v57[1].size.width;
      CGFloat height = v57[1].size.height;
      double v40 = 1.0 / v34;
      if (ShouldReverseLayoutDirection) {
        double MinX = CGRectGetMinX(*(CGRect *)&x);
      }
      else {
        double MinX = CGRectGetMaxX(*(CGRect *)&x) - v40;
      }
      double MinY = CGRectGetMinY(v57[1]);
      [v4 contentOffset];
      double v44 = v43;
      [v4 contentInset];
      double v46 = v44 + v45;
      double v47 = v57[1].origin.y;
      if (v47 <= 0.00000011920929)
      {
        double v48 = v46;
      }
      else
      {
        double v48 = 0.0;
        if (v46 >= v47) {
          double v48 = v46 - v47;
        }
      }
      -[UIView setFrame:](self->_splitsDividerView, "setFrame:", MinX, MinY + v48, v40, v31);
      [(UIView *)self->_splitsDividerView setHidden:0];

      _Block_object_dispose(&v56, 8);
    }
  }
  else
  {
    [(UIView *)self->_splitsDividerView setHidden:1];
    double v22 = 0;
  }
}

uint64_t __76__SKUIStorePageSectionsViewController_skuiCollectionViewWillLayoutSubviews___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateIfLastKnownWidthChanged];
}

void __76__SKUIStorePageSectionsViewController_skuiCollectionViewWillLayoutSubviews___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(a1 + 32) == a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [v11 _frame];
    double v6 = *(void **)(*(void *)(a1 + 48) + 8);
    void v6[4] = v7;
    v6[5] = v8;
    v6[6] = v9;
    v6[7] = v10;
    *a4 = 1;
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  if ([(SKUIResourceLoader *)self->_resourceLoader isIdle]) {
    [(SKUIStorePageSectionsViewController *)self _prefetchArtworkForVisibleSections];
  }
  if (([v4 isDragging] & 1) == 0
    && ([v4 isTracking] & 1) == 0
    && ([v4 isDecelerating] & 1) == 0)
  {
    [(SKUIStackedBar *)self->_stackedBar animateToFullSizeIfNecessary];
  }
  self->_scrollOffsetHasChanged = 1;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    if ([(SKUIResourceLoader *)self->_resourceLoader isIdle]) {
      [(SKUIStorePageSectionsViewController *)self _prefetchArtworkForVisibleSections];
    }
    [(SKUIStackedBar *)self->_stackedBar animateToFullSizeIfNecessary];
  }
  self->_scrollOffsetHasChanged = 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v8 = a3;
  if (self->_indexPathOfEditedCell)
  {
    id v4 = -[SKUICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:");
    if (([v4 isScrollingCellToHideActionButton] & 1) == 0) {
      [v4 hideDeleteButton];
    }
  }
  if (self->_delegateWantsDidScroll)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sectionsViewControllerDidScroll:self];
  }
  if (self->_rendersWithParallax) {
    SKUICollectionViewUpdatePerspectiveCells(self->_collectionView, 0);
  }
  stackedBar = self->_stackedBar;
  [v8 contentOffset];
  [(SKUIStackedBar *)stackedBar setOffset:v7];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a5->x;
  double y = a5->y;
  id v8 = -[SKUICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:", a3, a5->x, y);
  uint64_t v9 = [v8 item];
  uint64_t v10 = [v8 section];
  [(SKUICollectionView *)self->_collectionView contentInset];
  double v12 = v11;
  [(SKUICollectionView *)self->_collectionView bounds];
  double v14 = y + v13;
  [(SKUICollectionView *)self->_collectionView contentSize];
  if (v14 >= v15 - v12) {
    double v16 = v15 - v12;
  }
  else {
    double v16 = v14;
  }
  double v17 = -[SKUICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:", x, v16);
  uint64_t v18 = [v17 item];
  uint64_t v19 = [v17 section];
  double v30 = v8;
  uint64_t v20 = [v8 section];
  uint64_t v21 = [(NSMutableArray *)self->_sections count] - 1;
  uint64_t v22 = [v17 section];
  if (v21 >= v22) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = v21;
  }
  if (v20 <= v23)
  {
    do
    {
      double v24 = [(NSMutableArray *)self->_sections objectAtIndex:v20];
      uint64_t v31 = v10;
      uint64_t v32 = v9;
      uint64_t v33 = v19;
      uint64_t v34 = v18;
      objc_msgSend(v24, "collectionViewWillScrollToOffset:visibleRange:", &v31, x, y);

      uint64_t v25 = [(NSMutableArray *)self->_sections count] - 1;
      uint64_t v26 = [v17 section];
      if (v25 >= v26) {
        uint64_t v27 = v26;
      }
      else {
        uint64_t v27 = v25;
      }
    }
    while (v20++ < v27);
  }
  if (self->_delegateWantsWillScrollToOffsetVisibleRange)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v31 = v10;
    uint64_t v32 = v9;
    uint64_t v33 = v19;
    uint64_t v34 = v18;
    objc_msgSend(WeakRetained, "sectionsViewController:willScrollToOffset:visibleRange:", self, &v31, x, y);
  }
  self->_scrollOffsetHasChanged = 1;
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [v7 sourceView];
  -[SKUICollectionView convertPoint:fromView:](self->_collectionView, "convertPoint:fromView:", v8, x, y);
  uint64_t v9 = -[SKUICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:");
  unint64_t v10 = [v9 section];
  if (v10 >= [(NSMutableArray *)self->_sections count])
  {
    double v12 = 0;
  }
  else
  {
    double v11 = [(NSMutableArray *)self->_sections objectAtIndex:v10];
    double v12 = objc_msgSend(v11, "previewingContext:viewControllerForLocation:", v7, x, y);
  }

  return v12;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = [(SKUIStorePageSectionsViewController *)self navigationController];
  id v8 = [(SKUIStorePageSectionsViewController *)self parentViewController];
  if (v8)
  {
    while (1)
    {
      uint64_t v9 = [v8 navigationController];
      unint64_t v10 = [(SKUIViewController *)self clientContext];
      double v11 = [v10 applicationController];
      double v12 = [v11 rootViewController];
      BOOL IsDescendent = SKUIViewControllerIsDescendent(v9, v12);

      if (!IsDescendent)
      {

        goto LABEL_11;
      }
      if (v9) {
        break;
      }
      if ([v8 conformsToProtocol:&unk_1F1E3B8C8])
      {
        id v14 = [v8 overlayNavigationController];
        goto LABEL_7;
      }
LABEL_8:
      uint64_t v16 = [v8 parentViewController];

      id v8 = (void *)v16;
      if (!v16) {
        goto LABEL_11;
      }
    }
    id v14 = v9;
LABEL_7:
    id v15 = v14;

    id v7 = v15;
    goto LABEL_8;
  }
LABEL_11:
  id v17 = v6;
  uint64_t v18 = v17;
  if ([v17 conformsToProtocol:&unk_1F1E23608])
  {
    uint64_t v18 = [v17 previewCommitViewController];

    if (objc_opt_respondsToSelector()) {
      [v17 prepareForCommit];
    }
  }
  [v7 pushViewController:v18 animated:1];
}

- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v22 = a3;
  id v9 = a5;
  unint64_t v10 = [(SKUIStorePageSectionsViewController *)self collectionView];
  objc_msgSend(v10, "convertPoint:fromView:", v9, x, y);
  double v12 = v11;
  double v14 = v13;

  id v15 = [(SKUIStorePageSectionsViewController *)self collectionView];
  uint64_t v16 = objc_msgSend(v15, "indexPathForItemAtPoint:", v12, v14);

  id v17 = [(SKUIStorePageSectionsViewController *)self collectionView];
  uint64_t v18 = [v17 cellForItemAtIndexPath:v16];

  id v19 = [v22 presentationController];
  [v19 setSourceView:v18];
  [v18 bounds];
  objc_msgSend(v19, "setSourceRect:");
  unint64_t v20 = [v16 section];
  if (v20 < [(NSMutableArray *)self->_sections count])
  {
    uint64_t v21 = [(NSMutableArray *)self->_sections objectAtIndex:v20];
    objc_msgSend(v21, "willPresentPreviewViewController:forLocation:inSourceView:", v22, v9, x, y);
  }
}

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  id v4 = objc_alloc_init((Class)a1);
  id v5 = +[SKUIStateRestorationContext sharedContext];
  id v6 = [v5 clientContext];
  [v4 setClientContext:v6];

  return v4;
}

- (void)_beginIgnoringSectionChanges
{
}

- (void)_endIgnoringSectionChanges
{
  int64_t ignoreSectionsChangeCount = self->_ignoreSectionsChangeCount;
  BOOL v3 = ignoreSectionsChangeCount == 1;
  BOOL v4 = ignoreSectionsChangeCount < 1;
  int64_t v5 = ignoreSectionsChangeCount - 1;
  if (!v4)
  {
    self->_int64_t ignoreSectionsChangeCount = v5;
    if (v3)
    {
      if (self->_deferredSplitsDescription)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v8 = self->_deferredSplitsDescription;
        }
        else {
          id v8 = 0;
        }
        id deferredSplitsDescription = self->_deferredSplitsDescription;
        self->_id deferredSplitsDescription = 0;

        [(SKUIStorePageSectionsViewController *)self setSectionsWithSplitsDescription:v8];
      }
    }
  }
}

- (void)_insertSectionsWithComponents:(id)a3 afterSection:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(NSMutableArray *)self->_sections indexOfObjectIdenticalTo:a4];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    unint64_t v20 = [(SKUIStorePageSectionsViewController *)self _splitForSectionIndex:v7];
    id v9 = [v20 sectionContext];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v6;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = v8 + 1;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v10);
          }
          id v17 = [(SKUIStorePageSectionsViewController *)self defaultSectionForComponent:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          uint64_t v18 = v17;
          if (v17)
          {
            [v17 setSectionIndex:v14];
            [v18 _setContext:v9];
            [v18 willAppearInContext:v9];
            [(NSMutableArray *)self->_sections insertObject:v18 atIndex:v14++];
            ++v13;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }
    else
    {
      uint64_t v13 = 0;
    }

    objc_msgSend(v20, "setNumberOfPageSections:", objc_msgSend(v20, "numberOfPageSections") + v13);
    id v19 = [(SKUIStorePageSectionsViewController *)self _textLayoutCache];
    [v19 commitLayoutRequests];

    [(SKUIStorePageSectionsViewController *)self _updateSectionsAfterMenuChange];
    id v6 = v21;
  }
}

- (void)_pageSectionDidDismissOverlayController:(id)a3
{
  p_activeOverlayController = &self->_activeOverlayController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeOverlayController);
  id v7 = a3;

  if (WeakRetained == v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 sectionsViewControllerDidDismissOverlayController:self];
    }
    objc_storeWeak((id *)p_activeOverlayController, 0);
  }
}

- (void)_setActiveProductPageOverlayController:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_activeOverlayController, v4);
}

- (void)_setRendersWithPerspective:(BOOL)a3
{
  if (self->_rendersWithPerspective != a3)
  {
    self->_rendersWithPerspective = a3;
    id v4 = [(SKUICollectionView *)self->_collectionView collectionViewLayout];
    [v4 setRendersWithPerspective:self->_rendersWithPerspective];
    [(SKUICollectionView *)self->_collectionView setClipsToBounds:!self->_rendersWithPerspective];
    if (self->_rendersWithPerspective) {
      SKUICollectionViewUpdatePerspectiveCells(self->_collectionView, 0);
    }
  }
}

- (void)_setRendersWithParallax:(BOOL)a3
{
  if (self->_rendersWithParallax != a3) {
    self->_rendersWithParalladouble x = a3;
  }
}

- (void)_setSelectedIndex:(int64_t)a3 forMenuSection:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 pageComponent];
  id v8 = [(SKUIStorePageSectionsViewController *)self _menuContextForMenuComponent:v7];
  uint64_t v9 = [v8 selectedIndex];
  if (v9 != a3)
  {
    id v10 = [v7 childComponentsForIndex:v9];
    uint64_t v20 = [v10 count];

    id v22 = v6;
    uint64_t v19 = [v6 sectionIndex];
    id v21 = -[SKUIStorePageSectionsViewController _splitForSectionIndex:](self, "_splitForSectionIndex:");
    uint64_t v11 = [v21 sectionContext];
    uint64_t v12 = [(SKUIStorePageSectionsViewController *)self _childSectionsForMenuComponent:v7 selectedIndex:a3];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          [v17 _setContext:v11];
          [v17 willAppearInContext:v11];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }
    -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](self->_sections, "replaceObjectsInRange:withObjectsFromArray:", v19 + 1, v20, v12);
    [v8 setSelectedIndex:a3];
    objc_msgSend(v21, "setNumberOfPageSections:", objc_msgSend(v21, "numberOfPageSections") - v20 + objc_msgSend(v12, "count"));
    uint64_t v18 = [(SKUIStorePageSectionsViewController *)self _textLayoutCache];
    [v18 commitLayoutRequests];

    [(SKUIStorePageSectionsViewController *)self _updateSectionsAfterMenuChange];
    id v6 = v22;
  }
}

- (void)_updateSectionsForIndex:(int64_t)a3 menuSection:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 pageComponent];
  id v8 = [(SKUIStorePageSectionsViewController *)self _menuContextForMenuComponent:v7];
  if ([v8 selectedIndex] == a3)
  {
    uint64_t v9 = [v8 sectionsForIndex:a3];
    uint64_t v10 = [v9 count];

    if (!v10)
    {
      uint64_t v19 = -[SKUIStorePageSectionsViewController _splitForSectionIndex:](self, "_splitForSectionIndex:", [v6 sectionIndex]);
      uint64_t v11 = [v19 sectionContext];
      uint64_t v12 = [(SKUIStorePageSectionsViewController *)self _childSectionsForMenuComponent:v7 selectedIndex:a3];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            [v17 _setContext:v11];
            [v17 willAppearInContext:v11];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v14);
      }
      -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](self->_sections, "replaceObjectsInRange:withObjectsFromArray:", [v6 sectionIndex] + 1, 0, v12);
      objc_msgSend(v19, "setNumberOfPageSections:", objc_msgSend(v12, "count") + objc_msgSend(v19, "numberOfPageSections"));
      uint64_t v18 = [(SKUIStorePageSectionsViewController *)self _textLayoutCache];
      [v18 commitLayoutRequests];

      [(SKUIStorePageSectionsViewController *)self _updateSectionsAfterMenuChange];
    }
  }
}

- (id)_visibleMetricsImpressionsString
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_alloc_init(SKUIMetricsImpressionSession);
  id v4 = [(SKUICollectionView *)self->_collectionView indexPathsForVisibleItems];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", [v9 section]);
        [v10 addImpressionsForIndexPath:v9 toSession:v3];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  uint64_t v11 = [(SKUIMetricsImpressionSession *)v3 impressionsString];

  return v11;
}

- (id)_impressionableViewElements
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_alloc_init(SKUIMetricsImpressionSession);
  id v4 = [(SKUICollectionView *)self->_collectionView indexPathsForVisibleItems];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", [v9 section]);
        [v10 addImpressionsForIndexPath:v9 toSession:v3];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  uint64_t v11 = [(SKUIMetricsImpressionSession *)v3 impressionableViewElements];

  return v11;
}

- (void)_handleTap:(id)a3
{
  if (self->_indexPathOfEditedCell)
  {
    -[SKUICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (([v3 isScrollingCellToHideActionButton] & 1) == 0) {
      [v3 hideDeleteButton];
    }
  }
}

- (void)_entityProviderDidInvalidateNotification:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __80__SKUIStorePageSectionsViewController__entityProviderDidInvalidateNotification___block_invoke;
  uint64_t v10 = &unk_1E6421FF8;
  id v5 = v4;
  id v11 = v5;
  uint64_t v12 = self;
  uint64_t v6 = (void (**)(void))_Block_copy(&v7);
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v7, v8, v9, v10)) {
    v6[2](v6);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __80__SKUIStorePageSectionsViewController__entityProviderDidInvalidateNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  if (v2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 40) + 1144) objectForKey:v2];
  }
  else
  {
    id v3 = 0;
  }
  if ([v3 count])
  {
    id v4 = [*(id *)(a1 + 32) userInfo];
    id v5 = [v4 objectForKey:*MEMORY[0x1E4F6EF70]];

    uint64_t v6 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
    [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:0];
    uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 1064);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __80__SKUIStorePageSectionsViewController__entityProviderDidInvalidateNotification___block_invoke_2;
    uint64_t v12 = &unk_1E6423618;
    id v13 = v3;
    id v14 = v2;
    id v15 = v5;
    uint64_t v16 = *(void *)(a1 + 40);
    id v8 = v5;
    [v7 performBatchUpdates:&v9 completion:0];
    objc_msgSend(MEMORY[0x1E4FB1EB0], "setAnimationsEnabled:", v6, v9, v10, v11, v12);
  }
}

void __80__SKUIStorePageSectionsViewController__entityProviderDidInvalidateNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "entityProvider:didInvalidateWithContext:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  uint64_t v7 = [*(id *)(a1 + 56) _textLayoutCache];
  [v7 commitLayoutRequests];
}

- (void)_applyColorScheme:(id)a3 toIndexBarControl:(id)a4
{
  id v9 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 backgroundColor];
  if (v6)
  {
    [v9 setBackgroundColor:v6];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] clearColor];
    [v9 setBackgroundColor:v7];
  }
  long long v8 = [v5 primaryTextColor];

  [v9 setTintColor:v8];
}

- (void)_beginActiveImpressionsForImpressionableViewElements
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SKUIStorePageSectionsViewController *)self _impressionableViewElements];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        id v9 = [(SKUIStorePageSectionsViewController *)self activeMetricsImpressionSession];
        [v9 beginActiveImpressionForViewElement:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)_childSectionsForMenuComponent:(id)a3 selectedIndex:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SKUIStorePageSectionsViewController *)self _menuContextForMenuComponent:v6];
  uint64_t v8 = [v7 sectionsForIndex:a4];
  if ([v8 count])
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];

    long long v10 = [v6 childComponentsForIndex:a4];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [(SKUIStorePageSectionsViewController *)self defaultSectionForComponent:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          if (v15) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
    [v7 setSections:v9 forIndex:a4];
  }

  return v9;
}

- (id)_collectionViewSublayouts
{
  id v2 = [(SKUICollectionView *)self->_collectionView collectionViewLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 sublayouts];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_createSectionsForExpandPageComponent:(id)a3 context:(id)a4 newSections:(id)a5 sectionCount:(int64_t)a6 sectionsByViewElement:(id)a7 updateStyle:(int64_t)a8
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v65 = a4;
  id v66 = a5;
  id v13 = a7;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v15 = 5;
  do
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
    [v14 addObject:v16];

    --v15;
  }
  while (v15);
  long long v17 = [NSNumber numberWithInteger:0];
  [v14 replaceObjectAtIndex:0 withObject:v17];

  long long v18 = [NSNumber numberWithInteger:0];
  [v14 replaceObjectAtIndex:1 withObject:v18];

  long long v19 = [NSNumber numberWithInteger:0];
  long long v60 = v14;
  [v14 replaceObjectAtIndex:4 withObject:v19];

  long long v20 = [v12 viewElement];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v21 = [v20 persistenceKey];
  uint64_t v22 = [v21 flattenedChildren];

  uint64_t v63 = [v22 countByEnumeratingWithState:&v74 objects:v79 count:16];
  if (v63)
  {
    uint64_t v23 = 0;
    uint64_t v62 = *(void *)v75;
    v68 = self;
    id v58 = v13;
    id v59 = v12;
    long long v57 = v20;
    do
    {
      for (uint64_t i = 0; i != v63; ++i)
      {
        if (*(void *)v75 != v62) {
          objc_enumerationMutation(v22);
        }
        uint64_t v25 = [*(id *)(*((void *)&v74 + 1) + 8 * i) persistenceKey];
        if (v25)
        {
          uint64_t v26 = [v13 objectForKey:v25];
          if (v26)
          {
            id v27 = (id)v26;
            uint64_t v64 = i;
            uint64_t v28 = [(NSMutableArray *)self->_sections count];
            [v27 setBottomSection:0];
            [v27 setSectionIndex:v28];
            [v27 setTopSection:a6 == 0];
            id v29 = [v12 childComponentForIndex:v23];
            uint64_t v30 = [v27 updateWithContext:v65 pageComponent:v29];

            if (v30 == 2)
            {
              uint64_t v31 = [v60 objectAtIndex:1];
              uint64_t v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v31, "integerValue") + 1);
              uint64_t v33 = v60;
              uint64_t v34 = 1;
LABEL_35:
              [v33 replaceObjectAtIndex:v34 withObject:v32];
            }
            else if (v30 == 1)
            {
              uint64_t v31 = [v60 objectAtIndex:0];
              uint64_t v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v31, "integerValue") + 1);
              uint64_t v33 = v60;
              uint64_t v34 = 0;
              goto LABEL_35;
            }
            self = v68;
            [(NSMutableArray *)v68->_sections addObject:v27];
            [v13 removeObjectForKey:v25];
            ++a6;
LABEL_38:

            ++v23;
            uint64_t i = v64;
            goto LABEL_39;
          }
        }
        uint64_t v35 = [(NSMutableArray *)self->_sections count];
        if ([v20 isOpen])
        {
          uint64_t v64 = i;
          uint64_t v61 = v23;
          long long v36 = [v12 childComponentForIndex:v23];
          id v37 = [(SKUIStorePageSectionsViewController *)self _newSectionsWithPageComponent:v36];

          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          id v27 = v37;
          uint64_t v38 = [v27 countByEnumeratingWithState:&v70 objects:v78 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            double v40 = v20;
            uint64_t v41 = *(void *)v71;
            do
            {
              for (uint64_t j = 0; j != v39; ++j)
              {
                if (*(void *)v71 != v41) {
                  objc_enumerationMutation(v27);
                }
                double v43 = *(void **)(*((void *)&v70 + 1) + 8 * j);
                [v43 setBottomSection:0];
                [v43 setSectionIndex:v35 + j];
                [v43 setTopSection:a6 + j == 0];
                if (a8 == 1)
                {
                  [v43 _setContext:v65];
                  [v43 willAppearInContext:v65];
                  [v66 addObject:v43];
                  self = v68;
                  [(NSMutableArray *)v68->_sections addObject:v43];
                  if ([v40 isOpen] && (objc_msgSend(v40, "previousIsOpen") & 1) == 0)
                  {
                    expandInsertSections = v68->_expandInsertSections;
                    if (!expandInsertSections)
                    {
                      double v45 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
                      double v46 = v68->_expandInsertSections;
                      v68->_expandInsertSections = v45;

                      expandInsertSections = v68->_expandInsertSections;
                    }
                    [(NSMutableIndexSet *)expandInsertSections addIndex:v35 + j];
                  }
                }
                else
                {
                  [v66 addObject:v43];
                  self = v68;
                  [(NSMutableArray *)v68->_sections addObject:v43];
                }
              }
              uint64_t v39 = [v27 countByEnumeratingWithState:&v70 objects:v78 count:16];
              v35 += j;
              a6 += j;
            }
            while (v39);

            id v13 = v58;
            id v12 = v59;
            long long v20 = v40;
            uint64_t v23 = v61;
          }
          else
          {

            uint64_t v23 = v61;
          }
          goto LABEL_38;
        }
        int v47 = [v20 previousIsOpen];
        if (a8 == 1 && v47)
        {
          double v48 = self;
          uint64_t v49 = i;
          expandRemoveSections = v48->_expandRemoveSections;
          if (!expandRemoveSections)
          {
            uint64_t v51 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
            long long v52 = v68->_expandRemoveSections;
            v68->_expandRemoveSections = v51;

            expandRemoveSections = v68->_expandRemoveSections;
          }
          [(NSMutableIndexSet *)expandRemoveSections addIndex:[(NSMutableIndexSet *)expandRemoveSections count] + v35];
          uint64_t i = v49;
          long long v20 = v57;
          self = v68;
        }
LABEL_39:
      }
      uint64_t v63 = [v22 countByEnumeratingWithState:&v74 objects:v79 count:16];
    }
    while (v63);
  }

  if ([v20 isOpen] & 1) == 0 && (objc_msgSend(v20, "previousIsOpen"))
  {
    uint64_t v53 = 0;
    id v54 = v60;
LABEL_47:
    [v20 setPreviousIsOpen:v53];
    goto LABEL_48;
  }
  id v54 = v60;
  if ([v20 isOpen] && (objc_msgSend(v20, "previousIsOpen") & 1) == 0)
  {
    uint64_t v53 = 1;
    goto LABEL_47;
  }
LABEL_48:
  [v54 replaceObjectAtIndex:2 withObject:v13];
  [v54 replaceObjectAtIndex:3 withObject:v66];
  long long v55 = [NSNumber numberWithInteger:a6];
  [v54 replaceObjectAtIndex:4 withObject:v55];

  return v54;
}

- (id)_currentBackdropGroupName
{
  id v2 = [(SKUIStorePageSectionsViewController *)self navigationController];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v2 _backdropGroupName];
  }
  else
  {
    uint64_t v4 = [v2 navigationBar];
    uint64_t v3 = [v4 _backdropViewLayerGroupName];
  }

  return v3;
}

- (id)_defaultSectionForGridComponent:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 gridType];
  if (v4 > 6)
  {
    id v6 = 0;
  }
  else
  {
    if (((1 << v4) & 0x3B) != 0)
    {
      uint64_t v5 = SKUIGridPageSection;
    }
    else if (v4 == 2)
    {
      uint64_t v5 = SKUIBrickGridPageSection;
    }
    else
    {
      uint64_t v5 = (__objc2_class *)objc_opt_class();
      uint64_t v8 = [v3 viewElement];
      int v9 = [v8 isDynamicContainer];

      if (v9) {
        uint64_t v5 = (__objc2_class *)objc_opt_class();
      }
    }
    id v6 = (void *)[[v5 alloc] initWithPageComponent:v3];
  }

  return v6;
}

- (id)_defaultSectionForSwooshComponent:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 swooshType];
  if (v4 > 2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (void *)[objc_alloc(*off_1E6424928[v4]) initWithPageComponent:v3];
  }

  return v5;
}

- (void)_deselectCellsForAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(SKUICollectionView *)self->_collectionView indexPathsForSelectedItems];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(SKUICollectionView *)self->_collectionView deselectItemAtIndexPath:*(void *)(*((void *)&v19 + 1) + 8 * v9++) animated:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v10 = self->_sections;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "deselectItemsAnimated:", v3, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)_endAllPendingActiveImpression
{
  id v2 = [(SKUIStorePageSectionsViewController *)self activeMetricsImpressionSession];
  [v2 endAllPendingActiveImpression];
}

- (void)_enumerateSectionContextsUsingBlock:(id)a3
{
  id v4 = a3;
  splitsDescription = self->_splitsDescription;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__SKUIStorePageSectionsViewController__enumerateSectionContextsUsingBlock___block_invoke;
  v7[3] = &unk_1E64247F8;
  id v8 = v4;
  id v6 = v4;
  [(SKUIStorePageSplitsDescription *)splitsDescription enumerateSplitsUsingBlock:v7];
}

void __75__SKUIStorePageSectionsViewController__enumerateSectionContextsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [a2 sectionContext];
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v6 + 16))(v6, v7, a3, a4);
}

- (void)_enumerateVisibleSectionsUsingBlock:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SKUICollectionView *)self->_collectionView indexPathsForVisibleItems];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "addIndex:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11++), "section"));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__SKUIStorePageSectionsViewController__enumerateVisibleSectionsUsingBlock___block_invoke;
  v13[3] = &unk_1E6424820;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  [v6 enumerateIndexesUsingBlock:v13];
}

void __75__SKUIStorePageSectionsViewController__enumerateVisibleSectionsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 1304) objectAtIndex:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_invalidateIfLastKnownWidthChanged
{
  if (self->_lastKnownWidth)
  {
    id v3 = [(SKUIStorePageSectionsViewController *)self view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;

    [(NSNumber *)self->_lastKnownWidth floatValue];
    double v9 = floorf(v8);
    if (floor(v5) != v9) {
      -[SKUIStorePageSectionsViewController _invalidateLayoutWithNewSize:transitionCoordinator:](self, "_invalidateLayoutWithNewSize:transitionCoordinator:", 0, v5, v7);
    }
    *(float *)&double v9 = v5;
    uint64_t v10 = [NSNumber numberWithFloat:v9];
    lastKnowndouble Width = self->_lastKnownWidth;
    self->_lastKnowndouble Width = v10;
    MEMORY[0x1F41817F8](v10, lastKnownWidth);
  }
}

- (void)_invalidateLayoutWithNewSize:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  -[SKUIStorePageSectionsViewController _setPageSize:](self, "_setPageSize:", width, height);
  float v8 = [(SKUIStorePageSectionsViewController *)self _collectionViewSublayouts];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v40 + 1) + 8 * i) invalidateLayout];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v10);
  }
  uint64_t v13 = [(SKUICollectionView *)self->_collectionView collectionViewLayout];
  [v13 invalidateLayout];

  id v14 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v15 = self->_sections;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        uint64_t v21 = [v20 numberOfCells];
        objc_msgSend(v20, "willTransitionToSize:withTransitionCoordinator:", v7, width, height);
        if (v21 != [v20 numberOfCells]) {
          objc_msgSend(v14, "addIndex:", objc_msgSend(v20, "sectionIndex"));
        }
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v17);
  }

  long long v22 = [(SKUIStorePageSectionsViewController *)self _textLayoutCache];
  [v22 commitLayoutRequests];

  if ([v14 count])
  {
    uint64_t v23 = (void *)MEMORY[0x1E4FB1EB0];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __90__SKUIStorePageSectionsViewController__invalidateLayoutWithNewSize_transitionCoordinator___block_invoke;
    v34[3] = &unk_1E6421FF8;
    v34[4] = self;
    id v35 = v14;
    [v23 performWithoutAnimation:v34];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v24 = self->_sections;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = *(void **)(*((void *)&v30 + 1) + 8 * k);
        if ((objc_msgSend(v14, "containsIndex:", objc_msgSend(v29, "sectionIndex")) & 1) == 0) {
          [v29 reloadVisibleCellsWithReason:0];
        }
      }
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v44 count:16];
    }
    while (v26);
  }
}

uint64_t __90__SKUIStorePageSectionsViewController__invalidateLayoutWithNewSize_transitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1064) reloadSections:*(void *)(a1 + 40)];
}

- (id)_expandContextForMenuComponent:(id)a3
{
  id v4 = a3;
  double v5 = [(NSMapTable *)self->_expandSectionContexts objectForKey:v4];
  if (!v5)
  {
    if (!self->_expandSectionContexts)
    {
      double v6 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
      expandSectionContexts = self->_expandSectionContexts;
      self->_expandSectionContexts = v6;
    }
    double v5 = objc_alloc_init(SKUIExpandPageSectionContext);
    [(NSMapTable *)self->_expandSectionContexts setObject:v5 forKey:v4];
  }

  return v5;
}

- (id)_menuContextForMenuComponent:(id)a3
{
  id v4 = a3;
  double v5 = [(NSMapTable *)self->_menuSectionContexts objectForKey:v4];
  if (!v5)
  {
    if (!self->_menuSectionContexts)
    {
      double v6 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
      menuSectionContexts = self->_menuSectionContexts;
      self->_menuSectionContexts = v6;
    }
    double v5 = objc_alloc_init(SKUIMenuPageSectionContext);
    -[SKUIMenuPageSectionContext setSelectedIndex:](v5, "setSelectedIndex:", [v4 defaultSelectedIndex]);
    [(NSMapTable *)self->_menuSectionContexts setObject:v5 forKey:v4];
  }

  return v5;
}

- (id)_newSectionContext
{
  id v3 = objc_alloc_init(SKUIStorePageSectionContext);
  [(SKUIStorePageSectionContext *)v3 _setCollectionView:self->_collectionView];
  [(SKUIStorePageSectionContext *)v3 _setColorScheme:self->_colorScheme];
  [(SKUIStorePageSectionContext *)v3 _setDefaultPinningTransitionStyle:self->_pinningTransitionStyle];
  [(SKUIStorePageSectionContext *)v3 _setLayoutStyle:self->_layoutStyle];
  [(SKUIStorePageSectionContext *)v3 _setMetricsController:self->_metricsController];
  [(SKUIStorePageSectionContext *)v3 _setParentViewController:self];
  id v4 = [(SKUIStorePageSectionsViewController *)self resourceLoader];
  [(SKUIStorePageSectionContext *)v3 _setResourceLoader:v4];

  double v5 = [(SKUIStorePageSectionsViewController *)self _textLayoutCache];
  [(SKUIStorePageSectionContext *)v3 _setTextLayoutCache:v5];

  [(SKUIStorePageSectionContext *)v3 _setActiveMetricsImpressionSession:self->_activeMetricsImpressionSession];
  if ([(SKUIStorePageSectionsViewController *)self isViewLoaded])
  {
    double v6 = [(SKUIStorePageSectionsViewController *)self view];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;

    uint64_t v11 = [(SKUICollectionView *)self->_collectionView indexBarControl];

    if (v11)
    {
      id v12 = [(SKUICollectionView *)self->_collectionView indexBarControl];
      objc_msgSend(v12, "sizeThatFits:", v8, v10);
      double v14 = v13;

      double v8 = v8 - v14;
    }
    [(SKUIStorePageSectionContext *)v3 _setActivePageWidth:v8];
    [(SKUIStorePageSectionContext *)v3 _setLandscapePageWidth:v10];
    [(SKUIStorePageSectionContext *)v3 _setPortraitPageWidth:v8];
  }
  return v3;
}

- (id)_newSectionsWithPageComponent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v4 componentType] == 11)
  {
    id v6 = v4;
    double v7 = [[SKUIMenuPageSection alloc] initWithPageComponent:v6];
    [v5 addObject:v7];
    double v8 = -[SKUIStorePageSectionsViewController _childSectionsForMenuComponent:selectedIndex:](self, "_childSectionsForMenuComponent:selectedIndex:", v6, [v6 defaultSelectedIndex]);
    if (v8) {
      [v5 addObjectsFromArray:v8];
    }
  }
  else
  {
    id v6 = [(SKUIStorePageSectionsViewController *)self defaultSectionForComponent:v4];
    [v5 addObject:v6];
  }

  return v5;
}

- (id)_newSectionsWithPageComponents:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[SKUIStorePageSectionsViewController _newSectionsWithPageComponent:](self, "_newSectionsWithPageComponent:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
        [v5 addObjectsFromArray:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_newStorePageCollectionViewLayout
{
  id v3 = objc_alloc_init(SKUIStorePageCollectionViewLayout);
  id v4 = [(SKUIStorePageSectionsViewController *)self _currentBackdropGroupName];
  [(SKUIStorePageCollectionViewLayout *)v3 setBackdropGroupName:v4];

  [(SKUIStorePageCollectionViewLayout *)v3 setRendersWithPerspective:self->_rendersWithPerspective];
  [(SKUIStorePageCollectionViewLayout *)v3 setRendersWithParallax:self->_rendersWithParallax];
  return v3;
}

- (void)_prefetchArtworkForVisibleSections
{
}

uint64_t __73__SKUIStorePageSectionsViewController__prefetchArtworkForVisibleSections__block_invoke(uint64_t a1, void *a2)
{
  return [a2 prefetchResourcesWithReason:-1];
}

- (id)_prepareLayoutForSections
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(SKUIStorePageSplitsDescription *)self->_splitsDescription numberOfSplits] > 1)
  {
    id v4 = [(SKUIStorePageSectionsViewController *)self _newSectionContext];
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    splitsDescription = self->_splitsDescription;
    [v4 activePageWidth];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__SKUIStorePageSectionsViewController__prepareLayoutForSections__block_invoke;
    v14[3] = &unk_1E6424868;
    v14[4] = self;
    v14[5] = v15;
    -[SKUIStorePageSplitsDescription sizeSplitsToFitWidth:usingBlock:](splitsDescription, "sizeSplitsToFitWidth:usingBlock:", v14);
    uint64_t v10 = objc_alloc_init(SKUIStorePageSplitCollectionViewLayout);
    id v12 = [(SKUIStorePageSectionsViewController *)self _currentBackdropGroupName];
    [(SKUIStorePageSplitCollectionViewLayout *)v10 setBackdropGroupName:v12];

    [(SKUIStorePageSplitCollectionViewLayout *)v10 setRendersWithPerspective:self->_rendersWithPerspective];
    [(SKUIStorePageSplitCollectionViewLayout *)v10 addSublayoutsUsingSplitsDescription:self->_splitsDescription];
    _Block_object_dispose(v15, 8);
  }
  else
  {
    id v3 = [(SKUIStorePageSplitsDescription *)self->_splitsDescription firstSplit];
    id v4 = [v3 sectionContext];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = self->_sections;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v9 _setContext:v4];
          [v9 willAppearInContext:v4];
        }
        uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }

    uint64_t v10 = [(SKUIStorePageSectionsViewController *)self _newStorePageCollectionViewLayout];
  }

  return v10;
}

void __64__SKUIStorePageSectionsViewController__prepareLayoutForSections__block_invoke(uint64_t a1, void *a2, double a3)
{
  id v12 = a2;
  id v5 = [v12 sectionContext];
  [v5 _setActivePageWidth:a3];
  uint64_t v6 = [v12 numberOfPageSections];
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void *)(v8 + 24);
  if (v6 < 1)
  {
    uint64_t v11 = v9 + v6;
  }
  else
  {
    do
    {
      uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 1304) objectAtIndex:v9];
      [v10 _setContext:v5];
      [v10 willAppearInContext:v5];

      ++v9;
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v11 = *(void *)(v8 + 24) + v7;
    }
    while (v9 < v11);
  }
  *(void *)(v8 + 24) = v11;
}

- (void)_registerForNotificationsForEntityProvider:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F28EB8];
    id v5 = a3;
    id v6 = [v4 defaultCenter];
    [v6 addObserver:self selector:sel__entityProviderDidInvalidateNotification_ name:*MEMORY[0x1E4F6EF68] object:v5];
  }
}

- (void)_reloadCollectionView
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v32 = [(SKUIStorePageSectionsViewController *)self _prepareLayoutForSections];
  -[SKUICollectionView setCollectionViewLayout:animated:](self->_collectionView, "setCollectionViewLayout:animated:");
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v3 = self->_sections;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v39 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v38 + 1) + 8 * i) fitsToHeight])
        {
          uint64_t v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 1;
LABEL_11:

  [(SKUICollectionView *)self->_collectionView setAlwaysBounceVertical:v8];
  [(SKUICollectionView *)self->_collectionView setScrollEnabled:v8];
  uint64_t v9 = [(SKUIColorScheme *)self->_colorScheme backgroundColor];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  id v12 = v11;

  [(SKUICollectionView *)self->_collectionView setBackgroundColor:v12];
  if ([(NSMutableArray *)self->_sections count])
  {
    p_contentInsetAdjustments = &self->_contentInsetAdjustments;
    double top = self->_contentInsetAdjustments.top;
    long long v15 = [(NSMutableArray *)self->_sections objectAtIndex:0];
    [v15 contentInsetAdjustmentForCollectionView:self->_collectionView];
    self->_contentInsetAdjustments.double top = v16;
    long long v17 = self;
    long long v18 = v17;
    while (![v18 conformsToProtocol:&unk_1F1DC6B30])
    {
      uint64_t v19 = [v18 parentViewController];

      long long v18 = (void *)v19;
      if (!v19) {
        goto LABEL_21;
      }
    }
    char v20 = [v18 prefersNavigationBarBackgroundViewHidden];

    if (v20)
    {
      uint64_t v21 = [(SKUIStorePageSectionsViewController *)v17 navigationController];
      long long v22 = [v21 navigationBar];
      [v22 frame];
      p_contentInsetAdjustments->double top = p_contentInsetAdjustments->top - CGRectGetMaxY(v45);
    }
LABEL_21:
    if ((unint64_t)[(NSMutableArray *)self->_sections count] >= 2)
    {
      uint64_t v23 = [(NSMutableArray *)self->_sections lastObject];
      [v23 contentInsetAdjustmentForCollectionView:self->_collectionView];
      self->_contentInsetAdjustments.bottom = v24;
    }
    [(SKUICollectionView *)self->_collectionView contentInset];
    [(SKUICollectionView *)self->_collectionView setContentInset:v25 + p_contentInsetAdjustments->top - top];
  }
  uint64_t v26 = [(SKUIStorePageSectionsViewController *)self _textLayoutCache];
  [v26 commitLayoutRequests];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v27 = self->_sections;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v35 != v30) {
          objc_enumerationMutation(v27);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * j) prefetchResourcesWithReason:0];
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v29);
  }

  [(SKUICollectionView *)self->_collectionView setDataSource:self];
  [(SKUICollectionView *)self->_collectionView setDelegate:self];
  [(SKUICollectionView *)self->_collectionView reloadData];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SKUIStorePageSectionsViewController__reloadCollectionView__block_invoke;
  block[3] = &unk_1E6422020;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__SKUIStorePageSectionsViewController__reloadCollectionView__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 1304);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "didAppearInContext:", 0, (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_reloadRelevantEntityProviders
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v3 = self->_entityProviderToRelevantSections;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    long long v6 = 0;
    uint64_t v7 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v48 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        if (!v6) {
          long long v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSMapTable count](self->_entityProviderToRelevantSections, "count"));
        }
        [v6 addObject:v9];
      }
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v5);
  }
  else
  {
    long long v6 = 0;
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = self->_sections;
  uint64_t v32 = [(NSMutableArray *)obj countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v44 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        id v12 = [v11 relevantEntityProviders];
        if ([v12 count])
        {
          uint64_t v34 = j;
          if (!self->_entityProviderToRelevantSections)
          {
            long long v13 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
            entityProviderToRelevantSections = self->_entityProviderToRelevantSections;
            self->_entityProviderToRelevantSections = v13;
          }
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v33 = v12;
          id v15 = v12;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v52 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v40;
            do
            {
              for (uint64_t k = 0; k != v17; ++k)
              {
                if (*(void *)v40 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * k);
                [v6 removeObject:v20];
                uint64_t v21 = [(NSMapTable *)self->_entityProviderToRelevantSections objectForKey:v20];
                if (!v21)
                {
                  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
                  [(NSMapTable *)self->_entityProviderToRelevantSections setObject:v21 forKey:v20];
                  [(SKUIStorePageSectionsViewController *)self _registerForNotificationsForEntityProvider:v20];
                }
                [v21 addObject:v11];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v52 count:16];
            }
            while (v17);
          }

          id v12 = v33;
          uint64_t j = v34;
        }
      }
      uint64_t v32 = [(NSMutableArray *)obj countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v32);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v22 = v6;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v51 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v36;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v35 + 1) + 8 * m);
        [(SKUIStorePageSectionsViewController *)self _unregisterForNotificationsForEntityProvider:v27];
        [(NSMapTable *)self->_entityProviderToRelevantSections removeObjectForKey:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v51 count:16];
    }
    while (v24);
  }

  uint64_t v28 = self->_entityProviderToRelevantSections;
  if (v28 && ![(NSMapTable *)v28 count])
  {
    uint64_t v29 = self->_entityProviderToRelevantSections;
    self->_entityProviderToRelevantSections = 0;
  }
}

- (void)_scrollFirstAppearanceSectionToView
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_scrollOffsetHasChanged)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v3 = self->_sections;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "firstAppearanceIndexPath", (void)v10);
          if (v8)
          {
            uint64_t v9 = (NSMutableArray *)v8;

            [(SKUICollectionView *)self->_collectionView scrollToItemAtIndexPath:v9 atScrollPosition:2 animated:0];
            self->_scrollOffsetHasChanged = 1;
            uint64_t v3 = v9;
            goto LABEL_12;
          }
        }
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)_setPageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(SKUIStorePageSectionsViewController *)self _collectionViewSublayouts];
  uint64_t v7 = [(SKUICollectionView *)self->_collectionView indexBarControl];

  if (v7)
  {
    uint64_t v8 = [(SKUICollectionView *)self->_collectionView indexBarControl];
    objc_msgSend(v8, "sizeThatFits:", width, height);
    double v10 = v9;

    double width = width - v10;
  }
  splitsDescription = self->_splitsDescription;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__SKUIStorePageSectionsViewController__setPageSize___block_invoke;
  v13[3] = &unk_1E6424890;
  id v14 = v6;
  id v12 = v6;
  [(SKUIStorePageSplitsDescription *)splitsDescription sizeSplitsToFitWidth:v13 usingBlock:width];
}

void __52__SKUIStorePageSectionsViewController__setPageSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v8 = [a2 sectionContext];
  [v8 _setActivePageWidth:a4];
  uint64_t v7 = [*(id *)(a1 + 32) objectAtIndex:a3];
  [v8 activePageWidth];
  objc_msgSend(v7, "setOverrideContentWidth:");
}

- (id)_splitForSectionIndex:(int64_t)a3
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy__11;
  long long v11 = __Block_byref_object_dispose__11;
  id v12 = 0;
  splitsDescription = self->_splitsDescription;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SKUIStorePageSectionsViewController__splitForSectionIndex___block_invoke;
  v6[3] = &unk_1E64248B8;
  void v6[4] = v13;
  v6[5] = &v7;
  [(SKUIStorePageSplitsDescription *)splitsDescription enumerateSplitsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);

  return v4;
}

void __61__SKUIStorePageSectionsViewController__splitForSectionIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v7 = [v12 numberOfPageSections];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void *)(v8 + 24);
  BOOL v10 = v9 < v7;
  uint64_t v11 = v9 - v7;
  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
  else
  {
    *(void *)(v8 + 24) = v11;
  }
}

- (id)_textLayoutCache
{
  textLayoutCache = self->_textLayoutCache;
  if (!textLayoutCache)
  {
    id v4 = objc_alloc_init(SKUILayoutCache);
    uint64_t v5 = self->_textLayoutCache;
    self->_textLayoutCache = v4;

    [(SKUILayoutCache *)self->_textLayoutCache setDelegate:self];
    textLayoutCache = self->_textLayoutCache;
  }

  return textLayoutCache;
}

- (void)_unregisterForNotificationsForEntityProvider:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F28EB8];
    id v5 = a3;
    id v6 = [v4 defaultCenter];
    [v6 removeObserver:self name:*MEMORY[0x1E4F6EF68] object:v5];
  }
}

- (void)_updateCollectionViewWithUpdates:(id)a3
{
  uint64_t v4 = (*((uint64_t (**)(id, SEL))a3 + 2))(a3, a2);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [(SKUIStorePageSectionsViewController *)self _textLayoutCache];
    [v6 commitLayoutRequests];

    uint64_t v7 = [(SKUICollectionView *)self->_collectionView collectionViewLayout];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__SKUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_2;
    aBlock[3] = &unk_1E64248E0;
    uint64_t v25 = v5;
    aBlock[4] = self;
    id v8 = v7;
    id v24 = v8;
    uint64_t v9 = _Block_copy(aBlock);
    if ([(NSMutableIndexSet *)self->_expandInsertSections count]
      || [(NSMutableIndexSet *)self->_expandRemoveSections count])
    {
      [(SKUIStorePageSectionsViewController *)self _beginIgnoringSectionChanges];
      collectionView = self->_collectionView;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __72__SKUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_4;
      v21[3] = &unk_1E6421FF8;
      void v21[4] = self;
      id v22 = v8;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __72__SKUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_5;
      uint64_t v18 = &unk_1E6424908;
      uint64_t v19 = self;
      id v20 = v9;
      [(SKUICollectionView *)collectionView performBatchUpdates:v21 completion:&v15];
    }
    else
    {
      (*((void (**)(void *, uint64_t))v9 + 2))(v9, 1);
    }
  }
  else if (self->_didInitialReload && self->_collectionView)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __72__SKUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke;
    v26[3] = &unk_1E6422020;
    v26[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v26];
  }
  if ([(SKUIStorePageSectionsViewController *)self isViewLoaded])
  {
    overlayController = self->_overlayController;
    if (overlayController)
    {
      id v12 = [(SKUIProductPageOverlayController *)overlayController view];
      long long v13 = [v12 superview];
      [v13 bringSubviewToFront:v12];
    }
  }
  [(UITapGestureRecognizer *)self->_collectionViewTapGestureRecognizer setEnabled:0];
  indexPathOfEditedCell = self->_indexPathOfEditedCell;
  self->_indexPathOfEditedCell = 0;
}

uint64_t __72__SKUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1064) reloadData];
  [*(id *)(a1 + 32) _reloadCollectionView];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _scrollFirstAppearanceSectionToView];
}

void __72__SKUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_2(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1[6];
  if (v1 == 1)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4FB1EB0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__SKUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_3;
    v9[3] = &unk_1E6421FF8;
    id v8 = (void *)a1[5];
    v9[4] = a1[4];
    id v10 = v8;
    [v7 performWithoutAnimation:v9];
  }
  else if (v1 == 2)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = *(id *)(a1[4] + 1304);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v6++) reloadVisibleCellsWithReason:1];
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
  }
}

void __72__SKUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_3(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 1064) collectionViewLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 addSublayoutsUsingSplitsDescription:*(void *)(*(void *)(a1 + 32) + 1312)];
  }
  [*(id *)(*(void *)(a1 + 32) + 1064) contentSize];
  double v3 = v2;
  [*(id *)(*(void *)(a1 + 32) + 1064) setUserInteractionEnabled:0];
  [*(id *)(*(void *)(a1 + 32) + 1064) reloadData];
  [*(id *)(*(void *)(a1 + 32) + 1064) setUserInteractionEnabled:1];
  uint64_t v4 = [*(id *)(a1 + 40) indexPathsForPinningItems];
  if ([v4 count])
  {
    [*(id *)(a1 + 40) collectionViewContentSize];
    if (v5 < v3) {
      [*(id *)(*(void *)(a1 + 32) + 1064) reloadItemsAtIndexPaths:v4];
    }
  }
  [*(id *)(a1 + 32) _scrollFirstAppearanceSectionToView];
}

void __72__SKUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_4(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 1160) count])
  {
    [*(id *)(a1 + 40) setExpandChildPageSectionsIndexSet:*(void *)(*(void *)(a1 + 32) + 1160)];
    [*(id *)(*(void *)(a1 + 32) + 1064) insertSections:*(void *)(*(void *)(a1 + 32) + 1160)];
  }
  else if ([*(id *)(*(void *)(a1 + 32) + 1168) count])
  {
    [*(id *)(a1 + 40) setExpandChildPageSectionsIndexSet:*(void *)(*(void *)(a1 + 32) + 1168)];
    [*(id *)(*(void *)(a1 + 32) + 1064) deleteSections:*(void *)(*(void *)(a1 + 32) + 1168)];
  }
  [*(id *)(a1 + 40) setExpandChildPageSectionsIndexSet:0];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 1160);
  *(void *)(v2 + 1160) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(void **)(v4 + 1168);
  *(void *)(v4 + 1168) = 0;
}

uint64_t __72__SKUIStorePageSectionsViewController__updateCollectionViewWithUpdates___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _endIgnoringSectionChanges];
}

- (void)_updateSectionsAfterMenuChange
{
  uint64_t v3 = [(NSMutableArray *)self->_sections count];
  if (v3 < 1)
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    LOBYTE(v6) = 1;
    do
    {
      uint64_t v7 = [(NSMutableArray *)self->_sections objectAtIndex:v5];
      [v7 setSectionIndex:v5];
      if (v6) {
        uint64_t v6 = [v7 fitsToHeight] ^ 1;
      }
      else {
        uint64_t v6 = 0;
      }

      ++v5;
    }
    while (v4 != v5);
  }
  [(SKUICollectionView *)self->_collectionView setAlwaysBounceVertical:v6];
  [(SKUICollectionView *)self->_collectionView setScrollEnabled:v6];
  [(SKUICollectionView *)self->_collectionView setScrollsToTop:v6];
  collectionView = self->_collectionView;

  [(SKUICollectionView *)collectionView reloadData];
}

- (SKUIMetricsImpressionSession)activeMetricsImpressionSession
{
  return self->_activeMetricsImpressionSession;
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (SKUIStorePageSectionsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIStorePageSectionsDelegate *)WeakRetained;
}

- (SKUIMetricsController)metricsController
{
  return self->_metricsController;
}

- (int64_t)pinningTransitionStyle
{
  return self->_pinningTransitionStyle;
}

- (SKUICollectionViewPullToRefreshDelegate)pullToRefreshDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pullToRefreshDelegate);

  return (SKUICollectionViewPullToRefreshDelegate *)WeakRetained;
}

- (void)setPullToRefreshDelegate:(id)a3
{
}

- (NSArray)sections
{
  return &self->_sections->super;
}

- (void)setResourceLoader:(id)a3
{
}

- (SKUIIndexBarControl)indexBarControl
{
  return self->_indexBarControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_stackedBar, 0);
  objc_storeStrong((id *)&self->_splitsDividerView, 0);
  objc_storeStrong((id *)&self->_splitsDescription, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_destroyWeak((id *)&self->_pullToRefreshDelegate);
  objc_storeStrong((id *)&self->_viewControllerPreviewing, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_menuSectionContexts, 0);
  objc_storeStrong((id *)&self->_lastKnownWidth, 0);
  objc_storeStrong((id *)&self->_initialOverlayURLs, 0);
  objc_storeStrong((id *)&self->_indexPathOfEditedCell, 0);
  objc_storeStrong((id *)&self->_indexBarControl, 0);
  objc_storeStrong((id *)&self->_expandRemoveSections, 0);
  objc_storeStrong((id *)&self->_expandInsertSections, 0);
  objc_storeStrong((id *)&self->_expandSectionContexts, 0);
  objc_storeStrong((id *)&self->_entityProviderToRelevantSections, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_deferredSplitsDescription, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_collectionViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_activeMetricsImpressionSession, 0);

  objc_destroyWeak((id *)&self->_activeOverlayController);
}

- (void)initWithLayoutStyle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "-[SKUIStorePageSectionsViewController initWithLayoutStyle:]";
}

@end