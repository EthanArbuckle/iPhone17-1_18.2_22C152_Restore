@interface _UIMoreListTableView
- (UIMoreListController)_listController;
- (void)didMoveToWindow;
- (void)set_listController:(id)a3;
@end

@implementation _UIMoreListTableView

- (void)set_listController:(id)a3
{
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)_UIMoreListTableView;
  [(UITableView *)&v5 didMoveToWindow];
  v3 = [(UIView *)self window];

  if (v3)
  {
    v4 = [(_UIMoreListTableView *)self _listController];
    [v4 _layoutCells];
  }
}

- (UIMoreListController)_listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__listController);
  return (UIMoreListController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end