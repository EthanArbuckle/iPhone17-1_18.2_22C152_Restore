@interface SURotationController
- (BOOL)orientationAffectsViewFrame;
- (CGRect)viewFrameForInterfaceOrientation:(int64_t)a3;
- (SURotationController)init;
- (SURotationController)initWithViewController:(id)a3;
- (SUViewController)viewController;
- (void)dealloc;
- (void)setViewController:(id)a3;
@end

@implementation SURotationController

- (SURotationController)init
{
  return [(SURotationController *)self initWithViewController:0];
}

- (SURotationController)initWithViewController:(id)a3
{
  if (!a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"viewController cannot be nil"];
  }
  v6.receiver = self;
  v6.super_class = (Class)SURotationController;
  result = [(SURotationController *)&v6 init];
  if (result) {
    result->_viewController = (SUViewController *)a3;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SURotationController;
  [(SURotationController *)&v2 dealloc];
}

- (BOOL)orientationAffectsViewFrame
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
  double v4 = v3;
  double v6 = v5;
  int64_t v7 = [(SUViewController *)self->_viewController interfaceOrientation];
  if ([(UIViewController *)self->_viewController overlayViewController]) {
    return 0;
  }
  double v8 = v4 >= v6 ? v4 : v6;
  double v9 = v4 >= v6 ? v6 : v4;
  double v10 = (unint64_t)(v7 - 3) >= 2 ? v9 : v8;
  objc_msgSend((id)-[SUViewController view](self->_viewController, "view"), "frame");
  if (vabdd_f64(v11, v10) > 0.00000011920929) {
    return 0;
  }
  uint64_t v13 = [(SUViewController *)self->_viewController presentingViewController];
  BOOL result = !v13
        || (v14 = (void *)v13,
            !-[UIViewController isDescendantOfViewController:](self->_viewController, "isDescendantOfViewController:", v13))|| [v14 modalPresentationStyle] != 2;
  return result;
}

- (CGRect)viewFrameForInterfaceOrientation:(int64_t)a3
{
  objc_msgSend((id)-[SUViewController view](self->_viewController, "view"), "frame");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if ([(SURotationController *)self orientationAffectsViewFrame])
  {
    unint64_t v13 = [(SUViewController *)self->_viewController interfaceOrientation] - 3;
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
    if ((unint64_t)(a3 - 3) > 1)
    {
      if (v13 <= 1)
      {
        double v12 = v15 - (v14 - v12);
        double v10 = v14 - (v15 - v10);
      }
    }
    else if (v13 >= 2)
    {
      double v12 = v14 - (v15 - v12);
      double v10 = v15 - (v14 - v10);
    }
  }
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  double v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (SUViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  self->_viewController = (SUViewController *)a3;
}

@end