@interface PKPayLaterFinancingPlanInstallmentCell
- (void)prepareForReuse;
- (void)setFinancingPlan:(id)a3 installment:(id)a4 rowIndex:(int64_t)a5 paymentIntentController:(id)a6 presentingViewController:(id)a7;
@end

@implementation PKPayLaterFinancingPlanInstallmentCell

- (void)setFinancingPlan:(id)a3 installment:(id)a4 rowIndex:(int64_t)a5 paymentIntentController:(id)a6 presentingViewController:(id)a7
{
  id v17 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (!PKEqualObjects() || (PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_financingPlan, a3);
    objc_storeStrong((id *)&self->_installment, a4);
    v16 = [[PKPayLaterFinancingPlanInstallmentCellView alloc] initWithFinancingPlan:self->_financingPlan installment:self->_installment rowIndex:a5 paymentIntentController:v14 presentingViewController:v15];
    [(PKPayLaterIconCell *)self setView:v16];
  }
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterFinancingPlanInstallmentCell;
  [(PKPayLaterIconCell *)&v5 prepareForReuse];
  financingPlan = self->_financingPlan;
  self->_financingPlan = 0;

  installment = self->_installment;
  self->_installment = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_installment, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end