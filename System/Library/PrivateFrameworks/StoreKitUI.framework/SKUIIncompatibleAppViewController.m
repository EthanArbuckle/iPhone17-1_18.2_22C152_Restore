@interface SKUIIncompatibleAppViewController
- (NSOperationQueue)operationQueue;
- (SKUIIncompatibleAppViewController)initWithIncompatibleItem:(id)a3;
- (SKUIProductPageChildViewControllerDelegate)delegate;
- (SKUIProductPageHeaderViewController)headerViewController;
- (SKUIProductPageItem)incompatibleItem;
- (UIScrollView)scrollView;
- (id)_artworkContext;
- (void)_learnMoreAboutApp:(id)a3;
- (void)_learnMoreAboutIPad:(id)a3;
- (void)_setArtworkWithImage:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)reloadData;
- (void)setDelegate:(id)a3;
- (void)setHeaderViewController:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SKUIIncompatibleAppViewController

- (SKUIIncompatibleAppViewController)initWithIncompatibleItem:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIncompatibleAppViewController initWithIncompatibleItem:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIIncompatibleAppViewController;
  v6 = [(SKUIIncompatibleAppViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_incompatibleItem, a3);
    v8 = [(SKUIItem *)v7->_incompatibleItem title];
    [(SKUIIncompatibleAppViewController *)v7 setTitle:v8];
  }
  return v7;
}

- (void)dealloc
{
  [(SKUIIncompatibleAppView *)self->_incompatibleView removeButtonTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SKUIIncompatibleAppViewController;
  [(SKUIViewController *)&v3 dealloc];
}

- (UIScrollView)scrollView
{
  return 0;
}

- (void)reloadData
{
  if (!self->_iconImage && !self->_loadIconOperation)
  {
    objc_super v3 = [(SKUIIncompatibleAppViewController *)self _artworkContext];
    v4 = [v3 URLForItem:self->_incompatibleItem];
    if (v4)
    {
      id v5 = (SSVLoadURLOperation *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithURL:v4];
      loadIconOperation = self->_loadIconOperation;
      self->_loadIconOperation = v5;

      v7 = self->_loadIconOperation;
      v8 = [v3 dataConsumerForItem:self->_incompatibleItem];
      [(SSVLoadURLOperation *)v7 setDataConsumer:v8];

      [(SSVLoadURLOperation *)self->_loadIconOperation setITunesStoreRequest:0];
      [(SSVLoadURLOperation *)self->_loadIconOperation setQueuePriority:4];
      objc_initWeak(&location, self);
      v9 = self->_loadIconOperation;
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      v13 = __47__SKUIIncompatibleAppViewController_reloadData__block_invoke;
      v14 = &unk_1E6424128;
      objc_copyWeak(&v15, &location);
      [(SSVLoadURLOperation *)v9 setOutputBlock:&v11];
      objc_super v10 = [(SKUIIncompatibleAppViewController *)self operationQueue];
      [v10 addOperation:self->_loadIconOperation];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __47__SKUIIncompatibleAppViewController_reloadData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SKUIIncompatibleAppViewController_reloadData__block_invoke_2;
  block[3] = &unk_1E6423FF8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __47__SKUIIncompatibleAppViewController_reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setArtworkWithImage:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)loadView
{
  incompatibleView = self->_incompatibleView;
  if (!incompatibleView)
  {
    v4 = [(SKUIViewController *)self clientContext];
    id v5 = objc_alloc_init(SKUIIncompatibleAppView);
    id v6 = self->_incompatibleView;
    self->_incompatibleView = v5;

    id v7 = self->_incompatibleView;
    id v8 = [MEMORY[0x1E4FB1618] whiteColor];
    [(SKUIIncompatibleAppView *)v7 setBackgroundColor:v8];

    incompatibleItem = self->_incompatibleItem;
    if (!incompatibleItem)
    {
LABEL_29:

      incompatibleView = self->_incompatibleView;
      goto LABEL_30;
    }
    uint64_t v35 = [(SKUIItem *)incompatibleItem itemKind];
    v36 = v4;
    if (v35 == 5)
    {
      if (v4) {
        [v4 localizedStringForKey:@"INCOMPATIBLE_MAC_APP_TITLE" inTable:@"ProductPage"];
      }
      else {
      v37 = +[SKUIClientContext localizedStringForKey:@"INCOMPATIBLE_MAC_APP_TITLE" inBundles:0 inTable:@"ProductPage"];
      }
      if (v4)
      {
        id v12 = @"INCOMPATIBLE_MAC_APP_MESSAGE";
LABEL_14:
        uint64_t v13 = [v4 localizedStringForKey:v12 inTable:@"ProductPage"];
LABEL_18:
        id v15 = (void *)v13;
        v16 = self->_incompatibleView;
        v17 = NSString;
        v18 = [(SKUIIncompatibleAppViewController *)self title];
        v19 = [v17 stringWithValidatedFormat:v37, @"%@", 0, v18 validFormatSpecifiers error];
        [(SKUIIncompatibleAppView *)v16 setTitle:v19];

        v20 = self->_incompatibleView;
        v21 = NSString;
        v22 = [(SKUIIncompatibleAppViewController *)self title];
        v23 = [v21 stringWithValidatedFormat:v15, @"%@", 0, v22 validFormatSpecifiers error];
        [(SKUIIncompatibleAppView *)v20 setMessage:v23];

        v24 = self->_incompatibleView;
        v25 = [(SKUIIncompatibleAppViewController *)self _artworkContext];
        v26 = [v25 placeholderImageForItem:self->_incompatibleItem];
        [(SKUIIncompatibleAppView *)v24 setIconImage:v26];

        v4 = v36;
        v27 = v15;
        if (v35 != 5)
        {
          v28 = self->_incompatibleView;
          if (v36) {
            [v36 localizedStringForKey:@"INCOMPATIBLE_LEARN_MORE_ABOUT_IPAD" inTable:@"ProductPage"];
          }
          else {
          v29 = +[SKUIClientContext localizedStringForKey:@"INCOMPATIBLE_LEARN_MORE_ABOUT_IPAD" inBundles:0 inTable:@"ProductPage"];
          }
          v30 = [(SKUIIncompatibleAppView *)v28 addButtonWithTitle:v29];

          [v30 addTarget:self action:sel__learnMoreAboutIPad_ forControlEvents:64];
        }
        v31 = [(SKUIProductPageItem *)self->_incompatibleItem supportURLString];

        if (v31)
        {
          v32 = self->_incompatibleView;
          if (v36) {
            [v36 localizedStringForKey:@"INCOMPATIBLE_LEARN_MORE_ABOUT_APP" inTable:@"ProductPage"];
          }
          else {
          v33 = +[SKUIClientContext localizedStringForKey:@"INCOMPATIBLE_LEARN_MORE_ABOUT_APP" inBundles:0 inTable:@"ProductPage"];
          }
          v34 = [(SKUIIncompatibleAppView *)v32 addButtonWithTitle:v33];

          [v34 addTarget:self action:sel__learnMoreAboutApp_ forControlEvents:64];
        }

        goto LABEL_29;
      }
      v14 = @"INCOMPATIBLE_MAC_APP_MESSAGE";
    }
    else
    {
      id v10 = [(SKUIViewController *)self clientContext];
      id v11 = v10;
      if (v10) {
        [v10 localizedStringForKey:@"INCOMPATIBLE_IPAD_APP_TITLE" inTable:@"ProductPage"];
      }
      else {
      v37 = +[SKUIClientContext localizedStringForKey:@"INCOMPATIBLE_IPAD_APP_TITLE" inBundles:0 inTable:@"ProductPage"];
      }

      if (v4)
      {
        id v12 = @"INCOMPATIBLE_IPAD_APP_MESSAGE";
        goto LABEL_14;
      }
      v14 = @"INCOMPATIBLE_IPAD_APP_MESSAGE";
    }
    uint64_t v13 = +[SKUIClientContext localizedStringForKey:v14 inBundles:0 inTable:@"ProductPage"];
    goto LABEL_18;
  }
LABEL_30:

  [(SKUIIncompatibleAppViewController *)self setView:incompatibleView];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SKUIIncompatibleAppViewController *)self reloadData];
  v5.receiver = self;
  v5.super_class = (Class)SKUIIncompatibleAppViewController;
  [(SKUIViewController *)&v5 viewWillAppear:v3];
}

- (void)_learnMoreAboutApp:(id)a3
{
  BOOL v3 = [(SKUIProductPageItem *)self->_incompatibleItem supportURLString];
  if (v3)
  {
    id v6 = v3;
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v3];
    objc_super v5 = v4;
    if (v4) {
      SKUIMetricsOpenURL(v4);
    }

    BOOL v3 = v6;
  }
}

- (void)_learnMoreAboutIPad:(id)a3
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"http://apple.com/ipad"];
  SKUIMetricsOpenURL(v3);
}

- (id)_artworkContext
{
  artworkContext = self->_artworkContext;
  if (!artworkContext)
  {
    v4 = +[SKUIItemArtworkContext lockupContextWithSize:3];
    objc_super v5 = self->_artworkContext;
    self->_artworkContext = v4;

    artworkContext = self->_artworkContext;
  }

  return artworkContext;
}

- (void)_setArtworkWithImage:(id)a3 error:(id)a4
{
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)&self->_iconImage, a3);
    [(SKUIIncompatibleAppView *)self->_incompatibleView setIconImage:self->_iconImage];
  }
  loadIconOperation = self->_loadIconOperation;
  self->_loadIconOperation = 0;
}

- (SKUIProductPageChildViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIProductPageChildViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKUIProductPageHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setHeaderViewController:(id)a3
{
}

- (SKUIProductPageItem)incompatibleItem
{
  return self->_incompatibleItem;
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
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_incompatibleView, 0);
  objc_storeStrong((id *)&self->_loadIconOperation, 0);
  objc_storeStrong((id *)&self->_incompatibleItem, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_artworkContext, 0);
}

- (void)initWithIncompatibleItem:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIIncompatibleAppViewController initWithIncompatibleItem:]";
}

@end