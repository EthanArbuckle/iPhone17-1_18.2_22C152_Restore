@interface BCCardStackBarBackgroundContainingView
- (BCCardStackBarBackgroundContainingView)initWithStatusBarBackgroundController:(id)a3;
- (BCStatusBarBackgroundController)statusBarBackgroundController;
- (void)didAddSubview:(id)a3;
- (void)setStatusBarBackgroundController:(id)a3;
@end

@implementation BCCardStackBarBackgroundContainingView

- (BCCardStackBarBackgroundContainingView)initWithStatusBarBackgroundController:(id)a3
{
  id v4 = a3;
  v5 = [(BCCardStackBarBackgroundContainingView *)self init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_statusBarBackgroundController, v4);
  }

  return v6;
}

- (void)didAddSubview:(id)a3
{
  id v4 = [(BCCardStackBarBackgroundContainingView *)self statusBarBackgroundController];
  id v6 = [v4 effectiveBackgroundView];

  v5 = [v6 superview];

  if (v5 == self) {
    [(BCCardStackBarBackgroundContainingView *)self bringSubviewToFront:v6];
  }
}

- (BCStatusBarBackgroundController)statusBarBackgroundController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarBackgroundController);

  return (BCStatusBarBackgroundController *)WeakRetained;
}

- (void)setStatusBarBackgroundController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end