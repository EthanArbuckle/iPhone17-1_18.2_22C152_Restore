@interface MyShortcutsDataSource
- (BOOL)editing;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (MyShortcutsDataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4;
- (NSString)uniqueName;
- (ShareDelegate)shareDelegate;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)currentContent;
- (id)currentSuggestions;
- (id)deleteContextualActionForIndexPath:(id)a3;
- (id)keyCommands;
- (id)objectAtIndexPath:(id)a3;
- (id)objectsForAnalytics;
- (id)shareContextualActionAtIndexPath:(id)a3;
- (id)shortcutManager;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int)targetForDragAnalytics;
- (int64_t)_numberOfSectionsWhenNotEditing;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)indexFirstAvailableMove;
- (void)_loadContentAndSuggestions;
- (void)_touchMapsSuggestionsEngine;
- (void)_updateContent:(id)a3;
- (void)_updateKeyCommandsAtIndexPath:(id)a3;
- (void)_updateSuggestions:(id)a3;
- (void)didTapOnAccessoryView:(id)a3 withType:(int64_t)a4 object:(id)a5;
- (void)editIndexPath:(id)a3;
- (void)editItem:(id)a3;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4;
- (void)reloadDataIfNeeded;
- (void)reloadDataIfPossible;
- (void)removeIndexPath:(id)a3;
- (void)removeItem:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setShareDelegate:(id)a3;
- (void)shareRow:(id)a3;
- (void)shareRowAtIndexPath:(id)a3 completion:(id)a4;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didCancelReorderingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndReorderingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)tableView:(id)a3 willBeginReorderingRowAtIndexPath:(id)a4;
@end

@implementation MyShortcutsDataSource

- (MyShortcutsDataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MyShortcutsDataSource;
  v7 = [(DataSource *)&v12 initWithTableView:v6 updateLocation:v4];
  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    v9 = +[TwoLinesTableViewCell identifier];
    [v6 registerClass:v8 forCellReuseIdentifier:v9];

    v10 = +[MapsFavoritesManager sharedManager];
    [v10 registerObserver:v7];

    [(MyShortcutsDataSource *)v7 _loadContentAndSuggestions];
  }

  return v7;
}

- (void)_loadContentAndSuggestions
{
  objc_initWeak(&location, self);
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100C32E58;
    block[3] = &unk_1012E6708;
    v3 = &v14;
    objc_copyWeak(&v14, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    BOOL v4 = +[MapsFavoritesManager sharedManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100C32ED0;
    v11[3] = &unk_1012E6E78;
    v5 = &v12;
    objc_copyWeak(&v12, &location);
    [v4 proposePlacesForTypeWithType:0 completionHandler:v11];
  }
  else
  {
    id v6 = [(MyShortcutsDataSource *)self shortcutManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100C32FE0;
    v9[3] = &unk_1012E6E78;
    v3 = &v10;
    objc_copyWeak(&v10, &location);
    [v6 loadAllShortcutsWithHandler:v9];

    BOOL v4 = [(MyShortcutsDataSource *)self shortcutManager];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100C330F0;
    v7[3] = &unk_1012E6E78;
    v5 = &v8;
    objc_copyWeak(&v8, &location);
    [v4 proposeAdditionalShortcutsOfType:0 handler:v7];
  }

  objc_destroyWeak(v5);
  objc_destroyWeak(v3);
  objc_destroyWeak(&location);
}

- (void)_updateContent:(id)a3
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &__NSArray0__struct;
  }
  v5 = (NSArray *)[v4 copy];
  content = self->_content;
  self->_content = v5;

  [(MyShortcutsDataSource *)self reloadDataIfPossible];
}

- (void)_updateSuggestions:(id)a3
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &__NSArray0__struct;
  }
  v5 = (NSArray *)[v4 copy];
  suggestions = self->_suggestions;
  self->_suggestions = v5;

  [(MyShortcutsDataSource *)self reloadDataIfPossible];
}

- (id)shortcutManager
{
  v2 = self;
  objc_sync_enter(v2);
  shortcutManager = v2->_shortcutManager;
  if (!shortcutManager)
  {
    id v4 = sub_100018584();
    v5 = [v4 oneFavorites];
    [v5 registerMeCardObserver:v2];

    uint64_t v6 = [v4 oneFavorites];
    v7 = v2->_shortcutManager;
    v2->_shortcutManager = (MapsSuggestionsShortcutManager *)v6;

    shortcutManager = v2->_shortcutManager;
  }
  id v8 = shortcutManager;
  objc_sync_exit(v2);

  return v8;
}

- (void)_touchMapsSuggestionsEngine
{
  sub_100018584();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 hintRefreshOfType:18];
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    v5 = [(DataSource *)self tableView];
    [v5 setEditing:self->_editing animated:1];

    int64_t v6 = [(MyShortcutsDataSource *)self _numberOfSectionsWhenNotEditing];
    v7 = [(DataSource *)self tableView];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100C334A0;
    v8[3] = &unk_1012E8FA8;
    BOOL v9 = a3;
    v8[4] = self;
    v8[5] = v6;
    [v7 performBatchUpdates:v8 completion:0];
  }
}

- (id)currentContent
{
  id v2 = [(NSArray *)self->_content copy];

  return v2;
}

- (id)currentSuggestions
{
  id v2 = [(NSArray *)self->_suggestions copy];

  return v2;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  if (![v4 section])
  {
    v5 = [(MyShortcutsDataSource *)self currentContent];
    id v6 = [v5 copy];

    if (((unint64_t)[v4 row] & 0x8000000000000000) == 0)
    {
      id v7 = [v4 row];
      if (v7 < [v6 count]) {
        goto LABEL_8;
      }
    }
  }
  if ([v4 section] != (id)1)
  {
    id v10 = 0;
    goto LABEL_12;
  }
  id v8 = [(MyShortcutsDataSource *)self currentSuggestions];
  id v6 = [v8 copy];

  if (((unint64_t)[v4 row] & 0x8000000000000000) != 0
    || (id v9 = [v4 row], v9 >= objc_msgSend(v6, "count")))
  {
    id v10 = 0;
    goto LABEL_11;
  }
LABEL_8:
  id v10 = [v6 objectAtIndexedSubscript:[v4 row]];
LABEL_11:

LABEL_12:

  return v10;
}

- (unint64_t)indexFirstAvailableMove
{
  id v2 = [(MyShortcutsDataSource *)self currentContent];
  id v3 = [v2 copy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      id v9 = 0;
      unint64_t v10 = (unint64_t)v6 + v7;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v9);
        if (+[LibraryUIUtilities isMyPlacesEnabled])
        {
          if (([v11 isSetupPlaceholder] & 1) == 0) {
            goto LABEL_14;
          }
        }
        else if ([v11 type] == (id)1 || objc_msgSend(v11, "type") == (id)6)
        {
LABEL_14:
          unint64_t v10 = (unint64_t)v9 + v7;
          goto LABEL_16;
        }
        id v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      unint64_t v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
LABEL_16:

  return v10;
}

- (void)reloadDataIfPossible
{
  id v3 = [(DataSource *)self tableView];
  if ([v3 hasUncommittedUpdates])
  {

LABEL_4:
    self->_needsReloadData = 1;
    return;
  }
  BOOL reordering = self->_reordering;

  if (reordering) {
    goto LABEL_4;
  }
  self->_needsReloadData = 0;
  id v5 = [(DataSource *)self delegate];
  [v5 dataSourceUpdated:self];
}

- (void)reloadDataIfNeeded
{
  if (self->_needsReloadData) {
    [(MyShortcutsDataSource *)self reloadDataIfPossible];
  }
}

- (id)objectsForAnalytics
{
  return 0;
}

- (int)targetForDragAnalytics
{
  return 0;
}

- (void)didTapOnAccessoryView:(id)a3 withType:(int64_t)a4 object:(id)a5
{
  id v21 = a3;
  id v8 = a5;
  id v9 = v8;
  if (a4 == 4 || a4 == 1)
  {
    id v10 = v8;
    if (v10)
    {
      v11 = +[ShortcutEditSession addSessionWithShortcut:v10];
      id v12 = [(DataSource *)self delegate];
      [v12 dataSource:self itemTapped:v11];

      id v13 = v10;
      if ([v13 type] == (id)6)
      {
        long long v14 = [v13 identifier];
        unsigned int v15 = [v14 isEqualToString:@"NearbyTransit"];

        if (v15) {
          uint64_t v16 = 211;
        }
        else {
          uint64_t v16 = 2054;
        }
      }
      else
      {

        uint64_t v16 = 2054;
      }
    }
    else
    {
      uint64_t v16 = 2054;
    }
    v17 = +[UIButton buttonWithType:0];
    [v17 setBounds:0.0, 0.0, 30.0, 30.0];
    v18 = +[UIImage systemImageNamed:@"checkmark"];
    [v17 setImage:v18 forState:0];

    v19 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
    [v17 setPreferredSymbolConfiguration:v19 forImageInState:0];

    v20 = +[UIColor secondaryLabelColor];
    [v17 setTintColor:v20];

    [v17 setAccessibilityIdentifier:@"AccessoryCheckmarkButton"];
    [v21 setAccessoryView:v17];

    +[GEOAPPortal captureUserAction:v16 target:254 value:0];
  }
}

- (void)editIndexPath:(id)a3
{
  id v8 = a3;
  id v4 = [(MyShortcutsDataSource *)self objectAtIndexPath:v8];
  if ([v8 section]) {
    +[ShortcutEditSession addSessionWithShortcut:v4];
  }
  else {
  id v5 = +[ShortcutEditSession editSessionWithShortcut:v4];
  }
  id v6 = [(DataSource *)self delegate];
  [v6 dataSource:self itemTapped:v5];

  if ([v8 section]) {
    uint64_t v7 = 2054;
  }
  else {
    uint64_t v7 = 2055;
  }
  +[GEOAPPortal captureUserAction:v7 target:254 value:0];
}

- (void)removeIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MyShortcutsDataSource *)self objectAtIndexPath:v4];
  if (v5)
  {
    id v6 = +[ShortcutEditSession editSessionWithShortcut:v5];
    objc_initWeak(&location, self);
    uint64_t v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    id v9 = sub_100C33D34;
    id v10 = &unk_1012E6998;
    objc_copyWeak(&v11, &location);
    [v6 removeFromShortcutsWithCompletion:&v7];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2056, 254, 0, v7, v8, v9, v10);
}

- (void)shareRowAtIndexPath:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v16 = [(MyShortcutsDataSource *)self objectAtIndexPath:v7];
  uint64_t v8 = [v16 geoMapItem];
  id v9 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v8 isPlaceHolderPlace:0];
  id v10 = [[SearchResult alloc] initWithMapItem:v9];
  id v11 = [(SearchResult *)v10 unknownContact];
  id v12 = +[ShareItem shareItemWithSearchResult:v10 contact:v11 includePrintActivity:1];

  id v13 = [(MyShortcutsDataSource *)self shareDelegate];
  long long v14 = [(DataSource *)self tableView];
  unsigned int v15 = [v14 cellForRowAtIndexPath:v7];

  [v13 shareItem:v12 sourceView:v15 completion:v6];
  +[GEOAPPortal captureUserAction:2057 target:254 value:0];
}

- (void)editItem:(id)a3
{
  id v4 = [a3 cell_IndexPath];
  if (v4)
  {
    id v5 = v4;
    [(MyShortcutsDataSource *)self editIndexPath:v4];
    id v4 = v5;
  }
}

- (void)removeItem:(id)a3
{
  id v4 = [a3 cell_IndexPath];
  if (v4)
  {
    id v5 = v4;
    [(MyShortcutsDataSource *)self removeIndexPath:v4];
    id v4 = v5;
  }
}

- (void)shareRow:(id)a3
{
  id v4 = [a3 cell_IndexPath];
  if (v4)
  {
    id v5 = v4;
    [(MyShortcutsDataSource *)self shareRowAtIndexPath:v4 completion:0];
    id v4 = v5;
  }
}

- (void)_updateKeyCommandsAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section] != (id)1)
  {
    id v5 = [(DataSource *)self tableView];
    uint64_t v6 = sub_1000BBB44(v5);

    id v7 = &__NSArray0__struct;
    if (v4 && v6 != 5)
    {
      uint64_t v8 = [(MyShortcutsDataSource *)self objectAtIndexPath:v4];
      id v9 = [v8 geoMapItem];

      if (v9)
      {
        id v10 = sub_100A4B690((uint64_t)"removeItem:", v4);
        v16[0] = v10;
        id v11 = sub_100A4B820((uint64_t)"editItem:", v4);
        v16[1] = v11;
        id v12 = sub_100A4B9B0((uint64_t)"shareRow:", v4);
        v16[2] = v12;
        id v7 = +[NSArray arrayWithObjects:v16 count:3];
      }
      else
      {
        id v10 = sub_100A4B820((uint64_t)"editItem:", v4);
        v15[0] = v10;
        id v11 = sub_100A4B690((uint64_t)"removeItem:", v4);
        v15[1] = v11;
        id v7 = +[NSArray arrayWithObjects:v15 count:2];
      }
    }
    id v13 = [v7 copy:v15[0]];
    keyCommands = self->_keyCommands;
    self->_keyCommands = v13;
  }
}

- (int64_t)_numberOfSectionsWhenNotEditing
{
  id v2 = [(MyShortcutsDataSource *)self currentSuggestions];
  if ([v2 count]) {
    int64_t v3 = 2;
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_editing) {
    return 1;
  }
  else {
    return [(MyShortcutsDataSource *)self _numberOfSectionsWhenNotEditing];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    [(MyShortcutsDataSource *)self currentSuggestions];
  }
  else {
  id v4 = [(MyShortcutsDataSource *)self currentContent];
  }
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(MyShortcutsDataSource *)self objectAtIndexPath:v6];
  id v9 = +[TwoLinesTableViewCell identifier];
  id v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  id v11 = +[TwoLinesContentViewModelComposer cellModelForMapsSuggestionsShortcut:v8];
  [v10 setViewModel:v11];

  [v10 setAccessoryViewDelegate:self];
  [v10 setAccessoryViewObject:v8];
  LODWORD(self) = +[LibraryUIUtilities isMyPlacesEnabled];
  id v12 = [v6 section];
  if (self) {
    uint64_t v13 = 4 * (v12 == (id)1);
  }
  else {
    uint64_t v13 = v12 == (id)1;
  }
  [v10 setAccessoryViewType:v13];
  if ([v6 section] || (objc_msgSend(v8, "isSetupPlaceholder") & 1) != 0) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = 4 * ([v8 type] != (id)6);
  }
  [v10 setAccessoryType:v14];

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = (SectionHeaderTableViewHeaderFooterView *)a4;
  if (a4)
  {
    id v5 = a3;
    id v6 = [SectionHeaderTableViewHeaderFooterView alloc];
    id v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"[Shortcuts] Siri Suggestions" value:@"localized string not found" table:0];
    id v4 = [SectionHeaderTableViewHeaderFooterView initWithTitle:v8 isFirstNonEmptySection:[v5 _maps_indexOfFirstNonEmptySection] == v4];

    [(SectionHeaderTableViewHeaderFooterView *)v4 setAccessibilityIdentifiersWithBaseString:@"SiriSuggestions"];
    id v9 = [v5 style];

    [(SectionHeaderTableViewHeaderFooterView *)v4 setShowsBottomHairline:v9 != (id)2];
  }

  return v4;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (!a4) {
    return 0.0;
  }
  id v5 = a3;
  BOOL v6 = [v5 _maps_indexOfFirstNonEmptySection] == a4;
  id v7 = +[NSBundle mainBundle];
  uint64_t v8 = [v7 localizedStringForKey:@"[Shortcuts] Siri Suggestions" value:@"localized string not found" table:0];
  [v5 bounds];
  double Width = CGRectGetWidth(v14);
  id v10 = [v5 traitCollection];

  +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:v6 title:v8 actionTitle:0 availableWidth:v10 traitCollection:Width];
  double v12 = v11;

  return v12;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v6 = a4;
  if ([a3 isEditing] && !objc_msgSend(v6, "section"))
  {
    id v9 = [(MyShortcutsDataSource *)self objectAtIndexPath:v6];
    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      if ([v9 isSetupPlaceholder])
      {
        LOBYTE(v7) = 0;
LABEL_11:

        goto LABEL_4;
      }
    }
    else
    {
      unint64_t v10 = (unint64_t)[v9 type];
      if (v10 < 6)
      {
        unsigned int v7 = (0x13u >> v10) & 1;
        goto LABEL_11;
      }
    }
    LOBYTE(v7) = 1;
    goto LABEL_11;
  }
  LOBYTE(v7) = 0;
LABEL_4:

  return v7;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v6 = a5;
  if ([v6 section] != (id)1)
  {
    unsigned int v7 = [(MyShortcutsDataSource *)self objectAtIndexPath:v6];
    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      if (![v7 isSetupPlaceholder])
      {
LABEL_5:
        id v9 = v6;
        goto LABEL_10;
      }
    }
    else
    {
      unint64_t v10 = (unint64_t)[v7 type];
      if (v10 > 5 || ((1 << v10) & 0x2C) == 0) {
        goto LABEL_5;
      }
    }
    uint64_t v8 = [(MyShortcutsDataSource *)self indexFirstAvailableMove];
    goto LABEL_9;
  }
  unsigned int v7 = [(MyShortcutsDataSource *)self currentContent];
  uint64_t v8 = (char *)[v7 count] - 1;
LABEL_9:
  id v9 = +[NSIndexPath indexPathForRow:v8 inSection:0];
LABEL_10:
  double v11 = v9;

  return v11;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(MyShortcutsDataSource *)self objectAtIndexPath:v9];
  double v12 = [(MyShortcutsDataSource *)self currentContent];
  id v13 = [v12 copy];

  CGRect v14 = [(MyShortcutsDataSource *)self currentContent];
  id v15 = [v14 mutableCopy];

  [v15 removeObjectAtIndex:[v9 row]];
  [v15 insertObject:v11 atIndex:[v10 row]];
  id v16 = (NSArray *)[v15 copy];
  content = self->_content;
  self->_content = v16;

  objc_initWeak(&location, self);
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v18 = v11;
    id v19 = [v10 row];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100C34AB4;
    v24[3] = &unk_101316D00;
    objc_copyWeak(&v25, &location);
    [v18 moveToIndex:v19 with:v13 completion:v24];
    objc_destroyWeak(&v25);
  }
  else
  {
    v20 = [(MyShortcutsDataSource *)self shortcutManager];
    id v21 = [v10 row];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100C34BCC;
    v22[3] = &unk_1012E6998;
    objc_copyWeak(&v23, &location);
    [v20 moveShortcut:v11 toIndex:v21 withSnapshot:v13 handler:v22];

    objc_destroyWeak(&v23);
  }
  objc_destroyWeak(&location);
}

- (void)tableView:(id)a3 willBeginReorderingRowAtIndexPath:(id)a4
{
  self->_BOOL reordering = 1;
}

- (void)tableView:(id)a3 didEndReorderingRowAtIndexPath:(id)a4
{
  self->_BOOL reordering = 0;
  [(MyShortcutsDataSource *)self reloadDataIfNeeded];
}

- (void)tableView:(id)a3 didCancelReorderingRowAtIndexPath:(id)a4
{
  self->_BOOL reordering = 0;
  [(MyShortcutsDataSource *)self reloadDataIfNeeded];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = [a3 isEditing] && ![v5 section];

  return v6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v4 = [a3 cellForRowAtIndexPath:a4];
  BOOL v5 = ![v4 conformsToProtocol:&OBJC_PROTOCOL___AutocompleteCellAccessoryView]
    || [v4 accessoryViewType] != (id)3;

  return v5;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v12 = a3;
  unsigned int v7 = [a4 nextFocusedItem];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v12 indexPathForCell:v7], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = (void *)v8;
    [(MyShortcutsDataSource *)self _updateKeyCommandsAtIndexPath:v8];
    id v10 = [(DataSource *)self delegate];
    double v11 = [(MyShortcutsDataSource *)self objectAtIndexPath:v9];
    [v10 dataSource:self itemFocused:v11];
  }
  else
  {
    [(MyShortcutsDataSource *)self _updateKeyCommandsAtIndexPath:0];
    id v9 = [(DataSource *)self delegate];
    [v9 dataSource:self itemFocused:0];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v24 = a4;
  id v6 = a3;
  unsigned int v7 = [(MyShortcutsDataSource *)self objectAtIndexPath:v24];
  uint64_t v8 = [(DataSource *)self tableView];
  if ([v8 isEditing])
  {

LABEL_4:
    if ([v24 section]) {
      +[ShortcutEditSession addSessionWithShortcut:v7];
    }
    else {
    id v10 = +[ShortcutEditSession editSessionWithShortcut:v7];
    }
    double v11 = [(DataSource *)self delegate];
    [v11 dataSource:self itemTapped:v10];

    id v12 = v7;
    if ([v12 type] != (id)6)
    {

      goto LABEL_15;
    }
    id v13 = [v12 identifier];
    unsigned int v14 = [v13 isEqualToString:@"NearbyTransit"];

    if (!v14)
    {
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v15 = 211;
LABEL_10:
    +[GEOAPPortal captureUserAction:v15 target:254 value:0];
    goto LABEL_15;
  }
  id v9 = [v24 section];

  if (v9 == (id)1) {
    goto LABEL_4;
  }
  id v16 = [v7 geoMapItem];
  if (v16)
  {

LABEL_14:
    id v10 = [(DataSource *)self delegate];
    [v10 dataSource:self itemTapped:v7];
    goto LABEL_15;
  }
  id v19 = v7;
  if ([v19 type] == (id)6)
  {
    v20 = [v19 identifier];
    unsigned __int8 v21 = [v20 isEqualToString:@"NearbyTransit"];

    if (v21) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  if ([v19 isSetupPlaceholder])
  {
    id v10 = +[ShortcutEditSession addSessionWithShortcut:v19];
    v22 = [(DataSource *)self delegate];
    [v22 dataSource:self itemTapped:v10];

    id v23 = [v19 type];
    if (v23 == (id)2)
    {
      uint64_t v15 = 2042;
    }
    else
    {
      if (v23 != (id)3) {
        goto LABEL_15;
      }
      uint64_t v15 = 2043;
    }
    goto LABEL_10;
  }
LABEL_16:
  [v6 deselectRowAtIndexPath:v24 animated:1];
  v17 = [v6 cellForRowAtIndexPath:v24];

  if ([v17 conformsToProtocol:&OBJC_PROTOCOL___AutocompleteCellAccessoryView])
  {
    id v18 = v17;
    if ([v18 accessoryViewType] == (id)1) {
      [v18 setAccessoryViewType:3];
    }
  }
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
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

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  uint64_t v8 = v7;
  if (a4 == 1)
  {
    id v10 = v7;
    id v9 = [v7 section];
    uint64_t v8 = v10;
    if (!v9)
    {
      [(MyShortcutsDataSource *)self removeIndexPath:v10];
      uint64_t v8 = v10;
    }
  }
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section] == (id)1)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [(MyShortcutsDataSource *)self deleteContextualActionForIndexPath:v5];
    id v16 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v16 count:1];

    id v9 = [(MyShortcutsDataSource *)self objectAtIndexPath:v5];
    id v10 = [v9 geoMapItem];

    if (v10)
    {
      double v11 = [(MyShortcutsDataSource *)self deleteContextualActionForIndexPath:v5];
      id v12 = -[MyShortcutsDataSource shareContextualActionAtIndexPath:](self, "shareContextualActionAtIndexPath:", v5, v11);
      v15[1] = v12;
      uint64_t v13 = +[NSArray arrayWithObjects:v15 count:2];

      uint64_t v8 = (void *)v13;
    }
    id v6 = +[UISwipeActionsConfiguration configurationWithActions:v8];
  }

  return v6;
}

- (id)deleteContextualActionForIndexPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100C354A0;
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
  v8[2] = sub_100C35614;
  v8[3] = &unk_1012F2E50;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = sub_100B7EA98(v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (NSString)uniqueName
{
  id v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C35750;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100C35838;
  v3[3] = &unk_1012E6708;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)keyCommands
{
  return self->_keyCommands;
}

- (BOOL)editing
{
  return self->_editing;
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
  objc_storeStrong((id *)&self->_selected, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_shortcutManager, 0);
}

@end