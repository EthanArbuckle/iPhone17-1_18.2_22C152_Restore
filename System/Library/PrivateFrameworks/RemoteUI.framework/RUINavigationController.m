@interface RUINavigationController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)isDismissing;
- (RUIStyle)style;
- (UIViewController)hostViewController;
- (id)menuDismissalHandler;
- (id)viewDidDisappearHandler;
- (unint64_t)ruiModalPresentationStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_menuButtonPressed:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)setHostViewController:(id)a3;
- (void)setIsDismissing:(BOOL)a3;
- (void)setMenuDismissalHandler:(id)a3;
- (void)setRuiModalPresentationStyle:(unint64_t)a3;
- (void)setStyle:(id)a3;
- (void)setSupportedInterfaceOrientations:(unint64_t)a3;
- (void)setViewDidDisappearHandler:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation RUINavigationController

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_ruiSupportedInterfaceOrientations = a3;
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t result = self->_ruiSupportedInterfaceOrientations;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)RUINavigationController;
    return [(RUINavigationController *)&v4 supportedInterfaceOrientations];
  }
  return result;
}

- (void)loadView
{
  v2.receiver = self;
  v2.super_class = (Class)RUINavigationController;
  [(RUINavigationController *)&v2 loadView];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)RUINavigationController;
  [(RUINavigationController *)&v5 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__menuButtonPressed_];
  [v3 setAllowedPressTypes:&unk_26C557FD8];
  objc_super v4 = [(RUINavigationController *)self view];
  [v4 addGestureRecognizer:v3];
}

- (void)_menuButtonPressed:(id)a3
{
  objc_super v4 = [(RUINavigationController *)self viewControllers];
  unint64_t v5 = [v4 count];

  if (v5 < 2)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__RUINavigationController__menuButtonPressed___block_invoke;
    v9[3] = &unk_2642112D8;
    v9[4] = self;
    [(RUINavigationController *)self dismissViewControllerAnimated:1 completion:v9];
  }
  else
  {
    uint64_t v6 = [(RUINavigationController *)self popViewControllerAnimated:1];
    menuDismissalHandler = (uint64_t (**)(void))self->_menuDismissalHandler;
    if (menuDismissalHandler)
    {
      uint64_t v8 = v6;
      menuDismissalHandler = (uint64_t (**)(void))menuDismissalHandler[2]();
      uint64_t v6 = v8;
    }
    MEMORY[0x270F9A758](menuDismissalHandler, v6);
  }
}

uint64_t __46__RUINavigationController__menuButtonPressed___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 1456);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  int v7 = [WeakRetained conformsToProtocol:&unk_26C591348];

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_hostViewController);
    [v8 dismissModalRUIController:self completion:v5];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)RUINavigationController;
    [(RUINavigationController *)&v9 dismissViewControllerAnimated:1 completion:v5];
  }
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RUINavigationController;
  id v4 = a3;
  [(RUINavigationController *)&v9 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "userInterfaceStyle", v9.receiver, v9.super_class);

  uint64_t v6 = [(RUINavigationController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    id v8 = [(RUINavigationController *)self style];
    [v8 applyToNavigationController:self];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RUINavigationController;
  [(RUINavigationController *)&v5 viewDidDisappear:a3];
  viewDidDisappearHandler = (void (**)(id, RUINavigationController *))self->_viewDidDisappearHandler;
  if (viewDidDisappearHandler) {
    viewDidDisappearHandler[2](viewDidDisappearHandler, self);
  }
}

- (RUIStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (unint64_t)ruiModalPresentationStyle
{
  return self->_ruiModalPresentationStyle;
}

- (void)setRuiModalPresentationStyle:(unint64_t)a3
{
  self->_ruiModalPresentationStyle = a3;
}

- (UIViewController)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setHostViewController:(id)a3
{
}

- (id)menuDismissalHandler
{
  return self->_menuDismissalHandler;
}

- (void)setMenuDismissalHandler:(id)a3
{
}

- (id)viewDidDisappearHandler
{
  return self->_viewDidDisappearHandler;
}

- (void)setViewDidDisappearHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewDidDisappearHandler, 0);
  objc_storeStrong(&self->_menuDismissalHandler, 0);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_style, 0);
}

@end