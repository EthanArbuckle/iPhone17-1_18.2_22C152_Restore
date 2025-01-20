@interface _UICurrentContextPresentationController
- ($0AC6E346AE4835514AAA8AC86D8F4844)__sizeClassPair;
- (BOOL)_mayChildGrabPresentedViewControllerView;
- (BOOL)_shouldRespectDefinesPresentationContext;
- (BOOL)shouldPresentInFullscreen;
- (BOOL)shouldRemovePresentersView;
- (CGRect)frameOfPresentedViewInContainerView;
- (id)_firstCurrentContextChildInWindow;
- (int64_t)presentationStyle;
- (void)transitionDidFinish:(BOOL)a3;
@end

@implementation _UICurrentContextPresentationController

- (int64_t)presentationStyle
{
  return 3;
}

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  return 1;
}

- (BOOL)shouldRemovePresentersView
{
  return 1;
}

- (BOOL)_mayChildGrabPresentedViewControllerView
{
  return 1;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v3 = [(UIPresentationController *)self presentingViewController];
  v4 = [v3 view];
  v5 = [v4 window];

  if (v5)
  {
    v6 = [(UIPresentationController *)self presentingViewController];
    v7 = [v6 view];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)_UICurrentContextPresentationController;
    [(UIPresentationController *)&v24 frameOfPresentedViewInContainerView];
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
    double v15 = v19;
  }
  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  double v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)__sizeClassPair
{
  v2 = [(UIPresentationController *)self traitCollection];
  uint64_t v3 = [v2 horizontalSizeClass];
  uint64_t v4 = [v2 verticalSizeClass];

  int64_t v5 = v3;
  int64_t v6 = v4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (id)_firstCurrentContextChildInWindow
{
  uint64_t v3 = [(UIPresentationController *)self presentedViewController];
  uint64_t v4 = [v3 _existingView];
  if (!v4) {
    goto LABEL_4;
  }
  int64_t v5 = (void *)v4;
  int64_t v6 = [v3 _existingView];
  v7 = [v6 window];

  if (v7)
  {
    id v8 = v3;
  }
  else
  {
LABEL_4:
    double v9 = [(UIPresentationController *)self _childPresentationController];
    id v8 = [v9 _firstCurrentContextChildInWindow];
  }
  return v8;
}

- (void)transitionDidFinish:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UICurrentContextPresentationController;
  [(UIPresentationController *)&v3 transitionDidFinish:a3];
}

@end