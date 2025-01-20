@interface PKPeerPaymentTurnOnAssociatedAccountViewController
- (PKPeerPaymentAssociatedAccountSetupDelegate)delegate;
- (PKPeerPaymentTurnOnAssociatedAccountViewController)initWithFamilyMember:(id)a3 familyCollection:(id)a4 delegate:(id)a5 passLibraryDataProvider:(id)a6 context:(int64_t)a7 setupType:(int64_t)a8;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentTurnOnAssociatedAccountViewController

- (PKPeerPaymentTurnOnAssociatedAccountViewController)initWithFamilyMember:(id)a3 familyCollection:(id)a4 delegate:(id)a5 passLibraryDataProvider:(id)a6 context:(int64_t)a7 setupType:(int64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PKPeerPaymentTurnOnAssociatedAccountViewController;
  v19 = [(PKPeerPaymentTurnOnAssociatedAccountViewController *)&v23 initWithStyle:1];
  v20 = v19;
  if (v19)
  {
    v19->_setupType = a8;
    objc_storeStrong((id *)&v19->_familyMember, a3);
    objc_storeStrong((id *)&v20->_familyCollection, a4);
    objc_storeWeak((id *)&v20->_delegate, v17);
    v20->_context = a7;
    objc_storeStrong((id *)&v20->_passLibraryDataProvider, a6);
    if (v20->_context == 3) {
      PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentFam.isa);
    }
    else {
    v21 = [(PKFamilyMember *)v20->_familyMember labelName];
    }
    [(PKPeerPaymentTurnOnAssociatedAccountViewController *)v20 setTitle:v21];
  }
  return v20;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentTurnOnAssociatedAccountViewController;
  [(PKPeerPaymentTurnOnAssociatedAccountViewController *)&v4 viewDidLoad];
  v3 = [(PKPeerPaymentTurnOnAssociatedAccountViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"CellReuseIdentifier"];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentFam_0.isa);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  objc_super v4 = [(PKFamilyMember *)self->_familyMember firstName];
  v5 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentTur_2.isa, &stru_1EF1B4C70.isa, v4);

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  objc_super v4 = [a3 dequeueReusableCellWithIdentifier:@"CellReuseIdentifier" forIndexPath:a4];
  v5 = [v4 textLabel];
  v6 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentTur_3.isa);
  [v5 setText:v6];

  v7 = [v4 textLabel];
  v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v7 setTextColor:v8];

  [v4 setAccessibilityIdentifier:*MEMORY[0x1E4F859C8]];

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  [a3 deselectRowAtIndexPath:a4 animated:1];
  v5 = [(PKFamilyMemberCollection *)self->_familyCollection currentUser];
  char v6 = [v5 isOrganizer];

  if (v6)
  {
    v7 = [PKPeerPaymentAddAssociatedAccountViewController alloc];
    familyMember = self->_familyMember;
    familyCollection = self->_familyCollection;
    v10 = [MEMORY[0x1E4F84E10] sharedService];
    passLibraryDataProvider = self->_passLibraryDataProvider;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v20 = [(PKPeerPaymentAddAssociatedAccountViewController *)v7 initWithFamilyMember:familyMember familyCollection:familyCollection webService:v10 passLibraryDataProvider:passLibraryDataProvider delegate:WeakRetained context:self->_context setupType:self->_setupType];

    v13 = [[PKNavigationController alloc] initWithRootViewController:v20];
    [(PKNavigationController *)v13 setModalInPresentation:1];
    [(PKPeerPaymentTurnOnAssociatedAccountViewController *)self presentViewController:v13 animated:1 completion:0];
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4FB1418];
    id v15 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentCan.isa);
    id v16 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentCan_0.isa);
    v20 = [v14 alertControllerWithTitle:v15 message:v16 preferredStyle:1];

    id v17 = (void *)MEMORY[0x1E4FB1410];
    id v18 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
    v19 = [v17 actionWithTitle:v18 style:0 handler:0];
    [(PKPeerPaymentAddAssociatedAccountViewController *)v20 addAction:v19];

    [(PKPeerPaymentTurnOnAssociatedAccountViewController *)self presentViewController:v20 animated:1 completion:0];
  }
}

- (PKPeerPaymentAssociatedAccountSetupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPeerPaymentAssociatedAccountSetupDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);

  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end