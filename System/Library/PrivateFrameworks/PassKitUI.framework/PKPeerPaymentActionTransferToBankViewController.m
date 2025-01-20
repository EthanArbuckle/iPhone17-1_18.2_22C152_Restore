@interface PKPeerPaymentActionTransferToBankViewController
- (BOOL)_isCurrentAmountValid;
- (BOOL)_passViewInNavBar;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (PKPeerPaymentActionTransferToBankViewController)initWithPaymentPass:(id)a3 webService:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_amountPassView;
- (id)_calculateFee;
- (id)_defaultInstantFundsOutPaymentPass;
- (id)_indexPathForAction:(unint64_t)a3;
- (id)_sectionFooterText;
- (id)_spinnerBarButton;
- (id)_transferBarButton;
- (id)presentationSceneIdentifierForPeerPaymentActionController:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4;
- (void)_currentAmountDidChangeTo:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4;
- (void)_dismissViewController:(id)a3;
- (void)_showNavigationBarSpinner:(BOOL)a3;
- (void)_transferBarButtonPressed:(id)a3;
- (void)_updateBarButtonEnabledState;
- (void)_updateCurrentAmount:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4;
- (void)_updateTableHeaderHeight;
- (void)dealloc;
- (void)enterCurrencyAmountPassViewDidLoadPassSnapshot:(id)a3;
- (void)loadView;
- (void)peerPaymentActionController:(id)a3 hasChangedState:(unint64_t)a4;
- (void)setCardBalance:(id)a3;
- (void)setMaxBalance:(id)a3;
- (void)setMaxLoadAmount:(id)a3;
- (void)setMinBalance:(id)a3;
- (void)setMinLoadAmount:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateAccountValues;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPeerPaymentActionTransferToBankViewController

- (PKPeerPaymentActionTransferToBankViewController)initWithPaymentPass:(id)a3 webService:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6
{
  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  v6 = [(PKPeerPaymentActionViewController *)&v22 initWithPaymentPass:a3 webService:a4 passLibraryDataProvider:a5 context:a6];
  v7 = v6;
  if (v6)
  {
    v8 = [(PKPeerPaymentActionViewController *)v6 account];
    v9 = [v8 currentBalance];
    v10 = [v9 currency];
    uint64_t v11 = PKMutableNumberFormatterForCurrencyCode();
    currencyFormatter = v7->_currencyFormatter;
    v7->_currencyFormatter = (NSNumberFormatter *)v11;

    v13 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    percentageFormatter = v7->_percentageFormatter;
    v7->_percentageFormatter = v13;

    [(NSNumberFormatter *)v7->_percentageFormatter setNumberStyle:3];
    [(NSNumberFormatter *)v7->_percentageFormatter setMaximumFractionDigits:1];
    uint64_t v15 = [(PKPeerPaymentActionTransferToBankViewController *)v7 _defaultInstantFundsOutPaymentPass];
    defaultInstantFundsOutPaymentPass = v7->_defaultInstantFundsOutPaymentPass;
    v7->_defaultInstantFundsOutPaymentPass = (PKPaymentPass *)v15;

    v7->_isSmallPhone = PKUIGetMinScreenWidthType() == 0;
    [(PKPeerPaymentActionViewController *)v7 setControllerAction:0];
    v17 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    v7->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v17, (UIContentSizeCategory)*MEMORY[0x1E4FB27D0]) == NSOrderedDescending;

    [(PKPeerPaymentActionViewController *)v7 setShowCancelButton:0];
    v18 = [(PKPeerPaymentActionTransferToBankViewController *)v7 navigationItem];
    v19 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPer_5.isa);
    [v18 setTitle:v19];

    v20 = [(PKPeerPaymentActionTransferToBankViewController *)v7 _transferBarButton];
    [v18 setRightBarButtonItem:v20];

    [(PKPeerPaymentActionTransferToBankViewController *)v7 _updateBarButtonEnabledState];
    objc_msgSend(v18, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v18, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  }
  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  [(PKPeerPaymentActionViewController *)&v2 dealloc];
}

- (void)loadView
{
  v41.receiver = self;
  v41.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  [(PKPeerPaymentActionViewController *)&v41 loadView];
  v3 = [(PKPeerPaymentActionViewController *)self account];
  v4 = objc_alloc_init(PKPassSnapshotter);
  v5 = [(PKPeerPaymentActionViewController *)self currentAmount];
  v6 = [v3 currentBalance];
  v7 = [v6 currency];
  v8 = PKCurrencyAmountCreate(v5, v7);

  BOOL v9 = [(PKPeerPaymentActionTransferToBankViewController *)self _passViewInNavBar];
  BOOL v10 = v9;
  if (v9)
  {
    uint64_t v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    navbarPassView = self->_navbarPassView;
    self->_navbarPassView = v11;

    [(UIImageView *)self->_navbarPassView setContentMode:1];
    [(UIImageView *)self->_navbarPassView setAccessibilityIgnoresInvertColors:1];
    v13 = [(PKPeerPaymentActionViewController *)self pass];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __59__PKPeerPaymentActionTransferToBankViewController_loadView__block_invoke;
    v40[3] = &unk_1E59CA898;
    v40[4] = self;
    -[PKPassSnapshotter snapshotWithPass:size:completion:](v4, "snapshotWithPass:size:completion:", v13, v40, 55.0, 55.0);

    v14 = objc_alloc_init(PKAnimatedNavigationBarTitleView);
    passNavbarTitleView = self->_passNavbarTitleView;
    self->_passNavbarTitleView = v14;

    v16 = [(PKPeerPaymentActionTransferToBankViewController *)self navigationItem];
    objc_msgSend(v16, "pkui_setCenterAlignedTitleView:", self->_passNavbarTitleView);

    v17 = [PKEnterCurrencyAmountPassTableHeaderFooterView alloc];
    v18 = 0;
  }
  else
  {
    v17 = [PKEnterCurrencyAmountPassTableHeaderFooterView alloc];
    v18 = [(PKPeerPaymentActionViewController *)self pass];
  }
  v19 = [(PKEnterCurrencyAmountPassTableHeaderFooterView *)v17 initWithCurrenyAmount:v8 pass:v18];
  tableHeaderView = self->_tableHeaderView;
  self->_tableHeaderView = v19;

  if (!v10) {
  [(PKEnterCurrencyAmountPassTableHeaderFooterView *)self->_tableHeaderView setDelegate:self];
  }
  id v21 = objc_alloc(MEMORY[0x1E4FB1D00]);
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1);
  double v23 = *MEMORY[0x1E4F1DB28];
  double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v27 = (UITableView *)objc_msgSend(v21, "initWithFrame:style:", v22, *MEMORY[0x1E4F1DB28], v24, v25, v26);
  tableView = self->_tableView;
  self->_tableView = v27;

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  v29 = self->_tableView;
  v30 = [MEMORY[0x1E4FB1618] clearColor];
  [(UITableView *)v29 setBackgroundColor:v30];

  [(UITableView *)self->_tableView setRowHeight:*MEMORY[0x1E4FB2F28]];
  [(UITableView *)self->_tableView setTableHeaderView:self->_tableHeaderView];
  [(UITableView *)self->_tableView _setDrawsSeparatorAtTopOfSections:1];
  [(UITableView *)self->_tableView _setDrawsTopShadowInGroupedSections:1];
  v31 = self->_tableView;
  id v32 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(UITableView *)v31 setTableFooterView:v32];

  uint64_t v33 = *MEMORY[0x1E4F85B00];
  [(UITableView *)self->_tableView setAccessibilityIdentifier:*MEMORY[0x1E4F85B00]];
  if (PKPeerPaymentFDICSignageEnabled() && PKPeerPaymentAccountIsFDICInsured())
  {
    v34 = [[PKFDICSignageView alloc] initWithFeature:1 displayingBankName:1];
    fdicView = self->_fdicView;
    self->_fdicView = v34;

    v36 = -[PKDashboardViewControllerFooterContainer initWithFrame:]([PKDashboardViewControllerFooterContainer alloc], "initWithFrame:", v23, v24, v25, v26);
    footerContainer = self->_footerContainer;
    self->_footerContainer = v36;

    [(PKDashboardViewControllerFooterContainer *)self->_footerContainer setMinimumFooterHeight:0.0];
    [(PKDashboardViewControllerFooterContainer *)self->_footerContainer setCurrentFooter:self->_fdicView];
  }
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"PKPeerPaymentActionTransferToBankFooterReuseIdentifier"];
  v38 = [(PKPeerPaymentActionTransferToBankViewController *)self view];
  [v38 addSubview:self->_tableView];
  if (self->_footerContainer) {
    objc_msgSend(v38, "addSubview:");
  }
  [(PKPeerPaymentActionTransferToBankViewController *)self updateAccountValues];
  v39 = [(PKPeerPaymentActionTransferToBankViewController *)self view];
  [v39 setAccessibilityIdentifier:v33];
}

void __59__PKPeerPaymentActionTransferToBankViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PKPeerPaymentActionTransferToBankViewController_loadView__block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __59__PKPeerPaymentActionTransferToBankViewController_loadView__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1144) setImage:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 1128) setTitleView:*(void *)(*(void *)(a1 + 32) + 1144) animated:0];
  id v2 = [*(id *)(a1 + 32) viewIfLoaded];
  [v2 setNeedsLayout];
}

- (void)viewWillLayoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  [(PKPeerPaymentActionTransferToBankViewController *)&v44 viewWillLayoutSubviews];
  id v3 = [(PKPeerPaymentActionTransferToBankViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 bounds];
  double v13 = v7 + v12;
  double v15 = v5 + v14;
  double v17 = v16 - (v7 + v11);
  double v19 = v18 - (v5 + v9);
  if ([(PKPeerPaymentActionTransferToBankViewController *)self _passViewInNavBar])
  {
    v20 = [(PKPeerPaymentActionTransferToBankViewController *)self navigationController];
    id v21 = [v20 navigationBar];

    [v21 frame];
    -[PKAnimatedNavigationBarTitleView setFrame:](self->_passNavbarTitleView, "setFrame:", 0.0, 0.0, v22 + v22);
  }
  -[UITableView setFrame:](self->_tableView, "setFrame:", v13, v15, v17, v19);
  [(PKPeerPaymentActionTransferToBankViewController *)self _updateTableHeaderHeight];
  if (self->_footerContainer)
  {
    double v23 = PKTableViewCellTextInset();
    [(UITableView *)self->_tableView _sectionContentInset];
    -[PKFDICSignageView setContentInsets:](self->_fdicView, "setContentInsets:", 12.0, v23 + v24, 12.0, v23 + v25);
    -[PKDashboardViewControllerFooterContainer sizeThatFits:](self->_footerContainer, "sizeThatFits:", v17, v19);
    double v27 = v26;
    double v29 = v28;
    v45.origin.x = v13;
    v45.origin.y = v15;
    v45.size.width = v17;
    v45.size.height = v19;
    -[PKDashboardViewControllerFooterContainer setFrame:](self->_footerContainer, "setFrame:", v13, CGRectGetMaxY(v45) - v29, v27, v9 + v29);
    [(UITableView *)self->_tableView contentInset];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    [(UITableView *)self->_tableView verticalScrollIndicatorInsets];
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    -[UITableView setContentInset:](self->_tableView, "setContentInset:", v31, v33, v29, v35);
    -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", v37, v39, v29, v41);
  }
  tableView = self->_tableView;
  v43 = [(PKPeerPaymentActionTransferToBankViewController *)self navigationItem];
  [(UITableView *)tableView pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:v43];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"PKPeerPaymentActionTransferToBankCellReuseIdentifier"];
  unint64_t v8 = [(PKPeerPaymentActionViewController *)self controllerAction];
  supportedTransferActions = self->_supportedTransferActions;
  uint64_t v10 = [v6 row];

  double v11 = [(NSArray *)supportedTransferActions objectAtIndex:v10];
  uint64_t v12 = [v11 integerValue];

  if (!v7) {
    double v7 = [[PKPeerPaymentActionTransferToBankCell alloc] initWithReuseIdentifier:@"PKPeerPaymentActionTransferToBankCellReuseIdentifier"];
  }
  if (v12 == 3)
  {
    double v16 = [(PKPeerPaymentActionViewController *)self actionController];
    double v17 = [v16 bankInformation];

    if ([v17 isValid])
    {
      double v14 = [v17 bankName];
      double v18 = NSString;
      double v19 = PKPANMask();
      v20 = [v17 accountSuffix];
      double v15 = [v18 stringWithFormat:@"%@ %@", v19, v20];
    }
    else
    {
      double v14 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_14.isa);
      double v15 = 0;
    }
    id v21 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_15.isa);
    double v23 = @"PEER_PAYMENT_TRANSFER_TO_BANK_ACCOUNT_CELL_FEE";
    goto LABEL_16;
  }
  if (v12 == 2)
  {
    defaultInstantFundsOutPaymentPass = self->_defaultInstantFundsOutPaymentPass;
    if (defaultInstantFundsOutPaymentPass)
    {
      double v14 = [(PKPaymentPass *)defaultInstantFundsOutPaymentPass organizationName];
      double v15 = PKSanitizedPrimaryAccountRepresentationForPass();
    }
    else
    {
      double v14 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_10.isa);
      double v15 = 0;
    }
    id v21 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_11.isa);
    double v17 = [(PKPeerPaymentActionTransferToBankViewController *)self _calculateFee];
    if (v17)
    {
      double v24 = [(NSNumberFormatter *)self->_currencyFormatter stringFromNumber:v17];
      double v22 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_12.isa, &stru_1EF1B4C70.isa, v24);

LABEL_17:
      goto LABEL_18;
    }
    double v23 = @"PEER_PAYMENT_TRANSFER_TO_BANK_DEBIT_CARD_CELL_FEE_DEFAULT";
LABEL_16:
    double v22 = PKLocalizedPeerPaymentString(&v23->isa);
    goto LABEL_17;
  }
  double v14 = 0;
  double v15 = 0;
  id v21 = 0;
  double v22 = 0;
LABEL_18:
  if ([v15 length] && objc_msgSend(v21, "length"))
  {
    id v25 = [NSString stringWithFormat:@"%@\n%@", v15, v21];
  }
  else
  {
    if (![v21 length]) {
      goto LABEL_24;
    }
    id v25 = v21;
  }
  id v26 = v25;

  double v15 = v26;
LABEL_24:
  [(PKPeerPaymentActionTransferToBankCell *)v7 setTitleText:v14];
  [(PKPeerPaymentActionTransferToBankCell *)v7 setSubtitleText:v15];
  [(PKPeerPaymentActionTransferToBankCell *)v7 setFeeText:v22];
  [(PKPeerPaymentActionTransferToBankCell *)v7 setShowCheckmark:v12 == v8];
  double v27 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [(PKPeerPaymentActionTransferToBankCell *)v7 setBackgroundColor:v27];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  double v7 = -[NSArray objectAtIndex:](self->_supportedTransferActions, "objectAtIndex:", [v6 row]);
  uint64_t v8 = [v7 integerValue];

  unint64_t v9 = [(PKPeerPaymentActionViewController *)self controllerAction];
  uint64_t v10 = [(PKPeerPaymentActionViewController *)self actionController];
  if (v8 != v9)
  {
    double v11 = [(PKPeerPaymentActionTransferToBankViewController *)self _indexPathForAction:v8];
    uint64_t v12 = [(PKPeerPaymentActionTransferToBankViewController *)self _indexPathForAction:v9];
    [v10 setControllerAction:v8];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v13 safelyAddObject:v11];
    [v13 safelyAddObject:v12];
    double v14 = (void *)[v13 copy];
    [v18 reloadRowsAtIndexPaths:v14 withRowAnimation:100];
  }
  [v18 deselectRowAtIndexPath:v6 animated:1];
  [(PKPeerPaymentActionTransferToBankViewController *)self _updateBarButtonEnabledState];
  if (v8 == 3)
  {
    double v16 = [v10 bankInformation];
    char v17 = [v16 isValid];

    if (v17) {
      goto LABEL_10;
    }
    double v15 = [(PKPeerPaymentActionViewController *)self actionController];
    [v15 presentAddBankAccountViewController];
    goto LABEL_9;
  }
  if (v8 == 2 && !self->_defaultInstantFundsOutPaymentPass)
  {
    double v15 = [(PKPeerPaymentActionViewController *)self actionController];
    [v15 presentAddDebitCardViewController];
LABEL_9:
  }
LABEL_10:
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  double v5 = objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", @"PKPeerPaymentActionTransferToBankFooterReuseIdentifier", a4);
  id v6 = [MEMORY[0x1E4FB1948] footerConfiguration];
  double v7 = [(PKPeerPaymentActionTransferToBankViewController *)self _sectionFooterText];
  [v6 setText:v7];

  uint64_t v8 = [v6 textProperties];
  unint64_t v9 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28D8], (NSString *)*MEMORY[0x1E4FB2790]);
  [v8 setFont:v9];

  uint64_t v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v8 setColor:v10];

  [v5 setContentConfiguration:v6];
  [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F855A8]];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_supportedTransferActions count];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  id v5 = a4;
  if ((PKPaymentSetupForceBridgeAppearance() & 1) != 0
    || ([(PKPeerPaymentActionViewController *)self context], (PKPaymentSetupContextIsBridge() & 1) != 0))
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

- (void)peerPaymentActionController:(id)a3 hasChangedState:(unint64_t)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  -[PKPeerPaymentActionViewController peerPaymentActionController:hasChangedState:](&v16, sel_peerPaymentActionController_hasChangedState_, a3);
  switch(a4)
  {
    case 1uLL:
      int64_t v6 = [(PKPeerPaymentActionTransferToBankViewController *)self navigationController];
      [v6 dismissViewControllerAnimated:1 completion:0];

      [(PKPeerPaymentActionTransferToBankViewController *)self _showNavigationBarSpinner:0];
LABEL_6:
      [(PKPeerPaymentActionTransferToBankViewController *)self _showNavigationBarSpinner:0];
      double v7 = [(PKPeerPaymentActionViewController *)self actionController];
      uint64_t v8 = [v7 controllerAction];
      if (v8 == 3)
      {
        id v13 = [v7 bankInformation];
        char v14 = [v13 isValid];

        if (v14)
        {
LABEL_13:
          [(PKPeerPaymentActionTransferToBankViewController *)self _updateBarButtonEnabledState];

          return;
        }
        [v7 setControllerAction:0];
        tableView = self->_tableView;
        uint64_t v10 = [(PKPeerPaymentActionTransferToBankViewController *)self _indexPathForAction:3];
        char v17 = v10;
        double v11 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v12 = &v17;
      }
      else
      {
        if (v8 != 2 || self->_defaultInstantFundsOutPaymentPass) {
          goto LABEL_13;
        }
        [v7 setControllerAction:0];
        tableView = self->_tableView;
        uint64_t v10 = [(PKPeerPaymentActionTransferToBankViewController *)self _indexPathForAction:2];
        v18[0] = v10;
        double v11 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v12 = (void **)v18;
      }
      double v15 = [v11 arrayWithObjects:v12 count:1];
      [(UITableView *)tableView reloadRowsAtIndexPaths:v15 withRowAnimation:0];

      goto LABEL_13;
    case 5uLL:
      goto LABEL_6;
    case 2uLL:
      [(PKPeerPaymentActionTransferToBankViewController *)self _showNavigationBarSpinner:0];
      break;
  }
}

- (id)presentationSceneIdentifierForPeerPaymentActionController:(id)a3
{
  id v3 = [(PKPeerPaymentActionTransferToBankViewController *)self view];
  double v4 = [v3 window];
  id v5 = [v4 windowScene];
  int64_t v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)updateAccountValues
{
  v36.receiver = self;
  v36.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  [(PKPeerPaymentActionViewController *)&v36 updateAccountValues];
  id v3 = [(PKPeerPaymentActionViewController *)self account];
  double v4 = [(PKPeerPaymentActionTransferToBankViewController *)self _defaultInstantFundsOutPaymentPass];
  defaultInstantFundsOutPaymentPass = self->_defaultInstantFundsOutPaymentPass;
  self->_defaultInstantFundsOutPaymentPass = v4;

  if (v3)
  {
    int64_t v6 = [v3 currentBalance];
    double v7 = [v6 amount];
    [(PKPeerPaymentActionTransferToBankViewController *)self setMaxBalance:v7];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v3 supportsInstantWithdrawal])
    {
      [v8 addObject:&unk_1EF2B99F0];
      unint64_t v9 = [v3 instantWithdrawalPromotionFeatureDescriptor];
      uint64_t v10 = [v9 feePercentage];
      feePercentage = self->_feePercentage;
      self->_feePercentage = v10;

      uint64_t v12 = [v9 minimumFee];
      minimumFee = self->_minimumFee;
      self->_minimumFee = v12;

      char v14 = [v9 maximumFee];
      maximumFee = self->_maximumFee;
      self->_maximumFee = v14;
    }
    if ([v3 supportsTransferToBank]) {
      [v8 addObject:&unk_1EF2B9A08];
    }
    objc_super v16 = (NSArray *)[v8 copy];
    supportedTransferActions = self->_supportedTransferActions;
    self->_supportedTransferActions = v16;

    if ([(NSArray *)self->_supportedTransferActions count] != 1) {
      goto LABEL_12;
    }
    id v18 = [(PKPeerPaymentActionViewController *)self actionController];
    double v19 = [(NSArray *)self->_supportedTransferActions objectAtIndex:0];
    uint64_t v20 = [v19 integerValue];

    if (v20 == 3)
    {
      double v34 = [v18 bankInformation];
      int v35 = [v34 isValid];

      if (!v35) {
        goto LABEL_11;
      }
    }
    else if (v20 != 2 || !self->_defaultInstantFundsOutPaymentPass)
    {
      goto LABEL_11;
    }
    [v18 setControllerAction:v20];
LABEL_11:

LABEL_12:
    id v21 = [(PKPeerPaymentActionTransferToBankViewController *)self _amountPassView];
    double v22 = [v21 enterCurrencyAmountView];

    double v23 = [v3 currentBalance];
    double v24 = [v23 currency];
    [v22 setCurrency:v24];

    [v22 sizeToFit];
    id v25 = [(PKPeerPaymentActionTransferToBankViewController *)self _amountPassView];
    id v26 = [v25 balanceView];

    double v27 = [v6 currency];
    [v26 setCurrencyCode:v27];

    double v28 = [(PKPeerPaymentActionViewController *)self maxLoadAmount];
    [v26 setMaxLoadAmount:v28];

    double v29 = [(PKPeerPaymentActionViewController *)self minLoadAmount];
    [v26 setMinLoadAmount:v29];

    [v26 setMaxBalance:v7];
    double v30 = [(PKPeerPaymentActionViewController *)self minBalance];
    [v26 setMinBalance:v30];

    double v31 = [v6 amount];
    [v26 setCardBalance:v31];

    [v26 sizeToFit];
    double v32 = [(PKPeerPaymentActionViewController *)self currentAmount];
    [(PKPeerPaymentActionTransferToBankViewController *)self _updateCurrentAmount:v32 shouldGenerateNewSuggestions:1];

    double v33 = [(PKPeerPaymentActionTransferToBankViewController *)self viewIfLoaded];
    [v33 setNeedsLayout];
  }
  [(UITableView *)self->_tableView reloadData];
  [(PKPeerPaymentActionTransferToBankViewController *)self _updateBarButtonEnabledState];
}

- (void)enterCurrencyAmountPassViewDidLoadPassSnapshot:(id)a3
{
  [(PKPeerPaymentActionTransferToBankViewController *)self _updateTableHeaderHeight];
  id v4 = [(PKPeerPaymentActionTransferToBankViewController *)self viewIfLoaded];
  [v4 setNeedsLayout];
}

- (void)setMaxBalance:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self maxBalance];
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  [(PKPeerPaymentActionViewController *)&v9 setMaxBalance:v4];
  if (v5 != v4 && ([v4 isEqualToNumber:v5] & 1) == 0)
  {
    int64_t v6 = [(PKPeerPaymentActionTransferToBankViewController *)self _amountPassView];
    double v7 = [v6 balanceView];
    [v7 setMaxBalance:v4];

    id v8 = [(PKPeerPaymentActionViewController *)self currentAmount];
    [(PKPeerPaymentActionTransferToBankViewController *)self _updateCurrentAmount:v8 shouldGenerateNewSuggestions:1];
  }
}

- (void)setMinBalance:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self minBalance];
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  [(PKPeerPaymentActionViewController *)&v9 setMinBalance:v4];
  if (v5 != v4 && ([v4 isEqualToNumber:v5] & 1) == 0)
  {
    int64_t v6 = [(PKPeerPaymentActionTransferToBankViewController *)self _amountPassView];
    double v7 = [v6 balanceView];
    [v7 setMinBalance:v4];

    id v8 = [(PKPeerPaymentActionViewController *)self currentAmount];
    [(PKPeerPaymentActionTransferToBankViewController *)self _updateCurrentAmount:v8 shouldGenerateNewSuggestions:1];
  }
}

- (void)setMaxLoadAmount:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self maxLoadAmount];
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  [(PKPeerPaymentActionViewController *)&v9 setMaxLoadAmount:v4];
  if (v5 != v4 && ([v4 isEqualToNumber:v5] & 1) == 0)
  {
    int64_t v6 = [(PKPeerPaymentActionTransferToBankViewController *)self _amountPassView];
    double v7 = [v6 balanceView];
    [v7 setMaxLoadAmount:v4];

    id v8 = [(PKPeerPaymentActionViewController *)self currentAmount];
    [(PKPeerPaymentActionTransferToBankViewController *)self _updateCurrentAmount:v8 shouldGenerateNewSuggestions:1];
  }
}

- (void)setMinLoadAmount:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self minLoadAmount];
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  [(PKPeerPaymentActionViewController *)&v9 setMinLoadAmount:v4];
  if (v5 != v4 && ([v4 isEqualToNumber:v5] & 1) == 0)
  {
    int64_t v6 = [(PKPeerPaymentActionTransferToBankViewController *)self _amountPassView];
    double v7 = [v6 balanceView];
    [v7 setMinLoadAmount:v4];

    id v8 = [(PKPeerPaymentActionViewController *)self currentAmount];
    [(PKPeerPaymentActionTransferToBankViewController *)self _updateCurrentAmount:v8 shouldGenerateNewSuggestions:1];
  }
}

- (void)setCardBalance:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self cardBalance];
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  [(PKPeerPaymentActionViewController *)&v9 setCardBalance:v4];
  if (v5 != v4 && ([v4 isEqualToNumber:v5] & 1) == 0)
  {
    int64_t v6 = [(PKPeerPaymentActionTransferToBankViewController *)self _amountPassView];
    double v7 = [v6 balanceView];
    [v7 setCardBalance:v4];

    id v8 = [(PKPeerPaymentActionViewController *)self currentAmount];
    [(PKPeerPaymentActionTransferToBankViewController *)self _updateCurrentAmount:v8 shouldGenerateNewSuggestions:1];
  }
}

- (id)_transferBarButton
{
  id v3 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPer_6.isa);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v3 style:2 target:self action:sel__transferBarButtonPressed_];
  [v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85AF8]];

  return v4;
}

- (id)_spinnerBarButton
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v2];
  [v2 startAnimating];

  return v3;
}

- (void)_updateBarButtonEnabledState
{
  id v3 = [(PKPeerPaymentActionTransferToBankViewController *)self navigationItem];
  id v11 = [v3 rightBarButtonItem];

  id v4 = [(PKPeerPaymentActionViewController *)self account];

  if (v4)
  {
    BOOL v5 = [(PKPeerPaymentActionTransferToBankViewController *)self _isCurrentAmountValid];
    unint64_t v6 = [(PKPeerPaymentActionViewController *)self controllerAction];
    if (v6 == 2)
    {
      unsigned int v9 = self->_defaultInstantFundsOutPaymentPass != 0;
    }
    else if (v6 == 3)
    {
      double v7 = [(PKPeerPaymentActionViewController *)self actionController];
      id v8 = [v7 bankInformation];
      unsigned int v9 = [v8 isValid];
    }
    else
    {
      unsigned int v9 = 0;
    }
    uint64_t v10 = v5 & v9;
  }
  else
  {
    uint64_t v10 = 0;
  }
  [v11 setEnabled:v10];
}

- (void)_transferBarButtonPressed:(id)a3
{
  [(PKPeerPaymentActionTransferToBankViewController *)self _showNavigationBarSpinner:1];
  id v9 = [(PKPeerPaymentActionViewController *)self currentAmount];
  id v4 = [(PKPeerPaymentActionViewController *)self account];
  BOOL v5 = [v4 currentBalance];
  unint64_t v6 = [v5 currency];

  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:v9 currency:v6 exponent:0];
  id v8 = [(PKPeerPaymentActionViewController *)self actionController];
  [v8 performActionWithCurrencyAmount:v7];
}

- (void)_updateCurrentAmount:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(PKPeerPaymentActionViewController *)self setCurrentAmount:v6];
  id v9 = [(PKPeerPaymentActionTransferToBankViewController *)self _amountPassView];
  double v7 = [v9 balanceView];
  [v7 subtractAmountFromBalance:v6];

  id v8 = [v9 enterCurrencyAmountView];
  [v8 setCurrentAmount:v6];

  [(PKPeerPaymentActionTransferToBankViewController *)self _currentAmountDidChangeTo:v6 shouldGenerateNewSuggestions:v4];
}

- (void)_currentAmountDidChangeTo:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4
{
  [(PKPeerPaymentActionTransferToBankViewController *)self _updateBarButtonEnabledState];
  id v5 = [(PKPeerPaymentActionTransferToBankViewController *)self viewIfLoaded];
  [v5 setNeedsLayout];
}

- (BOOL)_isCurrentAmountValid
{
  id v3 = [(PKPeerPaymentActionViewController *)self currentAmount];
  BOOL v4 = [(PKPeerPaymentActionViewController *)self cardBalance];
  id v5 = [(PKPeerPaymentActionViewController *)self minBalance];
  id v6 = [(PKPeerPaymentActionViewController *)self maxBalance];
  double v7 = [(PKPeerPaymentActionViewController *)self minLoadAmount];
  id v8 = [(PKPeerPaymentActionViewController *)self maxLoadAmount];
  id v9 = [v4 decimalNumberBySubtracting:v3];
  uint64_t v10 = [MEMORY[0x1E4F28C28] notANumber];
  char v11 = [v3 isEqualToNumber:v10];

  uint64_t v12 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v13 = [v3 compare:v12];

  if (!v13
    || v8 && [v8 compare:v3] == -1
    || v7 && [v7 compare:v3] == 1
    || v5 && [v5 compare:v9] == 1)
  {
    char v14 = 0;
  }
  else
  {
    char v14 = v11 ^ 1;
    if (v6 && [v6 compare:v9] == -1) {
      char v14 = 0;
    }
  }

  return v14;
}

- (BOOL)_passViewInNavBar
{
  return self->_isSmallPhone || self->_usesAccessibilityLayout;
}

- (id)_indexPathForAction:(unint64_t)a3
{
  supportedTransferActions = self->_supportedTransferActions;
  BOOL v4 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v5 = [(NSArray *)supportedTransferActions indexOfObject:v4];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28D58] indexPathForRow:v5 inSection:0];
  }

  return v6;
}

- (id)_calculateFee
{
  if (self->_feePercentage)
  {
    id v3 = [(PKPeerPaymentActionViewController *)self currentAmount];
    BOOL v4 = PKCurrencyDecimalAmountMultiplyAndRound();

    if (self->_maximumFee && objc_msgSend(v4, "compare:") == 1)
    {
      uint64_t v5 = self->_maximumFee;

      BOOL v4 = v5;
    }
    if (self->_minimumFee && objc_msgSend(v4, "compare:") == -1)
    {
      id v6 = self->_minimumFee;

      BOOL v4 = v6;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_updateTableHeaderHeight
{
  [(UITableView *)self->_tableView bounds];
  double v4 = v3;
  [(PKEnterCurrencyAmountPassTableHeaderFooterView *)self->_tableHeaderView frame];
  double v6 = v5;
  double v8 = v7;
  -[PKEnterCurrencyAmountPassTableHeaderFooterView sizeThatFits:](self->_tableHeaderView, "sizeThatFits:", v4, 1.79769313e308);
  if (v6 != v10 || v8 != v9)
  {
    double v12 = v9;
    tableHeaderView = self->_tableHeaderView;
    [(UITableView *)self->_tableView _rectForTableHeaderView];
    -[PKEnterCurrencyAmountPassTableHeaderFooterView setBounds:](tableHeaderView, "setBounds:");
    [(UITableView *)self->_tableView _tableHeaderHeightDidChangeToHeight:v12];
    id v14 = [(PKPeerPaymentActionTransferToBankViewController *)self viewIfLoaded];
    [v14 setNeedsLayout];
  }
}

- (id)_amountPassView
{
  return [(PKEnterCurrencyAmountPassTableHeaderFooterView *)self->_tableHeaderView amountPassView];
}

- (id)_sectionFooterText
{
  double v3 = [(PKPeerPaymentActionViewController *)self account];
  int v4 = [v3 supportsInstantWithdrawal];

  if (!v4)
  {
    double v10 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_22.isa);
    goto LABEL_15;
  }
  double v5 = [(NSNumberFormatter *)self->_percentageFormatter stringFromNumber:self->_feePercentage];
  double v6 = [(NSNumberFormatter *)self->_currencyFormatter stringFromNumber:self->_maximumFee];
  uint64_t v7 = [(NSNumberFormatter *)self->_currencyFormatter stringFromNumber:self->_minimumFee];
  double v8 = (void *)v7;
  if (self->_feePercentage)
  {
    minimumFee = self->_minimumFee;
    if (self->_maximumFee)
    {
      if (minimumFee)
      {
        PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_17.isa, &stru_1EF1B9A70.isa, v5, v7, v6);
        uint64_t v11 = LABEL_13:;
        goto LABEL_14;
      }
      id v14 = v5;
      double v15 = v6;
      double v12 = @"PEER_PAYMENT_TRANSFER_TO_BANK_FOOTER_TEXT_SUPPORTS_INSTANT_TRANSFER_FEE_WITH_MAXIMUM";
    }
    else
    {
      if (!minimumFee)
      {
        PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_20.isa, &stru_1EF1B4C70.isa, v5);
        goto LABEL_13;
      }
      id v14 = v5;
      double v15 = (void *)v7;
      double v12 = @"PEER_PAYMENT_TRANSFER_TO_BANK_FOOTER_TEXT_SUPPORTS_INSTANT_TRANSFER_FEE_WITH_MINIMUM";
    }
    PKLocalizedPeerPaymentString(&v12->isa, &stru_1EF1B5770.isa, v14, v15);
    goto LABEL_13;
  }
  uint64_t v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra_21.isa);
LABEL_14:
  double v10 = (void *)v11;

LABEL_15:

  return v10;
}

- (id)_defaultInstantFundsOutPaymentPass
{
  double v3 = [(PKPeerPaymentActionViewController *)self account];
  int v4 = [v3 supportsInstantWithdrawal];

  if (v4)
  {
    double v5 = [(PKPeerPaymentActionViewController *)self account];
    double v6 = [v5 instantWithdrawalPromotionFeatureDescriptor];

    id v7 = objc_alloc_init(MEMORY[0x1E4F84DF0]);
    double v8 = [v6 supportedNetworks];
    [v7 setSupportedNetworks:v8];

    [v7 setSupportsInstantFundsIn:1];
    double v9 = [MEMORY[0x1E4F84898] sharedInstance];
    double v10 = [v9 _defaultPaymentPassForPaymentRequest:v7];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)_dismissViewController:(id)a3
{
  id v6 = a3;
  int v4 = [v6 presentingViewController];

  if (v4) {
    [v6 presentingViewController];
  }
  else {
  double v5 = [(PKPeerPaymentActionTransferToBankViewController *)self navigationController];
  }
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)_showNavigationBarSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PKPeerPaymentActionTransferToBankViewController *)self _amountPassView];
  id v6 = [v5 enterCurrencyAmountView];
  BOOL v7 = !v3;
  [v6 setEnabled:!v3];

  [(UITableView *)self->_tableView setAllowsSelection:!v3];
  double v8 = [(PKPeerPaymentActionTransferToBankViewController *)self navigationItem];
  if (v7) {
    [(PKPeerPaymentActionTransferToBankViewController *)self _transferBarButton];
  }
  else {
  double v9 = [(PKPeerPaymentActionTransferToBankViewController *)self _spinnerBarButton];
  }
  [v8 setRightBarButtonItem:v9];

  [(PKPeerPaymentActionTransferToBankViewController *)self _updateBarButtonEnabledState];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumFee, 0);
  objc_storeStrong((id *)&self->_minimumFee, 0);
  objc_storeStrong((id *)&self->_feePercentage, 0);
  objc_storeStrong((id *)&self->_footerContainer, 0);
  objc_storeStrong((id *)&self->_fdicView, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_navbarPassView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_passNavbarTitleView, 0);
  objc_storeStrong((id *)&self->_defaultInstantFundsOutPaymentPass, 0);
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
  objc_storeStrong((id *)&self->_currencyFormatter, 0);

  objc_storeStrong((id *)&self->_supportedTransferActions, 0);
}

@end