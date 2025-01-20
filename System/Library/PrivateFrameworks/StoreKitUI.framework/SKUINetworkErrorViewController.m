@interface SKUINetworkErrorViewController
+ (BOOL)canDisplayError:(id)a3;
- (NSError)error;
- (SKUIClientContext)clientContext;
- (SKUINetworkErrorViewController)init;
- (SKUINetworkErrorViewController)initWithError:(id)a3;
- (SKUIProductPageHeaderViewController)headerViewController;
- (UIScrollView)scrollView;
- (id)delegate;
- (void)_networkTypeChanged:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SKUINetworkErrorViewController

- (SKUINetworkErrorViewController)init
{
  return [(SKUINetworkErrorViewController *)self initWithError:0];
}

- (SKUINetworkErrorViewController)initWithError:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUINetworkErrorViewController initWithError:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUINetworkErrorViewController;
  v6 = [(SKUINetworkErrorViewController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = *MEMORY[0x1E4FB87E0];
    v10 = [MEMORY[0x1E4FB8820] sharedInstance];
    [v8 addObserver:v7 selector:sel__networkTypeChanged_ name:v9 object:v10];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB87E0] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SKUINetworkErrorViewController;
  [(SKUINetworkErrorViewController *)&v4 dealloc];
}

+ (BOOL)canDisplayError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 code];
  id v5 = [v3 domain];

  if (v4 == -1009)
  {
    v6 = (void *)MEMORY[0x1E4F289A0];
  }
  else
  {
    if (v4 != 110)
    {
      char v7 = 0;
      goto LABEL_7;
    }
    v6 = (void *)MEMORY[0x1E4FA8680];
  }
  char v7 = [v5 isEqualToString:*v6];
LABEL_7:

  return v7;
}

- (void)loadView
{
  int v3 = MGGetBoolAnswer();
  int v4 = MGGetBoolAnswer();
  int v5 = MGGetBoolAnswer();
  v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  clientContext = self->_clientContext;
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (clientContext)
    {
      uint64_t v9 = @"NETWORK_ERROR_TITLE_IPAD";
LABEL_6:
      uint64_t v10 = [(SKUIClientContext *)clientContext localizedStringForKey:v9];
      goto LABEL_10;
    }
    v11 = @"NETWORK_ERROR_TITLE_IPAD";
  }
  else
  {
    if (clientContext)
    {
      uint64_t v9 = @"NETWORK_ERROR_TITLE_IPHONE";
      goto LABEL_6;
    }
    v11 = @"NETWORK_ERROR_TITLE_IPHONE";
  }
  uint64_t v10 = +[SKUIClientContext localizedStringForKey:v11 inBundles:0];
LABEL_10:
  objc_super v12 = (void *)v10;
  v13 = self->_clientContext;
  id v20 = v12;
  if (((v5 | v4) & 1) == 0)
  {
    if (v13)
    {
      v14 = @"NETWORK_ERROR_MESSAGE_CELL_ONLY";
      goto LABEL_26;
    }
    v15 = @"NETWORK_ERROR_MESSAGE_CELL_ONLY";
LABEL_21:
    uint64_t v16 = +[SKUIClientContext localizedStringForKey:v15 inBundles:0];
    goto LABEL_27;
  }
  if (!v4)
  {
    if (v3)
    {
      if (v13)
      {
        v14 = @"NETWORK_ERROR_MESSAGE_WIFI_OR_CELL";
        goto LABEL_26;
      }
      v15 = @"NETWORK_ERROR_MESSAGE_WIFI_OR_CELL";
    }
    else
    {
      if (v13)
      {
        v14 = @"NETWORK_ERROR_MESSAGE_WIFI_ONLY";
        goto LABEL_26;
      }
      v15 = @"NETWORK_ERROR_MESSAGE_WIFI_ONLY";
    }
    goto LABEL_21;
  }
  if (!v3)
  {
    if (v13)
    {
      v14 = @"NETWORK_ERROR_MESSAGE_WLAN_ONLY";
      goto LABEL_26;
    }
    v15 = @"NETWORK_ERROR_MESSAGE_WLAN_ONLY";
    goto LABEL_21;
  }
  if (!v13)
  {
    v15 = @"NETWORK_ERROR_MESSAGE_WLAN_OR_CELL";
    goto LABEL_21;
  }
  v14 = @"NETWORK_ERROR_MESSAGE_WLAN_OR_CELL";
LABEL_26:
  uint64_t v16 = [(SKUIClientContext *)v13 localizedStringForKey:v14];
LABEL_27:
  v17 = (void *)v16;
  id v18 = objc_alloc(MEMORY[0x1E4FB2070]);
  v19 = objc_msgSend(v18, "initWithFrame:title:style:", v20, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v19 setMessage:v17];
  [(SKUINetworkErrorViewController *)self setView:v19];
}

- (UIScrollView)scrollView
{
  return 0;
}

- (SKUIProductPageHeaderViewController)headerViewController
{
  return 0;
}

- (void)_networkTypeChanged:(id)a3
{
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SKUINetworkErrorViewController__networkTypeChanged___block_invoke;
  block[3] = &unk_1E6422020;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

void __54__SKUINetworkErrorViewController__networkTypeChanged___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB8820] sharedInstance];
  uint64_t v3 = [v2 networkType];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
      [v6 networkErrorViewControllerInvalidated:*(void *)(a1 + 32)];
    }
  }
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUINetworkErrorViewController initWithError:]";
}

@end