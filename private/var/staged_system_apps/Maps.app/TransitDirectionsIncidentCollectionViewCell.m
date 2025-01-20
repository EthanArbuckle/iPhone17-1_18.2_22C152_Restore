@interface TransitDirectionsIncidentCollectionViewCell
+ (Class)stepViewClass;
- (TransitDirectionsIncidentCellDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation TransitDirectionsIncidentCollectionViewCell

+ (Class)stepViewClass
{
  return (Class)objc_opt_class();
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  id v6 = [(TransitDirectionsCollectionViewCell *)self stepView];
  [v6 setDelegate:v5];
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