@interface PXHUDBoxedValueVisualization
- (id)value;
- (void)setValue:(id)a3;
@end

@implementation PXHUDBoxedValueVisualization

- (void).cxx_destruct
{
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  if (self->_value != v5)
  {
    id v6 = v5;
    objc_storeStrong(&self->_value, a3);
    [(PXHUDVisualization *)self _notifyDelegateVisualizationDidChange];
    id v5 = v6;
  }
}

@end