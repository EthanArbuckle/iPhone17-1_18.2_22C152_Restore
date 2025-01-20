@interface PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem
- (NSString)description;
- (PKPayLaterFinancingPlan)financingPlan;
- (PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem)initWithFinancingPlan:(id)a3 installment:(id)a4;
- (PKPayLaterInstallment)installment;
- (id)date;
- (id)installmentIdentifier;
- (id)paymentIdentifier;
- (unint64_t)type;
- (void)populateRow:(id)a3;
@end

@implementation PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem

- (PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem)initWithFinancingPlan:(id)a3 installment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem;
  v9 = [(PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_financingPlan, a3);
    objc_storeStrong((id *)&v10->_installment, a4);
  }

  return v10;
}

- (void)populateRow:(id)a3
{
  id v50 = a3;
  v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
  v5 = [v4 nextDueInstallment];

  v6 = [(PKPayLaterInstallment *)self->_installment installmentIdentifier];
  id v7 = +[PKPayLaterFinancingPlanPaymentScheduleComposer mediumDateFormatter];
  id v8 = [(PKPayLaterInstallment *)self->_installment dueDate];
  v9 = [v7 stringFromDate:v8];

  uint64_t v10 = [v50 primaryTextColor];
  v11 = [(PKPayLaterInstallment *)self->_installment currentBalance];
  objc_super v12 = [v11 formattedStringValue];
  uint64_t v13 = +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:v12 strikethrough:0];

  v48 = [v50 amountTextColor];
  uint64_t v14 = [v50 secondaryTextColor];
  id v15 = [v5 installmentIdentifier];
  id v16 = v6;
  v46 = (void *)v13;
  v49 = (void *)v14;
  if (v15 == v16)
  {
    v18 = (void *)v10;
    v19 = v5;
    char v17 = 1;
  }
  else
  {
    char v17 = 0;
    v18 = (void *)v10;
    v19 = v5;
    if (v16 && v15) {
      char v17 = [v15 isEqualToString:v16];
    }
  }
  char v47 = v17;

  v20 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
  v21 = [v20 installments];
  v22 = [v21 firstObject];
  id v23 = [v22 installmentIdentifier];
  id v24 = v16;
  v25 = v24;
  if (v23 == v24)
  {
    int v26 = 1;
  }
  else
  {
    int v26 = 0;
    if (v24 && v23) {
      int v26 = [v23 isEqualToString:v24];
    }
  }

  uint64_t v27 = [(PKPayLaterInstallment *)self->_installment status];
  if (v27 == 4)
  {
    v31 = PKLocalizedCocoonString(&cfstr_InstallmentPay_46.isa);
    [MEMORY[0x1E4FB1618] redColor];
    v49 = v33 = v49;
    v29 = v9;
    v30 = v19;
  }
  else
  {
    if (v27 != 1
      || (uint64_t v28 = [(PKPayLaterInstallment *)self->_installment interval],
          [(PKPayLaterFinancingPlan *)self->_financingPlan state],
          !PKPayLaterFinancingPlanStateIsPending()))
    {
      v31 = 0;
      v30 = v19;
      v32 = v46;
      goto LABEL_23;
    }
    v29 = PKLocalizedCocoonString(&cfstr_InNumberWeeks.isa, &cfstr_Ld.isa, v28);

    v30 = v19;
    if (v26) {
      [MEMORY[0x1E4FB1618] labelColor];
    }
    else {
    v33 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    id v34 = v33;

    id v35 = v34;
    v48 = v35;
    if (v26)
    {

      v33 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
      uint64_t v36 = [v33 installmentNumberForInstallmentIdentifier:v25];
      v37 = [v33 installments];
      v18 = v35;
      uint64_t v38 = [v37 count];

      v39 = [NSNumber numberWithInteger:v36 + 1];
      v40 = [NSNumber numberWithInteger:v38];
      uint64_t v41 = PKLocalizedCocoonString(&cfstr_PlanPaymentNum.isa, &stru_1EF1B5770.isa, v39, v40);

      v31 = PKLocalizedCocoonString(&cfstr_PlanPendingMer.isa);
      v29 = (void *)v41;
    }
    else
    {
      v31 = 0;
      v18 = v35;
    }
  }
  v32 = v46;

  v9 = v29;
LABEL_23:
  v42 = objc_msgSend(v9, "pk_attributedString");
  [v50 setPrimaryText:v42];

  if (v47)
  {
    v43 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2790], 2, 0);
    uint64_t v44 = 3;
  }
  else
  {
    v43 = [v50 primaryFont];
    uint64_t v44 = 2;
  }
  [v50 setPrimaryFont:v43];

  [v50 setPrimaryTextColor:v18];
  v45 = objc_msgSend(v31, "pk_attributedString");
  [v50 setSecondaryText:v45];

  [v50 setSecondaryTextColor:v49];
  [v50 setAmountText:v32];
  [v50 setAmountTextColor:v48];
  [v50 setTargetType:v44];
}

- (unint64_t)type
{
  return 2;
}

- (id)installmentIdentifier
{
  return (id)[(PKPayLaterInstallment *)self->_installment installmentIdentifier];
}

- (id)paymentIdentifier
{
  return 0;
}

- (id)date
{
  if ([(PKPayLaterInstallment *)self->_installment status] == 4)
  {
    v3 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
    v4 = [(PKPayLaterInstallment *)self->_installment dueDate];
    v5 = [v3 paymentsAfterInstallmentDueDate:v4];

    v6 = [v5 lastObject];
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 postedDate];
      v9 = [v8 dateByAddingTimeInterval:1.0];

      goto LABEL_6;
    }
  }
  v9 = [(PKPayLaterInstallment *)self->_installment dueDate];
LABEL_6:

  return v9;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<installmentItem; "];
  v4 = [(PKPayLaterInstallment *)self->_installment installmentIdentifier];
  [v3 appendFormat:@"installmentIdentifier: '%@'; ", v4];

  v5 = [(PKPayLaterInstallment *)self->_installment dueDate];
  [v3 appendFormat:@"dueDate: '%@'; ", v5];

  v6 = [(PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem *)self date];
  [v3 appendFormat:@"date: '%@'; ", v6];

  [v3 appendFormat:@">"];

  return (NSString *)v3;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (PKPayLaterInstallment)installment
{
  return self->_installment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installment, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end