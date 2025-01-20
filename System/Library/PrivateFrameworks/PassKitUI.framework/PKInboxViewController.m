@interface PKInboxViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKInboxViewController)initWithInboxDataSource:(id)a3 contactAvatarManager:(id)a4 context:(int64_t)a5;
- (id)_configurationForInboxMessage:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_checkManateeCapabilityForFeatureApplication:(id)a3 completion:(id)a4;
- (void)_doneButtonTapped:(id)a3;
- (void)_presentAccountUserInvitation:(id)a3;
- (void)_presentExpiredAlertForInboxMessage:(id)a3;
- (void)_presentInboxMessage:(id)a3;
- (void)_presentManateeUpgradeForFeatureApplication:(id)a3 completion:(id)a4;
- (void)_showSpinner:(BOOL)a3;
- (void)_updateDiffableDataSourceAnimated:(BOOL)a3;
- (void)_updateImage:(id)a3 onCellAtIndexPath:(id)a4;
- (void)presentInboxMessageWithIdentifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewControllerDidCancelSetupFlow:(id)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKInboxViewController

- (PKInboxViewController)initWithInboxDataSource:(id)a3 contactAvatarManager:(id)a4 context:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKInboxViewController;
  v11 = [(PKInboxViewController *)&v19 initWithStyle:1];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataSource, a3);
    objc_storeStrong((id *)&v12->_avatarManager, a4);
    v12->_context = a5;
    v13 = [(PKInboxViewController *)v12 navigationItem];
    objc_msgSend(v13, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v13, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:v12 action:sel__doneButtonTapped_];
    [v14 setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
    [v13 setLeftBarButtonItem:v14];
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    activityIndicator = v12->_activityIndicator;
    v12->_activityIndicator = (UIActivityIndicatorView *)v15;

    v17 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v12->_activityIndicator];
    [v13 setRightBarButtonItem:v17];
  }
  return v12;
}

- (void)presentInboxMessageWithIdentifier:(id)a3
{
  if (a3)
  {
    v4 = -[PKInboxDataSource inboxMessageWithIdentifier:](self->_dataSource, "inboxMessageWithIdentifier:");
    if (v4)
    {
      v5 = v4;
      [(PKInboxViewController *)self _presentInboxMessage:v4];
      v4 = v5;
    }
  }
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PKInboxViewController;
  [(PKInboxViewController *)&v13 viewDidLoad];
  v3 = [(PKInboxViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"InboxMessageCellReuseIdentifier"];
  v4 = [PKTableHeaderView alloc];
  v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  headerView = self->_headerView;
  self->_headerView = v5;

  v7 = [(PKTableHeaderView *)self->_headerView titleLabel];
  v8 = PKLocalizedMadisonString(&cfstr_PendingInvitat.isa);
  [v7 setText:v8];

  [v3 setTableHeaderView:self->_headerView];
  id v9 = [PKTableViewDiffableDataSource alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__PKInboxViewController_viewDidLoad__block_invoke;
  v12[3] = &unk_1E59D2DD0;
  v12[4] = self;
  id v10 = [(UITableViewDiffableDataSource *)v9 initWithTableView:v3 cellProvider:v12];
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v10;

  [(PKTableViewDiffableDataSource *)self->_diffableDataSource setSectionHeaderProvider:&__block_literal_global_80];
  [(PKTableViewDiffableDataSource *)self->_diffableDataSource setSectionFooterProvider:&__block_literal_global_33_0];
  [(PKInboxViewController *)self _updateDiffableDataSourceAnimated:0];
}

id __36__PKInboxViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  v8 = [a2 dequeueReusableCellWithIdentifier:@"InboxMessageCellReuseIdentifier" forIndexPath:a3];
  id v9 = [*(id *)(a1 + 32) _configurationForInboxMessage:v7];
  [v8 setContentConfiguration:v9];
  LODWORD(a1) = [v7 isExpired];

  if (a1) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 1;
  }
  [v8 setAccessoryType:v10];
  [v8 setAccessibilityIdentifier:*MEMORY[0x1E4F85648]];

  return v8;
}

uint64_t __36__PKInboxViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 title];
}

uint64_t __36__PKInboxViewController_viewDidLoad__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 footer];
}

- (void)viewWillLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKInboxViewController;
  [(PKInboxViewController *)&v12 viewWillLayoutSubviews];
  v3 = [(PKInboxViewController *)self tableView];
  v4 = [(PKInboxViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

  headerView = self->_headerView;
  v6 = [(PKInboxViewController *)self view];
  [v6 bounds];
  -[PKTableHeaderView sizeThatFits:](headerView, "sizeThatFits:", CGRectGetWidth(v13), 1.79769313e308);
  double v8 = v7;
  double v10 = v9;

  if (self->_previousHeaderHeight != v10)
  {
    self->_previousHeaderHeight = v10;
    -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v8, v10);
    v11 = [(PKInboxViewController *)self tableView];
    [v11 _tableHeaderHeightDidChangeToHeight:v10];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  diffableDataSource = self->_diffableDataSource;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(UITableViewDiffableDataSource *)diffableDataSource itemIdentifierForIndexPath:v7];
  [(PKInboxViewController *)self _presentInboxMessage:v9];
  [v8 deselectRowAtIndexPath:v7 animated:1];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return !self->_disableSelection;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
}

- (void)viewControllerDidCancelSetupFlow:(id)a3
{
}

- (void)_presentInboxMessage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v8 = v4;
    if ([v4 isExpired])
    {
      [(PKInboxViewController *)self _presentExpiredAlertForInboxMessage:v8];
    }
    else
    {
      uint64_t v6 = [v8 type];
      v5 = v8;
      if (v6) {
        goto LABEL_7;
      }
      id v7 = [v8 accountUserInvitation];
      [(PKInboxViewController *)self _presentAccountUserInvitation:v7];
    }
    v5 = v8;
  }
LABEL_7:
}

- (void)_presentExpiredAlertForInboxMessage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v18 = v4;
    if ([v4 type])
    {
      v5 = 0;
      uint64_t v6 = 0;
    }
    else
    {
      id v7 = [v18 accountUserInvitation];
      id v8 = [v7 invitationDetails];

      id v9 = (void *)MEMORY[0x1E4F845E8];
      double v10 = [v18 familyMember];
      v11 = [v8 originatorNameComponents];
      objc_super v12 = [v9 contactForFamilyMember:v10 nameComponents:v11 imageData:0];

      v5 = PKLocalizedMadisonString(&cfstr_ExpiredInvitat.isa);
      CGRect v13 = [v12 pkFullName];
      uint64_t v6 = PKLocalizedMadisonString(&cfstr_ExpiredInvitat_0.isa, &stru_1EF1B4C70.isa, v13);

      if (v5 && v6)
      {
        v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:v6 preferredStyle:1];
        uint64_t v15 = (void *)MEMORY[0x1E4FB1410];
        v16 = PKLocalizedMadisonString(&cfstr_ExpiredInvitat_1.isa);
        v17 = [v15 actionWithTitle:v16 style:0 handler:0];
        [v14 addAction:v17];

        [(PKInboxViewController *)self presentViewController:v14 animated:1 completion:0];
      }
    }

    id v4 = v18;
  }
}

- (void)_doneButtonTapped:(id)a3
{
}

- (id)_configurationForInboxMessage:(id)a3
{
  id v3 = a3;
  if ([v3 type])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = +[PKInboxMessageContentConfiguration configurationWithInboxMessage:v3];
  }

  return v4;
}

- (void)_updateDiffableDataSourceAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  uint64_t v6 = [(PKInboxDataSource *)self->_dataSource activeInboxMessages];
  if ([v6 count])
  {
    id v7 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"ActiveInboxMessageSectionIdentifier"];
    v14[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v5 appendSectionsWithIdentifiers:v8];

    [v5 appendItemsWithIdentifiers:v6 intoSectionWithIdentifier:v7];
  }
  id v9 = [(PKInboxDataSource *)self->_dataSource expiredInboxMessages];
  if ([v9 count])
  {
    double v10 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"ExpiredInboxMessageSectionIdentifier"];
    v11 = PKLocalizedMadisonString(&cfstr_ExpiredInvitat_2.isa);
    [(PKTableViewDiffableDataSourceSection *)v10 setTitle:v11];

    CGRect v13 = v10;
    objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    [v5 appendSectionsWithIdentifiers:v12];

    [v5 appendItemsWithIdentifiers:v9 intoSectionWithIdentifier:v10];
  }
  [(UITableViewDiffableDataSource *)self->_diffableDataSource applySnapshot:v5 animatingDifferences:v3];
}

- (void)_updateImage:(id)a3 onCellAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(PKInboxViewController *)self tableView];
  id v8 = [v7 cellForRowAtIndexPath:v6];

  if (v8)
  {
    id v9 = [v8 contentConfiguration];
    [v9 setImage:v10];
    [v8 setContentConfiguration:v9];
  }
}

- (void)_showSpinner:(BOOL)a3
{
  self->_disableSelection = a3;
  activityIndicator = self->_activityIndicator;
  if (a3) {
    [(UIActivityIndicatorView *)activityIndicator startAnimating];
  }
  else {
    [(UIActivityIndicatorView *)activityIndicator stopAnimating];
  }
}

- (void)_presentAccountUserInvitation:(id)a3
{
  id v4 = a3;
  [(PKInboxViewController *)self _showSpinner:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKInboxViewController__presentAccountUserInvitation___block_invoke;
  aBlock[3] = &unk_1E59CA870;
  id v5 = v4;
  id v13 = v5;
  v14 = self;
  id v6 = _Block_copy(aBlock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_6;
  v9[3] = &unk_1E59D1180;
  id v10 = v5;
  id v11 = v6;
  v9[4] = self;
  id v7 = v5;
  id v8 = v6;
  [(PKInboxViewController *)self _checkManateeCapabilityForFeatureApplication:v7 completion:v9];
}

void __55__PKInboxViewController__presentAccountUserInvitation___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F84270] sharedInstance];
  uint64_t v3 = [*(id *)(a1 + 32) feature];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_2;
  v6[3] = &unk_1E59D21E8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 defaultAccountForFeature:v3 completion:v6];
}

void __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_3;
  block[3] = &unk_1E59CA8E8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v3;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F84BB8]);
  id v3 = [MEMORY[0x1E4F84D50] sharedService];
  id v4 = (void *)[v2 initWithWebService:v3];

  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  [*(id *)(a1 + 32) feature];
  id v6 = PKFeatureIdentifierToString();
  id v7 = [v5 setWithObject:v6];
  [v4 setAllowedFeatureIdentifiers:v7];

  id v8 = [[PKApplyControllerConfiguration alloc] initWithSetupDelegate:*(void *)(a1 + 40) context:*(void *)(*(void *)(a1 + 40) + 1032) provisioningController:v4];
  [(PKApplyControllerConfiguration *)v8 setFeatureApplication:*(void *)(a1 + 32)];
  uint64_t v9 = [[PKApplyController alloc] initWithApplyConfiguration:v8];
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = *(void **)(v10 + 1080);
  *(void *)(v10 + 1080) = v9;

  objc_super v12 = *(void **)(*(void *)(a1 + 40) + 1080);
  id v13 = [MEMORY[0x1E4F841A8] analyticsAccountTypeForAccount:*(void *)(a1 + 48)];
  [v12 setAnalyticsExistingAccountType:v13];

  objc_initWeak(&location, *(id *)(a1 + 40));
  v14 = *(void **)(*(void *)(a1 + 40) + 1080);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_4;
  v15[3] = &unk_1E59CB9C8;
  objc_copyWeak(&v16, &location);
  [v14 nextViewControllerWithCompletion:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      uint64_t v9 = [WeakRetained navigationController];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_5;
      v11[3] = &unk_1E59CB6D8;
      v11[4] = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v11);
    }
    else
    {
      if (v6)
      {
        id v10 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
        [v8 presentViewController:v10 animated:1 completion:0];
      }
      [v8 _showSpinner:0];
    }
  }
}

uint64_t __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showSpinner:0];
}

void __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_6(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_7;
    v7[3] = &unk_1E59CF340;
    id v6 = *(id *)(a1 + 48);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    [v4 _presentManateeUpgradeForFeatureApplication:v5 completion:v7];
  }
}

void __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_7(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v12 = v5;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v12 = v5;
    id v6 = PKTitleForDisplayableError();
    id v7 = MEMORY[0x1A6221F20](v12);
    id v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v6 message:v7 preferredStyle:1];
    uint64_t v9 = (void *)MEMORY[0x1E4FB1410];
    id v10 = PKLocalizedPaymentString(&cfstr_HsaOkButtonTit.isa);
    id v11 = [v9 actionWithTitle:v10 style:1 handler:0];
    [v8 addAction:v11];

    [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
  }
  id v5 = v12;
LABEL_6:
}

- (void)_checkManateeCapabilityForFeatureApplication:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    id v8 = [PKSecurityCapabilitiesController alloc];
    uint64_t v9 = [v7 feature];

    id v10 = [(PKSecurityCapabilitiesController *)v8 initWithRequirements:8 feature:v9 context:self->_context];
    securityCapabilitiesController = self->_securityCapabilitiesController;
    self->_securityCapabilitiesController = v10;

    id v12 = self->_securityCapabilitiesController;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__PKInboxViewController__checkManateeCapabilityForFeatureApplication_completion___block_invoke;
    v13[3] = &unk_1E59D2E18;
    id v14 = v6;
    [(PKSecurityCapabilitiesController *)v12 isEnabledForSecuirtyRequirementsWithCompletion:v13];
  }
}

void __81__PKInboxViewController__checkManateeCapabilityForFeatureApplication_completion___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__PKInboxViewController__checkManateeCapabilityForFeatureApplication_completion___block_invoke_2;
  v3[3] = &unk_1E59CAF20;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __81__PKInboxViewController__checkManateeCapabilityForFeatureApplication_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_presentManateeUpgradeForFeatureApplication:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v7)
  {
    id v8 = -[PKSecurityCapabilitiesController initWithRequirements:feature:context:]([PKSecurityCapabilitiesController alloc], "initWithRequirements:feature:context:", 8, [v6 feature], self->_context);
    securityCapabilitiesController = self->_securityCapabilitiesController;
    self->_securityCapabilitiesController = v8;

    id v10 = [(PKInboxViewController *)self navigationController];
    id v11 = v10;
    if (PKPaymentSetupContextIsBridge())
    {
      id v12 = [v10 viewControllers];
      id v11 = [v12 lastObject];
    }
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Presenting hsa2 flow for account user invitation", buf, 2u);
    }

    id v14 = self->_securityCapabilitiesController;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke;
    v15[3] = &unk_1E59D2E68;
    void v15[4] = self;
    id v16 = v6;
    id v17 = v7;
    [(PKSecurityCapabilitiesController *)v14 presentSecurityRepairFlowWithPresentingViewController:v11 completion:v15];
  }
}

void __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke_2;
  block[3] = &unk_1E59D2E40;
  uint64_t v14 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v13 = *(id *)(a1 + 48);
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = PKSecurityCapabilitiesErrorToString(*(void *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Finished checking account user invitation security capabilities with upgrade error %@, error %@", buf, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 64);
  if (v5 == 3)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_10:
    v8();
    return;
  }
  if (v5)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_10;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "User successfully completed. Ensuring that they indeed supportsDeviceToDeviceEncryption", buf, 2u);
  }

  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke_75;
  v9[3] = &unk_1E59CA9F8;
  id v10 = *(id *)(a1 + 56);
  [v6 _checkManateeCapabilityForFeatureApplication:v7 completion:v9];
}

void __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke_75(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke_2_76;
  v3[3] = &unk_1E59CAF20;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke_2_76(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_securityCapabilitiesController, 0);
  objc_storeStrong((id *)&self->_applyController, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end