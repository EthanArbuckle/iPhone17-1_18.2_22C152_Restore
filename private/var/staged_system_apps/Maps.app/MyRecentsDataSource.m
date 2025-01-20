@interface MyRecentsDataSource
- (MyRecentsDataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4 includeRecentSearches:(BOOL)a5;
- (ShareDelegate)shareDelegate;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)deleteContextualActionForIndexPath:(id)a3;
- (id)keyCommands;
- (id)objectAtIndexPath:(id)a3;
- (id)sectionAtIndex:(int64_t)a3;
- (id)shareContextualActionAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)indexOfItem:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_buildContent;
- (void)_loadContent;
- (void)_updateKeyCommandsAtIndexPath:(id)a3;
- (void)clearSectionAtIndex:(int64_t)a3;
- (void)removeItem:(id)a3;
- (void)removeItemAtIndexPath:(id)a3;
- (void)setShareDelegate:(id)a3;
- (void)shareRow:(id)a3;
- (void)shareRowAtIndexPath:(id)a3 completion:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
@end

@implementation MyRecentsDataSource

- (MyRecentsDataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4 includeRecentSearches:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MyRecentsDataSource;
  v9 = [(DataSource *)&v16 initWithTableView:v8 updateLocation:v6];
  v10 = v9;
  if (v9)
  {
    v9->_includeRecentSearches = a5;
    uint64_t v11 = objc_opt_class();
    v12 = +[TwoLinesTableViewCell identifier];
    [v8 registerClass:v11 forCellReuseIdentifier:v12];

    [v8 setContentInset:0.0, 0.0, 16.0, 0.0];
    [(MyRecentsDataSource *)v10 _loadContent];
    v13 = +[NSNotificationCenter defaultCenter];
    v14 = +[Recents sharedRecents];
    [v13 addObserver:v10 selector:"_recentsChanged" name:@"RecentsDidChangeNotification" object:v14];
  }
  return v10;
}

- (void)_loadContent
{
  v3 = +[Recents sharedRecents];
  v4 = [v3 orderedRecents];
  v5 = (NSArray *)[v4 copy];
  recentsContent = self->_recentsContent;
  self->_recentsContent = v5;

  [(MyRecentsDataSource *)self _buildContent];
  id v7 = [(DataSource *)self delegate];
  [v7 dataSourceUpdated:self];
}

- (void)_buildContent
{
  v36 = +[NSMutableArray array];
  v34 = +[NSMutableArray array];
  v33 = +[NSMutableArray array];
  v32 = +[NSMutableArray array];
  id v2 = [(NSArray *)self->_recentsContent copy];
  v35 = +[NSDate date];
  v37 = +[NSCalendar currentCalendar];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  long long v46 = 0u;
  id obj = v2;
  id v3 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v47;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v47 != v4) {
          objc_enumerationMutation(obj);
        }
        BOOL v6 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = v6;
          id v8 = [v7 historyEntry];
          uint64_t v42 = 0;
          v43 = &v42;
          uint64_t v44 = 0x2020000000;
          char v45 = 0;
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_1006870BC;
          v41[3] = &unk_1012EA888;
          v41[4] = self;
          v41[5] = &v42;
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_1006870DC;
          v40[3] = &unk_1012F4148;
          v40[4] = &v42;
          [v8 ifSearch:v41 ifRoute:v40 ifPlaceDisplay:0 ifTransitLineItem:0];
          if (!*((unsigned char *)v43 + 24))
          {
            v9 = [v8 usageDate];
            unsigned __int8 v10 = [v37 isDateInToday:v9];
            uint64_t v11 = v36;
            if ((v10 & 1) == 0)
            {
              id v12 = [v37 compareDate:v35 toDate:v9 toUnitGranularity:0x2000];
              uint64_t v11 = v34;
              if (v12)
              {
                if ([v37 compareDate:v35 toDate:v9 toUnitGranularity:8]) {
                  uint64_t v11 = v32;
                }
                else {
                  uint64_t v11 = v33;
                }
              }
            }
            [v11 addObject:v7];
          }
          _Block_object_dispose(&v42, 8);
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v3);
  }

  v13 = +[NSMutableArray array];
  if ([v36 count])
  {
    v14 = objc_alloc_init(RecentBucketSection);
    v15 = +[NSBundle mainBundle];
    objc_super v16 = [v15 localizedStringForKey:@"[RecentlyViewed] Today" value:@"localized string not found" table:0];
    [(RecentBucketSection *)v14 setTitle:v16];

    id v17 = [v36 copy];
    [(RecentBucketSection *)v14 setObjects:v17];

    [v13 addObject:v14];
  }
  if ([v34 count])
  {
    v18 = objc_alloc_init(RecentBucketSection);
    v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"[RecentlyViewed] This Week" value:@"localized string not found" table:0];
    [(RecentBucketSection *)v18 setTitle:v20];

    id v21 = [v34 copy];
    [(RecentBucketSection *)v18 setObjects:v21];

    [v13 addObject:v18];
  }
  if ([v33 count])
  {
    v22 = objc_alloc_init(RecentBucketSection);
    v23 = +[NSBundle mainBundle];
    v24 = [v23 localizedStringForKey:@"[RecentlyViewed] This Month" value:@"localized string not found" table:0];
    [(RecentBucketSection *)v22 setTitle:v24];

    id v25 = [v33 copy];
    [(RecentBucketSection *)v22 setObjects:v25];

    [v13 addObject:v22];
  }
  if ([v32 count])
  {
    v26 = objc_alloc_init(RecentBucketSection);
    v27 = +[NSBundle mainBundle];
    v28 = [v27 localizedStringForKey:@"[RecentlyViewed] Older" value:@"localized string not found" table:0];
    [(RecentBucketSection *)v26 setTitle:v28];

    id v29 = [v32 copy];
    [(RecentBucketSection *)v26 setObjects:v29];

    [v13 addObject:v26];
  }
  v30 = (NSArray *)[v13 copy];
  sections = self->_sections;
  self->_sections = v30;
}

- (id)sectionAtIndex:(int64_t)a3
{
  if (a3 < 0)
  {
    BOOL v6 = 0;
  }
  else
  {
    if ([(NSArray *)self->_sections count] <= a3)
    {
      BOOL v6 = 0;
    }
    else
    {
      BOOL v6 = [(NSArray *)self->_sections objectAtIndexedSubscript:a3];
    }
  }
  return v6;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = -[MyRecentsDataSource sectionAtIndex:](self, "sectionAtIndex:", [v4 section]);
  BOOL v6 = [v5 objects];
  if (((unint64_t)[v4 row] & 0x8000000000000000) != 0
    || (id v7 = [v4 row], v7 >= objc_msgSend(v6, "count")))
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v6 objectAtIndexedSubscript:[v4 row]];
  }

  return v8;
}

- (int64_t)indexOfItem:(id)a3
{
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v5 = self->_sections;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v26;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v12 = [v11 objects];
        v13 = (char *)[v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v13)
        {
          v14 = v13;
          uint64_t v15 = *(void *)v22;
          objc_super v16 = v8;
          while (2)
          {
            id v17 = 0;
            id v8 = &v16[(void)v14];
            do
            {
              if (*(void *)v22 != v15) {
                objc_enumerationMutation(v12);
              }
              if (*(id *)(*((void *)&v21 + 1) + 8 * (void)v17) == v4)
              {

                int64_t v18 = (int64_t)&v17[(void)v16];
                goto LABEL_19;
              }
              ++v17;
            }
            while (v14 != v17);
            v14 = (char *)[v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
            objc_super v16 = v8;
            if (v14) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = v20;
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      int64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    while (v7);
  }
  else
  {
    int64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_19:

  return v18;
}

- (void)removeItemAtIndexPath:(id)a3
{
  uint64_t v3 = [(MyRecentsDataSource *)self objectAtIndexPath:a3];
  id v4 = +[Recents sharedRecents];
  id v6 = v3;
  v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v4 deleteRecents:v5 completion:&stru_1012F4168];
}

- (void)clearSectionAtIndex:(int64_t)a3
{
  id v5 = [(MyRecentsDataSource *)self sectionAtIndex:a3];
  uint64_t v3 = +[Recents sharedRecents];
  id v4 = [v5 objects];
  [v3 deleteRecents:v4 completion:&stru_1012F4188];
}

- (void)shareRowAtIndexPath:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [(MyRecentsDataSource *)self objectAtIndexPath:v7];
  id v8 = [(MyRecentsDataSource *)self shareDelegate];
  uint64_t v9 = +[ShareItem shareItemForObject:v12];
  unsigned __int8 v10 = [(DataSource *)self tableView];
  uint64_t v11 = [v10 cellForRowAtIndexPath:v7];
  [v8 shareItem:v9 sourceView:v11 completion:v6];

  [(DataSource *)self sendAnalyticsForDataAtIndexPath:v7 object:v12 action:2008];
}

- (void)removeItem:(id)a3
{
  id v4 = [a3 cell_IndexPath];
  if (v4)
  {
    id v5 = v4;
    [(MyRecentsDataSource *)self removeItemAtIndexPath:v4];
    id v4 = v5;
  }
}

- (void)shareRow:(id)a3
{
  id v4 = [a3 cell_IndexPath];
  if (v4)
  {
    id v5 = v4;
    [(MyRecentsDataSource *)self shareRowAtIndexPath:v4 completion:0];
    id v4 = v5;
  }
}

- (void)_updateKeyCommandsAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(DataSource *)self tableView];
  uint64_t v6 = sub_1000BBB44(v5);

  id v7 = &__NSArray0__struct;
  if (v4 && v6 != 5)
  {
    id v8 = [(MyRecentsDataSource *)self objectAtIndexPath:v4];
    uint64_t v9 = +[ShareItem shareItemForObject:v8];

    uint64_t v10 = sub_100A4B690((uint64_t)"removeItem:", v4);
    uint64_t v11 = (void *)v10;
    if (v9)
    {
      v15[0] = v10;
      id v12 = sub_100A4B9B0((uint64_t)"shareRow:", v4);
      v15[1] = v12;
      id v7 = +[NSArray arrayWithObjects:v15 count:2];
    }
    else
    {
      uint64_t v16 = v10;
      id v7 = +[NSArray arrayWithObjects:&v16 count:1];
    }
  }
  v13 = [v7 copy];
  keyCommands = self->_keyCommands;
  self->_keyCommands = v13;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sections count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(MyRecentsDataSource *)self sectionAtIndex:a4];
  id v5 = [v4 objects];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MyRecentsDataSource *)self objectAtIndexPath:v6];
  uint64_t v9 = +[TwoLinesTableViewCell identifier];
  uint64_t v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  uint64_t v11 = +[TwoLinesContentViewModelComposer cellModelForHistoryEntryRecentsItem:v8 showAutocompleteClientSource:0 showPlaceContext:0];
  [v10 setViewModel:v11];

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(MyRecentsDataSource *)self tableView:v6 numberOfRowsInSection:a4])
  {
    id v7 = [(MyRecentsDataSource *)self sectionAtIndex:a4];
    id v8 = [SectionHeaderTableViewHeaderFooterView alloc];
    uint64_t v9 = [v7 title];
    uint64_t v10 = -[SectionHeaderTableViewHeaderFooterView initWithTitle:isFirstNonEmptySection:](v8, "initWithTitle:isFirstNonEmptySection:", v9, objc_msgSend(v6, "_maps_indexOfFirstNonEmptySection") == (id)a4);

    [(SectionHeaderTableViewHeaderFooterView *)v10 setAccessibilityIdentifiersWithBaseString:@"RecentlyViewed"];
    uint64_t v11 = [(DataSource *)self tableView];
    -[SectionHeaderTableViewHeaderFooterView setShowsBottomHairline:](v10, "setShowsBottomHairline:", [v11 style] != (id)2);

    objc_initWeak(&location, self);
    id v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"[RecentlyViewed] Clear" value:@"localized string not found" table:0];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    void v15[2] = sub_100687DCC;
    v15[3] = &unk_1012F0708;
    objc_copyWeak(v16, &location);
    v16[1] = (id)a4;
    [(SectionHeaderTableViewHeaderFooterView *)v10 setActionTitle:v13 completionHandler:v15];

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(MyRecentsDataSource *)self tableView:v6 numberOfRowsInSection:a4])
  {
    id v7 = [(MyRecentsDataSource *)self sectionAtIndex:a4];
    id v8 = [v7 title];

    if (v8)
    {
      BOOL v9 = [v6 _maps_indexOfFirstNonEmptySection] == (id)a4;
      uint64_t v10 = [v7 title];
      uint64_t v11 = +[NSBundle mainBundle];
      id v12 = [v11 localizedStringForKey:@"[RecentlyViewed] Clear" value:@"localized string not found" table:0];
      [v6 bounds];
      double Width = CGRectGetWidth(v18);
      v14 = [v6 traitCollection];
      +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:v9 title:v10 actionTitle:v12 availableWidth:v14 traitCollection:Width];
      double v16 = v15;
    }
    else
    {
      double v16 = 0.0;
    }
  }
  else
  {
    double v16 = 0.0;
  }

  return v16;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v12 = a3;
  id v7 = [a4 nextFocusedItem];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v12 indexPathForCell:v7], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v9 = (void *)v8;
    [(MyRecentsDataSource *)self _updateKeyCommandsAtIndexPath:v8];
    uint64_t v10 = [(DataSource *)self delegate];
    uint64_t v11 = [(MyRecentsDataSource *)self objectAtIndexPath:v9];
    [v10 dataSource:self itemFocused:v11];
  }
  else
  {
    [(MyRecentsDataSource *)self _updateKeyCommandsAtIndexPath:0];
    BOOL v9 = [(DataSource *)self delegate];
    [v9 dataSource:self itemFocused:0];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(MyRecentsDataSource *)self objectAtIndexPath:v6];
  uint64_t v8 = [(DataSource *)self delegate];
  [v8 dataSource:self itemTapped:v9];

  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  +[TwoLinesTableViewCell cellHeight];
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  +[TwoLinesTableViewCell estimatedCellHeight];
  return result;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MyRecentsDataSource *)self objectAtIndexPath:v5];
  id v7 = +[ShareItem shareItemForObject:v6];

  uint64_t v8 = [(MyRecentsDataSource *)self deleteContextualActionForIndexPath:v5];
  id v9 = (void *)v8;
  if (v7)
  {
    uint64_t v10 = -[MyRecentsDataSource shareContextualActionAtIndexPath:](self, "shareContextualActionAtIndexPath:", v5, v8);
    v14[1] = v10;
    uint64_t v11 = +[NSArray arrayWithObjects:v14 count:2];
    id v12 = +[UISwipeActionsConfiguration configurationWithActions:v11];
  }
  else
  {
    uint64_t v15 = v8;
    uint64_t v10 = +[NSArray arrayWithObjects:&v15 count:1];
    id v12 = +[UISwipeActionsConfiguration configurationWithActions:v10];
  }

  return v12;
}

- (id)deleteContextualActionForIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006883C0;
  v8[3] = &unk_1012F2E50;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = sub_100B7E834(v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (id)shareContextualActionAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100688534;
  v8[3] = &unk_1012F2E50;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = sub_100B7EA98(v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shareDelegate);
  objc_storeStrong((id *)&self->_keyCommands, 0);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_recentsContent, 0);
}

@end