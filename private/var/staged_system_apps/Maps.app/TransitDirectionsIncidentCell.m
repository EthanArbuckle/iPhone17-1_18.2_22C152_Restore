@interface TransitDirectionsIncidentCell
+ (Class)stepViewClass;
- (BOOL)useLeadingInstructionMarginAsLeadingSeparatorInset;
- (TransitDirectionsIncidentCellDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setUseLeadingInstructionMarginAsLeadingSeparatorInset:(BOOL)a3;
@end

@implementation TransitDirectionsIncidentCell

+ (Class)stepViewClass
{
  return (Class)objc_opt_class();
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  id v6 = [(TransitDirectionsCell *)self stepView];
  [v6 setDelegate:v5];
}

- (BOOL)useLeadingInstructionMarginAsLeadingSeparatorInset
{
  return self->_useLeadingInstructionMarginAsLeadingSeparatorInset;
}

- (void)setUseLeadingInstructionMarginAsLeadingSeparatorInset:(BOOL)a3
{
  self->_useLeadingInstructionMarginAsLeadingSeparatorInset = a3;
}

- (TransitDirectionsIncidentCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TransitDirectionsIncidentCellDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end