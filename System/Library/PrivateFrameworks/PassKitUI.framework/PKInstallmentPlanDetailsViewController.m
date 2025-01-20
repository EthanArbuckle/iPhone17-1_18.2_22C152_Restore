@interface PKInstallmentPlanDetailsViewController
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKInstallmentPlanDetailsViewController)initWithAccount:(id)a3 installmentPlan:(id)a4 accountService:(id)a5 accountUserCollection:(id)a6 familyMemberCollection:(id)a7 transactionSourceCollection:(id)a8;
- (id)_detailsCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_progressCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateHeaderHeight;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKInstallmentPlanDetailsViewController

- (PKInstallmentPlanDetailsViewController)initWithAccount:(id)a3 installmentPlan:(id)a4 accountService:(id)a5 accountUserCollection:(id)a6 familyMemberCollection:(id)a7 transactionSourceCollection:(id)a8
{
  id v15 = a3;
  id v28 = a4;
  id v16 = a5;
  id v17 = a6;
  id v27 = a7;
  id v26 = a8;
  v29.receiver = self;
  v29.super_class = (Class)PKInstallmentPlanDetailsViewController;
  v18 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v29, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1), 2);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_account, a3);
    objc_storeStrong((id *)&v19->_installmentPlan, a4);
    objc_storeStrong((id *)&v19->_accountService, a5);
    objc_storeStrong((id *)&v19->_accountUserCollection, a6);
    objc_storeStrong((id *)&v19->_familyMemberCollection, a7);
    objc_storeStrong((id *)&v19->_transactionSourceCollection, a8);
    v20 = objc_alloc_init(PKPaymentTransactionDetailAmountLineItemGenerator);
    lineItemGenerator = v19->_lineItemGenerator;
    v19->_lineItemGenerator = v20;

    uint64_t v22 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)v19->_lineItemGenerator lineItemsForInstallmentPlan:v28];
    lineItems = v19->_lineItems;
    v19->_lineItems = (NSArray *)v22;

    v24 = [(PKInstallmentPlanDetailsViewController *)v19 navigationItem];
    objc_msgSend(v24, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v24, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  }
  return v19;
}

- (void)viewDidLoad
{
  v34.receiver = self;
  v34.super_class = (Class)PKInstallmentPlanDetailsViewController;
  [(PKSectionTableViewController *)&v34 viewDidLoad];
  v3 = [(PKInstallmentPlanDetailsViewController *)self tableView];
  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"StatusCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"LineItemCellReuseIdentifier"];
  uint64_t v4 = [(PKCreditInstallmentPlan *)self->_installmentPlan totalAmount];
  if (v4
    && (v5 = (void *)v4,
        [(PKCreditInstallmentPlan *)self->_installmentPlan currencyCode],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = [(PKCreditInstallmentPlan *)self->_installmentPlan totalAmount];
    v8 = [(PKCreditInstallmentPlan *)self->_installmentPlan currencyCode];
    v9 = PKCurrencyAmountCreate(v7, v8);
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_alloc_init(PKPaymentTransactionDetailHeaderView);
  headerView = self->_headerView;
  self->_headerView = v10;

  v12 = self->_headerView;
  v13 = [v9 formattedStringValue];
  [(PKPaymentTransactionDetailHeaderView *)v12 setAmountText:v13];

  v14 = self->_headerView;
  id v15 = [(PKCreditInstallmentPlan *)self->_installmentPlan merchant];
  id v16 = [v15 name];
  [(PKPaymentTransactionDetailHeaderView *)v14 setSubtitleText:v16];

  id v17 = [(PKCreditInstallmentPlan *)self->_installmentPlan summary];
  v18 = [v17 startDate];

  if (v18)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v19 setDateStyle:2];
    [v19 setTimeStyle:1];
    v20 = self->_headerView;
    v21 = [v19 stringFromDate:v18];
    [(PKPaymentTransactionDetailHeaderView *)v20 setSecondarySubtitleText:v21];
  }
  uint64_t v22 = [(PKCreditInstallmentPlan *)self->_installmentPlan accountUserAltDSID];
  if (v22)
  {
    v23 = [(PKAccountUserCollection *)self->_accountUserCollection accountUserWithAltDSID:v22];
    v24 = [(PKFamilyMemberCollection *)self->_familyMemberCollection familyMemberForAltDSID:v22];
    v25 = (void *)MEMORY[0x1E4F845E8];
    id v26 = [v23 nameComponents];
    id v27 = [v25 contactForFamilyMember:v24 nameComponents:v26 imageData:0];

    if (v27)
    {
      id v28 = [v27 givenName];
      PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentTra_0.isa, &stru_1EF1B4C70.isa, v28);
      v33 = v18;
      objc_super v29 = v3;
      v30 = v23;
      v32 = v31 = v9;

      [(PKPaymentTransactionDetailHeaderView *)self->_headerView setTertiarySubtitleText:v32];
      v9 = v31;
      v23 = v30;
      v3 = v29;
      v18 = v33;
    }
  }
  [v3 setTableHeaderView:self->_headerView];
  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85610]];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKInstallmentPlanDetailsViewController;
  [(PKInstallmentPlanDetailsViewController *)&v5 viewWillLayoutSubviews];
  [(PKInstallmentPlanDetailsViewController *)self _updateHeaderHeight];
  v3 = [(PKInstallmentPlanDetailsViewController *)self tableView];
  uint64_t v4 = [(PKInstallmentPlanDetailsViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  if (!a3) {
    return 1;
  }
  if (a3 == 1) {
    return [(PKAccount *)self->_account accessLevel] == 1;
  }
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (v5 == 1) {
    return 3;
  }
  if (v5) {
    return 0;
  }
  return [(NSArray *)self->_lineItems count] + 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]);
  if (v8 == 1)
  {
    uint64_t v9 = [(PKInstallmentPlanDetailsViewController *)self _progressCellForTableView:v6 atIndexPath:v7];
    goto LABEL_5;
  }
  if (!v8)
  {
    uint64_t v9 = [(PKInstallmentPlanDetailsViewController *)self _detailsCellForTableView:v6 atIndexPath:v7];
LABEL_5:
    v10 = (void *)v9;
    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  unint64_t v8 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]);
  if (v8 == 1)
  {
    objc_msgSend(v11, "setSeparatorStyle:", objc_msgSend(v11, "hasTrailingLineSeperator"));
  }
  else if (!v8)
  {
    uint64_t v9 = [v7 row];
    if (v9 >= 1)
    {
      v10 = [(NSArray *)self->_lineItems objectAtIndex:v9 - 1];
      objc_msgSend(v11, "setSeparatorStyle:", objc_msgSend(v10, "hasTrailingLineSeperator"));
    }
  }
}

- (void)_updateHeaderHeight
{
  if (self->_headerView)
  {
    id v14 = [(PKInstallmentPlanDetailsViewController *)self tableView];
    [v14 bounds];
    double v4 = v3;
    [(PKPaymentTransactionDetailHeaderView *)self->_headerView frame];
    double v6 = v5;
    double v8 = v7;
    -[PKPaymentTransactionDetailHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v4, 1.79769313e308);
    if (v6 != v10 || v8 != v9)
    {
      double v12 = v9;
      headerView = self->_headerView;
      [v14 _rectForTableHeaderView];
      -[PKPaymentTransactionDetailHeaderView setFrame:](headerView, "setFrame:");
      [v14 _tableHeaderHeightDidChangeToHeight:v12];
    }
  }
}

- (id)_detailsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 row];
  if (v8)
  {
    double v9 = [(NSArray *)self->_lineItems objectAtIndex:v8 - 1];
    double v10 = [v6 dequeueReusableCellWithIdentifier:@"LineItemCellReuseIdentifier" forIndexPath:v7];
    if ([v9 isEmphasized]) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 0;
    }
    double v12 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27F0], v11, 0);
    objc_msgSend(v10, "setHasTrailingLineSeperator:", objc_msgSend(v9, "hasTrailingLineSeperator"));
    [v10 setTitleFont:v12];
    v13 = [v9 label];
    [v10 setTitleText:v13];

    [v10 setValueFont:v12];
    id v14 = [v9 value];
    [v10 setValueText:v14];
  }
  else
  {
    double v10 = [v6 dequeueReusableCellWithIdentifier:@"StatusCellReuseIdentifier" forIndexPath:v7];
    id v15 = PKLocalizedBeekmanString(&cfstr_AppleCardInsta.isa);
    [v10 setPrimaryText:v15];

    if ([(PKCreditInstallmentPlan *)self->_installmentPlan periodType] == 1)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      [v16 setNumberStyle:3];
      id v17 = [(PKCreditInstallmentPlan *)self->_installmentPlan apr];
      char v18 = objc_msgSend(v17, "pk_isIntegralNumber");

      if ((v18 & 1) == 0) {
        [v16 setMinimumFractionDigits:2];
      }
      uint64_t v19 = [(PKCreditInstallmentPlan *)self->_installmentPlan duration];
      v20 = [(PKCreditInstallmentPlan *)self->_installmentPlan apr];
      v21 = [v16 stringFromNumber:v20];
      double v9 = PKLocalizedString(&cfstr_PlanDurationAp.isa, &cfstr_Lu_0.isa, v19, v21);
    }
    else
    {
      double v9 = 0;
    }
    [v10 setSecondaryTitle:v9];
  }

  return v10;
}

- (id)_progressCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 row];
  if (v8 == 2)
  {
    double v12 = [(PKCreditInstallmentPlan *)self->_installmentPlan remainingAmount];
    id v16 = [(PKCreditInstallmentPlan *)self->_installmentPlan currencyCode];
    id v15 = v16;
    if (v12) {
      BOOL v17 = v16 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17)
    {
      uint64_t v11 = 0;
    }
    else
    {
      PKCurrencyAmountCreate(v12, v16);
      uint64_t v11 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v22 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27F0]);
    v13 = [v6 dequeueReusableCellWithIdentifier:@"LineItemCellReuseIdentifier" forIndexPath:v7];
    [v13 setHasTrailingLineSeperator:1];
    [v13 setTitleFont:v22];
    v23 = PKLocalizedBeekmanString(&cfstr_TotalRemaining.isa);
    [v13 setTitleText:v23];

    [v13 setValueFont:v22];
    v24 = [(NSDecimalNumber *)v11 formattedStringValue];
    [v13 setValueText:v24];

    goto LABEL_17;
  }
  if (v8 == 1)
  {
    char v18 = [(PKCreditInstallmentPlan *)self->_installmentPlan summary];
    uint64_t v19 = [v18 paymentsToDateAmount];
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      v21 = [MEMORY[0x1E4F28C28] zero];
    }
    uint64_t v11 = v21;

    v25 = [(PKCreditInstallmentPlan *)self->_installmentPlan currencyCode];
    PKCurrencyAmountCreate(v11, v25);
    double v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

    id v15 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27F0], 2, 0);
    v13 = [v6 dequeueReusableCellWithIdentifier:@"LineItemCellReuseIdentifier" forIndexPath:v7];
    [v13 setHasTrailingLineSeperator:0];
    [v13 setTitleFont:v15];
    id v26 = PKLocalizedBeekmanString(&cfstr_TotalPaid.isa);
    [v13 setTitleText:v26];

    [v13 setValueFont:v15];
    uint64_t v22 = [(NSDecimalNumber *)v12 formattedStringValue];
    [v13 setValueText:v22];
LABEL_17:

    goto LABEL_18;
  }
  if (v8)
  {
    v13 = 0;
    goto LABEL_19;
  }
  double v9 = [(PKCreditInstallmentPlan *)self->_installmentPlan totalBilled];
  double v10 = [(PKCreditInstallmentPlan *)self->_installmentPlan currencyCode];
  PKCurrencyAmountCreate(v9, v10);
  uint64_t v11 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27F0]);
  double v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v13 = [v6 dequeueReusableCellWithIdentifier:@"LineItemCellReuseIdentifier" forIndexPath:v7];
  [v13 setHasTrailingLineSeperator:1];
  [v13 setTitleFont:v12];
  id v14 = PKLocalizedBeekmanString(&cfstr_TotalBilled.isa);
  [v13 setTitleText:v14];

  [v13 setValueFont:v12];
  id v15 = [(NSDecimalNumber *)v11 formattedStringValue];
  [v13 setValueText:v15];
LABEL_18:

LABEL_19:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_lineItems, 0);
  objc_storeStrong((id *)&self->_lineItemGenerator, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_installmentPlan, 0);
  objc_storeStrong((id *)&self->_familyMemberCollection, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_accountService, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end