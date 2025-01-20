@interface SUUIGallerySwooshPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SUUIGallerySwooshPageSection)initWithPageComponent:(id)a3;
- (id)_newArtworkRequestWithArtwork:(id)a3;
- (id)_swooshViewController;
- (id)cellForIndexPath:(id)a3;
- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4;
- (int64_t)numberOfCells;
- (void)_addImpressionForIndex:(int64_t)a3 toSession:(id)a4;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)dealloc;
- (void)prefetchResourcesWithReason:(int64_t)a3;
- (void)swoosh:(id)a3 didChangePlaybackState:(int64_t)a4 forItemAtIndex:(int64_t)a5;
- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4;
- (void)swoosh:(id)a3 willDisplayCellAtIndex:(int64_t)a4;
- (void)willAppearInContext:(id)a3;
@end

@implementation SUUIGallerySwooshPageSection

- (SUUIGallerySwooshPageSection)initWithPageComponent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIGallerySwooshPageSection;
  v3 = [(SUUIStorePageSection *)&v7 initWithPageComponent:a3];
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    componentArtworkRequests = v3->_componentArtworkRequests;
    v3->_componentArtworkRequests = (NSMapTable *)v4;
  }
  return v3;
}

- (void)dealloc
{
  [(SUUIGallerySwooshViewController *)self->_swooshViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIGallerySwooshPageSection;
  [(SUUIStorePageSection *)&v3 dealloc];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [(SUUIStorePageSection *)self pageComponent];
  objc_super v7 = [v6 viewElement];
  [v5 addItemViewElement:v7];

  v8 = [(SUUIGallerySwooshViewController *)self->_swooshViewController indexPathsForVisibleItems];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[SUUIGallerySwooshPageSection _addImpressionForIndex:toSession:](self, "_addImpressionForIndex:toSession:", [*(id *)(*((void *)&v13 + 1) + 8 * v12++) item], v5);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)willAppearInContext:(id)a3
{
  id v3 = [a3 collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SUUIGallerySwooshPageSectionReuseIdentifier"];
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIStorePageSection *)self context];
  v6 = [v5 collectionView];

  objc_super v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"SUUIGallerySwooshPageSectionReuseIdentifier" forIndexPath:v4];

  v8 = [(SUUIGallerySwooshPageSection *)self _swooshViewController];
  uint64_t v9 = [v8 view];

  uint64_t v10 = [v7 contentChildView];

  if (v9 != v10)
  {
    [v7 setContentChildView:v9];
    objc_msgSend(v7, "setContentInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  }

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SUUIStorePageSection *)self context];
  id v5 = [v4 collectionView];

  v6 = [(SUUIGallerySwooshPageSection *)self _swooshViewController];
  objc_super v7 = [v6 view];

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

- (int64_t)numberOfCells
{
  return 1;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  id v4 = [(SUUIStorePageSection *)self pageComponent];
  id v20 = [v4 mediaComponents];

  id v5 = [(SUUIStorePageSection *)self context];
  uint64_t v18 = [v5 resourceLoader];

  v19 = [(SUUIGallerySwooshPageSection *)self _swooshViewController];
  uint64_t v6 = [v20 count];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 1;
    do
    {
      double v10 = [v20 objectAtIndex:v9 - 1];
      double v11 = [(NSMapTable *)self->_componentArtworkRequests objectForKey:v10];

      if (!v11)
      {
        double v12 = [v19 artworkForItemAtIndex:v9 - 1];
        id v13 = [(SUUIGallerySwooshPageSection *)self _newArtworkRequestWithArtwork:v12];
        long long v14 = v13;
        if (v13)
        {
          componentArtworkRequests = self->_componentArtworkRequests;
          long long v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "requestIdentifier"));
          [(NSMapTable *)componentArtworkRequests setObject:v16 forKey:v10];

          [v18 loadResourceWithRequest:v14 reason:a3];
          ++v8;
        }
      }
      if (v9 >= v7) {
        break;
      }
      ++v9;
    }
    while (v8 < 4);
  }
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SUUIStorePageSection *)self pageComponent];
  uint64_t v9 = [v8 mediaComponents];

  uint64_t v10 = [v6 requestIdentifier];
  double v11 = [(SUUIGallerySwooshPageSection *)self _swooshViewController];
  double v12 = [v11 indexPathsForVisibleItems];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    id v22 = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v17, "item"));
        v19 = [(NSMapTable *)self->_componentArtworkRequests objectForKey:v18];
        if ([v19 unsignedIntegerValue] == v10)
        {
          id v20 = [(SUUIGallerySwooshPageSection *)self _swooshViewController];
          uint64_t v21 = [v17 item];
          id v7 = v22;
          [v20 setImage:v22 forItemAtIndex:v21];

          goto LABEL_11;
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      id v7 = v22;
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)swoosh:(id)a3 didChangePlaybackState:(int64_t)a4 forItemAtIndex:(int64_t)a5
{
  v23[2] = *MEMORY[0x263EF8340];
  uint64_t v8 = [(SUUIStorePageSection *)self context];
  uint64_t v9 = [v8 metricsController];

  if ([v9 canRecordEventWithType:*MEMORY[0x263F7BB60]])
  {
    id v10 = objc_alloc_init(MEMORY[0x263F7B268]);
    double v11 = SUUIMetricsMediaEventTypeForPlaybackState((id)a4);
    [v10 setMediaEventType:v11];

    double v12 = [(SUUIStorePageSection *)self pageComponent];
    uint64_t v13 = [v12 mediaComponents];
    uint64_t v14 = [v13 objectAtIndex:a5];

    uint64_t v15 = [v14 mediaIdentifier];
    if (v15)
    {
      long long v16 = [NSNumber numberWithLongLong:v15];
      [v10 setItemIdentifier:v16];
    }
    v17 = [v14 mediaURLString];
    [v10 setMediaURL:v17];

    uint64_t v18 = [(SUUIStorePageSection *)self pageComponent];
    v19 = [v9 locationWithPageComponent:v18];

    uint64_t v20 = [v9 locationWithPageComponent:v14];
    uint64_t v21 = (void *)v20;
    if (v19 && v20)
    {
      v23[0] = v20;
      v23[1] = v19;
      id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
      [v10 setLocationWithEventLocations:v22];
    }
    [v9 recordEvent:v10];
  }
}

- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4
{
  id v13 = a3;
  id v6 = [(SUUIStorePageSection *)self pageComponent];
  id v7 = [v6 mediaComponents];
  uint64_t v8 = [v7 objectAtIndex:a4];

  uint64_t v9 = [(SUUIStorePageSection *)self clickEventWithMedia:v8 elementName:*MEMORY[0x263F7BBB8] index:a4];
  if (v9)
  {
    id v10 = [(SUUIStorePageSection *)self context];
    double v11 = [v10 metricsController];
    [v11 recordEvent:v9];
  }
  if ([v8 mediaType])
  {
    [v13 performActionForItemAtIndex:a4 animated:1];
  }
  else
  {
    double v12 = [v8 link];
    [(SUUIStorePageSection *)self showPageWithLink:v12];
  }
}

- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SUUIStorePageSection *)self context];
  uint64_t v8 = [v7 resourceLoader];

  uint64_t v9 = [(SUUIStorePageSection *)self pageComponent];
  id v10 = [v9 mediaComponents];
  double v11 = [v10 objectAtIndex:a4];

  double v12 = [(NSMapTable *)self->_componentArtworkRequests objectForKey:v11];
  uint64_t v13 = [v12 unsignedIntegerValue];

  if (!v13) {
    goto LABEL_4;
  }
  uint64_t v14 = [v8 cachedResourceForRequestIdentifier:v13];
  if (v14) {
    goto LABEL_8;
  }
  if (([v8 trySetReason:1 forRequestWithIdentifier:v13] & 1) == 0)
  {
LABEL_4:
    uint64_t v15 = [v6 artworkForItemAtIndex:a4];
    id v16 = [(SUUIGallerySwooshPageSection *)self _newArtworkRequestWithArtwork:v15];
    v17 = v16;
    if (v16)
    {
      componentArtworkRequests = self->_componentArtworkRequests;
      v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "requestIdentifier"));
      [(NSMapTable *)componentArtworkRequests setObject:v19 forKey:v11];

      [v8 loadResourceWithRequest:v17 reason:1];
    }
  }
  uint64_t v14 = 0;
LABEL_8:

  return v14;
}

- (void)swoosh:(id)a3 willDisplayCellAtIndex:(int64_t)a4
{
  id v6 = [(SUUIStorePageSection *)self context];
  id v7 = [v6 metricsController];
  id v9 = [v7 activeImpressionsSession];

  uint64_t v8 = v9;
  if (v9)
  {
    [(SUUIGallerySwooshPageSection *)self _addImpressionForIndex:a4 toSession:v9];
    uint64_t v8 = v9;
  }
}

- (void)_addImpressionForIndex:(int64_t)a3 toSession:(id)a4
{
  id v6 = a4;
  id v7 = [(SUUIStorePageSection *)self pageComponent];
  uint64_t v8 = [v7 mediaComponents];
  id v10 = [v8 objectAtIndex:a3];

  objc_msgSend(v6, "addItemIdentifier:", objc_msgSend(v10, "mediaIdentifier"));
  id v9 = [v10 viewElement];
  [v6 addItemViewElement:v9];
}

- (id)_newArtworkRequestWithArtwork:(id)a3
{
  id v4 = a3;
  id v5 = [v4 URL];
  if (v5)
  {
    id v6 = objc_alloc_init(SUUIArtworkRequest);
    id v7 = +[SUUISizeToFitImageDataConsumer consumerWithConstraintSize:](SUUISizeToFitImageDataConsumer, "consumerWithConstraintSize:", (double)[v4 width], (double)objc_msgSend(v4, "height"));
    [(SUUIArtworkRequest *)v6 setDataConsumer:v7];

    [(SUUIArtworkRequest *)v6 setDelegate:self];
    [(SUUIArtworkRequest *)v6 setURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_swooshViewController
{
  swooshViewController = self->_swooshViewController;
  if (!swooshViewController)
  {
    id v4 = [(SUUIStorePageSection *)self context];
    id v5 = [v4 parentViewController];
    id v6 = [SUUIGallerySwooshViewController alloc];
    id v7 = [(SUUIStorePageSection *)self pageComponent];
    uint64_t v8 = [(SUUIGallerySwooshViewController *)v6 initWithGallerySwoosh:v7];
    id v9 = self->_swooshViewController;
    self->_swooshViewController = v8;

    id v10 = self->_swooshViewController;
    double v11 = [v5 clientContext];
    [(SUUISwooshViewController *)v10 setClientContext:v11];

    double v12 = self->_swooshViewController;
    uint64_t v13 = [v4 colorScheme];
    [(SUUIGallerySwooshViewController *)v12 setColorScheme:v13];

    [(SUUIGallerySwooshViewController *)self->_swooshViewController setDelegate:self];
    [v5 addChildViewController:self->_swooshViewController];

    swooshViewController = self->_swooshViewController;
  }
  return swooshViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swooshViewController, 0);
  objc_storeStrong((id *)&self->_componentArtworkRequests, 0);
}

@end