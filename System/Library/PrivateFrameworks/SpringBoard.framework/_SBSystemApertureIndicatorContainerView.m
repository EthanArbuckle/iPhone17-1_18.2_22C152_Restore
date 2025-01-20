@interface _SBSystemApertureIndicatorContainerView
- (SAUIElementViewControlling)elementViewController;
- (SAUIElementViewControlling)outgoingElementViewController;
- (void)setElementViewController:(id)a3;
@end

@implementation _SBSystemApertureIndicatorContainerView

- (void)setElementViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementViewController);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_elementViewController);
    objc_storeWeak((id *)&self->_outgoingElementViewController, v5);
    objc_storeWeak((id *)&self->_elementViewController, obj);
  }
}

- (SAUIElementViewControlling)elementViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementViewController);
  return (SAUIElementViewControlling *)WeakRetained;
}

- (SAUIElementViewControlling)outgoingElementViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_outgoingElementViewController);
  return (SAUIElementViewControlling *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_outgoingElementViewController);
  objc_destroyWeak((id *)&self->_elementViewController);
}

@end