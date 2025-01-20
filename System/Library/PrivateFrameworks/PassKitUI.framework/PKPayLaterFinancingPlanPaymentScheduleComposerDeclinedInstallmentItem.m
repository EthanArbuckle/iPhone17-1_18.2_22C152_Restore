@interface PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem
- (NSString)description;
- (PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem)initWithFinancingPlan:(id)a3 installment:(id)a4 payment:(id)a5;
- (PKPayLaterPayment)payment;
- (id)paymentIdentifier;
- (unint64_t)type;
- (void)populateRow:(id)a3;
@end

@implementation PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem

- (PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem)initWithFinancingPlan:(id)a3 installment:(id)a4 payment:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem;
  v10 = [(PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem *)&v13 initWithFinancingPlan:a3 installment:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_payment, a5);
  }

  return v11;
}

- (void)populateRow:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem;
  [(PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem *)&v11 populateRow:v4];
  if ([(PKPayLaterPayment *)self->_payment type] == 5)
  {
    v5 = [(PKPayLaterPayment *)self->_payment fundingSources];
    v6 = [v5 firstObject];
    v7 = [v6 displayName];

    v8 = PKLocalizedCocoonString(&cfstr_InstallmentPay_47.isa, &stru_1EF1B4C70.isa, v7);
    id v9 = [MEMORY[0x1E4FB1618] redColor];
    v10 = objc_msgSend(v8, "pk_attributedString");
    [v4 setSecondaryText:v10];

    [v4 setSecondaryTextColor:v9];
    [v4 setShowChevron:1];
  }
}

- (unint64_t)type
{
  return 3;
}

- (id)paymentIdentifier
{
  return (id)[(PKPayLaterPayment *)self->_payment paymentIdentifier];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<installmentDeclinedItem; "];
  id v4 = [(PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem *)self installment];
  v5 = [v4 installmentIdentifier];
  [v3 appendFormat:@"installmentIdentifier: '%@'; ", v5];

  v6 = [(PKPayLaterPayment *)self->_payment paymentIdentifier];
  [v3 appendFormat:@"paymentIdentifier: '%@'; ", v6];

  v7 = [(PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem *)self installment];
  v8 = [v7 dueDate];
  [v3 appendFormat:@"dueDate: '%@'; ", v8];

  [v3 appendFormat:@">"];

  return (NSString *)v3;
}

- (PKPayLaterPayment)payment
{
  return self->_payment;
}

- (void).cxx_destruct
{
}

@end