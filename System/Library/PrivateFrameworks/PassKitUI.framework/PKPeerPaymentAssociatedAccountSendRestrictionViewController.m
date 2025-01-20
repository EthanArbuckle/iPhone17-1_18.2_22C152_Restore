@interface PKPeerPaymentAssociatedAccountSendRestrictionViewController
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (PKPeerPaymentAssociatedAccountSendRestrictionViewController)initWithPeerPaymentSetupFlowController:(id)a3;
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

@implementation PKPeerPaymentAssociatedAccountSendRestrictionViewController

- (PKPeerPaymentAssociatedAccountSendRestrictionViewController)initWithPeerPaymentSetupFlowController:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentAssociatedAccountSendRestrictionViewController;
  v6 = -[PKPaymentSetupTableViewController initWithContext:](&v22, sel_initWithContext_, [v5 context]);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    v8 = [v5 peerPaymentWebService];
    v9 = [v8 targetDevice];
    uint64_t v10 = [v9 preferences];
    currentPreferences = v7->_currentPreferences;
    v7->_currentPreferences = (PKPeerPaymentPreferences *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    defaultSelectedIndexPath = v7->_defaultSelectedIndexPath;
    v7->_defaultSelectedIndexPath = (NSIndexPath *)v12;

    v14 = [v5 configuration];
    uint64_t v15 = [v14 peerPaymentSetupConfigurationType];

    if (v15 == 1)
    {
      uint64_t v16 = [v5 configuration];
      configuration = v7->_configuration;
      v7->_configuration = (PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *)v16;

      v18 = [(PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *)v7->_configuration associatedAccountSetupDelegate];
      objc_storeWeak((id *)&v7->_delegate, v18);

      uint64_t v19 = [(PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *)v7->_configuration familyMember];
      familyMember = v7->_familyMember;
      v7->_familyMember = (PKFamilyMember *)v19;
    }
  }

  return v7;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)PKPeerPaymentAssociatedAccountSendRestrictionViewController;
  [(PKPeerPaymentAssociatedAccountSendRestrictionViewController *)&v29 viewDidLoad];
  v3 = [(PKPaymentSetupTableViewController *)self tableView];
  [v3 setAllowsMultipleSelection:0];
  [(PKPeerPaymentAssociatedAccountSendRestrictionViewController *)self tableView:v3 didSelectRowAtIndexPath:self->_defaultSelectedIndexPath];
  v4 = [PKTableHeaderView alloc];
  id v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableHeader = self->_tableHeader;
  self->_tableHeader = v5;

  [(PKTableHeaderView *)self->_tableHeader setTopPadding:30.0];
  [(PKTableHeaderView *)self->_tableHeader setBottomPadding:30.0];
  v7 = [(PKPeerPaymentAssociatedAccountSendRestrictionViewController *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  v9 = self->_tableHeader;
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
  uint64_t v12 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentPer.isa);
  [v11 setText:v12];

  v13 = [(PKTableHeaderView *)self->_tableHeader subtitleLabel];
  v14 = [(PKFamilyMember *)self->_familyMember firstName];
  uint64_t v15 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentPer_0.isa, &stru_1EF1B4C70.isa, v14);
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
    v18 = PKPassKitUIBundle();
    uint64_t v19 = [v18 URLForResource:@"MessagesIcon" withExtension:@"pdf"];
    double v20 = PKUIScreenScale();
    v21 = PKUIImageFromPDF(v19, 80.0, 80.0, v20);

    objc_super v22 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v21];
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
  v8.super_class = (Class)PKPeerPaymentAssociatedAccountSendRestrictionViewController;
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
  return 3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"CellReuseIdentifier"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"CellReuseIdentifier"];
  }
  objc_super v8 = [v7 textLabel];
  v9 = [(PKPeerPaymentAssociatedAccountSendRestrictionViewController *)self _textLabelStringForIndexPath:v6];
  [v8 setText:v9];

  uint64_t v10 = [(PKPaymentSetupTableViewController *)self selectedIndexPath];
  if (PKEqualObjects()) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 0;
  }

  [v7 setAccessoryType:v11];
  unint64_t v12 = [v6 row];

  if (v12 > 2) {
    v13 = (void *)MEMORY[0x1E4F85B28];
  }
  else {
    v13 = (void *)qword_1E59D27D0[v12];
  }
  [v7 setAccessibilityIdentifier:*v13];

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
  v12.super_class = (Class)PKPeerPaymentAssociatedAccountSendRestrictionViewController;
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
  return (id)PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentPer_1.isa);
}

- (void)_continue
{
  configuration = self->_configuration;
  double v4 = [(PKPeerPaymentAssociatedAccountSendRestrictionViewController *)self _updatedPreferences];
  [(PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *)configuration setUpdatedPreferences:v4];

  id v6 = [[PKPeerPaymentAssociatedAccountReceiveRestrictionViewController alloc] initWithPeerPaymentSetupFlowController:self->_controller];
  if (v6)
  {
    double v5 = [(PKPeerPaymentAssociatedAccountSendRestrictionViewController *)self navigationController];
    [v5 pushViewController:v6 animated:1];
  }
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

  unint64_t v8 = [(NSIndexPath *)v7 row];
  if (v8 <= 2) {
    [v4 addSendRestrictionType:v8 + 1 altDSID:v3];
  }

  return v4;
}

- (id)_textLabelStringForIndexPath:(id)a3
{
  unint64_t v3 = [a3 row];
  if (v3 > 2)
  {
    double v4 = 0;
  }
  else
  {
    double v4 = PKLocalizedPeerPaymentLexingtonString(&off_1E59D27E8[v3]->isa);
  }

  return v4;
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