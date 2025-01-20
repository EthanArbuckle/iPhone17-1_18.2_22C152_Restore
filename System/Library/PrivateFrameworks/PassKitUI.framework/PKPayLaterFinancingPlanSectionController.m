@interface PKPayLaterFinancingPlanSectionController
- (BOOL)messagesView:(id)a3 shouldEnqueueEventForView:(id)a4;
- (Class)headerViewClassForSectionIdentifier:(id)a3;
- (NSOrderedSet)dashboardMessages;
- (PKPayLaterFinancingPlan)financingPlan;
- (PKPayLaterFinancingPlanSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 payLaterPass:(id)a5 dynamicContentPage:(id)a6 merchantIcon:(id)a7 paymentIntentController:(id)a8 delegate:(id)a9;
- (PKPayLaterPaymentIntentController)paymentIntentController;
- (UIImage)merchantIcon;
- (double)headerViewHeight;
- (id)_totalCostRow;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (unint64_t)_dashboardMessageIndexForIdentifier:(id)a3 inMessages:(id)a4;
- (void)_configureDashboardMessagesSection:(id)a3;
- (void)_configureDefaultSummarySection:(id)a3;
- (void)_configureFundingSourceSection:(id)a3;
- (void)_configureMiniMirandaSection:(id)a3;
- (void)_configurePaymentScheduleSection:(id)a3;
- (void)_configureStatusInformationSummarySection:(id)a3;
- (void)_configureSummarySection:(id)a3;
- (void)_handleHeaderTapRecognizer:(id)a3;
- (void)configureCellForRegistration:(id)a3 item:(id)a4;
- (void)configureHeaderView:(id)a3 forSectionIdentifier:(id)a4;
- (void)messagesView:(id)a3 scrolledToMessageWithIdentifier:(id)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setDashboardMessages:(id)a3;
- (void)setFinancingPlan:(id)a3;
- (void)setPaymentIntentController:(id)a3;
@end

@implementation PKPayLaterFinancingPlanSectionController

- (PKPayLaterFinancingPlanSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 payLaterPass:(id)a5 dynamicContentPage:(id)a6 merchantIcon:(id)a7 paymentIntentController:(id)a8 delegate:(id)a9
{
  id v35 = a3;
  id v34 = a5;
  id v16 = a7;
  id v17 = a8;
  v36.receiver = self;
  v36.super_class = (Class)PKPayLaterFinancingPlanSectionController;
  v18 = [(PKPayLaterSectionController *)&v36 initWithPayLaterAccount:a4 dynamicContentPage:a6 viewControllerDelegate:a9];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_financingPlan, a3);
    objc_storeStrong((id *)&v19->_payLaterPass, a5);
    objc_storeStrong((id *)&v19->_merchantIcon, a7);
    objc_storeStrong((id *)&v19->_paymentIntentController, a8);
    v20 = -[PKPayLaterFinancingPlanPaymentScheduleComposer initWithDelegate:dataSource:]([PKPayLaterFinancingPlanPaymentScheduleComposer alloc], "initWithDelegate:dataSource:", v19, v19, v34, v35);
    paymentScheduleComposer = v19->_paymentScheduleComposer;
    v19->_paymentScheduleComposer = v20;

    v19->_useRawMerchantName = 0;
    v22 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    shortDateFormatter = v19->_shortDateFormatter;
    v19->_shortDateFormatter = v22;

    v24 = v19->_shortDateFormatter;
    uint64_t v25 = *MEMORY[0x1E4F1C318];
    v26 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [(NSDateFormatter *)v24 setCalendar:v26];

    [(NSDateFormatter *)v19->_shortDateFormatter setDateStyle:1];
    [(NSDateFormatter *)v19->_shortDateFormatter setTimeStyle:0];
    v27 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    mediumDateFormatter = v19->_mediumDateFormatter;
    v19->_mediumDateFormatter = v27;

    v29 = v19->_mediumDateFormatter;
    v30 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v25];
    [(NSDateFormatter *)v29 setCalendar:v30];

    [(NSDateFormatter *)v19->_mediumDateFormatter setDateStyle:2];
    [(NSDateFormatter *)v19->_mediumDateFormatter setTimeStyle:0];
    v31 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    numberFormatter = v19->_numberFormatter;
    v19->_numberFormatter = v31;

    [(NSNumberFormatter *)v19->_numberFormatter setNumberStyle:1];
  }

  return v19;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PKPayLaterSectionController *)self viewControllerDelegate];
  [v7 pushViewController:v6 animated:v4];
}

- (id)identifiers
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 addObject:@"kSummarySection"];
  if ([(NSOrderedSet *)self->_dashboardMessages count]) {
    [v3 addObject:@"kDashboardMessages"];
  }
  uint64_t v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan state];
  if ((unint64_t)(v4 - 1) < 4)
  {
    [v3 addObject:@"kFundingSourceSection"];
LABEL_5:
    [v3 addObject:@"kPaymentScheduleSection"];
    goto LABEL_6;
  }
  if (v4 == 6) {
    goto LABEL_5;
  }
LABEL_6:
  v5 = (void *)MEMORY[0x1E4F84998];
  id v6 = [(PKPayLaterSectionController *)self payLaterAccount];
  if (self->_financingPlan)
  {
    v12[0] = self->_financingPlan;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    int v8 = [v5 requiresGenericMessagingForAccount:v6 financingPlans:v7];

    if (!v8) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  char v11 = [v5 requiresGenericMessagingForAccount:v6 financingPlans:0];

  if (v11) {
LABEL_8:
  }
    [v3 addObject:@"kMiniMirandaSection"];
LABEL_9:
  v9 = (void *)[v3 copy];

  return v9;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  id v7 = (__CFString *)v5;
  int v8 = v7;
  if (v7 == @"kSummarySection") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_5;
  }
  int v9 = [@"kSummarySection" isEqualToString:v7];

  if (v9)
  {
LABEL_4:
    [(PKPayLaterFinancingPlanSectionController *)self _configureSummarySection:v6];
  }
  else
  {
    char v11 = v8;
    if (v11 == @"kDashboardMessages"
      || (v12 = v11, int v13 = [@"kDashboardMessages" isEqualToString:v11], v12, v13))
    {
      [(PKPayLaterFinancingPlanSectionController *)self _configureDashboardMessagesSection:v6];
    }
    else
    {
      v14 = v12;
      if (v14 == @"kFundingSourceSection"
        || (v15 = v14,
            int v16 = [@"kFundingSourceSection" isEqualToString:v14],
            v15,
            v16))
      {
        [(PKPayLaterFinancingPlanSectionController *)self _configureFundingSourceSection:v6];
      }
      else
      {
        id v17 = v15;
        if (v17 == @"kPaymentScheduleSection"
          || (v18 = v17,
              int v19 = [@"kPaymentScheduleSection" isEqualToString:v17],
              v18,
              v19))
        {
          [(PKPayLaterFinancingPlanSectionController *)self _configurePaymentScheduleSection:v6];
        }
        else
        {
          v20 = v18;
          if (v20 == @"kMiniMirandaSection"
            || (v21 = v20,
                int v22 = [@"kMiniMirandaSection" isEqualToString:v20],
                v21,
                v22))
          {
            [(PKPayLaterFinancingPlanSectionController *)self _configureMiniMirandaSection:v6];
          }
        }
      }
    }
  }
LABEL_5:

  return v6;
}

- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterFinancingPlanSectionController;
  id v7 = [(PKPayLaterSectionController *)&v14 listLayoutConfigurationWithLayoutEnvironment:a3 sectionIdentifier:v6];
  int v8 = (__CFString *)v6;
  int v9 = v8;
  if (v8 == @"kPaymentScheduleSection"
    || v8
    && (int v10 = [(__CFString *)v8 isEqualToString:@"kPaymentScheduleSection"],
        v9,
        v10))
  {
    char v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1958]) initWithListAppearance:2];
    +[PKConnectedCollectionViewCell textInsetWithOuterRadius:12.0];
    objc_msgSend(v11, "setBottomSeparatorInsets:", 0.0, v12, 0.0, 0.0);
    [v7 setSeparatorConfiguration:v11];
  }

  return v7;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterFinancingPlanSectionController;
  id v7 = [(PKPayLaterSectionController *)&v12 layoutWithLayoutEnvironment:a3 sectionIdentifier:v6];
  int v8 = (__CFString *)v6;
  int v9 = v8;
  if (v8 == @"kDashboardMessages"
    || v8 && (int v10 = [@"kDashboardMessages" isEqualToString:v8], v9, v10))
  {
    if ([(NSOrderedSet *)self->_dashboardMessages count])
    {
      [v7 contentInsets];
      objc_msgSend(v7, "setContentInsets:");
    }
  }

  return v7;
}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = (PKPayLaterSubtitleRow *)a4;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFinancingPlanSectionController;
  [(PKPayLaterSectionController *)&v9 configureCellForRegistration:v6 item:v7];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || self->_miniMirandaRow == v7)
  {
    int v8 = [MEMORY[0x1E4FB1498] clearConfiguration];
    [v6 setBackgroundConfiguration:v8];
  }
}

- (Class)headerViewClassForSectionIdentifier:(id)a3
{
  id v3 = (__CFString *)a3;
  uint64_t v4 = v3;
  if (v3 == @"kSummarySection"
    || v3
    && ((char v5 = [@"kSummarySection" isEqualToString:v3], v4, (v5 & 1) != 0)
     || (id v7 = v4, v7 == @"kPaymentScheduleSection")
     || (int v8 = v7, v9 = [@"kPaymentScheduleSection" isEqualToString:v7], v8, v9)))
  {
    id v6 = objc_opt_class();
  }
  else
  {
    id v6 = 0;
  }

  return (Class)v6;
}

- (void)configureHeaderView:(id)a3 forSectionIdentifier:(id)a4
{
  id v35 = a3;
  id v6 = (__CFString *)a4;
  id v7 = v6;
  if (v6 != @"kSummarySection")
  {
    if (!v6) {
      goto LABEL_21;
    }
    int v8 = [@"kSummarySection" isEqualToString:v6];

    if (!v8)
    {
      v26 = v7;
      if (v26 != @"kPaymentScheduleSection")
      {
        v27 = v26;
        int v28 = [@"kPaymentScheduleSection" isEqualToString:v26];

        if (!v28) {
          goto LABEL_21;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_21;
      }
      id v12 = v35;
      v29 = PKLocalizedCocoonString(&cfstr_PaymentSchedul_0.isa);
      [v12 setTitle:v29];

      [v12 setTopPadding:15.0];
      goto LABEL_20;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_21;
  }
  int v9 = (PKCollectionHeaderView *)v35;
  int v10 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
  char v11 = [v10 mapsBrand];
  id v12 = [v11 url];

  shortDateFormatter = self->_shortDateFormatter;
  objc_super v14 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
  v15 = [v14 transactionDate];
  int v16 = [(NSDateFormatter *)shortDateFormatter stringFromDate:v15];

  id v17 = v16;
  v18 = v17;
  if (v12)
  {
    int v19 = NSString;
    v20 = [v12 absoluteString];
    v18 = [v19 stringWithFormat:@"%@ – %@", v17, v20];
  }
  v21 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
  int v22 = v21;
  if (self->_useRawMerchantName)
  {
    uint64_t v23 = [v21 rawName];
    if (!v23)
    {
      v30 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
      v31 = [v30 displayName];
      [(PKCollectionHeaderView *)v9 setPrimaryText:v31];

      v24 = 0;
      goto LABEL_17;
    }
    v24 = (void *)v23;
    uint64_t v25 = [v22 rawName];
  }
  else
  {
    v24 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
    uint64_t v25 = [v24 displayName];
  }
  v30 = (void *)v25;
  [(PKCollectionHeaderView *)v9 setPrimaryText:v25];
LABEL_17:

  [(PKCollectionHeaderView *)v9 setSecondaryText:v18];
  [(PKCollectionHeaderView *)v9 setBottomPadding:16.0];
  [(PKCollectionHeaderView *)v9 setImage:self->_merchantIcon];
  if (([(PKCollectionHeaderView *)self->_headerView isEqual:v9] & 1) == 0)
  {
    v32 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleHeaderTapRecognizer_];
    [(PKCollectionHeaderView *)v9 addGestureRecognizer:v32];
  }
  headerView = self->_headerView;
  self->_headerView = v9;

  id v34 = [(PKPayLaterSectionController *)self dynamicCollectionDelegate];
  [v34 reloadNavigationBarHeaderFooterLayout];

LABEL_20:
LABEL_21:
}

- (double)headerViewHeight
{
  [(PKCollectionHeaderView *)self->_headerView heightOfHeaderWithoutText];
  return result;
}

- (void)_handleHeaderTapRecognizer:(id)a3
{
  self->_useRawMerchantName ^= 1u;
  [(PKPayLaterFinancingPlanSectionController *)self configureHeaderView:self->_headerView forSectionIdentifier:@"kSummarySection"];
}

- (void)_configureSummarySection:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan state];
  if (v4 <= 8)
  {
    if (((1 << v4) & 0xD3) != 0) {
      [(PKPayLaterFinancingPlanSectionController *)self _configureDefaultSummarySection:v5];
    }
    else {
      [(PKPayLaterFinancingPlanSectionController *)self _configureStatusInformationSummarySection:v5];
    }
  }
}

- (void)_configureDefaultSummarySection:(id)a3
{
  unint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v61 = objc_alloc_init(v4);
  unint64_t v6 = [(PKPayLaterFinancingPlan *)self->_financingPlan state];
  if (v6 <= 8)
  {
    id v60 = v5;
    if (v6 == 6)
    {
      v43 = (void *)MEMORY[0x1E4FB1830];
      v44 = (void *)*MEMORY[0x1E4FB2990];
      v45 = (void *)*MEMORY[0x1E4FB27D0];
      v46 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2990], (NSString *)*MEMORY[0x1E4FB27D0]);
      id v7 = [v43 configurationWithFont:v46];

      v47 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
      v48 = [v47 imageWithConfiguration:v7];
      v49 = PKPayLaterUIProgressBarStartColor();
      v50 = [v48 imageWithTintColor:v49];
      int v8 = [v50 imageWithRenderingMode:1];

      v51 = [PKPayLaterTitleDetailValueRow alloc];
      v52 = PKLocalizedCocoonString(&cfstr_PlanStatusComp.isa);
      v53 = PKLocalizedCocoonString(&cfstr_PlanStatusComp_0.isa);
      v54 = [(PKPayLaterTitleDetailValueRow *)v51 initWithTitle:v52 detail:v53 value:0 accessory:0 selectionHandler:0];

      v29 = v54;
      [(PKPayLaterTitleDetailValueRow *)v54 setDetailIcon:v8];
      v55 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(PKPayLaterTitleDetailValueRow *)v54 setTitleColor:v55];

      v56 = [MEMORY[0x1E4FB1618] labelColor];
      [(PKPayLaterTitleDetailValueRow *)v54 setDetailColor:v56];

      v57 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], v45, 0x8000, 0);
      [(PKPayLaterTitleDetailValueRow *)v54 setTitleFont:v57];

      v58 = PKFontForDefaultDesign(v44, v45, 2, 0);
      [(PKPayLaterTitleDetailValueRow *)v54 setDetailFont:v58];

      [v61 addObject:v54];
    }
    else
    {
      id v7 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
      int v8 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
      int v9 = [v7 paymentAmountToDate];
      v59 = [v7 currentBalance];
      int v10 = [v8 installments];
      uint64_t v11 = [v10 count];

      id v12 = [v8 nextDueInstallment];
      int v13 = v12;
      if (v11) {
        BOOL v14 = v12 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      uint64_t v15 = v11;
      if (!v14)
      {
        int v16 = [v12 installmentIdentifier];
        uint64_t v15 = [v8 installmentNumberForInstallmentIdentifier:v16];
      }
      if ([(PKPayLaterFinancingPlan *)self->_financingPlan productType] == 1)
      {
        numberFormatter = self->_numberFormatter;
        v18 = [NSNumber numberWithInteger:v15];
        int v19 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v18];
        v20 = self->_numberFormatter;
        v21 = [NSNumber numberWithInteger:v11];
        int v22 = [(NSNumberFormatter *)v20 stringFromNumber:v21];
        PKLocalizedCocoonString(&cfstr_InstallmentPai_1.isa, &cfstr_12.isa, v19, v22);
        uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v23 = 0;
      }
      totalPaidRow = self->_totalPaidRow;
      if (!totalPaidRow)
      {
        uint64_t v25 = objc_alloc_init(PKPayLaterStackedLeadingTrailingRow);
        v26 = self->_totalPaidRow;
        self->_totalPaidRow = v25;

        totalPaidRow = self->_totalPaidRow;
      }
      v27 = PKLocalizedCocoonString(&cfstr_TotalPaid.isa);
      [(PKPayLaterStackedLeadingTrailingRow *)totalPaidRow setLeadingPrimaryText:v27];

      int v28 = self->_totalPaidRow;
      v29 = v9;
      v30 = [(PKPayLaterTitleDetailValueRow *)v9 formattedStringValue];
      [(PKPayLaterStackedLeadingTrailingRow *)v28 setLeadingSecondaryText:v30];

      v31 = self->_totalPaidRow;
      v32 = PKLocalizedCocoonString(&cfstr_TotalRemaining.isa);
      [(PKPayLaterStackedLeadingTrailingRow *)v31 setTrailingPrimaryText:v32];

      v33 = self->_totalPaidRow;
      id v34 = [v59 formattedStringValue];
      [(PKPayLaterStackedLeadingTrailingRow *)v33 setTrailingSecondaryText:v34];

      if (v23) {
        id v35 = v23;
      }
      else {
        id v35 = &stru_1EF1B5B50;
      }
      [(PKPayLaterStackedLeadingTrailingRow *)self->_totalPaidRow setDetailText:v35];
      [(PKPayLaterStackedLeadingTrailingRow *)self->_totalPaidRow setShowProgressBar:1];
      objc_super v36 = self->_totalPaidRow;
      v37 = PKPayLaterUIProgressBarStartColor();
      [(PKPayLaterStackedLeadingTrailingRow *)v36 setProgressBarStartColor:v37];

      v38 = self->_totalPaidRow;
      v39 = PKPayLaterUIProgressBarEndColor();
      [(PKPayLaterStackedLeadingTrailingRow *)v38 setProgressBarEndColor:v39];

      v40 = self->_totalPaidRow;
      [v7 progress];
      -[PKPayLaterStackedLeadingTrailingRow setProgress:](v40, "setProgress:");
      [v61 addObject:self->_totalPaidRow];
    }
    id v5 = v60;
  }
  v41 = [(PKPayLaterFinancingPlanSectionController *)self _totalCostRow];
  [v61 addObject:v41];
  v42 = (void *)[v61 copy];
  [v5 appendItems:v42];
}

- (void)_configureDashboardMessagesSection:(id)a3
{
  unint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v14 = objc_alloc_init(v4);
  if ([(NSOrderedSet *)self->_dashboardMessages count])
  {
    currentDashboardMessageIdentifier = self->_currentDashboardMessageIdentifier;
    if (currentDashboardMessageIdentifier)
    {
      int64_t v7 = [(PKPayLaterFinancingPlanSectionController *)self _dashboardMessageIndexForIdentifier:currentDashboardMessageIdentifier inMessages:self->_dashboardMessages];
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSUInteger v8 = [(NSOrderedSet *)self->_dashboardMessages count];
        if (v8 - 1 < self->_currentDashboardMessageIndex) {
          self->_currentDashboardMessageIndex = v8 - 1;
        }
      }
      else
      {
        self->_currentDashboardMessageIndex = v7;
      }
    }
    else
    {
      int v9 = [(NSOrderedSet *)self->_dashboardMessages firstObject];
      int v10 = [v9 identifier];
      uint64_t v11 = self->_currentDashboardMessageIdentifier;
      self->_currentDashboardMessageIdentifier = v10;

      self->_currentDashboardMessageIndex = 0;
    }
    id v12 = [[PKPayLaterDashboardMessagesRow alloc] initWithMessages:self->_dashboardMessages currentMessageIndex:self->_currentDashboardMessageIndex messagesViewDelegate:self];
    [v14 addObject:v12];
  }
  int v13 = (void *)[v14 copy];
  [v5 appendItems:v13];
}

- (void)_configureStatusInformationSummarySection:(id)a3
{
  unint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v47 = objc_alloc_init(v4);
  unint64_t v6 = 0;
  int64_t v7 = 0;
  switch([(PKPayLaterFinancingPlan *)self->_financingPlan state])
  {
    case 1:
      NSUInteger v8 = @"FINANCING_PLAN_STATUS_VALUE_IN_PROGRESS";
      goto LABEL_15;
    case 2:
      int64_t v7 = PKLocalizedCocoonString(&cfstr_FinancingPlanS_0.isa);
      int v9 = [(PKPayLaterFinancingPlan *)self->_financingPlan fundingSource];
      int v10 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
      uint64_t v11 = [v10 installmentAmount];

      id v12 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
      uint64_t v13 = [v12 installmentCount];

      id v14 = [v9 unmaskedPanSuffix];
      uint64_t v15 = [v9 type];
      switch(v15)
      {
        case 3:
          goto LABEL_6;
        case 2:
          int v16 = [v11 formattedStringValue];
          numberFormatter = self->_numberFormatter;
          v18 = [NSNumber numberWithUnsignedInteger:v13];
          int v19 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v18];
          PKLocalizedCocoonString(&cfstr_PlanPendingDes_0.isa, &stru_1EF1B9A70.isa, v16, v14, v19);
          break;
        case 1:
LABEL_6:
          int v16 = [v11 formattedStringValue];
          id v17 = self->_numberFormatter;
          v18 = [NSNumber numberWithUnsignedInteger:v13];
          int v19 = [(NSNumberFormatter *)v17 stringFromNumber:v18];
          PKLocalizedCocoonString(&cfstr_PlanPendingDes.isa, &stru_1EF1B9A70.isa, v16, v14, v19);
          break;
        default:
          goto LABEL_17;
      }
      goto LABEL_20;
    case 3:
      int64_t v7 = PKLocalizedCocoonString(&cfstr_FinancingPlanS_0.isa);
      int v9 = [(PKPayLaterFinancingPlan *)self->_financingPlan fundingSource];
      v20 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
      uint64_t v11 = [v20 installmentAmount];

      v21 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
      uint64_t v22 = [v21 installmentCount];

      id v14 = [v9 unmaskedPanSuffix];
      uint64_t v23 = [v9 type];
      switch(v23)
      {
        case 3:
          goto LABEL_10;
        case 2:
          int v16 = [v11 formattedStringValue];
          v29 = self->_numberFormatter;
          v18 = [NSNumber numberWithUnsignedInteger:v22];
          int v19 = [(NSNumberFormatter *)v29 stringFromNumber:v18];
          PKLocalizedCocoonString(&cfstr_PlanPendingCon_0.isa, &stru_1EF1B9A70.isa, v16, v14, v19);
          break;
        case 1:
LABEL_10:
          int v16 = [v11 formattedStringValue];
          v24 = self->_numberFormatter;
          v18 = [NSNumber numberWithUnsignedInteger:v22];
          int v19 = [(NSNumberFormatter *)v24 stringFromNumber:v18];
          PKLocalizedCocoonString(&cfstr_PlanPendingCon.isa, &stru_1EF1B9A70.isa, v16, v14, v19);
          break;
        default:
LABEL_17:
          unint64_t v6 = 0;
          goto LABEL_22;
      }
      unint64_t v6 = LABEL_20:;

LABEL_21:
LABEL_22:

LABEL_43:
LABEL_44:
      v39 = [[PKPayLaterTitleDetailValueRow alloc] initWithTitle:v7 detail:v6 value:0 accessory:0 selectionHandler:0];
      statusSummaryRow = self->_statusSummaryRow;
      self->_statusSummaryRow = v39;

      v41 = self->_statusSummaryRow;
      v42 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(PKPayLaterTitleDetailValueRow *)v41 setDetailColor:v42];

      v43 = self->_statusSummaryRow;
      v44 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27D0], 2, 0);
      [(PKPayLaterTitleDetailValueRow *)v43 setTitleFont:v44];

      [v47 safelyAddObject:self->_statusSummaryRow];
      v45 = [(PKPayLaterFinancingPlanSectionController *)self _totalCostRow];
      [v47 addObject:v45];
      v46 = (void *)[v47 copy];
      [v5 appendItems:v46];

      return;
    case 4:
      NSUInteger v8 = @"FINANCING_PLAN_STATUS_VALUE_PAST_DUE";
      goto LABEL_15;
    case 5:
      uint64_t v25 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
      int v9 = [v25 displayName];

      int64_t v7 = PKLocalizedCocoonString(&cfstr_FinancingPlanS_2.isa);
      v26 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
      uint64_t v27 = [v26 cancellationReason];

      switch(v27)
      {
        case 0:
        case 1:
          PKLocalizedCocoonString(&cfstr_PlanCanceledIn.isa, &stru_1EF1B4C70.isa, v9);
          goto LABEL_42;
        case 2:
          uint64_t v30 = PKLocalizedCocoonString(&cfstr_FinancingPlanS_5.isa);

          v31 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
          v32 = [v31 cancellationDate];

          if (v32)
          {
            v33 = [(NSDateFormatter *)self->_shortDateFormatter stringFromDate:v32];
            unint64_t v6 = PKLocalizedCocoonString(&cfstr_PlanCanceledMa.isa, &stru_1EF1B4C70.isa, v33);
          }
          else
          {
            unint64_t v6 = PKLocalizedCocoonString(&cfstr_PlanCanceledMa_0.isa);
          }

          int64_t v7 = (void *)v30;
          goto LABEL_43;
        case 3:
          id v34 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
          id v35 = [v34 paymentsOfType:5];
          uint64_t v11 = [v35 firstObject];

          objc_super v36 = [v11 fundingSources];
          id v14 = [v36 firstObject];

          int v16 = [v14 displayName];
          uint64_t v37 = [v14 unmaskedPanSuffix];
          v18 = (void *)v37;
          if (v16) {
            BOOL v38 = v37 == 0;
          }
          else {
            BOOL v38 = 1;
          }
          if (v38) {
            PKLocalizedCocoonString(&cfstr_PlanCanceledPa_0.isa, &stru_1EF1B4C70.isa, v9);
          }
          else {
          unint64_t v6 = PKLocalizedCocoonString(&cfstr_PlanCanceledPa.isa, &stru_1EF1B9A70.isa, v9, v16, v37);
          }
          goto LABEL_21;
        case 4:
          PKLocalizedCocoonString(&cfstr_PlanCanceledHi.isa, &stru_1EF1B4C70.isa, v9);
          goto LABEL_42;
        case 5:
          PKLocalizedCocoonString(&cfstr_PlanCanceledUn.isa, &stru_1EF1B4C70.isa, v9);
          goto LABEL_42;
        case 6:
          PKLocalizedCocoonString(&cfstr_PlanCanceledIn_0.isa, &stru_1EF1B4C70.isa, v9);
          goto LABEL_42;
        case 7:
          PKLocalizedCocoonString(&cfstr_PlanCanceledIn_1.isa, &stru_1EF1B4C70.isa, v9);
          goto LABEL_42;
        case 8:
          PKLocalizedCocoonString(&cfstr_PlanCanceledLo.isa, &stru_1EF1B4C70.isa, v9);
          goto LABEL_42;
        case 9:
          PKLocalizedCocoonString(&cfstr_PlanCanceledFr.isa, &stru_1EF1B4C70.isa, v9);
          goto LABEL_42;
        case 10:
          PKLocalizedCocoonString(&cfstr_PlanCanceledFr_0.isa, &stru_1EF1B4C70.isa, v9);
          goto LABEL_42;
        case 11:
          PKLocalizedCocoonString(&cfstr_PlanCanceledTr.isa, &stru_1EF1B4C70.isa, v9);
          goto LABEL_42;
        case 12:
          PKLocalizedCocoonString(&cfstr_PlanCanceledPa_1.isa, &stru_1EF1B4C70.isa, v9);
          goto LABEL_42;
        case 13:
          PKLocalizedCocoonString(&cfstr_PlanCanceledMe.isa, &stru_1EF1B4C70.isa, v9);
          unint64_t v6 = LABEL_42:;
          break;
        default:
          unint64_t v6 = 0;
          break;
      }
      goto LABEL_43;
    case 6:
      NSUInteger v8 = @"FINANCING_PLAN_STATUS_VALUE_COMPLETE";
LABEL_15:
      int64_t v7 = PKLocalizedCocoonString(&v8->isa);
      unint64_t v6 = 0;
      goto LABEL_44;
    case 8:
      int64_t v7 = PKLocalizedCocoonString(&cfstr_FinancingPlanS_4.isa);
      unint64_t v6 = PKLocalizedCocoonString(&cfstr_PlanPendingCan.isa);
      goto LABEL_44;
    default:
      goto LABEL_44;
  }
}

- (id)_totalCostRow
{
  id v3 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
  unint64_t v4 = [v3 totalAmount];

  objc_initWeak(&location, self);
  totalFinancedRow = self->_totalFinancedRow;
  if (!totalFinancedRow)
  {
    unint64_t v6 = [PKPayLaterTitleDetailRow alloc];
    int64_t v7 = PKLocalizedCocoonString(&cfstr_TotalCost.isa);
    NSUInteger v8 = [v4 formattedStringValue];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    int v16 = __57__PKPayLaterFinancingPlanSectionController__totalCostRow__block_invoke;
    id v17 = &unk_1E59CA7F8;
    objc_copyWeak(&v18, &location);
    int v9 = [(PKPayLaterTitleDetailRow *)v6 initWithTitle:v7 detail:v8 selectionHandler:&v14];
    int v10 = self->_totalFinancedRow;
    self->_totalFinancedRow = v9;

    objc_destroyWeak(&v18);
    totalFinancedRow = self->_totalFinancedRow;
  }
  uint64_t v11 = objc_msgSend(v4, "formattedStringValue", v14, v15, v16, v17);
  [(PKPayLaterTitleDetailRow *)totalFinancedRow setDetail:v11];

  id v12 = self->_totalFinancedRow;
  objc_destroyWeak(&location);

  return v12;
}

void __57__PKPayLaterFinancingPlanSectionController__totalCostRow__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [PKPayLaterFinancingPlanCostViewController alloc];
    uint64_t v2 = WeakRetained[28];
    id v3 = [WeakRetained payLaterAccount];
    unint64_t v4 = [(PKPayLaterFinancingPlanCostViewController *)v1 initWithFinancingPlan:v2 payLaterAccount:v3];

    id v5 = [WeakRetained viewControllerDelegate];
    [v5 pushViewController:v4 animated:1];
  }
}

- (void)_configureFundingSourceSection:(id)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  uint64_t v25 = [(PKPayLaterFinancingPlan *)self->_financingPlan fundingSource];
  if ([v25 autoPayment]) {
    [(PKPayLaterFinancingPlan *)self->_financingPlan fundingSourceName];
  }
  else {
  uint64_t v27 = PKLocalizedPaymentString(&cfstr_StateOff.isa);
  }
  id v5 = [PKPayLaterTitleDetailRow alloc];
  unint64_t v6 = PKLocalizedCocoonString(&cfstr_AutoPay.isa);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __75__PKPayLaterFinancingPlanSectionController__configureFundingSourceSection___block_invoke;
  v28[3] = &unk_1E59CB010;
  objc_copyWeak(&v29, &location);
  v28[4] = self;
  int64_t v7 = [(PKPayLaterTitleDetailRow *)v5 initWithTitle:v6 detail:v27 selectionHandler:v28];
  fundingSourceRow = self->_fundingSourceRow;
  self->_fundingSourceRow = v7;

  int v9 = self->_fundingSourceRow;
  int v10 = (void *)*MEMORY[0x1E4FB27D0];
  uint64_t v11 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27D0], 0x8000, 0);
  [(PKPayLaterTitleDetailRow *)v9 setTitleFont:v11];

  id v12 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v13 = [MEMORY[0x1E4FB1618] labelColor];
  v31[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
  uint64_t v15 = [v14 colorWithAlphaComponent:0.15];
  v31[1] = v15;
  int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  id v17 = [v12 configurationWithPaletteColors:v16];

  id v18 = (void *)MEMORY[0x1E4FB1830];
  int v19 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2990], v10, 0, 0);
  v20 = [v18 configurationWithFont:v19];

  v21 = [v17 configurationByApplyingConfiguration:v20];
  uint64_t v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.triangle.2.circlepath.circle.fill"];
  uint64_t v23 = [v22 imageWithConfiguration:v21];

  [(PKPayLaterTitleDetailRow *)self->_fundingSourceRow setImage:v23];
  [v4 addObject:self->_fundingSourceRow];
  v24 = (void *)[v4 copy];
  [v26 appendItems:v24];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __75__PKPayLaterFinancingPlanSectionController__configureFundingSourceSection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 12) setShowSpinner:1];
    id v4 = [v3 dynamicCollectionDelegate];
    [v4 reloadItem:v3[12] animated:1];

    id v5 = [[PKPayLaterChangeFundingSourceViewController alloc] initWithFinancingPlan:v3[28] payLaterPass:v3[13] paymentIntentController:v3[29]];
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75__PKPayLaterFinancingPlanSectionController__configureFundingSourceSection___block_invoke_2;
    v7[3] = &unk_1E59CBA18;
    objc_copyWeak(&v9, &location);
    unint64_t v6 = v5;
    NSUInteger v8 = v6;
    [(PKPayLaterChangeFundingSourceViewController *)v6 preflightWithCompletion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __75__PKPayLaterFinancingPlanSectionController__configureFundingSourceSection___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 12) setShowSpinner:0];
    unint64_t v6 = [v5 dynamicCollectionDelegate];
    [v6 reloadItem:v5[12] animated:1];

    if (v10)
    {
      int64_t v7 = PKAccountDisplayableError();
      id v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);

      if (v8)
      {
        id v9 = [v5 dynamicCollectionDelegate];
        [v9 presentViewController:v8 animated:1 completion:0];
      }
    }
    else
    {
      id v8 = [v5 viewControllerDelegate];
      [v8 pushViewController:*(void *)(a1 + 32) animated:1];
    }
  }
}

- (void)_configurePaymentScheduleSection:(id)a3
{
  paymentScheduleComposer = self->_paymentScheduleComposer;
  financingPlan = self->_financingPlan;
  id v6 = a3;
  int64_t v7 = [(PKPayLaterSectionController *)self payLaterAccount];
  id v8 = [(PKPayLaterFinancingPlanPaymentScheduleComposer *)paymentScheduleComposer composeFinancingPlanPaymentScheduleLineItemsForPlan:financingPlan payLaterAccount:v7];

  [v6 appendItems:v8];
}

- (void)_configureMiniMirandaSection:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  miniMirandaRow = self->_miniMirandaRow;
  id v17 = v6;
  if (!miniMirandaRow)
  {
    id v8 = [PKPayLaterSubtitleRow alloc];
    id v9 = PKLocalizedCocoonString(&cfstr_AccountDebtCol.isa);
    id v10 = [(PKPayLaterSubtitleRow *)v8 initWithTitle:v9 subtitle:0 selectionHandler:0];
    uint64_t v11 = self->_miniMirandaRow;
    self->_miniMirandaRow = v10;

    id v12 = self->_miniMirandaRow;
    uint64_t v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(PKPayLaterSubtitleRow *)v12 setTitleTextColor:v13];

    uint64_t v14 = self->_miniMirandaRow;
    uint64_t v15 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28F0], (void *)*MEMORY[0x1E4FB2788], 0x8000, 0);
    [(PKPayLaterSubtitleRow *)v14 setTitleFont:v15];

    id v6 = v17;
    miniMirandaRow = self->_miniMirandaRow;
  }
  [v6 addObject:miniMirandaRow];
  int v16 = (void *)[v17 copy];
  [v5 appendItems:v16];
}

- (unint64_t)_dashboardMessageIndexForIdentifier:(id)a3 inMessages:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__PKPayLaterFinancingPlanSectionController__dashboardMessageIndexForIdentifier_inMessages___block_invoke;
  v9[3] = &unk_1E59D94D0;
  id v10 = v5;
  id v6 = v5;
  unint64_t v7 = [a4 indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __91__PKPayLaterFinancingPlanSectionController__dashboardMessageIndexForIdentifier_inMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  unint64_t v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (void)messagesView:(id)a3 scrolledToMessageWithIdentifier:(id)a4
{
  p_currentDashboardMessageIdentifier = &self->_currentDashboardMessageIdentifier;
  objc_storeStrong((id *)&self->_currentDashboardMessageIdentifier, a4);
  id v8 = a4;
  id v9 = a3;
  id v10 = *p_currentDashboardMessageIdentifier;
  id v12 = [v9 messages];

  int64_t v11 = [(PKPayLaterFinancingPlanSectionController *)self _dashboardMessageIndexForIdentifier:v10 inMessages:v12];
  self->_currentDashboardMessageIndex = v11;
}

- (BOOL)messagesView:(id)a3 shouldEnqueueEventForView:(id)a4
{
  return 1;
}

- (UIImage)merchantIcon
{
  return self->_merchantIcon;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (void)setFinancingPlan:(id)a3
{
}

- (PKPayLaterPaymentIntentController)paymentIntentController
{
  return self->_paymentIntentController;
}

- (void)setPaymentIntentController:(id)a3
{
}

- (NSOrderedSet)dashboardMessages
{
  return self->_dashboardMessages;
}

- (void)setDashboardMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dashboardMessages, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_merchantIcon, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_mediumDateFormatter, 0);
  objc_storeStrong((id *)&self->_shortDateFormatter, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_currentDashboardMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentScheduleComposer, 0);
  objc_storeStrong((id *)&self->_reportIssueButton, 0);
  objc_storeStrong((id *)&self->_miniMirandaRow, 0);
  objc_storeStrong((id *)&self->_statusSummaryRow, 0);
  objc_storeStrong((id *)&self->_totalFinancedRow, 0);
  objc_storeStrong((id *)&self->_totalPaidRow, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);

  objc_storeStrong((id *)&self->_fundingSourceRow, 0);
}

@end