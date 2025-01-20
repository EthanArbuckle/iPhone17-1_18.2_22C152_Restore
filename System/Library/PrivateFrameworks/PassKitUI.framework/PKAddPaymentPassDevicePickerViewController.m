@interface PKAddPaymentPassDevicePickerViewController
- (PKAddPaymentPassDevicePickerDelegate)delegate;
- (PKAddPaymentPassDevicePickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PKAddPaymentPassDevicePickerViewController)initWithPaymentWebServices:(id)a3 configuration:(id)a4 reporter:(id)a5;
- (PKAddPaymentPassDevicePickerViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)loadView;
- (void)reloadContentFromWebServices;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAddPaymentPassDevicePickerViewController

- (PKAddPaymentPassDevicePickerViewController)initWithStyle:(int64_t)a3
{
  return [(PKAddPaymentPassDevicePickerViewController *)self initWithPaymentWebServices:0 configuration:0 reporter:0];
}

- (PKAddPaymentPassDevicePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(PKAddPaymentPassDevicePickerViewController *)self initWithPaymentWebServices:0 configuration:0 reporter:0];
}

- (PKAddPaymentPassDevicePickerViewController)initWithPaymentWebServices:(id)a3 configuration:(id)a4 reporter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKAddPaymentPassDevicePickerViewController;
  v11 = [(PKAddPaymentPassDevicePickerViewController *)&v16 initWithStyle:1];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    webServices = v11->_webServices;
    v11->_webServices = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_configuration, a4);
    objc_storeStrong((id *)&v11->_reporter, a5);
    v14 = [(PKAddPaymentPassDevicePickerViewController *)v11 navigationItem];
    objc_msgSend(v14, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v14, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  }
  return v11;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKAddPaymentPassDevicePickerViewController;
  [(PKAddPaymentPassDevicePickerViewController *)&v2 dealloc];
}

- (void)reloadContentFromWebServices
{
  id v2 = [(PKAddPaymentPassDevicePickerViewController *)self tableView];
  [v2 reloadData];
}

- (void)loadView
{
  v20.receiver = self;
  v20.super_class = (Class)PKAddPaymentPassDevicePickerViewController;
  [(PKAddPaymentPassDevicePickerViewController *)&v20 loadView];
  v3 = [(PKAddPaymentPassDevicePickerViewController *)self tableView];
  [v3 setOpaque:1];
  v4 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v4];

  v5 = [PKTableHeaderView alloc];
  v6 = -[PKTableHeaderView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  headerView = self->_headerView;
  self->_headerView = v6;

  [v3 setTableHeaderView:self->_headerView];
  id v8 = [(PKAddPaymentPassRequestConfiguration *)self->_configuration paymentNetwork];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F87A08]];

  id v10 = [(PKAddPaymentPassRequestConfiguration *)self->_configuration localizedDescription];
  if ([v10 length])
  {
    uint64_t v11 = PKLocalizedPaymentString(&cfstr_IssuerAddPicke.isa, &stru_1EF1B4C70.isa, v10);
  }
  else
  {
    if (v9) {
      PKLocalizedAquamanString(&cfstr_IssuerAddAccou_2.isa);
    }
    else {
    uint64_t v11 = PKLocalizedPaymentString(&cfstr_IssuerAddPicke_0.isa);
    }
  }
  uint64_t v12 = (void *)v11;
  v13 = [(PKAddPaymentPassRequestConfiguration *)self->_configuration paymentNetwork];
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F87A10]];

  if (v14) {
    goto LABEL_11;
  }
  if (!v9)
  {
    if ([(PKAddPaymentPassRequestConfiguration *)self->_configuration style] != PKAddPaymentPassStyleAccess)
    {
      objc_super v16 = @"ISSUER_ADD_CARD";
      goto LABEL_12;
    }
LABEL_11:
    objc_super v16 = @"ISSUER_ADD_CARD_WALLET";
LABEL_12:
    uint64_t v15 = PKLocalizedPaymentString(&v16->isa);
    goto LABEL_13;
  }
  uint64_t v15 = PKLocalizedAquamanString(&cfstr_IssuerAddAccou.isa);
LABEL_13:
  v17 = (void *)v15;
  v18 = [(PKTableHeaderView *)self->_headerView titleLabel];
  [v18 setText:v17];

  v19 = [(PKTableHeaderView *)self->_headerView subtitleLabel];
  [v19 setText:v12];

  [(PKTableHeaderView *)self->_headerView setNeedsLayout];
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PKAddPaymentPassDevicePickerViewController;
  [(PKAddPaymentPassDevicePickerViewController *)&v15 viewWillLayoutSubviews];
  v3 = [(PKAddPaymentPassDevicePickerViewController *)self tableView];
  [v3 bounds];
  double v5 = v4;
  [(PKTableHeaderView *)self->_headerView frame];
  double v7 = v6;
  double v9 = v8;
  -[PKTableHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v5, 1.79769313e308);
  if (v7 != v11 || v9 != v10)
  {
    headerView = self->_headerView;
    [v3 _rectForTableHeaderView];
    -[PKTableHeaderView setFrame:](headerView, "setFrame:");
    [v3 setTableHeaderView:0];
    [v3 setTableHeaderView:self->_headerView];
  }
  int v14 = [(PKAddPaymentPassDevicePickerViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v14);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAddPaymentPassDevicePickerViewController;
  [(PKAddPaymentPassDevicePickerViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  else {
    return [(NSArray *)self->_webServices count];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"Cell"];
  if (!v7)
  {
    double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"Cell"];
    [v7 setSelectionStyle:3];
  }
  double v8 = -[NSArray objectAtIndexedSubscript:](self->_webServices, "objectAtIndexedSubscript:", [v6 row]);
  double v9 = [v7 textLabel];
  double v10 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:19.0];
  [v9 setFont:v10];

  double v11 = [v8 targetDevice];
  uint64_t v12 = [v11 deviceDescriptionForPaymentWebService:v8];
  [v9 setText:v12];

  v13 = PKProvisioningBackgroundColor();
  [v7 setBackgroundColor:v13];

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if ([(PKAddPaymentPassRequestConfiguration *)self->_configuration style] == PKAddPaymentPassStyleAccess
    || ([(PKAddPaymentPassRequestConfiguration *)self->_configuration paymentNetwork],
        double v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:*MEMORY[0x1E4F87A10]],
        v5,
        v6))
  {
    double v7 = PKLocalizedPaymentString(&cfstr_IssuerAddPicke_1.isa);
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKAddPaymentPassDevicePickerViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a4;
  [a3 deselectRowAtIndexPath:v14 animated:1];
  int v6 = -[NSArray objectAtIndexedSubscript:](self->_webServices, "objectAtIndexedSubscript:", [v14 row]);
  double v7 = [v6 targetDevice];

  [v7 currentPassbookState];
  if (PKPassbookIsCurrentlyDeletedByUser())
  {
    double v8 = [v7 deviceName];
    char v9 = [v8 isEqualToString:@"Apple Watch"];

    if (v9) {
      double v10 = PKCreateAlertControllerForWatchWalletUninstalled(0);
    }
    else {
      double v10 = PKCreateAlertControllerForWalletUninstalled(0);
    }
    v13 = v10;
    [(PKAddPaymentPassDevicePickerViewController *)self presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v12 = -[NSArray objectAtIndexedSubscript:](self->_webServices, "objectAtIndexedSubscript:", [v14 row]);
    [WeakRetained pickerViewController:self didPickWebService:v12];

    [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  }
}

- (PKAddPaymentPassDevicePickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAddPaymentPassDevicePickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_webServices, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end