@interface PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem
- (NSString)description;
- (PKPayLaterFinancingPlan)financingPlan;
- (PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem)initWithFinancingPlan:(id)a3 payment:(id)a4;
- (PKPayLaterPayment)payment;
- (id)date;
- (id)installmentIdentifier;
- (id)paymentIdentifier;
- (unint64_t)type;
- (void)populateRow:(id)a3;
@end

@implementation PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem

- (PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem)initWithFinancingPlan:(id)a3 payment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem;
  v9 = [(PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_financingPlan, a3);
    objc_storeStrong((id *)&v10->_payment, a4);
  }

  return v10;
}

- (void)populateRow:(id)a3
{
  payment = self->_payment;
  id v5 = a3;
  v6 = [(PKPayLaterPayment *)payment amount];
  id v7 = [v6 formattedStringValue];

  v39 = [(PKPayLaterPayment *)self->_payment postedDate];
  id v8 = +[PKPayLaterFinancingPlanPaymentScheduleComposer shortDateFormatter];
  v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v10 = 0;
  uint64_t v11 = 5;
  objc_super v12 = 0;
  v13 = 0;
  switch([(PKPayLaterPayment *)self->_payment type])
  {
    case 1:
      v13 = PKLocalizedCocoonString(&cfstr_PartialPayment.isa);
      v29 = [v8 stringFromDate:v39];
      objc_super v12 = PKLocalizedCocoonString(&cfstr_InstallmentPai.isa, &stru_1EF1B4C70.isa, v29);

      v30 = v7;
      goto LABEL_29;
    case 2:
    case 3:
    case 4:
    case 6:
      v38 = v7;
      v14 = [(PKPayLaterFinancingPlan *)self->_financingPlan disputes];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __73__PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem_populateRow___block_invoke;
      v40[3] = &unk_1E59D29E0;
      v40[4] = self;
      int v15 = objc_msgSend(v14, "pk_containsObjectPassingTest:", v40);

      uint64_t v16 = [(PKPayLaterPayment *)self->_payment type];
      uint64_t v17 = [(PKPayLaterPayment *)self->_payment type];
      uint64_t v18 = [(PKPayLaterPayment *)self->_payment type];
      uint64_t v19 = [(PKPayLaterPayment *)self->_payment type];
      v13 = PKLocalizedCocoonString(&cfstr_PaymentRefund.isa);
      if (v16 == 2)
      {
        v20 = @"TEMPORARY_CREDIT";
        uint64_t v11 = 5;
LABEL_20:
        uint64_t v23 = PKLocalizedCocoonString(&v20->isa);

        v13 = (void *)v23;
        goto LABEL_21;
      }
      v21 = @"PAYMENT_REFUND_REVOKED";
      if (v15) {
        v21 = @"DISPUTE_CREDIT";
      }
      if (v17 == 4) {
        char v22 = 1;
      }
      else {
        char v22 = v15;
      }
      if (v17 == 4) {
        v20 = @"CREDIT_REVOKED";
      }
      else {
        v20 = v21;
      }
      if (v17 == 4) {
        uint64_t v11 = 7;
      }
      else {
        uint64_t v11 = 5;
      }
      if ((v22 & 1) != 0 || v18 == 6) {
        goto LABEL_20;
      }
      if (v19 == 3)
      {
        uint64_t v11 = 5;
        if ([(PKPayLaterPayment *)self->_payment subtype] != 1) {
          goto LABEL_21;
        }
        v20 = @"DISPUTE_CREDIT";
        goto LABEL_20;
      }
      uint64_t v11 = 5;
LABEL_21:
      v24 = [v8 stringFromDate:v39];
      objc_super v12 = PKLocalizedCocoonString(&cfstr_PaymentIssuedD.isa, &stru_1EF1B4C70.isa, v24);

      v25 = [(PKPayLaterPayment *)self->_payment amount];
      v26 = [v25 amount];
      int v27 = objc_msgSend(v26, "pk_isPositiveNumber");

      if (v27)
      {
        v28 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v38);
        v10 = +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:v28 strikethrough:0];

        id v7 = v38;
      }
      else
      {
        id v7 = v38;
        v10 = +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:v38 strikethrough:0];
      }
LABEL_31:
      v36 = objc_msgSend(v13, "pk_attributedString");
      [v5 setPrimaryText:v36];

      v37 = objc_msgSend(v12, "pk_attributedString");
      [v5 setSecondaryText:v37];

      [v5 setAmountText:v10];
      [v5 setAmountTextColor:v9];
      [v5 setTargetType:v11];
      [v5 setShowChevron:1];

      return;
    case 7:
      v31 = v7;
      v13 = PKLocalizedCocoonString(&cfstr_LoanAdjustment.isa);
      objc_super v12 = [v8 stringFromDate:v39];
      v32 = [(PKPayLaterPayment *)self->_payment amount];
      v33 = [v32 amount];
      int v34 = objc_msgSend(v33, "pk_isPositiveNumber");

      if (v34)
      {
        v35 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v31);
        v10 = +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:v35 strikethrough:0];

        id v7 = v31;
      }
      else
      {
        id v7 = v31;
        v30 = v31;
LABEL_29:
        v10 = +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:v30 strikethrough:0];
      }
      uint64_t v11 = 5;
      goto LABEL_31;
    default:
      goto LABEL_31;
  }
}

uint64_t __73__PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem_populateRow___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 appliedPayments];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem_populateRow___block_invoke_2;
  v6[3] = &unk_1E59D29B8;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __73__PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem_populateRow___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 paymentIdentifier];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) paymentIdentifier];
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

- (unint64_t)type
{
  return 1;
}

- (id)installmentIdentifier
{
  return 0;
}

- (id)paymentIdentifier
{
  return (id)[(PKPayLaterPayment *)self->_payment paymentIdentifier];
}

- (id)date
{
  return (id)[(PKPayLaterPayment *)self->_payment postedDate];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<paymentItem; "];
  uint64_t v4 = [(PKPayLaterPayment *)self->_payment paymentIdentifier];
  [v3 appendFormat:@"paymentIdentifier: '%@'; ", v4];

  id v5 = [(PKPayLaterPayment *)self->_payment amount];
  id v6 = [v5 formattedStringValue];
  [v3 appendFormat:@"amount: '%@'; ", v6];

  id v7 = [(PKPayLaterPayment *)self->_payment postedDate];
  [v3 appendFormat:@"postedDate: '%@'; ", v7];

  uint64_t v8 = [(PKPayLaterFinancingPlanPaymentScheduleComposerPaymentItem *)self date];
  [v3 appendFormat:@"date: '%@'; ", v8];

  [v3 appendFormat:@">"];

  return (NSString *)v3;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (PKPayLaterPayment)payment
{
  return self->_payment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payment, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end