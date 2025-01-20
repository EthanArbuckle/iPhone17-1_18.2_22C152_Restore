@interface SUUIIPhoneSlideshowViewController
- (SUUIClientContext)clientContext;
- (SUUIIPhoneSlideshowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SUUISlideshowViewControllerDataSource)dataSource;
- (SUUISlideshowViewControllerDelegate)delegate;
- (id)_imageAtIndex:(int64_t)a3;
- (id)_placeholderImageAtIndex:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)currentIndex;
- (unint64_t)supportedInterfaceOrientations;
- (void)_doneAction:(id)a3;
- (void)_reloadPageControl;
- (void)_reloadSize;
- (void)_setImage:(id)a3 atIndex:(int64_t)a4;
- (void)dealloc;
- (void)loadView;
- (void)reloadData;
- (void)setClientContext:(id)a3;
- (void)setCurrentIndex:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation SUUIIPhoneSlideshowViewController

- (SUUIIPhoneSlideshowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SUUIIPhoneSlideshowViewController;
  v4 = [(SUUIIPhoneSlideshowViewController *)&v14 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    images = v4->_images;
    v4->_images = v5;

    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v4->_operationQueue;
    v4->_operationQueue = v7;

    [(NSOperationQueue *)v4->_operationQueue setMaxConcurrentOperationCount:2];
    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    placeholderQueue = v4->_placeholderQueue;
    v4->_placeholderQueue = v9;

    [(NSOperationQueue *)v4->_placeholderQueue setMaxConcurrentOperationCount:2];
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    placeholderImages = v4->_placeholderImages;
    v4->_placeholderImages = (NSMutableDictionary *)v11;

    v4->_indexToScrollToOnLoadView = 0x7FFFFFFFFFFFFFFFLL;
    [(SUUIIPhoneSlideshowViewController *)v4 setModalPresentationStyle:2];
    [(SUUIIPhoneSlideshowViewController *)v4 setEdgesForExtendedLayout:0];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(NSOperationQueue *)self->_operationQueue operations];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) setOutputBlock:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  [(NSOperationQueue *)self->_placeholderQueue cancelAllOperations];
  v8.receiver = self;
  v8.super_class = (Class)SUUIIPhoneSlideshowViewController;
  [(SUUIIPhoneSlideshowViewController *)&v8 dealloc];
}

- (void)loadView
{
  v3 = [SUUIScrollForwardingView alloc];
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v42 = -[SUUIScrollForwardingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  objc_super v8 = [MEMORY[0x263F825C8] clearColor];
  [(SUUIScrollForwardingView *)v42 setBackgroundColor:v8];

  [(SUUIIPhoneSlideshowViewController *)self setView:v42];
  long long v9 = (void *)[objc_alloc(MEMORY[0x263F82EB8]) initWithPrivateStyle:10060];
  [v9 setAutoresizingMask:18];
  [(SUUIScrollForwardingView *)v42 bounds];
  objc_msgSend(v9, "setFrame:");
  [(SUUIScrollForwardingView *)v42 addSubview:v9];
  long long v10 = objc_alloc_init(SUUIItemGridCollectionViewLayout);
  long long v11 = [MEMORY[0x263F825C8] clearColor];
  [(SUUIItemGridCollectionViewLayout *)v10 setOddRowBackgroundColor:v11];

  long long v12 = [MEMORY[0x263F825C8] clearColor];
  [(SUUIItemGridCollectionViewLayout *)v10 setEvenRowBackgroundColor:v12];

  [(UICollectionViewFlowLayout *)v10 setScrollDirection:1];
  [(UICollectionViewFlowLayout *)v10 setMinimumLineSpacing:0.0];
  v13 = [MEMORY[0x263F82B60] mainScreen];
  [v13 bounds];
  double v15 = v14 + -54.0;
  v16 = [MEMORY[0x263F82B60] mainScreen];
  [v16 bounds];
  -[UICollectionViewFlowLayout setItemSize:](v10, "setItemSize:", v15, v17 + -64.0);

  v18 = -[SUUIGiftThemeCollectionView initWithFrame:collectionViewLayout:]([SUUIGiftThemeCollectionView alloc], "initWithFrame:collectionViewLayout:", v10, v4, v5, v6, v7);
  collectionView = self->_collectionView;
  self->_collectionView = v18;

  v20 = self->_collectionView;
  v21 = [MEMORY[0x263F825C8] clearColor];
  [(SUUIGiftThemeCollectionView *)v20 setBackgroundColor:v21];

  -[SUUIGiftThemeCollectionView setVisibleBoundsInsets:](self->_collectionView, "setVisibleBoundsInsets:", 0.0, -27.0, 0.0, -27.0);
  [(SUUIGiftThemeCollectionView *)self->_collectionView setDataSource:self];
  [(SUUIGiftThemeCollectionView *)self->_collectionView setDelegate:self];
  [(SUUIGiftThemeCollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"a"];
  [(SUUIGiftThemeCollectionView *)self->_collectionView setAlwaysBounceHorizontal:1];
  [(SUUIGiftThemeCollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
  [(SUUIGiftThemeCollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
  [(SUUIGiftThemeCollectionView *)self->_collectionView setClipsToBounds:0];
  [(SUUIGiftThemeCollectionView *)self->_collectionView setPagingEnabled:1];
  v22 = self->_collectionView;
  v23 = [MEMORY[0x263F82B60] mainScreen];
  [v23 bounds];
  double v25 = v24 + -54.0;
  v26 = [MEMORY[0x263F82B60] mainScreen];
  [v26 bounds];
  -[SUUIGiftThemeCollectionView setFrame:](v22, "setFrame:", 27.0, 0.0, v25, v27 + -64.0);

  [(SUUIScrollForwardingView *)v42 addSubview:self->_collectionView];
  [(SUUIScrollForwardingView *)v42 setScrollView:self->_collectionView];
  v28 = (UIPageControl *)objc_alloc_init(MEMORY[0x263F829F0]);
  pageControl = self->_pageControl;
  self->_pageControl = v28;

  v30 = self->_pageControl;
  v31 = [(UIPageControl *)v30 tintColor];
  [(UIPageControl *)v30 setCurrentPageIndicatorTintColor:v31];

  v32 = self->_pageControl;
  v33 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.3];
  [(UIPageControl *)v32 setPageIndicatorTintColor:v33];

  v34 = self->_pageControl;
  [(SUUIScrollForwardingView *)v42 bounds];
  -[UIPageControl setFrame:](v34, "setFrame:", 0.0, -25.0);
  [(UIPageControl *)self->_pageControl setAutoresizingMask:10];
  [(UIPageControl *)self->_pageControl setUserInteractionEnabled:0];
  [(SUUIScrollForwardingView *)v42 addSubview:self->_pageControl];
  [(SUUIIPhoneSlideshowViewController *)self _reloadPageControl];
  v35 = [(SUUIIPhoneSlideshowViewController *)self navigationItem];
  [v35 setHidesBackButton:1];
  id v36 = objc_alloc_init(MEMORY[0x263F824A8]);
  [v36 setAction:sel__doneAction_];
  [v36 setTarget:self];
  clientContext = self->_clientContext;
  if (clientContext) {
    [(SUUIClientContext *)clientContext localizedStringForKey:@"SCREENSHOTS_BUTTON_DONE"];
  }
  else {
  v38 = +[SUUIClientContext localizedStringForKey:@"SCREENSHOTS_BUTTON_DONE" inBundles:0];
  }
  [v36 setTitle:v38];

  [v36 setStyle:2];
  [v35 setRightBarButtonItem:v36];
  v39 = [(SUUIIPhoneSlideshowViewController *)self title];

  if (!v39)
  {
    v40 = self->_clientContext;
    if (v40) {
      [(SUUIClientContext *)v40 localizedStringForKey:@"SCREENSHOTS_TITLE"];
    }
    else {
    v41 = +[SUUIClientContext localizedStringForKey:@"SCREENSHOTS_TITLE" inBundles:0];
    }
    [(SUUIIPhoneSlideshowViewController *)self setTitle:v41];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1) {
    return 30;
  }
  if (SUUIAllowsLandscapePhone()) {
    return 26;
  }
  return 2;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIIPhoneSlideshowViewController;
  [(SUUIIPhoneSlideshowViewController *)&v3 viewDidLayoutSubviews];
  [(SUUIIPhoneSlideshowViewController *)self _reloadSize];
}

- (int64_t)currentIndex
{
  collectionView = self->_collectionView;
  if (collectionView) {
    return SUUIPageForCollectionView(collectionView);
  }
  int64_t indexToScrollToOnLoadView = self->_indexToScrollToOnLoadView;
  if (indexToScrollToOnLoadView == 0x7FFFFFFFFFFFFFFFLL) {
    return SUUIPageForCollectionView(collectionView);
  }
  else {
    return indexToScrollToOnLoadView;
  }
}

- (void)reloadData
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v6 = [WeakRetained numberOfItemsInSlideshowViewController:self];

  [(NSMutableArray *)self->_images removeAllObjects];
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  [(NSOperationQueue *)self->_placeholderQueue cancelAllOperations];
  if (v6 >= 1)
  {
    double v7 = (char *)v6;
    objc_super v8 = 0;
    v33 = v35;
    do
    {
      id v9 = objc_loadWeakRetained((id *)p_dataSource);
      long long v10 = objc_msgSend(v9, "slideshowViewController:imageURLAtIndex:", self, v8, v33);

      id v11 = objc_loadWeakRetained((id *)p_dataSource);
      long long v12 = [v11 slideshowViewController:self dataConsumerAtIndex:v8];

      [v12 imageSize];
      double v14 = v13;
      double v16 = v15;
      double v17 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v18 = [v17 userInterfaceIdiom];

      unint64_t v19 = v18 & 0xFFFFFFFFFFFFFFFBLL;
      double v20 = 250.0;
      if (v19 != 1)
      {
        v2 = [MEMORY[0x263F82B60] mainScreen];
        [v2 bounds];
        double v20 = v21 + -70.0;
      }
      v22 = [MEMORY[0x263F82B60] mainScreen];
      [v22 bounds];
      double v24 = v23;

      if (v19 != 1) {
      double v25 = v24 + -125.0;
      }
      if (v14 > v20 || v16 > v25)
      {
        if ([v12 forcesPortrait] && v14 > v16)
        {
          double v26 = fmin(v20 / v16, v25 / v14);
          double v27 = floor(v16 * v26);
          double v28 = v14 * v26;
        }
        else
        {
          double v29 = fmin(v20 / v14, v25 / v16);
          double v27 = floor(v14 * v29);
          double v28 = v16 * v29;
        }
        objc_msgSend(v12, "setImageSize:", v27, floor(v28));
        if (!v10) {
          goto LABEL_17;
        }
      }
      else if (!v10)
      {
        goto LABEL_17;
      }
      v30 = (void *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:v10];
      [v30 setDataConsumer:v12];
      [v30 setITunesStoreRequest:0];
      objc_initWeak(&location, self);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v35[0] = __47__SUUIIPhoneSlideshowViewController_reloadData__block_invoke;
      v35[1] = &unk_265405490;
      objc_copyWeak(v36, &location);
      v36[1] = v8;
      [v30 setOutputBlock:v34];
      [(NSOperationQueue *)self->_operationQueue addOperation:v30];
      objc_destroyWeak(v36);
      objc_destroyWeak(&location);

LABEL_17:
      images = self->_images;
      v32 = [MEMORY[0x263EFF9D0] null];
      [(NSMutableArray *)images addObject:v32];

      ++v8;
    }
    while (v7 != v8);
  }
  [(SUUIGiftThemeCollectionView *)self->_collectionView reloadData];
  [(SUUIIPhoneSlideshowViewController *)self _reloadPageControl];
}

void __47__SUUIIPhoneSlideshowViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SUUIIPhoneSlideshowViewController_reloadData__block_invoke_2;
  block[3] = &unk_265405758;
  objc_copyWeak(v8, (id *)(a1 + 32));
  double v4 = *(void **)(a1 + 40);
  id v7 = v3;
  v8[1] = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v8);
}

void __47__SUUIIPhoneSlideshowViewController_reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setImage:*(void *)(a1 + 32) atIndex:*(void *)(a1 + 48)];
}

- (void)setCurrentIndex:(int64_t)a3
{
  collectionView = self->_collectionView;
  if (collectionView)
  {
    id v8 = [MEMORY[0x263F82B60] mainScreen];
    [v8 bounds];
    double v7 = (v6 + -54.0) * (double)a3;
    [(SUUIGiftThemeCollectionView *)self->_collectionView contentOffset];
    [(SUUIGiftThemeCollectionView *)collectionView setContentOffset:v7];
  }
  else
  {
    self->_int64_t indexToScrollToOnLoadView = a3;
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(SUUIIPhoneSlideshowViewController *)self reloadData];
    id v5 = obj;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSMutableArray *)self->_images count];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  collectionView = self->_collectionView;
  id v6 = a4;
  double v7 = [(SUUIGiftThemeCollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:@"a" forIndexPath:v6];
  objc_msgSend(v7, "setImageSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  uint64_t v8 = [v6 row];

  id v9 = [(SUUIIPhoneSlideshowViewController *)self _imageAtIndex:v8];
  [v7 setImage:v9];

  return v7;
}

- (void)_doneAction:(id)a3
{
  id v4 = [(SUUIIPhoneSlideshowViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 slideshowViewControllerDidFinish:self];
  }
  else {
    [(SUUIIPhoneSlideshowViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)_imageAtIndex:(int64_t)a3
{
  id v5 = -[NSMutableArray objectAtIndex:](self->_images, "objectAtIndex:");
  id v6 = [MEMORY[0x263EFF9D0] null];

  if (v5 == v6)
  {
    uint64_t v7 = [(SUUIIPhoneSlideshowViewController *)self _placeholderImageAtIndex:a3];

    id v5 = (void *)v7;
  }
  return v5;
}

- (id)_placeholderImageAtIndex:(int64_t)a3
{
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = [WeakRetained slideshowViewController:self dataConsumerAtIndex:a3];

  id v7 = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v8 = [v7 slideshowViewController:self placeholderImageAtIndex:a3];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x263F086D0];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    double v20 = __62__SUUIIPhoneSlideshowViewController__placeholderImageAtIndex___block_invoke;
    double v21 = &unk_265407148;
    id v22 = v6;
    id v23 = v8;
    double v24 = self;
    v25[1] = (id)a3;
    objc_copyWeak(v25, &location);
    long long v10 = [v9 blockOperationWithBlock:&v18];
    -[NSOperationQueue addOperation:](self->_placeholderQueue, "addOperation:", v10, v18, v19, v20, v21);

    objc_destroyWeak(v25);
  }
  placeholderImages = self->_placeholderImages;
  long long v12 = [NSNumber numberWithInteger:a3];
  double v13 = [(NSMutableDictionary *)placeholderImages objectForKey:v12];

  if (!v13)
  {
    double v14 = [MEMORY[0x263F825C8] colorWithWhite:0.8 alpha:1.0];
    double v13 = [v6 imageForColor:v14];

    double v15 = self->_placeholderImages;
    double v16 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v15 setObject:v13 forKey:v16];
  }
  objc_destroyWeak(&location);
  return v13;
}

void __62__SUUIIPhoneSlideshowViewController__placeholderImageAtIndex___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageForImage:*(void *)(a1 + 40)];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__SUUIIPhoneSlideshowViewController__placeholderImageAtIndex___block_invoke_2;
  v5[3] = &unk_265407120;
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  v8[1] = *(id *)(a1 + 64);
  id v4 = v2;
  objc_copyWeak(v8, (id *)(a1 + 56));
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(v8);
}

void __62__SUUIIPhoneSlideshowViewController__placeholderImageAtIndex___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(*(void *)(a1 + 40) + 1032) objectAtIndex:*(void *)(a1 + 56)];
    uint64_t v3 = [MEMORY[0x263EFF9D0] null];

    if (v2 == v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained _setImage:*(void *)(a1 + 32) atIndex:*(void *)(a1 + 56)];
    }
  }
}

- (void)_setImage:(id)a3 atIndex:(int64_t)a4
{
  if (a3)
  {
    images = self->_images;
    id v7 = a3;
    [(NSMutableArray *)images replaceObjectAtIndex:a4 withObject:v7];
    collectionView = self->_collectionView;
    id v9 = [MEMORY[0x263F088C8] indexPathForItem:a4 inSection:0];
    id v10 = [(SUUIGiftThemeCollectionView *)collectionView cellForItemAtIndexPath:v9];

    [v10 setImage:v7];
  }
}

- (void)_reloadPageControl
{
  [(UIPageControl *)self->_pageControl setNumberOfPages:[(NSMutableArray *)self->_images count]];
  pageControl = self->_pageControl;
  unint64_t v4 = SUUIPageForCollectionView(self->_collectionView);
  [(UIPageControl *)pageControl setCurrentPage:v4];
}

- (void)_reloadSize
{
  uint64_t v3 = [(SUUIIPhoneSlideshowViewController *)self view];
  [v3 frame];
  double v5 = v4 + -54.0;

  id v6 = [(SUUIIPhoneSlideshowViewController *)self view];
  [v6 frame];
  double v8 = v7 + -64.0;

  id v9 = [(SUUIGiftThemeCollectionView *)self->_collectionView collectionViewLayout];
  objc_msgSend(v9, "setItemSize:", v5, v8);

  -[SUUIGiftThemeCollectionView setFrame:](self->_collectionView, "setFrame:", 27.0, 32.0, v5, v8);
  int64_t indexToScrollToOnLoadView = self->_indexToScrollToOnLoadView;
  collectionView = self->_collectionView;
  long long v12 = [MEMORY[0x263F82B60] mainScreen];
  [v12 bounds];
  double v14 = v13 + -54.0;
  if (indexToScrollToOnLoadView == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SUUIGiftThemeCollectionView setContentOffset:](collectionView, "setContentOffset:", v14 * (double)(uint64_t)SUUIPageForCollectionView(self->_collectionView), 0.0);
  }
  else
  {
    -[SUUIGiftThemeCollectionView setContentOffset:](collectionView, "setContentOffset:", v14 * (double)self->_indexToScrollToOnLoadView, 0.0);

    self->_int64_t indexToScrollToOnLoadView = 0x7FFFFFFFFFFFFFFFLL;
  }
  double v15 = self->_collectionView;
  [(SUUIGiftThemeCollectionView *)v15 reloadData];
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SUUISlideshowViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SUUISlideshowViewControllerDataSource *)WeakRetained;
}

- (SUUISlideshowViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUISlideshowViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImages, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_placeholderQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end