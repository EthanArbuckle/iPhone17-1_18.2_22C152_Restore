@interface SearchResultQuickActionMenuPresenter
- (BOOL)shouldBeginOrbGestureAtLocation:(CGPoint)a3 inView:(id)a4;
- (NSIndexPath)indexPath;
- (SearchResultQuickActionMenuPresenter)initWithTableView:(id)a3;
- (SearchResultQuickActionMenuPresenter)initWithView:(id)a3;
- (UITableViewCell)tableViewCell;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)targetPreviewBackgroundWithColor:(id)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)setIndexPath:(id)a3;
- (void)setTableViewCell:(id)a3;
@end

@implementation SearchResultQuickActionMenuPresenter

- (SearchResultQuickActionMenuPresenter)initWithTableView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchResultQuickActionMenuPresenter;
  v6 = [(QuickActionMenuPresenter *)&v9 initWithView:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tableView, a3);
  }

  return v7;
}

- (SearchResultQuickActionMenuPresenter)initWithView:(id)a3
{
  return [(SearchResultQuickActionMenuPresenter *)self initWithTableView:0];
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  if (sub_1000BBB44(self->_tableView) == 5)
  {
    id v6 = 0;
  }
  else
  {
    v7 = self->_tableView;
    [(QuickActionMenuPresenter *)self location];
    v8 = -[UITableView indexPathForRowAtPoint:](v7, "indexPathForRowAtPoint:");
    if (!v8) {
      goto LABEL_9;
    }
    objc_super v9 = [(UITableView *)v7 cellForRowAtIndexPath:v8];
    v10 = [v9 traitCollection];
    id v11 = [v10 userInterfaceStyle];

    if (v11 == (id)2) {
      +[UIColor tertiarySystemGroupedBackgroundColor];
    }
    else {
    v12 = +[UIColor systemBackgroundColor];
    }
    v13 = [v9 contentView];
    [v13 setBackgroundColor:v12];

    if (v9)
    {
      id v6 = [objc_alloc((Class)UITargetedPreview) initWithView:v9];
    }
    else
    {
LABEL_9:
      id v6 = 0;
    }
  }

  return v6;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  if (sub_1000BBB44(self->_tableView) == 5)
  {
    id v6 = 0;
  }
  else
  {
    v7 = +[UIColor clearColor];
    id v6 = [(SearchResultQuickActionMenuPresenter *)self targetPreviewBackgroundWithColor:v7];
  }

  return v6;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (sub_1000BBB44(self->_tableView) != 5)
  {
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100B62954;
    v11[3] = &unk_1012E6708;
    objc_copyWeak(&v12, &location);
    [v10 addCompletion:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (id)targetPreviewBackgroundWithColor:(id)a3
{
  id v4 = a3;
  id v5 = self->_tableView;
  [(QuickActionMenuPresenter *)self location];
  id v6 = -[UITableView indexPathForRowAtPoint:](v5, "indexPathForRowAtPoint:");
  if (v6
    && ([(UITableView *)v5 cellForRowAtIndexPath:v6],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 contentView],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 setBackgroundColor:v4],
        v8,
        v7))
  {
    id v9 = [objc_alloc((Class)UITargetedPreview) initWithView:v7];
    id v10 = [v9 parameters];
    [v10 setBackgroundColor:v4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)shouldBeginOrbGestureAtLocation:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(SearchResultQuickActionMenuPresenter *)self setTableViewCell:0];
  [(SearchResultQuickActionMenuPresenter *)self setIndexPath:0];
  labelMarker = self->super._labelMarker;
  self->super._labelMarker = 0;

  searchResult = self->super._searchResult;
  self->super._searchResult = 0;

  resolvedMapItem = self->super._resolvedMapItem;
  self->super._resolvedMapItem = 0;

  if ([v7 isDescendantOfView:self->_tableView])
  {
    -[UITableView convertPoint:fromView:](self->_tableView, "convertPoint:fromView:", v7, x, y);
    id v11 = -[UITableView indexPathForRowAtPoint:](self->_tableView, "indexPathForRowAtPoint:");
    if (v11)
    {
      id v12 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v11];
      v13 = v12;
      if (v12 && ([v12 isEditing] & 1) == 0)
      {
        [(SearchResultQuickActionMenuPresenter *)self setTableViewCell:v13];
        [(SearchResultQuickActionMenuPresenter *)self setIndexPath:v11];
        if ([v13 conformsToProtocol:&OBJC_PROTOCOL___SearchResultQuickActionMenuCell])
        {
          v15 = [v13 personalizedItemForQuickActionMenu];
          v16 = [(QuickActionMenuPresenter *)self delegate];
          -[QuickActionMenuPresenter setUiTarget:](self, "setUiTarget:", [v16 uiTargetForQuickActionMenu]);

          if (v15)
          {
            [(QuickActionMenuPresenter *)self setPlace:v15];
            objc_opt_class();
            BOOL v14 = 1;
            if (objc_opt_isKindOfClass()) {
              [v13 set_mapkit_forceSeparatorFrameToCGRectZero:1];
            }
          }
          else
          {
            BOOL v14 = 0;
          }
        }
        else
        {
          BOOL v14 = 0;
          v15 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (UITableViewCell)tableViewCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableViewCell);

  return (UITableViewCell *)WeakRetained;
}

- (void)setTableViewCell:(id)a3
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
  objc_destroyWeak((id *)&self->_tableViewCell);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end