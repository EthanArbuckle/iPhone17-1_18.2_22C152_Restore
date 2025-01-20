@interface SUUIItemCollectionController
- (BOOL)_loadArtworkForItem:(id)a3 reason:(int64_t)a4;
- (NSArray)items;
- (SUUIClientContext)clientContext;
- (SUUIItemArtworkContext)artworkContext;
- (SUUIItemCollectionController)initWithClientContext:(id)a3;
- (SUUIItemCollectionDelegate)delegate;
- (SUUIResourceLoader)artworkLoader;
- (SUUIScreenshotDataConsumer)landscapeScreenshotDataConsumer;
- (SUUIScreenshotDataConsumer)portraitScreenshotDataConsumer;
- (SUUIStyledImageDataConsumer)iconDataConsumer;
- (_NSRange)_visibleItemRange;
- (double)numberOfPagesToCacheAhead;
- (id)_artworkLoader;
- (id)_iconArtworkRequestWithItem:(id)a3;
- (id)_initSUUIItemCollectionController;
- (id)_placeholderImageForItem:(id)a3;
- (id)_placeholderImageForScreenshot:(id)a3;
- (id)_screenshotArtworkRequestWithItem:(id)a3;
- (id)_screenshotForItem:(id)a3;
- (id)performActionForItemAtIndex:(int64_t)a3;
- (int64_t)numberOfItemsPerPage;
- (void)_enumerateVisibleCellLayoutsWithBlock:(id)a3;
- (void)_memoryWarningNotification:(id)a3;
- (void)_reloadForItemStateChange:(id)a3;
- (void)_reloadForRestrictionsChange;
- (void)_reloadScreenshotForCellLayout:(id)a3 item:(id)a4 isRestricted:(BOOL)a5;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)cancelArtworkLoadForItemIndex:(int64_t)a3;
- (void)configureCellLayout:(id)a3 forIndex:(int64_t)a4;
- (void)dealloc;
- (void)didEndDisplayingItemAtIndex:(int64_t)a3;
- (void)enterBackground;
- (void)enterForeground;
- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4;
- (void)itemStateCenterRestrictionsChanged:(id)a3;
- (void)loadNextPageOfArtworkWithReason:(int64_t)a3;
- (void)precacheNextPageArtworkForOffset:(CGPoint)a3 direction:(double)a4;
- (void)removeAllCachedResources;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setArtworkContext:(id)a3;
- (void)setArtworkLoader:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIconDataConsumer:(id)a3;
- (void)setItems:(id)a3;
- (void)setLandscapeScreenshotDataConsumer:(id)a3;
- (void)setNumberOfItemsPerPage:(int64_t)a3;
- (void)setNumberOfPagesToCacheAhead:(double)a3;
- (void)setPortraitScreenshotDataConsumer:(id)a3;
@end

@implementation SUUIItemCollectionController

- (id)_initSUUIItemCollectionController
{
  v11.receiver = self;
  v11.super_class = (Class)SUUIItemCollectionController;
  v2 = [(SUUIItemCollectionController *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_numberOfItemsPerPage = 10;
    v2->_numberOfPagesToCacheAhead = 1.5;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    itemIDsToArtworkRequestIDs = v3->_itemIDsToArtworkRequestIDs;
    v3->_itemIDsToArtworkRequestIDs = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    itemIDsToScreenshotRequestIDs = v3->_itemIDsToScreenshotRequestIDs;
    v3->_itemIDsToScreenshotRequestIDs = v6;

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v3 selector:sel__memoryWarningNotification_ name:*MEMORY[0x263F83340] object:0];
    v9 = +[SUUIItemStateCenter defaultCenter];
    [v9 addObserver:v3];
  }
  return v3;
}

- (SUUIItemCollectionController)initWithClientContext:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIItemCollectionController *)self _initSUUIItemCollectionController];
  v6 = v5;
  if (v5) {
    [(SUUIItemCollectionController *)v5 setClientContext:v4];
  }

  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83340] object:0];
  id v4 = +[SUUIItemStateCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SUUIItemCollectionController;
  [(SUUIItemCollectionController *)&v5 dealloc];
}

- (void)cancelArtworkLoadForItemIndex:(int64_t)a3
{
  if ([(NSArray *)self->_items count] > a3)
  {
    id v14 = [(NSArray *)self->_items objectAtIndex:a3];
    objc_super v5 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v14, "itemIdentifier"));
    v6 = [(NSMutableDictionary *)self->_itemIDsToArtworkRequestIDs objectForKey:v5];
    if (v6)
    {
      v7 = [(SUUIItemCollectionController *)self _artworkLoader];
      objc_msgSend(v7, "cancelRequestWithIdentifier:", objc_msgSend(v6, "unsignedIntegerValue"));

      v8 = [(SUUIItemCollectionController *)self _artworkLoader];
      v9 = objc_msgSend(v8, "cachedResourceForRequestIdentifier:", objc_msgSend(v6, "unsignedIntegerValue"));

      if (!v9) {
        [(NSMutableDictionary *)self->_itemIDsToArtworkRequestIDs removeObjectForKey:v5];
      }
    }
    v10 = [(NSMutableDictionary *)self->_itemIDsToScreenshotRequestIDs objectForKey:v5];

    if (v10)
    {
      objc_super v11 = [(SUUIItemCollectionController *)self _artworkLoader];
      objc_msgSend(v11, "cancelRequestWithIdentifier:", objc_msgSend(v10, "unsignedIntegerValue"));

      v12 = [(SUUIItemCollectionController *)self _artworkLoader];
      v13 = objc_msgSend(v12, "cachedResourceForRequestIdentifier:", objc_msgSend(v10, "unsignedIntegerValue"));

      if (!v13) {
        [(NSMutableDictionary *)self->_itemIDsToScreenshotRequestIDs removeObjectForKey:v5];
      }
    }
  }
}

- (void)didEndDisplayingItemAtIndex:(int64_t)a3
{
  if ([(NSArray *)self->_items count] > a3)
  {
    id v12 = [(NSArray *)self->_items objectAtIndexedSubscript:a3];
    objc_super v5 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "itemIdentifier"));
    v6 = [(NSMutableDictionary *)self->_itemIDsToArtworkRequestIDs objectForKeyedSubscript:v5];
    if (v6)
    {
      v7 = [(SUUIItemCollectionController *)self _artworkLoader];
      char v8 = objc_msgSend(v7, "trySetReason:forRequestWithIdentifier:", 0, objc_msgSend(v6, "unsignedIntegerValue"));

      if ((v8 & 1) == 0) {
        [(NSMutableDictionary *)self->_itemIDsToArtworkRequestIDs removeObjectForKey:v5];
      }
    }
    v9 = [(NSMutableDictionary *)self->_itemIDsToScreenshotRequestIDs objectForKeyedSubscript:v5];
    if (v9)
    {
      v10 = [(SUUIItemCollectionController *)self _artworkLoader];
      char v11 = objc_msgSend(v10, "trySetReason:forRequestWithIdentifier:", 0, objc_msgSend(v9, "unsignedIntegerValue"));

      if ((v11 & 1) == 0) {
        [(NSMutableDictionary *)self->_itemIDsToScreenshotRequestIDs removeObjectForKey:v5];
      }
    }
  }
}

- (void)configureCellLayout:(id)a3 forIndex:(int64_t)a4
{
  id v21 = a3;
  v6 = [(NSArray *)self->_items objectAtIndexedSubscript:a4];
  v7 = +[SUUIItemStateCenter defaultCenter];
  uint64_t v8 = objc_msgSend(v7, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v6, "parentalControlsRank"));
  [v21 setRestricted:v8];
  v9 = [v6 storeIdentifier];
  if (v9)
  {
    v10 = [v7 stateForItemWithStoreIdentifier:v9];
    [v21 setItemState:v10];
  }
  uint64_t v11 = [v6 artworkImage];
  if (v11)
  {
    id v12 = (void *)v11;
    v13 = [(SUUIItemCollectionController *)self artworkContext];
    id v14 = [v13 dataConsumerForItem:v6];

    v15 = [v14 imageForImage:v12];
    goto LABEL_13;
  }
  id v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "itemIdentifier"));
  id v12 = [(SUUIItemCollectionController *)self _artworkLoader];
  v16 = [(NSMutableDictionary *)self->_itemIDsToArtworkRequestIDs objectForKeyedSubscript:v14];
  v17 = v16;
  if (!v16) {
    goto LABEL_8;
  }
  v15 = objc_msgSend(v12, "cachedResourceForRequestIdentifier:", objc_msgSend(v16, "unsignedIntegerValue"));
  if (!v15)
  {
    if (objc_msgSend(v12, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v17, "unsignedIntegerValue")))
    {
LABEL_11:
      v15 = 0;
      goto LABEL_12;
    }
LABEL_8:
    v18 = [(SUUIItemCollectionController *)self _iconArtworkRequestWithItem:v6];
    v19 = v18;
    if (v18)
    {
      v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "requestIdentifier"));
      [(NSMutableDictionary *)self->_itemIDsToArtworkRequestIDs setObject:v20 forKeyedSubscript:v14];

      [v12 loadResourceWithRequest:v19 reason:1];
    }

    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
  if (!v15)
  {
    v15 = [(SUUIItemCollectionController *)self _placeholderImageForItem:v6];
  }
  [v21 setIconImage:v15];
  [(SUUIItemCollectionController *)self _reloadScreenshotForCellLayout:v21 item:v6 isRestricted:v8];
}

- (void)loadNextPageOfArtworkWithReason:(int64_t)a3
{
  uint64_t v5 = [(NSArray *)self->_items count];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    int64_t v8 = 0;
    do
    {
      if (v8 >= self->_numberOfItemsPerPage) {
        break;
      }
      v9 = [(NSArray *)self->_items objectAtIndexedSubscript:v7];
      BOOL v10 = [(SUUIItemCollectionController *)self _loadArtworkForItem:v9 reason:a3];

      v8 += v10;
      ++v7;
    }
    while (v6 != v7);
  }
}

- (void)precacheNextPageArtworkForOffset:(CGPoint)a3 direction:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v9 = objc_msgSend(WeakRetained, "itemCollectionController:itemPageRangeForOffset:", self, x, y);
  unint64_t v11 = v10;

  if (v11)
  {
    [(SUUIItemCollectionController *)self numberOfPagesToCacheAhead];
    *(float *)&double v12 = v12 * (double)v11;
    unint64_t v13 = vcvtps_s32_f32(*(float *)&v12);
    if (a4 <= 0.0)
    {
      uint64_t v20 = v9 - 1;
      NSUInteger v21 = [(NSArray *)self->_items count];
      if (v9 - 1 >= v21 - 1) {
        uint64_t v20 = v21 - 1;
      }
      uint64_t v22 = (v9 - v13) & ~((uint64_t)(v9 - v13) >> 63);
      if (v20 >= v22)
      {
        do
        {
          v23 = [(NSArray *)self->_items objectAtIndexedSubscript:v20];
          [(SUUIItemCollectionController *)self _loadArtworkForItem:v23 reason:-1];
        }
        while (v20-- > v22);
      }
    }
    else
    {
      uint64_t v14 = v9 + v11;
      NSUInteger v15 = v9 + v13;
      NSUInteger v16 = [(NSArray *)self->_items count];
      if (v15 >= v16) {
        int64_t v17 = v16;
      }
      else {
        int64_t v17 = v15;
      }
      uint64_t v18 = v14 & ~(v14 >> 63);
      if (v18 < v17)
      {
        do
        {
          v19 = [(NSArray *)self->_items objectAtIndexedSubscript:v18];
          [(SUUIItemCollectionController *)self _loadArtworkForItem:v19 reason:-1];

          ++v18;
        }
        while (v17 != v18);
      }
    }
  }
}

- (id)performActionForItemAtIndex:(int64_t)a3
{
  id v4 = [(NSArray *)self->_items objectAtIndex:a3];
  uint64_t v5 = +[SUUIItemStateCenter defaultCenter];
  uint64_t v6 = [v5 performActionForItem:v4 clientContext:self->_clientContext];

  return v6;
}

- (void)removeAllCachedResources
{
  [(SUUIResourceLoader *)self->_artworkLoader removeAllCachedResources];
  [(NSMutableDictionary *)self->_itemIDsToArtworkRequestIDs removeAllObjects];
  itemIDsToScreenshotRequestIDs = self->_itemIDsToScreenshotRequestIDs;
  [(NSMutableDictionary *)itemIDsToScreenshotRequestIDs removeAllObjects];
}

- (void)enterBackground
{
}

- (void)enterForeground
{
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  objc_msgSend(a3, "contentOffset", a4.x, a4.y);
  double v9 = a5->y - y;
  if (v9 == 0.0)
  {
    double v10 = 1.0;
    unint64_t v11 = self;
  }
  else
  {
    -[SUUIItemCollectionController precacheNextPageArtworkForOffset:direction:](self, "precacheNextPageArtworkForOffset:direction:");
    double x = a5->x;
    double y = a5->y;
    unint64_t v11 = self;
    double v10 = v9;
  }
  -[SUUIItemCollectionController precacheNextPageArtworkForOffset:direction:](v11, "precacheNextPageArtworkForOffset:direction:", x, y, v10);
}

- (void)setDelegate:(id)a3
{
  id v6 = a3;
  id v4 = objc_storeWeak((id *)&self->_delegate, v6);
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateProvidesScreenshots = objc_opt_respondsToSelector() & 1;
  }
  else
  {
    self->_delegateProvidesScreenshots = 0;
  }
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = +[SUUIItemStateCenter defaultCenter];
  uint64_t v9 = [v7 requestIdentifier];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__SUUIItemCollectionController_artworkRequest_didLoadImage___block_invoke;
  v12[3] = &unk_265406C70;
  v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  uint64_t v15 = v9;
  id v10 = v8;
  id v11 = v6;
  [(SUUIItemCollectionController *)self _enumerateVisibleCellLayoutsWithBlock:v12];
}

void __60__SUUIItemCollectionController_artworkRequest_didLoadImage___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v14 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 112) objectAtIndex:a2];
  int64_t v8 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v7, "itemIdentifier"));
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v8];
  if ([v9 unsignedIntegerValue] == *(void *)(a1 + 56))
  {
    if (*(void *)(a1 + 40))
    {
      objc_msgSend(v14, "setIconImage:");
    }
    else
    {
      id v13 = [*(id *)(a1 + 32) _placeholderImageForItem:v7];
      [v14 setIconImage:v13];
    }
    *a4 = 1;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v10 + 32))
    {
      id v11 = [*(id *)(v10 + 24) objectForKey:v8];
      if ([v11 unsignedIntegerValue] == *(void *)(a1 + 56))
      {
        if ((objc_msgSend(*(id *)(a1 + 48), "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v7, "parentalControlsRank")) & 1) == 0)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
          [WeakRetained itemCollectionController:*(void *)(a1 + 32) applyScreenshotImage:*(void *)(a1 + 40) toCellLayout:v14];
        }
        *a4 = 1;
      }
    }
  }
}

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__SUUIItemCollectionController_itemStateCenter_itemStatesChanged___block_invoke;
  v7[3] = &unk_265400890;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __66__SUUIItemCollectionController_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadForItemStateChange:*(void *)(a1 + 40)];
}

- (void)itemStateCenterRestrictionsChanged:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SUUIItemCollectionController_itemStateCenterRestrictionsChanged___block_invoke;
  block[3] = &unk_265400980;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __67__SUUIItemCollectionController_itemStateCenterRestrictionsChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadForRestrictionsChange];
}

- (void)_memoryWarningNotification:(id)a3
{
  [(SUUIResourceLoader *)self->_artworkLoader removeAllCachedResources];
  [(NSMutableDictionary *)self->_itemIDsToArtworkRequestIDs removeAllObjects];
  itemIDsToScreenshotRequestIDs = self->_itemIDsToScreenshotRequestIDs;
  [(NSMutableDictionary *)itemIDsToScreenshotRequestIDs removeAllObjects];
}

- (id)_artworkLoader
{
  artworkLoader = self->_artworkLoader;
  if (!artworkLoader)
  {
    id v4 = [[SUUIResourceLoader alloc] initWithClientContext:self->_clientContext];
    id v5 = self->_artworkLoader;
    self->_artworkLoader = v4;

    id v6 = self->_artworkLoader;
    id v7 = SUUIResourceLoaderGetNameForObject(self);
    [(SUUIResourceLoader *)v6 setName:v7];

    artworkLoader = self->_artworkLoader;
  }
  return artworkLoader;
}

- (void)_enumerateVisibleCellLayoutsWithBlock:(id)a3
{
  id v4 = (void (**)(id, int64_t, void *, unsigned char *))a3;
  int64_t v5 = [(NSArray *)self->_items count];
  unint64_t v6 = [(SUUIItemCollectionController *)self _visibleItemRange];
  unint64_t v8 = v6 + v7;
  if (v6 < v6 + v7)
  {
    int64_t v9 = v6;
    while (v9 < v5)
    {
      unsigned __int8 v13 = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v11 = [WeakRetained itemCollectionController:self cellLayoutForItemIndex:v9];

      if (v11) {
        v4[2](v4, v9, v11, &v13);
      }
      int v12 = v13;

      if (v12) {
        break;
      }
      if (++v9 >= v8) {
        break;
      }
    }
  }
}

- (id)_iconArtworkRequestWithItem:(id)a3
{
  id v4 = a3;
  int64_t v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 scale];
  double v7 = v6;

  unint64_t v8 = [(SUUIItemArtworkContext *)self->_artworkContext URLForItem:v4];
  if (v8
    || (v7 <= 1.0 ? (uint64_t v9 = 100) : (uint64_t v9 = 200),
        [v4 artworkURLForSize:v9],
        (unint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v10 = objc_alloc_init(SUUIArtworkRequest);
    id v11 = [(SUUIItemArtworkContext *)self->_artworkContext dataConsumerForItem:v4];
    if (v11)
    {
      [(SUUIArtworkRequest *)v10 setDataConsumer:v11];
    }
    else
    {
      int v12 = [(SUUIItemCollectionController *)self iconDataConsumer];
      [(SUUIArtworkRequest *)v10 setDataConsumer:v12];
    }
    [(SUUIArtworkRequest *)v10 setDelegate:self];
    [(SUUIArtworkRequest *)v10 setURL:v8];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)_loadArtworkForItem:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(SUUIItemCollectionController *)self _artworkLoader];
  unint64_t v8 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v6, "itemIdentifier"));
  uint64_t v9 = [(NSMutableDictionary *)self->_itemIDsToArtworkRequestIDs objectForKey:v8];

  if (v9)
  {
    char v10 = 0;
  }
  else
  {
    id v11 = [(SUUIItemCollectionController *)self _iconArtworkRequestWithItem:v6];
    int v12 = v11;
    if (v11)
    {
      itemIDsToArtworkRequestIDs = self->_itemIDsToArtworkRequestIDs;
      id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "requestIdentifier"));
      [(NSMutableDictionary *)itemIDsToArtworkRequestIDs setObject:v14 forKey:v8];

      char v10 = [v7 loadResourceWithRequest:v12 reason:a4];
    }
    else
    {
      char v10 = 0;
    }
  }
  uint64_t v15 = [(NSMutableDictionary *)self->_itemIDsToScreenshotRequestIDs objectForKey:v8];

  if (!v15)
  {
    NSUInteger v16 = [(SUUIItemCollectionController *)self _screenshotArtworkRequestWithItem:v6];
    int64_t v17 = v16;
    if (v16)
    {
      itemIDsToScreenshotRequestIDs = self->_itemIDsToScreenshotRequestIDs;
      v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "requestIdentifier"));
      [(NSMutableDictionary *)itemIDsToScreenshotRequestIDs setObject:v19 forKey:v8];

      [v7 loadResourceWithRequest:v17 reason:a4];
    }
  }
  return v10;
}

- (id)_placeholderImageForItem:(id)a3
{
  id v4 = a3;
  artworkContext = self->_artworkContext;
  if (artworkContext)
  {
    id v6 = [(SUUIItemArtworkContext *)artworkContext placeholderImageForItem:v4];
  }
  else
  {
    placeholderImage = self->_placeholderImage;
    if (!placeholderImage)
    {
      unint64_t v8 = [(SUUIItemCollectionController *)self iconDataConsumer];
      uint64_t v9 = [MEMORY[0x263F825C8] colorWithWhite:0.8 alpha:1.0];
      char v10 = [v8 imageForColor:v9];
      id v11 = self->_placeholderImage;
      self->_placeholderImage = v10;

      placeholderImage = self->_placeholderImage;
    }
    id v6 = placeholderImage;
  }
  int v12 = v6;

  return v12;
}

- (id)_placeholderImageForScreenshot:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 orientationString];
  int v6 = [v5 isEqualToString:@"landscape"];

  if (v6)
  {
    p_landscapeScreenshotPlaceholderImage = &self->_landscapeScreenshotPlaceholderImage;
    landscapeScreenshotPlaceholderImage = self->_landscapeScreenshotPlaceholderImage;
    if (landscapeScreenshotPlaceholderImage) {
      goto LABEL_7;
    }
    uint64_t v9 = [(SUUIItemCollectionController *)self landscapeScreenshotDataConsumer];
    [v4 sizeForVariant:@"low-dpi"];
    double v11 = v10;
    double v13 = v12;
    id v14 = [MEMORY[0x263F825C8] colorWithWhite:0.9 alpha:1.0];
    objc_msgSend(v9, "imageForColor:size:", v14, v11, v13);
    uint64_t v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
    portraitScreenshotPlaceholderImage = self->_landscapeScreenshotPlaceholderImage;
    self->_landscapeScreenshotPlaceholderImage = v15;
  }
  else
  {
    p_landscapeScreenshotPlaceholderImage = &self->_portraitScreenshotPlaceholderImage;
    landscapeScreenshotPlaceholderImage = self->_portraitScreenshotPlaceholderImage;
    if (landscapeScreenshotPlaceholderImage) {
      goto LABEL_7;
    }
    uint64_t v9 = [(SUUIItemCollectionController *)self portraitScreenshotDataConsumer];
    [v4 sizeForVariant:@"low-dpi"];
    double v18 = v17;
    double v20 = v19;
    id v14 = [MEMORY[0x263F825C8] colorWithWhite:0.9 alpha:1.0];
    objc_msgSend(v9, "imageForColor:size:", v14, v18, v20);
    NSUInteger v21 = (UIImage *)objc_claimAutoreleasedReturnValue();
    portraitScreenshotPlaceholderImage = self->_portraitScreenshotPlaceholderImage;
    self->_portraitScreenshotPlaceholderImage = v21;
  }

  landscapeScreenshotPlaceholderImage = *p_landscapeScreenshotPlaceholderImage;
LABEL_7:
  uint64_t v22 = landscapeScreenshotPlaceholderImage;

  return v22;
}

- (void)_reloadForItemStateChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v12 = [v11 storeIdentifier];
        [v5 setObject:v11 forKey:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__SUUIItemCollectionController__reloadForItemStateChange___block_invoke;
  v14[3] = &unk_265406C98;
  v14[4] = self;
  id v15 = v5;
  id v13 = v5;
  [(SUUIItemCollectionController *)self _enumerateVisibleCellLayoutsWithBlock:v14];
}

void __58__SUUIItemCollectionController__reloadForItemStateChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v5 = [*(id *)(*(void *)(a1 + 32) + 112) objectAtIndex:a2];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = [v5 storeIdentifier];
  uint64_t v8 = [v6 objectForKey:v7];

  if (v8) {
    [v9 setItemState:v8 animated:1];
  }
}

- (void)_reloadForRestrictionsChange
{
  v3 = +[SUUIItemStateCenter defaultCenter];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__SUUIItemCollectionController__reloadForRestrictionsChange__block_invoke;
  v5[3] = &unk_265406C98;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [(SUUIItemCollectionController *)self _enumerateVisibleCellLayoutsWithBlock:v5];
}

void __60__SUUIItemCollectionController__reloadForRestrictionsChange__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 112);
  id v6 = a3;
  id v8 = [v5 objectAtIndex:a2];
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v8, "parentalControlsRank"));
  [v6 setRestricted:v7];
  [*(id *)(a1 + 32) _reloadScreenshotForCellLayout:v6 item:v8 isRestricted:v7];
}

- (void)_reloadScreenshotForCellLayout:(id)a3 item:(id)a4 isRestricted:(BOOL)a5
{
  BOOL v5 = a5;
  id v22 = a3;
  id v8 = a4;
  id v9 = [(SUUIItemCollectionController *)self _screenshotForItem:v8];
  if (v9)
  {
    if (v5)
    {
      double v10 = [(SUUIItemCollectionController *)self _placeholderImageForScreenshot:v9];
LABEL_16:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained itemCollectionController:self applyScreenshotImage:v10 toCellLayout:v22];

      goto LABEL_17;
    }
    double v11 = [(SUUIItemCollectionController *)self _artworkLoader];
    double v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "itemIdentifier"));
    id v13 = [(NSMutableDictionary *)self->_itemIDsToScreenshotRequestIDs objectForKeyedSubscript:v12];
    id v14 = v13;
    if (v13)
    {
      double v10 = objc_msgSend(v11, "cachedResourceForRequestIdentifier:", objc_msgSend(v13, "unsignedIntegerValue"));
      if ((objc_msgSend(v11, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v14, "unsignedIntegerValue")) & 1) == 0)
      {
        id v15 = [(SUUIItemCollectionController *)self _screenshotArtworkRequestWithItem:v8];
        long long v16 = v15;
        if (v15)
        {
          long long v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "requestIdentifier"));
          [(NSMutableDictionary *)self->_itemIDsToScreenshotRequestIDs setObject:v17 forKeyedSubscript:v12];

          [v11 loadResourceWithRequest:v16 reason:1];
        }
      }
      if (v10) {
        goto LABEL_15;
      }
    }
    else
    {
      long long v18 = [(SUUIItemCollectionController *)self _screenshotArtworkRequestWithItem:v8];
      long long v19 = v18;
      if (v18)
      {
        double v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "requestIdentifier"));
        [(NSMutableDictionary *)self->_itemIDsToScreenshotRequestIDs setObject:v20 forKeyedSubscript:v12];

        [v11 loadResourceWithRequest:v19 reason:1];
      }
    }
    double v10 = [(SUUIItemCollectionController *)self _placeholderImageForScreenshot:v9];
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:
}

- (id)_screenshotArtworkRequestWithItem:(id)a3
{
  id v4 = [(SUUIItemCollectionController *)self _screenshotForItem:a3];
  BOOL v5 = [v4 URLForVariant:@"low-dpi"];
  if (v5)
  {
    id v6 = objc_alloc_init(SUUIArtworkRequest);
    [(SUUIArtworkRequest *)v6 setDelegate:self];
    uint64_t v7 = [v4 orientationString];
    int v8 = [v7 isEqualToString:@"landscape"];

    if (v8) {
      [(SUUIItemCollectionController *)self landscapeScreenshotDataConsumer];
    }
    else {
    id v9 = [(SUUIItemCollectionController *)self portraitScreenshotDataConsumer];
    }
    [(SUUIArtworkRequest *)v6 setDataConsumer:v9];

    [(SUUIArtworkRequest *)v6 setURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_screenshotForItem:(id)a3
{
  if (self->_delegateProvidesScreenshots)
  {
    p_delegate = &self->_delegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    uint64_t v7 = [WeakRetained itemCollectionController:self screenshotForItem:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (_NSRange)_visibleItemRange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v4 = [WeakRetained visibleItemRangeForItemCollectionController:self];
  NSUInteger v6 = v5;

  if (v4)
  {
    ++v6;
    NSUInteger v7 = v4 - 1;
  }
  else
  {
    NSUInteger v7 = 0;
  }
  if (v6 + v7 >= [(NSArray *)self->_items count] - 1) {
    NSUInteger v8 = v6;
  }
  else {
    NSUInteger v8 = v6 + 1;
  }
  NSUInteger v9 = v7;
  result.length = v8;
  result.location = v9;
  return result;
}

- (SUUIItemCollectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIItemCollectionDelegate *)WeakRetained;
}

- (SUUIResourceLoader)artworkLoader
{
  return self->_artworkLoader;
}

- (void)setArtworkLoader:(id)a3
{
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SUUIItemArtworkContext)artworkContext
{
  return self->_artworkContext;
}

- (void)setArtworkContext:(id)a3
{
}

- (SUUIStyledImageDataConsumer)iconDataConsumer
{
  return self->_iconDataConsumer;
}

- (void)setIconDataConsumer:(id)a3
{
}

- (SUUIScreenshotDataConsumer)landscapeScreenshotDataConsumer
{
  return self->_landscapeScreenshotDataConsumer;
}

- (void)setLandscapeScreenshotDataConsumer:(id)a3
{
}

- (SUUIScreenshotDataConsumer)portraitScreenshotDataConsumer
{
  return self->_portraitScreenshotDataConsumer;
}

- (void)setPortraitScreenshotDataConsumer:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (int64_t)numberOfItemsPerPage
{
  return self->_numberOfItemsPerPage;
}

- (void)setNumberOfItemsPerPage:(int64_t)a3
{
  self->_numberOfItemsPerPage = a3;
}

- (double)numberOfPagesToCacheAhead
{
  return self->_numberOfPagesToCacheAhead;
}

- (void)setNumberOfPagesToCacheAhead:(double)a3
{
  self->_numberOfPagesToCacheAhead = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_portraitScreenshotDataConsumer, 0);
  objc_storeStrong((id *)&self->_landscapeScreenshotDataConsumer, 0);
  objc_storeStrong((id *)&self->_iconDataConsumer, 0);
  objc_storeStrong((id *)&self->_artworkContext, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_portraitScreenshotPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_landscapeScreenshotPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_itemIDsToScreenshotRequestIDs, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_itemIDsToArtworkRequestIDs, 0);
}

@end