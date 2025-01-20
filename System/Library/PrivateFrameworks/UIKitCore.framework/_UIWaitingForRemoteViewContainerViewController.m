@interface _UIWaitingForRemoteViewContainerViewController
- (BOOL)_canShowWhileLocked;
- (UIActivityIndicatorView)loadingSpinner;
- (_UIWaitingForRemoteViewContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setLoadingSpinner:(id)a3;
- (void)stopSpinner;
- (void)viewWillLayoutSubviews;
@end

@implementation _UIWaitingForRemoteViewContainerViewController

- (_UIWaitingForRemoteViewContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_UIWaitingForRemoteViewContainerViewController;
  v4 = [(UIViewController *)&v12 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:100];
    [(_UIWaitingForRemoteViewContainerViewController *)v4 setLoadingSpinner:v5];

    v6 = +[UIColor systemBackgroundColor];
    v7 = [(UIViewController *)v4 view];
    [v7 setBackgroundColor:v6];

    v8 = [(UIViewController *)v4 view];
    v9 = [(_UIWaitingForRemoteViewContainerViewController *)v4 loadingSpinner];
    [v8 addSubview:v9];

    v10 = [(_UIWaitingForRemoteViewContainerViewController *)v4 loadingSpinner];
    [v10 startAnimating];

    -[UIViewController setPreferredContentSize:](v4, "setPreferredContentSize:", 0.0, 50.0);
  }
  return v4;
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)_UIWaitingForRemoteViewContainerViewController;
  [(UIViewController *)&v8 viewWillLayoutSubviews];
  v3 = [(UIViewController *)self view];
  [v3 bounds];
  double v5 = v4 * 0.5;
  v6 = [(UIViewController *)self view];
  [v6 bounds];
  -[UIView setCenter:](self->_loadingSpinner, "setCenter:", v5, v7 * 0.5);
}

- (void)stopSpinner
{
  id v2 = [(_UIWaitingForRemoteViewContainerViewController *)self loadingSpinner];
  [v2 stopAnimating];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIActivityIndicatorView)loadingSpinner
{
  return self->_loadingSpinner;
}

- (void)setLoadingSpinner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end