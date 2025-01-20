@interface _InfiniteScrollViewController
- (_InfiniteScrollViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewSafeAreaInsetsDidChange;
@end

@implementation _InfiniteScrollViewController

- (void)viewDidLayoutSubviews
{
  id v2 = [(_InfiniteScrollViewController *)self delegate];
  [v2 scrollViewDidLayoutSubviews];
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)_InfiniteScrollViewController;
  [(_InfiniteScrollViewController *)&v4 viewSafeAreaInsetsDidChange];
  v3 = [(_InfiniteScrollViewController *)self delegate];
  [v3 scrollViewSafeAreasDidChange];
}

- (_InfiniteScrollViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_InfiniteScrollViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end