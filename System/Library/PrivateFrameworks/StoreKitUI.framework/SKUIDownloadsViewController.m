@interface SKUIDownloadsViewController
+ (int64_t)_sizeClassForSize:(CGSize)a3;
- (NSArray)downloads;
- (SKUIDownloadsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)childViewController:(id)a3 artworkForDownload:(id)a4;
- (void)_reloadBadge;
- (void)_reloadManagerFromServer;
- (void)_reloadView;
- (void)_reloadViewControllerWithSize:(CGSize)a3;
- (void)_setArtwork:(id)a3 forURLString:(id)a4;
- (void)childViewController:(id)a3 performActionForDownload:(id)a4;
- (void)childViewController:(id)a3 removeDownloads:(id)a4;
- (void)dealloc;
- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4;
- (void)downloadManagerDownloadsDidChange:(id)a3;
- (void)loadView;
- (void)setDownloads:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation SKUIDownloadsViewController

- (SKUIDownloadsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v40[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDownloadsViewController initWithNibName:bundle:]();
  }
  v38.receiver = self;
  v38.super_class = (Class)SKUIDownloadsViewController;
  v8 = [(SKUIDownloadsViewController *)&v38 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FA8178]);
    v10 = [MEMORY[0x1E4FA8170] ITunesDownloadKinds];
    [v9 setDownloadKinds:v10];

    uint64_t v11 = *MEMORY[0x1E4FA8450];
    v40[0] = *MEMORY[0x1E4FA8448];
    v40[1] = v11;
    uint64_t v12 = *MEMORY[0x1E4FA8460];
    v40[2] = *MEMORY[0x1E4FA8458];
    v40[3] = v12;
    v40[4] = *MEMORY[0x1E4FA8468];
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:5];
    [v9 setPrefetchedDownloadExternalProperties:v13];

    uint64_t v14 = *MEMORY[0x1E4FA8570];
    v39[0] = *MEMORY[0x1E4FA8538];
    v39[1] = v14;
    uint64_t v15 = *MEMORY[0x1E4FA85A0];
    v39[2] = *MEMORY[0x1E4FA8588];
    v39[3] = v15;
    uint64_t v16 = *MEMORY[0x1E4FA8660];
    v39[4] = *MEMORY[0x1E4FA8650];
    v39[5] = v16;
    uint64_t v17 = *MEMORY[0x1E4FA8628];
    v39[6] = *MEMORY[0x1E4FA8560];
    v39[7] = v17;
    uint64_t v18 = *MEMORY[0x1E4FA8640];
    v39[8] = *MEMORY[0x1E4FA85B8];
    v39[9] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:10];
    [v9 setPrefetchedDownloadProperties:v19];

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4FA8170]) initWithManagerOptions:v9];
    downloadManager = v8->_downloadManager;
    v8->_downloadManager = (SSDownloadManager *)v20;

    [(SSDownloadManager *)v8->_downloadManager addObserver:v8];
    [(SKUIDownloadsViewController *)v8 setAutomaticallyAdjustsScrollViewInsets:0];
    uint64_t v22 = +[SSVURLDataConsumer consumer];
    consumer = v8->_consumer;
    v8->_consumer = (SKUIImageDataConsumer *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    imageOperations = v8->_imageOperations;
    v8->_imageOperations = v24;

    v26 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    images = v8->_images;
    v8->_images = v26;

    v28 = (UIImage *)objc_alloc_init(MEMORY[0x1E4FB1818]);
    nullImage = v8->_nullImage;
    v8->_nullImage = v28;

    objc_initWeak(&location, v8);
    dispatch_time_t v30 = dispatch_time(0, 60000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__SKUIDownloadsViewController_initWithNibName_bundle___block_invoke;
    block[3] = &unk_1E6422250;
    objc_copyWeak(&v36, &location);
    v31 = MEMORY[0x1E4F14428];
    dispatch_after(v30, MEMORY[0x1E4F14428], block);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __54__SKUIDownloadsViewController_initWithNibName_bundle___block_invoke_2;
    v33[3] = &unk_1E6422020;
    v34 = v8;
    dispatch_async(v31, v33);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  return v8;
}

void __54__SKUIDownloadsViewController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadManagerFromServer];
}

uint64_t __54__SKUIDownloadsViewController_initWithNibName_bundle___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadBadge];
}

- (void)dealloc
{
  [(SSDownloadManager *)self->_downloadManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SKUIDownloadsViewController;
  [(SKUIViewController *)&v3 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(SKUIDownloadsViewController *)self setView:v3];
  [(SKUIDownloadsViewController *)self _reloadView];
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(SKUIDownloadsViewController *)self view];
  [v3 frame];
  -[SKUIDownloadsViewController _reloadViewControllerWithSize:](self, "_reloadViewControllerWithSize:", v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)SKUIDownloadsViewController;
  [(SKUIDownloadsViewController *)&v6 viewDidLayoutSubviews];
}

- (void)childViewController:(id)a3 performActionForDownload:(id)a4
{
  id v8 = a4;
  double v4 = [v8 valueForProperty:*MEMORY[0x1E4FA8588]];
  double v5 = [v8 valueForProperty:*MEMORY[0x1E4FA8570]];
  if ([v5 BOOLValue]) {
    int v6 = [v4 isEqual:*MEMORY[0x1E4FA84F0]];
  }
  else {
    int v6 = 0;
  }

  if (([v4 isEqualToString:*MEMORY[0x1E4FA84F8]] & 1) == 0)
  {
    int v7 = [v4 isEqualToString:*MEMORY[0x1E4FA8520]];
    if ((v6 & 1) == 0)
    {
      if (!v7) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
LABEL_8:
    [v8 pause];
    goto LABEL_11;
  }
  if (v6) {
    goto LABEL_8;
  }
LABEL_10:
  [v8 resume];
LABEL_11:
}

- (void)childViewController:(id)a3 removeDownloads:(id)a4
{
}

- (id)childViewController:(id)a3 artworkForDownload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 valueForProperty:*MEMORY[0x1E4FA8650]];
  if (!v8) {
    goto LABEL_7;
  }
  id v9 = [(NSCache *)self->_images objectForKey:v8];
  v10 = v9;
  if (v9 == self->_nullImage) {
    goto LABEL_6;
  }
  if (v9) {
    goto LABEL_8;
  }
  uint64_t v11 = [(NSMutableDictionary *)self->_imageOperations objectForKey:v8];

  if (!v11)
  {
    v10 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    objc_initWeak(&location, self);
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithURL:v10];
    [v12 setDataConsumer:self->_consumer];
    [v12 setITunesStoreRequest:0];
    [v12 setRecordsMetrics:0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__SKUIDownloadsViewController_childViewController_artworkForDownload___block_invoke;
    v16[3] = &unk_1E6429C88;
    objc_copyWeak(&v18, &location);
    id v13 = v8;
    id v17 = v13;
    [v12 setOutputBlock:v16];
    [(NSMutableDictionary *)self->_imageOperations setObject:v12 forKey:v13];
    uint64_t v14 = [(SKUIViewController *)self operationQueue];
    [v14 addOperation:v12];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
LABEL_6:
  }
LABEL_7:
  v10 = 0;
LABEL_8:

  return v10;
}

void __70__SKUIDownloadsViewController_childViewController_artworkForDownload___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SKUIDownloadsViewController_childViewController_artworkForDownload___block_invoke_2;
  block[3] = &unk_1E6423FF8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __70__SKUIDownloadsViewController_childViewController_artworkForDownload___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setArtwork:*(void *)(a1 + 32) forURLString:*(void *)(a1 + 40)];
}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SKUIDownloadsViewController_downloadManager_downloadStatesDidChange___block_invoke;
  v7[3] = &unk_1E6421FF8;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __71__SKUIDownloadsViewController_downloadManager_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28E60] indexSet];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        id v9 = objc_msgSend(*(id *)(a1 + 40), "downloads", (void)v11);
        uint64_t v10 = [v9 indexOfObject:v8];

        if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
          [v2 addIndex:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  [*(id *)(*(void *)(a1 + 40) + 1088) reloadDownloadsAtIndexes:v2];
  [*(id *)(*(void *)(a1 + 40) + 1080) reloadDownloadsAtIndexes:v2];
}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SKUIDownloadsViewController_downloadManagerDownloadsDidChange___block_invoke;
  block[3] = &unk_1E6422020;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__SKUIDownloadsViewController_downloadManagerDownloadsDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [v1 view];
  [v4 frame];
  objc_msgSend(v1, "_reloadViewControllerWithSize:", v2, v3);
}

- (void)_reloadViewControllerWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SKUIDownloadsViewController *)self _reloadBadge];
  uint64_t v6 = objc_msgSend((id)objc_opt_class(), "_sizeClassForSize:", width, height);
  if (v6 == 2)
  {
    iphoneViewController = self->_iphoneViewController;
    if (iphoneViewController)
    {
      uint64_t v16 = [(SKUIIPhoneDownloadsViewController *)iphoneViewController view];
      [v16 removeFromSuperview];

      [(SKUIIPhoneDownloadsViewController *)self->_iphoneViewController removeFromParentViewController];
      [(SKUIIPhoneDownloadsViewController *)self->_iphoneViewController setDelegate:0];
      id v17 = self->_iphoneViewController;
      self->_iphoneViewController = 0;

      id v18 = [(SKUIDownloadsViewController *)self navigationItem];
      [v18 setLeftBarButtonItems:0];

      v19 = [(SKUIDownloadsViewController *)self navigationItem];
      [v19 setRightBarButtonItems:0];
    }
    uint64_t v12 = 1088;
    ipadViewController = self->_ipadViewController;
    if (!ipadViewController)
    {
      long long v14 = SKUIIPadDownloadsViewController;
      goto LABEL_11;
    }
  }
  else
  {
    if (v6 == 1)
    {
      uint64_t v7 = self->_ipadViewController;
      if (v7)
      {
        uint64_t v8 = [(SKUIIPadDownloadsViewController *)v7 view];
        [v8 removeFromSuperview];

        [(SKUIIPadDownloadsViewController *)self->_ipadViewController removeFromParentViewController];
        [(SKUIIPadDownloadsViewController *)self->_ipadViewController setDelegate:0];
        id v9 = self->_ipadViewController;
        self->_ipadViewController = 0;

        uint64_t v10 = [(SKUIDownloadsViewController *)self navigationItem];
        [v10 setLeftBarButtonItems:0];

        long long v11 = [(SKUIDownloadsViewController *)self navigationItem];
        [v11 setRightBarButtonItems:0];
      }
    }
    uint64_t v12 = 1080;
    ipadViewController = self->_iphoneViewController;
    if (!ipadViewController)
    {
      long long v14 = SKUIIPhoneDownloadsViewController;
LABEL_11:
      uint64_t v20 = (objc_class *)objc_alloc_init(v14);
      v21 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
      *(Class *)((char *)&self->super.super.super.super.isa + v12) = v20;

      uint64_t v22 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
      v23 = [(SKUIDownloadsViewController *)self navigationItem];
      [v22 _setExistingNavigationItem:v23];

      [*(id *)((char *)&self->super.super.super.super.isa + v12) setDelegate:self];
      v24 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
      v25 = [(SKUIViewController *)self clientContext];
      [v24 setClientContext:v25];

      [(SKUIDownloadsViewController *)self addChildViewController:*(Class *)((char *)&self->super.super.super.super.isa + v12)];
      ipadViewController = *(Class *)((char *)&self->super.super.super.super.isa + v12);
    }
  }
  v26 = [(SKUIDownloadsViewController *)self downloads];
  [ipadViewController setDownloads:v26];

  [(SKUIDownloadsViewController *)self _reloadView];
}

- (void)_reloadView
{
  if ([(SKUIDownloadsViewController *)self isViewLoaded])
  {
    id v5 = [(SKUIDownloadsViewController *)self view];
    ipadViewController = self->_ipadViewController;
    if (!ipadViewController) {
      ipadViewController = self->_iphoneViewController;
    }
    id v4 = [ipadViewController view];
    [v5 frame];
    objc_msgSend(v4, "setFrame:");
    [v4 setAutoresizingMask:18];
    [v5 addSubview:v4];
  }
}

- (void)_reloadBadge
{
  double v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SKUIDownloadsViewController__reloadBadge__block_invoke;
  block[3] = &unk_1E6422020;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __43__SKUIDownloadsViewController__reloadBadge__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(*(void *)(a1 + 32) + 1056) downloads];
  [*(id *)(a1 + 32) setDownloads:v2];

  double v3 = [*(id *)(a1 + 32) downloads];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v5 setNumberStyle:1];
    uint64_t v6 = NSNumber;
    uint64_t v7 = [*(id *)(a1 + 32) downloads];
    uint64_t v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    id v9 = [v5 stringFromNumber:v8];
  }
  else
  {
    id v9 = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__SKUIDownloadsViewController__reloadBadge__block_invoke_2;
  v11[3] = &unk_1E6421FF8;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v9;
  id v10 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __43__SKUIDownloadsViewController__reloadBadge__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tabBarItem];
  [v2 setBadgeValue:*(void *)(a1 + 40)];
}

- (void)_reloadManagerFromServer
{
}

- (void)_setArtwork:(id)a3 forURLString:(id)a4
{
  id v18 = (UIImage *)a3;
  id v6 = a4;
  [(NSMutableDictionary *)self->_imageOperations removeObjectForKey:v6];
  nullImage = v18;
  if (!v18) {
    nullImage = self->_nullImage;
  }
  [(NSCache *)self->_images setObject:nullImage forKey:v6];
  uint64_t v8 = [MEMORY[0x1E4F28E60] indexSet];
  id v9 = [(SKUIDownloadsViewController *)self downloads];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0;
    uint64_t v12 = *MEMORY[0x1E4FA8650];
    do
    {
      long long v13 = [(SKUIDownloadsViewController *)self downloads];
      long long v14 = [v13 objectAtIndex:v11];
      uint64_t v15 = [v14 valueForProperty:v12];

      if ([v15 isEqualToString:v6]) {
        [v8 addIndex:v11];
      }

      ++v11;
      uint64_t v16 = [(SKUIDownloadsViewController *)self downloads];
      unint64_t v17 = [v16 count];
    }
    while (v11 < v17);
  }
  [(SKUIIPadDownloadsViewController *)self->_ipadViewController reloadDownloadsAtIndexes:v8];
  [(SKUIIPhoneDownloadsViewController *)self->_iphoneViewController reloadDownloadsAtIndexes:v8];
}

+ (int64_t)_sizeClassForSize:(CGSize)a3
{
  if (a3.width <= 600.0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (NSArray)downloads
{
  return (NSArray *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setDownloads:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_nullImage, 0);
  objc_storeStrong((id *)&self->_ipadViewController, 0);
  objc_storeStrong((id *)&self->_iphoneViewController, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_imageOperations, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);

  objc_storeStrong((id *)&self->_consumer, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDownloadsViewController initWithNibName:bundle:]";
}

@end