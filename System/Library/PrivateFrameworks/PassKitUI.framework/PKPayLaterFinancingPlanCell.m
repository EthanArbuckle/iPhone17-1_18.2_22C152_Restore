@interface PKPayLaterFinancingPlanCell
- (BOOL)showSpinner;
- (PKPayLaterFinancingPlan)financingPlan;
- (double)minimumHeight;
- (unint64_t)context;
- (void)prepareForReuse;
- (void)setFinancingPlan:(id)a3 context:(unint64_t)a4 rowIndex:(int64_t)a5;
- (void)setShowSpinner:(BOOL)a3;
@end

@implementation PKPayLaterFinancingPlanCell

- (void)setFinancingPlan:(id)a3 context:(unint64_t)a4 rowIndex:(int64_t)a5
{
  p_financingPlan = &self->_financingPlan;
  id v12 = a3;
  if (!PKEqualObjects() || self->_context != a4)
  {
    objc_storeStrong((id *)&self->_financingPlan, a3);
    self->_context = a4;
    v10 = [[PKPayLaterFinancingPlanCellView alloc] initWithFinancingPlan:*p_financingPlan context:a4 rowIndex:a5];
    view = self->_view;
    self->_view = v10;

    [(PKPayLaterIconCell *)self setView:self->_view];
  }
}

- (void)setShowSpinner:(BOOL)a3
{
  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    -[PKPayLaterFinancingPlanCellView setShowSpinner:](self->_view, "setShowSpinner:");
    [(PKPayLaterFinancingPlanCell *)self setNeedsLayout];
  }
}

- (double)minimumHeight
{
  return 76.0;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterFinancingPlanCell;
  [(PKPayLaterIconCell *)&v5 prepareForReuse];
  financingPlan = self->_financingPlan;
  self->_financingPlan = 0;

  self->_showSpinner = 0;
  [(PKPayLaterFinancingPlanCellView *)self->_view removeFromSuperview];
  view = self->_view;
  self->_view = 0;

  self->_context = 0;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (unint64_t)context
{
  return self->_context;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end