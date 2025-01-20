@interface PKPayLaterFinancingPlanPaymentSectionController
- (Class)headerViewClassForSectionIdentifier:(id)a3;
- (PKPayLaterFinancingPlan)financingPlan;
- (PKPayLaterFinancingPlanPaymentSectionController)initWithFinancingPlan:(id)a3 payment:(id)a4 payLaterAccount:(id)a5 paymentIntentController:(id)a6 merchantIcon:(id)a7 delegate:(id)a8;
- (PKPayLaterPayment)payment;
- (id)identifiers;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configurePaymentSummarySection:(id)a3;
- (void)_configureReportIssueSection:(id)a3;
- (void)configureHeaderView:(id)a3 forSectionIdentifier:(id)a4;
- (void)setFinancingPlan:(id)a3;
- (void)setPayment:(id)a3;
@end

@implementation PKPayLaterFinancingPlanPaymentSectionController

- (PKPayLaterFinancingPlanPaymentSectionController)initWithFinancingPlan:(id)a3 payment:(id)a4 payLaterAccount:(id)a5 paymentIntentController:(id)a6 merchantIcon:(id)a7 delegate:(id)a8
{
  id v15 = a3;
  id v39 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v40.receiver = self;
  v40.super_class = (Class)PKPayLaterFinancingPlanPaymentSectionController;
  v19 = [(PKPayLaterSectionController *)&v40 initWithPayLaterAccount:v16 dynamicContentPage:0 viewControllerDelegate:a8];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_financingPlan, a3);
    objc_storeStrong((id *)&v20->_payment, a4);
    objc_storeStrong((id *)&v20->_paymentIntentController, a6);
    objc_storeStrong((id *)&v20->_merchantIcon, a7);
    p_resizedMerchantIcon = (void **)&v20->_resizedMerchantIcon;
    objc_storeStrong((id *)&v20->_resizedMerchantIcon, v20->_merchantIcon);
    v22 = [MEMORY[0x1E4F84898] sharedInstance];
    v23 = [v16 associatedPassUniqueID];
    v24 = [v22 passWithUniqueID:v23];
    uint64_t v25 = [v24 paymentPass];
    payLaterPass = v20->_payLaterPass;
    v20->_payLaterPass = (PKPaymentPass *)v25;

    if (v20->_merchantIcon)
    {
      [(UIImage *)v20->_merchantIcon size];
      if (v28 != 45.0 || v27 != 45.0)
      {
        v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F84780]), "initWithCGImage:scale:orientation:", -[UIImage CGImage](v20->_merchantIcon, "CGImage"), 1, PKUIScreenScale());
        v30 = objc_msgSend(MEMORY[0x1E4F84790], "constraintsWithAspectFillToSize:", 45.0, 45.0);
        v31 = [v29 resizedImageWithConstraints:v30];

        uint64_t v32 = [MEMORY[0x1E4FB1818] imageWithPKImage:v31];
        v33 = *p_resizedMerchantIcon;
        *p_resizedMerchantIcon = (void *)v32;
      }
    }
    v34 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    paymentDateFormatter = v20->_paymentDateFormatter;
    v20->_paymentDateFormatter = v34;

    v36 = v20->_paymentDateFormatter;
    v37 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [(NSDateFormatter *)v36 setCalendar:v37];

    [(NSDateFormatter *)v20->_paymentDateFormatter setDateStyle:1];
    [(NSDateFormatter *)v20->_paymentDateFormatter setTimeStyle:1];
  }

  return v20;
}

- (id)identifiers
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"kPaymentSummarySection";
  v4[1] = @"kReportIssueSection";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == @"kPaymentSummarySection") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_5;
  }
  int v9 = [@"kPaymentSummarySection" isEqualToString:v7];

  if (v9)
  {
LABEL_4:
    [(PKPayLaterFinancingPlanPaymentSectionController *)self _configurePaymentSummarySection:v6];
  }
  else
  {
    v11 = v8;
    if (v11 == @"kReportIssueSection"
      || (v12 = v11, int v13 = [@"kReportIssueSection" isEqualToString:v11], v12, v13))
    {
      [(PKPayLaterFinancingPlanPaymentSectionController *)self _configureReportIssueSection:v6];
    }
  }
LABEL_5:

  return v6;
}

- (Class)headerViewClassForSectionIdentifier:(id)a3
{
  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == @"kPaymentSummarySection"
    || v3 && (int v5 = [@"kPaymentSummarySection" isEqualToString:v3], v4, v5))
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
  id v21 = a3;
  id v6 = (__CFString *)a4;
  v7 = v6;
  if (v6 == @"kPaymentSummarySection"
    || v6 && (int v8 = [@"kPaymentSummarySection" isEqualToString:v6], v7, v8))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [v21 headerView];
      v10 = [(PKPayLaterPayment *)self->_payment amount];
      v11 = [v10 formattedStringValue];

      BOOL v12 = [(PKPayLaterPayment *)self->_payment type] == 1
         || [(PKPayLaterPayment *)self->_payment type] == 5;
      int v13 = [(PKPayLaterPayment *)self->_payment amount];
      v14 = [v13 amount];
      int v15 = objc_msgSend(v14, "pk_isPositiveNumber");

      if ([v11 length] && !v12 && v15)
      {
        uint64_t v16 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v11);

        v11 = (void *)v16;
      }
      [v9 setAmountText:v11];
      id v17 = PKLocalizedCocoonString(&cfstr_ApplePayLater.isa);
      [v9 setSubtitleText:v17];

      paymentDateFormatter = self->_paymentDateFormatter;
      v19 = [(PKPayLaterPayment *)self->_payment postedDate];
      v20 = [(NSDateFormatter *)paymentDateFormatter stringFromDate:v19];
      [v9 setSecondarySubtitleText:v20];
    }
  }
}

- (void)_configurePaymentSummarySection:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v62 = objc_alloc_init(v4);
  id v6 = [(PKPayLaterPayment *)self->_payment amount];
  v7 = [v6 formattedStringValue];

  BOOL v8 = [(PKPayLaterPayment *)self->_payment type] == 1 || [(PKPayLaterPayment *)self->_payment type] == 5;
  int v9 = [(PKPayLaterPayment *)self->_payment amount];
  v10 = [v9 amount];
  int v11 = objc_msgSend(v10, "pk_isPositiveNumber");

  if ([v7 length] && !v8 && v11)
  {
    uint64_t v12 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v7);

    v7 = (void *)v12;
  }
  int v13 = [(PKPayLaterFinancingPlan *)self->_financingPlan disputes];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __83__PKPayLaterFinancingPlanPaymentSectionController__configurePaymentSummarySection___block_invoke;
  v63[3] = &unk_1E59D29E0;
  v63[4] = self;
  int v14 = objc_msgSend(v13, "pk_containsObjectPassingTest:", v63);

  int v15 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
  uint64_t v16 = [v15 displayNamePurchase];

  if (v16)
  {
    id v17 = v16;
  }
  else
  {
    PKLocalizedCocoonString(&cfstr_InstallmentWit.isa);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v18 = v17;
  v61 = v5;
  switch([(PKPayLaterPayment *)self->_payment type])
  {
    case 0:
    case 1:
    case 5:
      v19 = @"APPLE_PAY_LATER";
      goto LABEL_19;
    case 2:
      v19 = @"FINANCING_PLAN_PAYMENT_TEMPORARY_CREDIT_ADJUSTMENT";
      goto LABEL_19;
    case 3:
      if (v14)
      {
        v19 = @"FINANCING_PLAN_PAYMENT_CREDIT_ADJUSTMENT";
LABEL_19:
        uint64_t v20 = PKLocalizedCocoonString(&v19->isa);
      }
      else
      {
        uint64_t v20 = PKLocalizedCocoonString(&cfstr_FinancingPlanP_3.isa);
        if ([(PKPayLaterPayment *)self->_payment subtype] == 1)
        {
          uint64_t v54 = PKLocalizedCocoonString(&cfstr_FinancingPlanP_2.isa);
          v55 = (void *)v20;
          uint64_t v20 = v54;
        }
      }
LABEL_20:
      v59 = (void *)v20;
      id v21 = [[PKPayLaterTitleDetailValueRow alloc] initWithTitle:v20 detail:v18 value:0 accessory:0 selectionHandler:0];
      v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(PKPayLaterTitleDetailValueRow *)v21 setDetailColor:v22];

      [(PKPayLaterTitleDetailValueRow *)v21 setLabelPadding:2.0];
      [(PKPayLaterTitleDetailValueRow *)v21 setAxID:*MEMORY[0x1E4F85AB8]];
      [v62 safelyAddObject:v21];
      v23 = +[PKPayLaterFinancingPlanPaymentScheduleComposer detailTextForPayment:self->_payment financingPlan:self->_financingPlan];
      v58 = v23;
      if ([v23 length])
      {
        v24 = [[PKPayLaterTitleDetailValueRow alloc] initWithTitle:0 detail:v23 value:0 accessory:0 selectionHandler:0];
        uint64_t v25 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [(PKPayLaterTitleDetailValueRow *)v24 setDetailColor:v25];

        [(PKPayLaterTitleDetailValueRow *)v24 setAxID:*MEMORY[0x1E4F85598]];
        [v62 safelyAddObject:v24];
      }
      uint64_t v26 = [(PKPayLaterPayment *)self->_payment type];
      v60 = v18;
      if (v26 == 1)
      {
        double v27 = @"FINANCING_PLAN_PAYMENT_STATUS_CLEARED";
        goto LABEL_26;
      }
      if (v26 == 5)
      {
        double v27 = @"FINANCING_PLAN_PAYMENT_STATUS_DECLINED";
LABEL_26:
        double v28 = PKLocalizedCocoonString(&v27->isa);
        goto LABEL_28;
      }
      double v28 = 0;
LABEL_28:
      v29 = off_1E59C3000;
      if ([v28 length])
      {
        v56 = v16;
        v57 = v7;
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v31 = [[PKMultiKeyValueCellKeyValueSource alloc] initWithTitle:v28 subtitle:0];
        uint64_t v32 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [(PKMultiKeyValueCellKeyValueSource *)v31 setSubtitleTextColor:v32];

        [(PKMultiKeyValueCellKeyValueSource *)v31 setBold:1];
        [v30 addObject:v31];
        v33 = [(PKPayLaterPayment *)self->_payment fundingSources];
        v34 = [v33 firstObject];
        v35 = [v34 displayName];

        v36 = [(PKPayLaterPayment *)self->_payment fundingSources];
        v37 = [v36 firstObject];
        v38 = [v37 panSuffix];

        if (v35)
        {
          if (v38)
          {
            id v39 = PKLocalizedCocoonString(&cfstr_FinancingPlanP_6.isa, &stru_1EF1B4C70.isa, v38);
          }
          else
          {
            id v39 = 0;
          }
          objc_super v40 = [[PKMultiKeyValueCellKeyValueSource alloc] initWithTitle:v35 subtitle:v39];
          v41 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
          [(PKMultiKeyValueCellKeyValueSource *)v40 setSubtitleTextColor:v41];

          [v30 addObject:v40];
          v29 = off_1E59C3000;
        }
        id v42 = objc_alloc(v29[291]);
        v43 = (void *)[v30 copy];
        v44 = (void *)[v42 initKeyValueSources:v43];

        [v44 setAxID:*MEMORY[0x1E4F85A58]];
        [v62 addObject:v44];

        uint64_t v16 = v56;
        v7 = v57;
      }
      id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v46 = [PKMultiKeyValueCellKeyValueSource alloc];
      v47 = PKLocalizedCocoonString(&cfstr_Total_0.isa);
      v48 = [(PKMultiKeyValueCellKeyValueSource *)v46 initWithTitle:v47 subtitle:v7];

      [(PKMultiKeyValueCellKeyValueSource *)v48 setBold:1];
      v49 = [MEMORY[0x1E4FB1618] labelColor];
      [(PKMultiKeyValueCellKeyValueSource *)v48 setSubtitleTextColor:v49];

      [v45 addObject:v48];
      [(PKPayLaterFinancingPlan *)self->_financingPlan productType];
      id v50 = objc_alloc(v29[291]);
      v51 = (void *)[v45 copy];
      v52 = (void *)[v50 initKeyValueSources:v51];

      [v52 setAxID:*MEMORY[0x1E4F85AC0]];
      [v62 addObject:v52];
      v53 = (void *)[v62 copy];
      [v61 appendItems:v53];

      return;
    case 4:
      v19 = @"FINANCING_PLAN_PAYMENT_CREDIT_REVOKED_ADJUSTMENT";
      goto LABEL_19;
    case 6:
      v19 = @"FINANCING_PLAN_PAYMENT_REFUND_REVOKED_ADJUSTMENT";
      goto LABEL_19;
    default:
      uint64_t v20 = 0;
      goto LABEL_20;
  }
}

uint64_t __83__PKPayLaterFinancingPlanPaymentSectionController__configurePaymentSummarySection___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 appliedPayments];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__PKPayLaterFinancingPlanPaymentSectionController__configurePaymentSummarySection___block_invoke_2;
  v6[3] = &unk_1E59D29B8;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __83__PKPayLaterFinancingPlanPaymentSectionController__configurePaymentSummarySection___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 paymentIdentifier];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 176) paymentIdentifier];
  id v5 = v3;
  id v6 = v4;
  v7 = v6;
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

- (void)_configureReportIssueSection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  id v6 = [PKPayLaterButtonRow alloc];
  v7 = PKLocalizedCocoonString(&cfstr_ReportAnIssue.isa);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke;
  v10[3] = &unk_1E59CB010;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  uint64_t v8 = [(PKPayLaterButtonRow *)v6 initWithTitle:v7 selectionHandler:v10];
  reportIssueButton = self->_reportIssueButton;
  self->_reportIssueButton = v8;

  [v5 addObject:self->_reportIssueButton];
  [v4 appendItems:v5];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 12) setShowSpinner:1];
    id v5 = [v4 dynamicCollectionDelegate];
    [v5 reloadItem:v4[12] animated:1];

    id v6 = [PKPayLaterBusinessChatTopicComposer alloc];
    v7 = [v4 payLaterAccount];
    uint64_t v8 = [(PKPayLaterBusinessChatTopicComposer *)v6 initWithPayLaterAccount:v7 payLaterPass:v4[14] financingPlan:v4[21] installment:0 payment:v4[22]];
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 160);
    *(void *)(v9 + 160) = v8;

    id v11 = *(void **)(*(void *)(a1 + 32) + 160);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_2;
    v12[3] = &unk_1E59CE860;
    objc_copyWeak(v13, v2);
    v12[4] = *(void *)(a1 + 32);
    v13[1] = (id)3;
    [v11 releventTopicsForContext:3 completion:v12];
    objc_destroyWeak(v13);
  }
}

void __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_3;
  v6[3] = &unk_1E59CE838;
  objc_copyWeak(v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  v9[1] = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(v9);
}

void __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) count])
    {
      id v3 = [PKPayLaterBusinessChatTopicsViewController alloc];
      uint64_t v4 = [WeakRetained payLaterAccount];
      id v5 = [(PKPayLaterBusinessChatTopicsViewController *)v3 initWithPayLaterAccount:v4 payLaterPass:WeakRetained[14] financingPlan:WeakRetained[21] installment:0 payment:WeakRetained[22] topics:*(void *)(a1 + 32) businessChatContext:*(void *)(a1 + 56)];

      id v6 = [[PKNavigationController alloc] initWithRootViewController:v5];
      id v7 = [WeakRetained dynamicCollectionDelegate];
      [v7 presentViewController:v6 animated:1 completion:0];

      [WeakRetained[12] setShowSpinner:0];
      uint64_t v8 = [WeakRetained dynamicCollectionDelegate];
      [v8 reloadItem:WeakRetained[12] animated:1];
    }
    else
    {
      id v9 = WeakRetained[17];
      if (v9) {
        v10 = (PKBusinessChatController *)v9;
      }
      else {
        v10 = objc_alloc_init(PKBusinessChatController);
      }
      id v11 = WeakRetained[17];
      WeakRetained[17] = v10;

      objc_initWeak(&location, *(id *)(a1 + 40));
      uint64_t v12 = [PKBusinessChatPayLaterContext alloc];
      int v13 = [WeakRetained payLaterAccount];
      id v14 = WeakRetained[14];
      int v15 = [MEMORY[0x1E4F84960] genericBusinessChatTopicForContext:*(void *)(a1 + 56)];
      uint64_t v16 = [(PKBusinessChatPayLaterContext *)v12 initWithPayLaterAccount:v13 paymentPass:v14 topic:v15 financingPlan:WeakRetained[21] installment:0 payment:WeakRetained[22] dispute:0];

      id v17 = WeakRetained[17];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_4;
      v18[3] = &unk_1E59CB240;
      objc_copyWeak(&v19, &location);
      [v17 openBusinessChatWithContext:v16 completion:v18];
      objc_destroyWeak(&v19);

      objc_destroyWeak(&location);
    }
  }
}

void __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_5;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __80__PKPayLaterFinancingPlanPaymentSectionController__configureReportIssueSection___block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      id v3 = PKAccountDisplayableError();
      id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

      id v5 = v9;
      if (v4)
      {
        id v6 = [v9 dynamicCollectionDelegate];
        [v6 presentViewController:v4 animated:1 completion:0];

        id v5 = v9;
      }
      id v7 = [v5 dynamicCollectionDelegate];
      [v7 presentViewController:v4 animated:1 completion:0];
    }
    [v9[12] setShowSpinner:0];
    uint64_t v8 = [v9 dynamicCollectionDelegate];
    [v8 reloadItem:v9[12] animated:1];

    id WeakRetained = v9;
  }
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (void)setFinancingPlan:(id)a3
{
}

- (PKPayLaterPayment)payment
{
  return self->_payment;
}

- (void)setPayment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_topicsComposer, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_paymentDateFormatter, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_resizedMerchantIcon, 0);
  objc_storeStrong((id *)&self->_merchantIcon, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_financingPlanRow, 0);

  objc_storeStrong((id *)&self->_reportIssueButton, 0);
}

@end