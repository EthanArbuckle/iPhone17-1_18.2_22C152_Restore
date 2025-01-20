@interface PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem
- (NSString)description;
- (PKPayLaterFinancingPlan)financingPlan;
- (PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem)initWithFinancingPlan:(id)a3 installment:(id)a4 payment:(id)a5;
- (PKPayLaterInstallment)installment;
- (PKPayLaterPayment)payment;
- (id)date;
- (id)installmentIdentifier;
- (id)paymentIdentifier;
- (unint64_t)type;
- (void)populateRow:(id)a3;
@end

@implementation PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem

- (PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem)initWithFinancingPlan:(id)a3 installment:(id)a4 payment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem;
  v12 = [(PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_financingPlan, a3);
    objc_storeStrong((id *)&v13->_installment, a4);
    objc_storeStrong((id *)&v13->_payment, a5);
  }

  return v13;
}

- (void)populateRow:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v77 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
  v74 = [v77 installments];
  uint64_t v5 = [v74 count];
  v73 = [(PKPayLaterInstallment *)self->_installment installmentIdentifier];
  v6 = [(PKPayLaterPayment *)self->_payment paymentIdentifier];
  v7 = +[PKPayLaterFinancingPlanPaymentScheduleComposer mediumDateFormatter];
  v8 = [(PKPayLaterInstallment *)self->_installment dueDate];
  id v9 = [v7 stringFromDate:v8];

  v72 = v9;
  v70 = objc_msgSend(v9, "pk_attributedString");
  v68 = [v4 primaryTextColor];
  id v10 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
  id v11 = [v10 installmentsAffectedByPaymentIdentifier:v6];

  v75 = v11;
  v12 = [v11 firstObject];
  v13 = [(PKPayLaterPayment *)self->_payment postedDate];
  v71 = v12;
  v14 = [v12 dueDate];
  uint64_t v15 = [v13 compare:v14];

  if (self->_payment)
  {
    int v16 = [(PKPayLaterFinancingPlan *)self->_financingPlan installmentWasPaidEarly:self->_installment];
    if (v15 == 1) {
      int v17 = 1;
    }
    else {
      int v17 = v16;
    }
  }
  else
  {
    int v17 = 0;
  }
  v18 = +[PKPayLaterFinancingPlanPaymentScheduleComposer shortDateFormatter];
  payment = self->_payment;
  v67 = v18;
  if (!payment)
  {
    v76 = 0;
    goto LABEL_34;
  }
  v20 = [(PKPayLaterPayment *)payment postedDate];
  v76 = [v18 stringFromDate:v20];

  if (!self->_payment)
  {
    payment = 0;
LABEL_34:
    v37 = [(PKPayLaterPayment *)payment amount];
    v38 = [v37 formattedStringValue];
    v39 = v38;
    if (v38)
    {
      id v40 = v38;
    }
    else
    {
      v41 = [(PKPayLaterInstallment *)self->_installment currentBalance];
      id v40 = [v41 formattedStringValue];
    }
    v42 = [(PKPayLaterPayment *)self->_payment postedDate];
    v43 = [(PKPayLaterInstallment *)self->_installment dueDate];
    if ([v42 compare:v43] == 1)
    {
      v44 = [(PKPayLaterInstallment *)self->_installment payments];
      if ([v44 count] == 1)
      {
        uint64_t v45 = [v75 count];

        if (v45 != 1) {
          goto LABEL_43;
        }
        v42 = [(PKPayLaterInstallment *)self->_installment totalAmount];
        [v42 formattedStringValue];
        v43 = v40;
        id v40 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
      }
    }

LABEL_43:
    v46 = +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:v40 strikethrough:0];
    if (!self->_payment) {
      goto LABEL_46;
    }
    v47 = [(PKPayLaterInstallment *)self->_installment dueDate];
    v48 = PKDateIgnoringTime();
    v49 = [(PKPayLaterPayment *)self->_payment postedDate];
    v50 = PKDateIgnoringTime();
    uint64_t v51 = [v48 compare:v50];

    if (v51)
    {
      uint64_t v52 = PKLocalizedCocoonString(&cfstr_InstallmentPai.isa, &stru_1EF1B4C70.isa, v76);
    }
    else
    {
LABEL_46:
      uint64_t v52 = PKLocalizedCocoonString(&cfstr_InstallmentPai_0.isa);
    }
    v53 = (void *)v52;

    unsigned int v54 = 1;
    uint64_t v55 = 5;
    v57 = v68;
    v56 = v70;
    goto LABEL_48;
  }
  v21 = [v77 firstInstallmentIdentifierAffectedByPaymentIdentifier:v6];
  v22 = [(PKPayLaterInstallment *)self->_installment installmentIdentifier];
  id v23 = v21;
  id v24 = v22;
  v25 = v24;
  if (v23 == v24)
  {
  }
  else
  {
    if (!v23 || !v24)
    {

LABEL_18:
      BOOL v27 = 1;
      goto LABEL_19;
    }
    int v26 = [v23 isEqualToString:v24];

    if (!v26) {
      goto LABEL_18;
    }
  }
  BOOL v27 = [(PKPayLaterPayment *)self->_payment type] != 1;
LABEL_19:

  payment = self->_payment;
  if (!payment || (v17 & v27) != 1) {
    goto LABEL_34;
  }
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __81__PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem_populateRow___block_invoke;
  v82[3] = &unk_1E59D76C8;
  id v83 = v73;
  unint64_t v28 = [v74 indexOfObjectPassingTest:v82];
  v29 = 0;
  if (v28 != 0x7FFFFFFFFFFFFFFFLL && v28 < v5 - 1)
  {
    v29 = objc_msgSend(v74, "subarrayWithRange:", v28 + 1, v5 - (v28 + 1));
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v30 = v29;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v78 objects:v84 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v79;
    while (2)
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v79 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        if (!-[PKPayLaterFinancingPlan installmentWasPaidEarly:](self->_financingPlan, "installmentWasPaidEarly:", v35)|| ![v35 paymentIdentitiferContributedToInstallment:v6])
        {
          int v36 = 0;
          goto LABEL_54;
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v78 objects:v84 count:16];
      int v36 = 1;
      if (v32) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v36 = 1;
  }
LABEL_54:

  uint64_t v61 = [MEMORY[0x1E4FB1618] secondaryLabelColor];

  v62 = [(PKPayLaterInstallment *)self->_installment dueDate];
  int v63 = [v77 hasPaymentsOrInstallmentsAfterInstallmentDueDate:v62];

  if (v63) {
    uint64_t v64 = 5;
  }
  else {
    uint64_t v64 = 0;
  }
  if (v36) {
    uint64_t v55 = v64;
  }
  else {
    uint64_t v55 = 5;
  }
  uint64_t v69 = +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:v72 strikethrough:1];

  v65 = [(PKPayLaterInstallment *)self->_installment totalAmount];
  v66 = [v65 formattedStringValue];
  v46 = +[PKPayLaterFinancingPlanPaymentScheduleComposer attributedStringWithText:v66 strikethrough:1];

  unsigned int v54 = 0;
  v53 = 0;
  v57 = (void *)v61;
  v56 = (void *)v69;
LABEL_48:
  [v4 setPrimaryText:v56];
  v58 = objc_msgSend(v53, "pk_attributedString");
  [v4 setSecondaryText:v58];

  [v4 setAmountText:v46];
  v59 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v4 setAmountTextColor:v59];

  [v4 setPrimaryTextColor:v57];
  [v4 setTargetType:v55];
  if (self->_payment) {
    uint64_t v60 = v54;
  }
  else {
    uint64_t v60 = 0;
  }
  [v4 setShowChevron:v60];
}

uint64_t __81__PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem_populateRow___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 installmentIdentifier];
  id v4 = *(void **)(a1 + 32);
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

- (unint64_t)type
{
  return 4;
}

- (id)installmentIdentifier
{
  return (id)[(PKPayLaterInstallment *)self->_installment installmentIdentifier];
}

- (id)paymentIdentifier
{
  return (id)[(PKPayLaterPayment *)self->_payment paymentIdentifier];
}

- (id)date
{
  if ([(PKPayLaterPayment *)self->_payment type] != 1) {
    goto LABEL_12;
  }
  v3 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
  id v4 = [(PKPayLaterPayment *)self->_payment paymentIdentifier];
  id v5 = [v3 installmentsAffectedByPaymentIdentifier:v4];

  id v6 = [v5 firstObject];
  v7 = [v6 installmentIdentifier];
  uint64_t v8 = [(PKPayLaterInstallment *)self->_installment installmentIdentifier];
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_8;
  }
  id v11 = v10;
  if (v9 && v10)
  {
    char v12 = [v9 isEqualToString:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_8:
    uint64_t v13 = [(PKPayLaterInstallment *)self->_installment payoffDate];
    if (v13)
    {
      v14 = (void *)v13;
      uint64_t v15 = [(PKPayLaterInstallment *)self->_installment dueDate];
      int v16 = PKEarlierDate();

      goto LABEL_13;
    }
    goto LABEL_11;
  }

LABEL_11:
LABEL_12:
  int v16 = [(PKPayLaterInstallment *)self->_installment dueDate];
LABEL_13:

  return v16;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<installmentPaidItem; "];
  id v4 = [(PKPayLaterInstallment *)self->_installment installmentIdentifier];
  [v3 appendFormat:@"installmentIdentifier: '%@'; ", v4];

  id v5 = [(PKPayLaterPayment *)self->_payment paymentIdentifier];
  [v3 appendFormat:@"installmentIdentifier: '%@'; ", v5];

  id v6 = [(PKPayLaterInstallment *)self->_installment dueDate];
  [v3 appendFormat:@"dueDate: '%@'; ", v6];

  v7 = [(PKPayLaterInstallment *)self->_installment payoffDate];
  [v3 appendFormat:@"payoffDate: '%@'; ", v7];

  uint64_t v8 = [(PKPayLaterPayment *)self->_payment postedDate];
  [v3 appendFormat:@"postedDate: '%@'; ", v8];

  id v9 = [(PKPayLaterFinancingPlanPaymentScheduleComposerPaidInstallmentItem *)self date];
  [v3 appendFormat:@"date: '%@'; ", v9];

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

- (PKPayLaterPayment)payment
{
  return self->_payment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_installment, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end