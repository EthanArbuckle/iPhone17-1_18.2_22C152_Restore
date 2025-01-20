@interface CollectionListDataSource
- (BOOL)editing;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CollectionListDataSource)initWithTableView:(id)a3 editSession:(id)a4 showsAddCollection:(BOOL)a5;
- (NSArray)selected;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_cellForCollection:(id)a3 inTableView:(id)a4 atIndexPath:(id)a5;
- (id)currentContent;
- (id)deleteContextualActionAtIndexPath:(id)a3;
- (id)deleteMenuActionAtIndexPath:(id)a3;
- (id)keyCommands;
- (id)objectAtIndexPath:(id)a3;
- (id)objectsForAnalytics;
- (id)shareContextualActionAtIndexPath:(id)a3;
- (id)shareMenuActionAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int)targetForDragAnalytics;
- (int64_t)indexForObject:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)cellsSize;
- (unint64_t)entriesCount;
- (void)_captureCuratedCuratedCollectionAction:(int)a3 indexPath:(id)a4;
- (void)_deleteAtIndexPath:(id)a3 completion:(id)a4;
- (void)_loadData;
- (void)_shareAtIndexPath:(id)a3;
- (void)_updateKeyCommandsAtIndexPath:(id)a3;
- (void)collectionManager:(id)a3 contentDidChange:(id)a4;
- (void)deleteRow:(id)a3;
- (void)setCellsSize:(unint64_t)a3;
- (void)setEditing:(BOOL)a3;
- (void)shareRow:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
@end

@implementation CollectionListDataSource

- (CollectionListDataSource)initWithTableView:(id)a3 editSession:(id)a4 showsAddCollection:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CollectionListDataSource;
  v10 = [(DataSource *)&v15 initWithTableView:v8 updateLocation:0];
  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    v12 = +[CollectionTableViewCell identifier];
    [v8 registerClass:v11 forCellReuseIdentifier:v12];

    v13 = +[CollectionManager sharedManager];
    [v13 addObserver:v10];

    v10->_showsAddCollection = a5;
    objc_storeStrong((id *)&v10->_editSession, a4);
    [(CollectionListDataSource *)v10 _loadData];
  }

  return v10;
}

- (void)_loadData
{
  unsigned int v3 = +[LibraryUIUtilities isMyPlacesEnabled];
  BOOL showsAddCollection = self->_showsAddCollection;
  v5 = +[CollectionManager sharedManager];
  id v9 = v5;
  if (v3)
  {
    if (!showsAddCollection)
    {
      v6 = [v5 currentCollectionsForLibrary];
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (showsAddCollection)
  {
LABEL_5:
    v6 = [v5 currentCollectionsForPicker];
    goto LABEL_7;
  }
  v6 = [v5 currentCollections];
LABEL_7:
  v7 = v6;
  content = self->_content;
  self->_content = v7;
}

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
  [(CollectionListDataSource *)self _loadData];
  id v5 = [(DataSource *)self delegate];
  [v5 dataSourceUpdated:self];
}

- (id)currentContent
{
  id v2 = [(NSArray *)self->_content copy];

  return v2;
}

- (int64_t)indexForObject:(id)a3
{
  id v4 = a3;
  id v5 = [(CollectionListDataSource *)self currentContent];
  if ([v5 containsObject:v4]) {
    int64_t v6 = (int64_t)[v5 indexOfObject:v4];
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CollectionListDataSource *)self currentContent];
  id v6 = [v5 copy];

  id v7 = [v4 row];
  if (v7 >= [v6 count])
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v6 objectAtIndexedSubscript:[v4 row]];
  }

  return v8;
}

- (unint64_t)entriesCount
{
  id v2 = [(CollectionListDataSource *)self currentContent];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    id v4 = [(DataSource *)self tableView];
    [v4 setEditing:self->_editing animated:1];

    if (self->_editing)
    {
      id v5 = +[NSMutableArray array];
      selected = self->_selected;
      self->_selected = v5;
    }
    else
    {
      selected = self->_selected;
      self->_selected = 0;
    }
  }
}

- (id)objectsForAnalytics
{
  id v2 = [(CollectionListDataSource *)self currentContent];
  id v3 = [v2 copy];

  return v3;
}

- (int)targetForDragAnalytics
{
  return 103;
}

- (void)deleteRow:(id)a3
{
  id v4 = [a3 cell_IndexPath];
  if (v4)
  {
    id v5 = v4;
    [(CollectionListDataSource *)self _deleteAtIndexPath:v4 completion:0];
    id v4 = v5;
  }
}

- (void)shareRow:(id)a3
{
  id v4 = [a3 cell_IndexPath];
  if (v4)
  {
    id v5 = v4;
    [(CollectionListDataSource *)self _shareAtIndexPath:v4];
    id v4 = v5;
  }
}

- (void)_updateKeyCommandsAtIndexPath:(id)a3
{
  id v10 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [(DataSource *)self tableView];
  if (sub_1000BBB44(v5) == 5 || self->_editSession)
  {
LABEL_3:

    goto LABEL_4;
  }

  if (v10)
  {
    id v5 = [(CollectionListDataSource *)self objectAtIndexPath:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v5;
      if ([v5 canDelete])
      {
        id v8 = sub_100A4B690((uint64_t)"deleteRow:", v10);
        [v4 addObject:v8];
      }
      if ([v5 canShare])
      {
        id v9 = sub_100A4B9B0((uint64_t)"shareRow:", v10);
        [v4 addObject:v9];
      }
    }
    goto LABEL_3;
  }
LABEL_4:
  id v6 = (NSArray *)[v4 copy];
  keyCommands = self->_keyCommands;
  self->_keyCommands = v6;
}

- (void)_deleteAtIndexPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CollectionListDataSource *)self objectAtIndexPath:v6];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100D6938C;
  v29[3] = &unk_1012EF080;
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  id v32 = v6;
  id v33 = v8;
  v31 = self;
  id v9 = v6;
  id v10 = v30;
  uint64_t v11 = objc_retainBlock(v29);
  v12 = [(DataSource *)self tableView];
  v13 = [v12 cellForRowAtIndexPath:v9];

  v14 = [(DataSource *)self delegate];
  id v34 = v10;
  objc_super v15 = +[NSArray arrayWithObjects:&v34 count:1];
  [v13 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100D6948C;
  v26[3] = &unk_1012E8D90;
  id v27 = v11;
  id v28 = v8;
  id v24 = v8;
  v25 = v11;
  [v14 dataSource:self confirmDeleteCollections:v15 sourceView:v13 sourceRect:v26 completion:v17 v21 v23];
}

- (void)_captureCuratedCuratedCollectionAction:(int)a3 indexPath:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(CollectionListDataSource *)self objectAtIndexPath:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 curatedCollectionIdentifier];
    id v10 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 muid]);
    uint64_t v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 row]);
    +[GEOAPPortal captureCuratedCollectionUserAction:v4 target:251 value:0 publisherId:0 following:0 collectionId:v10 collectionCategory:0 collectionCurrentlySaved:&__kCFBooleanTrue verticalIndex:v11 horizontalIndex:0 placeCardType:0 possibleActions:0 impossibleActions:0 modules:0];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: handler != ((void *)0)", buf, 2u);
  }
}

- (void)_shareAtIndexPath:(id)a3
{
  id v9 = a3;
  uint64_t v4 = -[CollectionListDataSource objectAtIndexPath:](self, "objectAtIndexPath:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(DataSource *)self delegate];
    id v6 = [(DataSource *)self tableView];
    id v7 = [v6 cellForRowAtIndexPath:v9];
    [v5 dataSource:self shareCollection:v4 sourceView:v7];

    +[GEOAPPortal captureUserAction:2008 target:0 value:0];
    id v8 = [v4 handlerType];
    if (v8 == (id)4)
    {
      [(CollectionListDataSource *)self _captureCuratedCuratedCollectionAction:2096 indexPath:v9];
    }
    else if (!v8)
    {
      +[GEOAPPortal captureUserAction:2082 target:251 value:0];
    }
  }
}

- (id)deleteContextualActionAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100D6983C;
  v8[3] = &unk_1012F2E50;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = sub_100B7E834(v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (id)deleteMenuActionAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"[Collection List] Delete action" value:@"localized string not found" table:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100D69A3C;
  v10[3] = &unk_1012E6368;
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  id v11 = v7;
  id v8 = +[UIAction actionWithTitle:v6 image:0 identifier:0 handler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

- (id)shareContextualActionAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100D69B9C;
  v8[3] = &unk_1012F2E50;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = sub_100B7EA98(v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (id)shareMenuActionAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"[Collection List] Share action" value:@"localized string not found" table:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100D69D78;
  v10[3] = &unk_1012E6368;
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  id v11 = v7;
  id v8 = +[UIAction actionWithTitle:v6 image:0 identifier:0 handler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(CollectionListDataSource *)self currentContent];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CollectionListDataSource *)self objectAtIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [(CollectionListDataSource *)self _cellForCollection:v8 inTableView:v6 atIndexPath:v7];
  }
  else
  {
    id v10 = objc_alloc((Class)UITableViewCell);
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v9 = [v10 initWithStyle:0 reuseIdentifier:v12];
  }

  return v9;
}

- (id)_cellForCollection:(id)a3 inTableView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = +[CollectionTableViewCell identifier];
  id v12 = [v10 dequeueReusableCellWithIdentifier:v11 forIndexPath:v9];

  [v12 setCollectionViewSize:self->_cellsSize];
  [v12 setCollectionInfo:v8];
  id v13 = [(CollectionEditSession *)self->_editSession collection];
  [v12 setDisabled:v13 == v8];

  v14 = [(CollectionSaveSession *)self->_editSession mapItem];
  if (v14) {
    [v12 setShowCheckmark:[v8 containsItem:v14]];
  }

  return v12;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEditing])
  {
    id v8 = [(CollectionListDataSource *)self objectAtIndexPath:v7];
    if ([v8 canDelete])
    {
      if (sub_1000BBB44(v6) == 5) {
        int64_t v9 = 1;
      }
      else {
        int64_t v9 = 3;
      }
    }
    else
    {
      int64_t v9 = 0;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  if (sub_1000BBB44(a3) == 5)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = +[NSMutableArray array];
    if (!self->_editSession)
    {
      int64_t v9 = [(CollectionListDataSource *)self objectAtIndexPath:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
        if ([v10 canDelete])
        {
          id v11 = [(CollectionListDataSource *)self deleteContextualActionAtIndexPath:v6];
          [v8 addObject:v11];
        }
        if ([v10 canShare])
        {
          id v12 = [(CollectionListDataSource *)self shareContextualActionAtIndexPath:v6];
          [v8 addObject:v12];
        }
      }
    }
    id v7 = +[UISwipeActionsConfiguration configurationWithActions:v8];
  }

  return v7;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  id v7 = [(DataSource *)self tableView];
  uint64_t v8 = sub_1000BBB44(v7);

  if (v8 == 5)
  {
    int64_t v9 = +[NSMutableArray array];
    if (!self->_editSession)
    {
      id v10 = [(CollectionListDataSource *)self objectAtIndexPath:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        if ([v11 canDelete])
        {
          id v12 = [(CollectionListDataSource *)self deleteMenuActionAtIndexPath:v6];
          [v9 addObject:v12];
        }
        if ([v11 canShare])
        {
          id v13 = [(CollectionListDataSource *)self shareMenuActionAtIndexPath:v6];
          [v9 addObject:v13];
        }
      }
    }
    +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v9];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100D6A404;
    v17[3] = &unk_1012F1000;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v18;
    objc_super v15 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v17];
  }
  else
  {
    objc_super v15 = 0;
  }

  return v15;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v4 = self;
  id v5 = [(CollectionListDataSource *)self objectAtIndexPath:a4];
  id v6 = [(CollectionEditSession *)v4->_editSession collection];
  LOBYTE(v4) = v5 != v6;

  return (char)v4;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CollectionListDataSource *)self objectAtIndexPath:v7];
  int64_t v9 = [(CollectionEditSession *)self->_editSession collection];

  if (v8 == v9
    || [v6 isEditing]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ![v8 canDelete])
  {
    id v12 = 0;
  }
  else
  {
    id v10 = [v6 cellForRowAtIndexPath:v7];
    if ([v6 isEditing]) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 3;
    }
    [v10 setSelectionStyle:v11];
    id v12 = v7;
  }

  return v12;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v12 = a3;
  id v7 = [a4 nextFocusedItem];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v12 indexPathForCell:v7], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int64_t v9 = (void *)v8;
    [(CollectionListDataSource *)self _updateKeyCommandsAtIndexPath:v8];
    id v10 = [(DataSource *)self delegate];
    uint64_t v11 = [(CollectionListDataSource *)self objectAtIndexPath:v9];
    [v10 dataSource:self itemFocused:v11];
  }
  else
  {
    [(CollectionListDataSource *)self _updateKeyCommandsAtIndexPath:0];
    int64_t v9 = [(DataSource *)self delegate];
    [v9 dataSource:self itemFocused:0];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(CollectionListDataSource *)self objectAtIndexPath:v6];
  uint64_t v8 = [(CollectionEditSession *)self->_editSession collection];

  if (v7 != v8)
  {
    if ([v12 isEditing])
    {
      [(NSMutableArray *)self->_selected addObject:v7];
      int64_t v9 = [(DataSource *)self delegate];
      id v10 = [(NSMutableArray *)self->_selected copy];
      [v9 dataSource:self didChangeSelectedCollections:v10];
    }
    else
    {
      [(DataSource *)self sendAnalyticsForDataAtIndexPath:v6 object:v7 action:2007];
      uint64_t v11 = [(DataSource *)self delegate];
      [v11 dataSource:self itemTapped:v7];

      [v12 deselectRowAtIndexPath:v6 animated:1];
    }
  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v10 = [(CollectionListDataSource *)self objectAtIndexPath:a4];
  LODWORD(a4) = [v6 isEditing];

  id v7 = v10;
  if (a4 && v10)
  {
    [(NSMutableArray *)self->_selected removeObject:v10];
    uint64_t v8 = [(DataSource *)self delegate];
    id v9 = [(NSMutableArray *)self->_selected copy];
    [v8 dataSource:self didChangeSelectedCollections:v9];

    id v7 = v10;
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4 = [(CollectionListDataSource *)self objectAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), double v5 = 0.0, (objc_opt_isKindOfClass()))
  {
    +[CollectionTableViewCell cellHeight];
    double v5 = v6;
  }

  return v5;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v4 = [(CollectionListDataSource *)self objectAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), double v5 = 0.0, (objc_opt_isKindOfClass()))
  {
    +[CollectionTableViewCell estimatedCellHeight];
    double v5 = v6;
  }

  return v5;
}

- (id)keyCommands
{
  return self->_keyCommands;
}

- (BOOL)editing
{
  return self->_editing;
}

- (unint64_t)cellsSize
{
  return self->_cellsSize;
}

- (void)setCellsSize:(unint64_t)a3
{
  self->_cellsSize = a3;
}

- (NSArray)selected
{
  return &self->_selected->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCommands, 0);
  objc_storeStrong((id *)&self->_footerButton, 0);
  objc_storeStrong((id *)&self->_selected, 0);
  objc_storeStrong((id *)&self->_editSession, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end