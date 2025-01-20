@interface SKUIScreenshotsViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSOperationQueue)operationQueue;
- (SKUIClientContext)clientContext;
- (SKUIScreenshotsDelegate)delegate;
- (SKUIScreenshotsViewController)initWithTrailers:(id)a3 screenshots:(id)a4 clientContext:(id)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)slideshowViewController:(id)a3 dataConsumerAtIndex:(int64_t)a4;
- (id)slideshowViewController:(id)a3 imageURLAtIndex:(int64_t)a4;
- (id)slideshowViewController:(id)a3 placeholderImageAtIndex:(int64_t)a4;
- (id)slideshowViewController:(id)a3 poppedImageViewAtIndex:(int64_t)a4;
- (id)viewForZoomingInScrollView:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfItemsInSlideshowViewController:(id)a3;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_setImage:(id)a3 forIndex:(int64_t)a4;
- (void)_setTrailerImage:(id)a3 forIndex:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)reloadData;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)slideshowViewController:(id)a3 scrollToImageAtIndex:(int64_t)a4;
@end

@implementation SKUIScreenshotsViewController

- (SKUIScreenshotsViewController)initWithTrailers:(id)a3 screenshots:(id)a4 clientContext:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIScreenshotsViewController initWithTrailers:screenshots:clientContext:]();
  }
  v55.receiver = self;
  v55.super_class = (Class)SKUIScreenshotsViewController;
  v11 = [(SKUIScreenshotsViewController *)&v55 init];
  v12 = v11;
  if (v11)
  {
    id v50 = v10;
    p_clientContext = (void **)&v11->_clientContext;
    objc_storeStrong((id *)&v11->_clientContext, a5);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    screenshotRawImages = v12->_screenshotRawImages;
    v12->_screenshotRawImages = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    screenshotImages = v12->_screenshotImages;
    v12->_screenshotImages = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    trailerImages = v12->_trailerImages;
    v12->_trailerImages = v18;

    v20 = v9;
    if (!v9)
    {
      v20 = [MEMORY[0x1E4F1C978] array];
    }
    objc_storeStrong((id *)&v12->_screenshots, v20);
    if (!v9) {

    }
    v21 = v8;
    if (!v8)
    {
      v21 = [MEMORY[0x1E4F1C978] array];
    }
    objc_storeStrong((id *)&v12->_trailers, v21);
    if (!v8) {

    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v22 = v12->_screenshots;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v52;
      double v26 = 1.0;
      double v27 = 1.0;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v52 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v51 + 1) + 8 * i) sizeForVariant:@"low-dpi"];
          double v31 = v30 / v29;
          if (v31 <= v27 || v31 <= 1.0) {
            double v33 = v27;
          }
          else {
            double v33 = v31;
          }
          if (v31 < 1.0 && v31 < v26) {
            double v26 = v31;
          }
          else {
            double v27 = v33;
          }
        }
        uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v24);
    }
    else
    {
      double v26 = 1.0;
      double v27 = 1.0;
    }

    uint64_t v34 = SKUIUserInterfaceIdiom(*p_clientContext);
    if (v34)
    {
      if (v27 == 1.0) {
        double v35 = v26;
      }
      else {
        double v35 = v27;
      }
      v12->_screenshotMaxSize = (CGSize)vdupq_n_s64(0x4072C00000000000uLL);
      double width = 300.0;
      if (v35 < 1.0) {
        v12->_screenshotMaxSize.double height = v35 * 300.0;
      }
    }
    else
    {
      if (1.0 / v26 <= v27) {
        double v37 = v27;
      }
      else {
        double v37 = 1.0 / v26;
      }
      v38 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v38 bounds];
      CGFloat v40 = dbl_1C1CCBF90[v39 > 480.0];
      v12->_screenshotMaxSize.double width = 196.0;
      v12->_screenshotMaxSize.double height = v40;

      double width = v12->_screenshotMaxSize.width;
      double height = v12->_screenshotMaxSize.height;
      if (v37 < height / width) {
        v12->_screenshotMaxSize.double height = height * (v37 / (height / width));
      }
    }
    uint64_t v42 = +[SKUIScreenshotDataConsumer consumerWithScreenshotSize:](SKUIScreenshotDataConsumer, "consumerWithScreenshotSize:", width, v12->_screenshotMaxSize.height);
    dataConsumer = v12->_dataConsumer;
    v12->_dataConsumer = (SKUIScreenshotDataConsumer *)v42;

    [(SKUIScreenshotDataConsumer *)v12->_dataConsumer setForcesPortrait:v34 == 0];
    id v10 = v50;
    if ([(NSArray *)v12->_trailers count])
    {
      if (v34) {
        uint64_t v44 = 3;
      }
      else {
        uint64_t v44 = 1;
      }
      uint64_t v45 = +[SSVURLDataConsumer consumer];
      trailerConsumer = v12->_trailerConsumer;
      v12->_trailerConsumer = (SKUIVideoImageDataConsumer *)v45;

      [(SKUIVideoImageDataConsumer *)v12->_trailerConsumer setAllowedOrientations:v44];
      uint64_t v47 = SKUIUserInterfaceIdiom(*p_clientContext);
      v48 = v12->_trailerConsumer;
      if (v47 == 1)
      {
        -[SKUIVideoImageDataConsumer setLandscapeSize:](v48, "setLandscapeSize:", 300.0, 225.0);
        -[SKUIVideoImageDataConsumer setPortraitSize:](v12->_trailerConsumer, "setPortraitSize:", 225.0, 300.0);
      }
      else
      {
        -[SKUIVideoImageDataConsumer setLandscapeSize:](v48, "setLandscapeSize:", 348.0, 196.0);
        -[SKUIVideoImageDataConsumer setPortraitSize:](v12->_trailerConsumer, "setPortraitSize:", 196.0, 348.0);
        v12->_screenshotMaxSize = (CGSize)xmmword_1C1CCBFA0;
      }
    }
  }

  return v12;
}

- (void)reloadData
{
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  screenshotRawImages = self->_screenshotRawImages;
  self->_screenshotRawImages = v3;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  screenshotImages = self->_screenshotImages;
  self->_screenshotImages = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  trailerImages = self->_trailerImages;
  self->_trailerImages = v7;

  if ([(NSArray *)self->_screenshots count])
  {
    id v9 = 0;
    double v37 = v41;
    do
    {
      id v10 = -[NSArray objectAtIndex:](self->_screenshots, "objectAtIndex:", v9, v37);
      v11 = [v10 URLForVariant:@"low-dpi"];
      if (v11)
      {
        v12 = (void *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithURL:v11];
        v13 = +[SSVURLDataConsumer consumer];
        [v12 setDataConsumer:v13];

        [v12 setITunesStoreRequest:0];
        objc_initWeak(location, self);
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v41[0] = __43__SKUIScreenshotsViewController_reloadData__block_invoke;
        v41[1] = &unk_1E6424178;
        objc_copyWeak(v42, location);
        v42[1] = v9;
        [v12 setOutputBlock:v40];
        [(NSOperationQueue *)self->_operationQueue addOperation:v12];
        objc_destroyWeak(v42);
        objc_destroyWeak(location);
      }
      [v10 sizeForVariant:@"low-dpi"];
      double v15 = v14;
      double v17 = v16;
      dataConsumer = self->_dataConsumer;
      v19 = [MEMORY[0x1E4FB1618] colorWithWhite:0.9 alpha:1.0];
      v20 = -[SKUIScreenshotDataConsumer imageForColor:size:](dataConsumer, "imageForColor:size:", v19, v15, v17);

      [(NSMutableArray *)self->_screenshotImages addObject:v20];
      v21 = self->_screenshotRawImages;
      v22 = [MEMORY[0x1E4F1CA98] null];
      [(NSMutableArray *)v21 addObject:v22];

      ++v9;
    }
    while ((unint64_t)v9 < [(NSArray *)self->_screenshots count]);
  }
  if ([(NSArray *)self->_trailers count])
  {
    uint64_t v23 = 0;
    do
    {
      uint64_t v24 = [(NSArray *)self->_trailers objectAtIndex:v23];
      uint64_t v25 = [v24 artworks];
      double v26 = objc_msgSend(v25, "bestArtworkForScaledSize:", self->_screenshotMaxSize.width, self->_screenshotMaxSize.height);

      double v27 = [v26 URL];

      if (v27)
      {
        id v28 = objc_alloc(MEMORY[0x1E4FA8338]);
        double v29 = [v26 URL];
        double v30 = (void *)[v28 initWithURL:v29];

        [v30 setDataConsumer:self->_trailerConsumer];
        [v30 setITunesStoreRequest:0];
        objc_initWeak(location, self);
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __43__SKUIScreenshotsViewController_reloadData__block_invoke_3;
        v38[3] = &unk_1E6424178;
        objc_copyWeak(v39, location);
        v39[1] = v23;
        [v30 setOutputBlock:v38];
        [(NSOperationQueue *)self->_operationQueue addOperation:v30];
        objc_destroyWeak(v39);
        objc_destroyWeak(location);
      }
      if (v26
        && ([(SKUIVideoImageDataConsumer *)self->_trailerConsumer allowedOrientations] & 2) != 0)
      {
        [v26 size];
        if (v32 <= v33) {
          uint64_t v31 = 1;
        }
        else {
          uint64_t v31 = 2;
        }
      }
      else
      {
        uint64_t v31 = 1;
      }
      trailerConsumer = self->_trailerConsumer;
      double v35 = [MEMORY[0x1E4FB1618] colorWithWhite:0.9 alpha:1.0];
      v36 = [(SKUIVideoImageDataConsumer *)trailerConsumer imageForColor:v35 orientation:v31];

      [(NSMutableArray *)self->_trailerImages addObject:v36];
      ++v23;
    }
    while ((unint64_t)v23 < [(NSArray *)self->_trailers count]);
  }
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, 8.0, 0.0, 8.0);
  [(UICollectionView *)self->_collectionView reloadData];
}

void __43__SKUIScreenshotsViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SKUIScreenshotsViewController_reloadData__block_invoke_2;
  block[3] = &unk_1E6428008;
  objc_copyWeak(v8, (id *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  id v7 = v3;
  v8[1] = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v8);
}

void __43__SKUIScreenshotsViewController_reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setImage:*(void *)(a1 + 32) forIndex:*(void *)(a1 + 48)];
}

void __43__SKUIScreenshotsViewController_reloadData__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SKUIScreenshotsViewController_reloadData__block_invoke_4;
  block[3] = &unk_1E6428008;
  objc_copyWeak(v8, (id *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  id v7 = v3;
  v8[1] = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v8);
}

void __43__SKUIScreenshotsViewController_reloadData__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setTrailerImage:*(void *)(a1 + 32) forIndex:*(void *)(a1 + 48)];
}

- (void)loadView
{
  v11 = -[SKUIScreenshotsView initWithFrame:]([SKUIScreenshotsView alloc], "initWithFrame:", 0.0, 0.0, 1.0, self->_screenshotMaxSize.height + 30.0);
  [(SKUIScreenshotsViewController *)self setView:v11];
  id v3 = objc_alloc_init(SKUISwooshCollectionViewLayout);
  [(SKUISwooshCollectionViewLayout *)v3 setSnapsToItemBoundaries:1];
  [(UICollectionViewFlowLayout *)v3 setMinimumLineSpacing:0.0];
  [(UICollectionViewFlowLayout *)v3 setMinimumInteritemSpacing:0.0];
  [(UICollectionViewFlowLayout *)v3 setScrollDirection:1];
  id v4 = objc_alloc(MEMORY[0x1E4FB1568]);
  [(SKUIScreenshotsView *)v11 bounds];
  id v5 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  id v7 = self->_collectionView;
  id v8 = [MEMORY[0x1E4FB1618] clearColor];
  [(UICollectionView *)v7 setBackgroundColor:v8];

  [(UICollectionView *)self->_collectionView setAutoresizingMask:0];
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"a"];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setAlwaysBounceHorizontal:1];
  [(UICollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setClipsToBounds:0];
  [(UICollectionView *)self->_collectionView setPrefetchingEnabled:0];
  id v9 = self->_collectionView;
  +[SKUISwooshCollectionViewLayout snapToBoundariesDecelerationRate];
  [(UICollectionView *)v9 setDecelerationRate:v10];
  [(SKUIScreenshotsView *)v11 setPrimaryView:self->_collectionView];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v12 = a4;
  if ([v12 section])
  {
    if ([v12 section] != 1) {
      goto LABEL_11;
    }
    id v5 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      id v7 = objc_alloc_init(SKUISlideshowViewController);
      [(SKUISlideshowViewController *)v7 setClientContext:self->_clientContext];
      [(SKUISlideshowViewController *)v7 setDataSource:self];
      [(SKUISlideshowViewController *)v7 setDelegate:self];
      -[SKUISlideshowViewController setCurrentIndex:](v7, "setCurrentIndex:", [v12 item]);
      id v8 = (SKUIPlayableAsset *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7];
      [(SKUIPlayableAsset *)v8 setTransitioningDelegate:v7];
      id v9 = v8;
    }
    else
    {
      id v7 = objc_alloc_init(SKUIIPhoneSlideshowViewController);
      [(SKUISlideshowViewController *)v7 setClientContext:self->_clientContext];
      [(SKUISlideshowViewController *)v7 setDataSource:self];
      -[SKUISlideshowViewController setCurrentIndex:](v7, "setCurrentIndex:", [v12 item]);
      id v9 = (SKUIPlayableAsset *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7];
      id v8 = v9;
    }
    [(SKUIPlayableAsset *)v9 setModalPresentationStyle:17];
    [(SKUIScreenshotsViewController *)self presentViewController:v8 animated:1 completion:0];
    goto LABEL_9;
  }
  -[NSArray objectAtIndex:](self->_trailers, "objectAtIndex:", [v12 item]);
  id v7 = (SKUISlideshowViewController *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    id v8 = [[SKUIPlayableAsset alloc] initWithVideo:v7];
    float v10 = [(SKUIScreenshotsViewController *)self clientContext];
    v11 = SKUIVideoPreviewPlayPlayableAsset(v8, v10);

    [(SKUIScreenshotsViewController *)self presentViewController:v11 animated:1 completion:0];
LABEL_9:
  }
LABEL_11:
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  if ([v6 section])
  {
    if ([v6 section] != 1)
    {
      double v10 = *MEMORY[0x1E4F1DB30];
      goto LABEL_7;
    }
    id v7 = &OBJC_IVAR___SKUIScreenshotsViewController__screenshotImages;
  }
  else
  {
    id v7 = &OBJC_IVAR___SKUIScreenshotsViewController__trailerImages;
  }
  id v8 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "objectAtIndex:", objc_msgSend(v6, "item"));
  [v8 size];
  double v10 = v9 + 15.0;

LABEL_7:
  CGFloat v11 = self->_screenshotMaxSize.height + 30.0;

  double v12 = v10;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      int64_t v8 = 0;
      goto LABEL_7;
    }
    id v7 = &OBJC_IVAR___SKUIScreenshotsViewController__screenshotImages;
  }
  else
  {
    id v7 = &OBJC_IVAR___SKUIScreenshotsViewController__trailerImages;
  }
  int64_t v8 = [*(id *)((char *)&self->super.super.super.isa + *v7) count];
LABEL_7:

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    if ([v5 section] == 1)
    {
      id v6 = [(UICollectionView *)self->_collectionView dequeueReusableCellWithReuseIdentifier:@"a" forIndexPath:v5];
      id v7 = -[NSMutableArray objectAtIndex:](self->_screenshotImages, "objectAtIndex:", [v5 row]);
      [v6 setImage:v7];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = [(UICollectionView *)self->_collectionView dequeueReusableCellWithReuseIdentifier:@"a" forIndexPath:v5];
    int64_t v8 = -[NSMutableArray objectAtIndex:](self->_trailerImages, "objectAtIndex:", [v5 row]);
    [v6 setImage:v8];

    [v6 setVideo:1];
  }

  return v6;
}

- (int64_t)numberOfItemsInSlideshowViewController:(id)a3
{
  return [(NSArray *)self->_screenshots count];
}

- (id)slideshowViewController:(id)a3 placeholderImageAtIndex:(int64_t)a4
{
  unint64_t v6 = [(NSMutableArray *)self->_screenshotRawImages count];
  id v7 = 0;
  if ((a4 & 0x8000000000000000) == 0 && v6 > a4)
  {
    int64_t v8 = [(NSMutableArray *)self->_screenshotRawImages objectAtIndex:a4];
    double v9 = [MEMORY[0x1E4F1CA98] null];
    if (v8 == v9)
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [(NSMutableArray *)self->_screenshotRawImages objectAtIndex:a4];
    }
  }

  return v7;
}

- (id)slideshowViewController:(id)a3 imageURLAtIndex:(int64_t)a4
{
  id v4 = [(NSArray *)self->_screenshots objectAtIndex:a4];
  id v5 = [v4 URLForVariant:@"high-dpi"];

  return v5;
}

- (id)slideshowViewController:(id)a3 dataConsumerAtIndex:(int64_t)a4
{
  id v4 = [(NSArray *)self->_screenshots objectAtIndex:a4];
  [v4 sizeForVariant:@"high-dpi"];
  id v5 = +[SKUIScreenshotDataConsumer consumerWithScreenshotSize:](SKUIScreenshotDataConsumer, "consumerWithScreenshotSize:");
  unint64_t v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    [v5 setForcesPortrait:1];
  }

  return v5;
}

- (void)slideshowViewController:(id)a3 scrollToImageAtIndex:(int64_t)a4
{
  id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:a4 inSection:1];
  id v5 = [(UICollectionView *)self->_collectionView indexPathsForVisibleItems];
  char v6 = [v5 containsObject:v7];

  if ((v6 & 1) == 0) {
    [(UICollectionView *)self->_collectionView scrollToItemAtIndexPath:v7 atScrollPosition:8 animated:0];
  }
}

- (id)slideshowViewController:(id)a3 poppedImageViewAtIndex:(int64_t)a4
{
  id v5 = [MEMORY[0x1E4F28D58] indexPathForItem:a4 inSection:1];
  char v6 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  id v7 = [v6 layoutAttributesForItemAtIndexPath:v5];

  if (v7)
  {
    int64_t v8 = objc_alloc_init(SKUIIPhoneSlideshowCell);
    [v7 frame];
    -[SKUIIPhoneSlideshowCell setFrame:](v8, "setFrame:");
    double v9 = -[NSMutableArray objectAtIndex:](self->_screenshotImages, "objectAtIndex:", [v5 item]);
    [(SKUIIPhoneSlideshowCell *)v8 setImage:v9];

    [(SKUIIPhoneSlideshowCell *)v8 layoutSubviews];
    [(UICollectionView *)self->_collectionView addSubview:v8];
    double v10 = [(SKUIScreenshotsViewController *)self view];
    [(SKUIIPhoneSlideshowCell *)v8 imageFrame];
    objc_msgSend(v10, "convertRect:fromView:", v8);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    [(SKUIIPhoneSlideshowCell *)v8 removeFromSuperview];
    v19 = -[NSMutableArray objectAtIndex:](self->_screenshotImages, "objectAtIndex:", [v5 item]);
    v20 = [MEMORY[0x1E4F1CA98] null];

    if (v19 == v20) {
      id v21 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    }
    else {
      id v21 = (id)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v19];
    }
    v22 = v21;
    uint64_t v23 = [MEMORY[0x1E4FB1618] clearColor];
    [v22 setBackgroundColor:v23];

    objc_msgSend(v22, "setFrame:", v12, v14, v16, v18);
    [v22 setContentMode:1];
    uint64_t v24 = [(SKUIScreenshotsViewController *)self view];
    [v24 addSubview:v22];
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    char v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      [v9 screenshotsWillBeginDragging:self];
    }
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return 0;
}

- (void)_setImage:(id)a3 forIndex:(int64_t)a4
{
  if (a3)
  {
    dataConsumer = self->_dataConsumer;
    id v7 = a3;
    id v11 = [(SKUIScreenshotDataConsumer *)dataConsumer imageForImage:v7];
    [(NSMutableArray *)self->_screenshotRawImages replaceObjectAtIndex:a4 withObject:v7];

    [(NSMutableArray *)self->_screenshotImages replaceObjectAtIndex:a4 withObject:v11];
    collectionView = self->_collectionView;
    id v9 = [MEMORY[0x1E4F28D58] indexPathForItem:a4 inSection:1];
    double v10 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v9];

    [v10 setImage:v11];
  }
}

- (void)_setTrailerImage:(id)a3 forIndex:(int64_t)a4
{
  if (a3)
  {
    trailerImages = self->_trailerImages;
    id v7 = a3;
    [(NSMutableArray *)trailerImages replaceObjectAtIndex:a4 withObject:v7];
    collectionView = self->_collectionView;
    id v9 = [MEMORY[0x1E4F28D58] indexPathForItem:a4 inSection:0];
    id v10 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v9];

    [v10 setImage:v7];
  }
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SKUIScreenshotsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIScreenshotsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailerImages, 0);
  objc_storeStrong((id *)&self->_trailers, 0);
  objc_storeStrong((id *)&self->_trailerConsumer, 0);
  objc_storeStrong((id *)&self->_screenshotRawImages, 0);
  objc_storeStrong((id *)&self->_screenshotImages, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithTrailers:screenshots:clientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIScreenshotsViewController initWithTrailers:screenshots:clientContext:]";
}

@end