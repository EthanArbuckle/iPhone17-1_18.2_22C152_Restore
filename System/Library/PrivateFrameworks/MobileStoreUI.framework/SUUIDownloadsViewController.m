@interface SUUIDownloadsViewController
+ (int64_t)_sizeClassForSize:(CGSize)a3;
- (NSArray)downloads;
- (SUUIDownloadsViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

@implementation SUUIDownloadsViewController

- (void)_reloadBadge
{
  v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUUIDownloadsViewController__reloadBadge__block_invoke;
  block[3] = &unk_265400980;
  block[4] = self;
  dispatch_async(v3, block);
}

void __43__SUUIDownloadsViewController__reloadBadge__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1056) downloads];
  [*(id *)(a1 + 32) setDownloads:v2];

  v3 = [*(id *)(a1 + 32) downloads];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v5 setNumberStyle:1];
    v6 = NSNumber;
    v7 = [*(id *)(a1 + 32) downloads];
    v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v9 = [v5 stringFromNumber:v8];
  }
  else
  {
    v9 = 0;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__SUUIDownloadsViewController__reloadBadge__block_invoke_2;
  v11[3] = &unk_265400890;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v9;
  id v10 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

- (void)setDownloads:(id)a3
{
}

- (NSArray)downloads
{
  return (NSArray *)objc_getProperty(self, a2, 1104, 1);
}

- (SUUIDownloadsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v36[5] = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)SUUIDownloadsViewController;
  uint64_t v4 = [(SUUIDownloadsViewController *)&v34 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F7B180]);
    v6 = [MEMORY[0x263F7B178] ITunesDownloadKinds];
    [v5 setDownloadKinds:v6];

    uint64_t v7 = *MEMORY[0x263F7B548];
    v36[0] = *MEMORY[0x263F7B540];
    v36[1] = v7;
    uint64_t v8 = *MEMORY[0x263F7B558];
    v36[2] = *MEMORY[0x263F7B550];
    v36[3] = v8;
    v36[4] = *MEMORY[0x263F7B560];
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:5];
    [v5 setPrefetchedDownloadExternalProperties:v9];

    uint64_t v10 = *MEMORY[0x263F7B610];
    v35[0] = *MEMORY[0x263F7B5F0];
    v35[1] = v10;
    uint64_t v11 = *MEMORY[0x263F7B638];
    v35[2] = *MEMORY[0x263F7B628];
    v35[3] = v11;
    uint64_t v12 = *MEMORY[0x263F7B738];
    v35[4] = *MEMORY[0x263F7B730];
    v35[5] = v12;
    uint64_t v13 = *MEMORY[0x263F7B6C0];
    v35[6] = *MEMORY[0x263F7B608];
    v35[7] = v13;
    uint64_t v14 = *MEMORY[0x263F7B710];
    v35[8] = *MEMORY[0x263F7B648];
    v35[9] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:10];
    [v5 setPrefetchedDownloadProperties:v15];

    uint64_t v16 = [objc_alloc(MEMORY[0x263F7B178]) initWithManagerOptions:v5];
    downloadManager = v4->_downloadManager;
    v4->_downloadManager = (SSDownloadManager *)v16;

    [(SSDownloadManager *)v4->_downloadManager addObserver:v4];
    [(SUUIDownloadsViewController *)v4 setAutomaticallyAdjustsScrollViewInsets:0];
    uint64_t v18 = +[SSVURLDataConsumer consumer];
    consumer = v4->_consumer;
    v4->_consumer = (SUUIImageDataConsumer *)v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    imageOperations = v4->_imageOperations;
    v4->_imageOperations = v20;

    v22 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    images = v4->_images;
    v4->_images = v22;

    v24 = (UIImage *)objc_alloc_init(MEMORY[0x263F827E8]);
    nullImage = v4->_nullImage;
    v4->_nullImage = v24;

    objc_initWeak(&location, v4);
    dispatch_time_t v26 = dispatch_time(0, 60000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__SUUIDownloadsViewController_initWithNibName_bundle___block_invoke;
    block[3] = &unk_265401538;
    objc_copyWeak(&v32, &location);
    v27 = MEMORY[0x263EF83A0];
    dispatch_after(v26, MEMORY[0x263EF83A0], block);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __54__SUUIDownloadsViewController_initWithNibName_bundle___block_invoke_2;
    v29[3] = &unk_265400980;
    v30 = v4;
    dispatch_async(v27, v29);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  return v4;
}

uint64_t __54__SUUIDownloadsViewController_initWithNibName_bundle___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadBadge];
}

void __43__SUUIDownloadsViewController__reloadBadge__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tabBarItem];
  [v2 setBadgeValue:*(void *)(a1 + 40)];
}

void __54__SUUIDownloadsViewController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadManagerFromServer];
}

- (void)dealloc
{
  [(SSDownloadManager *)self->_downloadManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SUUIDownloadsViewController;
  [(SUUIViewController *)&v3 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x263F82E00]);
  [(SUUIDownloadsViewController *)self setView:v3];
  [(SUUIDownloadsViewController *)self _reloadView];
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(SUUIDownloadsViewController *)self view];
  [v3 frame];
  -[SUUIDownloadsViewController _reloadViewControllerWithSize:](self, "_reloadViewControllerWithSize:", v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)SUUIDownloadsViewController;
  [(SUUIDownloadsViewController *)&v6 viewDidLayoutSubviews];
}

- (void)childViewController:(id)a3 performActionForDownload:(id)a4
{
  id v8 = a4;
  double v4 = [v8 valueForProperty:*MEMORY[0x263F7B628]];
  double v5 = [v8 valueForProperty:*MEMORY[0x263F7B610]];
  if ([v5 BOOLValue]) {
    int v6 = [v4 isEqual:*MEMORY[0x263F7B5C0]];
  }
  else {
    int v6 = 0;
  }

  if (([v4 isEqualToString:*MEMORY[0x263F7B5C8]] & 1) == 0)
  {
    int v7 = [v4 isEqualToString:*MEMORY[0x263F7B5E0]];
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
  id v8 = [v7 valueForProperty:*MEMORY[0x263F7B730]];
  if (!v8) {
    goto LABEL_7;
  }
  v9 = [(NSCache *)self->_images objectForKey:v8];
  uint64_t v10 = v9;
  if (v9 == self->_nullImage) {
    goto LABEL_6;
  }
  if (v9) {
    goto LABEL_8;
  }
  uint64_t v11 = [(NSMutableDictionary *)self->_imageOperations objectForKey:v8];

  if (!v11)
  {
    uint64_t v10 = [NSURL URLWithString:v8];
    objc_initWeak(&location, self);
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:v10];
    [v12 setDataConsumer:self->_consumer];
    [v12 setITunesStoreRequest:0];
    [v12 setRecordsMetrics:0];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __70__SUUIDownloadsViewController_childViewController_artworkForDownload___block_invoke;
    v16[3] = &unk_2654021F8;
    objc_copyWeak(&v18, &location);
    id v13 = v8;
    id v17 = v13;
    [v12 setOutputBlock:v16];
    [(NSMutableDictionary *)self->_imageOperations setObject:v12 forKey:v13];
    uint64_t v14 = [(SUUIViewController *)self operationQueue];
    [v14 addOperation:v12];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
LABEL_6:
  }
LABEL_7:
  uint64_t v10 = 0;
LABEL_8:

  return v10;
}

void __70__SUUIDownloadsViewController_childViewController_artworkForDownload___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__SUUIDownloadsViewController_childViewController_artworkForDownload___block_invoke_2;
  block[3] = &unk_2654012C8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

void __70__SUUIDownloadsViewController_childViewController_artworkForDownload___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setArtwork:*(void *)(a1 + 32) forURLString:*(void *)(a1 + 40)];
}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__SUUIDownloadsViewController_downloadManager_downloadStatesDidChange___block_invoke;
  v7[3] = &unk_265400890;
  id v8 = v5;
  v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __71__SUUIDownloadsViewController_downloadManager_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F089C8] indexSet];
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
        v9 = objc_msgSend(*(id *)(a1 + 40), "downloads", (void)v11);
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
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__SUUIDownloadsViewController_downloadManagerDownloadsDidChange___block_invoke;
  block[3] = &unk_265400980;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__SUUIDownloadsViewController_downloadManagerDownloadsDidChange___block_invoke(uint64_t a1)
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
  [(SUUIDownloadsViewController *)self _reloadBadge];
  uint64_t v6 = objc_msgSend((id)objc_opt_class(), "_sizeClassForSize:", width, height);
  if (v6 == 2)
  {
    iphoneViewController = self->_iphoneViewController;
    if (iphoneViewController)
    {
      uint64_t v16 = [(SUUIIPhoneDownloadsViewController *)iphoneViewController view];
      [v16 removeFromSuperview];

      [(SUUIIPhoneDownloadsViewController *)self->_iphoneViewController removeFromParentViewController];
      [(SUUIIPhoneDownloadsViewController *)self->_iphoneViewController setDelegate:0];
      id v17 = self->_iphoneViewController;
      self->_iphoneViewController = 0;

      id v18 = [(SUUIDownloadsViewController *)self navigationItem];
      [v18 setLeftBarButtonItems:0];

      v19 = [(SUUIDownloadsViewController *)self navigationItem];
      [v19 setRightBarButtonItems:0];
    }
    uint64_t v12 = 1088;
    ipadViewController = self->_ipadViewController;
    if (!ipadViewController)
    {
      long long v14 = SUUIIPadDownloadsViewController;
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
        uint64_t v8 = [(SUUIIPadDownloadsViewController *)v7 view];
        [v8 removeFromSuperview];

        [(SUUIIPadDownloadsViewController *)self->_ipadViewController removeFromParentViewController];
        [(SUUIIPadDownloadsViewController *)self->_ipadViewController setDelegate:0];
        v9 = self->_ipadViewController;
        self->_ipadViewController = 0;

        uint64_t v10 = [(SUUIDownloadsViewController *)self navigationItem];
        [v10 setLeftBarButtonItems:0];

        long long v11 = [(SUUIDownloadsViewController *)self navigationItem];
        [v11 setRightBarButtonItems:0];
      }
    }
    uint64_t v12 = 1080;
    ipadViewController = self->_iphoneViewController;
    if (!ipadViewController)
    {
      long long v14 = SUUIIPhoneDownloadsViewController;
LABEL_11:
      v20 = (objc_class *)objc_alloc_init(v14);
      v21 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
      *(Class *)((char *)&self->super.super.super.super.isa + v12) = v20;

      v22 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
      v23 = [(SUUIDownloadsViewController *)self navigationItem];
      [v22 _setExistingNavigationItem:v23];

      [*(id *)((char *)&self->super.super.super.super.isa + v12) setDelegate:self];
      v24 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
      v25 = [(SUUIViewController *)self clientContext];
      [v24 setClientContext:v25];

      [(SUUIDownloadsViewController *)self addChildViewController:*(Class *)((char *)&self->super.super.super.super.isa + v12)];
      ipadViewController = *(Class *)((char *)&self->super.super.super.super.isa + v12);
    }
  }
  dispatch_time_t v26 = [(SUUIDownloadsViewController *)self downloads];
  [ipadViewController setDownloads:v26];

  [(SUUIDownloadsViewController *)self _reloadView];
}

- (void)_reloadView
{
  if ([(SUUIDownloadsViewController *)self isViewLoaded])
  {
    id v5 = [(SUUIDownloadsViewController *)self view];
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
  uint64_t v8 = [MEMORY[0x263F089C8] indexSet];
  v9 = [(SUUIDownloadsViewController *)self downloads];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0;
    uint64_t v12 = *MEMORY[0x263F7B730];
    do
    {
      long long v13 = [(SUUIDownloadsViewController *)self downloads];
      long long v14 = [v13 objectAtIndex:v11];
      v15 = [v14 valueForProperty:v12];

      if ([v15 isEqualToString:v6]) {
        [v8 addIndex:v11];
      }

      ++v11;
      uint64_t v16 = [(SUUIDownloadsViewController *)self downloads];
      unint64_t v17 = [v16 count];
    }
    while (v11 < v17);
  }
  [(SUUIIPadDownloadsViewController *)self->_ipadViewController reloadDownloadsAtIndexes:v8];
  [(SUUIIPhoneDownloadsViewController *)self->_iphoneViewController reloadDownloadsAtIndexes:v8];
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

@end