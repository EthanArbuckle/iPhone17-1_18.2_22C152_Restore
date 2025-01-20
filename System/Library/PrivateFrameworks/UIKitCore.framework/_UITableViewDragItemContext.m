@interface _UITableViewDragItemContext
- (NSIndexPath)indexPath;
- (UITableView)tableView;
- (_UITableViewDragItemContext)initWithIndexPath:(id)a3 forTableView:(id)a4;
- (void)setIndexPath:(id)a3;
- (void)setTableView:(id)a3;
@end

@implementation _UITableViewDragItemContext

- (_UITableViewDragItemContext)initWithIndexPath:(id)a3 forTableView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UITableViewDragItemContext;
  v9 = [(_UITableViewDragItemContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_tableView, v8);
    objc_storeStrong((id *)&v10->_indexPath, a3);
  }

  return v10;
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_destroyWeak((id *)&self->_tableView);
}

@end