@interface SUUIDonationViewController
- (NSOperationQueue)operationQueue;
- (NSString)charityIdentifier;
- (SUUIClientContext)clientContext;
- (SUUIDonationViewController)initWithCharityIdentifier:(id)a3;
- (SUUIDonationViewController)initWithURL:(id)a3;
- (id)_initSUUIDonationViewController;
- (void)_cancelButtonAction:(id)a3;
- (void)_configurationDidLoadWithResult:(BOOL)a3 error:(id)a4;
- (void)_finishAuthenticateWithResponse:(id)a3 error:(id)a4;
- (void)_loadDonationConfiguration;
- (void)setClientContext:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUUIDonationViewController

- (id)_initSUUIDonationViewController
{
  id v3 = objc_alloc_init(MEMORY[0x263F82E10]);
  v4 = [v3 view];
  v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v4 setBackgroundColor:v5];

  v9.receiver = self;
  v9.super_class = (Class)SUUIDonationViewController;
  v6 = [(SUUIDonationViewController *)&v9 initWithRootViewController:v3];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_placeholderViewController, v3);
    [(SUUIDonationViewController *)v7 setModalPresentationStyle:2];
  }

  return v7;
}

- (SUUIDonationViewController)initWithCharityIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIDonationViewController *)self _initSUUIDonationViewController];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    charityID = v5->_charityID;
    v5->_charityID = (NSString *)v6;
  }
  return v5;
}

- (SUUIDonationViewController)initWithURL:(id)a3
{
  id v4 = [a3 valueForQueryParameter:@"charity"];
  v5 = [(SUUIDonationViewController *)self initWithCharityIdentifier:v4];

  return v5;
}

- (NSOperationQueue)operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:6];
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (void)setClientContext:(id)a3
{
  v5 = (SUUIClientContext *)a3;
  p_clientContext = &self->_clientContext;
  if (self->_clientContext != v5)
  {
    objc_super v9 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    placeholderViewController = self->_placeholderViewController;
    if (*p_clientContext) {
      [(SUUIClientContext *)*p_clientContext localizedStringForKey:@"DONATION_FLOW_TITLE"];
    }
    else {
    v8 = +[SUUIClientContext localizedStringForKey:@"DONATION_FLOW_TITLE" inBundles:0];
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
    id v5 = objc_alloc_init(MEMORY[0x263F824A8]);
    [v5 setAction:sel__cancelButtonAction_];
    [v5 setTarget:self];
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"DONATION_FLOW_CANCEL_BUTTON"];
    }
    else {
    v7 = +[SUUIClientContext localizedStringForKey:@"DONATION_FLOW_CANCEL_BUTTON" inBundles:0];
    }
    [v5 setTitle:v7];

    v8 = [(SUUIDonationViewController *)self topViewController];
    objc_super v9 = [v8 navigationItem];
    [v9 setLeftBarButtonItem:v5];

    v10 = [MEMORY[0x263F7B0E8] defaultStore];
    v11 = [v10 activeAccount];

    if (v11)
    {
      [(SUUIDonationViewController *)self _loadDonationConfiguration];
    }
    else
    {
      objc_initWeak(&location, self);
      id v12 = objc_alloc(MEMORY[0x263F7B118]);
      v13 = [MEMORY[0x263F7B120] contextForSignIn];
      v14 = (void *)[v12 initWithAuthenticationContext:v13];

      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __45__SUUIDonationViewController_viewWillAppear___block_invoke;
      v16[3] = &unk_265406028;
      objc_copyWeak(&v17, &location);
      [v14 startWithAuthenticateResponseBlock:v16];
      objc_destroyWeak(&v17);

      objc_destroyWeak(&location);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SUUIDonationViewController;
  [(SUUIDonationViewController *)&v15 viewWillAppear:v3];
}

void __45__SUUIDonationViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUUIDonationViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_2654012C8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __45__SUUIDonationViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishAuthenticateWithResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_cancelButtonAction:(id)a3
{
}

- (void)_configurationDidLoadWithResult:(BOOL)a3 error:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  donationConfiguration = self->_donationConfiguration;
  if (self->_charityID)
  {
    id v7 = -[SUUIDonationConfiguration charityForIdentifier:](donationConfiguration, "charityForIdentifier:");
    if (v7)
    {
LABEL_3:
      id v8 = [[SUUIDonationAmountViewController alloc] initWithCharity:v7 configuration:self->_donationConfiguration];
      objc_super v9 = [(SUUIDonationViewController *)self operationQueue];
      [(SUUIDonationStepViewController *)v8 setOperationQueue:v9];

      [(SUUIDonationConfiguration *)self->_donationConfiguration loadLogoForCharity:v7];
      v16[0] = v8;
      id v10 = (void *)MEMORY[0x263EFF8C0];
      id v11 = (SUUIDonationAmountViewController **)v16;
      goto LABEL_10;
    }
  }
  else
  {
    id v12 = [(SUUIDonationConfiguration *)donationConfiguration allCharities];
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
  if (!+[SUUINetworkErrorViewController canDisplayError:v5])
  {
    NSLog(&cfstr_DonationError.isa, v5);
    [(SUUIDonationViewController *)self dismissViewControllerAnimated:1 completion:0];
    goto LABEL_11;
  }
  id v8 = [[SUUINetworkErrorViewController alloc] initWithError:v5];
  [(SUUIDonationAmountViewController *)v8 setClientContext:self->_clientContext];
  objc_super v15 = v8;
  id v10 = (void *)MEMORY[0x263EFF8C0];
  id v11 = &v15;
LABEL_10:
  v13 = [v10 arrayWithObjects:v11 count:1];
  [(SUUIDonationViewController *)self setViewControllers:v13];

LABEL_11:
  placeholderViewController = self->_placeholderViewController;
  self->_placeholderViewController = 0;
}

- (void)_finishAuthenticateWithResponse:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7 && [v7 authenticateResponseType] == 4) {
    [(SUUIDonationViewController *)self _loadDonationConfiguration];
  }
  else {
    [(SUUIDonationViewController *)self _configurationDidLoadWithResult:0 error:v6];
  }
}

- (void)_loadDonationConfiguration
{
  objc_initWeak(&location, self);
  BOOL v3 = [SUUIDonationConfiguration alloc];
  id v4 = [(SUUIDonationViewController *)self operationQueue];
  id v5 = [(SUUIDonationViewController *)self clientContext];
  id v6 = [(SUUIDonationConfiguration *)v3 initWithOperationQueue:v4 clientContext:v5];
  donationConfiguration = self->_donationConfiguration;
  self->_donationConfiguration = v6;

  id v8 = self->_donationConfiguration;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__SUUIDonationViewController__loadDonationConfiguration__block_invoke;
  v9[3] = &unk_265401890;
  objc_copyWeak(&v10, &location);
  [(SUUIDonationConfiguration *)v8 loadConfigurationWithCompletionBlock:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __56__SUUIDonationViewController__loadDonationConfiguration__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SUUIDonationViewController__loadDonationConfiguration__block_invoke_2;
  block[3] = &unk_265403A18;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __56__SUUIDonationViewController__loadDonationConfiguration__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _configurationDidLoadWithResult:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

- (NSString)charityIdentifier
{
  return self->_charityID;
}

- (SUUIClientContext)clientContext
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

@end