@interface _UIPanelControllerContentView
- (UIPanelController)_panelController;
- (id)description;
- (void)_setPanelController:(id)a3;
@end

@implementation _UIPanelControllerContentView

- (void)_setPanelController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPanelControllerContentView;
  v3 = [(UIView *)&v7 description];
  v4 = (void *)[v3 mutableCopy];

  if (os_variant_has_internal_diagnostics())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->__panelController);
    objc_msgSend(v4, "appendFormat:", @" panelController=%p", WeakRetained);
  }
  return v4;
}

- (UIPanelController)_panelController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__panelController);
  return (UIPanelController *)WeakRetained;
}

@end