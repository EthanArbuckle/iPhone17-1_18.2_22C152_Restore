@interface TVUsageTableViewController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (NSIndexPath)indexPath;
- (NSString)usageTitle;
- (TVUsageBundleStorageReporter)storageReporter;
- (TVUsageDataSource)usageDataSource;
- (TVUsageTableViewController)initWithDataSource:(id)a3 storageReporter:(id)a4 indexPath:(id)a5;
- (VideosUsageChangeDelegate)delegate;
- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (id)viewControllerForRemoveItem;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 titleAlignmentForHeaderInSection:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setIndexPath:(id)a3;
- (void)setStorageReporter:(id)a3;
- (void)setUsageDataSource:(id)a3;
- (void)setUsageTitle:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateFileSize;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVUsageTableViewController

- (TVUsageTableViewController)initWithDataSource:(id)a3 storageReporter:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TVUsageTableViewController;
  v11 = [(TVUsageTableViewController *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(TVUsageTableViewController *)v11 setUsageDataSource:v8];
    [(TVUsageTableViewController *)v12 setStorageReporter:v9];
    [(TVUsageTableViewController *)v12 setIndexPath:v10];
  }

  return v12;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    *(void *)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers] = &__NSArray0__struct;

    v4 = *(void **)&self->PSEditableListController_opaque[v3];
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TVUsageTableViewController;
  [(TVUsageTableViewController *)&v6 viewWillAppear:a3];
  v4 = [(TVUsageTableViewController *)self usageTitle];
  [(TVUsageTableViewController *)self setTitle:v4];

  v5 = [(TVUsageTableViewController *)self table];
  [v5 reloadData];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  v4 = [(TVUsageTableViewController *)self usageDataSource];
  v5 = [v4 headerItem];

  if (v5)
  {
    if (qword_120A0 != -1) {
      dispatch_once(&qword_120A0, &stru_C608);
    }
    [(id)qword_12098 configureForUsageItem:v5];
    objc_msgSend((id)qword_12098, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  double v6 = [(TVUsageTableViewController *)self usageDataSource];
  double v7 = [v6 headerItem];

  if (v7)
  {
    id v8 = [v5 dequeueReusableHeaderFooterViewWithIdentifier:@"VideosUsageTableViewSectionHeader"];
    if (!v8) {
      id v8 = [[TVUsageTableViewSectionHeaderView alloc] initWithReuseIdentifier:@"VideosUsageTableViewSectionHeader"];
    }
    [(TVUsageTableViewSectionHeaderView *)v8 configureForUsageItem:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(TVUsageTableViewController *)self usageDataSource];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 titleAlignmentForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"VideosUsageTableViewCell"];
  if (!v7) {
    double v7 = [[TVUsageTableViewCell alloc] initWithStyle:3 reuseIdentifier:@"VideosUsageTableViewCell"];
  }
  id v8 = [(TVUsageTableViewController *)self usageDataSource];
  id v9 = [v6 row];

  id v10 = [v8 entityAtIndex:v9];

  v11 = [(TVUsageTableViewController *)self usageDataSource];
  v12 = [v11 usageItemForEntity:v10];

  [(TVUsageTableViewCell *)v7 configureForUsageItem:v12];
  v13 = [(TVUsageTableViewController *)self usageDataSource];
  -[TVUsageTableViewCell setAccessoryType:](v7, "setAccessoryType:", [v13 entityType] == (char *)&dword_0 + 1);

  objc_super v14 = [(TVUsageTableViewController *)self usageDataSource];
  if ([v14 entityType] == (char *)&dword_0 + 1) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 0;
  }
  [(TVUsageTableViewCell *)v7 setSelectionStyle:v15];

  return v7;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(TVUsageTableViewController *)self usageDataSource];
  id v7 = [v6 entityType];

  id v8 = v5;
  if (!v7)
  {

    id v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  id v7 = [(TVUsageTableViewController *)self usageDataSource];
  id v8 = (char *)[v7 entityType];

  if (v8 == (unsigned char *)&dword_0 + 1)
  {
    id v9 = [(TVUsageTableViewController *)self indexPath];
    id v10 = objc_msgSend(v9, "indexPathByAddingIndex:", objc_msgSend(v6, "row"));

    v11 = [(TVUsageTableViewController *)self storageReporter];
    v12 = [(TVUsageTableViewController *)self usageDataSource];
    v13 = [v12 categoryIdentifier];
    objc_super v14 = [v11 dataSourceForCategory:v13 indexPath:v10];

    if (v14)
    {
      uint64_t v15 = [TVUsageTableViewController alloc];
      v16 = [(TVUsageTableViewController *)self storageReporter];
      v17 = [(TVUsageTableViewController *)v15 initWithDataSource:v14 storageReporter:v16 indexPath:v10];

      [(TVUsageTableViewController *)v17 setDelegate:self];
      v18 = [v21 cellForRowAtIndexPath:v6];
      v19 = [v18 title];
      [(TVUsageTableViewController *)v17 setUsageTitle:v19];

      v20 = [(TVUsageTableViewController *)self navigationController];
      [v20 pushViewController:v17 animated:1];
    }
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v7 = a5;
    id v8 = a3;
    id v9 = [(TVUsageTableViewController *)self usageDataSource];
    objc_msgSend(v9, "deleteEntityAtIndex:", objc_msgSend(v7, "row"));

    [(TVUsageTableViewController *)self updateFileSize];
    id v19 = v7;
    id v10 = +[NSArray arrayWithObjects:&v19 count:1];

    [v8 deleteRowsAtIndexPaths:v10 withRowAnimation:100];
    int64_t v11 = [(TVUsageTableViewController *)self tableView:v8 numberOfRowsInSection:0];

    if (!v11)
    {
      v12 = [(TVUsageTableViewController *)self delegate];
      v13 = [v12 viewControllerForRemoveItem];

      objc_super v14 = [(TVUsageTableViewController *)self navigationController];
      uint64_t v15 = [v14 viewControllers];
      unsigned int v16 = [v15 containsObject:v13];

      if (v16)
      {
        v17 = [(TVUsageTableViewController *)self navigationController];
        id v18 = [v17 popToViewController:v13 animated:1];
      }
    }
  }
}

- (id)viewControllerForRemoveItem
{
  uint64_t v3 = [(TVUsageTableViewController *)self usageDataSource];
  v4 = [v3 _prunedDataSource];
  [(TVUsageTableViewController *)self setUsageDataSource:v4];

  id v5 = [(TVUsageTableViewController *)self delegate];
  id v6 = [(TVUsageTableViewController *)self usageDataSource];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = self;
LABEL_5:
    id v9 = v8;
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v5 viewControllerForRemoveItem];
    goto LABEL_5;
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

- (void)updateFileSize
{
  id v2 = [(TVUsageTableViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 updateFileSize];
  }
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return 34.0;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v4 = a4;

  return v4;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v5 = a5;

  return v5;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return 0;
}

- (NSString)usageTitle
{
  return self->_usageTitle;
}

- (void)setUsageTitle:(id)a3
{
}

- (VideosUsageChangeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VideosUsageChangeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVUsageDataSource)usageDataSource
{
  return self->_usageDataSource;
}

- (void)setUsageDataSource:(id)a3
{
}

- (TVUsageBundleStorageReporter)storageReporter
{
  return self->_storageReporter;
}

- (void)setStorageReporter:(id)a3
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
  objc_storeStrong((id *)&self->_storageReporter, 0);
  objc_storeStrong((id *)&self->_usageDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_usageTitle, 0);
}

@end