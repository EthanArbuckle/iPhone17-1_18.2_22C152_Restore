@interface SKUIMediaPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SKUIMediaPageSection)initWithPageComponent:(id)a3;
- (double)contentInsetAdjustmentForCollectionView:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (int64_t)defaultItemPinningStyle;
- (int64_t)numberOfCells;
- (void)_loadImageWithReason:(int64_t)a3;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewDidSelectItemAtIndexPath:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)dealloc;
- (void)mediaView:(id)a3 playbackStateDidChange:(int64_t)a4;
- (void)prefetchResourcesWithReason:(int64_t)a3;
- (void)setSectionIndex:(int64_t)a3;
- (void)willAppearInContext:(id)a3;
@end

@implementation SKUIMediaPageSection

- (SKUIMediaPageSection)initWithPageComponent:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaPageSection initWithPageComponent:]();
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIMediaPageSection;
  v5 = [(SKUIStorePageSection *)&v23 initWithPageComponent:v4];
  if (v5)
  {
    v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;

    v11 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v8 < v10 && v12 == 1) {
      double v8 = v10;
    }
    uint64_t v14 = [v4 bestThumbnailForWidth:v8];
    artwork = v5->_artwork;
    v5->_artwork = (SKUIArtwork *)v14;

    double v16 = (double)[(SKUIArtwork *)v5->_artwork height];
    float v17 = v8 / (double)[(SKUIArtwork *)v5->_artwork width] * v16;
    v5->_imageSize.width = v8;
    v5->_imageSize.height = floorf(v17);
    v18 = objc_alloc_init(SKUIEmbeddedMediaView);
    mediaView = v5->_mediaView;
    v5->_mediaView = v18;

    v20 = v5->_mediaView;
    v21 = [v4 accessibilityLabel];
    [(SKUIEmbeddedMediaView *)v20 setAccessibilityLabel:v21];

    [(SKUIEmbeddedMediaView *)v5->_mediaView setDelegate:v5];
    [(SKUIEmbeddedMediaView *)v5->_mediaView setThumbnailContentMode:5];
  }

  return v5;
}

- (void)dealloc
{
  [(SKUIEmbeddedMediaView *)self->_mediaView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIMediaPageSection;
  [(SKUIStorePageSection *)&v3 dealloc];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5 = a4;
  v6 = [(SKUIStorePageSection *)self pageComponent];
  objc_msgSend(v5, "addItemIdentifier:", objc_msgSend(v6, "mediaIdentifier"));

  id v8 = [(SKUIStorePageSection *)self pageComponent];
  double v7 = [v8 viewElement];
  [v5 addItemViewElement:v7];
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIStorePageSection *)self context];
  v6 = [v5 collectionView];
  double v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"SKUIMediaPageSectionReuseIdentifier" forIndexPath:v4];

  objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  id v8 = [v5 resourceLoader];
  double v9 = v8;
  if (!self->_artworkRequestID) {
    goto LABEL_4;
  }
  double v10 = objc_msgSend(v8, "cachedResourceForRequestIdentifier:");
  if (v10) {
    goto LABEL_6;
  }
  if (([v9 trySetReason:1 forRequestWithIdentifier:self->_artworkRequestID] & 1) == 0) {
LABEL_4:
  }
    [(SKUIMediaPageSection *)self _loadImageWithReason:1];
  double v10 = 0;
LABEL_6:
  [(SKUIEmbeddedMediaView *)self->_mediaView setThumbnailImage:v10];
  [v7 setContentChildView:self->_mediaView];

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SKUIStorePageSection *)self context];
  id v5 = [v4 collectionView];
  [v5 bounds];
  double v7 = v6;

  double height = self->_imageSize.height;
  if ([(SKUIEmbeddedMediaView *)self->_mediaView showsThumbnailReflection]) {
    double height = height + self->_imageSize.height;
  }
  double v9 = v7;
  double v10 = height;
  result.double height = v10;
  result.width = v9;
  return result;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  double v7 = [(SKUIStorePageSection *)self context];
  id v8 = [v7 activeMetricsImpressionSession];
  [v8 beginActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SKUIMediaPageSection;
  [(SKUIStorePageSection *)&v9 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (self->_artworkRequestID)
  {
    id v5 = [(SKUIStorePageSection *)self context];
    double v6 = [v5 resourceLoader];
    char v7 = [v6 trySetReason:0 forRequestWithIdentifier:self->_artworkRequestID];

    if ((v7 & 1) == 0) {
      self->_artworkRequestID = 0;
    }
  }
  id v8 = [(SKUIStorePageSection *)self pageComponent];
  objc_super v9 = [v8 viewElement];

  double v10 = [(SKUIStorePageSection *)self context];
  v11 = [v10 activeMetricsImpressionSession];
  [v11 endActiveImpressionForViewElement:v9];

  v12.receiver = self;
  v12.super_class = (Class)SKUIMediaPageSection;
  [(SKUIStorePageSection *)&v12 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v8 = [(SKUIStorePageSection *)self pageComponent];
  id v4 = -[SKUIStorePageSection clickEventWithMedia:elementName:index:](self, "clickEventWithMedia:elementName:index:");
  if (v4)
  {
    id v5 = [(SKUIStorePageSection *)self context];
    double v6 = [v5 metricsController];
    [v6 recordEvent:v4];
  }
  if ([v8 mediaType])
  {
    [(SKUIEmbeddedMediaView *)self->_mediaView beginPlaybackAnimated:1];
  }
  else
  {
    char v7 = [v8 link];
    [(SKUIStorePageSection *)self showPageWithLink:v7];
  }
}

- (double)contentInsetAdjustmentForCollectionView:(id)a3
{
  BOOL v4 = [(SKUIEmbeddedMediaView *)self->_mediaView showsThumbnailReflection];
  double result = 0.0;
  if (v4) {
    return -self->_imageSize.height;
  }
  return result;
}

- (int64_t)defaultItemPinningStyle
{
  return 3;
}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  if (!self->_artworkRequestID) {
    [(SKUIMediaPageSection *)self _loadImageWithReason:a3];
  }
}

- (void)setSectionIndex:(int64_t)a3
{
  [(SKUIEmbeddedMediaView *)self->_mediaView setShowsThumbnailReflection:a3 == 0];
  v5.receiver = self;
  v5.super_class = (Class)SKUIMediaPageSection;
  [(SKUIStorePageSection *)&v5 setSectionIndex:a3];
}

- (void)willAppearInContext:(id)a3
{
  id v3 = [a3 collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SKUIMediaPageSectionReuseIdentifier"];
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
}

- (void)mediaView:(id)a3 playbackStateDidChange:(int64_t)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  double v6 = [(SKUIStorePageSection *)self context];
  char v7 = [v6 metricsController];

  if ([v7 canRecordEventWithType:*MEMORY[0x1E4FA8888]])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4FA8240]);
    objc_super v9 = SKUIMetricsMediaEventTypeForPlaybackState(a4);
    [v8 setMediaEventType:v9];

    double v10 = [(SKUIStorePageSection *)self pageComponent];
    uint64_t v11 = [v10 mediaIdentifier];
    if (v11)
    {
      objc_super v12 = [NSNumber numberWithLongLong:v11];
      [v8 setItemIdentifier:v12];
    }
    v13 = [v10 mediaURLString];
    [v8 setMediaURL:v13];

    uint64_t v14 = [(SKUIStorePageSection *)self pageComponent];
    v15 = [v7 locationWithPageComponent:v14];

    uint64_t v16 = [v7 locationWithPageComponent:v10];
    float v17 = (void *)v16;
    if (v15 && v16)
    {
      v19[0] = v16;
      v19[1] = v15;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      [v8 setLocationWithEventLocations:v18];
    }
    [v7 recordEvent:v8];
  }
}

- (void)_loadImageWithReason:(int64_t)a3
{
  v13 = objc_alloc_init(SKUIArtworkRequest);
  [(SKUIArtworkRequest *)v13 setDelegate:self];
  BOOL v4 = [(SKUIArtwork *)self->_artwork URL];
  [(SKUIArtworkRequest *)v13 setURL:v4];

  objc_super v5 = +[SKUISizeToFitImageDataConsumer consumerWithConstraintSize:](SKUISizeToFitImageDataConsumer, "consumerWithConstraintSize:", self->_imageSize.width, self->_imageSize.height);
  double v6 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v7 = [v6 mediaAppearance];

  if (v7 == 1)
  {
    id v8 = [(SKUIStorePageSection *)self context];
    objc_super v9 = [v8 colorScheme];
    double v10 = [v9 backgroundColor];
    [v5 setGradientEndColor:v10];

    [v5 setGradientHeight:63.0];
  }
  [(SKUIArtworkRequest *)v13 setDataConsumer:v5];
  self->_artworkRequestID = [(SKUIResourceRequest *)v13 requestIdentifier];
  uint64_t v11 = [(SKUIStorePageSection *)self context];
  objc_super v12 = [v11 resourceLoader];
  [v12 loadResourceWithRequest:v13 reason:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaView, 0);

  objc_storeStrong((id *)&self->_artwork, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMediaPageSection initWithPageComponent:]";
}

@end