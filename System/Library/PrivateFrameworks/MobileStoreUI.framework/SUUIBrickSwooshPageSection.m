@interface SUUIBrickSwooshPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SUUIBrickSwooshPageSection)initWithPageComponent:(id)a3;
- (id)_artworkLoader;
- (id)_missingItemLoader;
- (id)_swooshViewController;
- (id)cellForIndexPath:(id)a3;
- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4;
- (int64_t)numberOfCells;
- (void)_addImpressionForIndex:(int64_t)a3 toSession:(id)a4;
- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)dealloc;
- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5;
- (void)prefetchResourcesWithReason:(int64_t)a3;
- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4;
- (void)swoosh:(id)a3 willDisplayCellAtIndex:(int64_t)a4;
- (void)willAppearInContext:(id)a3;
@end

@implementation SUUIBrickSwooshPageSection

- (SUUIBrickSwooshPageSection)initWithPageComponent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIBrickSwooshPageSection;
  return [(SUUIStorePageSection *)&v4 initWithPageComponent:a3];
}

- (void)dealloc
{
  [(SUUIMissingItemLoader *)self->_missingItemLoader setDelegate:0];
  [(SUUIBrickSwooshViewController *)self->_swooshViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIBrickSwooshPageSection;
  [(SUUIStorePageSection *)&v3 dealloc];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(SUUIStorePageSection *)self pageComponent];
  v9 = [v8 viewElement];
  [v7 addItemViewElement:v9];

  [(SUUIBrickSwooshViewController *)self->_swooshViewController indexPathsForVisibleItems];
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
        v16 = (void *)MEMORY[0x25A2A9B80](v11);
        -[SUUIBrickSwooshPageSection _addImpressionForIndex:toSession:](self, "_addImpressionForIndex:toSession:", objc_msgSend(v15, "item", (void)v17), v7);
        ++v14;
      }
      while (v12 != v14);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v12 = v11;
    }
    while (v11);
  }
}

- (void)willAppearInContext:(id)a3
{
  id v3 = [a3 collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SUUIBrickSwooshPageSectionReuseIdentifier"];
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStorePageSection *)self context];
  id v6 = [v5 collectionView];

  id v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"SUUIBrickSwooshPageSectionReuseIdentifier" forIndexPath:v4];
  v8 = [(SUUIBrickSwooshPageSection *)self _swooshViewController];
  v9 = [v8 view];

  id v10 = [v7 contentChildView];

  if (v9 != v10)
  {
    uint64_t v11 = [(SUUIStorePageSection *)self backgroundColorForIndexPath:v4];
    [v9 setBackgroundColor:v11];

    [v7 setContentChildView:v9];
    objc_msgSend(v7, "setContentInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  }

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SUUIStorePageSection *)self context];
  v5 = [v4 collectionView];

  id v6 = [(SUUIBrickSwooshPageSection *)self _swooshViewController];
  id v7 = [v6 view];

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
  v5 = [(SUUIBrickSwooshPageSection *)self _artworkLoader];
  [v5 loadImagesForNextPageWithReason:a3];

  [(SUUIBrickSwooshPageSection *)self _loadMissingItemsFromIndex:0 withReason:a3];
}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v10 = a4;
  if ([v10 count])
  {
    id v6 = [(SUUIStorePageSection *)self pageComponent];
    [v6 _updateBricksWithItems:v10];
    id v7 = [(SUUIBrickSwooshPageSection *)self _swooshViewController];
    double v8 = [v6 bricks];
    [v7 setBricks:v8];

    double v9 = [(SUUIBrickSwooshPageSection *)self _artworkLoader];
    [v9 loadImagesForNextPageWithReason:0];
  }
}

- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4
{
  id v20 = a3;
  id v6 = [v20 bricks];
  id v7 = [v6 objectAtIndex:a4];

  double v8 = [v7 link];
  double v9 = [(SUUIStorePageSection *)self clickEventWithLink:v8 elementName:*MEMORY[0x263F7BBA0] index:a4];
  if (v9)
  {
    [v20 frameForItemAtIndex:a4];
    SUUIMetricsSetClickEventPositionWithPoint(v9, v10, v11);
    double v12 = [(SUUIStorePageSection *)self context];
    double v13 = [v12 metricsController];
    [v13 recordEvent:v9];
  }
  uint64_t v14 = [(SUUIStorePageSection *)self context];
  v15 = [v14 parentViewController];

  v16 = [v15 navigationController];
  long long v17 = [v16 topViewController];

  [(SUUIStorePageSection *)self showPageWithLink:v8];
  long long v18 = [v15 navigationController];
  long long v19 = [v18 topViewController];

  if (v19 == v17) {
    [v20 deselectAllItems];
  }
}

- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4
{
  id v6 = [a3 bricks];
  id v7 = [v6 objectAtIndex:a4];

  double v8 = [(SUUIBrickSwooshArtworkLoader *)self->_artworkLoader cachedImageForBrick:v7];
  if (!v8)
  {
    double v9 = [(SUUIBrickSwooshPageSection *)self _artworkLoader];
    [v9 loadImageForBrick:v7 reason:1];
    double v8 = [v9 placeholderImage];
  }
  return v8;
}

- (void)swoosh:(id)a3 willDisplayCellAtIndex:(int64_t)a4
{
  id v6 = [(SUUIStorePageSection *)self context];
  id v7 = [v6 metricsController];
  id v8 = [v7 activeImpressionsSession];

  if (v8) {
    [(SUUIBrickSwooshPageSection *)self _addImpressionForIndex:a4 toSession:v8];
  }
  [(SUUIBrickSwooshPageSection *)self _loadMissingItemsFromIndex:a4 withReason:1];
}

- (void)_addImpressionForIndex:(int64_t)a3 toSession:(id)a4
{
  swooshViewController = self->_swooshViewController;
  id v6 = a4;
  id v7 = [(SUUIBrickSwooshViewController *)swooshViewController bricks];
  id v8 = [v7 objectAtIndex:a3];

  objc_msgSend(v6, "addItemIdentifier:", objc_msgSend(v8, "brickIdentifier"));
}

- (id)_artworkLoader
{
  artworkLoader = self->_artworkLoader;
  if (!artworkLoader)
  {
    id v4 = [(SUUIStorePageSection *)self context];
    v5 = [SUUIBrickSwooshArtworkLoader alloc];
    id v6 = [v4 resourceLoader];
    id v7 = [(SUUIBrickSwooshPageSection *)self _swooshViewController];
    id v8 = [(SUUIBrickSwooshArtworkLoader *)v5 initWithArtworkLoader:v6 swoosh:v7];
    double v9 = self->_artworkLoader;
    self->_artworkLoader = v8;

    double v10 = self->_artworkLoader;
    double v11 = [v4 colorScheme];
    [(SUUISwooshArtworkLoader *)v10 setPlaceholderColorWithColorScheme:v11];

    artworkLoader = self->_artworkLoader;
  }
  return artworkLoader;
}

- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4
{
  id v8 = [(SUUIStorePageSection *)self pageComponent];
  if ([v8 isMissingItemData])
  {
    id v7 = [(SUUIBrickSwooshPageSection *)self _missingItemLoader];
    [v7 loadItemsForPageComponent:v8 startIndex:a3 reason:a4];
  }
}

- (id)_missingItemLoader
{
  missingItemLoader = self->_missingItemLoader;
  if (!missingItemLoader)
  {
    id v4 = [SUUIMissingItemLoader alloc];
    v5 = [(SUUIStorePageSection *)self context];
    id v6 = [v5 resourceLoader];
    id v7 = [(SUUIMissingItemLoader *)v4 initWithResourceLoader:v6];
    id v8 = self->_missingItemLoader;
    self->_missingItemLoader = v7;

    [(SUUIMissingItemLoader *)self->_missingItemLoader setDelegate:self];
    missingItemLoader = self->_missingItemLoader;
  }
  return missingItemLoader;
}

- (id)_swooshViewController
{
  swooshViewController = self->_swooshViewController;
  if (!swooshViewController)
  {
    id v4 = [(SUUIStorePageSection *)self context];
    v5 = [v4 parentViewController];

    id v6 = [SUUIBrickSwooshViewController alloc];
    id v7 = [(SUUIStorePageSection *)self pageComponent];
    id v8 = [(SUUIBrickSwooshViewController *)v6 initWithSwoosh:v7];
    double v9 = self->_swooshViewController;
    self->_swooshViewController = v8;

    double v10 = self->_swooshViewController;
    double v11 = [v5 clientContext];
    [(SUUIBrickSwooshViewController *)v10 setClientContext:v11];

    double v12 = self->_swooshViewController;
    double v13 = [(SUUIStorePageSection *)self context];
    uint64_t v14 = [v13 colorScheme];
    [(SUUIBrickSwooshViewController *)v12 setColorScheme:v14];

    [(SUUIBrickSwooshViewController *)self->_swooshViewController setDelegate:self];
    [v5 addChildViewController:self->_swooshViewController];

    swooshViewController = self->_swooshViewController;
  }
  return swooshViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swooshViewController, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

@end