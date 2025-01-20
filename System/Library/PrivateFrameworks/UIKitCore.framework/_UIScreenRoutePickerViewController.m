@interface _UIScreenRoutePickerViewController
- (BOOL)_requiresCustomPresentationController;
- (_UIScreenRoutePickerViewController)init;
- (_UIScreenRoutePickerViewController)initWithCoder:(id)a3;
- (id)_containedAlertController;
- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)remoteViewController;
- (int64_t)modalPresentationStyle;
- (void)_commonInitWithCompletion:(id)a3;
- (void)_setChildViewController:(id)a3;
- (void)dealloc;
- (void)disconnectRoute;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setCurrentOutputDeviceEnabled:(BOOL)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
@end

@implementation _UIScreenRoutePickerViewController

- (_UIScreenRoutePickerViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIScreenRoutePickerViewController;
  v2 = [(UIViewController *)&v5 initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2) {
    [(_UIScreenRoutePickerViewController *)v2 _commonInitWithCompletion:&__block_literal_global_288];
  }
  return v3;
}

- (void)dealloc
{
  v3 = self->_childViewController;
  v4 = [(_UIResilientRemoteViewContainerViewController *)v3 remoteViewController];
  objc_super v5 = [v4 serviceViewControllerProxy];
  [v5 _invalidate];

  dispatch_time_t v6 = dispatch_time(0, 15000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___UIScreenRoutePickerViewController_dealloc__block_invoke;
  block[3] = &unk_1E52D9F70;
  v10 = v3;
  v7 = v3;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);

  v8.receiver = self;
  v8.super_class = (Class)_UIScreenRoutePickerViewController;
  [(UIViewController *)&v8 dealloc];
}

- (void)_commonInitWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  remoteViewControllerSemaphore = self->_remoteViewControllerSemaphore;
  self->_remoteViewControllerSemaphore = v5;

  [(UIViewController *)self _beginDelayingPresentation:0 cancellationHandler:3.0];
  v7 = [(UIViewController *)self view];
  [v7 setUserInteractionEnabled:0];

  objc_super v8 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  objc_initWeak(&location, self);
  v9 = _UINSLocalizedStringWithDefaultValue(@"Cancel", @"Cancel");
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __64___UIScreenRoutePickerViewController__commonInitWithCompletion___block_invoke;
  v22[3] = &unk_1E52F2220;
  objc_copyWeak(&v23, &location);
  v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:v22];
  [(UIAlertController *)v8 addAction:v10];

  [(_UIScreenRoutePickerViewController *)self setModalPresentationStyle:[(UIViewController *)v8 modalPresentationStyle]];
  [(UIViewController *)self setModalTransitionStyle:[(UIViewController *)v8 modalTransitionStyle]];
  v11 = [(UIViewController *)v8 transitioningDelegate];
  [(UIViewController *)self setTransitioningDelegate:v11];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  alertController = self->_alertController;
  self->_alertController = v8;

  v13 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:@"com.apple.UIKit.screenpicker" error:0];
  objc_initWeak(&location, self);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __64___UIScreenRoutePickerViewController__commonInitWithCompletion___block_invoke_2;
  v19 = &unk_1E52F2270;
  objc_copyWeak(&v21, &location);
  id v14 = v4;
  id v20 = v14;
  v15 = +[_UIResilientRemoteViewContainerViewController instantiateWithExtension:v13 completion:&v16];
  -[_UIScreenRoutePickerViewController _setChildViewController:](self, "_setChildViewController:", v15, v16, v17, v18, v19);
  [v15 preferredContentSize];
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (_UIScreenRoutePickerViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIScreenRoutePickerViewController;
  return [(UIViewController *)&v4 initWithCoder:a3];
}

- (void)_setChildViewController:(id)a3
{
  id v10 = a3;
  objc_super v5 = [(UIViewController *)self->_childViewController view];
  [v5 removeFromSuperview];

  [(UIViewController *)self->_childViewController removeFromParentViewController];
  objc_storeStrong((id *)&self->_childViewController, a3);
  childViewController = self->_childViewController;
  if (childViewController)
  {
    v7 = self->_alertController;
    [(UIAlertController *)v7 setContentViewController:childViewController];
    [(UIViewController *)v7 willMoveToParentViewController:self];
    [(UIViewController *)self addChildViewController:v7];
    objc_super v8 = [(UIViewController *)self view];
    v9 = [(UIViewController *)v7 view];
    [v8 addSubview:v9];

    [(UIViewController *)v7 didMoveToParentViewController:self];
  }
}

- (id)remoteViewController
{
  return [(_UIResilientRemoteViewContainerViewController *)self->_childViewController remoteViewController];
}

- (void)disconnectRoute
{
  v3 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___UIScreenRoutePickerViewController_disconnectRoute__block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)setCurrentOutputDeviceEnabled:(BOOL)a3
{
  objc_super v5 = dispatch_get_global_queue(17, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68___UIScreenRoutePickerViewController_setCurrentOutputDeviceEnabled___block_invoke;
  v6[3] = &unk_1E52D9FC0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIScreenRoutePickerViewController;
  [(UIViewController *)&v4 preferredContentSizeDidChangeForChildContentContainer:a3];
  [(UIViewController *)self->_childViewController preferredContentSize];
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (BOOL)_requiresCustomPresentationController
{
  return 1;
}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  if (self->_alertController)
  {
    objc_super v5 = [(UIAlertController *)self->_alertController _presentationControllerForPresentedController:a3 presentingController:a4 sourceController:a5];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIScreenRoutePickerViewController;
    objc_super v5 = [(UIViewController *)&v7 _presentationControllerForPresentedController:a3 presentingController:a4 sourceController:a5];
  }
  return v5;
}

- (id)_containedAlertController
{
  return self->_alertController;
}

- (int64_t)modalPresentationStyle
{
  return [(UIViewController *)self->_alertController modalPresentationStyle];
}

- (void)setModalPresentationStyle:(int64_t)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewControllerSemaphore, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end