@interface PKAccountInvitationChooseMemberViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKAccountInvitationChooseMemberViewController)initWithController:(id)a3;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4;
- (void)_filterAvailableFamilyMembersFromMembers:(id)a3;
- (void)_handleAddPersonTapped;
- (void)_openFamilyMemberSettings;
- (void)_reloadFamilyCollectionWithForceReload:(BOOL)a3 completion:(id)a4;
- (void)_reportAnalyticsViewDidAppear:(BOOL)a3;
- (void)_setLoadingIndexPath:(id)a3;
- (void)_updateHeaderFooterText;
- (void)_updateSnapshotAnimated:(BOOL)a3;
- (void)dealloc;
- (void)deviceSharingCapabilitiesUpdated:(id)a3 newSharingCapabilties:(id)a4 forAppleID:(id)a5;
- (void)didUpdateInvitationControllerFamilyCircle;
- (void)preflightWithCompletion:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableViewDidFinishReload:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAccountInvitationChooseMemberViewController

- (PKAccountInvitationChooseMemberViewController)initWithController:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKAccountInvitationChooseMemberViewController;
  v6 = [(PKAccountInvitationChooseMemberViewController *)&v26 init];
  v7 = v6;
  if (v6)
  {
    p_controller = (id *)&v6->_controller;
    objc_storeStrong((id *)&v6->_controller, a3);
    [*p_controller registerObserver:v7];
    v9 = [*p_controller deviceCapabiltiesManager];
    [v9 registerObserver:v7];

    v10 = (NSPersonNameComponentsFormatter *)objc_alloc_init(MEMORY[0x1E4F28F38]);
    nameFormatter = v7->_nameFormatter;
    v7->_nameFormatter = v10;

    v12 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    ageFormatter = v7->_ageFormatter;
    v7->_ageFormatter = v12;

    [(NSNumberFormatter *)v7->_ageFormatter setNumberStyle:1];
    [(NSNumberFormatter *)v7->_ageFormatter setDecimalSeparator:0];
    [(NSNumberFormatter *)v7->_ageFormatter setGroupingSeparator:0];
    v14 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    maximumAccountUsersFormatter = v7->_maximumAccountUsersFormatter;
    v7->_maximumAccountUsersFormatter = v14;

    [(NSNumberFormatter *)v7->_maximumAccountUsersFormatter setNumberStyle:5];
    v16 = [*p_controller account];
    v17 = [v16 accountUserInvitationAllowedFeatureDescriptor];
    uint64_t v18 = [v17 osVersionRange];
    requiredOSVersionRange = v7->_requiredOSVersionRange;
    v7->_requiredOSVersionRange = (PKOSVersionRequirementRange *)v18;

    if (!v7->_requiredOSVersionRange)
    {
      v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "The requiredOSVersionRange is not defined on the account for supported feature accountUserInvitationAllowed", v25, 2u);
      }
    }
    v21 = [*p_controller account];
    v22 = [v21 accountUserInvitationAllowedFeatureDescriptor];

    v7->_minimumParticipantAge = [v22 minimumParticipantAge];
    v23 = [(PKAccountInvitationChooseMemberViewController *)v7 navigationItem];
    objc_msgSend(v23, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v23, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(PKAccountInvitationController *)self->_controller deviceCapabiltiesManager];
  [v3 unregisterObserver:self];

  [(PKAccountInvitationController *)self->_controller unregisterObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)PKAccountInvitationChooseMemberViewController;
  [(PKAccountInvitationChooseMemberViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)PKAccountInvitationChooseMemberViewController;
  [(PKAccountInvitationChooseMemberViewController *)&v25 viewDidLoad];
  v3 = [(PKAccountInvitationChooseMemberViewController *)self view];
  objc_super v4 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v4];

  id v5 = objc_alloc(MEMORY[0x1E4FB1D00]);
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1);
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v11 = (UITableView *)objc_msgSend(v5, "initWithFrame:style:", v6, *MEMORY[0x1E4F1DB28], v8, v9, v10);
  tableView = self->_tableView;
  self->_tableView = v11;

  v13 = self->_tableView;
  v14 = PKProvisioningBackgroundColor();
  [(UITableView *)v13 setBackgroundColor:v14];

  [(UITableView *)self->_tableView setDelegate:self];
  [v3 addSubview:self->_tableView];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"FamilyMemberCellReuseIdentifier"];
  v15 = -[PKTableHeaderView initWithFrame:]([PKTableHeaderView alloc], "initWithFrame:", v7, v8, v9, v10);
  headerView = self->_headerView;
  self->_headerView = v15;

  [(PKTableHeaderView *)self->_headerView setTopPadding:30.0];
  [(PKTableHeaderView *)self->_headerView setBottomPadding:20.0];
  [(UITableView *)self->_tableView setTableHeaderView:self->_headerView];
  v17 = -[PKPaymentSetupDockView initWithFrame:context:]([PKPaymentSetupDockView alloc], "initWithFrame:context:", [(PKAccountInvitationController *)self->_controller context], v7, v8, v9, v10);
  dockView = self->_dockView;
  self->_dockView = v17;

  v19 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:]([_PKVisibilityBackdropView alloc], "initWithFrame:privateStyle:", -2, v7, v8, v9, v10);
  blurringView = self->_blurringView;
  self->_blurringView = v19;

  [(_PKVisibilityBackdropView *)self->_blurringView setDelegate:self];
  [(_PKVisibilityBackdropView *)self->_blurringView pkui_setVisibility:0 animated:self->_backdropWeight];
  [(_PKVisibilityBackdropView *)self->_blurringView setUserInteractionEnabled:1];
  v21 = [(_UIBackdropView *)self->_blurringView contentView];
  [v21 addSubview:self->_dockView];

  [v3 addSubview:self->_blurringView];
  v22 = [(UITableViewDiffableDataSource *)[PKTableViewDiffableDataSource alloc] initWithTableView:self->_tableView cellProvider:&__block_literal_global_162];
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v22;

  [(PKTableViewDiffableDataSource *)self->_diffableDataSource setSectionHeaderProvider:&__block_literal_global_33_2];
  [(PKTableViewDiffableDataSource *)self->_diffableDataSource setSectionFooterProvider:&__block_literal_global_35];
  [(UITableViewDiffableDataSource *)self->_diffableDataSource setDefaultRowAnimation:0];
  [(PKAccountInvitationChooseMemberViewController *)self _updateHeaderFooterText];
  [(PKAccountInvitationChooseMemberViewController *)self _updateSnapshotAnimated:0];
  v24 = [(PKAccountInvitationChooseMemberViewController *)self view];
  [v24 setAccessibilityIdentifier:*MEMORY[0x1E4F85398]];
}

uint64_t __60__PKAccountInvitationChooseMemberViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 cellForTableView:a2 atIndexPath:a3];
}

uint64_t __60__PKAccountInvitationChooseMemberViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 title];
}

uint64_t __60__PKAccountInvitationChooseMemberViewController_viewDidLoad__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 footer];
}

- (void)viewWillLayoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)PKAccountInvitationChooseMemberViewController;
  [(PKAccountInvitationChooseMemberViewController *)&v37 viewWillLayoutSubviews];
  v3 = [(PKAccountInvitationChooseMemberViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  double v13 = v12;
  -[UITableView setFrame:](self->_tableView, "setFrame:", v5, v7, v9, v11);
  [(UITableView *)self->_tableView contentInset];
  double v34 = v15;
  double v35 = v14;
  double v36 = v16;
  -[PKPaymentSetupDockView sizeThatFits:](self->_dockView, "sizeThatFits:", v9, 1.79769313e308);
  double v18 = v17;
  double v19 = v13 + v17;
  v38.origin.x = v5;
  v38.origin.y = v7;
  v38.size.width = v9;
  v38.size.height = v11;
  CGFloat v20 = CGRectGetMaxY(v38) - v19;
  v39.origin.x = v5;
  v39.origin.y = v7;
  v39.size.width = v9;
  v39.size.height = v11;
  -[_PKVisibilityBackdropView setFrame:](self->_blurringView, "setFrame:", v5, v20, v9, CGRectGetMaxY(v39) - v20);
  [(_PKVisibilityBackdropView *)self->_blurringView layoutIfNeeded];
  v21 = [(_UIBackdropView *)self->_blurringView contentView];
  [v21 bounds];

  tableView = self->_tableView;
  [(_PKVisibilityBackdropView *)self->_blurringView bounds];
  -[UITableView convertRect:fromView:](tableView, "convertRect:fromView:", self->_blurringView);
  double v24 = v23;
  [(UITableView *)self->_tableView contentSize];
  double v26 = v25;
  [(UITableView *)self->_tableView bounds];
  v40.size.height = fmin(v27, v26 - v40.origin.y);
  double v28 = fmin(fmax(CGRectGetMaxY(v40) - v24, 0.0), 30.0) / 30.0;
  if (self->_backdropWeight != v28)
  {
    self->_backdropWeight = v28;
    -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0);
  }
  PKSizeAlignedInRect();
  -[PKPaymentSetupDockView setFrame:](self->_dockView, "setFrame:");
  -[UITableView setContentInset:](self->_tableView, "setContentInset:", v35, v34, v18, v36);
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", v35, v34, v18, v36);
  v41.origin.x = v5;
  v41.origin.y = v7;
  v41.size.width = v9;
  v41.size.height = v11;
  -[PKTableHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", CGRectGetWidth(v41), 1.79769313e308);
  if (self->_previousHeaderHeight != v30)
  {
    double v31 = v30;
    self->_previousHeaderHeight = v30;
    -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v29, v30);
    [(UITableView *)self->_tableView _tableHeaderHeightDidChangeToHeight:v31];
  }
  v32 = self->_tableView;
  v33 = [(PKAccountInvitationChooseMemberViewController *)self navigationItem];
  [(UITableView *)v32 pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:v33];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAccountInvitationChooseMemberViewController;
  [(PKAccountInvitationChooseMemberViewController *)&v4 viewDidAppear:a3];
  [(PKAccountInvitationChooseMemberViewController *)self _reportAnalyticsViewDidAppear:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAccountInvitationChooseMemberViewController;
  [(PKAccountInvitationChooseMemberViewController *)&v4 viewDidDisappear:a3];
  [(PKAccountInvitationChooseMemberViewController *)self _reportAnalyticsViewDidAppear:0];
}

- (void)deviceSharingCapabilitiesUpdated:(id)a3 newSharingCapabilties:(id)a4 forAppleID:(id)a5
{
  if (a5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __115__PKAccountInvitationChooseMemberViewController_deviceSharingCapabilitiesUpdated_newSharingCapabilties_forAppleID___block_invoke;
    block[3] = &unk_1E59CA7D0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __115__PKAccountInvitationChooseMemberViewController_deviceSharingCapabilitiesUpdated_newSharingCapabilties_forAppleID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSnapshotAnimated:1];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (a4 < 0
    || ([(UITableViewDiffableDataSource *)self->_diffableDataSource snapshot],
        double v6 = objc_claimAutoreleasedReturnValue(),
        [v6 sectionIdentifiers],
        double v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v6,
        v8 <= a4))
  {
    double v13 = 0;
    goto LABEL_10;
  }
  double v9 = [(UITableViewDiffableDataSource *)self->_diffableDataSource snapshot];
  double v10 = [v9 sectionIdentifiers];
  double v11 = [v10 objectAtIndex:a4];

  double v12 = [v11 identifier];
  if (v12 == @"IneligibleSectionIdentifier")
  {
LABEL_6:
    double v13 = objc_alloc_init(PKFooterHyperlinkView);
    double v15 = PKLocalizedMadisonString(&cfstr_UnavailableFor_1.isa);
    double v16 = PKLocalizedMadisonString(&cfstr_UnavailableFor_2.isa, &stru_1EF1B4C70.isa, v15);
    double v17 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/ht212020?cid=mc-ols-applecard-article_ht212020-campaign-12172020"];
    double v18 = PKAttributedStringByAddingLinkToSubstring(v16, v15, v17);
    [(PKFooterHyperlinkView *)v13 setAttributedText:v18];

    id v19 = &__block_literal_global_47;
    [(PKFooterHyperlinkView *)v13 setAction:&__block_literal_global_47];

    goto LABEL_9;
  }
  double v13 = (PKFooterHyperlinkView *)v12;
  if (v12)
  {
    int v14 = [(__CFString *)v12 isEqualToString:@"IneligibleSectionIdentifier"];

    if (!v14)
    {
      double v13 = 0;
      goto LABEL_9;
    }
    goto LABEL_6;
  }
LABEL_9:

LABEL_10:

  return v13;
}

- (void)tableViewDidFinishReload:(id)a3
{
  id v3 = [(PKAccountInvitationChooseMemberViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(UITableViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:v5];
  if ([v6 isEligible])
  {
    double v7 = [v6 familyMember];
    [(PKAccountInvitationController *)self->_controller setFamilyMember:v7];
    [(PKAccountInvitationController *)self->_controller setAccessLevel:0];
    [(PKAccountInvitationChooseMemberViewController *)self _setLoadingIndexPath:v5];
    controller = self->_controller;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__PKAccountInvitationChooseMemberViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v9[3] = &unk_1E59CB6B0;
    v9[4] = self;
    [(PKAccountInvitationController *)controller nextViewControllerWithCompletion:v9];
  }
}

void __83__PKAccountInvitationChooseMemberViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = *(void **)(a1 + 32);
  if (v5)
  {
    id v8 = [v7 navigationController];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__PKAccountInvitationChooseMemberViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v9[3] = &unk_1E59CB6D8;
    v9[4] = *(void *)(a1 + 32);
    objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v9);
LABEL_5:

    goto LABEL_6;
  }
  [v7 _setLoadingIndexPath:0];
  if (v6)
  {
    id v8 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __83__PKAccountInvitationChooseMemberViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setLoadingIndexPath:0];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  loadingInvitationIndexPath = self->_loadingInvitationIndexPath;
  id v5 = [(UITableViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:a4];
  id v6 = v5;
  if (loadingInvitationIndexPath) {
    LOBYTE(v7) = 0;
  }
  else {
    uint64_t v7 = [v5 isEligible];
  }

  return v7;
}

- (void)didUpdateInvitationControllerFamilyCircle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKAccountInvitationChooseMemberViewController_didUpdateInvitationControllerFamilyCircle__block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __90__PKAccountInvitationChooseMemberViewController_didUpdateInvitationControllerFamilyCircle__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __90__PKAccountInvitationChooseMemberViewController_didUpdateInvitationControllerFamilyCircle__block_invoke_2;
  v3[3] = &unk_1E59CB6D8;
  v3[4] = v1;
  return [v1 _reloadFamilyCollectionWithForceReload:0 completion:v3];
}

uint64_t __90__PKAccountInvitationChooseMemberViewController_didUpdateInvitationControllerFamilyCircle__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) _updateHeaderFooterText];
    id v3 = *(void **)(v2 + 32);
    return [v3 _updateSnapshotAnimated:1];
  }
  return result;
}

- (void)_updateHeaderFooterText
{
  BOOL v3 = [(PKAccountInvitationController *)self->_controller isCurrentFamilyMemberAnOrganizer];
  int64_t v4 = [(PKAccountInvitationController *)self->_controller familyCircleCount];
  BOOL v5 = [(NSArray *)self->_pendingFamilyMembers count] == 0;
  BOOL v6 = v4 < 2;
  id v18 = [(PKPaymentSetupDockView *)self->_dockView footerView];
  [v18 setManualEntryButton:0];
  uint64_t v7 = @"APPLE_CARD_CHOOSE_FAMILY_MEMBER_BODY_NOT_ORGANIZER";
  if (v3) {
    uint64_t v7 = @"APPLE_CARD_CHOOSE_FAMILY_MEMBER_BODY";
  }
  int v8 = v6 && v5;
  if (v6 && v5) {
    double v9 = @"APPLE_CARD_CHOOSE_FAMILY_MEMBER_BODY_NO_FAMILY_CIRCLE";
  }
  else {
    double v9 = v7;
  }
  double v10 = PKLocalizedMadisonString(&v9->isa);
  double v11 = [(PKTableHeaderView *)self->_headerView titleLabel];
  double v12 = PKLocalizedMadisonString(&cfstr_AppleCardChoos_2.isa);
  [v11 setText:v12];

  double v13 = [(PKTableHeaderView *)self->_headerView subtitleLabel];
  [v13 setText:v10];

  if (v8 == 1)
  {
    [v18 setForceShowSetupLaterButton:0];
    int v14 = [(PKPaymentSetupDockView *)self->_dockView primaryButton];
    double v15 = PKLocalizedMadisonString(&cfstr_AddFamilyMembe.isa);
    [v14 setTitle:v15 forState:0];

    double v16 = [(PKPaymentSetupDockView *)self->_dockView primaryButton];
    [v16 addTarget:self action:sel__handleAddPersonTapped forControlEvents:0x2000];
  }
  else
  {
    if (!v3) {
      goto LABEL_11;
    }
    [v18 setForceShowSetupLaterButton:1];
    double v16 = [v18 setupLaterButton];
    double v17 = PKLocalizedMadisonString(&cfstr_AddFamilyMembe.isa);
    [v16 setTitle:v17 forState:0];

    [v16 addTarget:self action:sel__handleAddPersonTapped forControlEvents:0x2000];
    [(PKPaymentSetupDockView *)self->_dockView setPrimaryButton:0];
  }

LABEL_11:
}

- (void)_setLoadingIndexPath:(id)a3
{
  p_loadingInvitationIndexPath = &self->_loadingInvitationIndexPath;
  id v9 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    if (*p_loadingInvitationIndexPath)
    {
      BOOL v6 = -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:");
      [v6 setAccessoryType:1];
      [v6 setAccessoryView:0];
    }
    objc_storeStrong((id *)&self->_loadingInvitationIndexPath, a3);
    if (*p_loadingInvitationIndexPath)
    {
      uint64_t v7 = -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:");
      int v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      [v8 startAnimating];
      [v7 setAccessoryView:v8];
      [v7 setAccessoryType:0];
    }
  }
}

- (void)_reportAnalyticsViewDidAppear:(BOOL)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int64_t v4 = self->_totalFamilyMembers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "memberType", (void)v23);
        switch(v12)
        {
          case 2:
            ++v7;
            break;
          case 1:
            ++v8;
            break;
          case 0:
            ++v9;
            break;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }

  uint64_t v13 = *MEMORY[0x1E4F86308];
  v28[0] = *MEMORY[0x1E4F864A0];
  uint64_t v14 = *MEMORY[0x1E4F85FC8];
  v27[0] = v13;
  v27[1] = v14;
  double v15 = [NSNumber numberWithInteger:v9];
  double v16 = [v15 stringValue];
  v28[1] = v16;
  v27[2] = *MEMORY[0x1E4F85FD8];
  double v17 = [NSNumber numberWithInteger:v8];
  id v18 = [v17 stringValue];
  v28[2] = v18;
  v27[3] = *MEMORY[0x1E4F85FD0];
  id v19 = [NSNumber numberWithInteger:v7];
  CGFloat v20 = [v19 stringValue];
  v28[3] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];

  v22 = [(PKAccountInvitationController *)self->_controller applyController];
  [v22 reportAnalyticsDictionaryForPage:0 pageTag:*MEMORY[0x1E4F85F40] additionalValues:v21];
}

- (void)_handleAddPersonTapped
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(_MergedGlobals_7_3());
  int64_t v4 = off_1EC34A0F0();
  uint64_t v5 = (void *)[v3 initWithEventType:v4];

  [v5 setClientName:@"WalletAppleCard"];
  id v6 = objc_alloc((Class)off_1EC34A0F8());
  uint64_t v7 = [(PKAccountInvitationChooseMemberViewController *)self navigationController];
  uint64_t v8 = (FACircleStateController *)[v6 initWithPresenter:v7];
  stateController = self->_stateController;
  self->_stateController = v8;

  if ((PKRunningInPassbook() & 1) == 0) {
    [(FACircleStateController *)self->_stateController setPresentationType:2];
  }
  uint64_t v10 = self->_stateController;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke;
  v16[3] = &unk_1E59D9620;
  v16[4] = self;
  [(FACircleStateController *)v10 performWithContext:v5 completion:v16];
  uint64_t v11 = *MEMORY[0x1E4F86380];
  uint64_t v12 = *MEMORY[0x1E4F86120];
  v17[0] = *MEMORY[0x1E4F86308];
  v17[1] = v12;
  uint64_t v13 = *MEMORY[0x1E4F85FB0];
  v18[0] = v11;
  v18[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  double v15 = [(PKAccountInvitationController *)self->_controller applyController];
  [v15 reportAnalyticsDictionaryForPage:0 pageTag:*MEMORY[0x1E4F85F40] additionalValues:v14];
}

void __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 success];
  uint64_t v5 = [v3 error];

  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (v4) {
      uint64_t v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v21 = v7;
    __int16 v22 = 2112;
    long long v23 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Presented add family member flow with success %@, error %@", buf, 0x16u);
  }

  char v8 = v4 ^ 1;
  uint64_t v9 = *(id **)(a1 + 32);
  if (v5) {
    char v8 = 1;
  }
  if (v8)
  {
    [v9 _openFamilyMemberSettings];
  }
  else
  {
    uint64_t v10 = (void *)[v9[132] copy];
    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_msgSend(v10, "pk_arrayByApplyingBlock:", &__block_literal_global_92);
    uint64_t v13 = [v11 setWithArray:v12];

    uint64_t v14 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_2;
    v17[3] = &unk_1E59CC188;
    v17[4] = v14;
    id v18 = v10;
    id v19 = v13;
    id v15 = v13;
    id v16 = v10;
    [v14 _reloadFamilyCollectionWithForceReload:1 completion:v17];
  }
}

uint64_t __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_89(uint64_t a1, void *a2)
{
  return [a2 inviteEmail];
}

void __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = (void *)MEMORY[0x1E4F1CAD0];
    int v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1056), "pk_arrayByApplyingBlock:", &__block_literal_global_94);
    uint64_t v5 = [v3 setWithArray:v4];

    id v6 = [MEMORY[0x1E4F1CA80] setWithArray:*(void *)(a1 + 40)];
    [v6 minusSet:v5];
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 134218496;
      uint64_t v24 = v8;
      __int16 v25 = 2048;
      uint64_t v26 = [v5 count];
      __int16 v27 = 2048;
      uint64_t v28 = [v6 count];
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "User completed the family member invite flow. Previous pending email count %ld. Updating Pending Email Count: %ld. Newly invited member count %ld", buf, 0x20u);
    }

    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 1056);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_96;
    v21[3] = &unk_1E59D75E8;
    id v22 = v6;
    id v10 = v6;
    uint64_t v11 = objc_msgSend(v9, "pk_objectsPassingTest:", v21);
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 976) account];
    uint64_t v13 = [v12 accountIdentifier];

    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_2_98;
    id v19 = &unk_1E59D95F8;
    id v20 = v13;
    id v14 = v13;
    id v15 = objc_msgSend(v11, "pk_arrayByApplyingBlock:", &v16);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "didAddAccountPendingFamilyMembers:", v15, v16, v17, v18, v19);
    [*(id *)(a1 + 32) _updateHeaderFooterText];
    [*(id *)(a1 + 32) _updateSnapshotAnimated:1];
  }
}

uint64_t __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 inviteEmail];
}

uint64_t __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_96(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 inviteEmail];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

id __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_2_98(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F84228];
  id v4 = a2;
  uint64_t v5 = (void *)[[v3 alloc] initWithPendingFamilyMember:v4 accountIdentifier:*(void *)(a1 + 32)];

  return v5;
}

- (void)_openFamilyMemberSettings
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v4 setScheme:*MEMORY[0x1E4F87D78]];
  [v4 setHost:@"com.apple.Settings.Family"];
  uint64_t v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v3 = [v4 URL];
  [v2 openSensitiveURL:v3 withOptions:0];
}

- (void)preflightWithCompletion:(id)a3
{
}

- (void)_updateSnapshotAnimated:(BOOL)a3
{
  BOOL v44 = a3;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obj = self->_totalFamilyMembers;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v53 objects:v64 count:16];
  v46 = v4;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v48 = *(void *)v54;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v54 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v53 + 1) + 8 * v7);
        uint64_t v9 = [v8 appleID];
        familyMemberPhotosByAltDSID = self->_familyMemberPhotosByAltDSID;
        uint64_t v11 = [v8 altDSID];
        uint64_t v12 = [(NSDictionary *)familyMemberPhotosByAltDSID objectForKey:v11];

        if ((unint64_t)[v8 age] < self->_minimumParticipantAge)
        {
          uint64_t v13 = [[PKAccountInvitationChooseMemberRow alloc] initWithFamilyMember:v8 photoImage:v12 eligibility:0];
          [v4 addObject:v13];
          goto LABEL_21;
        }
        id v14 = [(PKAccountInvitationController *)self->_controller deviceCapabiltiesManager];
        uint64_t v13 = [v14 currentFetchStatusForAppleID:v9];

        if ((PKPKBroadwayBypassIDSOSCheck() & 1) == 0 && self->_requiredOSVersionRange)
        {
          id v15 = [(PKAccountInvitationChooseMemberRow *)v13 fetchError];
          if (v15
            || ([(PKAccountInvitationChooseMemberRow *)v13 fetchedCapabilities],
                id v15 = objc_claimAutoreleasedReturnValue(),
                ![v15 count]))
          {
          }
          else
          {
            char v22 = [(PKAccountInvitationChooseMemberRow *)v13 hasDeviceVersionWithOSVersionRequirementRange:self->_requiredOSVersionRange];

            if ((v22 & 1) == 0)
            {
              uint64_t v16 = [[PKAccountInvitationChooseMemberRow alloc] initWithFamilyMember:v8 photoImage:v12 eligibility:0];
              id v4 = v46;
              [v46 addObject:v16];
              goto LABEL_20;
            }
          }
        }
        uint64_t v16 = [[PKAccountInvitationChooseMemberRow alloc] initWithFamilyMember:v8 photoImage:v12 eligibility:1];
        [v45 addObject:v16];
        if (PKPKBroadwayBypassIDSOSCheck())
        {
          uint64_t v17 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v61 = v9;
            _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "By-passing IDS requiredOSVersionRange check for %@", buf, 0xCu);
          }
LABEL_18:
          id v4 = v46;
          goto LABEL_19;
        }
        id v18 = [(PKAccountInvitationChooseMemberRow *)v13 fetchError];

        if (v18)
        {
          uint64_t v17 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = [(PKAccountInvitationChooseMemberRow *)v13 fetchError];
            *(_DWORD *)buf = 138412546;
            v61 = v9;
            __int16 v62 = 2112;
            v63 = v19;
            _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "skipping requiredOSVersionRange check for %@ due to a fetch error: %@", buf, 0x16u);
          }
          goto LABEL_18;
        }
        id v20 = [(PKAccountInvitationChooseMemberRow *)v13 fetchedCapabilities];
        uint64_t v21 = [v20 count];

        if (v21)
        {
          id v4 = v46;
          goto LABEL_20;
        }
        uint64_t v17 = PKLogFacilityTypeGetObject();
        id v4 = v46;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v9;
          _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "skipping requiredOSVersionRange check for %@ since we fetched 0 capabilities", buf, 0xCu);
        }
LABEL_19:

LABEL_20:
LABEL_21:

        ++v7;
      }
      while (v6 != v7);
      uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v53 objects:v64 count:16];
      uint64_t v6 = v23;
    }
    while (v23);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v24 = self->_pendingFamilyMembers;
  uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v50 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        pendingFamilyMemberImagesByEmail = self->_pendingFamilyMemberImagesByEmail;
        double v31 = [v29 inviteEmail];
        v32 = [(NSDictionary *)pendingFamilyMemberImagesByEmail objectForKey:v31];

        v33 = [[PKAccountInvitationChooseMemberRow alloc] initWithFamilyMember:v29 photoImage:v32 eligibility:0];
        [v45 addObject:v33];
      }
      uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v26);
  }

  id v34 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  if ([v45 count])
  {
    double v35 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"EligibleSectionIdentifier"];
    double v36 = PKLocalizedMadisonString(&cfstr_ChooseMemberSe.isa);
    [(PKTableViewDiffableDataSourceSection *)v35 setFooter:v36];

    v58 = v35;
    objc_super v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
    [v34 appendSectionsWithIdentifiers:v37];

    CGRect v38 = (void *)[v45 copy];
    [v34 appendItemsWithIdentifiers:v38 intoSectionWithIdentifier:v35];
  }
  CGRect v39 = v46;
  if ([v46 count])
  {
    CGRect v40 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"IneligibleSectionIdentifier"];
    CGRect v41 = PKLocalizedMadisonString(&cfstr_UnavailableFor_3.isa);
    [(PKTableViewDiffableDataSourceSection *)v40 setTitle:v41];

    v57 = v40;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
    [v34 appendSectionsWithIdentifiers:v42];

    v43 = (void *)[v46 copy];
    [v34 appendItemsWithIdentifiers:v43 intoSectionWithIdentifier:v40];

    CGRect v39 = v46;
  }
  [(UITableViewDiffableDataSource *)self->_diffableDataSource applySnapshot:v34 animatingDifferences:v44];
}

- (void)_filterAvailableFamilyMembersFromMembers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isMe", (void)v14) & 1) == 0) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (NSArray *)[v5 copy];
  totalFamilyMembers = self->_totalFamilyMembers;
  self->_totalFamilyMembers = v12;

  [(PKAccountInvitationChooseMemberViewController *)self _updateSnapshotAnimated:1];
}

- (void)_reloadFamilyCollectionWithForceReload:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Reloading the choose member page family members", buf, 2u);
  }

  controller = self->_controller;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__PKAccountInvitationChooseMemberViewController__reloadFamilyCollectionWithForceReload_completion___block_invoke;
  v10[3] = &unk_1E59D9648;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(PKAccountInvitationController *)controller familyMembersForceReload:v4 completion:v10];
}

void __99__PKAccountInvitationChooseMemberViewController__reloadFamilyCollectionWithForceReload_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __99__PKAccountInvitationChooseMemberViewController__reloadFamilyCollectionWithForceReload_completion___block_invoke_2;
  void v18[3] = &unk_1E59D2148;
  uint64_t v13 = *(void **)(a1 + 40);
  v18[4] = *(void *)(a1 + 32);
  id v19 = v11;
  id v20 = v10;
  id v21 = v12;
  id v22 = v9;
  id v23 = v13;
  id v14 = v9;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  dispatch_async(MEMORY[0x1E4F14428], v18);
}

uint64_t __99__PKAccountInvitationChooseMemberViewController__reloadFamilyCollectionWithForceReload_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 984);
  *(void *)(v3 + 984) = v2;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1056), *(id *)(a1 + 48));
  uint64_t v5 = [*(id *)(a1 + 56) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 992);
  *(void *)(v6 + 992) = v5;

  [*(id *)(a1 + 32) _filterAvailableFamilyMembersFromMembers:*(void *)(a1 + 64)];
  uint64_t result = *(void *)(a1 + 72);
  if (result)
  {
    id v9 = *(uint64_t (**)(void))(result + 16);
    return v9();
  }
  return result;
}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  id v5 = a4;
  if ((PKPaymentSetupForceBridgeAppearance() & 1) != 0
    || ([(PKAccountInvitationController *)self->_controller context],
        (PKPaymentSetupContextIsBridge() & 1) != 0))
  {
    int64_t v6 = 2030;
  }
  else if ([v5 userInterfaceStyle] == 2)
  {
    int64_t v6 = 2030;
  }
  else
  {
    int64_t v6 = 2010;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurringView, 0);
  objc_storeStrong((id *)&self->_dockView, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_maximumAccountUsersFormatter, 0);
  objc_storeStrong((id *)&self->_requiredOSVersionRange, 0);
  objc_storeStrong((id *)&self->_pendingFamilyMembers, 0);
  objc_storeStrong((id *)&self->_totalFamilyMembers, 0);
  objc_storeStrong((id *)&self->_loadingInvitationIndexPath, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_ageFormatter, 0);
  objc_storeStrong((id *)&self->_nameFormatter, 0);
  objc_storeStrong((id *)&self->_pendingFamilyMemberImagesByEmail, 0);
  objc_storeStrong((id *)&self->_familyMemberPhotosByAltDSID, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end