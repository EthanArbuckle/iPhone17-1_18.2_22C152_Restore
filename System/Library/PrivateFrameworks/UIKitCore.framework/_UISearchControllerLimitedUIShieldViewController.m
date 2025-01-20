@interface _UISearchControllerLimitedUIShieldViewController
- (_UISearchControllerLimitedAccessView)limitedAccessView;
- (id)dismissAction;
- (void)_backButtonPressed:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setDismissAction:(id)a3;
- (void)setLimitedAccessView:(id)a3;
@end

@implementation _UISearchControllerLimitedUIShieldViewController

- (void)dealloc
{
  id dismissAction = self->_dismissAction;
  self->_id dismissAction = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UISearchControllerLimitedUIShieldViewController;
  [(UIViewController *)&v4 dealloc];
}

- (void)loadView
{
  v3 = [_UISearchControllerLimitedAccessView alloc];
  objc_super v4 = -[_UISearchControllerLimitedAccessView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(_UISearchControllerLimitedUIShieldViewController *)self setLimitedAccessView:v4];

  v5 = [(_UISearchControllerLimitedUIShieldViewController *)self limitedAccessView];
  v6 = [v5 backButton];
  [v6 addTarget:self action:sel__backButtonPressed_ forControlEvents:0x2000];

  id v7 = [(_UISearchControllerLimitedUIShieldViewController *)self limitedAccessView];
  [(UIViewController *)self setView:v7];
}

- (void)_backButtonPressed:(id)a3
{
  objc_super v4 = [(_UISearchControllerLimitedUIShieldViewController *)self dismissAction];

  if (v4)
  {
    v5 = [(_UISearchControllerLimitedUIShieldViewController *)self dismissAction];
    v5[2]();
  }
}

- (id)dismissAction
{
  return self->_dismissAction;
}

- (void)setDismissAction:(id)a3
{
}

- (_UISearchControllerLimitedAccessView)limitedAccessView
{
  return self->_limitedAccessView;
}

- (void)setLimitedAccessView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitedAccessView, 0);
  objc_storeStrong(&self->_dismissAction, 0);
}

@end