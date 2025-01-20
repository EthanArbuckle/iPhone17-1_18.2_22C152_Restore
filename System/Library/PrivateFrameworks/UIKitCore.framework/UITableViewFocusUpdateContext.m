@interface UITableViewFocusUpdateContext
+ (id)_contextWithContext:(id)a3 tableView:(id)a4;
- (NSIndexPath)nextFocusedIndexPath;
- (NSIndexPath)previouslyFocusedIndexPath;
- (UITableView)tableView;
- (id)_initWithContext:(id)a3 tableView:(id)a4;
@end

@implementation UITableViewFocusUpdateContext

+ (id)_contextWithContext:(id)a3 tableView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithContext:v7 tableView:v6];

  return v8;
}

- (id)_initWithContext:(id)a3 tableView:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UITableViewFocusUpdateContext;
  id v7 = [(UIFocusUpdateContext *)&v10 _initWithContext:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak(v7 + 23, v6);
  }

  return v8;
}

- (NSIndexPath)previouslyFocusedIndexPath
{
  if (!self->_didSetPreviouslyFocusedIndexPath)
  {
    v3 = [(UIFocusUpdateContext *)self previouslyFocusedView];

    if (v3)
    {
      int v12 = 0;
      v4 = [(UITableViewFocusUpdateContext *)self tableView];
      v5 = [(UIFocusUpdateContext *)self previouslyFocusedView];
      id v11 = 0;
      id v6 = [v4 _managedSubviewForView:v5 viewType:&v12 indexPath:&v11];
      id v7 = v11;
      id v8 = v11;

      if (v6 && v12 == 1) {
        objc_storeStrong((id *)&self->_previouslyFocusedIndexPath, v7);
      }
    }
    self->_didSetPreviouslyFocusedIndexPath = 1;
  }
  previouslyFocusedIndexPath = self->_previouslyFocusedIndexPath;
  return previouslyFocusedIndexPath;
}

- (NSIndexPath)nextFocusedIndexPath
{
  if (!self->_didSetNextFocusedIndexPath)
  {
    v3 = [(UIFocusUpdateContext *)self nextFocusedView];

    if (v3)
    {
      int v12 = 0;
      v4 = [(UITableViewFocusUpdateContext *)self tableView];
      v5 = [(UIFocusUpdateContext *)self nextFocusedView];
      id v11 = 0;
      id v6 = [v4 _managedSubviewForView:v5 viewType:&v12 indexPath:&v11];
      id v7 = v11;
      id v8 = v11;

      if (v6 && v12 == 1) {
        objc_storeStrong((id *)&self->_nextFocusedIndexPath, v7);
      }
    }
    self->_didSetNextFocusedIndexPath = 1;
  }
  nextFocusedIndexPath = self->_nextFocusedIndexPath;
  return nextFocusedIndexPath;
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_nextFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_previouslyFocusedIndexPath, 0);
}

@end