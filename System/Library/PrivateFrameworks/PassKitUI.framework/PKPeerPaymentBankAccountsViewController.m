@interface PKPeerPaymentBankAccountsViewController
- (BOOL)shouldMapSection:(unint64_t)a3;
- (PKPeerPaymentBankAccountsViewController)initWithPeerPaymentAccount:(id)a3 detailViewStyle:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_doneButtonPressed:(id)a3;
- (void)bankAccountInformationViewControllerChangedBankAccountInformation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPeerPaymentBankAccountsViewController

- (PKPeerPaymentBankAccountsViewController)initWithPeerPaymentAccount:(id)a3 detailViewStyle:(int64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentBankAccountsViewController;
  v8 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v14, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 1);
  if (v8)
  {
    v9 = (PKBankAccountInformation *)objc_alloc_init(MEMORY[0x1E4F84550]);
    bankInformation = v8->_bankInformation;
    v8->_bankInformation = v9;

    objc_storeStrong((id *)&v8->_account, a3);
    v8->_detailViewStyle = a4;
    v11 = [(PKPeerPaymentBankAccountsViewController *)v8 navigationItem];
    objc_msgSend(v11, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v11, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v12 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_2.isa);
    [v11 setTitle:v12];
  }
  return v8;
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentBankAccountsViewController;
  [(PKPeerPaymentBankAccountsViewController *)&v5 viewWillLayoutSubviews];
  v3 = [(PKPeerPaymentBankAccountsViewController *)self tableView];
  v4 = [(PKPeerPaymentBankAccountsViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  return 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKPeerPaymentBankAccountsViewController *)self view];
  [v3 setNeedsLayout];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  bankInformation = self->_bankInformation;
  id v6 = a3;
  if ([(PKBankAccountInformation *)bankInformation isValid])
  {
    id v7 = [v6 dequeueReusableCellWithIdentifier:@"PKPeerPaymentBankAccountsViewControllerBankAccountCellReuseIdentifier"];

    if (!v7) {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"PKPeerPaymentBankAccountsViewControllerBankAccountCellReuseIdentifier"];
    }
    v8 = [v7 textLabel];
    v9 = [(PKBankAccountInformation *)self->_bankInformation bankName];
    [v8 setText:v9];

    v10 = [v7 detailTextLabel];
    v11 = [(PKBankAccountInformation *)self->_bankInformation maskedAccountNumber];
    [v10 setText:v11];

    v12 = [v7 detailTextLabel];
    v13 = [MEMORY[0x1E4FB1618] lightGrayColor];
    [v12 setTextColor:v13];

    [v7 setAccessoryType:1];
  }
  else
  {
    id v7 = [v6 dequeueReusableCellWithIdentifier:@"PKPeerPaymentBankAccountsViewControllerAddBankAccountCellReuseIdentifier"];

    if (!v7)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"PKPeerPaymentBankAccountsViewControllerAddBankAccountCellReuseIdentifier"];
      objc_super v14 = [v7 textLabel];
      v15 = [MEMORY[0x1E4FB1618] systemBlueColor];
      [v14 setTextColor:v15];
    }
    v16 = [v7 textLabel];
    v17 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_3.isa);
    [v16 setText:v17];

    v18 = [v7 detailTextLabel];
    [v18 setText:0];

    if (self->_detailViewStyle == 2)
    {
      v19 = [v7 textLabel];
      v20 = PKBridgeAppearanceGetAppearanceSpecifier();
      v21 = [v20 buttonTextColor];
      [v19 setTextColor:v21];
    }
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  [a3 deselectRowAtIndexPath:a4 animated:1];
  if (!PKBankCredentialCenterEnabled()) {
    goto LABEL_3;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPeerPaymentBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  aBlock[3] = &unk_1E59DADB8;
  aBlock[4] = self;
  objc_super v5 = _Block_copy(aBlock);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__PKPeerPaymentBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v14[3] = &unk_1E59CA7D0;
  v14[4] = self;
  id v6 = _Block_copy(v14);
  id v7 = [[PKACHBankCredentialPickerViewController alloc] initWithCurrentBankInformation:self->_bankInformation selectAction:v5 cancelAction:v6];

  if (!v7)
  {
LABEL_3:
    v8 = [PKAddBankAccountInformationViewController alloc];
    bankInformation = self->_bankInformation;
    v10 = [(PKPeerPaymentAccount *)self->_account countryCode];
    v11 = [(PKAddBankAccountInformationViewController *)v8 initWithDelegate:self bankInformation:bankInformation accountCountryCode:v10];

    id v7 = [[PKNavigationController alloc] initWithRootViewController:v11];
    [(PKACHBankCredentialPickerViewController *)v7 setSupportedInterfaceOrientations:2];
  }
  if (PKIsPad())
  {
    uint64_t v12 = 2;
LABEL_8:
    [(PKACHBankCredentialPickerViewController *)v7 setModalPresentationStyle:v12];
    goto LABEL_9;
  }
  if (PKIsVision())
  {
    uint64_t v12 = 1;
    goto LABEL_8;
  }
LABEL_9:
  v13 = [(PKPeerPaymentBankAccountsViewController *)self navigationController];
  [v13 presentViewController:v7 animated:1 completion:0];
}

void __77__PKPeerPaymentBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 1088);
  id v4 = a2;
  objc_super v5 = [v4 routingNumber];
  [v3 setRoutingNumber:v5];

  id v6 = *(void **)(*(void *)(a1 + 32) + 1088);
  id v7 = [v4 accountNumber];
  [v6 setAccountNumber:v7];

  v8 = *(void **)(*(void *)(a1 + 32) + 1088);
  v9 = [v4 bankName];
  [v8 setBankName:v9];

  v10 = *(void **)(*(void *)(a1 + 32) + 1088);
  v11 = [v4 identifier];

  [v10 setIdentifier:v11];
  uint64_t v12 = [*(id *)(a1 + 32) tableView];
  [v12 reloadData];

  id v13 = [*(id *)(a1 + 32) navigationController];
  [v13 dismissViewControllerAnimated:1 completion:0];
}

void __77__PKPeerPaymentBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) navigationController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (void)bankAccountInformationViewControllerChangedBankAccountInformation:(id)a3
{
  id v3 = [(PKPeerPaymentBankAccountsViewController *)self tableView];
  [v3 reloadData];
}

- (void)_doneButtonPressed:(id)a3
{
  id v4 = [(PKPeerPaymentBankAccountsViewController *)self presentingViewController];

  if (v4) {
    [(PKPeerPaymentBankAccountsViewController *)self presentingViewController];
  }
  else {
  id v5 = [(PKPeerPaymentBankAccountsViewController *)self navigationController];
  }
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_bankInformation, 0);
}

@end