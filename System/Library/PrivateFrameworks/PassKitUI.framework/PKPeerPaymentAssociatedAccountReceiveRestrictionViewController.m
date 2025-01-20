@interface PKPeerPaymentAssociatedAccountReceiveRestrictionViewController
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (PKPeerPaymentAssociatedAccountReceiveRestrictionViewController)initWithPeerPaymentSetupFlowController:(id)a3;
- (id)_textLabelStringForIndexPath:(id)a3;
- (id)_updatedPreferences;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_continue;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPeerPaymentAssociatedAccountReceiveRestrictionViewController

- (PKPeerPaymentAssociatedAccountReceiveRestrictionViewController)initWithPeerPaymentSetupFlowController:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentAssociatedAccountReceiveRestrictionViewController;
  v6 = -[PKPaymentSetupTableViewController initWithContext:](&v21, sel_initWithContext_, [v5 context]);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    v8 = [v5 configuration];
    uint64_t v9 = [v8 peerPaymentSetupConfigurationType];

    if (v9 == 1)
    {
      uint64_t v10 = [v5 configuration];
      configuration = v7->_configuration;
      v7->_configuration = (PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *)v10;

      v12 = [(PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *)v7->_configuration associatedAccountSetupDelegate];
      objc_storeWeak((id *)&v7->_delegate, v12);

      uint64_t v13 = [(PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *)v7->_configuration familyMember];
      familyMember = v7->_familyMember;
      v7->_familyMember = (PKFamilyMember *)v13;

      uint64_t v15 = [(PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *)v7->_configuration updatedPreferences];
      currentPreferences = v7->_currentPreferences;
      v7->_currentPreferences = (PKPeerPaymentPreferences *)v15;

      BOOL v17 = (unint64_t)[(PKFamilyMember *)v7->_familyMember age] < 0xD;
      uint64_t v18 = [MEMORY[0x1E4F28D58] indexPathForRow:v17 inSection:0];
      defaultSelectedIndexPath = v7->_defaultSelectedIndexPath;
      v7->_defaultSelectedIndexPath = (NSIndexPath *)v18;
    }
  }

  return v7;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)PKPeerPaymentAssociatedAccountReceiveRestrictionViewController;
  [(PKPeerPaymentAssociatedAccountReceiveRestrictionViewController *)&v29 viewDidLoad];
  v3 = [(PKPaymentSetupTableViewController *)self tableView];
  [v3 setAllowsMultipleSelection:0];
  [(PKPeerPaymentAssociatedAccountReceiveRestrictionViewController *)self tableView:v3 didSelectRowAtIndexPath:self->_defaultSelectedIndexPath];
  v4 = [PKTableHeaderView alloc];
  id v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableHeader = self->_tableHeader;
  self->_tableHeader = v5;

  [(PKTableHeaderView *)self->_tableHeader setTopPadding:30.0];
  [(PKTableHeaderView *)self->_tableHeader setBottomPadding:30.0];
  v7 = [(PKPeerPaymentAssociatedAccountReceiveRestrictionViewController *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  uint64_t v9 = self->_tableHeader;
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(PKPaymentSetupTableViewController *)self context];
    uint64_t IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  }
  else
  {
    uint64_t IsSetupAssistant = 0;
  }
  [(PKTableHeaderView *)v9 setStyle:IsSetupAssistant];
  v11 = [(PKTableHeaderView *)self->_tableHeader titleLabel];
  v12 = PKLocalizedNearbyPeerPaymentString(&cfstr_PeerPaymentRec.isa);
  [v11 setText:v12];

  uint64_t v13 = [(PKTableHeaderView *)self->_tableHeader subtitleLabel];
  v14 = [(PKFamilyMember *)self->_familyMember firstName];
  uint64_t v15 = PKLocalizedNearbyPeerPaymentString(&cfstr_PeerPaymentRec_0.isa, &stru_1EF1B4C70.isa, v14);
  [v13 setText:v15];

  unint64_t v16 = PKUIGetMinScreenWidthType();
  double v17 = 37.0;
  if (v16 < 5) {
    double v17 = 26.0;
  }
  if (!v16) {
    double v17 = 20.0;
  }
  [(PKTableHeaderView *)self->_tableHeader setBottomPadding:v17];
  [(PKPaymentSetupTableViewController *)self context];
  if ((PKPaymentSetupContextIsBridge() & 1) == 0)
  {
    uint64_t v18 = PKPassKitUIBundle();
    v19 = [v18 URLForResource:@"AppleCashIcon" withExtension:@"pdf"];
    double v20 = PKUIScreenScale();
    objc_super v21 = PKUIImageFromPDF(v19, 80.0, 80.0, v20);

    v22 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v21];
    [v22 setContentMode:1];
    [v22 setClipsToBounds:1];
    [v22 _setContinuousCornerRadius:20.0];
    [(PKTableHeaderView *)self->_tableHeader setImageView:v22];
  }
  [v3 setTableHeaderView:self->_tableHeader];
  [(PKTableHeaderView *)self->_tableHeader sizeToFit];
  [(PKTableHeaderView *)self->_tableHeader bounds];
  [v3 _tableHeaderHeightDidChangeToHeight:CGRectGetHeight(v30)];
  v23 = [(PKPaymentSetupTableViewController *)self dockView];
  v24 = [v23 footerView];
  [v24 setManualEntryButton:0];

  v25 = [v23 footerView];
  [v25 setSetupLaterButton:0];

  v26 = [v23 primaryButton];
  [v26 addTarget:self action:sel__continue forControlEvents:0x2000];

  v27 = [v23 primaryButton];
  v28 = PKLocalizedPaymentString(&cfstr_Continue.isa);
  [v27 setTitle:v28 forState:0];
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentAssociatedAccountReceiveRestrictionViewController;
  [(PKPaymentSetupTableViewController *)&v8 viewWillLayoutSubviews];
  v3 = [(PKPaymentSetupTableViewController *)self tableView];
  [v3 bounds];
  if (self->_cachedHeaderViewWidth != v4)
  {
    -[PKTableHeaderView sizeThatFits:](self->_tableHeader, "sizeThatFits:", v4, 1.79769313e308);
    double v6 = v5;
    tableHeader = self->_tableHeader;
    [v3 _rectForTableHeaderView];
    -[PKTableHeaderView setFrame:](tableHeader, "setFrame:");
    [v3 setTableHeaderView:0];
    [v3 setTableHeaderView:self->_tableHeader];
    self->_cachedHeaderViewWidth = v6;
  }
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"CellReuseIdentifier"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"CellReuseIdentifier"];
  }
  objc_super v8 = [v7 textLabel];
  uint64_t v9 = [(PKPeerPaymentAssociatedAccountReceiveRestrictionViewController *)self _textLabelStringForIndexPath:v6];
  [v8 setText:v9];

  uint64_t v10 = [(PKPaymentSetupTableViewController *)self selectedIndexPath];
  LODWORD(v8) = PKEqualObjects();

  if (v8) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 0;
  }

  [v7 setAccessoryType:v11];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (unint64_t)a4;
  objc_super v8 = [(PKPaymentSetupTableViewController *)self selectedIndexPath];
  defaultSelectedIndexPath = v8;
  if (!v8) {
    defaultSelectedIndexPath = self->_defaultSelectedIndexPath;
  }
  id v10 = defaultSelectedIndexPath;

  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentAssociatedAccountReceiveRestrictionViewController;
  [(PKPaymentSetupTableViewController *)&v12 tableView:v6 didSelectRowAtIndexPath:v7];
  [v6 deselectRowAtIndexPath:v7 animated:1];
  if (v7 | (unint64_t)v10 && (PKEqualObjects() & 1) == 0)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v11 safelyAddObject:v10];
    [v11 safelyAddObject:v7];
    [v6 reloadRowsAtIndexPaths:v11 withRowAnimation:100];
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return (id)PKLocalizedNearbyPeerPaymentString(&cfstr_PeerPaymentRec_1.isa);
}

- (void)_continue
{
  configuration = self->_configuration;
  double v4 = [(PKPeerPaymentAssociatedAccountReceiveRestrictionViewController *)self _updatedPreferences];
  [(PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *)configuration setUpdatedPreferences:v4];

  id v6 = [[PKPeerPaymentAssociatedAccountActivationViewController alloc] initWithPeerPaymentSetupFlowController:self->_controller];
  double v5 = [(PKPeerPaymentAssociatedAccountReceiveRestrictionViewController *)self navigationController];
  objc_msgSend(v5, "pk_presentPaymentSetupViewController:animated:completion:", v6, 1, 0);
}

- (id)_updatedPreferences
{
  v3 = [(PKFamilyMember *)self->_familyMember altDSID];
  double v4 = (void *)[(PKPeerPaymentPreferences *)self->_currentPreferences copy];
  double v5 = [(PKPaymentSetupTableViewController *)self selectedIndexPath];
  defaultSelectedIndexPath = v5;
  if (!v5) {
    defaultSelectedIndexPath = self->_defaultSelectedIndexPath;
  }
  unint64_t v7 = defaultSelectedIndexPath;

  uint64_t v8 = [(NSIndexPath *)v7 row];
  if (v8)
  {
    if (v8 != 1) {
      goto LABEL_8;
    }
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 1;
  }
  [v4 addReceiveRestrictionType:v9 altDSID:v3];
LABEL_8:

  return v4;
}

- (id)_textLabelStringForIndexPath:(id)a3
{
  uint64_t v3 = [a3 row];
  if (!v3)
  {
    double v4 = @"PEER_PAYMENT_ASSOCIATED_ACCOUNT_RECEIVE_RESTRICTIONS_ANYONE";
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    double v4 = @"PEER_PAYMENT_ASSOCIATED_ACCOUNT_RECEIVE_RESTRICTIONS_FAMILY";
LABEL_5:
    double v5 = PKLocalizedNearbyPeerPaymentString(&v4->isa);
    goto LABEL_7;
  }
  double v5 = 0;
LABEL_7:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableHeader, 0);
  objc_storeStrong((id *)&self->_defaultSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_currentPreferences, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end