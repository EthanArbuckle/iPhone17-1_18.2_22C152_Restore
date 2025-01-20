@interface _UIResilientRemoteViewContainerViewController
+ (id)instantiateWithExtension:(id)a3 completion:(id)a4;
- (BOOL)delayingDisplayOfRemoteView;
- (CGRect)_defaultInitialViewFrame;
- (NSCopying)extensionRequestIdentifier;
- (NSExtension)extension;
- (UIViewController)containedViewController;
- (UIViewController)errorViewController;
- (_UIResilientRemoteViewContainerViewController)initWithExtension:(id)a3 completion:(id)a4;
- (_UIWaitingForRemoteViewContainerViewController)waitingController;
- (id)remoteViewController;
- (void)_displayError:(id)a3;
- (void)_displayRemoteViewController;
- (void)dealloc;
- (void)delayDisplayOfRemoteController;
- (void)endDelayingDisplayOfRemoteController;
- (void)invalidate;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setContainedViewController:(id)a3;
- (void)setDelayingDisplayOfRemoteView:(BOOL)a3;
- (void)setErrorViewController:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionRequestIdentifier:(id)a3;
- (void)setWaitingController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation _UIResilientRemoteViewContainerViewController

- (CGRect)_defaultInitialViewFrame
{
  v2 = [(UIViewController *)self _screen];
  if (!__SplashBoardOverrideStatusBarOrientation) {
    [(id)UIApp _safeInterfaceOrientationForNoWindow];
  }
  objc_msgSend(v2, "_boundsForInterfaceOrientation:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

+ (id)instantiateWithExtension:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = (void *)[objc_alloc((Class)a1) initWithExtension:v7 completion:v6];

  return v8;
}

- (_UIResilientRemoteViewContainerViewController)initWithExtension:(id)a3 completion:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_UIResilientRemoteViewContainerViewController;
  double v8 = [(UIViewController *)&v21 initWithNibName:0 bundle:0];
  double v9 = v8;
  if (v8)
  {
    [(_UIResilientRemoteViewContainerViewController *)v8 setExtension:v6];
    double v10 = objc_alloc_init(_UIWaitingForRemoteViewContainerViewController);
    [(_UIResilientRemoteViewContainerViewController *)v9 setWaitingController:v10];

    double v11 = [(_UIResilientRemoteViewContainerViewController *)v9 waitingController];
    [(_UIResilientRemoteViewContainerViewController *)v9 setContainedViewController:v11];

    if (v6)
    {
      [(UIViewController *)v9 _beginDelayingPresentation:0 cancellationHandler:3.0];
      objc_initWeak(&location, v9);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __78___UIResilientRemoteViewContainerViewController_initWithExtension_completion___block_invoke;
      v17[3] = &unk_1E52E8680;
      objc_copyWeak(&v19, &location);
      id v18 = v7;
      [v6 instantiateViewControllerWithInputItems:MEMORY[0x1E4F1CBF0] connectionHandler:v17];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    else
    {
      double v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      double v13 = _UINSLocalizedStringWithDefaultValue(@"The requested app extension could not be found", @"The requested app extension could not be found");
      v23[0] = v13;
      double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      v15 = [v12 errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:v14];

      [(_UIResilientRemoteViewContainerViewController *)v9 _displayError:v15];
    }
  }

  return v9;
}

- (void)_displayRemoteViewController
{
  [(_UIResilientRemoteViewContainerViewController *)self setWaitingController:0];
  [(_UIResilientRemoteViewContainerViewController *)self setContainedViewController:self->_remoteViewController];
  [(UIViewController *)self->_remoteViewController preferredContentSize];
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)delayDisplayOfRemoteController
{
  self->_delayingDisplayOfRemoteView = 1;
}

- (void)endDelayingDisplayOfRemoteController
{
  if (self->_delayingDisplayOfRemoteView) {
    [(_UIResilientRemoteViewContainerViewController *)self _displayRemoteViewController];
  }
  self->_delayingDisplayOfRemoteView = 0;
}

- (void)setContainedViewController:(id)a3
{
  id v12 = a3;
  p_containedViewController = &self->_containedViewController;
  id v6 = self->_containedViewController;
  objc_storeStrong((id *)&self->_containedViewController, a3);
  [(UIViewController *)self->_containedViewController preferredContentSize];
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  [(UIViewController *)self addChildViewController:self->_containedViewController];
  unsigned int v7 = ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3) - 1;
  if (v7 <= 1)
  {
    [(UIViewController *)*p_containedViewController beginAppearanceTransition:1 animated:0];
    [(UIViewController *)v6 beginAppearanceTransition:0 animated:0];
  }
  [(UIViewController *)v6 willMoveToParentViewController:0];
  [(UIViewController *)v6 removeFromParentViewController];
  double v8 = [(UIViewController *)self view];
  double v9 = [(UIViewController *)*p_containedViewController view];
  [v8 addSubview:v9];

  double v10 = [(UIViewController *)v6 view];
  [v10 removeFromSuperview];

  double v11 = *p_containedViewController;
  if (v7 > 1)
  {
    [(UIViewController *)v11 didMoveToParentViewController:self];
  }
  else
  {
    [(UIViewController *)v11 endAppearanceTransition];
    [(UIViewController *)*p_containedViewController didMoveToParentViewController:self];
    [(UIViewController *)v6 endAppearanceTransition];
  }
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)_UIResilientRemoteViewContainerViewController;
  [(UIViewController *)&v13 viewWillLayoutSubviews];
  double v3 = [(UIViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(UIViewController *)self->_containedViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)dealloc
{
  [(_UIResilientRemoteViewContainerViewController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIResilientRemoteViewContainerViewController;
  [(UIViewController *)&v3 dealloc];
}

- (void)invalidate
{
  if (self->_extensionRequestIdentifier)
  {
    -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:");
    extensionRequestIdentifier = self->_extensionRequestIdentifier;
    self->_extensionRequestIdentifier = 0;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIResilientRemoteViewContainerViewController;
  [(UIViewController *)&v6 viewDidAppear:a3];
  double v4 = [(_UIResilientRemoteViewContainerViewController *)self errorViewController];

  if (v4)
  {
    double v5 = [(_UIResilientRemoteViewContainerViewController *)self errorViewController];
    [(UIViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (void)_displayError:(id)a3
{
  id v4 = a3;
  double v5 = _UINSLocalizedStringWithDefaultValue(@"Internal error", @"Internal error");
  objc_super v6 = [v4 localizedDescription];

  double v7 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  double v8 = _UINSLocalizedStringWithDefaultValue(@"Cancel", @"Cancel");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63___UIResilientRemoteViewContainerViewController__displayError___block_invoke;
  v11[3] = &unk_1E52DC290;
  v11[4] = self;
  double v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:v11];
  [v7 addAction:v9];

  double v10 = [(UIViewController *)self presentingViewController];

  if (v10) {
    [(UIViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  else {
    [(_UIResilientRemoteViewContainerViewController *)self setErrorViewController:v7];
  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIResilientRemoteViewContainerViewController;
  [(UIViewController *)&v4 preferredContentSizeDidChangeForChildContentContainer:a3];
  [(UIViewController *)self->_containedViewController preferredContentSize];
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (id)remoteViewController
{
  return self->_remoteViewController;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (NSCopying)extensionRequestIdentifier
{
  return self->_extensionRequestIdentifier;
}

- (void)setExtensionRequestIdentifier:(id)a3
{
}

- (UIViewController)containedViewController
{
  return self->_containedViewController;
}

- (_UIWaitingForRemoteViewContainerViewController)waitingController
{
  return self->_waitingController;
}

- (void)setWaitingController:(id)a3
{
}

- (UIViewController)errorViewController
{
  return self->_errorViewController;
}

- (void)setErrorViewController:(id)a3
{
}

- (BOOL)delayingDisplayOfRemoteView
{
  return self->_delayingDisplayOfRemoteView;
}

- (void)setDelayingDisplayOfRemoteView:(BOOL)a3
{
  self->_delayingDisplayOfRemoteView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorViewController, 0);
  objc_storeStrong((id *)&self->_waitingController, 0);
  objc_storeStrong((id *)&self->_containedViewController, 0);
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end