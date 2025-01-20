@interface SKUIPassbookLoader
- (NSOperationQueue)operationQueue;
- (SKUIPassbookLoader)initWithClientContext:(id)a3;
- (SKUIPassbookLoaderDelegate)delegate;
- (void)_didLoadWithPass:(id)a3 error:(id)a4;
- (void)_loadPassWithURL:(id)a3;
- (void)_sendDidFinishIfFinished;
- (void)addPassesViewControllerDidFinish:(id)a3;
- (void)loadPassWithURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOperationQueue:(id)a3;
@end

@implementation SKUIPassbookLoader

- (SKUIPassbookLoader)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPassbookLoader initWithClientContext:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIPassbookLoader;
  v6 = [(SKUIPassbookLoader *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientContext, a3);
  }

  return v7;
}

- (void)loadPassWithURL:(id)a3
{
  id v4 = a3;
  ++self->_loadCount;
  id v5 = [MEMORY[0x1E4FA8100] defaultStore];
  v6 = [v5 activeAccount];

  if (v6)
  {
    [(SKUIPassbookLoader *)self _loadPassWithURL:v4];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA8260]);
    [v7 setCanCreateNewAccount:0];
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"PASSBOOK_AUTH_REASON"];
    }
    else {
    objc_super v9 = +[SKUIClientContext localizedStringForKey:@"PASSBOOK_AUTH_REASON" inBundles:0];
    }
    [v7 setReasonDescription:v9];

    v10 = (void *)[objc_alloc(MEMORY[0x1E4FA8128]) initWithAuthenticationContext:v7];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __38__SKUIPassbookLoader_loadPassWithURL___block_invoke;
    v11[3] = &unk_1E6424F98;
    objc_copyWeak(&v13, &location);
    id v12 = v4;
    [v10 startWithAuthenticateResponseBlock:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __38__SKUIPassbookLoader_loadPassWithURL___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __38__SKUIPassbookLoader_loadPassWithURL___block_invoke_2;
  v2[3] = &unk_1E6425240;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __38__SKUIPassbookLoader_loadPassWithURL___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FA8100] defaultStore];
  id v3 = [v2 activeAccount];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v3) {
    [WeakRetained _loadPassWithURL:*(void *)(a1 + 32)];
  }
  else {
    [WeakRetained _sendDidFinishIfFinished];
  }
}

- (NSOperationQueue)operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(NSOperationQueue *)self->_operationQueue setName:@"com.apple.StoreKitUI.SKUIPassbookLoader"];
    operationQueue = self->_operationQueue;
  }

  return operationQueue;
}

- (void)addPassesViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  objc_getAssociatedObject(v4, "com.apple.StoreKitUI.SKUIPassbookLoader.pass");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    uint64_t v5 = SKUIPassKitCoreFramework();
    id v6 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(&cfstr_Pkpasslibrary.isa, v5));
    if ([v6 containsPass:v11])
    {
      id v7 = [MEMORY[0x1E4FA8100] defaultStore];
      v8 = [v7 activeAccount];
      objc_super v9 = [v11 serialNumber];
      [v8 setITunesPassSerialNumber:v9];

      id v10 = (id)[v7 addAccount:v8];
    }
  }
  [v4 setDelegate:0];
  [v4 dismissViewControllerAnimated:1 completion:0];

  [(SKUIPassbookLoader *)self _sendDidFinishIfFinished];
}

- (void)_didLoadWithPass:(id)a3 error:(id)a4
{
  id value = a3;
  if (value)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [WeakRetained presentationViewControllerForPassbookLoader:self];

    if (v6)
    {
      uint64_t v7 = SKUIPassKitUIFramework();
      v8 = (objc_class *)SKUIWeakLinkedClassForString(&cfstr_Pkaddpassesvie.isa, v7);
      if ([(objc_class *)v8 canAddPasses])
      {
        objc_super v9 = (void *)[[v8 alloc] initWithPass:value];
        [v9 setDelegate:self];
        objc_setAssociatedObject(v9, "com.apple.StoreKitUI.SKUIPassbookLoader.pass", value, (void *)1);
        [v6 presentViewController:v9 animated:1 completion:0];
      }
    }
  }
  else
  {
    [(SKUIPassbookLoader *)self _sendDidFinishIfFinished];
  }
}

- (void)_loadPassWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIClientContext *)self->_clientContext newLoadStoreURLOperationWithURL:v4];
  id v6 = +[SSVURLDataConsumer consumer];
  [v5 setDataConsumer:v6];

  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __39__SKUIPassbookLoader__loadPassWithURL___block_invoke;
  id v11 = &unk_1E64263A0;
  objc_copyWeak(&v12, &location);
  [v5 setOutputBlock:&v8];
  uint64_t v7 = [(SKUIPassbookLoader *)self operationQueue];
  [v7 addOperation:v5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __39__SKUIPassbookLoader__loadPassWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SKUIPassbookLoader__loadPassWithURL___block_invoke_2;
  block[3] = &unk_1E6423FF8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __39__SKUIPassbookLoader__loadPassWithURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _didLoadWithPass:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_sendDidFinishIfFinished
{
  int64_t loadCount = self->_loadCount;
  if (loadCount < 2)
  {
    if (loadCount == 1)
    {
      self->_int64_t loadCount = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        id v6 = objc_loadWeakRetained((id *)&self->_delegate);
        [v6 passbookLoaderDidFinish:self];
      }
    }
  }
  else
  {
    self->_int64_t loadCount = loadCount - 1;
  }
}

- (SKUIPassbookLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIPassbookLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPassbookLoader initWithClientContext:]";
}

@end