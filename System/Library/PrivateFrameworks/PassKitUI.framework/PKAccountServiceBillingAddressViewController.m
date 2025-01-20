@interface PKAccountServiceBillingAddressViewController
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKAccountServiceBillingAddressViewController)initWithBillingAddress:(id)a3 account:(id)a4 accountService:(id)a5 detailViewStyle:(int64_t)a6 handler:(id)a7;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_currentBillingAddressCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_enterNewBillingAddressCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)requiredBillingAddressKeys;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)modalPresentationStyle;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_didSelectChangeAddress;
- (void)addressEditorViewController:(id)a3 selectedContact:(id)a4;
- (void)addressEditorViewControllerDidCancel:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PKAccountServiceBillingAddressViewController

- (PKAccountServiceBillingAddressViewController)initWithBillingAddress:(id)a3 account:(id)a4 accountService:(id)a5 detailViewStyle:(int64_t)a6 handler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PKAccountServiceBillingAddressViewController;
  v17 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v28, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 2);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_currentBillingAddress, a3);
    objc_storeStrong((id *)&v18->_account, a4);
    objc_storeStrong((id *)&v18->_accountService, a5);
    v18->_accountFeatureIdentifier = [(PKAccount *)v18->_account feature];
    v18->_detailViewStyle = a6;
    uint64_t v19 = [v16 copy];
    id handler = v18->_handler;
    v18->_id handler = (id)v19;

    v18->_loadingNewBillingContact = 1;
    objc_initWeak(&location, v18);
    accountService = v18->_accountService;
    v22 = [(PKAccount *)v18->_account accountIdentifier];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __118__PKAccountServiceBillingAddressViewController_initWithBillingAddress_account_accountService_detailViewStyle_handler___block_invoke;
    v24[3] = &unk_1E59DDAB8;
    objc_copyWeak(&v26, &location);
    id v25 = v14;
    [(PKAccountService *)accountService userInfoForAccountIdentifier:v22 forceFetch:1 completion:v24];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v18;
}

void __118__PKAccountServiceBillingAddressViewController_initWithBillingAddress_account_accountService_detailViewStyle_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __118__PKAccountServiceBillingAddressViewController_initWithBillingAddress_account_accountService_detailViewStyle_handler___block_invoke_2;
  v9[3] = &unk_1E59CE888;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __118__PKAccountServiceBillingAddressViewController_initWithBillingAddress_account_accountService_detailViewStyle_handler___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    v4 = WeakRetained;
    v3 = [*(id *)(a1 + 40) creditPrimaryUser];
    if (v3 && !*(void *)(a1 + 48))
    {
      objc_storeStrong(v4 + 136, v3);
      (*((void (**)(void))v4[141] + 2))();
    }
    *((unsigned char *)v4 + 1136) = 0;
    [v4 reloadSection:0];

    WeakRetained = v4;
  }
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PKAccountServiceBillingAddressViewController;
  [(PKSectionTableViewController *)&v6 viewDidLoad];
  v3 = [(PKAccountServiceBillingAddressViewController *)self tableView];
  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  v4 = [(PKAccountServiceBillingAddressViewController *)self navigationItem];
  id v5 = PKLocalizedFeatureString();
  [v4 setTitle:v5];
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  return a3 < 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]);
  if (v8 == 1)
  {
    uint64_t v9 = -[PKAccountServiceBillingAddressViewController _enterNewBillingAddressCellForRowIndex:tableView:](self, "_enterNewBillingAddressCellForRowIndex:tableView:", [v7 row], v6);
    goto LABEL_5;
  }
  if (!v8)
  {
    uint64_t v9 = -[PKAccountServiceBillingAddressViewController _currentBillingAddressCellForRowIndex:tableView:](self, "_currentBillingAddressCellForRowIndex:tableView:", [v7 row], v6);
LABEL_5:
    id v10 = (void *)v9;
    goto LABEL_7;
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5 = a3;
  if ((unint64_t)a4 > 1)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = PKLocalizedFeatureString();
  }

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (unint64_t)a4 < 2;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  [a3 rowHeight];
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if ((unint64_t)a4 <= 2) {
    [a3 sectionHeaderHeight];
  }
  return result;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section", a3)) == 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v6 section]) == 1) {
    [(PKAccountServiceBillingAddressViewController *)self _didSelectChangeAddress];
  }
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v8 section])
    || self->_loadingNewBillingContact)
  {
    int v9 = 0;
    id v10 = 0;
  }
  else
  {
    id v14 = [v7 cellForRowAtIndexPath:v8];
    id v15 = [v14 textLabel];
    id v10 = [v15 text];

    int v9 = 1;
  }
  if ([v10 length])
  {
    if (v9)
    {
LABEL_6:
      id v11 = (void *)MEMORY[0x1E4FB1678];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __106__PKAccountServiceBillingAddressViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
      v16[3] = &unk_1E59D5228;
      id v17 = v10;
      id v12 = [v11 configurationWithIdentifier:0 previewProvider:0 actionProvider:v16];

      goto LABEL_9;
    }
  }
  else
  {

    id v10 = 0;
    if (v9) {
      goto LABEL_6;
    }
  }
  id v12 = 0;
LABEL_9:

  return v12;
}

id __106__PKAccountServiceBillingAddressViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*(void *)(a1 + 32)) {
    goto LABEL_4;
  }
  v4 = (void *)MEMORY[0x1E4FB13F0];
  id v5 = PKLocalizedString(&cfstr_MenuActionCopy.isa);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __106__PKAccountServiceBillingAddressViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v11[3] = &unk_1E59D5200;
  id v12 = *(id *)(a1 + 32);
  id v6 = [v4 actionWithTitle:v5 image:0 identifier:0 handler:v11];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4FB1970];
    v13[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    int v9 = [v7 menuWithTitle:&stru_1EF1B5B50 children:v8];
  }
  else
  {
LABEL_4:
    int v9 = 0;
  }

  return v9;
}

void __106__PKAccountServiceBillingAddressViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v2 setString:*(void *)(a1 + 32)];
}

- (void)addressEditorViewController:(id)a3 selectedContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKAccountServiceBillingAddressViewController *)self navigationController];
  [v8 dismissViewControllerAnimated:1 completion:0];

  self->_loadingNewBillingContact = 1;
  int v9 = self->_currentBillingAddress;
  currentBillingAddress = self->_currentBillingAddress;
  self->_currentBillingAddress = 0;

  [(PKSectionTableViewController *)self reloadSection:0];
  objc_initWeak(&location, self);
  accountService = self->_accountService;
  id v12 = [(PKAccount *)self->_account accountIdentifier];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__PKAccountServiceBillingAddressViewController_addressEditorViewController_selectedContact___block_invoke;
  v14[3] = &unk_1E59DDAE0;
  objc_copyWeak(&v16, &location);
  id v13 = v9;
  id v15 = v13;
  [(PKAccountService *)accountService updateUserInfoForAccountIdentifier:v12 contact:v7 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __92__PKAccountServiceBillingAddressViewController_addressEditorViewController_selectedContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __92__PKAccountServiceBillingAddressViewController_addressEditorViewController_selectedContact___block_invoke_2;
    v9[3] = &unk_1E59CB8B0;
    void v9[4] = WeakRetained;
    id v10 = v5;
    id v11 = v6;
    id v12 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

uint64_t __92__PKAccountServiceBillingAddressViewController_addressEditorViewController_selectedContact___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1136) = 0;
  id v2 = *(void **)(a1 + 40);
  if (v2 && !*(void *)(a1 + 48))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = v2;
    id v3 = *(void **)(v5 + 1088);
    *(void *)(v5 + 1088) = v6;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1088), *(id *)(a1 + 56));
    id v3 = +[PKAccountFlowController displayableErrorForError:*(void *)(a1 + 48) featureIdentifier:*(void *)(*(void *)(a1 + 32) + 1112) genericErrorTitle:0 genericErrorMessage:0];
    id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
    [*(id *)(a1 + 32) presentViewController:v4 animated:1 completion:0];
  }
  [*(id *)(a1 + 32) reloadSection:0];
  id v7 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 1128) + 16);

  return v7();
}

- (void)addressEditorViewControllerDidCancel:(id)a3
{
  id v3 = [(PKAccountServiceBillingAddressViewController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_didSelectChangeAddress
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    -[PKAccountServiceBillingAddressViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:");
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1BA58]);
    id v4 = [(PKAccount *)self->_account creditDetails];
    uint64_t v5 = [v4 countryCode];
    [v3 setISOCountryCode:v5];

    id v6 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    id v7 = (void *)MEMORY[0x1E4F1BA20];
    uint64_t v8 = *MEMORY[0x1E4F1B6F8];
    int v9 = (void *)[v3 copy];
    id v10 = [v7 labeledValueWithLabel:v8 value:v9];

    v21[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v6 setPostalAddresses:v11];

    id v12 = [PKAddressEditorViewController alloc];
    id v13 = (void *)[v6 copy];
    id v14 = [(PKAccountServiceBillingAddressViewController *)self requiredBillingAddressKeys];
    id v15 = [(PKAddressEditorViewController *)v12 initWithContact:v13 requiredKeys:v14 highlightedKeys:MEMORY[0x1E4F1CBF0] errors:MEMORY[0x1E4F1CBF0] style:1];

    [(PKAddressEditorViewController *)v15 setDelegate:self];
    [(PKAddressEditorViewController *)v15 setCountryIsEditable:0];
    [(PKAddressEditorViewController *)v15 setModalPresentationStyle:[(PKAccountServiceBillingAddressViewController *)self modalPresentationStyle]];
    id v16 = [(PKAddressEditorViewController *)v15 view];
    id v17 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v16 setBackgroundColor:v17];

    v18 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v15];
    uint64_t v19 = [(PKAccountServiceBillingAddressViewController *)self navigationController];
    [v19 presentViewController:v18 animated:1 completion:0];
  }
}

- (id)_currentBillingAddressCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  uint64_t v5 = [a4 dequeueReusableCellWithIdentifier:@"PKCreditAccountBillingAddressCurrentAddress"];
  if (!v5) {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"PKCreditAccountBillingAddressCurrentAddress"];
  }
  if (self->_loadingNewBillingContact)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v6 startAnimating];
    [v5 setEditingAccessoryView:v6];
    [v5 setAccessoryView:v6];
  }
  else
  {
    [v5 setEditingAccessoryView:0];
    [v5 setAccessoryView:0];
    id v6 = [v5 textLabel];
    id v7 = [(CNContact *)self->_currentBillingAddress pkFormattedContactAddressWithoutName];
    [v6 setText:v7];

    [v6 setNumberOfLines:0];
  }

  return v5;
}

- (id)_enterNewBillingAddressCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v4 = [a4 dequeueReusableCellWithIdentifier:@"PKCreditAccountBillingAddressUpdateAddress"];
  if (!v4)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"PKCreditAccountBillingAddressUpdateAddress"];
    uint64_t v5 = [v4 textLabel];
    id v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v5 setTextColor:v6];
  }
  id v7 = [v4 textLabel];
  uint64_t v8 = PKLocalizedFeatureString();
  [v7 setText:v8];

  return v4;
}

- (id)requiredBillingAddressKeys
{
  v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1B798];
  v6[0] = *MEMORY[0x1E4F1B7C8];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1B7B0];
  v6[2] = *MEMORY[0x1E4F1B7C0];
  v6[3] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];

  return v4;
}

- (int64_t)modalPresentationStyle
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    return 16;
  }
  else
  {
    return 5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountService, 0);

  objc_storeStrong((id *)&self->_currentBillingAddress, 0);
}

@end