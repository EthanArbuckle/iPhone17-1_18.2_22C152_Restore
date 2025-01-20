@interface CollectionDataSource
- (BOOL)editing;
- (BOOL)showsHeader;
- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4;
- (CollectionDataSource)initWithTableView:(id)a3 collection:(id)a4;
- (CollectionDataSource)initWithTableView:(id)a3 collectionEditSession:(id)a4;
- (CollectionEditSession)editSession;
- (CollectionHandlerInfo)collectionInfo;
- (DeleteDelegate)deleteDelegate;
- (ShareDelegate)shareDelegate;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_cellForMapItem:(id)a3 inTableView:(id)a4 atIndexPath:(id)a5;
- (id)_cellForTransitLine:(id)a3 inTableView:(id)a4 atIndexPath:(id)a5;
- (id)currentContent;
- (id)deleteContextualActionAtIndexPath:(id)a3;
- (id)deleteMenuActionAtIndexPath:(id)a3;
- (id)editNameContextualActionAtIndexPath:(id)a3;
- (id)editNameKeyCommandAtIndexPath:(id)a3;
- (id)editNameMenuActionAtIndexPath:(id)a3;
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
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)sortType;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_commonInitWithTableView:(id)a3;
- (void)_contentSizeCategoryDidChange;
- (void)_updateKeyCommandsAtIndexPath:(id)a3;
- (void)collectionHandlerContentUpdated:(id)a3;
- (void)dealloc;
- (void)deleteRow:(id)a3;
- (void)deleteRowAtIndexPath:(id)a3 completion:(id)a4;
- (void)editNameRow:(id)a3;
- (void)editNameRowAtIndexPath:(id)a3 completion:(id)a4;
- (void)selectAll;
- (void)setActive:(BOOL)a3;
- (void)setDeleteDelegate:(id)a3;
- (void)setEditSession:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setShareDelegate:(id)a3;
- (void)setShowsHeader:(BOOL)a3;
- (void)setSortType:(int64_t)a3;
- (void)shareRow:(id)a3;
- (void)shareRowAtIndexPath:(id)a3 completion:(id)a4;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation CollectionDataSource

- (CollectionDataSource)initWithTableView:(id)a3 collectionEditSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CollectionDataSource;
  v8 = [(DataSource *)&v11 initWithTableView:v6 updateLocation:1];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_inputCollectionSession, a4);
    [(CollectionDataSource *)v9 _commonInitWithTableView:v6];
  }

  return v9;
}

- (CollectionDataSource)initWithTableView:(id)a3 collection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CollectionDataSource;
  v8 = [(DataSource *)&v11 initWithTableView:v6 updateLocation:1];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_collectionHandler, a4);
    [(CollectionHandler *)v9->_collectionHandler addObserver:v9];
    [(CollectionDataSource *)v9 _commonInitWithTableView:v6];
  }

  return v9;
}

- (void)_commonInitWithTableView:(id)a3
{
  id v4 = a3;
  [v4 setAllowsSelectionDuringEditing:1];
  uint64_t v5 = objc_opt_class();
  id v6 = +[_SearchResultTableViewCell identifier];
  [v4 registerClass:v5 forCellReuseIdentifier:v6];

  uint64_t v7 = objc_opt_class();
  v8 = +[_SearchResultTableViewCell accessibilityIdentifier];
  [v4 registerClass:v7 forCellReuseIdentifier:v8];

  uint64_t v9 = objc_opt_class();
  v10 = +[TwoLinesTableViewCell identifier];
  [v4 registerClass:v9 forCellReuseIdentifier:v10];

  id v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"_contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CollectionDataSource;
  [(CollectionDataSource *)&v4 dealloc];
}

- (void)setActive:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CollectionDataSource;
  [(DataSource *)&v5 setActive:a3];
  if ([(DataSource *)self active])
  {
    objc_super v4 = [(DataSource *)self delegate];
    [v4 dataSourceUpdated:self];
  }
}

- (void)setSortType:(int64_t)a3
{
  self->_sortType = a3;
  -[CollectionHandler setSortType:](self->_collectionHandler, "setSortType:");
}

- (void)_contentSizeCategoryDidChange
{
  id v2 = [(DataSource *)self tableView];
  [v2 reloadData];
}

- (void)deleteRowAtIndexPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CollectionDataSource *)self objectAtIndexPath:v6];
  if (v8)
  {
    objc_initWeak(&location, self);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1009B17D8;
    v27[3] = &unk_1012EC980;
    objc_copyWeak(&v31, &location);
    id v9 = v6;
    id v28 = v9;
    id v10 = v8;
    id v29 = v10;
    id v11 = v7;
    id v30 = v11;
    v12 = objc_retainBlock(v27);
    v13 = [(DataSource *)self tableView];
    v14 = [v13 cellForRowAtIndexPath:v9];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteDelegate);
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_1009B1AF8;
    v24 = &unk_1012E8D90;
    v16 = v12;
    id v25 = v16;
    id v26 = v11;
    [WeakRetained deleteItem:v10 sourceView:v14 completion:&v21];

    if ((id)[(CollectionHandler *)self->_collectionHandler handlerType] == (id)3) {
      uint64_t v17 = 256;
    }
    else {
      uint64_t v17 = 252;
    }
    v18 = [NSNumber numberWithInteger:[v9 row:&v31, v21, v22, v23, v24]];
    v19 = [v18 stringValue];
    +[GEOAPPortal captureUserAction:2070 target:v17 value:v19];

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
}

- (void)shareRowAtIndexPath:(id)a3 completion:(id)a4
{
  id v16 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = [(CollectionDataSource *)self objectAtIndexPath:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = [[SearchResult alloc] initWithMapItem:v8];

    id v10 = [(CollectionDataSource *)self shareDelegate];
    id v11 = [(SearchResult *)v9 unknownContact];
    v12 = +[ShareItem shareItemWithSearchResult:v9 contact:v11 includePrintActivity:1];
    v13 = [(DataSource *)self tableView];
    v14 = [v13 cellForRowAtIndexPath:v16];
    [v10 shareItem:v12 sourceView:v14 completion:0];
  }
  if (v6) {
    v6[2](v6);
  }
  if ((id)[(CollectionHandler *)self->_collectionHandler handlerType] == (id)3) {
    uint64_t v15 = 256;
  }
  else {
    uint64_t v15 = 252;
  }
  +[GEOAPPortal captureUserAction:2008 target:0 value:0];
  +[GEOAPPortal captureUserAction:2069 target:v15 value:0];
}

- (void)editNameRowAtIndexPath:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = [(CollectionDataSource *)self objectAtIndexPath:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = [[SearchResult alloc] initWithMapItem:v8];
    id v10 = [(DataSource *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v12 = [(DataSource *)self delegate];
      [v12 dataSource:self searchResultNeedsEditing:v9 completion:v6];

      [(DataSource *)self sendAnalyticsForDataAtIndexPath:v13 object:v8 action:2010];
      goto LABEL_7;
    }
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_7:
}

- (void)collectionHandlerContentUpdated:(id)a3
{
  if (([a3 beingModified] & 1) == 0)
  {
    if (!self->_contentAfterDeletion)
    {
LABEL_8:
      if ([(DataSource *)self active])
      {
        id v8 = [(DataSource *)self delegate];
        [v8 dataSourceUpdated:self];
      }
      return;
    }
    objc_super v4 = [(CollectionHandler *)self->_collectionHandler content];
    id v9 = v4;
    if (v4 == self->_contentAfterDeletion)
    {
      self->_contentAfterDeletion = 0;
    }
    else
    {
      unsigned __int8 v5 = -[NSArray isEqual:](v4, "isEqual:");
      contentAfterDeletion = self->_contentAfterDeletion;
      self->_contentAfterDeletion = 0;

      if ((v5 & 1) == 0)
      {
        id v7 = sub_1000B944C();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unexpected collection content after deleting an item", buf, 2u);
        }

        goto LABEL_8;
      }
    }
  }
}

- (void)selectAll
{
  editSession = self->_editSession;
  objc_super v4 = [(CollectionDataSource *)self currentContent];
  [(CollectionEditSession *)editSession addSelectedObjects:v4];

  [(CollectionDataSource *)self collectionHandlerContentUpdated:self->_collectionHandler];
  unsigned __int8 v5 = [(CollectionDataSource *)self currentContent];
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 1;
    do
    {
      id v8 = [(DataSource *)self tableView];
      id v9 = +[NSIndexPath indexPathForRow:v7 - 1 inSection:0];
      [v8 selectRowAtIndexPath:v9 animated:0 scrollPosition:0];

      id v10 = [(CollectionDataSource *)self currentContent];
      id v11 = [v10 count];

      if ((v7 & 0x8000000000000000) != 0) {
        break;
      }
    }
    while (v7++ < (unint64_t)v11);
  }
}

- (CollectionHandlerInfo)collectionInfo
{
  return (CollectionHandlerInfo *)self->_collectionHandler;
}

- (id)currentContent
{
  contentAfterDeletion = self->_contentAfterDeletion;
  if (contentAfterDeletion)
  {
    v3 = contentAfterDeletion;
LABEL_5:
    objc_super v4 = v3;
    goto LABEL_6;
  }
  if (self->_collectionHandler)
  {
    v3 = [(CollectionHandler *)self->_collectionHandler content];
    goto LABEL_5;
  }
  inputCollectionSession = self->_inputCollectionSession;
  if (inputCollectionSession)
  {
    unint64_t v7 = [(CollectionEditSession *)inputCollectionSession selectedObjectSet];
    objc_super v4 = [v7 allObjects];
  }
  else
  {
    objc_super v4 = 0;
  }
LABEL_6:

  return v4;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CollectionDataSource *)self currentContent];
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

- (id)objectsForAnalytics
{
  id v2 = [(CollectionDataSource *)self currentContent];
  id v3 = [v2 copy];

  return v3;
}

- (int)targetForDragAnalytics
{
  return 103;
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
      unsigned __int8 v5 = [[CollectionEditSession alloc] initWithCollection:self->_collectionHandler];
      editSession = self->_editSession;
      self->_editSession = v5;
    }
    else
    {
      editSession = self->_editSession;
      self->_editSession = 0;
    }
  }
}

- (void)deleteRow:(id)a3
{
  id v4 = [a3 cell_IndexPath];
  if (v4)
  {
    unsigned __int8 v5 = v4;
    [(CollectionDataSource *)self deleteRowAtIndexPath:v4 completion:0];
    id v4 = v5;
  }
}

- (void)shareRow:(id)a3
{
  id v4 = [a3 cell_IndexPath];
  if (v4)
  {
    unsigned __int8 v5 = v4;
    [(CollectionDataSource *)self shareRowAtIndexPath:v4 completion:0];
    id v4 = v5;
  }
}

- (void)editNameRow:(id)a3
{
  id v4 = [a3 cell_IndexPath];
  if (v4)
  {
    unsigned __int8 v5 = v4;
    [(CollectionDataSource *)self editNameRowAtIndexPath:v4 completion:0];
    id v4 = v5;
  }
}

- (id)editNameKeyCommandAtIndexPath:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle mainBundle];
  unsigned __int8 v5 = [v4 localizedStringForKey:@"KeyCommand_EditName" value:@"localized string not found" table:0];
  v12[0] = @"row";
  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 row]);
  v12[1] = @"section";
  v13[0] = v6;
  id v7 = [v3 section];

  id v8 = +[NSNumber numberWithInteger:v7];
  v13[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v10 = +[UIKeyCommand commandWithTitle:v5 image:0 action:"editNameRow:" input:@"e" modifierFlags:0x100000 propertyList:v9];

  return v10;
}

- (void)_updateKeyCommandsAtIndexPath:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(DataSource *)self tableView];
  if (sub_1000BBB44(v5) == 5 || !self->_collectionHandler)
  {
  }
  else
  {

    if (v4)
    {
      id v6 = [(CollectionDataSource *)self objectAtIndexPath:v4];
      if ((id)[(CollectionHandler *)self->_collectionHandler handlerType] == (id)3)
      {
        id v7 = sub_100A4B9B0((uint64_t)"shareRow:", v4);
        v19 = v7;
        id v8 = &v19;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v12 = [v6 _maps_canRenameCollectionItem];
          uint64_t v13 = sub_100A4B690((uint64_t)"deleteRow:", v4);
          id v7 = (void *)v13;
          if (v12)
          {
            v18[0] = v13;
            v14 = sub_100A4B9B0((uint64_t)"shareRow:", v4);
            v18[1] = v14;
            uint64_t v15 = [(CollectionDataSource *)self editNameKeyCommandAtIndexPath:v4];
            v18[2] = v15;
            id v9 = +[NSArray arrayWithObjects:v18 count:3];
          }
          else
          {
            v17[0] = v13;
            v14 = sub_100A4B9B0((uint64_t)"shareRow:", v4);
            v17[1] = v14;
            id v9 = +[NSArray arrayWithObjects:v17 count:2];
          }

          goto LABEL_17;
        }
        if (![v6 conformsToProtocol:&OBJC_PROTOCOL___GEOTransitLine])
        {
          id v9 = &__NSArray0__struct;
          goto LABEL_18;
        }
        id v7 = sub_100A4B690((uint64_t)"deleteRow:", v4);
        id v16 = v7;
        id v8 = &v16;
      }
      id v9 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 1, v16);
LABEL_17:

LABEL_18:
      goto LABEL_9;
    }
  }
  id v9 = &__NSArray0__struct;
LABEL_9:
  id v10 = (NSArray *)[v9 copy];
  keyCommands = self->_keyCommands;
  self->_keyCommands = v10;
}

- (id)deleteContextualActionAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009B2940;
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
  id v6 = [v5 localizedStringForKey:@"[Collection] Delete action" value:@"localized string not found" table:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009B2B40;
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
  v8[2] = sub_1009B2C98;
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
  id v6 = [v5 localizedStringForKey:@"[Collection] Share action" value:@"localized string not found" table:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009B2E6C;
  v10[3] = &unk_1012E6368;
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  id v11 = v7;
  id v8 = +[UIAction actionWithTitle:v6 image:0 identifier:0 handler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

- (id)editNameContextualActionAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"RowSwipe_Edit" value:@"localized string not found" table:0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009B304C;
  v11[3] = &unk_1012F53A0;
  objc_copyWeak(&v13, &location);
  id v7 = v4;
  id v12 = v7;
  id v8 = +[UIContextualAction contextualActionWithStyle:0 title:v6 handler:v11];

  id v9 = +[UIColor systemOrangeColor];
  [v8 setBackgroundColor:v9];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

- (id)editNameMenuActionAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"[Collection] edit name action" value:@"localized string not found" table:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009B327C;
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
  id v4 = [(CollectionDataSource *)self currentContent];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CollectionDataSource *)self objectAtIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(CollectionDataSource *)self _cellForMapItem:v8 inTableView:v6 atIndexPath:v7];
LABEL_5:
    id v10 = (id)v9;
    goto LABEL_7;
  }
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___GEOTransitLine])
  {
    uint64_t v9 = [(CollectionDataSource *)self _cellForTransitLine:v8 inTableView:v6 atIndexPath:v7];
    goto LABEL_5;
  }
  id v11 = objc_alloc((Class)UITableViewCell);
  id v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  id v10 = [v11 initWithStyle:0 reuseIdentifier:v13];

LABEL_7:

  return v10;
}

- (id)_cellForMapItem:(id)a3 inTableView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (+[UIFont accessibilityTextEnabled]) {
    +[_SearchResultTableViewCell accessibilityIdentifier];
  }
  else {
  id v11 = +[_SearchResultTableViewCell identifier];
  }
  id v12 = [v9 dequeueReusableCellWithIdentifier:v11 forIndexPath:v8];

  id v13 = [(DataSource *)self currentLocation];
  [v12 setCurrentLocation:v13];

  [v12 setMapItem:v10];
  [v12 setAccessibilityIdentifier:@"CollectionPlaceTableCell"];

  return v12;
}

- (id)_cellForTransitLine:(id)a3 inTableView:(id)a4 atIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[TwoLinesTableViewCell identifier];
  id v11 = [v8 dequeueReusableCellWithIdentifier:v10 forIndexPath:v7];

  id v12 = +[TwoLinesContentViewModelComposer cellModelForTransitLine:v9];

  [v11 setViewModel:v12];

  return v11;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v12 = a4;
  id v8 = a3;
  id v9 = [(CollectionDataSource *)self objectAtIndexPath:a5];
  unsigned int v10 = [v8 isEditing];

  if (v10)
  {
    [v12 setSelectionStyle:1];
    id v11 = [(CollectionEditSession *)self->_editSession selectedObjectSet];
    [v12 setSelected:[v11 containsObject:v9]];
  }
  else
  {
    [v12 setSelected:0];
  }
}

- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4
{
  if (!self->_showsHeader) {
    return 0;
  }
  id v4 = [(CollectionDataSource *)self currentContent];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  if (self->_showsHeader)
  {
    id v6 = [(CollectionDataSource *)self currentContent];
    id v7 = (SectionHeaderTableViewHeaderFooterView *)[v6 count];

    if (v7)
    {
      id v8 = +[NSBundle mainBundle];
      id v9 = [v8 localizedStringForKey:@"In this Guide" value:@"localized string not found" table:0];

      id v7 = [[SectionHeaderTableViewHeaderFooterView alloc] initWithTitle:v9 isFirstNonEmptySection:1];
      [v5 bounds];
      double Width = CGRectGetWidth(v17);
      id v11 = [v5 traitCollection];
      +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:1 title:v9 actionTitle:0 availableWidth:v11 traitCollection:Width];
      double v13 = v12;

      v14 = [(DataSource *)self tableView];
      [v14 frame];
      -[SectionHeaderTableViewHeaderFooterView setBounds:](v7, "setBounds:", 0.0, 0.0, CGRectGetWidth(v18), v13);

      [(SectionHeaderTableViewHeaderFooterView *)v7 setAccessibilityIdentifiersWithBaseString:@"NewGuide"];
      [(SectionHeaderTableViewHeaderFooterView *)v7 layoutIfNeeded];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  if (self->_collectionHandler) {
    return 3;
  }
  else {
    return 0;
  }
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (!self->_collectionHandler)
  {
    id v9 = &__NSArray0__struct;
    goto LABEL_15;
  }
  id v6 = [(CollectionDataSource *)self objectAtIndexPath:v5];
  if ((id)[(CollectionHandler *)self->_collectionHandler handlerType] == (id)3)
  {
    id v7 = [(CollectionDataSource *)self shareContextualActionAtIndexPath:v5];
    v19 = v7;
    id v8 = &v19;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v10 = [v6 _maps_canRenameCollectionItem];
      uint64_t v11 = [(CollectionDataSource *)self deleteContextualActionAtIndexPath:v5];
      id v7 = (void *)v11;
      if (v10)
      {
        v18[0] = v11;
        double v12 = [(CollectionDataSource *)self shareContextualActionAtIndexPath:v5];
        v18[1] = v12;
        double v13 = [(CollectionDataSource *)self editNameContextualActionAtIndexPath:v5];
        v18[2] = v13;
        id v9 = +[NSArray arrayWithObjects:v18 count:3];
      }
      else
      {
        v17[0] = v11;
        double v12 = [(CollectionDataSource *)self shareContextualActionAtIndexPath:v5];
        v17[1] = v12;
        id v9 = +[NSArray arrayWithObjects:v17 count:2];
      }

      goto LABEL_13;
    }
    if (![v6 conformsToProtocol:&OBJC_PROTOCOL___GEOTransitLine])
    {
      id v9 = &__NSArray0__struct;
      goto LABEL_14;
    }
    id v7 = [(CollectionDataSource *)self deleteContextualActionAtIndexPath:v5];
    id v16 = v7;
    id v8 = &v16;
  }
  id v9 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 1, v16);
LABEL_13:

LABEL_14:
LABEL_15:
  v14 = +[UISwipeActionsConfiguration configurationWithActions:v9];

  return v14;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  id v7 = [(DataSource *)self tableView];
  uint64_t v8 = sub_1000BBB44(v7);

  if (v8 != 5)
  {
    double v13 = 0;
    goto LABEL_18;
  }
  if (self->_collectionHandler)
  {
    id v9 = [(CollectionDataSource *)self objectAtIndexPath:v6];
    if ((id)[(CollectionHandler *)self->_collectionHandler handlerType] == (id)3)
    {
      unsigned int v10 = [(CollectionDataSource *)self shareMenuActionAtIndexPath:v6];
      id v25 = v10;
      uint64_t v11 = &v25;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v14 = [v9 _maps_canRenameCollectionItem];
        uint64_t v15 = [(CollectionDataSource *)self deleteMenuActionAtIndexPath:v6];
        unsigned int v10 = (void *)v15;
        if (v14)
        {
          v24[0] = v15;
          id v16 = [(CollectionDataSource *)self shareMenuActionAtIndexPath:v6];
          v24[1] = v16;
          CGRect v17 = [(CollectionDataSource *)self editNameMenuActionAtIndexPath:v6];
          v24[2] = v17;
          double v12 = +[NSArray arrayWithObjects:v24 count:3];
        }
        else
        {
          v23[0] = v15;
          id v16 = [(CollectionDataSource *)self shareMenuActionAtIndexPath:v6];
          v23[1] = v16;
          double v12 = +[NSArray arrayWithObjects:v23 count:2];
        }

        goto LABEL_15;
      }
      if (![v9 conformsToProtocol:&OBJC_PROTOCOL___GEOTransitLine])
      {
        double v12 = &__NSArray0__struct;
        goto LABEL_16;
      }
      unsigned int v10 = [(CollectionDataSource *)self deleteMenuActionAtIndexPath:v6];
      uint64_t v22 = v10;
      uint64_t v11 = &v22;
    }
    double v12 = +[NSArray arrayWithObjects:v11 count:1];
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  double v12 = &__NSArray0__struct;
LABEL_17:
  +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v12];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1009B3DF0;
  v20[3] = &unk_1012F1000;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v21;
  double v13 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v20];

LABEL_18:

  return v13;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  if (self->_collectionHandler)
  {
    id v7 = a3;
    uint64_t v8 = [v7 cellForRowAtIndexPath:v6];
    unsigned int v9 = [v7 isEditing];

    if (v9) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 3;
    }
    [v8 setSelectionStyle:v10];
    id v11 = v6;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  if (self->_collectionHandler)
  {
    id v6 = a3;
    id v8 = [(CollectionDataSource *)self objectAtIndexPath:a4];
    LODWORD(a4) = [v6 isEditing];

    id v7 = v8;
    if (a4 && v8)
    {
      [(CollectionEditSession *)self->_editSession removeSelectedObject:v8];
      id v7 = v8;
    }
  }
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v12 = a3;
  id v7 = [a4 nextFocusedItem];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v12 indexPathForCell:v7], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned int v9 = (void *)v8;
    [(CollectionDataSource *)self _updateKeyCommandsAtIndexPath:v8];
    uint64_t v10 = [(DataSource *)self delegate];
    id v11 = [(CollectionDataSource *)self objectAtIndexPath:v9];
    [v10 dataSource:self itemFocused:v11];
  }
  else
  {
    [(CollectionDataSource *)self _updateKeyCommandsAtIndexPath:0];
    unsigned int v9 = [(DataSource *)self delegate];
    [v9 dataSource:self itemFocused:0];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (self->_collectionHandler)
  {
    id v7 = [(CollectionDataSource *)self objectAtIndexPath:v6];
    if (v7)
    {
      if ([v13 isEditing])
      {
        [(CollectionEditSession *)self->_editSession addSelectedObject:v7];
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v8 = [(DataSource *)self delegate];
      [v8 dataSource:self itemTapped:v7];

      unsigned int v9 = [(CollectionDataSource *)self collectionInfo];
      if ([v9 handlerType] == (id)3) {
        uint64_t v10 = 256;
      }
      else {
        uint64_t v10 = 252;
      }

      id v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 row]);
      id v12 = [v11 stringValue];
      +[GEOAPPortal captureUserAction:2068 target:v10 value:v12];
    }
    [v13 deselectRowAtIndexPath:v6 animated:1];
    goto LABEL_10;
  }
LABEL_11:
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4 = [(CollectionDataSource *)self objectAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = off_1012D45A0;
LABEL_5:
    [(__objc2_class *)*v5 cellHeight];
    double v6 = v7;
    goto LABEL_6;
  }
  double v6 = 0.0;
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___GEOTransitLine])
  {
    id v5 = off_1012D4648;
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v4 = [(CollectionDataSource *)self objectAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = off_1012D45A0;
LABEL_5:
    [(__objc2_class *)*v5 estimatedCellHeight];
    double v6 = v7;
    goto LABEL_6;
  }
  double v6 = 0.0;
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___GEOTransitLine])
  {
    id v5 = off_1012D4648;
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (id)keyCommands
{
  return self->_keyCommands;
}

- (ShareDelegate)shareDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shareDelegate);

  return (ShareDelegate *)WeakRetained;
}

- (void)setShareDelegate:(id)a3
{
}

- (DeleteDelegate)deleteDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteDelegate);

  return (DeleteDelegate *)WeakRetained;
}

- (void)setDeleteDelegate:(id)a3
{
}

- (int64_t)sortType
{
  return self->_sortType;
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)showsHeader
{
  return self->_showsHeader;
}

- (void)setShowsHeader:(BOOL)a3
{
  self->_showsHeader = a3;
}

- (CollectionEditSession)editSession
{
  return self->_editSession;
}

- (void)setEditSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editSession, 0);
  objc_destroyWeak((id *)&self->_deleteDelegate);
  objc_destroyWeak((id *)&self->_shareDelegate);
  objc_storeStrong((id *)&self->_keyCommands, 0);
  objc_storeStrong((id *)&self->_contentAfterDeletion, 0);
  objc_storeStrong((id *)&self->_inputCollectionSession, 0);

  objc_storeStrong((id *)&self->_collectionHandler, 0);
}

@end