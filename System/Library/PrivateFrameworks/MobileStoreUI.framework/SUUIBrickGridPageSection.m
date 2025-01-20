@interface SUUIBrickGridPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SUUIBrickGridPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)_contentInsetsForColumnIndex:(int64_t)a3 rowWidth:(double)a4;
- (id)_editorialLayoutForBrick:(id)a3;
- (id)_missingItemLoader;
- (id)cellForIndexPath:(id)a3;
- (id)clickEventWithLink:(id)a3 elementName:(id)a4 index:(int64_t)a5;
- (int64_t)numberOfCells;
- (void)_enumerateVisibleBricksUsingBlock:(id)a3;
- (void)_loadArtworkForBrick:(id)a3 artworkLoader:(id)a4 reason:(int64_t)a5;
- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)collectionViewDidSelectItemAtIndexPath:(id)a3;
- (void)dealloc;
- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5;
- (void)prefetchResourcesWithReason:(int64_t)a3;
- (void)willAppearInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SUUIBrickGridPageSection

- (SUUIBrickGridPageSection)initWithPageComponent:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SUUIBrickGridPageSection;
  v3 = [(SUUIStorePageSection *)&v15 initWithPageComponent:a3];
  if (v3)
  {
    v4 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    double v6 = 145.0;
    if (v5 == 1) {
      double v6 = 208.0;
    }
    uint64_t v7 = 2;
    if (v5 == 1) {
      uint64_t v7 = 3;
    }
    double v8 = 10.0;
    double v9 = 20.0;
    if (v5 == 1) {
      double v8 = 20.0;
    }
    else {
      double v9 = 15.0;
    }
    *(void *)&v3->_baseHeight = qword_2568A0A70[v5 == 1];
    v3->_columnWidth = v6;
    v3->_numberOfColumns = v7;
    v3->_paddingHorizontal = v8;
    v3->_paddingTop = v9;
    uint64_t v10 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    artworkRequests = v3->_artworkRequests;
    v3->_artworkRequests = (NSMapTable *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    editorialLayouts = v3->_editorialLayouts;
    v3->_editorialLayouts = (NSMapTable *)v12;
  }
  return v3;
}

- (void)dealloc
{
  [(SUUIMissingItemLoader *)self->_missingItemLoader setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIBrickGridPageSection;
  [(SUUIStorePageSection *)&v3 dealloc];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v13 = a4;
  id v6 = a3;
  uint64_t v7 = [(SUUIStorePageSection *)self pageComponent];
  double v8 = [v7 viewElement];
  [v13 addItemViewElement:v8];

  unint64_t v9 = [v6 item];
  uint64_t v10 = [(SUUIStorePageSection *)self pageComponent];
  v11 = [v10 children];

  if (v9 < [v11 count])
  {
    uint64_t v12 = [v11 objectAtIndex:v9];
    objc_msgSend(v13, "addItemIdentifier:", objc_msgSend(v12, "brickIdentifier"));
  }
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUUIStorePageSection *)self context];
  id v6 = [v5 collectionView];
  uint64_t v7 = [v6 dequeueReusableCellWithReuseIdentifier:0x270504E30 forIndexPath:v4];
  double v8 = [(SUUIStorePageSection *)self backgroundColorForIndexPath:v4];
  [v7 setBackgroundColor:v8];

  unint64_t v9 = [v4 row];
  int64_t v10 = (uint64_t)v9 % self->_numberOfColumns;
  [v6 bounds];
  [(SUUIBrickGridPageSection *)self _contentInsetsForColumnIndex:v10 rowWidth:v11];
  objc_msgSend(v7, "setContentInsets:");
  uint64_t v12 = [(SUUIStorePageSection *)self pageComponent];
  id v13 = [v12 children];

  if (v9 < [v13 count])
  {
    v14 = [v13 objectAtIndex:v9];
    objc_super v15 = [v14 accessibilityLabel];
    [v7 setAccessibilityLabel:v15];

    v16 = [(SUUIBrickGridPageSection *)self _editorialLayoutForBrick:v14];
    [v7 applyEditorialLayout:v16 orientation:0];
    v17 = [v5 resourceLoader];
    v18 = [(NSMapTable *)self->_artworkRequests objectForKey:v14];
    uint64_t v19 = [v18 unsignedIntegerValue];

    if (!v19) {
      goto LABEL_5;
    }
    v20 = [v17 cachedResourceForRequestIdentifier:v19];
    if (v20)
    {
LABEL_9:
      [v7 setBrickImage:v20];
      v26 = [v5 colorScheme];
      [v7 setColoringWithColorScheme:v26];

      goto LABEL_11;
    }
    if (([v17 trySetReason:1 forRequestWithIdentifier:v19] & 1) == 0) {
LABEL_5:
    }
      [(SUUIBrickGridPageSection *)self _loadArtworkForBrick:v14 artworkLoader:v17 reason:1];
    placeholderImage = self->_placeholderImage;
    if (!placeholderImage)
    {
      +[SUUIStyledImageDataConsumer brickConsumer];
      v22 = v28 = v16;
      v23 = [MEMORY[0x263F825C8] colorWithWhite:0.8 alpha:1.0];
      v24 = [v22 imageForColor:v23];
      v25 = self->_placeholderImage;
      self->_placeholderImage = v24;

      v16 = v28;
      placeholderImage = self->_placeholderImage;
    }
    v20 = placeholderImage;
    goto LABEL_9;
  }
  [v7 applyEditorialLayout:0 orientation:0];
  [v7 setBrickImage:0];
LABEL_11:

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  uint64_t v5 = [a3 item];
  int64_t numberOfColumns = self->_numberOfColumns;
  uint64_t v7 = [(SUUIStorePageSection *)self context];
  double v8 = [v7 collectionView];

  int64_t v9 = v5 % self->_numberOfColumns;
  [v8 bounds];
  [(SUUIBrickGridPageSection *)self _contentInsetsForColumnIndex:v9 rowWidth:v10];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double columnWidth = self->_columnWidth;
  v20 = [(SUUIStorePageSection *)self pageComponent];
  v21 = [v20 children];

  uint64_t v22 = [v21 count];
  int64_t v23 = self->_numberOfColumns;
  if (v23 >= 1)
  {
    uint64_t v24 = v22;
    uint64_t v25 = v23 * (v5 / numberOfColumns);
    if (v25 < v22)
    {
      uint64_t v26 = v23 * (v5 / numberOfColumns);
      do
      {
        double baseHeight = self->_baseHeight;
        v28 = [v21 objectAtIndex:v26];
        v29 = [(SUUIBrickGridPageSection *)self _editorialLayoutForBrick:v28];

        if (v29)
        {
          [v29 layoutHeightForOrientation:0 expanded:1];
          double baseHeight = v30 + self->_baseHeight + 27.0;
        }
        if (v4 < baseHeight) {
          double v4 = baseHeight;
        }
      }
      while (++v26 < self->_numberOfColumns + v25 && v26 < v24);
    }
  }

  double v32 = v14 + v18 + columnWidth;
  double v33 = v12 + v16 + v4;
  result.height = v33;
  result.width = v32;
  return result;
}

- (id)clickEventWithLink:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)SUUIBrickGridPageSection;
  uint64_t v7 = -[SUUIStorePageSection clickEventWithLink:elementName:index:](&v13, sel_clickEventWithLink_elementName_index_, a3, a4);
  if (v7)
  {
    double v8 = [(SUUIStorePageSection *)self context];
    int64_t v9 = [v8 collectionView];

    double v10 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", a5, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    double v11 = [v9 cellForItemAtIndexPath:v10];

    SUUIMetricsSetClickEventPositionWithView(v7, v11);
  }
  return v7;
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUUIStorePageSection *)self pageComponent];
  id v14 = [v5 children];

  unint64_t v6 = [v4 item];
  BOOL v7 = v6 >= [v14 count];
  double v8 = v14;
  if (!v7)
  {
    int64_t v9 = [v14 objectAtIndex:v6];
    double v10 = [v9 link];
    double v11 = [(SUUIBrickGridPageSection *)self clickEventWithLink:v10 elementName:*MEMORY[0x263F7BBA0] index:v6];
    if (v11)
    {
      double v12 = [(SUUIStorePageSection *)self context];
      objc_super v13 = [v12 metricsController];
      [v13 recordEvent:v11];
    }
    [(SUUIStorePageSection *)self showPageWithLink:v10];

    double v8 = v14;
  }
}

- (int64_t)numberOfCells
{
  objc_super v3 = [(SUUIStorePageSection *)self pageComponent];
  id v4 = [v3 children];
  uint64_t v5 = [v4 count];

  int64_t v6 = v5 % self->_numberOfColumns + v5;
  return v6;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  uint64_t v5 = [(SUUIStorePageSection *)self context];
  int64_t v6 = [v5 resourceLoader];

  BOOL v7 = [(SUUIStorePageSection *)self pageComponent];
  double v8 = [v7 children];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__SUUIBrickGridPageSection_prefetchResourcesWithReason___block_invoke;
  v10[3] = &unk_265401450;
  v10[4] = self;
  id v9 = v6;
  id v11 = v9;
  double v12 = v14;
  int64_t v13 = a3;
  [v8 enumerateObjectsUsingBlock:v10];

  _Block_object_dispose(v14, 8);
}

void __56__SUUIBrickGridPageSection_prefetchResourcesWithReason___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v7 = a2;
  int64_t v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "objectForKey:");
  if (!v6)
  {
    [*(id *)(a1 + 32) _loadArtworkForBrick:v7 artworkLoader:*(void *)(a1 + 40) reason:*(void *)(a1 + 56)];
    *a4 = ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) > 8;
  }
}

- (void)willAppearInContext:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SUUIStorePageSection *)self context];
  int64_t v6 = [v5 collectionView];

  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270504E30];
  id v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 1)
  {
    [v6 bounds];
    int64_t v9 = 3;
    if (v10 > v11) {
      int64_t v9 = 4;
    }
    self->_int64_t numberOfColumns = v9;
  }
  double v12 = [(SUUIStorePageSection *)self pageComponent];
  int64_t v13 = [v12 children];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [(SUUIBrickGridPageSection *)self _editorialLayoutForBrick:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        [v19 enqueueLayoutRequests];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  v20.receiver = self;
  v20.super_class = (Class)SUUIBrickGridPageSection;
  [(SUUIStorePageSection *)&v20 willAppearInContext:v4];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v25 = a4;
  id v7 = [(SUUIStorePageSection *)self context];
  [v7 portraitPageWidth];
  double v9 = v8;
  double v10 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11 == 1)
  {
    if (width <= height)
    {
      int64_t v13 = 3;
    }
    else
    {
      [v7 landscapePageWidth];
      double v9 = v12;
      int64_t v13 = 4;
    }
    self->_int64_t numberOfColumns = v13;
  }
  id v14 = [(SUUIStorePageSection *)self context];
  uint64_t v15 = [v14 collectionView];

  int64_t v16 = [(SUUIStorePageSection *)self sectionIndex];
  uint64_t v17 = [v15 indexPathsForVisibleItems];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v22 section] == v16)
        {
          long long v23 = [v15 cellForItemAtIndexPath:v22];
          -[SUUIBrickGridPageSection _contentInsetsForColumnIndex:rowWidth:](self, "_contentInsetsForColumnIndex:rowWidth:", [v22 item] % self->_numberOfColumns, v9);
          objc_msgSend(v23, "setContentInsets:");
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v19);
  }
  v26.receiver = self;
  v26.super_class = (Class)SUUIBrickGridPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v26, sel_willTransitionToSize_withTransitionCoordinator_, v25, width, height);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 requestIdentifier];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__SUUIBrickGridPageSection_artworkRequest_didLoadImage___block_invoke;
  v9[3] = &unk_265401478;
  id v10 = v6;
  uint64_t v11 = v7;
  v9[4] = self;
  id v8 = v6;
  [(SUUIBrickGridPageSection *)self _enumerateVisibleBricksUsingBlock:v9];
}

void __56__SUUIBrickGridPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v11 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKey:a2];
  if ([v11 unsignedIntegerValue] == *(void *)(a1 + 48))
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", a3, objc_msgSend(*(id *)(a1 + 32), "sectionIndex"));
    id v8 = [*(id *)(a1 + 32) context];
    double v9 = [v8 collectionView];
    id v10 = [v9 cellForItemAtIndexPath:v7];

    [v10 setBrickImage:*(void *)(a1 + 40)];
    *a4 = 1;
  }
}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 count])
  {
    double v9 = [(SUUIStorePageSection *)self pageComponent];
    id v10 = (id)[v9 _updateWithMissingItems:v7];
  }
  if ([v8 count])
  {
    id v11 = [(SUUIStorePageSection *)self pageComponent];
    double v12 = [v11 _updateWithInvalidItemIdentifiers:v8];
    if ([v12 count])
    {
      id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
      int64_t v14 = [(SUUIStorePageSection *)self sectionIndex];
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __82__SUUIBrickGridPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke;
      long long v21 = &unk_2654014A0;
      id v22 = v13;
      int64_t v23 = v14;
      id v15 = v13;
      [v12 enumerateIndexesUsingBlock:&v18];
      int64_t v16 = [(SUUIStorePageSection *)self context];
      uint64_t v17 = [v16 collectionView];

      [v17 deleteItemsAtIndexPaths:v15];
    }
  }
}

void __82__SUUIBrickGridPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x263F088C8] indexPathForItem:a2 inSection:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

- (UIEdgeInsets)_contentInsetsForColumnIndex:(int64_t)a3 rowWidth:(double)a4
{
  int64_t numberOfColumns = self->_numberOfColumns;
  uint64_t v5 = numberOfColumns - 1;
  if (numberOfColumns == 1)
  {
    float v6 = (a4 - self->_columnWidth) * 0.5;
    double paddingHorizontal = floorf(v6);
    p_paddingTop = &self->_paddingTop;
    double v9 = paddingHorizontal;
  }
  else
  {
    double paddingHorizontal = self->_paddingHorizontal;
    float v10 = (a4 + paddingHorizontal * -2.0 - self->_columnWidth * (double)numberOfColumns) / (double)v5;
    float v11 = floorf(v10);
    if (a3)
    {
      p_paddingTop = &self->_paddingTop;
      double v12 = floorf(v11 * 0.5);
      if (v5 == a3) {
        double v9 = self->_paddingHorizontal;
      }
      else {
        double v9 = v12;
      }
      double paddingHorizontal = v12;
    }
    else
    {
      p_paddingTop = &self->_paddingTop;
      double v9 = floorf(v11 * 0.5);
    }
  }
  double v13 = *p_paddingTop;
  double v14 = 0.0;
  result.right = v9;
  result.bottom = v14;
  result.left = paddingHorizontal;
  result.top = v13;
  return result;
}

- (id)_editorialLayoutForBrick:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_editorialLayouts objectForKey:v4];
  if (!v5)
  {
    float v6 = [v4 editorial];
    if (v6)
    {
      id v7 = [SUUIEditorialLayout alloc];
      id v8 = [(SUUIStorePageSection *)self context];
      double v9 = [v8 textLayoutCache];
      uint64_t v5 = [(SUUIEditorialLayout *)v7 initWithEditorial:v6 layoutCache:v9];

      [(SUUIEditorialLayout *)v5 setLayoutWidth:0 forOrientation:self->_columnWidth];
      [(NSMapTable *)self->_editorialLayouts setObject:v5 forKey:v4];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (void)_enumerateVisibleBricksUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUUIStorePageSection *)self pageComponent];
  float v6 = [v5 children];

  id v7 = [(SUUIStorePageSection *)self context];
  id v8 = [v7 collectionView];

  int64_t v9 = [(SUUIStorePageSection *)self sectionIndex];
  float v10 = [v8 indexPathsForVisibleItems];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__SUUIBrickGridPageSection__enumerateVisibleBricksUsingBlock___block_invoke;
  v13[3] = &unk_2654014C8;
  id v15 = v4;
  int64_t v16 = v9;
  id v14 = v6;
  id v11 = v4;
  id v12 = v6;
  [v10 enumerateObjectsUsingBlock:v13];
}

void __62__SUUIBrickGridPageSection__enumerateVisibleBricksUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 section] == *(void *)(a1 + 48))
  {
    unint64_t v3 = [v5 item];
    if (v3 < [*(id *)(a1 + 32) count])
    {
      id v4 = [*(id *)(a1 + 32) objectAtIndex:v3];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)_loadArtworkForBrick:(id)a3 artworkLoader:(id)a4 reason:(int64_t)a5
{
  id v15 = a3;
  id v8 = a4;
  int64_t v9 = [v15 artwork];
  float v10 = [v9 URL];

  if (v10)
  {
    id v11 = objc_alloc_init(SUUIArtworkRequest);
    id v12 = +[SUUIStyledImageDataConsumer brickConsumerWithBrickSize:](SUUIStyledImageDataConsumer, "brickConsumerWithBrickSize:", self->_columnWidth, self->_baseHeight);
    [(SUUIArtworkRequest *)v11 setDataConsumer:v12];

    [(SUUIArtworkRequest *)v11 setDelegate:self];
    [(SUUIArtworkRequest *)v11 setURL:v10];
    artworkRequests = self->_artworkRequests;
    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SUUIResourceRequest requestIdentifier](v11, "requestIdentifier"));
    [(NSMapTable *)artworkRequests setObject:v14 forKey:v15];

    [v8 loadResourceWithRequest:v11 reason:a5];
  }
}

- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4
{
  id v8 = [(SUUIStorePageSection *)self pageComponent];
  if ([v8 isMissingItemData])
  {
    id v7 = [(SUUIBrickGridPageSection *)self _missingItemLoader];
    [v7 loadItemsForPageComponent:v8 startIndex:a3 reason:a4];
  }
}

- (id)_missingItemLoader
{
  missingItemLoader = self->_missingItemLoader;
  if (!missingItemLoader)
  {
    id v4 = [SUUIMissingItemLoader alloc];
    id v5 = [(SUUIStorePageSection *)self context];
    float v6 = [v5 resourceLoader];
    id v7 = [(SUUIMissingItemLoader *)v4 initWithResourceLoader:v6];
    id v8 = self->_missingItemLoader;
    self->_missingItemLoader = v7;

    [(SUUIMissingItemLoader *)self->_missingItemLoader setDelegate:self];
    missingItemLoader = self->_missingItemLoader;
  }
  return missingItemLoader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_editorialLayouts, 0);
  objc_storeStrong((id *)&self->_artworkRequests, 0);
}

@end