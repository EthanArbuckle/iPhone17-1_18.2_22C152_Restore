@interface _UISearchControllerDidScrollDelegate
- (UIScrollView)scrollView;
- (_UIScrollViewScrollObserver_Internal)controller;
- (void)_didScroll;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)setController:(id)a3;
- (void)setScrollView:(id)a3;
@end

@implementation _UISearchControllerDidScrollDelegate

- (void)_didScroll
{
  v3 = [(_UISearchControllerDidScrollDelegate *)self controller];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_UISearchControllerDidScrollDelegate *)self controller];
    [v5 _didScroll];
  }
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v7 = a3;
  char v4 = [(_UISearchControllerDidScrollDelegate *)self controller];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(_UISearchControllerDidScrollDelegate *)self controller];
    [v6 _observeScrollViewDidScroll:v7];
  }
}

- (_UIScrollViewScrollObserver_Internal)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (_UIScrollViewScrollObserver_Internal *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_controller);
}

@end