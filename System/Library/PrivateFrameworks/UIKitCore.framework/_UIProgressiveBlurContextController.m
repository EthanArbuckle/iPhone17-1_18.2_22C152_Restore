@interface _UIProgressiveBlurContextController
- (_UIProgressiveBlurContextController)initWithPresentedViewController:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (int64_t)blurStyle;
- (void)setBlurStyle:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation _UIProgressiveBlurContextController

- (_UIProgressiveBlurContextController)initWithPresentedViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIProgressiveBlurContextController;
  v6 = [(UIViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentedViewController, a3);
    v7->_blurStyle = 5003;
    [(UIViewController *)v7 setModalPresentationStyle:4];
    [(UIViewController *)v7 setTransitioningDelegate:v7];
  }

  return v7;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)_UIProgressiveBlurContextController;
  [(UIViewController *)&v17 viewDidLoad];
  if (!self->_presentedViewController)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"_UIProgressiveBlurContextController.m" lineNumber:38 description:@"A view controller to present is required"];
  }
  -[UIViewController addChildViewController:](self, "addChildViewController:");
  v4 = [(UIViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(UIViewController *)self->_presentedViewController view];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  v14 = [(UIViewController *)self view];
  v15 = [(UIViewController *)self->_presentedViewController view];
  [v14 addSubview:v15];

  [(UIViewController *)self->_presentedViewController didMoveToParentViewController:self];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v5 = [[_UIProgressiveBlurPresentationAnimator alloc] initForPresenting:1];
  return v5;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3 = [[_UIProgressiveBlurPresentationAnimator alloc] initForPresenting:0];
  return v3;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  double v9 = [[_UIProgressiveBlurPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v7];

  [(_UIProgressiveBlurPresentationController *)v9 setBlurStyle:[(_UIProgressiveBlurContextController *)self blurStyle]];
  return v9;
}

- (int64_t)blurStyle
{
  return self->_blurStyle;
}

- (void)setBlurStyle:(int64_t)a3
{
  self->_blurStyle = a3;
}

- (void).cxx_destruct
{
}

@end