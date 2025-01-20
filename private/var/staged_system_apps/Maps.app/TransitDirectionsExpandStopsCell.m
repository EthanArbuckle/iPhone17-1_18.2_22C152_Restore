@interface TransitDirectionsExpandStopsCell
+ (Class)stepViewClass;
- (TransitDirectionsExpandableCellDelegate)expandableCellDelegate;
- (void)setExpandableCellDelegate:(id)a3;
- (void)updateExpandCollapseStyling;
@end

@implementation TransitDirectionsExpandStopsCell

+ (Class)stepViewClass
{
  return (Class)objc_opt_class();
}

- (void)setExpandableCellDelegate:(id)a3
{
  p_expandableCellDelegate = &self->_expandableCellDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_expandableCellDelegate, v5);
  [(TransitDirectionsStepView *)self->super.super._stepView setExpandableCellDelegate:v5];
}

- (void)updateExpandCollapseStyling
{
}

- (TransitDirectionsExpandableCellDelegate)expandableCellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expandableCellDelegate);

  return (TransitDirectionsExpandableCellDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end