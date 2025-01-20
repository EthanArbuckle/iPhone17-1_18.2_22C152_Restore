@interface SKUIDonationViewController
- (NSOperationQueue)operationQueue;
- (NSString)charityIdentifier;
- (SKUIClientContext)clientContext;
- (SKUIDonationViewController)initWithCharityIdentifier:(id)a3;
- (SKUIDonationViewController)initWithURL:(id)a3;
- (id)_initSKUIDonationViewController;
- (void)_cancelButtonAction:(id)a3;
- (void)_configurationDidLoadWithResult:(BOOL)a3 error:(id)a4;
- (void)_finishAuthenticateWithResponse:(id)a3 error:(id)a4;
- (void)_initSKUIDonationViewController;
- (void)_loadDonationConfiguration;
- (void)setClientContext:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SKUIDonationViewController

- (id)_initSKUIDonationViewController
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDonationViewController _initSKUIDonationViewController]();
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  v4 = [v3 view];
  v5 = [MEMORY[0x1E4FB1618] _systemBackgroundColor];
  [v4 setBackgroundColor:v5];

  v9.receiver = self;
  v9.super_class = (Class)SKUIDonationViewController;
  v6 = [(SKUIDonationViewController *)&v9 initWithRootViewController:v3];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_placeholderViewController, v3);
    [(SKUIDonationViewController *)v7 setModalPresentationStyle:2];
  }

  return v7;
}

- (SKUIDonationViewController)initWithCharityIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIDonationViewController *)self _initSKUIDonationViewController];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    charityID = v5->_charityID;
    v5->_charityID = (NSString *)v6;
  }
  return v5;
}

- (SKUIDonationViewController)initWithURL:(id)a3
{
  id v4 = [a3 valueForQueryParameter:@"charity"];
  v5 = [(SKUIDonationViewController *)self initWithCharityIdentifier:v4];

  return v5;
}

- (NSOperationQueue)operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:6];
    operationQueue = self->_operationQueue;
  }

  return operationQueue;
}

- (void)setClientContext:(id)a3
{
  v5 = (SKUIClientContext *)a3;
  p_clientContext = &self->_clientContext;
  if (self->_clientContext != v5)
  {
    objc_super v9 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    placeholderViewController = self->_placeholderViewController;
    if (*p_clientContext) {
      [(SKUIClientContext *)*p_clientContext localizedStringForKey:@"DONATION_FLOW_TITLE"];
    }
    else {
    v8 = +[SKUIClientContext localizedStringForKey:@"DONATION_FLOW_TITLE" inBundles:0];
    }
    [(UIViewController *)placeholderViewController setTitle:v8];

    v5 = v9;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_donationConfiguration)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB14A8]);
    [v5 setAction:sel__cancelButtonAction_];
    [v5 setTarget:self];
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"DONATION_FLOW_CANCEL_BUTTON"];
    }
    else {
    v7 = +[SKUIClientContext localizedStringForKey:@"DONATION_FLOW_CANCEL_BUTTON" inBundles:0];
    }
    [v5 setTitle:v7];

    v8 = [(SKUIDonationViewController *)self topViewController];
    objc_super v9 = [v8 navigationItem];
    [v9 setLeftBarButtonItem:v5];

    v10 = [MEMORY[0x1E4FA8100] defaultStore];
    v11 = [v10 activeAccount];

    if (v11)
    {
      [(SKUIDonationViewController *)self _loadDonationConfiguration];
    }
    else
    {
      objc_initWeak(&location, self);
      id v12 = objc_alloc(MEMORY[0x1E4FA8128]);
      v13 = [MEMORY[0x1E4FA8130] contextForSignIn];
      v14 = (void *)[v12 initWithAuthenticationContext:v13];

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __45__SKUIDonationViewController_viewWillAppear___block_invoke;
      v16[3] = &unk_1E6424220;
      objc_copyWeak(&v17, &location);
      [v14 startWithAuthenticateResponseBlock:v16];
      objc_destroyWeak(&v17);

      objc_destroyWeak(&location);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIDonationViewController;
  [(SKUIDonationViewController *)&v15 viewWillAppear:v3];
}

void __45__SKUIDonationViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SKUIDonationViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_1E6423FF8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __45__SKUIDonationViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishAuthenticateWithResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_cancelButtonAction:(id)a3
{
}

- (void)_configurationDidLoadWithResult:(BOOL)a3 error:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  donationConfiguration = self->_donationConfiguration;
  if (self->_charityID)
  {
    id v7 = -[SKUIDonationConfiguration charityForIdentifier:](donationConfiguration, "charityForIdentifier:");
    if (v7)
    {
LABEL_3:
      id v8 = [[SKUIDonationAmountViewController alloc] initWithCharity:v7 configuration:self->_donationConfiguration];
      objc_super v9 = [(SKUIDonationViewController *)self operationQueue];
      [(SKUIDonationStepViewController *)v8 setOperationQueue:v9];

      [(SKUIDonationConfiguration *)self->_donationConfiguration loadLogoForCharity:v7];
      v16[0] = v8;
      id v10 = (void *)MEMORY[0x1E4F1C978];
      id v11 = (SKUIDonationAmountViewController **)v16;
      goto LABEL_10;
    }
  }
  else
  {
    id v12 = [(SKUIDonationConfiguration *)donationConfiguration allCharities];
    if ([v12 count])
    {
      id v7 = [v12 objectAtIndex:0];
    }
    else
    {
      id v7 = 0;
    }

    if (v7) {
      goto LABEL_3;
    }
  }
  if (!+[SKUINetworkErrorViewController canDisplayError:v5])
  {
    NSLog(&cfstr_DonationError.isa, v5);
    [(SKUIDonationViewController *)self dismissViewControllerAnimated:1 completion:0];
    goto LABEL_11;
  }
  id v8 = [[SKUINetworkErrorViewController alloc] initWithError:v5];
  [(SKUIDonationAmountViewController *)v8 setClientContext:self->_clientContext];
  objc_super v15 = v8;
  id v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = &v15;
LABEL_10:
  v13 = [v10 arrayWithObjects:v11 count:1];
  [(SKUIDonationViewController *)self setViewControllers:v13];

LABEL_11:
  placeholderViewController = self->_placeholderViewController;
  self->_placeholderViewController = 0;
}

- (void)_finishAuthenticateWithResponse:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7 && [v7 authenticateResponseType] == 4) {
    [(SKUIDonationViewController *)self _loadDonationConfiguration];
  }
  else {
    [(SKUIDonationViewController *)self _configurationDidLoadWithResult:0 error:v6];
  }
}

- (void)_loadDonationConfiguration
{
  objc_initWeak(&location, self);
  BOOL v3 = [SKUIDonationConfiguration alloc];
  id v4 = [(SKUIDonationViewController *)self operationQueue];
  id v5 = [(SKUIDonationViewController *)self clientContext];
  id v6 = [(SKUIDonationConfiguration *)v3 initWithOperationQueue:v4 clientContext:v5];
  donationConfiguration = self->_donationConfiguration;
  self->_donationConfiguration = v6;

  id v8 = self->_donationConfiguration;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__SKUIDonationViewController__loadDonationConfiguration__block_invoke;
  v9[3] = &unk_1E6424270;
  objc_copyWeak(&v10, &location);
  [(SKUIDonationConfiguration *)v8 loadConfigurationWithCompletionBlock:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __56__SKUIDonationViewController__loadDonationConfiguration__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SKUIDonationViewController__loadDonationConfiguration__block_invoke_2;
  block[3] = &unk_1E6424248;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __56__SKUIDonationViewController__loadDonationConfiguration__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _configurationDidLoadWithResult:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

- (NSString)charityIdentifier
{
  return self->_charityID;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_donationConfiguration, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);

  objc_storeStrong((id *)&self->_charityID, 0);
}

- (void)_initSKUIDonationViewController
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDonationViewController _initSKUIDonationViewController]";
}

@end