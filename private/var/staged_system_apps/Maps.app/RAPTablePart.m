@interface RAPTablePart
+ (BOOL)isHoldingChangesAffectingTableView:(id)a3;
+ (void)holdChangesAffectingTableView:(id)a3 withinBlock:(id)a4;
- (NSArray)sections;
- (RAPPresentingViewController)presentingViewController;
- (RAPTablePart)init;
- (RAPTablePart)initWithSections:(id)a3;
- (RAPTablePartsDataSource)dataSource;
- (UITableView)tableView;
- (id)_dataSource;
- (void)_setTableView:(id)a3;
- (void)dealloc;
- (void)didChange;
- (void)holdChangesAffectingTableViewWithinBlock:(id)a3;
- (void)presentingViewControllerViewDidLayoutSubviews;
- (void)setPresentingViewController:(id)a3;
- (void)setSections:(id)a3;
- (void)setTableView:(id)a3;
@end

@implementation RAPTablePart

- (RAPTablePart)init
{
  return [(RAPTablePart *)self initWithSections:&__NSArray0__struct];
}

- (id)_dataSource
{
  v2 = [(RAPTablePart *)self tableView];
  v3 = [v2 dataSource];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (RAPTablePart)initWithSections:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RAPTablePart;
  id v5 = [(RAPTablePart *)&v8 init];
  if (v5)
  {
    id v6 = [v4 copy];
    [(RAPTablePart *)v5 setSections:v6];
  }
  return v5;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_sections;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) _setPartController:0];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)RAPTablePart;
  [(RAPTablePart *)&v8 dealloc];
}

+ (void)holdChangesAffectingTableView:(id)a3 withinBlock:(id)a4
{
  id v12 = a3;
  id v5 = (void (**)(void))a4;
  id v6 = v12;
  v7 = v5;
  if (v12)
  {
    objc_super v8 = (void *)qword_10160EE58;
    if (!qword_10160EE58)
    {
      id v9 = objc_alloc_init((Class)NSCountedSet);
      long long v10 = (void *)qword_10160EE58;
      qword_10160EE58 = (uint64_t)v9;

      id v6 = v12;
      objc_super v8 = (void *)qword_10160EE58;
    }
    [v8 addObject:v6];
    v7[2](v7);
    [(id)qword_10160EE58 removeObject:v12];
    if (![(id)qword_10160EE58 count])
    {
      long long v11 = (void *)qword_10160EE58;
      qword_10160EE58 = 0;
    }
    if (([(id)qword_10160EE58 containsObject:v12] & 1) == 0) {
      [v12 reloadData];
    }
  }
  else
  {
    v5[2](v5);
  }
}

+ (BOOL)isHoldingChangesAffectingTableView:(id)a3
{
  return [(id)qword_10160EE58 containsObject:a3];
}

- (void)holdChangesAffectingTableViewWithinBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(RAPTablePart *)self tableView];
  [v5 holdChangesAffectingTableView:v6 withinBlock:v4];
}

- (void)setSections:(id)a3
{
  id v4 = (NSArray *)a3;
  sections = self->_sections;
  if (sections != v4)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = sections;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * i) _setPartController:0];
        }
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }

    long long v11 = (NSArray *)[(NSArray *)v4 copy];
    id v12 = self->_sections;
    self->_sections = v11;

    v13 = [(RAPTablePart *)self tableView];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = self->_sections;
    id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
          [v19 _setPartController:self];
          if (v13) {
            [v19 _registerReuseIdentifiersIfNeeded];
          }
        }
        id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v16);
    }

    [(RAPTablePart *)self didChange];
  }
}

- (void)_setTableView:(id)a3
{
  id v5 = (UITableView *)a3;
  if (self->_tableView != v5)
  {
    objc_storeStrong((id *)&self->_tableView, a3);
    if (self->_tableView)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = self->_sections;
      id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            [*(id *)(*((void *)&v11 + 1) + 8 * i) _registerReuseIdentifiersIfNeeded];
          }
          id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (RAPTablePartsDataSource)dataSource
{
  v2 = [(RAPTablePart *)self tableView];
  v3 = [v2 dataSource];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (RAPTablePartsDataSource *)v4;
}

- (void)presentingViewControllerViewDidLayoutSubviews
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_sections;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) presentingViewControllerViewDidLayoutSubviews:(void)v7];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)didChange
{
  id v3 = [(RAPTablePart *)self _dataSource];
  [v3 tablePartDidChange:self];
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (RAPPresentingViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (RAPPresentingViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end