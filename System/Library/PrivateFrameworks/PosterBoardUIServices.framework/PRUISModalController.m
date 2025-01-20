@interface PRUISModalController
- (FBSDisplayConfiguration)displayConfiguration;
- (PRUISModalController)initWithEntryPoint:(id)a3;
- (PRUISModalControllerDelegate)delegate;
- (void)handleHostSceneTransitionedFromActiveState;
- (void)inlineEditingViewController:(id)a3 didDismissWithResponse:(id)a4;
- (void)inlineEditingViewController:(id)a3 willDismissWithResponse:(id)a4;
- (void)presentFromWindowScene:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayConfiguration:(id)a3;
@end

@implementation PRUISModalController

- (PRUISModalController)initWithEntryPoint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISModalController;
  v6 = [(PRUISModalController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entryPoint, a3);
  }

  return v7;
}

- (void)setDisplayConfiguration:(id)a3
{
  id v5 = a3;
  if ((-[FBSDisplayConfiguration isEqual:](self->_displayConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayConfiguration, a3);
    [(PRUISInlinePosterEditingViewController *)self->_viewController setDisplayConfiguration:v5];
  }
}

- (void)presentFromWindowScene:(id)a3
{
  id v11 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_window)
  {
    v4 = [[PRUISInlinePosterEditingViewController alloc] initWithEntryPoint:self->_entryPoint];
    [(PRUISInlinePosterEditingViewController *)v4 setDelegate:self];
    [(PRUISInlinePosterEditingViewController *)v4 setDisplayConfiguration:self->_displayConfiguration];
    viewController = self->_viewController;
    self->_viewController = v4;
    v6 = v4;

    v7 = (UIWindow *)[objc_alloc(MEMORY[0x263F1CBC8]) initWithWindowScene:v11];
    window = self->_window;
    self->_window = v7;

    [(UIWindow *)self->_window _setWindowInterfaceOrientation:1];
    objc_super v9 = self->_window;
    v10 = [MEMORY[0x263F1C550] clearColor];
    [(UIWindow *)v9 setBackgroundColor:v10];

    [(UIWindow *)self->_window setWindowLevel:*MEMORY[0x263F1D810] + 1.0];
    [(UIWindow *)self->_window setRootViewController:v6];
    [(UIWindow *)self->_window makeKeyAndVisible];
  }
}

- (void)handleHostSceneTransitionedFromActiveState
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:*MEMORY[0x263F07FD8] object:0];
}

- (void)inlineEditingViewController:(id)a3 willDismissWithResponse:(id)a4
{
  id v6 = a4;
  BSDispatchQueueAssertMain();
  id v5 = [(PRUISModalController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 modalController:self willDismissSheetWithResponse:v6];
  }
}

- (void)inlineEditingViewController:(id)a3 didDismissWithResponse:(id)a4
{
  id v7 = a4;
  BSDispatchQueueAssertMain();
  [(UIWindow *)self->_window setHidden:1];
  window = self->_window;
  self->_window = 0;

  id v6 = [(PRUISModalController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 modalController:self didDismissSheetWithResponse:v7];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 modalControllerDidDismissSheet:self];
  }
}

- (PRUISModalControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PRUISModalControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end