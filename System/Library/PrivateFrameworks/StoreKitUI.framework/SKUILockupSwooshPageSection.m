@interface SKUILockupSwooshPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SKUILockupSwooshPageSection)initWithPageComponent:(id)a3;
- (id)_artworkLoader;
- (id)_missingItemLoader;
- (id)_popSourceViewForOverlayController:(id)a3;
- (id)_swooshViewController;
- (id)cellForIndexPath:(id)a3;
- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4;
- (id)swoosh:(id)a3 videoThumbnailForCellAtIndex:(int64_t)a4;
- (int64_t)numberOfCells;
- (void)_addImpressionForItemIndex:(int64_t)a3 toSession:(id)a4;
- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4;
- (void)_showProductPageForItem:(id)a3 index:(int64_t)a4 animated:(BOOL)a5;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)dealloc;
- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5;
- (void)prefetchResourcesWithReason:(int64_t)a3;
- (void)productPageOverlayDidDismiss:(id)a3;
- (void)setImage:(id)a3 forRequest:(id)a4;
- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4;
- (void)swoosh:(id)a3 willDisplayCellAtIndex:(int64_t)a4;
- (void)swooshDidSelectSeeAll:(id)a3;
- (void)willAppearInContext:(id)a3;
@end

@implementation SKUILockupSwooshPageSection

- (SKUILockupSwooshPageSection)initWithPageComponent:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILockupSwooshPageSection initWithPageComponent:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUILockupSwooshPageSection;
  v5 = [(SKUIStorePageSection *)&v8 initWithPageComponent:v4];
  v6 = v5;
  if (v5) {
    v5->_overlaySourceIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)dealloc
{
  [(SKUIMissingItemLoader *)self->_missingItemLoader setDelegate:0];
  [(SKUIProductPageOverlayController *)self->_overlayController setDelegate:0];
  [(SKUILockupSwooshViewController *)self->_swooshViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUILockupSwooshPageSection;
  [(SKUIStorePageSection *)&v3 dealloc];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(SKUIStorePageSection *)self pageComponent];
  v9 = [v8 viewElement];
  [v7 addItemViewElement:v9];

  [(SKUILockupSwooshViewController *)self->_swooshViewController indexPathsForVisibleItems];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1C8749310](v11);
        -[SKUILockupSwooshPageSection _addImpressionForItemIndex:toSession:](self, "_addImpressionForItemIndex:toSession:", objc_msgSend(v15, "item", (void)v17), v7);
        ++v14;
      }
      while (v12 != v14);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v12 = v11;
    }
    while (v11);
  }
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIStorePageSection *)self context];
  id v6 = [v5 collectionView];

  id v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"SKUILockupSwooshPageSectionReuseIdentifier" forIndexPath:v4];

  objc_super v8 = [(SKUILockupSwooshPageSection *)self _swooshViewController];
  v9 = [v8 view];

  id v10 = [v7 contentChildView];

  if (v9 != v10)
  {
    [v7 setContentChildView:v9];
    objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  }

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SKUIStorePageSection *)self context];
  v5 = [v4 collectionView];

  id v6 = [(SKUILockupSwooshPageSection *)self _swooshViewController];
  id v7 = [v6 view];

  [v7 sizeToFit];
  [v7 frame];
  double v9 = v8;
  [v5 bounds];
  double v11 = v10;

  double v12 = v11;
  double v13 = v9;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  v5 = [(SKUILockupSwooshPageSection *)self _artworkLoader];
  [v5 loadImagesForNextPageWithReason:a3];

  [(SKUILockupSwooshPageSection *)self _loadMissingItemsFromIndex:0 withReason:a3];
}

- (void)setImage:(id)a3 forRequest:(id)a4
{
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SKUILockupSwooshPageSectionReuseIdentifier"];
  v6.receiver = self;
  v6.super_class = (Class)SKUILockupSwooshPageSection;
  [(SKUIStorePageSection *)&v6 willAppearInContext:v4];
}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v6 = a4;
  if ([v6 count])
  {
    id v7 = [(SKUIStorePageSection *)self pageComponent];
    double v8 = [(SKUILockupSwooshViewController *)self->_swooshViewController view];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    id v13 = (id)[v7 _updateLockupItemsWithItems:v6];
    swooshViewController = self->_swooshViewController;
    v15 = [v7 lockups];
    [(SKUILockupSwooshViewController *)swooshViewController setLockups:v15];

    [v8 frame];
    if (v17 != v10 || v16 != v12)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __85__SKUILockupSwooshPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke;
      v20[3] = &unk_1E6422020;
      v20[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v20];
    }
    long long v19 = [(SKUILockupSwooshPageSection *)self _artworkLoader];
    [v19 loadImagesForNextPageWithReason:0];
  }
}

void __85__SKUILockupSwooshPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, objc_msgSend(*(id *)(a1 + 32), "sectionIndex"));
  objc_super v3 = [*(id *)(a1 + 32) context];
  id v4 = [v3 collectionView];
  v6[0] = v2;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v4 reloadItemsAtIndexPaths:v5];
}

- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4
{
  id v14 = a3;
  id v6 = [v14 lockups];
  id v7 = [v6 objectAtIndex:a4];

  double v8 = [v7 item];
  if (v8)
  {
    double v9 = [(SKUIStorePageSection *)self clickEventWithItem:v8 elementName:*MEMORY[0x1E4FA88E0] index:a4];
    if (v9)
    {
      [v14 frameForItemAtIndex:a4];
      SKUIMetricsSetClickEventPositionWithPoint(v9, v10, v11);
      double v12 = [(SKUIStorePageSection *)self context];
      id v13 = [v12 metricsController];
      [v13 recordEvent:v9];
    }
    [(SKUILockupSwooshPageSection *)self _showProductPageForItem:v8 index:a4 animated:1];
  }
}

- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SKUILockupSwooshPageSection *)self _artworkLoader];
  double v8 = [v6 lockups];

  double v9 = [v8 objectAtIndex:a4];

  double v10 = [v9 item];
  if (v10)
  {
    double v11 = [v7 cachedImageForItem:v10];
    if (v11) {
      goto LABEL_6;
    }
    [v7 loadImageForItem:v10 reason:1];
    double v12 = v7;
    id v13 = v10;
  }
  else
  {
    double v12 = v7;
    id v13 = 0;
  }
  double v11 = [v12 placeholderImageForItem:v13];
LABEL_6:

  return v11;
}

- (id)swoosh:(id)a3 videoThumbnailForCellAtIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SKUILockupSwooshPageSection *)self _artworkLoader];
  double v8 = [v6 lockups];

  double v9 = [v8 objectAtIndex:a4];

  double v10 = [v9 item];
  double v11 = [v10 videos];
  double v12 = [v11 firstObject];

  id v13 = v7;
  if (v12)
  {
    id v14 = [v7 cachedImageForVideo:v12];
    if (v14) {
      goto LABEL_6;
    }
    [v7 loadImageForVideo:v12 reason:1];
    id v13 = v7;
    v15 = v12;
  }
  else
  {
    v15 = 0;
  }
  id v14 = [v13 placeholderImageForVideo:v15];
LABEL_6:

  return v14;
}

- (void)swoosh:(id)a3 willDisplayCellAtIndex:(int64_t)a4
{
  id v6 = [(SKUIStorePageSection *)self context];
  id v7 = [v6 metricsController];
  id v8 = [v7 activeImpressionsSession];

  if (v8) {
    [(SKUILockupSwooshPageSection *)self _addImpressionForItemIndex:a4 toSession:v8];
  }
  [(SKUILockupSwooshPageSection *)self _loadMissingItemsFromIndex:a4 withReason:1];
}

- (void)swooshDidSelectSeeAll:(id)a3
{
  id v17 = a3;
  id v4 = [v17 seeAllURL];
  if (v4)
  {
    v5 = [[SKUILink alloc] initWithURL:v4];
    id v6 = [(SKUIStorePageSection *)self clickEventWithLink:v5 elementName:*MEMORY[0x1E4FA88D0] index:0];
    if (v6)
    {
      [v17 seeAllButtonFrame];
      SKUIMetricsSetClickEventPositionWithPoint(v6, v7, v8);
      double v9 = [(SKUIStorePageSection *)self context];
      double v10 = [v9 metricsController];
      [v10 recordEvent:v6];
    }
    double v11 = [(SKUIStorePageSection *)self context];
    double v12 = [v11 parentViewController];

    id v13 = objc_alloc_init(SKUIStorePageViewController);
    id v14 = [v12 clientContext];
    [(SKUIStorePageViewController *)v13 setClientContext:v14];

    v15 = [v17 title];
    [(SKUIStorePageViewController *)v13 setTitle:v15];

    [(SKUIStorePageViewController *)v13 loadURL:v4 withCompletionBlock:0];
    double v16 = [v12 navigationController];
    [v16 pushViewController:v13 animated:1];
  }
}

- (void)productPageOverlayDidDismiss:(id)a3
{
  id v4 = [(SKUIStorePageSection *)self context];
  v5 = [v4 parentViewController];
  [v5 _pageSectionDidDismissOverlayController:self->_overlayController];

  [(SKUIProductPageOverlayController *)self->_overlayController setDelegate:0];
  overlayController = self->_overlayController;
  self->_overlayController = 0;

  [(SKUILockupSwooshViewController *)self->_swooshViewController unhideImages];
  self->_overlaySourceIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_addImpressionForItemIndex:(int64_t)a3 toSession:(id)a4
{
  swooshViewController = self->_swooshViewController;
  id v6 = a4;
  double v7 = [(SKUILockupSwooshViewController *)swooshViewController lockups];
  id v9 = [v7 objectAtIndex:a3];

  objc_msgSend(v6, "addItemIdentifier:", objc_msgSend(v9, "itemIdentifier"));
  double v8 = [v9 viewElement];
  [v6 addItemViewElement:v8];
}

- (id)_artworkLoader
{
  artworkLoader = self->_artworkLoader;
  if (!artworkLoader)
  {
    id v4 = [(SKUIStorePageSection *)self context];
    v5 = [SKUILockupSwooshArtworkLoader alloc];
    id v6 = [v4 resourceLoader];
    double v7 = [(SKUILockupSwooshPageSection *)self _swooshViewController];
    double v8 = [(SKUILockupSwooshArtworkLoader *)v5 initWithArtworkLoader:v6 swoosh:v7];
    id v9 = self->_artworkLoader;
    self->_artworkLoader = v8;

    double v10 = self->_artworkLoader;
    double v11 = [v4 colorScheme];
    [(SKUISwooshArtworkLoader *)v10 setPlaceholderColorWithColorScheme:v11];

    artworkLoader = self->_artworkLoader;
  }

  return artworkLoader;
}

- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4
{
  id v8 = [(SKUIStorePageSection *)self pageComponent];
  if ([v8 isMissingItemData])
  {
    double v7 = [(SKUILockupSwooshPageSection *)self _missingItemLoader];
    [v7 loadItemsForPageComponent:v8 startIndex:a3 reason:a4];
  }
}

- (id)_missingItemLoader
{
  missingItemLoader = self->_missingItemLoader;
  if (!missingItemLoader)
  {
    id v4 = [SKUIMissingItemLoader alloc];
    v5 = [(SKUIStorePageSection *)self context];
    id v6 = [v5 resourceLoader];
    double v7 = [(SKUIMissingItemLoader *)v4 initWithResourceLoader:v6];
    id v8 = self->_missingItemLoader;
    self->_missingItemLoader = v7;

    [(SKUIMissingItemLoader *)self->_missingItemLoader setDelegate:self];
    id v9 = [(SKUIStorePageSection *)self pageComponent];
    double v10 = [v9 platformKeyProfile];

    if (v10) {
      [(SKUIMissingItemLoader *)self->_missingItemLoader setKeyProfile:v10];
    }

    missingItemLoader = self->_missingItemLoader;
  }

  return missingItemLoader;
}

- (id)_popSourceViewForOverlayController:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIStorePageSection *)self pageComponent];
  id v6 = v5;
  if (v5) {
    [v5 lockupStyle];
  }

  if (self->_overlaySourceIndex != 0x7FFFFFFFFFFFFFFFLL) {
    [v4 numberOfVisibleOverlays];
  }

  return 0;
}

- (void)_showProductPageForItem:(id)a3 index:(int64_t)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = [(SKUIStorePageSection *)self context];
  id v9 = [v8 parentViewController];

  double v10 = [v9 clientContext];
  if (SKUIUserInterfaceIdiom(v10) == 1 && SKUIItemKindIsSoftwareKind([v7 itemKind]))
  {
    if (!self->_overlayController)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __70__SKUILockupSwooshPageSection__showProductPageForItem_index_animated___block_invoke;
      v12[3] = &unk_1E64271F8;
      v12[4] = self;
      id v13 = v9;
      id v14 = v10;
      int64_t v16 = a4;
      id v15 = v7;
      [(SKUIStorePageSection *)self sendXEventWithItem:v15 completionBlock:v12];
    }
  }
  else
  {
    [(SKUIStorePageSection *)self showProductViewControllerWithItem:v7];
    double v11 = [(SKUILockupSwooshPageSection *)self _swooshViewController];
    [v11 deselectAllItems];
  }
}

void __70__SKUILockupSwooshPageSection__showProductPageForItem_index_animated___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v4 = [[SKUIProductPageOverlayController alloc] initWithParentViewController:*(void *)(a1 + 40)];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v4;

    [*(id *)(*(void *)(a1 + 32) + 104) setClientContext:*(void *)(a1 + 48)];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "setDelegate:");
    *(void *)(*(void *)(a1 + 32) + 112) = *(void *)(a1 + 64);
    [*(id *)(*(void *)(a1 + 32) + 104) showWithInitialItem:*(void *)(a1 + 56)];
    [*(id *)(a1 + 40) _setActiveProductPageOverlayController:*(void *)(*(void *)(a1 + 32) + 104)];
    id v7 = [*(id *)(a1 + 32) _swooshViewController];
    [v7 deselectAllItems];
  }
}

- (id)_swooshViewController
{
  swooshViewController = self->_swooshViewController;
  if (!swooshViewController)
  {
    id v4 = [(SKUIStorePageSection *)self context];
    uint64_t v5 = [v4 parentViewController];
    id v6 = [SKUILockupSwooshViewController alloc];
    id v7 = [(SKUIStorePageSection *)self pageComponent];
    id v8 = [(SKUILockupSwooshViewController *)v6 initWithSwoosh:v7];
    id v9 = self->_swooshViewController;
    self->_swooshViewController = v8;

    double v10 = self->_swooshViewController;
    double v11 = [v5 clientContext];
    [(SKUILockupSwooshViewController *)v10 setClientContext:v11];

    [(SKUILockupSwooshViewController *)self->_swooshViewController setDelegate:self];
    double v12 = self->_swooshViewController;
    id v13 = [v4 colorScheme];
    [(SKUILockupSwooshViewController *)v12 setColorScheme:v13];

    [v5 addChildViewController:self->_swooshViewController];
    swooshViewController = self->_swooshViewController;
  }

  return swooshViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swooshViewController, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);

  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILockupSwooshPageSection initWithPageComponent:]";
}

@end