@interface PKAccountInvitationAccessLevelViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKAccountInvitationAccessLevelViewController)initWithController:(id)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_handleFooterButtonTapped:(id)a3;
- (void)_showSpinner:(BOOL)a3 atIndexPath:(id)a4;
- (void)_updateCell:(id)a3 showSpinner:(BOOL)a4;
- (void)preflightWithCompletion:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAccountInvitationAccessLevelViewController

- (PKAccountInvitationAccessLevelViewController)initWithController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountInvitationAccessLevelViewController;
  v6 = -[PKPaymentSetupTableViewController initWithContext:](&v9, sel_initWithContext_, [v5 context]);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_controller, a3);
  }

  return v7;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  controller = self->_controller;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PKAccountInvitationAccessLevelViewController_preflightWithCompletion___block_invoke;
  v7[3] = &unk_1E59CC358;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(PKAccountInvitationController *)controller accessLevelOptionsWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__PKAccountInvitationAccessLevelViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = [v7 copy];
    id v5 = (void *)WeakRetained[138];
    WeakRetained[138] = v4;

    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
    }
  }
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)PKAccountInvitationAccessLevelViewController;
  [(PKAccountInvitationAccessLevelViewController *)&v23 viewDidLoad];
  v3 = [(PKPaymentSetupTableViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"AccessLevelCellReuseIdentifier"];
  uint64_t v4 = [PKTableHeaderView alloc];
  id v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  headerView = self->_headerView;
  self->_headerView = v5;

  id v7 = [(PKTableHeaderView *)self->_headerView titleLabel];
  id v8 = PKLocalizedMadisonString(&cfstr_SharingTypeTit.isa);
  [v7 setText:v8];

  id v9 = [(PKTableHeaderView *)self->_headerView subtitleLabel];
  v10 = [(PKAccountInvitationController *)self->_controller familyMember];
  v11 = [v10 firstName];
  v12 = PKLocalizedMadisonString(&cfstr_SharingTypeSub.isa, &stru_1EF1B4C70.isa, v11);
  [v9 setText:v12];

  [(PKTableHeaderView *)self->_headerView setTopPadding:30.0];
  [(PKTableHeaderView *)self->_headerView setBottomPadding:20.0];
  [v3 setTableHeaderView:self->_headerView];
  v13 = (void *)MEMORY[0x1E4FB14D8];
  v14 = PKLocalizedMadisonString(&cfstr_AboutSharingTy.isa);
  v15 = objc_msgSend(v13, "pkui_plainConfigurationWithTitle:font:", v14, 0);

  objc_initWeak(&location, self);
  v16 = (void *)MEMORY[0x1E4FB13F0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__PKAccountInvitationAccessLevelViewController_viewDidLoad__block_invoke;
  v20[3] = &unk_1E59CBEE0;
  objc_copyWeak(&v21, &location);
  v17 = [v16 actionWithHandler:v20];
  v18 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v15 primaryAction:v17];
  footerView = self->_footerView;
  self->_footerView = v18;

  [(UIButton *)self->_footerView setAccessibilityIdentifier:*MEMORY[0x1E4F855A8]];
  [v3 setTableFooterView:self->_footerView];
  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85178]];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __59__PKAccountInvitationAccessLevelViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [v3 sender];

  [WeakRetained _handleFooterButtonTapped:v4];
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PKAccountInvitationAccessLevelViewController;
  [(PKPaymentSetupTableViewController *)&v15 viewWillLayoutSubviews];
  id v3 = [(PKAccountInvitationAccessLevelViewController *)self view];
  [v3 bounds];
  double Width = CGRectGetWidth(v16);

  -[PKTableHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", Width, 1.79769313e308);
  double v7 = v5;
  id v8 = (double *)MEMORY[0x1E4F1DAD8];
  if (self->_previousHeaderHeight != v6)
  {
    double v9 = v6;
    self->_previousHeaderHeight = v6;
    -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:", *v8, v8[1], v5, v6);
    v10 = [(PKPaymentSetupTableViewController *)self tableView];
    [v10 _tableHeaderHeightDidChangeToHeight:v9];
  }
  -[UIButton sizeThatFits:](self->_footerView, "sizeThatFits:", Width, 1.79769313e308, v7);
  if (self->_previousFooterHeight != v12)
  {
    double v13 = v12;
    self->_previousFooterHeight = v12;
    -[UIButton setFrame:](self->_footerView, "setFrame:", *v8, v8[1], v11, v12);
    v14 = [(PKPaymentSetupTableViewController *)self tableView];
    [v14 _tableFooterHeightDidChangeToHeight:v13];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)PKAccountInvitationAccessLevelViewController;
  [(PKPaymentSetupTableViewController *)&v7 viewDidAppear:a3];
  uint64_t v4 = [(PKAccountInvitationController *)self->_controller applyController];
  uint64_t v5 = *MEMORY[0x1E4F85F48];
  uint64_t v8 = *MEMORY[0x1E4F86308];
  v9[0] = *MEMORY[0x1E4F864A0];
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v4 reportAnalyticsDictionaryForPage:0 pageTag:v5 additionalValues:v6];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)PKAccountInvitationAccessLevelViewController;
  [(PKAccountInvitationAccessLevelViewController *)&v7 viewDidDisappear:a3];
  uint64_t v4 = [(PKAccountInvitationController *)self->_controller applyController];
  uint64_t v5 = *MEMORY[0x1E4F85F48];
  uint64_t v8 = *MEMORY[0x1E4F86308];
  v9[0] = *MEMORY[0x1E4F864A8];
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v4 reportAnalyticsDictionaryForPage:0 pageTag:v5 additionalValues:v6];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_accessLevelOptions count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 5.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  accessLevelOptions = self->_accessLevelOptions;
  id v7 = a4;
  id v8 = a3;
  double v9 = -[NSArray objectAtIndexedSubscript:](accessLevelOptions, "objectAtIndexedSubscript:", [v7 section]);
  v10 = [v8 dequeueReusableCellWithIdentifier:@"AccessLevelCellReuseIdentifier" forIndexPath:v7];

  double v11 = [[PKAccountInvitationAccessLevelContentConfiguration alloc] initWithAccessLevelOption:v9];
  [v10 setContentConfiguration:v11];
  double v12 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
  double v13 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  [v12 setBackgroundColor:v13];

  [v10 setBackgroundConfiguration:v12];
  [(PKAccountInvitationAccessLevelViewController *)self _updateCell:v10 showSpinner:self->_loadingIndexPath != 0];

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v21[3] = *MEMORY[0x1E4F143B8];
  double v6 = (NSIndexPath *)a4;
  v19.receiver = self;
  v19.super_class = (Class)PKAccountInvitationAccessLevelViewController;
  [(PKPaymentSetupTableViewController *)&v19 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [(NSArray *)self->_accessLevelOptions objectAtIndexedSubscript:[(NSIndexPath *)v6 section]];
  -[PKAccountInvitationController setAccessLevel:](self->_controller, "setAccessLevel:", [v7 accessLevel]);
  uint64_t v8 = *MEMORY[0x1E4F86380];
  uint64_t v9 = *MEMORY[0x1E4F86120];
  v20[0] = *MEMORY[0x1E4F86308];
  v20[1] = v9;
  uint64_t v10 = *MEMORY[0x1E4F85FB8];
  v21[0] = v8;
  v21[1] = v10;
  v20[2] = *MEMORY[0x1E4F863F8];
  uint64_t v11 = [v7 accessLevel];
  double v12 = (void *)MEMORY[0x1E4F86318];
  if (v11 != 1) {
    double v12 = (void *)MEMORY[0x1E4F86328];
  }
  v21[2] = *v12;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  v14 = [(PKAccountInvitationController *)self->_controller applyController];
  [v14 reportAnalyticsDictionaryForPage:0 pageTag:*MEMORY[0x1E4F85F48] additionalValues:v13];

  loadingIndexPath = self->_loadingIndexPath;
  self->_loadingIndexPath = v6;
  CGRect v16 = v6;

  [(PKAccountInvitationAccessLevelViewController *)self _showSpinner:1 atIndexPath:v16];
  controller = self->_controller;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__PKAccountInvitationAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v18[3] = &unk_1E59CB6B0;
  v18[4] = self;
  [(PKAccountInvitationController *)controller nextViewControllerWithCompletion:v18];
}

void __82__PKAccountInvitationAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v8 = [v7 navigationController];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __82__PKAccountInvitationAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v25[3] = &unk_1E59CB6D8;
    v25[4] = *(void *)(a1 + 32);
    objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v25);
LABEL_11:

    goto LABEL_12;
  }
  [v7 _showSpinner:0 atIndexPath:v7[143]];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 1144);
  *(void *)(v9 + 1144) = 0;

  if (v6)
  {
    id v6 = v6;
    uint64_t v11 = [v6 domain];
    uint64_t v12 = *MEMORY[0x1E4F871A0];
    int v13 = PKEqualObjects();

    uint64_t v8 = v6;
    if (v13)
    {
      v14 = [v6 userInfo];
      uint64_t v8 = [v14 objectForKey:*MEMORY[0x1E4F28A50]];
    }
    objc_super v15 = [v8 domain];
    if (PKEqualObjects())
    {
      uint64_t v16 = [v8 code];

      if (v16 == 60002)
      {
        v24 = (void *)MEMORY[0x1E4F28C58];
        v26[0] = *MEMORY[0x1E4F28568];
        v17 = PKLocalizedMadisonString(&cfstr_ApplyUnderageU.isa);
        v27[0] = v17;
        v26[1] = *MEMORY[0x1E4F285A0];
        v18 = [*(id *)(*(void *)(a1 + 32) + 1096) familyMember];
        objc_super v19 = [v18 firstName];
        v20 = PKLocalizedMadisonString(&cfstr_ApplyUnderageU_0.isa, &stru_1EF1B4C70.isa, v19);
        v26[2] = *MEMORY[0x1E4F28A50];
        v27[1] = v20;
        v27[2] = v8;
        id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
        uint64_t v22 = [v24 errorWithDomain:v12 code:60002 userInfo:v21];

        id v6 = (id)v22;
      }
    }
    else
    {
    }
    id v23 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    [*(id *)(a1 + 32) presentViewController:v23 animated:1 completion:0];

    goto LABEL_11;
  }
LABEL_12:
}

void __82__PKAccountInvitationAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _showSpinner:0 atIndexPath:*(void *)(*(void *)(a1 + 32) + 1144)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1144);
  *(void *)(v2 + 1144) = 0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return self->_loadingIndexPath == 0;
}

- (void)_handleFooterButtonTapped:(id)a3
{
  uint64_t v8 = [[PKPaymentMoreInformationViewController alloc] initWithContext:[(PKPaymentSetupTableViewController *)self context]];
  id v4 = PKLocalizedMadisonString(&cfstr_AboutAccessLev.isa);
  [(PKPaymentMoreInformationViewController *)v8 setDetailTitle:v4];

  id v5 = PKLocalizedMadisonString(&cfstr_AboutAccessLev_0.isa);
  [(PKPaymentMoreInformationViewController *)v8 setDetailBody:v5];

  id v6 = [[PKNavigationController alloc] initWithRootViewController:v8];
  id v7 = [(PKAccountInvitationAccessLevelViewController *)self navigationController];
  [v7 presentViewController:v6 animated:1 completion:0];
}

- (void)_showSpinner:(BOOL)a3 atIndexPath:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(PKPaymentSetupTableViewController *)self tableView];
  id v9 = [v7 cellForRowAtIndexPath:v6];

  uint64_t v8 = v9;
  if (v9)
  {
    [(PKAccountInvitationAccessLevelViewController *)self _updateCell:v9 showSpinner:v4];
    uint64_t v8 = v9;
  }
}

- (void)_updateCell:(id)a3 showSpinner:(BOOL)a4
{
  if (a4)
  {
    BOOL v4 = (objc_class *)MEMORY[0x1E4FB1400];
    id v5 = a3;
    id v6 = (id)[[v4 alloc] initWithActivityIndicatorStyle:100];
    [v6 startAnimating];
    [v5 setAccessoryView:v6];
    [v5 setAccessoryType:0];
  }
  else
  {
    id v6 = a3;
    [v6 setAccessoryType:1];
    [v6 setAccessoryView:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndexPath, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_accessLevelOptions, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end