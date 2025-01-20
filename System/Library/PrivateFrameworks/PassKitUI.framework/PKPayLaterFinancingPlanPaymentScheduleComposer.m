@interface PKPayLaterFinancingPlanPaymentScheduleComposer
+ (id)_amountAppliedToInstallmentsWithPaymentIdentifier:(id)a3 financingPlan:(id)a4;
+ (id)_detailTextForPaymentWithAdjustmentType:(id)a3;
+ (id)_detailTextForPaymentWithCreditRevokedType:(id)a3 financingPlan:(id)a4;
+ (id)_detailTextForPaymentWithDisputeCreditType:(id)a3 financingPlan:(id)a4;
+ (id)_detailTextForPaymentWithPaymentType:(id)a3 financingPlan:(id)a4;
+ (id)_detailTextForPaymentWithRefundCreditType:(id)a3 financingPlan:(id)a4;
+ (id)_detailTextForPaymentWithRefundRevokedType:(id)a3 financingPlan:(id)a4;
+ (id)_detailTextForPaymentWithRefundType:(id)a3 financingPlan:(id)a4;
+ (id)_detailTextForPaymentWithTemporaryCreditType:(id)a3 financingPlan:(id)a4;
+ (id)_detailTextForRefundFundingSources:(id)a3 appliedPaymentAmount:(id)a4 isAppliedToFinalPayment:(BOOL)a5;
+ (id)attributedStringWithText:(id)a3 strikethrough:(BOOL)a4;
+ (id)detailTextForPayment:(id)a3 financingPlan:(id)a4;
+ (id)mediumDateFormatter;
+ (id)numberFormatter;
+ (id)shortDateFormatter;
+ (unint64_t)_scheduleComposerDetailTypeForPayment:(id)a3 financingPlan:(id)a4;
- (PKPayLaterFinancingPlanPaymentScheduleComposer)initWithDelegate:(id)a3 dataSource:(id)a4;
- (id)_commonRowWithRowIndex:(int64_t)a3;
- (id)_formRowsWithList:(id)a3 financingPlan:(id)a4 payLaterAccount:(id)a5;
- (id)_paymentForItem:(id)a3;
- (id)_selectionBlockForPayment:(id)a3 financingPlan:(id)a4 payLaterAccount:(id)a5;
- (id)composeFinancingPlanPaymentScheduleLineItemsForPlan:(id)a3 payLaterAccount:(id)a4;
- (void)_updateRowConnectorsForRows:(id)a3;
@end

@implementation PKPayLaterFinancingPlanPaymentScheduleComposer

- (PKPayLaterFinancingPlanPaymentScheduleComposer)initWithDelegate:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKPayLaterFinancingPlanPaymentScheduleComposer;
  v8 = [(PKPayLaterFinancingPlanPaymentScheduleComposer *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_dataSource, v7);
    v10 = [PKConnectedCollectionViewCell alloc];
    v11 = -[PKConnectedCollectionViewCell initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v12 = objc_msgSend(@" ", "pk_attributedString");
    [(PKConnectedCollectionViewCell *)v11 setPrimaryText:v12];

    v13 = objc_msgSend(@" ", "pk_attributedString");
    [(PKConnectedCollectionViewCell *)v11 setSecondaryText:v13];

    [(PKConnectedCollectionViewCell *)v11 setShowChevron:1];
    unint64_t v14 = PKUIGetMinScreenType();
    v15 = (double *)((char *)&unk_1A0443AE0 + 8 * v14);
    v16 = (double *)((char *)&unk_1A0443B80 + 8 * v14);
    if (v14 >= 0x14)
    {
      v16 = (double *)(MEMORY[0x1E4F1DB30] + 8);
      v15 = (double *)MEMORY[0x1E4F1DB30];
    }
    -[PKConnectedCollectionViewCell sizeThatFits:](v11, "sizeThatFits:", *v15, *v16);
    v9->_minimumCellHeight = v17;
    uint64_t v18 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
    font = v9->_font;
    v9->_font = (UIFont *)v18;
  }
  return v9;
}

+ (id)mediumDateFormatter
{
  if (qword_1EB545BE8 != -1) {
    dispatch_once(&qword_1EB545BE8, &__block_literal_global_72);
  }
  v2 = (void *)_MergedGlobals_677;

  return v2;
}

uint64_t __69__PKPayLaterFinancingPlanPaymentScheduleComposer_mediumDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_677;
  _MergedGlobals_677 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_677;
  v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v2 setCalendar:v3];

  [(id)_MergedGlobals_677 setDateStyle:2];
  v4 = (void *)_MergedGlobals_677;

  return [v4 setTimeStyle:0];
}

+ (id)shortDateFormatter
{
  if (qword_1EB545BF8 != -1) {
    dispatch_once(&qword_1EB545BF8, &__block_literal_global_17);
  }
  v2 = (void *)qword_1EB545BF0;

  return v2;
}

uint64_t __68__PKPayLaterFinancingPlanPaymentScheduleComposer_shortDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1EB545BF0;
  qword_1EB545BF0 = (uint64_t)v0;

  v2 = (void *)qword_1EB545BF0;
  v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v2 setCalendar:v3];

  v4 = (void *)qword_1EB545BF0;

  return [v4 setLocalizedDateFormatFromTemplate:@"MMM d"];
}

+ (id)numberFormatter
{
  if (qword_1EB545C08 != -1) {
    dispatch_once(&qword_1EB545C08, &__block_literal_global_22);
  }
  v2 = (void *)qword_1EB545C00;

  return v2;
}

uint64_t __65__PKPayLaterFinancingPlanPaymentScheduleComposer_numberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)qword_1EB545C00;
  qword_1EB545C00 = (uint64_t)v0;

  v2 = (void *)qword_1EB545C00;

  return [v2 setNumberStyle:1];
}

+ (id)attributedStringWithText:(id)a3 strikethrough:(BOOL)a4
{
  BOOL v4 = a4;
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 length])
  {
    if (v4)
    {
      uint64_t v9 = *MEMORY[0x1E4FB0768];
      v10[0] = &unk_1EF2B8E98;
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    }
    else
    {
      id v6 = 0;
    }
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)composeFinancingPlanPaymentScheduleLineItemsForPlan:(id)a3 payLaterAccount:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [v6 state];
  if ((unint64_t)(v9 - 1) < 4 || v9 == 6)
  {
    v12 = [[PKPayLaterFinancingPlanPaymentScheduleComposerItemList alloc] initWithFinancingPlan:v6];
    if (v12)
    {
      v11 = [(PKPayLaterFinancingPlanPaymentScheduleComposer *)self _formRowsWithList:v12 financingPlan:v6 payLaterAccount:v7];
      [v8 addObjectsFromArray:v11];
    }
  }
  else
  {
    v12 = 0;
  }
  [(PKPayLaterFinancingPlanPaymentScheduleComposer *)self _updateRowConnectorsForRows:v8];
  v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v14 = [v6 planIdentifier];
    v15 = [(PKPayLaterFinancingPlanPaymentScheduleComposerItemList *)v12 items];
    int v18 = 138412546;
    v19 = v14;
    __int16 v20 = 2112;
    objc_super v21 = v15;
    _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Payment schedule rows for plan %@: %@", (uint8_t *)&v18, 0x16u);
  }
  v16 = (void *)[v8 copy];

  return v16;
}

+ (id)detailTextForPayment:(id)a3 financingPlan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = 0;
  switch([v6 type])
  {
    case 1:
      uint64_t v9 = [a1 _detailTextForPaymentWithPaymentType:v6 financingPlan:v7];
      goto LABEL_9;
    case 2:
      uint64_t v9 = [a1 _detailTextForPaymentWithTemporaryCreditType:v6 financingPlan:v7];
      goto LABEL_9;
    case 3:
      v10 = [v7 disputes];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __85__PKPayLaterFinancingPlanPaymentScheduleComposer_detailTextForPayment_financingPlan___block_invoke;
      v14[3] = &unk_1E59D29E0;
      id v11 = v6;
      id v15 = v11;
      int v12 = objc_msgSend(v10, "pk_containsObjectPassingTest:", v14);

      if (v12) {
        [a1 _detailTextForPaymentWithDisputeCreditType:v11 financingPlan:v7];
      }
      else {
      id v8 = [a1 _detailTextForPaymentWithRefundType:v11 financingPlan:v7];
      }

      break;
    case 4:
      uint64_t v9 = [a1 _detailTextForPaymentWithCreditRevokedType:v6 financingPlan:v7];
      goto LABEL_9;
    case 6:
      uint64_t v9 = [a1 _detailTextForPaymentWithRefundRevokedType:v6 financingPlan:v7];
      goto LABEL_9;
    case 7:
      uint64_t v9 = [a1 _detailTextForPaymentWithAdjustmentType:v6];
LABEL_9:
      id v8 = (void *)v9;
      break;
    default:
      break;
  }

  return v8;
}

uint64_t __85__PKPayLaterFinancingPlanPaymentScheduleComposer_detailTextForPayment_financingPlan___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 appliedPayments];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__PKPayLaterFinancingPlanPaymentScheduleComposer_detailTextForPayment_financingPlan___block_invoke_2;
  v6[3] = &unk_1E59D29B8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __85__PKPayLaterFinancingPlanPaymentScheduleComposer_detailTextForPayment_financingPlan___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 paymentIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) paymentIdentifier];
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
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

+ (id)_detailTextForPaymentWithPaymentType:(id)a3 financingPlan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _scheduleComposerDetailTypeForPayment:v6 financingPlan:v7];
  uint64_t v9 = [v7 scheduleSummary];

  uint64_t v10 = [v6 paymentIdentifier];
  id v11 = [v6 amount];
  int v12 = [v11 formattedStringValue];

  v13 = [v6 fundingSources];
  unint64_t v14 = [v13 firstObject];

  v36 = [v14 panSuffix];
  id v15 = [v14 refundAmount];
  v16 = [v15 amount];
  if (objc_msgSend(v16, "pk_isPositiveNumber"))
  {
    double v17 = [v14 refundAmount];
  }
  else
  {
    double v17 = 0;
  }

  int v18 = [v17 formattedStringValue];
  v35 = (void *)v10;
  v19 = [v9 firstInstallmentIdentifierAffectedByPaymentIdentifier:v10];
  __int16 v20 = [v6 paymentIdentifier];
  objc_super v21 = [v9 currencyAmountOfPaymentIdentifierAffectingOtherInstallments:v20 relativeInstallmentIdentifier:v19 installmentsAreInOrder:0 countOfInstallments:0];

  uint64_t v22 = [v21 formattedStringValue];
  v23 = (void *)v22;
  switch(v8)
  {
    case 1:
    case 6:
      v29 = v12;
      v24 = @"INSTALLMENT_PAYMENT_APPLIED_ONE_INSTALLMENT_PAYMENT";
      goto LABEL_10;
    case 2:
    case 7:
      v30 = v12;
      v32 = v18;
      v25 = @"INSTALLMENT_PAYMENT_APPLIED_ONE_INSTALLMENT_CREDIT_NO_FUNDING_SOURCE_PAYMENT";
      goto LABEL_13;
    case 3:
    case 8:
      v33 = v18;
      v34 = v36;
      v31 = v12;
      v26 = @"INSTALLMENT_PAYMENT_APPLIED_ONE_INSTALLMENT_CREDIT_WITH_FUNDING_SOURCE_PAYMENT";
      goto LABEL_15;
    case 4:
      v29 = v12;
      v24 = @"INSTALLMENT_PAYMENT_CREDIT_NO_FUNDING_SOURCE_PAYMENT";
LABEL_10:
      PKLocalizedCocoonString(&v24->isa, &stru_1EF1B4C70.isa, v29);
      goto LABEL_17;
    case 5:
      v30 = v12;
      v32 = v36;
      v25 = @"INSTALLMENT_PAYMENT_CREDIT_WITH_FUNDING_SOURCE_PAYMENT";
      goto LABEL_13;
    case 9:
      v30 = v12;
      v32 = (void *)v22;
      v25 = @"INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_PAYMENT";
LABEL_13:
      PKLocalizedCocoonString(&v25->isa, &cfstr_12.isa, v30, v32);
      goto LABEL_17;
    case 10:
      v33 = (void *)v22;
      v34 = v18;
      v31 = v12;
      v26 = @"INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_CREDIT_NO_FUNDING_SOURCE_PAYMENT";
LABEL_15:
      PKLocalizedCocoonString(&v26->isa, &cfstr_123.isa, v31, v33, v34);
      goto LABEL_17;
    case 11:
      PKLocalizedCocoonString(&cfstr_InstallmentPay_7.isa, &cfstr_1234.isa, v12, v22, v18, v36);
      v27 = LABEL_17:;
      break;
    default:
      v27 = 0;
      break;
  }

  return v27;
}

+ (id)_detailTextForPaymentWithCreditRevokedType:(id)a3 financingPlan:(id)a4
{
  id v6 = a3;
  unint64_t v7 = [a1 _scheduleComposerDetailTypeForPayment:v6 financingPlan:a4];
  uint64_t v8 = [v6 amount];

  uint64_t v9 = [v8 absoluteValue];
  uint64_t v10 = [v9 formattedStringValue];

  id v11 = 0;
  if (v7 <= 0xB && ((1 << v7) & 0xFCE) != 0)
  {
    id v11 = PKLocalizedCocoonString(&cfstr_InstallmentPay_8.isa, &stru_1EF1B4C70.isa, v10);
  }

  return v11;
}

+ (id)_detailTextForPaymentWithRefundRevokedType:(id)a3 financingPlan:(id)a4
{
  uint64_t v4 = [a3 amount];
  id v5 = [v4 absoluteValue];
  id v6 = [v5 formattedStringValue];

  unint64_t v7 = PKLocalizedCocoonString(&cfstr_InstallmentPay_9.isa, &stru_1EF1B4C70.isa, v6);

  return v7;
}

+ (id)_detailTextForPaymentWithTemporaryCreditType:(id)a3 financingPlan:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 _scheduleComposerDetailTypeForPayment:v6 financingPlan:a4];
  uint64_t v8 = [v6 amount];
  uint64_t v9 = [v8 formattedStringValue];

  uint64_t v10 = [v6 fundingSources];

  id v11 = [v10 firstObject];

  int v12 = [v11 panSuffix];
  v13 = [v11 refundAmount];
  unint64_t v14 = [v13 amount];
  if (objc_msgSend(v14, "pk_isPositiveNumber"))
  {
    id v15 = [v11 refundAmount];
  }
  else
  {
    id v15 = 0;
  }

  uint64_t v16 = [v15 formattedStringValue];
  double v17 = (void *)v16;
  switch(v7)
  {
    case 1:
      uint64_t v22 = v9;
      int v18 = @"INSTALLMENT_PAYMENT_APPLIED_LAST_PAYMENT_TEMPORARY_CREDIT";
      goto LABEL_13;
    case 2:
      v23 = v9;
      v24 = (void *)v16;
      v19 = @"INSTALLMENT_PAYMENT_APPLIED_LAST_PAYMENT_CREDIT_NO_FUNDING_SOURCE_TEMPORARY_CREDIT";
      goto LABEL_15;
    case 3:
      PKLocalizedCocoonString(&cfstr_InstallmentPay_12.isa, &cfstr_123_0.isa, v9, v16, v12);
      goto LABEL_16;
    case 4:
      uint64_t v22 = v9;
      int v18 = @"INSTALLMENT_PAYMENT_CREDIT_NO_FUNDING_SOURCE_TEMPORARY_CREDIT";
      goto LABEL_13;
    case 5:
      v23 = v9;
      v24 = v12;
      v19 = @"INSTALLMENT_PAYMENT_CREDIT_WITH_FUNDING_SOURCE_TEMPORARY_CREDIT";
      goto LABEL_15;
    case 6:
    case 9:
      uint64_t v22 = v9;
      int v18 = @"INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_TEMPORARY_CREDIT";
LABEL_13:
      PKLocalizedCocoonString(&v18->isa, &stru_1EF1B4C70.isa, v22);
      goto LABEL_16;
    case 7:
    case 10:
      v23 = v9;
      v24 = (void *)v16;
      v19 = @"INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_CREDIT_NO_FUNDING_SOURCE_TEMPORARY_CREDIT";
LABEL_15:
      PKLocalizedCocoonString(&v19->isa, &cfstr_12.isa, v23, v24);
      goto LABEL_16;
    case 8:
    case 11:
      PKLocalizedCocoonString(&cfstr_InstallmentPay_17.isa, &cfstr_123.isa, v9, v16, v12);
      __int16 v20 = LABEL_16:;
      break;
    default:
      __int16 v20 = 0;
      break;
  }

  return v20;
}

+ (id)_detailTextForPaymentWithDisputeCreditType:(id)a3 financingPlan:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 _scheduleComposerDetailTypeForPayment:v6 financingPlan:a4];
  uint64_t v8 = [v6 amount];
  uint64_t v9 = [v8 formattedStringValue];

  uint64_t v10 = [v6 fundingSources];

  id v11 = [v10 firstObject];

  int v12 = [v11 panSuffix];
  v13 = [v11 refundAmount];
  unint64_t v14 = [v13 amount];
  if (objc_msgSend(v14, "pk_isPositiveNumber"))
  {
    id v15 = [v11 refundAmount];
  }
  else
  {
    id v15 = 0;
  }

  uint64_t v16 = [v15 formattedStringValue];
  double v17 = (void *)v16;
  switch(v7)
  {
    case 1:
      uint64_t v22 = v9;
      int v18 = @"INSTALLMENT_PAYMENT_APPLIED_LAST_PAYMENT_DISPUTE_CREDIT";
      goto LABEL_13;
    case 2:
      v23 = v9;
      v24 = (void *)v16;
      v19 = @"INSTALLMENT_PAYMENT_APPLIED_LAST_PAYMENT_CREDIT_NO_FUNDING_SOURCE_DISPUTE_CREDIT";
      goto LABEL_15;
    case 3:
      PKLocalizedCocoonString(&cfstr_InstallmentPay_20.isa, &cfstr_123_0.isa, v9, v16, v12);
      goto LABEL_16;
    case 4:
      uint64_t v22 = v9;
      int v18 = @"INSTALLMENT_PAYMENT_CREDIT_NO_FUNDING_SOURCE_DISPUTE_CREDIT";
      goto LABEL_13;
    case 5:
      v23 = v9;
      v24 = v12;
      v19 = @"INSTALLMENT_PAYMENT_CREDIT_WITH_FUNDING_SOURCE_DISPUTE_CREDIT";
      goto LABEL_15;
    case 6:
    case 9:
      uint64_t v22 = v9;
      int v18 = @"INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_DISPUTE_CREDIT";
LABEL_13:
      PKLocalizedCocoonString(&v18->isa, &stru_1EF1B4C70.isa, v22);
      goto LABEL_16;
    case 7:
    case 10:
      v23 = v9;
      v24 = (void *)v16;
      v19 = @"INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_CREDIT_NO_FUNDING_SOURCE_DISPUTE_CREDIT";
LABEL_15:
      PKLocalizedCocoonString(&v19->isa, &cfstr_12.isa, v23, v24);
      goto LABEL_16;
    case 8:
    case 11:
      PKLocalizedCocoonString(&cfstr_InstallmentPay_25.isa, &cfstr_123.isa, v9, v16, v12);
      __int16 v20 = LABEL_16:;
      break;
    default:
      __int16 v20 = 0;
      break;
  }

  return v20;
}

+ (id)_detailTextForPaymentWithRefundType:(id)a3 financingPlan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 subtype] == 1)
  {
    uint64_t v8 = [a1 _detailTextForPaymentWithRefundCreditType:v6 financingPlan:v7];
  }
  else
  {
    uint64_t v9 = [a1 _scheduleComposerDetailTypeForPayment:v6 financingPlan:v7];
    uint64_t v10 = [v6 amount];
    id v11 = [v10 absoluteValue];
    int v12 = [v11 formattedStringValue];

    v13 = [v6 fundingSources];
    unint64_t v14 = v13;
    switch(v9)
    {
      case 1:
        PKLocalizedCocoonString(&cfstr_InstallmentPay_26.isa, &stru_1EF1B4C70.isa, v12);
        goto LABEL_13;
      case 2:
      case 3:
        v19 = [v6 paymentIdentifier];
        __int16 v20 = [v7 scheduleSummary];
        objc_super v21 = [v20 installmentsAffectedByPaymentIdentifier:v19];

        uint64_t v22 = [v21 lastObject];
        v23 = [v22 appliedPayments];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __100__PKPayLaterFinancingPlanPaymentScheduleComposer__detailTextForPaymentWithRefundType_financingPlan___block_invoke;
        v32[3] = &unk_1E59D29B8;
        id v33 = v19;
        id v31 = v19;
        v24 = objc_msgSend(v23, "pk_firstObjectPassingTest:", v32);

        v25 = [v6 fundingSources];
        v26 = [v24 amountApplied];
        v27 = [a1 _detailTextForRefundFundingSources:v25 appliedPaymentAmount:v26 isAppliedToFinalPayment:1];

        uint64_t v8 = PKLocalizedCocoonString(&cfstr_InstallmentPay_28.isa, &cfstr_12.isa, v12, v27);

        goto LABEL_15;
      case 4:
        PKLocalizedCocoonString(&cfstr_InstallmentPay_29.isa, &stru_1EF1B4C70.isa, v12);
        goto LABEL_13;
      case 5:
        if ((unint64_t)[v13 count] < 2)
        {
          objc_super v21 = [v14 firstObject];
          v29 = [v21 unmaskedPanSuffix];
          uint64_t v8 = PKLocalizedCocoonString(&cfstr_InstallmentPay_30.isa, &cfstr_12.isa, v12, v29);

LABEL_15:
        }
        else
        {
          v28 = [v6 fundingSources];
          uint64_t v16 = [a1 _detailTextForRefundFundingSources:v28 appliedPaymentAmount:0 isAppliedToFinalPayment:0];

          uint64_t v8 = PKLocalizedCocoonString(&cfstr_InstallmentPay_28.isa, &cfstr_12.isa, v12, v16);
LABEL_5:
        }
LABEL_16:

        break;
      case 6:
      case 9:
        PKLocalizedCocoonString(&cfstr_InstallmentPay_27.isa, &stru_1EF1B4C70.isa, v12);
        uint64_t v8 = LABEL_13:;
        goto LABEL_16;
      case 7:
      case 8:
      case 10:
      case 11:
        id v15 = [v6 paymentIdentifier];
        uint64_t v16 = [a1 _amountAppliedToInstallmentsWithPaymentIdentifier:v15 financingPlan:v7];

        double v17 = [v6 fundingSources];
        int v18 = [a1 _detailTextForRefundFundingSources:v17 appliedPaymentAmount:v16 isAppliedToFinalPayment:0];

        uint64_t v8 = PKLocalizedCocoonString(&cfstr_InstallmentPay_28.isa, &cfstr_12.isa, v12, v18);

        goto LABEL_5;
      default:
        uint64_t v8 = 0;
        goto LABEL_16;
    }
  }

  return v8;
}

uint64_t __100__PKPayLaterFinancingPlanPaymentScheduleComposer__detailTextForPaymentWithRefundType_financingPlan___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 paymentIdentifier];
  uint64_t v3 = PKEqualObjects();

  return v3;
}

+ (id)_detailTextForPaymentWithRefundCreditType:(id)a3 financingPlan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _scheduleComposerDetailTypeForPayment:v6 financingPlan:v7];
  uint64_t v9 = [v6 amount];
  uint64_t v10 = [v9 absoluteValue];
  id v11 = [v10 formattedStringValue];

  int v12 = [v6 fundingSources];
  v13 = [v12 firstObject];

  unint64_t v14 = [v13 unmaskedPanSuffix];
  id v15 = [v13 refundAmount];
  uint64_t v16 = [v15 amount];
  if (objc_msgSend(v16, "pk_isPositiveNumber"))
  {
    double v17 = [v13 refundAmount];
  }
  else
  {
    double v17 = 0;
  }

  uint64_t v18 = [v17 formattedStringValue];
  v19 = (void *)v18;
  switch(v8)
  {
    case 1:
      v30 = v11;
      __int16 v20 = @"INSTALLMENT_PAYMENT_APPLIED_LAST_PAYMENT_REFUND_CREDIT";
      goto LABEL_13;
    case 2:
      v23 = [v6 paymentIdentifier];
      v24 = [v7 scheduleSummary];
      v35 = [v24 installmentsAffectedByPaymentIdentifier:v23];

      v25 = [v35 lastObject];
      v26 = [v25 appliedPayments];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __106__PKPayLaterFinancingPlanPaymentScheduleComposer__detailTextForPaymentWithRefundCreditType_financingPlan___block_invoke;
      v36[3] = &unk_1E59D29B8;
      id v37 = v23;
      id v34 = v23;
      id v33 = objc_msgSend(v26, "pk_firstObjectPassingTest:", v36);

      v27 = [v33 amountApplied];
      v28 = [v27 formattedStringValue];
      uint64_t v22 = PKLocalizedCocoonString(&cfstr_InstallmentPay_33.isa, &cfstr_123_0.isa, v11, v28, v19);

      break;
    case 3:
      PKLocalizedCocoonString(&cfstr_InstallmentPay_34.isa, &cfstr_123_0.isa, v11, v18, v14);
      goto LABEL_16;
    case 4:
      v30 = v11;
      __int16 v20 = @"INSTALLMENT_PAYMENT_CREDIT_NO_FUNDING_SOURCE_REFUND_CREDIT";
      goto LABEL_13;
    case 5:
      id v31 = v11;
      v32 = v14;
      objc_super v21 = @"INSTALLMENT_PAYMENT_CREDIT_WITH_FUNDING_SOURCE_REFUND_CREDIT";
      goto LABEL_15;
    case 6:
    case 9:
      v30 = v11;
      __int16 v20 = @"INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_REFUND_CREDIT";
LABEL_13:
      PKLocalizedCocoonString(&v20->isa, &stru_1EF1B4C70.isa, v30);
      goto LABEL_16;
    case 7:
    case 10:
      id v31 = v11;
      v32 = (void *)v18;
      objc_super v21 = @"INSTALLMENT_PAYMENT_APPLIED_REMAINING_PAYMENTS_CREDIT_NO_FUNDING_SOURCE_REFUND_CREDIT";
LABEL_15:
      PKLocalizedCocoonString(&v21->isa, &cfstr_12.isa, v31, v32);
      goto LABEL_16;
    case 8:
    case 11:
      PKLocalizedCocoonString(&cfstr_InstallmentPay_38.isa, &cfstr_123.isa, v11, v18, v14);
      uint64_t v22 = LABEL_16:;
      break;
    default:
      uint64_t v22 = 0;
      break;
  }

  return v22;
}

uint64_t __106__PKPayLaterFinancingPlanPaymentScheduleComposer__detailTextForPaymentWithRefundCreditType_financingPlan___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 paymentIdentifier];
  uint64_t v3 = PKEqualObjects();

  return v3;
}

+ (id)_detailTextForRefundFundingSources:(id)a3 appliedPaymentAmount:(id)a4 isAppliedToFinalPayment:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v8)
  {
    uint64_t v10 = [v8 formattedStringValue];
    if (v5) {
      id v11 = @"INSTALLMENT_PAYMENT_FUNDING_SOURCE_APPLIED_LAST_PAYMENT_REFUND";
    }
    else {
      id v11 = @"INSTALLMENT_PAYMENT_FUNDING_SOURCE_APPLIED_REMAINING_PAYMENTS_REFUND";
    }
    int v12 = PKLocalizedCocoonString(&v11->isa, &cfstr_1_1.isa, v10);
    [v9 addObject:v12];
  }
  id v31 = v8;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v32 + 1) + 8 * v17);
        v19 = [v18 unmaskedPanSuffix];
        __int16 v20 = [v18 displayName];
        objc_super v21 = [v18 refundAmount];
        uint64_t v22 = [v21 formattedStringValue];

        if (v22)
        {
          if (v19)
          {
            v28 = v22;
            v30 = v19;
            v23 = @"INSTALLMENT_PAYMENT_FUNDING_SOURCE_CARD_SUFFIX_REFUND";
            goto LABEL_16;
          }
          if (v20)
          {
            v28 = v22;
            v30 = v20;
            v23 = @"INSTALLMENT_PAYMENT_FUNDING_SOURCE_CARD_NAME_REFUND";
LABEL_16:
            PKLocalizedCocoonString(&v23->isa, &cfstr_12.isa, v28, v30);
          }
          else
          {
            PKLocalizedCocoonString(&cfstr_InstallmentPay_43.isa, &cfstr_1_1.isa, v22, v29);
          v24 = };
          [v9 addObject:v24];
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v25 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
      uint64_t v15 = v25;
    }
    while (v25);
  }

  v26 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v9];

  return v26;
}

+ (id)_amountAppliedToInstallmentsWithPaymentIdentifier:(id)a3 financingPlan:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 scheduleSummary];
  id v7 = [v6 installmentsAffectedByPaymentIdentifier:v5];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = [*(id *)(*((void *)&v22 + 1) + 8 * i) appliedPayments];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __114__PKPayLaterFinancingPlanPaymentScheduleComposer__amountAppliedToInstallmentsWithPaymentIdentifier_financingPlan___block_invoke;
        v20[3] = &unk_1E59D29B8;
        id v21 = v5;
        uint64_t v14 = objc_msgSend(v13, "pk_firstObjectPassingTest:", v20);

        uint64_t v15 = [v14 amountApplied];
        uint64_t v16 = (void *)v15;
        if (v10)
        {
          uint64_t v17 = [v10 currencyAmountByAddingCurrencyAmount:v15];

          uint64_t v10 = (void *)v17;
        }
        else
        {
          uint64_t v10 = (void *)v15;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __114__PKPayLaterFinancingPlanPaymentScheduleComposer__amountAppliedToInstallmentsWithPaymentIdentifier_financingPlan___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 paymentIdentifier];
  uint64_t v3 = PKEqualObjects();

  return v3;
}

+ (id)_detailTextForPaymentWithAdjustmentType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 amount];
  id v5 = [v4 absoluteValue];
  id v6 = [v5 formattedStringValue];

  id v7 = [v3 postedDate];
  uint64_t v8 = +[PKPayLaterFinancingPlanPaymentScheduleComposer shortDateFormatter];
  uint64_t v9 = [v8 stringFromDate:v7];
  uint64_t v10 = [v3 subtype];

  if ((unint64_t)(v10 - 2) > 2)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = PKLocalizedCocoonString(&off_1E59D2A20[v10 - 2]->isa, &stru_1EF1B5770.isa, v6, v9);
  }

  return v11;
}

+ (unint64_t)_scheduleComposerDetailTypeForPayment:(id)a3 financingPlan:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 type] != 1)
  {
    uint64_t v8 = [v5 paymentIdentifier];
    uint64_t v9 = [v6 scheduleSummary];
    uint64_t v10 = [v5 fundingSources];
    uint64_t v11 = objc_msgSend(v10, "pk_objectsPassingTest:", &__block_literal_global_194_0);
    int v12 = objc_msgSend(v10, "pk_objectsPassingTest:", &__block_literal_global_196);
    v26 = v11;
    uint64_t v25 = [v11 count];
    uint64_t v13 = [v12 count];
    uint64_t v27 = (void *)v8;
    uint64_t v14 = [v9 installmentsAffectedByPaymentIdentifier:v8];
    uint64_t v15 = [v14 lastObject];
    uint64_t v16 = [v15 installmentIdentifier];
    uint64_t v17 = [v9 installmentNumberForInstallmentIdentifier:v16];

    if ([v14 count] == 1)
    {
      uint64_t v18 = [v9 installments];
      uint64_t v19 = [v18 count];

      if (v19 == v17 + 1)
      {
        uint64_t v20 = 2;
        if (v25) {
          uint64_t v20 = 3;
        }
        if (v13) {
          unint64_t v7 = v20;
        }
        else {
          unint64_t v7 = 1;
        }
        goto LABEL_25;
      }
    }
    if ([v14 count] == 1)
    {
      uint64_t v21 = 7;
      if (v25) {
        uint64_t v21 = 8;
      }
      BOOL v22 = v13 == 0;
      uint64_t v23 = 6;
    }
    else
    {
      if (![v14 count] && v13)
      {
        if (v25) {
          unint64_t v7 = 5;
        }
        else {
          unint64_t v7 = 4;
        }
        goto LABEL_25;
      }
      uint64_t v21 = 10;
      if (v25) {
        uint64_t v21 = 11;
      }
      BOOL v22 = v13 == 0;
      uint64_t v23 = 9;
    }
    if (v22) {
      unint64_t v7 = v23;
    }
    else {
      unint64_t v7 = v21;
    }
LABEL_25:

    goto LABEL_26;
  }
  unint64_t v7 = 0;
LABEL_26:

  return v7;
}

BOOL __102__PKPayLaterFinancingPlanPaymentScheduleComposer__scheduleComposerDetailTypeForPayment_financingPlan___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 panSuffix];
  id v3 = objc_msgSend(v2, "pk_stringIfNotEmpty");
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __102__PKPayLaterFinancingPlanPaymentScheduleComposer__scheduleComposerDetailTypeForPayment_financingPlan___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 refundAmount];
  id v3 = [v2 amount];
  uint64_t v4 = objc_msgSend(v3, "pk_isPositiveNumber");

  return v4;
}

- (id)_formRowsWithList:(id)a3 financingPlan:(id)a4 payLaterAccount:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v21 = v8;
  int v12 = [v8 items];
  if ([v12 count])
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = [v12 objectAtIndexedSubscript:v13];
      uint64_t v15 = [(PKPayLaterFinancingPlanPaymentScheduleComposer *)self _paymentForItem:v14];
      uint64_t v16 = [(PKPayLaterFinancingPlanPaymentScheduleComposer *)self _commonRowWithRowIndex:v13];
      [v14 populateRow:v16];
      uint64_t v17 = [v16 primaryText];

      if (v17)
      {
        if ([v16 showChevron])
        {
          uint64_t v18 = [(PKPayLaterFinancingPlanPaymentScheduleComposer *)self _selectionBlockForPayment:v15 financingPlan:v9 payLaterAccount:v10];
          [v16 setSelectionHandler:v18];
        }
        [v11 addObject:v16];
      }

      ++v13;
    }
    while (v13 < [v12 count]);
  }
  uint64_t v19 = (void *)[v11 copy];

  return v19;
}

- (id)_paymentForItem:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 type];
  if (v4 > 4 || ((1 << v4) & 0x1A) == 0)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v3 payment];
  }

  return v6;
}

- (void)_updateRowConnectorsForRows:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v46 = PKPayLaterPaymentScheduleVerticalConnectorGreenColor();
  v45 = PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
  v44 = PKPayLaterPaymentScheduleOrangeColor();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v48;
LABEL_3:
    uint64_t v9 = 0;
    while (2)
    {
      id v10 = v7;
      if (*(void *)v48 != v8) {
        objc_enumerationMutation(v4);
      }
      id v11 = *(void **)(*((void *)&v47 + 1) + 8 * v9);
      id v12 = 0;
      id v13 = 0;
      switch([v11 targetType])
      {
        case 0:
        case 6:
          [v10 setBottomConnector:0];
          id v12 = 0;
          id v13 = 0;
          if (v10) {
            goto LABEL_16;
          }
          goto LABEL_17;
        case 2:
          uint64_t v14 = v45;
          goto LABEL_15;
        case 3:
        case 4:
          id v13 = v46;
          id v12 = v45;
          goto LABEL_10;
        case 5:
          uint64_t v14 = v46;
          goto LABEL_15;
        case 7:
          uint64_t v14 = v44;
LABEL_15:
          id v12 = v14;
          id v13 = v12;
          if (v10) {
            goto LABEL_16;
          }
          goto LABEL_17;
        default:
LABEL_10:
          if (!v10) {
            goto LABEL_17;
          }
LABEL_16:
          if ([v10 targetType])
          {
LABEL_17:
            uint64_t v15 = 0;
            if (v13 && v12)
            {
              uint64_t v16 = [[PKGradientVerticalConnector alloc] initWithTopGradientColor:v13 bottomGradientColor:v13];
              uint64_t v15 = [[PKGradientVerticalConnector alloc] initWithTopGradientColor:v12 bottomGradientColor:v12];
            }
            else
            {
              uint64_t v16 = 0;
            }
          }
          else
          {

            id v13 = 0;
            uint64_t v15 = 0;
            uint64_t v16 = 0;
          }
          [v11 setTopConnector:v16];
          [v11 setBottomConnector:v15];
          id v7 = v11;

          if (v6 != ++v9) {
            continue;
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v47 objects:v51 count:16];
          if (v6) {
            goto LABEL_3;
          }

          break;
      }
      break;
    }
  }

  if ([v4 count])
  {
    unint64_t v17 = 0;
    do
    {
      uint64_t v18 = [v4 objectAtIndexedSubscript:v17];
      unint64_t v43 = v17 + 1;
      if (v17 + 1 >= [v4 count])
      {
        uint64_t v19 = 0;
        if (!v17)
        {
LABEL_31:
          uint64_t v20 = 0;
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t v19 = [v4 objectAtIndexedSubscript:v43];
        if (!v17) {
          goto LABEL_31;
        }
      }
      uint64_t v20 = [v4 objectAtIndexedSubscript:v17 - 1];
LABEL_32:
      uint64_t v21 = [v18 topConnector];
      BOOL v22 = [v18 bottomConnector];
      uint64_t v23 = [v22 bottomGradientColor];
      long long v24 = [v21 topGradientColor];
      v41 = v20;
      uint64_t v25 = [v20 bottomConnector];
      uint64_t v26 = [v25 bottomGradientColor];
      uint64_t v27 = (void *)v26;
      if (v26) {
        v28 = (void *)v26;
      }
      else {
        v28 = v24;
      }
      id v29 = v28;

      v42 = v19;
      v30 = [v19 topConnector];
      uint64_t v31 = [v30 topGradientColor];
      long long v32 = (void *)v31;
      if (v31) {
        long long v33 = (void *)v31;
      }
      else {
        long long v33 = v23;
      }
      id v34 = v33;

      if (v23 && v24)
      {
        long long v35 = objc_msgSend(MEMORY[0x1E4FB1618], "pkui_blendFromColor:toColor:withProgress:", v29, v24, 0.5);
        v40 = [[PKGradientVerticalConnector alloc] initWithTopGradientColor:v35 bottomGradientColor:v24];

        v36 = objc_msgSend(MEMORY[0x1E4FB1618], "pkui_blendFromColor:toColor:withProgress:", v23, v34, 0.5);
        uint64_t v37 = [[PKGradientVerticalConnector alloc] initWithTopGradientColor:v23 bottomGradientColor:v36];

        uint64_t v21 = v40;
        BOOL v22 = v37;
      }
      [v18 setTopConnector:v21];
      [v18 setBottomConnector:v22];

      unint64_t v17 = v43;
    }
    while (v43 < [v4 count]);
  }
  v38 = [v4 firstObject];
  [v38 setTopConnector:0];
  v39 = [v4 lastObject];
  [v39 setBottomConnector:0];
}

- (id)_selectionBlockForPayment:(id)a3 financingPlan:(id)a4 payLaterAccount:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __106__PKPayLaterFinancingPlanPaymentScheduleComposer__selectionBlockForPayment_financingPlan_payLaterAccount___block_invoke;
  v16[3] = &unk_1E59CB8B0;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  uint64_t v20 = self;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  uint64_t v14 = _Block_copy(v16);

  return v14;
}

void __106__PKPayLaterFinancingPlanPaymentScheduleComposer__selectionBlockForPayment_financingPlan_payLaterAccount___block_invoke(void *a1)
{
  v2 = [PKPayLaterFinancingPlanPaymentViewController alloc];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[7] + 32));
  id v7 = [WeakRetained paymentIntentController];
  id v8 = objc_loadWeakRetained((id *)(a1[7] + 32));
  id v9 = [v8 merchantIcon];
  id v11 = [(PKPayLaterFinancingPlanPaymentViewController *)v2 initWithFinancingPlan:v3 payment:v4 payLaterAccount:v5 paymentIntentController:v7 merchantIcon:v9];

  id v10 = objc_loadWeakRetained((id *)(a1[7] + 24));
  [v10 pushViewController:v11 animated:1];
}

- (id)_commonRowWithRowIndex:(int64_t)a3
{
  uint64_t v4 = [[PKPayLaterProgressRow alloc] initWithRowIndex:a3 selectionHandler:0];
  uint64_t v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(PKPayLaterProgressRow *)v4 setSecondaryTextColor:v5];

  uint64_t v6 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)*MEMORY[0x1E4FB2790]);
  [(PKPayLaterProgressRow *)v4 setSecondaryFont:v6];

  id v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(PKPayLaterProgressRow *)v4 setTertiaryTextColor:v7];

  [(PKPayLaterProgressRow *)v4 setPrimaryFont:self->_font];
  [(PKPayLaterProgressRow *)v4 setAmountFont:self->_font];
  [(PKPayLaterProgressRow *)v4 setMinimumHeight:self->_minimumCellHeight];

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_font, 0);
}

@end