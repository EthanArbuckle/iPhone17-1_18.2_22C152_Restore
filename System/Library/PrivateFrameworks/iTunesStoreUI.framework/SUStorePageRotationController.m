@interface SUStorePageRotationController
- (id)_childRotationController;
- (void)animateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)dealloc;
- (void)finishRotationFromInterfaceOrientation:(int64_t)a3;
- (void)prepareToRotateToInterfaceOrientation:(int64_t)a3;
@end

@implementation SUStorePageRotationController

- (void)dealloc
{
  [(SURotationController *)self->_childRotationController setViewController:0];
  v3 = self->_childRotationController;
  self->_childRotationController = 0;

  v4.receiver = self;
  v4.super_class = (Class)SUStorePageRotationController;
  [(SURotationController *)&v4 dealloc];
}

- (void)animateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  [(SUViewController *)self->super._viewController tabBarController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend((id)objc_msgSend((id)-[SUViewController view](self->super._viewController, "view"), "viewWithTag:", 1920234350), "setAlpha:", 0.0);
  }
  id v7 = [(SUStorePageRotationController *)self _childRotationController];

  [v7 animateRotationToInterfaceOrientation:a3 duration:a4];
}

- (void)finishRotationFromInterfaceOrientation:(int64_t)a3
{
  [(SUViewController *)self->super._viewController tabBarController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend((id)objc_msgSend((id)-[SUViewController view](self->super._viewController, "view"), "viewWithTag:", 1920234350), "removeFromSuperview");
  }
  objc_msgSend(-[SUStorePageRotationController _childRotationController](self, "_childRotationController"), "finishRotationFromInterfaceOrientation:", a3);
  [(SURotationController *)self->_childRotationController setViewController:0];
  v5 = self->_childRotationController;
  self->_childRotationController = 0;
}

- (void)prepareToRotateToInterfaceOrientation:(int64_t)a3
{
  id v4 = [(SUStorePageRotationController *)self _childRotationController];

  [v4 prepareToRotateToInterfaceOrientation:a3];
}

- (id)_childRotationController
{
  v3 = (void *)[(SUViewController *)self->super._viewController _activeChildViewController];
  childRotationController = self->_childRotationController;
  if (!childRotationController)
  {
    v5 = 0;
    goto LABEL_5;
  }
  if ([(SURotationController *)childRotationController viewController] != v3)
  {
    v5 = self->_childRotationController;
LABEL_5:

    self->_childRotationController = (SURotationController *)[v3 newRotationController];
    self->_childViewController = (SUViewController *)v3;
  }
  return self->_childRotationController;
}

@end