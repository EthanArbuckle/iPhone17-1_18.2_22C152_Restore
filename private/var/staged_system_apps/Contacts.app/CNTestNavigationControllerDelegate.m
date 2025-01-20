@interface CNTestNavigationControllerDelegate
+ (CNTestNavigationControllerDelegate)delegateWithDelegate:(id)a3 willShowViewControllerHandler:(id)a4 didShowViewControllerHandler:(id)a5;
- (BOOL)_selfReallyRespondsToSelector:(SEL)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (UINavigationControllerDelegate)delegate;
- (id)didShow;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)willShow;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setDidShow:(id)a3;
- (void)setWillShow:(id)a3;
@end

@implementation CNTestNavigationControllerDelegate

+ (CNTestNavigationControllerDelegate)delegateWithDelegate:(id)a3 willShowViewControllerHandler:(id)a4 didShowViewControllerHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  [v11 setDelegate:v10];

  [v11 setWillShow:v9];
  [v11 setDidShow:v8];

  return (CNTestNavigationControllerDelegate *)v11;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v8 = a4;
  v6 = [(CNTestNavigationControllerDelegate *)self willShow];

  if (v6)
  {
    v7 = [(CNTestNavigationControllerDelegate *)self willShow];
    ((void (**)(void, id))v7)[2](v7, v8);
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v8 = a4;
  v6 = [(CNTestNavigationControllerDelegate *)self didShow];

  if (v6)
  {
    v7 = [(CNTestNavigationControllerDelegate *)self didShow];
    ((void (**)(void, id))v7)[2](v7, v8);
  }
}

- (BOOL)_selfReallyRespondsToSelector:(SEL)a3
{
  if (sel_isEqual(a3, "navigationController:willShowViewController:animated:")) {
    return 1;
  }

  return sel_isEqual(a3, "navigationController:didShowViewController:animated:");
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (-[CNTestNavigationControllerDelegate _selfReallyRespondsToSelector:](self, "_selfReallyRespondsToSelector:"))
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(CNTestNavigationControllerDelegate *)self delegate];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (-[CNTestNavigationControllerDelegate _selfReallyRespondsToSelector:](self, "_selfReallyRespondsToSelector:")
    || ([(CNTestNavigationControllerDelegate *)self delegate],
        char v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) == 0))
  {
    v6 = 0;
  }
  else
  {
    v6 = [(CNTestNavigationControllerDelegate *)self delegate];
  }

  return v6;
}

- (UINavigationControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (id)willShow
{
  return self->_willShow;
}

- (void)setWillShow:(id)a3
{
}

- (id)didShow
{
  return self->_didShow;
}

- (void)setDidShow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didShow, 0);
  objc_storeStrong(&self->_willShow, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end