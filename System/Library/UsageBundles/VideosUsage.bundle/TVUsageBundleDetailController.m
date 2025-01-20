@interface TVUsageBundleDetailController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_storageReporter;
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
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateFileSize;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVUsageBundleDetailController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = [(TVUsageBundleDetailController *)self specifier];
  v7 = [v6 propertyForKey:PSUsageBundleAppKey];

  v8 = [v7 usageBundleStorageReporter];
  v9 = [v7 categories];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        [v8 sizeForCategory:v14];
        if (v15 > 0.00000011921) {
          [v5 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_5778;
  v21[3] = &unk_C5B8;
  id v16 = v8;
  id v22 = v16;
  v17 = [v5 sortedArrayUsingComparator:v21];
  sortedVideoCategories = self->_sortedVideoCategories;
  self->_sortedVideoCategories = v17;

  v20.receiver = self;
  v20.super_class = (Class)TVUsageBundleDetailController;
  [(TVUsageBundleDetailController *)&v20 viewWillAppear:v3];
  v19 = [(TVUsageBundleDetailController *)self table];
  [v19 reloadData];

  if ((+[UIApplication isRunningInStoreDemoMode] & 1) == 0) {
    [(TVUsageBundleDetailController *)self setEditingButtonHidden:0 animated:0];
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSUsageBundleDetailController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    *(void *)&self->PSUsageBundleDetailController_opaque[OBJC_IVAR___PSListController__specifiers] = &__NSArray0__struct;

    v4 = *(void **)&self->PSUsageBundleDetailController_opaque[v3];
  }

  return v4;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (qword_12090 != -1) {
    dispatch_once(&qword_12090, &stru_C5D8);
  }
  v6 = [(NSArray *)self->_sortedVideoCategories objectAtIndex:a4];
  v7 = objc_alloc_init(TVUsageEntityItem);
  v8 = [v6 name];
  v9 = [v8 uppercaseString];

  [(TVUsageEntityItem *)v7 setTitle:v9];
  id v10 = [(TVUsageBundleDetailController *)self _storageReporter];
  [v10 sizeForCategory:v6];
  unint64_t v12 = (unint64_t)v11;

  v13 = +[NSByteCountFormatter stringFromByteCount:v12 countStyle:2];
  [(TVUsageEntityItem *)v7 setFileSizeString:v13];
  objc_msgSend((id)qword_12088, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  double v15 = v14;

  return v15;
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
  v6 = [a3 dequeueReusableHeaderFooterViewWithIdentifier:@"VideosUsaugeHeaderIdentifier"];
  if (!v6) {
    v6 = [[TVUsageTableViewSectionHeaderView alloc] initWithReuseIdentifier:@"VideosUsaugeHeaderIdentifier"];
  }
  v7 = [(NSArray *)self->_sortedVideoCategories objectAtIndex:a4];
  v8 = [v7 name];
  v9 = [v8 uppercaseString];

  id v10 = [(TVUsageBundleDetailController *)self _storageReporter];
  [v10 sizeForCategory:v7];
  unint64_t v12 = (unint64_t)v11;

  v13 = +[NSByteCountFormatter stringFromByteCount:v12 countStyle:2];
  double v14 = objc_alloc_init(TVUsageEntityItem);
  [(TVUsageEntityItem *)v14 setTitle:v9];
  [(TVUsageEntityItem *)v14 setFileSizeString:v13];
  [(TVUsageTableViewSectionHeaderView *)v6 configureForUsageItem:v14];

  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = -[NSArray objectAtIndex:](self->_sortedVideoCategories, "objectAtIndex:", [v5 section]);
  v7 = [(TVUsageBundleDetailController *)self _storageReporter];
  v8 = [v6 identifier];
  v9 = +[NSIndexPath indexPathWithIndex:0];
  id v10 = [v7 dataSourceForCategory:v8 indexPath:v9];

  float v11 = v5;
  if (![v10 entityType])
  {

    float v11 = 0;
  }

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TVUsageBundleDetailController *)self _storageReporter];
  v9 = -[NSArray objectAtIndex:](self->_sortedVideoCategories, "objectAtIndex:", [v7 section]);
  v19[0] = 0;
  v19[1] = [v7 row];
  id v10 = +[NSIndexPath indexPathWithIndexes:v19 length:2];
  float v11 = [v9 identifier];
  unint64_t v12 = [v8 dataSourceForCategory:v11 indexPath:v10];

  if (v12)
  {
    v13 = [TVUsageTableViewController alloc];
    double v14 = [(TVUsageBundleDetailController *)self _storageReporter];
    double v15 = [(TVUsageTableViewController *)v13 initWithDataSource:v12 storageReporter:v14 indexPath:v10];

    id v16 = [v6 cellForRowAtIndexPath:v7];
    v17 = [v16 title];
    [(TVUsageTableViewController *)v15 setUsageTitle:v17];

    [(TVUsageTableViewController *)v15 setDelegate:self];
    v18 = [(TVUsageBundleDetailController *)self navigationController];
    [v18 pushViewController:v15 animated:1];
  }
}

- (int64_t)tableView:(id)a3 titleAlignmentForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sortedVideoCategories count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(TVUsageBundleDetailController *)self _storageReporter];
  id v7 = [(NSArray *)self->_sortedVideoCategories objectAtIndex:a4];
  v8 = [v7 identifier];
  v9 = +[NSIndexPath indexPathWithIndex:0];
  id v10 = [v6 dataSourceForCategory:v8 indexPath:v9];

  id v11 = [v10 count];
  return (int64_t)v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"videosusagecellidentifier"];
  if (!v7) {
    id v7 = [[TVUsageTableViewCell alloc] initWithStyle:1 reuseIdentifier:@"videosusagecellidentifier"];
  }
  v8 = [(TVUsageBundleDetailController *)self _storageReporter];
  v9 = -[NSArray objectAtIndex:](self->_sortedVideoCategories, "objectAtIndex:", [v6 section]);
  id v10 = [v9 identifier];
  id v11 = +[NSIndexPath indexPathWithIndex:0];
  unint64_t v12 = [v8 dataSourceForCategory:v10 indexPath:v11];

  id v13 = [v6 row];
  double v14 = [v12 entityAtIndex:v13];
  double v15 = [v12 usageItemForEntity:v14];
  [(TVUsageTableViewCell *)v7 configureForUsageItem:v15];
  -[TVUsageTableViewCell setAccessoryType:](v7, "setAccessoryType:", [v12 entityType] == (char *)&dword_0 + 1);
  if ([v12 entityType] == (char *)&dword_0 + 1) {
    uint64_t v16 = 3;
  }
  else {
    uint64_t v16 = 0;
  }
  [(TVUsageTableViewCell *)v7 setSelectionStyle:v16];

  return v7;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return +[UIApplication isRunningInStoreDemoMode] ^ 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v21 = a3;
  id v8 = a5;
  v9 = v8;
  if (a4 == 1)
  {
    id v10 = -[NSArray objectAtIndex:](self->_sortedVideoCategories, "objectAtIndex:", [v8 section]);
    id v11 = [(TVUsageBundleDetailController *)self _storageReporter];
    unint64_t v12 = [v10 identifier];
    id v13 = +[NSIndexPath indexPathWithIndex:0];
    double v14 = [v11 dataSourceForCategory:v12 indexPath:v13];

    objc_msgSend(v14, "deleteEntityAtIndex:", objc_msgSend(v9, "row"));
    [(TVUsageBundleDetailController *)self updateFileSize];
    if ([v14 count])
    {
      +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [v9 section]);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      [v21 reloadSections:v15 withRowAnimation:100];
    }
    else
    {
      id v15 = [(NSArray *)self->_sortedVideoCategories mutableCopy];
      objc_msgSend(v15, "removeObjectAtIndex:", objc_msgSend(v9, "section"));
      uint64_t v16 = +[NSArray arrayWithArray:v15];
      sortedVideoCategories = self->_sortedVideoCategories;
      self->_sortedVideoCategories = v16;

      v18 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [v9 section]);
      [v21 deleteSections:v18 withRowAnimation:100];

      if (![(NSArray *)self->_sortedVideoCategories count])
      {
        v19 = [(TVUsageBundleDetailController *)self navigationController];
        id v20 = [v19 popViewControllerAnimated:1];
      }
    }
  }
}

- (id)_storageReporter
{
  v2 = [(TVUsageBundleDetailController *)self specifier];
  uint64_t v3 = [v2 propertyForKey:PSUsageBundleAppKey];

  v4 = [v3 usageBundleStorageReporter];

  return v4;
}

- (id)viewControllerForRemoveItem
{
  uint64_t v3 = [(TVUsageBundleDetailController *)self _storageReporter];
  id v4 = [v3 totalSize];

  if (v4) {
    WeakRetained = self;
  }
  else {
    WeakRetained = (TVUsageBundleDetailController *)objc_loadWeakRetained((id *)&self->PSUsageBundleDetailController_opaque[OBJC_IVAR___PSViewController__parentController]);
  }

  return WeakRetained;
}

- (void)updateFileSize
{
  uint64_t v3 = [(TVUsageBundleDetailController *)self _storageReporter];
  id v4 = [v3 totalSize];

  id v9 = [(TVUsageBundleDetailController *)self specifier];
  id v5 = [v9 propertyForKey:PSUsageBundleAppKey];
  *(float *)&double v6 = (float)(unint64_t)v4;
  [v5 setTotalSize:v6];
  id v7 = +[NSNumber numberWithUnsignedLongLong:v4];
  [v9 setProperty:v7 forKey:@"TOTAL_SIZE"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->PSUsageBundleDetailController_opaque[OBJC_IVAR___PSViewController__parentController]);
  [WeakRetained reloadSpecifier:v9];
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

- (void).cxx_destruct
{
}

@end