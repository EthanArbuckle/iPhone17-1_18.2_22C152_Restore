@interface PKPayLaterEligibleSpendSectionController
+ (id)dynamicContentPageForBNPLOption:(id)a3;
- (Class)headerViewClassForSectionIdentifier:(id)a3;
- (PKPayLaterEligibleSpendSectionController)initWithPayLaterAccount:(id)a3 dynamicContentPage:(id)a4 viewControllerDelegate:(id)a5;
- (id)_firstFinancingOptionSectionIdentifier;
- (id)_lastFinancingOptionSectionIdentifier;
- (id)_paymentScheduleRowsForOption:(id)a3;
- (id)_tileDetailRowForOption:(id)a3;
- (id)footerContentForSectionIdentifier:(id)a3;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureEligbleSpendSection:(id)a3;
- (void)_configureFinancingOptionsSectionWithSectionIdentifier:(id)a3 snapshot:(id)a4;
- (void)_configureNewPurchaseSection:(id)a3;
- (void)_configureTotalCostSection:(id)a3;
- (void)_updateLocalState;
- (void)configureHeaderView:(id)a3 forSectionIdentifier:(id)a4;
- (void)setPayLaterAccount:(id)a3;
@end

@implementation PKPayLaterEligibleSpendSectionController

- (PKPayLaterEligibleSpendSectionController)initWithPayLaterAccount:(id)a3 dynamicContentPage:(id)a4 viewControllerDelegate:(id)a5
{
  v21.receiver = self;
  v21.super_class = (Class)PKPayLaterEligibleSpendSectionController;
  v5 = [(PKPayLaterSectionController *)&v21 initWithPayLaterAccount:a3 dynamicContentPage:a4 viewControllerDelegate:a5];
  v6 = v5;
  if (v5)
  {
    [(PKPayLaterEligibleSpendSectionController *)v5 _updateLocalState];
    v7 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    numberFormatter = v6->_numberFormatter;
    v6->_numberFormatter = v7;

    v9 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    timeFormatter = v6->_timeFormatter;
    v6->_timeFormatter = v9;

    v11 = v6->_timeFormatter;
    uint64_t v12 = *MEMORY[0x1E4F1C318];
    v13 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [(NSDateFormatter *)v11 setCalendar:v13];

    [(NSDateFormatter *)v6->_timeFormatter setDateStyle:0];
    [(NSDateFormatter *)v6->_timeFormatter setTimeStyle:1];
    v14 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v6->_dateFormatter;
    v6->_dateFormatter = v14;

    [(NSDateFormatter *)v6->_dateFormatter setLocalizedDateFormatFromTemplate:@"MMM d"];
    v16 = v6->_dateFormatter;
    v17 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v12];
    [(NSDateFormatter *)v16 setCalendar:v17];

    v18 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    percentageFormatter = v6->_percentageFormatter;
    v6->_percentageFormatter = v18;

    [(NSNumberFormatter *)v6->_percentageFormatter setNumberStyle:3];
    [(NSNumberFormatter *)v6->_percentageFormatter setMinimumFractionDigits:0];
    [(NSNumberFormatter *)v6->_percentageFormatter setMaximumFractionDigits:2];
  }
  return v6;
}

- (id)identifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 addObject:@"kEligibleSpendSection"];
  if ([(NSArray *)self->_financingOptions count])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = NSString;
      v6 = [NSNumber numberWithInteger:v4];
      v7 = [v5 stringWithFormat:@"%@%@", @"kFinancingOptionsSectionPrefix-", v6];
      [v3 addObject:v7];

      ++v4;
    }
    while (v4 < [(NSArray *)self->_financingOptions count]);
  }
  if (self->_financingOptionsProductType == 1) {
    [v3 addObject:@"kFinancingOptionsTotalCostSection"];
  }
  [v3 addObject:@"kNewPurchaseSection"];
  v8 = (void *)[v3 copy];

  return v8;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == @"kEligibleSpendSection") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_19;
  }
  int v9 = [@"kEligibleSpendSection" isEqualToString:v7];

  if (v9)
  {
LABEL_4:
    [(PKPayLaterEligibleSpendSectionController *)self _configureEligbleSpendSection:v6];
    goto LABEL_14;
  }
  v10 = v8;
  if (v10 == @"kNewPurchaseSection"
    || (v11 = v10, int v12 = [@"kNewPurchaseSection" isEqualToString:v10], v11, v12))
  {
    [(PKPayLaterEligibleSpendSectionController *)self _configureNewPurchaseSection:v6];
  }
  else
  {
LABEL_19:
    if ([(__CFString *)v8 hasPrefix:@"kFinancingOptionsSectionPrefix-"])
    {
      [(PKPayLaterEligibleSpendSectionController *)self _configureFinancingOptionsSectionWithSectionIdentifier:v8 snapshot:v6];
    }
    else
    {
      v13 = v8;
      if (v13 == @"kFinancingOptionsTotalCostSection"
        || v8
        && (v14 = v13,
            int v15 = [(__CFString *)v13 isEqualToString:@"kFinancingOptionsTotalCostSection"],
            v14,
            v15))
      {
        [(PKPayLaterEligibleSpendSectionController *)self _configureTotalCostSection:v6];
      }
    }
  }
LABEL_14:

  return v6;
}

- (void)setPayLaterAccount:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterEligibleSpendSectionController;
  [(PKPayLaterSectionController *)&v7 setPayLaterAccount:a3];
  [(PKPayLaterEligibleSpendSectionController *)self _updateLocalState];
  unint64_t v4 = [(PKPayLaterSectionController *)self dynamicCollectionDelegate];
  [v4 reconfigureHeaderAndFooterForSectionIdentifier:@"kEligibleSpendSection"];

  id v5 = [(PKPayLaterSectionController *)self dynamicCollectionDelegate];
  id v6 = [(PKPayLaterEligibleSpendSectionController *)self _firstFinancingOptionSectionIdentifier];
  [v5 reconfigureHeaderAndFooterForSectionIdentifier:v6];
}

- (id)footerContentForSectionIdentifier:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (__CFString *)a3;
  id v5 = v4;
  if (v4 == @"kEligibleSpendSection"
    || v4
    && (int v6 = [(__CFString *)v4 isEqualToString:@"kEligibleSpendSection"], v5, v6))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F84488]);
    v8 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    int v9 = [MEMORY[0x1E4F1C9C8] now];
    v10 = PKDateIgnoringTime();
    v11 = PKDateIgnoringTime();
    int v12 = [v8 components:16 fromDate:v10 toDate:v11 options:0];

    v24 = v8;
    v23 = [v8 components:32 fromDate:self->_expirationDate];
    uint64_t v13 = [v23 hour];
    v14 = [(NSDateFormatter *)self->_timeFormatter stringFromDate:self->_expirationDate];
    int v15 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:self->_expirationDate];
    uint64_t v16 = [v12 day];
    v17 = PKLocalizedCocoonString(&cfstr_AvailableToSpe_0.isa);
    if ([(NSDate *)self->_expirationDate isToday])
    {
      PKLocalizedCocoonString(&cfstr_EligibleSpendO.isa, &cfstr_Ld_1.isa, v13, v14, v17);
    }
    else if ([(NSDate *)self->_expirationDate isTomorrow])
    {
      PKLocalizedCocoonString(&cfstr_EligibleSpendO_0.isa, &cfstr_Ld_1.isa, v13, v14, v17);
    }
    else
    {
      PKLocalizedCocoonString(&cfstr_EligibleSpendO_1.isa, &cfstr_Ld_1.isa, v16, v15, v17);
    v18 = };
    id v19 = objc_alloc_init(MEMORY[0x1E4F84490]);
    [v19 setLinkText:v17];
    v20 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/ht212967?cid=mc-ols-applepay-article_ht212967-ios_ui-06092022#purchase"];
    [v19 setLinkURL:v20];
    v25[0] = v19;
    objc_super v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [v7 setLinks:v21];

    [v7 setFooterText:v18];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (Class)headerViewClassForSectionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPayLaterEligibleSpendSectionController *)self _firstFinancingOptionSectionIdentifier];
  id v6 = v4;
  id v7 = v5;
  v8 = v7;
  if (v7 == v6)
  {

    goto LABEL_12;
  }
  if (v6 && v7)
  {
    char v9 = [v6 isEqualToString:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_12:
    v11 = objc_opt_class();
    goto LABEL_13;
  }

LABEL_9:
  v10 = (__CFString *)v6;
  if (v10 == @"kEligibleSpendSection") {
    goto LABEL_12;
  }
  v11 = v10;
  if (!v10) {
    goto LABEL_13;
  }
  int v12 = [@"kEligibleSpendSection" isEqualToString:v10];

  if (v12) {
    goto LABEL_12;
  }
  v11 = 0;
LABEL_13:

  return (Class)v11;
}

- (void)configureHeaderView:(id)a3 forSectionIdentifier:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id v7 = [(PKPayLaterEligibleSpendSectionController *)self _firstFinancingOptionSectionIdentifier];
  id v8 = v6;
  char v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  if (v8 && v7)
  {
    int v10 = [v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_12;
    }
LABEL_7:
    eligibleSpendAmount = self->_eligibleSpendAmount;
    id v12 = v20;
    uint64_t v13 = [(PKCurrencyAmount *)eligibleSpendAmount formattedStringValue];
    if ([(NSArray *)self->_financingOptions count] >= 2) {
      v14 = @"SAMPLE_PAYMENT_PLANS_TITLE";
    }
    else {
      v14 = @"SAMPLE_PAYMENT_PLAN_TITLE";
    }
    PKLocalizedCocoonString(&v14->isa);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [v12 setPrimaryText:v15];
    uint64_t v16 = PKLocalizedCocoonString(&cfstr_SamplePaymentP_1.isa, &stru_1EF1B4C70.isa, v13);
    [v12 setSecondaryText:v16];

    [v12 setTopPadding:16.0];
    [v12 setBottomPadding:8.0];

    goto LABEL_16;
  }

LABEL_12:
  v17 = v9;
  if (v17 == @"kEligibleSpendSection"
    || (v18 = v17) != 0
    && (int v19 = [@"kEligibleSpendSection" isEqualToString:v17], v18, v19))
  {
    id v15 = v20;
    [v15 setTitleStyle:1];
    uint64_t v13 = PKLocalizedCocoonString(&cfstr_AvailableToSpe.isa);
    [v15 setTitle:v13];
LABEL_16:
  }
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterEligibleSpendSectionController;
  id v7 = [(PKPayLaterSectionController *)&v12 layoutWithLayoutEnvironment:a3 sectionIdentifier:v6];
  if (self->_financingOptionsProductType == 1)
  {
    id v8 = (__CFString *)v6;
    if (v8 == @"kFinancingOptionsTotalCostSection"
      || (char v9 = v8) != 0
      && (int v10 = [@"kFinancingOptionsTotalCostSection" isEqualToString:v8], v9, v10))
    {
      [v7 contentInsets];
      objc_msgSend(v7, "setContentInsets:");
    }
  }

  return v7;
}

- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterEligibleSpendSectionController;
  id v6 = a4;
  id v7 = [(PKPayLaterSectionController *)&v12 listLayoutConfigurationWithLayoutEnvironment:a3 sectionIdentifier:v6];
  int v8 = objc_msgSend(v6, "hasPrefix:", @"kFinancingOptionsSectionPrefix-", v12.receiver, v12.super_class);

  if (v8 && self->_financingOptionsProductType == 1)
  {
    char v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1958]) initWithListAppearance:2];
    +[PKConnectedCollectionViewCell textInsetWithOuterRadius:12.0];
    objc_msgSend(v9, "setBottomSeparatorInsets:", 0.0, v10, 0.0, 0.0);
    [v7 setSeparatorConfiguration:v9];
  }

  return v7;
}

- (void)_configureEligbleSpendSection:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v16 = objc_alloc_init(v4);
  id v6 = [PKPayLaterTitleDetailValueRow alloc];
  id v7 = PKLocalizedCocoonString(&cfstr_AvailableToSpe.isa);
  int v8 = [(PKCurrencyAmount *)self->_eligibleSpendAmount formattedStringValue];
  char v9 = [(PKPayLaterTitleDetailValueRow *)v6 initWithTitle:v7 detail:v8 value:0 accessory:0 selectionHandler:0];

  double v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(PKPayLaterTitleDetailValueRow *)v9 setTitleColor:v10];

  v11 = (void *)*MEMORY[0x1E4FB2790];
  objc_super v12 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)*MEMORY[0x1E4FB2790]);
  [(PKPayLaterTitleDetailValueRow *)v9 setTitleFont:v12];

  uint64_t v13 = [MEMORY[0x1E4FB1618] labelColor];
  [(PKPayLaterTitleDetailValueRow *)v9 setDetailColor:v13];

  v14 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], (void *)*MEMORY[0x1E4FB2988], v11, 2, 0, *MEMORY[0x1E4FB09B8]);
  [(PKPayLaterTitleDetailValueRow *)v9 setDetailFont:v14];

  [(PKPayLaterTitleDetailValueRow *)v9 setHorizontalMargin:12.0];
  [(PKPayLaterTitleDetailValueRow *)v9 setVerticalMargin:12.0];
  [v16 safelyAddObject:v9];
  id v15 = (void *)[v16 copy];
  [v5 appendItems:v15];
}

- (void)_configureNewPurchaseSection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  newPurchaseButtonRow = self->_newPurchaseButtonRow;
  if (!newPurchaseButtonRow)
  {
    id v7 = [PKPayLaterButtonRow alloc];
    int v8 = PKLocalizedCocoonString(&cfstr_NewPurchaseAmo.isa);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__PKPayLaterEligibleSpendSectionController__configureNewPurchaseSection___block_invoke;
    v12[3] = &unk_1E59CB010;
    objc_copyWeak(&v13, &location);
    v12[4] = self;
    char v9 = [(PKPayLaterButtonRow *)v7 initWithTitle:v8 selectionHandler:v12];
    double v10 = self->_newPurchaseButtonRow;
    self->_newPurchaseButtonRow = v9;

    objc_destroyWeak(&v13);
    newPurchaseButtonRow = self->_newPurchaseButtonRow;
  }
  [v5 addObject:newPurchaseButtonRow];
  v11 = (void *)[v5 copy];
  [v4 appendItems:v11];

  objc_destroyWeak(&location);
}

void __73__PKPayLaterEligibleSpendSectionController__configureNewPurchaseSection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 23) setShowSpinner:1];
    id v4 = [v3 dynamicCollectionDelegate];
    [v4 reloadItem:v3[23] animated:1];

    id v5 = [v3 payLaterAccount];
    uint64_t v6 = +[PKPayLaterSetupFlowController defaultPayLaterSetupFlowControllerForAccount:v5 controllerContext:3 referrerIdentifier:0];
    id v7 = (void *)v3[19];
    v3[19] = v6;

    objc_initWeak(&location, *(id *)(a1 + 32));
    int v8 = (void *)v3[19];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__PKPayLaterEligibleSpendSectionController__configureNewPurchaseSection___block_invoke_2;
    v9[3] = &unk_1E59CEAC0;
    objc_copyWeak(&v10, &location);
    [v8 fetchPayLaterDynamicContentWithCompletion:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __73__PKPayLaterEligibleSpendSectionController__configureNewPurchaseSection___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKPayLaterEligibleSpendSectionController__configureNewPurchaseSection___block_invoke_3;
  block[3] = &unk_1E59CFB30;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __73__PKPayLaterEligibleSpendSectionController__configureNewPurchaseSection___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    [WeakRetained[23] setShowSpinner:0];
    id v3 = [v7 dynamicCollectionDelegate];
    [v3 reloadItem:v7[23] animated:1];

    if (!*(unsigned char *)(a1 + 48) || *(void *)(a1 + 32))
    {
      id v5 = PKAccountDisplayableError();
      id v4 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);

      if (!v4)
      {
LABEL_7:

        id WeakRetained = v7;
        goto LABEL_8;
      }
    }
    else
    {
      id v4 = [v7[19] firstViewController];
    }
    id v6 = [v7 dynamicCollectionDelegate];
    [v6 presentViewController:v4 animated:1 completion:0];

    goto LABEL_7;
  }
LABEL_8:
}

- (void)_configureFinancingOptionsSectionWithSectionIdentifier:(id)a3 snapshot:(id)a4
{
  id v14 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [v7 stringByReplacingOccurrencesOfString:@"kFinancingOptionsSectionPrefix-" withString:&stru_1EF1B5B50];

  unint64_t v10 = [v9 integerValue];
  if ((v10 & 0x8000000000000000) == 0 && v10 < [(NSArray *)self->_financingOptions count])
  {
    v11 = [(NSArray *)self->_financingOptions objectAtIndexedSubscript:v10];
    if (self->_financingOptionsProductType == 1)
    {
      objc_super v12 = [(PKPayLaterEligibleSpendSectionController *)self _paymentScheduleRowsForOption:v11];
      [v8 addObjectsFromArray:v12];
    }
    id v13 = (void *)[v8 copy];
    [v14 appendItems:v13];
  }
}

- (void)_configureTotalCostSection:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v12 = objc_alloc_init(v4);
  id v6 = [PKPayLaterTitleDetailRow alloc];
  id v7 = PKLocalizedCocoonString(&cfstr_TotalCost.isa);
  id v8 = [(PKCurrencyAmount *)self->_eligibleSpendAmount formattedStringValue];
  id v9 = [(PKPayLaterTitleDetailRow *)v6 initWithTitle:v7 detail:v8 selectionHandler:0];

  unint64_t v10 = [MEMORY[0x1E4FB1618] labelColor];
  [(PKPayLaterTitleDetailRow *)v9 setDetailColor:v10];

  [v12 safelyAddObject:v9];
  v11 = (void *)[v12 copy];
  [v5 appendItems:v11];
}

- (id)_tileDetailRowForOption:(id)a3
{
  id v3 = a3;
  id v4 = [v3 totalAmount];
  id v5 = [v4 currencyAmount];

  id v6 = [v3 installmentAmount];
  id v7 = [v6 currencyAmount];

  id v8 = PKLocalizedCocoonString(&cfstr_NumberPayments.isa, &cfstr_Lu.isa, [v3 installmentCount]);
  uint64_t v9 = [v3 productType];

  if (v9 == 1)
  {
    unint64_t v10 = [v7 formattedStringValue];
    v11 = PKLocalizedCocoonString(&cfstr_4PaymentOf.isa, &stru_1EF1B4C70.isa, v10);

    id v12 = PKLocalizedCocoonString(&cfstr_InterestFree.isa);
    if (v5)
    {
LABEL_3:
      id v13 = [v5 formattedStringValue];
      id v14 = PKLocalizedCocoonString(&cfstr_TotalOptionAmo.isa, &stru_1EF1B4C70.isa, v13);

      goto LABEL_6;
    }
  }
  else
  {
    id v12 = 0;
    v11 = 0;
    if (v5) {
      goto LABEL_3;
    }
  }
  id v14 = 0;
LABEL_6:
  id v15 = [[PKPayLaterTileDetailRow alloc] initWithTitleText:v11 subtitleText:v8 text:v12 detailText:v14 textSubtitle:0 customView:0 selectionHandler:0];

  return v15;
}

- (id)_paymentScheduleRowsForOption:(id)a3
{
  id v3 = a3;
  id v4 = [v3 installments];
  uint64_t v5 = [v4 count];
  id v6 = [(id)objc_opt_class() dynamicContentPageForBNPLOption:v3];

  id v7 = +[PKPayLaterProgressRow progressRowsWithInstallmentCount:v5 firstRowFont:0 dynamicContentPage:v6];

  return v7;
}

- (id)_firstFinancingOptionSectionIdentifier
{
  return (id)[NSString stringWithFormat:@"%@%@", @"kFinancingOptionsSectionPrefix-", &unk_1EF2B95E8];
}

- (id)_lastFinancingOptionSectionIdentifier
{
  v2 = NSString;
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_financingOptions, "count") - 1);
  id v4 = [v2 stringWithFormat:@"%@%@", @"kFinancingOptionsSectionPrefix-", v3];

  return v4;
}

- (void)_updateLocalState
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPayLaterSectionController *)self payLaterAccount];
  id v4 = [v3 payLaterDetails];
  uint64_t v5 = [v4 products];
  id v6 = [v5 allObjects];

  id v7 = objc_msgSend(v6, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_150);

  id v8 = [v7 firstObject];
  if ((unint64_t)[v7 count] >= 2)
  {
    uint64_t v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v45 = [v7 count];
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Error! There can only be only pay later product type with an eligible spend amount. There are currently %ld", buf, 0xCu);
    }
  }
  unint64_t v10 = [v8 eligibleSpend];
  v11 = [v10 availableToSpend];
  eligibleSpendAmount = self->_eligibleSpendAmount;
  self->_eligibleSpendAmount = v11;

  id v13 = [v10 expirationDate];
  expirationDate = self->_expirationDate;
  self->_expirationDate = v13;

  id v15 = [v10 financingOptions];
  financingOptions = self->_financingOptions;
  self->_financingOptions = v15;

  v17 = self->_financingOptions;
  v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"installmentAmount.currencyAmount.amount" ascending:0];
  v43 = v18;
  int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  id v20 = [(NSArray *)v17 sortedArrayUsingDescriptors:v19];
  objc_super v21 = self->_financingOptions;
  self->_financingOptions = v20;

  v22 = [(NSArray *)self->_financingOptions firstObject];
  self->_financingOptionsProductType = [v22 productType];

  p_maxAPR = (id *)&self->_maxAPR;
  maxAPR = self->_maxAPR;
  self->_maxAPR = 0;

  p_minAPR = (id *)&self->_minAPR;
  minAPR = self->_minAPR;
  self->_minAPR = 0;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v27 = self->_financingOptions;
  uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v39;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * v31), "apr", (void)v38);
        if (!*p_maxAPR) {
          goto LABEL_13;
        }
        if (!v32)
        {
          if (!*p_minAPR) {
            goto LABEL_17;
          }
          goto LABEL_18;
        }
        if ([*p_maxAPR compare:v32] == -1) {
LABEL_13:
        }
          objc_storeStrong(p_maxAPR, v32);
        if (!*p_minAPR || v32 && [*p_minAPR compare:v32] == 1) {
LABEL_17:
        }
          objc_storeStrong(p_minAPR, v32);
LABEL_18:

        ++v31;
      }
      while (v29 != v31);
      uint64_t v33 = [(NSArray *)v27 countByEnumeratingWithState:&v38 objects:v42 count:16];
      uint64_t v29 = v33;
    }
    while (v33);
  }

  if (*p_minAPR)
  {
    id v34 = *p_minAPR;
  }
  else
  {
    id v34 = [MEMORY[0x1E4F28C28] zero];
  }
  id v35 = *p_minAPR;
  id *p_minAPR = v34;

  if (*p_maxAPR)
  {
    id v36 = *p_maxAPR;
  }
  else
  {
    id v36 = [MEMORY[0x1E4F28C28] zero];
  }
  id v37 = *p_maxAPR;
  id *p_maxAPR = v36;
}

id __61__PKPayLaterEligibleSpendSectionController__updateLocalState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 eligibleSpend];
  id v4 = [v3 availableToSpend];
  uint64_t v5 = v4;
  id v6 = 0;
  if (v3 && v4)
  {
    id v7 = [v4 amount];
    char v8 = objc_msgSend(v7, "pk_isZeroNumber");

    if (v8) {
      id v6 = 0;
    }
    else {
      id v6 = v2;
    }
  }

  return v6;
}

+ (id)dynamicContentPageForBNPLOption:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v18 = objc_alloc_init(MEMORY[0x1E4F84968]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v19 = v3;
  uint64_t v5 = [v3 installments];
  if ([v5 count])
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      char v8 = [v5 objectAtIndexedSubscript:v7];
      id v9 = objc_alloc_init(MEMORY[0x1E4F84970]);
      if (v7) {
        PKLocalizedCocoonString(&cfstr_WeeksLater.isa, &cfstr_Lu.isa, v6);
      }
      else {
      unint64_t v10 = PKLocalizedCocoonString(&cfstr_DueAtPurchase.isa);
      }
      [v9 setContentTitle:v10];
      v11 = [v8 dueAmount];
      id v12 = [v11 currencyAmount];
      id v13 = [v12 formattedStringValue];
      [v9 setContentDetailTrailing:v13];

      [v4 safelyAddObject:v9];
      ++v7;
      v6 += 2;
    }
    while (v7 < [v5 count]);
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F84978]);
  id v15 = (void *)[v4 copy];
  [v14 setRows:v15];

  v20[0] = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v18 setSections:v16];

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newPurchaseButtonRow, 0);
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_payLaterSetupFlowController, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_financingOptions, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_maxAPR, 0);
  objc_storeStrong((id *)&self->_minAPR, 0);

  objc_storeStrong((id *)&self->_eligibleSpendAmount, 0);
}

@end