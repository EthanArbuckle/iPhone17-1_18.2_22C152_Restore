@interface VideosExtrasPresenter
- (CGRect)extrasMenuBarFrame;
- (VideosExtrasContext)extrasContext;
- (VideosExtrasPresenter)initWithExtrasContext:(id)a3 extrasMenuBarFrame:(CGRect)a4;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)dismissExtrasAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentExtrasWith:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setExtrasContext:(id)a3;
- (void)setExtrasMenuBarFrame:(CGRect)a3;
@end

@implementation VideosExtrasPresenter

- (VideosExtrasPresenter)initWithExtrasContext:(id)a3 extrasMenuBarFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VideosExtrasPresenter;
  v11 = [(VideosExtrasPresenter *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_extrasContext, a3);
    v12->_extrasMenuBarFrame.origin.CGFloat x = x;
    v12->_extrasMenuBarFrame.origin.CGFloat y = y;
    v12->_extrasMenuBarFrame.size.CGFloat width = width;
    v12->_extrasMenuBarFrame.size.CGFloat height = height;
    v13 = [v10 extrasRootViewController];
    [v13 setModalPresentationStyle:4];

    v14 = [v10 extrasRootViewController];
    [v14 setTransitioningDelegate:v12];
  }
  return v12;
}

- (void)presentExtrasWith:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  v8 = (void (**)(void))a5;
  if (v15)
  {
    v9 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if (!v10)
    {
      v11 = [(VideosExtrasPresenter *)self extrasContext];
      v12 = [v11 extrasRootViewController];
      [v12 _setIgnoreAppSupportedOrientations:1];
    }
    v13 = [(VideosExtrasPresenter *)self extrasContext];
    v14 = [v13 extrasRootViewController];
    [v15 presentViewController:v14 animated:v6 completion:v8];
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

- (void)dismissExtrasAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v12 = (void (**)(void))a4;
  BOOL v6 = [(VideosExtrasPresenter *)self extrasContext];
  v7 = [v6 extrasRootViewController];
  v8 = [v7 presentingViewController];

  if (v8)
  {
    v9 = [(VideosExtrasPresenter *)self extrasContext];
    uint64_t v10 = [v9 extrasRootViewController];
    v11 = [v10 presentingViewController];
    [v11 dismissViewControllerAnimated:v4 completion:v12];
  }
  else if (v12)
  {
    v12[2]();
  }
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  v5 = [[VideosTransitionFadeAnimator alloc] initWithTransitionType:0 andDuration:0.3];
  return v5;
}

- (id)animationControllerForDismissedController:(id)a3
{
  v3 = [[VideosTransitionFadeAnimator alloc] initWithTransitionType:1 andDuration:0.3];
  return v3;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [VideosExtrasPresentationController alloc];
  uint64_t v10 = [(VideosExtrasPresenter *)self extrasContext];
  v11 = [v10 extrasRootViewController];
  v12 = [v11 extrasMenuBarView];
  [(VideosExtrasPresenter *)self extrasMenuBarFrame];
  v13 = -[VideosExtrasPresentationController initWithPresentedViewController:presentingViewController:extrasMenuBarView:extrasmenuBarFrame:](v9, "initWithPresentedViewController:presentingViewController:extrasMenuBarView:extrasmenuBarFrame:", v8, v7, v12);

  return v13;
}

- (VideosExtrasContext)extrasContext
{
  return self->_extrasContext;
}

- (void)setExtrasContext:(id)a3
{
}

- (CGRect)extrasMenuBarFrame
{
  double x = self->_extrasMenuBarFrame.origin.x;
  double y = self->_extrasMenuBarFrame.origin.y;
  double width = self->_extrasMenuBarFrame.size.width;
  double height = self->_extrasMenuBarFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setExtrasMenuBarFrame:(CGRect)a3
{
  self->_extrasMenuBarFrame = a3;
}

- (void).cxx_destruct
{
}

@end