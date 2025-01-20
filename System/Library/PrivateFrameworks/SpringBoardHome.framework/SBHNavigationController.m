@interface SBHNavigationController
- (UIColor)modalPresentedBackgroundColor;
- (id)_backgroundColorForModalFormSheet;
- (void)setModalPresentedBackgroundColor:(id)a3;
@end

@implementation SBHNavigationController

- (void)setModalPresentedBackgroundColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHNavigationController;
    id v4 = [(SBHNavigationController *)&v6 _backgroundColorForModalFormSheet];
  }
  p_modalPresentedBackgroundColor = &self->_modalPresentedBackgroundColor;
  if (([(UIColor *)*p_modalPresentedBackgroundColor isEqual:v4] & 1) == 0) {
    objc_storeStrong((id *)p_modalPresentedBackgroundColor, v4);
  }
}

- (id)_backgroundColorForModalFormSheet
{
  v3 = [(SBHNavigationController *)self modalPresentedBackgroundColor];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHNavigationController;
    id v5 = [(SBHNavigationController *)&v8 _backgroundColorForModalFormSheet];
  }
  objc_super v6 = v5;

  return v6;
}

- (UIColor)modalPresentedBackgroundColor
{
  return self->_modalPresentedBackgroundColor;
}

- (void).cxx_destruct
{
}

@end