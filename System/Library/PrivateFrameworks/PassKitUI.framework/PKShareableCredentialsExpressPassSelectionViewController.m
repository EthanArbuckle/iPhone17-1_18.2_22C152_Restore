@interface PKShareableCredentialsExpressPassSelectionViewController
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (PKShareableCredentialsExpressPassSelectionViewController)initWithPasses:(id)a3 groupsController:(id)a4 context:(int64_t)a5 delegate:(id)a6;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_done;
- (void)_enableView:(BOOL)a3;
- (void)setReporter:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKShareableCredentialsExpressPassSelectionViewController

- (PKShareableCredentialsExpressPassSelectionViewController)initWithPasses:(id)a3 groupsController:(id)a4 context:(int64_t)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKShareableCredentialsExpressPassSelectionViewController;
  v14 = [(PKPaymentSetupTableViewController *)&v21 initWithContext:a5];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_passes, a3);
    objc_storeStrong((id *)&v15->_delegate, a6);
    if (v12)
    {
      objc_storeStrong((id *)&v15->_groupsController, a4);
    }
    else
    {
      id v16 = objc_alloc(MEMORY[0x1E4F84740]);
      v17 = [MEMORY[0x1E4F84898] sharedInstance];
      uint64_t v18 = [v16 initWithPassLibrary:v17];
      groupsController = v15->_groupsController;
      v15->_groupsController = (PKGroupsController *)v18;

      [(PKGroupsController *)v15->_groupsController loadGroupsSynchronously];
    }
  }

  return v15;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)PKShareableCredentialsExpressPassSelectionViewController;
  [(PKShareableCredentialsExpressPassSelectionViewController *)&v23 viewDidLoad];
  v3 = [(PKShareableCredentialsExpressPassSelectionViewController *)self navigationItem];
  [v3 setHidesBackButton:1 animated:0];

  v4 = [(PKPaymentSetupTableViewController *)self tableView];
  [v4 setAllowsMultipleSelection:0];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"CellReuseIdentifier"];
  self->_hasSetDefault = 0;
  v5 = [PKTableHeaderView alloc];
  v6 = -[PKTableHeaderView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableHeader = self->_tableHeader;
  self->_tableHeader = v6;

  [(PKTableHeaderView *)self->_tableHeader setTopPadding:30.0];
  v8 = [(PKShareableCredentialsExpressPassSelectionViewController *)self traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  v10 = self->_tableHeader;
  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(PKPaymentSetupTableViewController *)self context];
    uint64_t IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  }
  else
  {
    uint64_t IsSetupAssistant = 0;
  }
  [(PKTableHeaderView *)v10 setStyle:IsSetupAssistant];
  id v12 = [(PKTableHeaderView *)self->_tableHeader titleLabel];
  id v13 = PKLocalizedShareableCredentialString(&cfstr_SelectExpressP.isa);
  [v12 setText:v13];

  v14 = [(PKTableHeaderView *)self->_tableHeader subtitleLabel];
  if (PKPearlIsAvailable()) {
    v15 = @"SELECT_EXPRESS_PASS_DESCRIPTION_FACE_ID";
  }
  else {
    v15 = @"SELECT_EXPRESS_PASS_DESCRIPTION_TOUCH_ID";
  }
  id v16 = PKLocalizedShareableCredentialString(&v15->isa);
  [v14 setText:v16];

  [v4 setTableHeaderView:self->_tableHeader];
  [(PKTableHeaderView *)self->_tableHeader sizeToFit];
  [(PKTableHeaderView *)self->_tableHeader bounds];
  [v4 _tableHeaderHeightDidChangeToHeight:CGRectGetHeight(v24)];
  [(PKTableHeaderView *)self->_tableHeader setBottomPadding:20.0];
  v17 = [(PKPaymentSetupTableViewController *)self dockView];
  uint64_t v18 = [v17 footerView];
  [v18 setManualEntryButton:0];

  v19 = [v17 footerView];
  [v19 setSetupLaterButton:0];

  v20 = [v17 primaryButton];
  [v20 addTarget:self action:sel__done forControlEvents:0x2000];

  objc_super v21 = [v17 primaryButton];
  v22 = PKLocalizedShareableCredentialString(&cfstr_SelectExpressP_2.isa);
  [v21 setTitle:v22 forState:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKShareableCredentialsExpressPassSelectionViewController;
  [(PKPaymentSetupTableViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PKShareableCredentialsExpressPassSelectionViewController;
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
  return [(NSArray *)self->_passes count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a4;
  objc_super v8 = [a3 dequeueReusableCellWithIdentifier:@"CellReuseIdentifier" forIndexPath:v7];
  if (!v8) {
    objc_super v8 = [[PKPaymentCredentialTableViewCell alloc] initWithStyle:1 reuseIdentifier:@"CellReuseIdentifier"];
  }
  uint64_t v9 = -[NSArray objectAtIndex:](self->_passes, "objectAtIndex:", [v7 row]);
  if (!self->_hasSetDefault)
  {
    self->_hasSetDefault = 1;
    [(PKPaymentCredentialTableViewCell *)v8 setAccessoryType:3];
    objc_storeStrong((id *)&self->_previouslySelectedIndexPath, a4);
    objc_storeStrong((id *)&self->_previouslySelectedPass, v9);
  }
  [(PKPaymentCredentialTableViewCell *)v8 setSnapshotImageHasBorder:0];
  v10 = [(PKPaymentCredentialTableViewCell *)v8 textLabel];
  [v10 setLineBreakMode:4];
  id v11 = [v9 fieldForKey:*MEMORY[0x1E4F87A28]];
  id v12 = [v11 value];
  [v10 setText:v12];

  id v13 = [(PKPaymentCredentialTableViewCell *)v8 credentialDetailLabel];
  v14 = [(PKPaymentCredentialTableViewCell *)v8 detailTextLabelColor];
  [v13 setTextColor:v14];

  v15 = [v9 localizedDescription];
  [v13 setText:v15];

  [v13 setLineBreakMode:4];
  id v16 = [[PKPassView alloc] initWithPass:v9 content:5];
  +[PKPaymentCredentialTableViewCell defaultImageViewSize];
  v17 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v16, "snapshotOfFrontFaceWithRequestedSize:");
  uint64_t v18 = [(PKPaymentCredentialTableViewCell *)v8 imageView];
  [v18 setImage:v17];

  v19 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [(PKPaymentCredentialTableViewCell *)v8 setBackgroundColor:v19];

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  double v6 = (NSIndexPath *)a4;
  v14.receiver = self;
  v14.super_class = (Class)PKShareableCredentialsExpressPassSelectionViewController;
  id v7 = a3;
  [(PKPaymentSetupTableViewController *)&v14 tableView:v7 didSelectRowAtIndexPath:v6];
  objc_super v8 = objc_msgSend(v7, "cellForRowAtIndexPath:", self->_previouslySelectedIndexPath, v14.receiver, v14.super_class);
  [v8 setAccessoryType:0];

  uint64_t v9 = [v7 cellForRowAtIndexPath:v6];

  [v9 setAccessoryType:3];
  previouslySelectedIndexPath = self->_previouslySelectedIndexPath;
  self->_previouslySelectedIndexPath = v6;
  id v11 = v6;

  id v12 = [(NSArray *)self->_passes objectAtIndex:[(NSIndexPath *)v11 row]];
  previouslySelectedPass = self->_previouslySelectedPass;
  self->_previouslySelectedPass = v12;
}

- (void)_done
{
  v14[1] = *MEMORY[0x1E4F143B8];
  reporter = self->_reporter;
  uint64_t v13 = *MEMORY[0x1E4F86BA0];
  v14[0] = *MEMORY[0x1E4F86BA8];
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportButtonPressed:0 context:v4];

  [(PKGroupsController *)self->_groupsController suppressRemoteUpdates:1];
  groupsController = self->_groupsController;
  double v6 = [(PKSecureElementPass *)self->_previouslySelectedPass uniqueID];
  uint64_t v7 = [(PKGroupsController *)groupsController groupIndexForPassUniqueID:v6];

  objc_super v8 = [(PKGroupsController *)self->_groupsController groupAtIndex:v7];
  if (v8) {
    [(PKGroupsController *)self->_groupsController movePass:self->_previouslySelectedPass inGroup:v8 toIndex:0];
  }
  [(PKGroupsController *)self->_groupsController enableRemoteUpdates];
  uint64_t v9 = (void *)[(NSArray *)self->_passes mutableCopy];
  v10 = v9;
  if (self->_previouslySelectedPass)
  {
    objc_msgSend(v9, "removeObject:");
    [v10 insertObject:self->_previouslySelectedPass atIndex:0];
  }
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    id v12 = (void *)[v10 copy];
    [(PKPaymentSetupViewControllerDelegate *)delegate viewController:self didFinishWithPasses:v12 error:0];
  }
}

- (void)_enableView:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PKPaymentSetupTableViewController *)self tableView];
  [v5 setUserInteractionEnabled:v3];

  double v6 = [(PKPaymentSetupTableViewController *)self dockView];
  id v7 = [v6 primaryButton];

  [v7 setShowSpinner:v3 ^ 1];
  [v7 setEnabled:v3];
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_previouslySelectedPass, 0);
  objc_storeStrong((id *)&self->_previouslySelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_tableHeader, 0);
  objc_storeStrong((id *)&self->_groupsController, 0);

  objc_storeStrong((id *)&self->_passes, 0);
}

@end