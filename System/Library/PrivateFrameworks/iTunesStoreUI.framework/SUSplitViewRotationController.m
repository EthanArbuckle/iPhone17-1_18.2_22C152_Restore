@interface SUSplitViewRotationController
- (id)_firstRotationController;
- (id)_secondRotationController;
- (void)animateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)dealloc;
- (void)finishRotationFromInterfaceOrientation:(int64_t)a3;
- (void)prepareToRotateToInterfaceOrientation:(int64_t)a3;
@end

@implementation SUSplitViewRotationController

- (void)dealloc
{
  [(SURotationController *)self->_firstRotationController setViewController:0];
  v3 = self->_firstRotationController;
  self->_firstRotationController = 0;

  [(SURotationController *)self->_secondRotationController setViewController:0];
  v4 = self->_secondRotationController;
  self->_secondRotationController = 0;

  v5.receiver = self;
  v5.super_class = (Class)SUSplitViewRotationController;
  [(SURotationController *)&v5 dealloc];
}

- (void)animateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  objc_msgSend(-[SUSplitViewRotationController _firstRotationController](self, "_firstRotationController"), "animateRotationToInterfaceOrientation:duration:", a3, a4);
  id v7 = [(SUSplitViewRotationController *)self _secondRotationController];

  [v7 animateRotationToInterfaceOrientation:a3 duration:a4];
}

- (void)finishRotationFromInterfaceOrientation:(int64_t)a3
{
  objc_msgSend(-[SUSplitViewRotationController _firstRotationController](self, "_firstRotationController"), "finishRotationFromInterfaceOrientation:", a3);
  [(SURotationController *)self->_firstRotationController setViewController:0];
  objc_super v5 = self->_firstRotationController;
  self->_firstRotationController = 0;
  objc_msgSend(-[SUSplitViewRotationController _secondRotationController](self, "_secondRotationController"), "finishRotationFromInterfaceOrientation:", a3);
  [(SURotationController *)self->_secondRotationController setViewController:0];
  v6 = self->_secondRotationController;
  self->_secondRotationController = 0;
  id v7 = (void *)[(SUViewController *)self->super._viewController view];
  v8 = (void *)[(SUViewController *)self->super._viewController _splitView];
  [v8 setAutoresizingMask:18];
  [v7 bounds];
  objc_msgSend(v8, "setFrame:");
  objc_msgSend((id)objc_msgSend(v8, "layer"), "setShouldRasterize:", 0);

  [v7 addSubview:v8];
}

- (void)prepareToRotateToInterfaceOrientation:(int64_t)a3
{
  objc_msgSend(-[SUSplitViewRotationController _firstRotationController](self, "_firstRotationController"), "prepareToRotateToInterfaceOrientation:", a3);
  objc_msgSend(-[SUSplitViewRotationController _secondRotationController](self, "_secondRotationController"), "prepareToRotateToInterfaceOrientation:", a3);
  objc_super v5 = (void *)[(SUViewController *)self->super._viewController _splitView];
  [MEMORY[0x263F158F8] begin];
  [(SURotationController *)self viewFrameForInterfaceOrientation:a3];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v5 setAutoresizingMask:0];
  objc_msgSend(v5, "setFrame:", v7, v9, v11, v13);
  objc_msgSend((id)objc_msgSend(v5, "layer"), "setShouldRasterize:", 1);
  v14 = (void *)MEMORY[0x263F158F8];

  [v14 commit];
}

- (id)_firstRotationController
{
  v3 = (void *)[(SUViewController *)self->super._viewController firstViewController];
  firstRotationController = self->_firstRotationController;
  if (firstRotationController)
  {
    if ([(SURotationController *)firstRotationController viewController] == v3) {
      return self->_firstRotationController;
    }
    objc_super v5 = self->_firstRotationController;
  }
  else
  {
    objc_super v5 = 0;
  }

  if (objc_opt_respondsToSelector())
  {
    self->_firstRotationController = (SURotationController *)[v3 newRotationController];
    double v6 = v3;
  }
  else
  {
    double v6 = 0;
    self->_firstRotationController = 0;
  }
  self->_firstViewController = v6;
  return self->_firstRotationController;
}

- (id)_secondRotationController
{
  v3 = (void *)[(SUViewController *)self->super._viewController secondViewController];
  secondRotationController = self->_secondRotationController;
  if (secondRotationController)
  {
    if ([(SURotationController *)secondRotationController viewController] == v3) {
      return self->_secondRotationController;
    }
    objc_super v5 = self->_secondRotationController;
  }
  else
  {
    objc_super v5 = 0;
  }

  if (objc_opt_respondsToSelector())
  {
    self->_secondRotationController = (SURotationController *)[v3 newRotationController];
    double v6 = v3;
  }
  else
  {
    double v6 = 0;
    self->_secondRotationController = 0;
  }
  self->_secondViewController = v6;
  return self->_secondRotationController;
}

@end