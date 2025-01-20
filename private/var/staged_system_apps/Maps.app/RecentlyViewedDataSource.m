@interface RecentlyViewedDataSource
- (BOOL)showAddAccessory;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (RecentlyViewedDataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)mapItemAtIndexPath:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_buildContent;
- (void)_loadContent;
- (void)didTapOnAccessoryView:(id)a3 withType:(int64_t)a4 object:(id)a5;
- (void)removeItemAtIndexPath:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setShowAddAccessory:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation RecentlyViewedDataSource

- (RecentlyViewedDataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RecentlyViewedDataSource;
  v7 = [(DataSource *)&v13 initWithTableView:v6 updateLocation:v4];
  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    v9 = +[TwoLinesTableViewCell identifier];
    [v6 registerClass:v8 forCellReuseIdentifier:v9];

    [(RecentlyViewedDataSource *)v7 _loadContent];
    v10 = +[NSNotificationCenter defaultCenter];
    v11 = +[Recents sharedRecents];
    [v10 addObserver:v7 selector:"_recentsChanged" name:@"RecentsDidChangeNotification" object:v11];
  }
  return v7;
}

- (void)setActive:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RecentlyViewedDataSource;
  [(DataSource *)&v4 setActive:a3];
  [(RecentlyViewedDataSource *)self _loadContent];
}

- (void)_loadContent
{
  v3 = +[Recents sharedRecents];
  objc_super v4 = [v3 orderedRecents];
  v5 = (NSArray *)[v4 copy];
  recentsContent = self->_recentsContent;
  self->_recentsContent = v5;

  [(RecentlyViewedDataSource *)self _buildContent];
  if ([(DataSource *)self active])
  {
    id v7 = [(DataSource *)self delegate];
    [v7 dataSourceUpdated:self];
  }
}

- (void)_buildContent
{
  v11 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(NSArray *)self->_recentsContent copy];
  id v2 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v20;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v20 != v3) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v6 = [v5 historyEntry];
        uint64_t v13 = 0;
        v14 = &v13;
        uint64_t v15 = 0x3032000000;
        v16 = sub_1001043F0;
        v17 = sub_100104A68;
        id v18 = 0;
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100B97710;
        v12[3] = &unk_1012F8798;
        v12[4] = &v13;
        [v6 ifSearch:0 ifRoute:0 ifPlaceDisplay:v12 ifTransitLineItem:0];
        if (v14[5]) {
          [v11 addObject:v5];
        }
        _Block_object_dispose(&v13, 8);
      }
      id v2 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v2);
  }

  id v7 = (NSArray *)[v11 copy];
  recents = self->_recents;
  self->_recents = v7;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  if (((unint64_t)[v4 row] & 0x8000000000000000) != 0
    || (id v5 = [v4 row], v5 >= (id)-[NSArray count](self->_recents, "count")))
  {
    id v6 = 0;
  }
  else
  {
    id v6 = -[NSArray objectAtIndexedSubscript:](self->_recents, "objectAtIndexedSubscript:", [v4 row]);
  }

  return v6;
}

- (id)mapItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(RecentlyViewedDataSource *)self objectAtIndexPath:v4];
  id v6 = [v5 historyEntry];

  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_1001043F0;
  v14 = sub_100104A68;
  id v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100B9798C;
  v9[3] = &unk_1012F8798;
  v9[4] = &v10;
  [v6 ifSearch:0 ifRoute:0 ifPlaceDisplay:v9 ifTransitLineItem:0];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)removeItemAtIndexPath:(id)a3
{
  uint64_t v3 = [(RecentlyViewedDataSource *)self objectAtIndexPath:a3];
  id v4 = +[Recents sharedRecents];
  id v6 = v3;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v4 deleteRecents:v5 completion:&stru_10131A270];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_recents count] != 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_recents count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(RecentlyViewedDataSource *)self mapItemAtIndexPath:v6];
  v9 = +[TwoLinesTableViewCell identifier];
  uint64_t v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  v11 = +[TwoLinesContentViewModelComposer cellModelForMapItem:v8];
  [v10 setViewModel:v11];

  [v10 setAccessoryViewDelegate:self];
  [v10 setAccessoryViewObject:v8];
  [v10 setAccessoryViewType:self->_showAddAccessory];

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  id v6 = [SectionHeaderTableViewHeaderFooterView alloc];
  id v7 = +[NSBundle mainBundle];
  uint64_t v8 = [v7 localizedStringForKey:@"[RecentlyViewed] RecentlyViewed" value:@"localized string not found" table:0];
  id v9 = [v5 _maps_indexOfFirstNonEmptySection];

  uint64_t v10 = [(SectionHeaderTableViewHeaderFooterView *)v6 initWithTitle:v8 isFirstNonEmptySection:v9 == (id)a4];
  [(SectionHeaderTableViewHeaderFooterView *)v10 setAccessibilityIdentifiersWithBaseString:@"RecentlyViewed"];

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 _maps_indexOfFirstNonEmptySection] == a4;
  id v7 = +[NSBundle mainBundle];
  uint64_t v8 = [v7 localizedStringForKey:@"[RecentlyViewed] RecentlyViewed" value:@"localized string not found" table:0];
  [v5 bounds];
  double Width = CGRectGetWidth(v14);
  uint64_t v10 = [v5 traitCollection];

  +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:v6 title:v8 actionTitle:0 availableWidth:v10 traitCollection:Width];
  double v12 = v11;

  return v12;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v4 = [a3 cellForRowAtIndexPath:a4];
  BOOL v5 = ![v4 conformsToProtocol:&OBJC_PROTOCOL___AutocompleteCellAccessoryView]
    || [v4 accessoryViewType] != (id)3;

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [(RecentlyViewedDataSource *)self mapItemAtIndexPath:v6];
  uint64_t v8 = [(DataSource *)self delegate];
  [v8 dataSource:self itemTapped:v11];

  [v7 deselectRowAtIndexPath:v6 animated:1];
  id v9 = [v7 cellForRowAtIndexPath:v6];

  if ([v9 conformsToProtocol:&OBJC_PROTOCOL___AutocompleteCellAccessoryView])
  {
    id v10 = v9;
    if ([v10 accessoryViewType] == (id)1) {
      [v10 setAccessoryViewType:3];
    }
  }
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

- (void)didTapOnAccessoryView:(id)a3 withType:(int64_t)a4 object:(id)a5
{
  id v16 = a3;
  id v8 = a5;
  if (a4 == 4 || a4 == 1)
  {
    id v9 = [(DataSource *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(DataSource *)self delegate];
      [v11 searchDataSource:self addItem:v8];
    }
    double v12 = +[UIButton buttonWithType:0];
    [v12 setBounds:0.0, 0.0, 30.0, 30.0];
    uint64_t v13 = +[UIImage systemImageNamed:@"checkmark"];
    [v12 setImage:v13 forState:0];

    CGRect v14 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
    [v12 setPreferredSymbolConfiguration:v14 forImageInState:0];

    id v15 = +[UIColor secondaryLabelColor];
    [v12 setTintColor:v15];

    [v12 setAccessibilityIdentifier:@"AccessoryCheckmarkButton"];
    [v16 setAccessoryView:v12];
  }
}

- (BOOL)showAddAccessory
{
  return self->_showAddAccessory;
}

- (void)setShowAddAccessory:(BOOL)a3
{
  self->_showAddAccessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recents, 0);

  objc_storeStrong((id *)&self->_recentsContent, 0);
}

@end