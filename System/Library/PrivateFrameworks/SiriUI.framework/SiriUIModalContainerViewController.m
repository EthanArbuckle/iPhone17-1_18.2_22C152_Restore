@interface SiriUIModalContainerViewController
- (SiriUIModalContainerViewController)initWithContentViewController:(id)a3;
- (SiriUIModalContainerViewControllerDelegate)delegate;
- (UIViewController)contentViewController;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SiriUIModalContainerViewController

- (SiriUIModalContainerViewController)initWithContentViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriUIModalContainerViewController;
  v6 = [(SiriUIModalContainerViewController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentViewController, a3);
    [(SiriUIModalContainerViewController *)v7 setModalPresentationStyle:4];
  }

  return v7;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)SiriUIModalContainerViewController;
  [(SiriUIModalContainerViewController *)&v5 loadView];
  [(SiriUIModalContainerViewController *)self addChildViewController:self->_contentViewController];
  v3 = [(SiriUIModalContainerViewController *)self view];
  v4 = [(UIViewController *)self->_contentViewController view];
  [v3 addSubview:v4];

  [(UIViewController *)self->_contentViewController didMoveToParentViewController:self];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SiriUIModalContainerViewController;
  [(SiriUIModalContainerViewController *)&v5 viewDidLayoutSubviews];
  v3 = [(UIViewController *)self->_contentViewController view];
  v4 = [(SiriUIModalContainerViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SiriUIModalContainerViewController;
  [(SiriUIModalContainerViewController *)&v7 viewWillDisappear:a3];
  v4 = [(SiriUIModalContainerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(SiriUIModalContainerViewController *)self delegate];
    [v6 modalContainerViewControllerViewWillDisappear:self];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SiriUIModalContainerViewController;
  [(SiriUIModalContainerViewController *)&v7 viewDidDisappear:a3];
  v4 = [(SiriUIModalContainerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(SiriUIModalContainerViewController *)self delegate];
    [v6 modalContainerViewControllerViewDidDisappear:self];
  }
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_contentViewController;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_contentViewController;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_contentViewController;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (SiriUIModalContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUIModalContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end