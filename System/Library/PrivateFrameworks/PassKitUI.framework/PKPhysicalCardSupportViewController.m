@interface PKPhysicalCardSupportViewController
- (PKPhysicalCardSupportViewController)initWithAccountService:(id)a3 account:(id)a4 accountUser:(id)a5 paymentPass:(id)a6 physicalCard:(id)a7;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)contactIssuerHelper;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_nextButtonTapped:(id)a3;
- (void)_presentBusinessChatWithContext:(id)a3;
- (void)_presentCallSupport;
- (void)_presentManualActivation;
- (void)contactIssuerHelper:(id)a3 didRequestDismissViewControllerAnimated:(BOOL)a4 completion:(id)a5;
- (void)contactIssuerHelper:(id)a3 didRequestPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)scrollViewDidScroll:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPhysicalCardSupportViewController

- (PKPhysicalCardSupportViewController)initWithAccountService:(id)a3 account:(id)a4 accountUser:(id)a5 paymentPass:(id)a6 physicalCard:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v25 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PKPhysicalCardSupportViewController;
  v17 = [(PKPhysicalCardSupportViewController *)&v26 initWithStyle:1];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_accountService, a3);
    objc_storeStrong((id *)&v18->_account, a4);
    objc_storeStrong((id *)&v18->_accountUser, a5);
    objc_storeStrong((id *)&v18->_paymentPass, a6);
    objc_storeStrong((id *)&v18->_physicalCard, a7);
    v19 = [(PKPhysicalCardSupportViewController *)v18 navigationItem];
    objc_msgSend(v19, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v19, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    id v20 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v21 = PKLocalizedPaymentString(&cfstr_Next.isa);
    uint64_t v22 = [v20 initWithTitle:v21 style:0 target:v18 action:sel__nextButtonTapped_];
    nextButton = v18->_nextButton;
    v18->_nextButton = (UIBarButtonItem *)v22;

    [(UIBarButtonItem *)v18->_nextButton setEnabled:0];
    [v19 setRightBarButtonItem:v18->_nextButton];
  }
  return v18;
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)PKPhysicalCardSupportViewController;
  [(PKPhysicalCardSupportViewController *)&v18 viewDidLoad];
  [(PKAccount *)self->_account feature];
  v3 = PKLocalizedFeatureString();
  v4 = PKLocalizedFeatureString();
  v5 = [PKTableHeaderView alloc];
  v6 = -[PKTableHeaderView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableHeaderView = self->_tableHeaderView;
  self->_tableHeaderView = v6;

  v8 = [(PKTableHeaderView *)self->_tableHeaderView titleLabel];
  [v8 setText:v3];

  v9 = [(PKTableHeaderView *)self->_tableHeaderView subtitleLabel];
  [v9 setText:v4];

  [(PKTableHeaderView *)self->_tableHeaderView setTopPadding:5.0];
  v10 = self->_tableHeaderView;
  v11 = [(PKPhysicalCardSupportViewController *)self tableView];
  [v11 bounds];
  -[PKTableHeaderView sizeThatFits:](v10, "sizeThatFits:", CGRectGetWidth(v19), 3.40282347e38);
  double v13 = v12;
  double v15 = v14;

  -[PKTableHeaderView setFrame:](self->_tableHeaderView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v13, v15);
  id v16 = [(PKPhysicalCardSupportViewController *)self tableView];
  [v16 registerClass:objc_opt_class() forCellReuseIdentifier:@"PhysicalCardSupportReuseIdentifier"];
  [v16 setTableHeaderView:self->_tableHeaderView];
  v17 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [v16 setBackgroundColor:v17];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKPhysicalCardSupportViewController;
  [(PKPhysicalCardSupportViewController *)&v5 viewWillLayoutSubviews];
  v3 = [(PKPhysicalCardSupportViewController *)self tableView];
  v4 = [(PKPhysicalCardSupportViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKPhysicalCardSupportViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a3;
  if (self->_hasSelectedReason)
  {
    v6 = (void *)MEMORY[0x1E4F28D58];
    int64_t selectedReason = self->_selectedReason;
    id v8 = a4;
    v9 = [v6 indexPathForRow:selectedReason inSection:0];
    v10 = [v14 cellForRowAtIndexPath:v9];
    [v10 setAccessoryType:0];
  }
  else
  {
    nextButton = self->_nextButton;
    id v12 = a4;
    [(UIBarButtonItem *)nextButton setEnabled:1];
  }
  self->_hasSelectedReason = 1;
  self->_int64_t selectedReason = [a4 row];
  double v13 = [v14 cellForRowAtIndexPath:a4];
  [v13 setAccessoryType:3];
  [v14 deselectRowAtIndexPath:a4 animated:1];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)PKLocalizedPaymentString(&cfstr_TransactionDet_22.isa);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"PhysicalCardSupportReuseIdentifier" forIndexPath:v6];
  unint64_t v8 = [v6 row];

  if (v8 > 2)
  {
    v9 = 0;
  }
  else
  {
    [(PKAccount *)self->_account feature];
    v9 = PKLocalizedFeatureString();
  }
  if (self->_hasSelectedReason)
  {
    if (v8 == self->_selectedReason) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  [v7 setAccessoryType:v10];
  v11 = [v7 textLabel];
  [v11 setText:v9];

  objc_msgSend(v7, "setSeparatorInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

  return v7;
}

- (void)contactIssuerHelper:(id)a3 didRequestPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
}

- (void)contactIssuerHelper:(id)a3 didRequestDismissViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
}

- (void)_nextButtonTapped:(id)a3
{
  id v4 = a3;
  if (self->_hasSelectedReason)
  {
    int64_t selectedReason = self->_selectedReason;
    if (selectedReason == 2)
    {
      id v10 = v4;
      if (+[PKBusinessChatController deviceSupportsBusinessChat])
      {
        id v6 = [PKBusinessChatPhysicalCardContext alloc];
        paymentPass = self->_paymentPass;
        uint64_t v8 = 7;
        goto LABEL_10;
      }
    }
    else
    {
      if (selectedReason != 1)
      {
        if (selectedReason) {
          goto LABEL_13;
        }
        id v10 = v4;
        [(PKPhysicalCardSupportViewController *)self _presentManualActivation];
        goto LABEL_12;
      }
      id v10 = v4;
      if (+[PKBusinessChatController deviceSupportsBusinessChat])
      {
        id v6 = [PKBusinessChatPhysicalCardContext alloc];
        paymentPass = self->_paymentPass;
        uint64_t v8 = 5;
LABEL_10:
        v9 = [(PKBusinessChatPhysicalCardContext *)v6 initWithPaymentPass:paymentPass intent:v8];
        [(PKPhysicalCardSupportViewController *)self _presentBusinessChatWithContext:v9];

LABEL_12:
        id v4 = v10;
        goto LABEL_13;
      }
    }
    [(PKPhysicalCardSupportViewController *)self _presentCallSupport];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_presentBusinessChatWithContext:(id)a3
{
  id v4 = a3;
  businessChatController = self->_businessChatController;
  if (!businessChatController)
  {
    id v6 = objc_alloc_init(PKBusinessChatController);
    v7 = self->_businessChatController;
    self->_businessChatController = v6;

    businessChatController = self->_businessChatController;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__PKPhysicalCardSupportViewController__presentBusinessChatWithContext___block_invoke;
  v8[3] = &unk_1E59CD658;
  v8[4] = self;
  [(PKBusinessChatController *)businessChatController openBusinessChatWithContext:v4 completion:v8];
}

void __71__PKPhysicalCardSupportViewController__presentBusinessChatWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PKPhysicalCardSupportViewController__presentBusinessChatWithContext___block_invoke_2;
  v6[3] = &unk_1E59CA870;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __71__PKPhysicalCardSupportViewController__presentBusinessChatWithContext___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = PKAlertForDisplayableErrorWithHandlers(v2, 0, 0, 0);
    [*(id *)(a1 + 40) presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    id v3 = *(void **)(a1 + 40);
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_presentManualActivation
{
  id v4 = [[PKPhysicalCardManualActivationViewController alloc] initWithAccountService:self->_accountService account:self->_account accountUser:self->_accountUser paymentPass:self->_paymentPass physicalCard:self->_physicalCard activationCode:0];
  id v3 = [(PKPhysicalCardSupportViewController *)self navigationController];
  [v3 pushViewController:v4 animated:1];
}

- (void)_presentCallSupport
{
  id v2 = [(PKPhysicalCardSupportViewController *)self contactIssuerHelper];
  [v2 presentContactViewController:1];
}

- (id)contactIssuerHelper
{
  contactIssuerHelper = self->_contactIssuerHelper;
  if (!contactIssuerHelper)
  {
    id v4 = objc_alloc_init(PKSecureElementPassContactIssuerHelper);
    id v5 = self->_contactIssuerHelper;
    self->_contactIssuerHelper = v4;

    [(PKSecureElementPassContactIssuerHelper *)self->_contactIssuerHelper setDelegate:self];
    [(PKSecureElementPassContactIssuerHelper *)self->_contactIssuerHelper setPass:self->_paymentPass];
    [(PKSecureElementPassContactIssuerHelper *)self->_contactIssuerHelper setFeatureIdentifier:2];
    contactIssuerHelper = self->_contactIssuerHelper;
  }

  return contactIssuerHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIssuerHelper, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_physicalCard, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_accountService, 0);
}

@end