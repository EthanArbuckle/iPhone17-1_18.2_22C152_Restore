@interface HomeOutlineFavoritesSectionController
- (BOOL)_accessoryVisiblityForEntry:(id)a3;
- (BOOL)_accessoryVisiblityForFavorite:(id)a3;
- (BOOL)_isCopyOperationWithDropSession:(id)a3;
- (BOOL)_isMoveOperationWithDropSession:(id)a3;
- (BOOL)_shouldShowAccessoryForEntry:(id)a3;
- (BOOL)_shouldShowAccessoryForFavorite:(id)a3;
- (BOOL)_shouldShowAddButtonForItemSnapshots:(id)a3;
- (BOOL)persistsExpansions;
- (BOOL)shouldClearSelectionWithReason:(id)a3;
- (HomeOutlineFavoritesSectionController)initWithConfiguration:(id)a3 favoritesDataProvider:(id)a4 libraryCountsDataProvider:(id)a5;
- (HomeOutlineFavoritesSectionController)initWithConfiguration:(id)a3 suggestionsDataProvider:(id)a4;
- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel;
- (NSArray)dataProviders;
- (NSArray)itemSnapshots;
- (SuggestionsDataProvider)suggestionsDataProvider;
- (id)_entries;
- (id)_entriesLegacy;
- (id)_shortcutForNodeSnapshot:(id)a3;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)contextMenuForSnapshot:(id)a3;
- (id)shareItemSourceForSnapshot:(id)a3;
- (id)sourceViewForProfileTipPopover;
- (int64_t)_firstValidMoveIndexForFavorites:(id)a3;
- (int64_t)_headerNodeCount;
- (void)_addFavorite;
- (void)_animateMoveOfShortcut:(id)a3 toIndex:(unint64_t)a4 dropCoordinator:(id)a5;
- (void)_deleteSnapshot:(id)a3;
- (void)_editEntrySnapshot:(id)a3;
- (void)_endEditSession;
- (void)_openSnapshot:(id)a3 inNewTab:(BOOL)a4;
- (void)_performCopyWithDropCoordinator:(id)a3;
- (void)_performMoveWithDropCoordinator:(id)a3;
- (void)_startEditSessionForShortcut:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
- (void)sectionHeaderOutlineCell:(id)a3 accessoryTypeTapped:(int64_t)a4;
- (void)smallButtonOutlineCellTapped:(id)a3;
- (void)twoLinesOutlineCell:(id)a3 accessoryViewTapped:(id)a4 accessoryModel:(id)a5;
@end

@implementation HomeOutlineFavoritesSectionController

- (HomeOutlineFavoritesSectionController)initWithConfiguration:(id)a3 suggestionsDataProvider:(id)a4
{
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HomeOutlineFavoritesSectionController;
  v8 = [(HomeOutlineSectionController *)&v19 initWithConfiguration:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_suggestionsDataProvider, a4);
    v10 = objc_alloc_init(MeCardDataProvider);
    meCardDataProvider = v9->_meCardDataProvider;
    v9->_meCardDataProvider = v10;

    uint64_t v12 = +[NSMutableArray array];
    dropShortcutEditSessions = v9->_dropShortcutEditSessions;
    v9->_dropShortcutEditSessions = (NSMutableArray *)v12;

    uint64_t v14 = +[NSMutableArray array];
    deleteShortcutEditSessions = v9->_deleteShortcutEditSessions;
    v9->_deleteShortcutEditSessions = (NSMutableArray *)v14;

    uint64_t v16 = +[ShortcutManager sharedManager];
    shortcutManager = v9->_shortcutManager;
    v9->_shortcutManager = (ShortcutManager *)v16;
  }
  return v9;
}

- (HomeOutlineFavoritesSectionController)initWithConfiguration:(id)a3 favoritesDataProvider:(id)a4 libraryCountsDataProvider:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HomeOutlineFavoritesSectionController;
  v11 = [(HomeOutlineSectionController *)&v18 initWithConfiguration:a3];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_favoritesDataProvider, a4);
    objc_storeStrong((id *)&v12->_libraryCountsDataProvider, a5);
    uint64_t v13 = +[NSMutableArray array];
    dropShortcutEditSessions = v12->_dropShortcutEditSessions;
    v12->_dropShortcutEditSessions = (NSMutableArray *)v13;

    uint64_t v15 = +[NSMutableArray array];
    deleteShortcutEditSessions = v12->_deleteShortcutEditSessions;
    v12->_deleteShortcutEditSessions = (NSMutableArray *)v15;
  }
  return v12;
}

- (NSArray)dataProviders
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    v3 = &OBJC_IVAR___HomeOutlineFavoritesSectionController__libraryCountsDataProvider;
    favoritesDataProvider = self->_favoritesDataProvider;
    p_favoritesDataProvider = &favoritesDataProvider;
  }
  else
  {
    v3 = &OBJC_IVAR___HomeOutlineFavoritesSectionController__meCardDataProvider;
    suggestionsDataProvider = self->_suggestionsDataProvider;
    p_favoritesDataProvider = (_TtC4Maps20MapsFavoritesManager **)&suggestionsDataProvider;
  }
  p_favoritesDataProvider[1] = *(_TtC4Maps20MapsFavoritesManager **)((char *)&self->super.super.isa + *v3);
  v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:");

  return (NSArray *)v5;
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = sub_1000AA148();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "home Data ProvidingObject Did Update: %@", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)HomeOutlineFavoritesSectionController;
  [(HomeOutlineSectionController *)&v6 homeDataProvidingObjectDidUpdate:v4];
}

- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel
{
  unsigned int v3 = +[LibraryUIUtilities isMyPlacesEnabled];
  id v4 = [SectionHeaderAddOutlineCellModel alloc];
  v5 = +[NSBundle mainBundle];
  objc_super v6 = v5;
  if (v3) {
    CFStringRef v7 = @"[Proactive Tray] Library Section";
  }
  else {
    CFStringRef v7 = @"[Proactive Tray] Favorites Section";
  }
  id v8 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];
  id v9 = [(SectionHeaderAddOutlineCellModel *)v4 initWithTitle:v8 accessoryDelegate:self];

  return (MapsUIDiffableDataSourceViewModel *)v9;
}

- (NSArray)itemSnapshots
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    unsigned int v3 = [(MapsFavoritesManager *)self->_favoritesDataProvider shortcutsForMapsHome];
    id v4 = +[NSMutableArray arrayWithArray:v3];

    [v4 addObject:@"kLibraryCellIdentifier"];
    v5 = [(HomeOutlineSectionController *)self configuration];
    objc_super v6 = [v5 sectionIdentifier];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100A625EC;
    v27[3] = &unk_101315788;
    v27[4] = self;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100A627D0;
    v26[3] = &unk_1013157B0;
    v26[4] = self;
    CFStringRef v7 = +[HomeOutlineSectionBuilder itemSnapshotsWithItems:v4 sectionIdentifier:v6 sectionExpanded:[(HomeOutlineSectionController *)self expanded] itemIdentifierBlock:v27 viewModelBlock:v26 childItemsBlock:&stru_1013157F0 expandedBlock:&stru_101315830];

    if (![(HomeOutlineFavoritesSectionController *)self _shouldShowAddButtonForItemSnapshots:v7])goto LABEL_7; {
    id v8 = +[NSBundle mainBundle];
    }
    id v9 = v8;
    CFStringRef v10 = @"[Proactive Tray Mac] Add Pin";
  }
  else
  {
    id v4 = [(HomeOutlineFavoritesSectionController *)self _entriesLegacy];
    v11 = [(HomeOutlineSectionController *)self configuration];
    uint64_t v12 = [v11 sectionIdentifier];
    v24[4] = self;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100A62B28;
    v25[3] = &unk_101315858;
    v25[4] = self;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100A62B94;
    v24[3] = &unk_101315880;
    CFStringRef v7 = +[HomeOutlineSectionBuilder itemSnapshotsWithItems:v4 sectionIdentifier:v12 sectionExpanded:[(HomeOutlineSectionController *)self expanded] itemIdentifierBlock:v25 viewModelBlock:v24 childItemsBlock:&stru_1013158A0 expandedBlock:&stru_1013158C0];

    if (![(HomeOutlineFavoritesSectionController *)self _shouldShowAddButtonForItemSnapshots:v7])goto LABEL_7; {
    id v8 = +[NSBundle mainBundle];
    }
    id v9 = v8;
    CFStringRef v10 = @"[Proactive Tray] Add Favorite";
  }
  uint64_t v13 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];

  uint64_t v14 = [SmallButtonOutlineCellModel alloc];
  uint64_t v15 = +[UIImage systemImageNamed:@"plus.circle"];
  uint64_t v16 = +[UIImage systemImageNamed:@"plus.circle.fill"];
  v17 = [(SmallButtonOutlineCellModel *)v14 initWithStyle:1 title:v13 image:v15 hoverImage:v16 delegate:self];

  objc_super v18 = [MapsUIDiffableDataSourceOutlineNodeSnapshot alloc];
  objc_super v19 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
  v20 = [v19 identifierPathByAppendingIdentifier:@"AddButtonIdentifier"];
  v21 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v18 initWithIdentifierPath:v20 viewModel:v17 childSnapshots:&__NSArray0__struct expanded:0];

  uint64_t v22 = [v7 arrayByAddingObject:v21];

  CFStringRef v7 = (void *)v22;
LABEL_7:

  return (NSArray *)v7;
}

- (BOOL)shouldClearSelectionWithReason:(id)a3
{
  return 1;
}

- (id)sourceViewForProfileTipPopover
{
  unsigned int v3 = [(HomeOutlineSectionController *)self delegate];
  id v4 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
  v5 = [v3 sectionController:self indexPathForIdentifierPath:v4];

  objc_super v6 = [(HomeOutlineSectionController *)self configuration];
  CFStringRef v7 = [v6 collectionView];
  id v8 = [v7 cellForItemAtIndexPath:v5];

  if (v8)
  {
    id v9 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
    [(HomeOutlineSectionController *)self expandElementAtIdentifierPath:v9];

    id v10 = v8;
  }

  return v8;
}

- (BOOL)persistsExpansions
{
  return 1;
}

- (id)contextMenuForSnapshot:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[LibraryUIUtilities isMyPlacesEnabled];
  objc_super v6 = [v4 viewModel];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      CFStringRef v7 = v6;
    }
    else {
      CFStringRef v7 = 0;
    }
    id v8 = v7;

    id v9 = [v8 item];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v6;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    id v8 = [v11 entry];

    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v12 = [(MeCardDataProvider *)self->_meCardDataProvider meCard];
    id v9 = [v12 _maps_shortcutForSuggestionsEntry:v8];
  }
  if (v9)
  {
    uint64_t v13 = +[NSMutableArray array];
    objc_initWeak(&location, self);
    if ([v9 isSetupPlaceholder])
    {
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_100A63600;
      v50[3] = &unk_1012E6690;
      v34 = &v52;
      objc_copyWeak(&v52, &location);
      id v51 = v4;
      uint64_t v14 = HomeDeleteAction(v50);
      v58 = v14;
      uint64_t v15 = +[NSArray arrayWithObjects:&v58 count:1];
      uint64_t v16 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v15];

      [v13 addObject:v16];
      v17 = &v51;
    }
    else if ([v9 type] == (id)6)
    {
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100A63650;
      v47[3] = &unk_1012E6690;
      v34 = &v49;
      objc_copyWeak(&v49, &location);
      id v48 = v4;
      uint64_t v14 = HomeRemoveFromFavoritesAction(v47);
      v57 = v14;
      objc_super v19 = +[NSArray arrayWithObjects:&v57 count:1];
      uint64_t v16 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v19];

      [v13 addObject:v16];
      v17 = &v48;
    }
    else
    {
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100A636A0;
      v44[3] = &unk_1012E6690;
      v34 = &v46;
      objc_copyWeak(&v46, &location);
      id v20 = v4;
      id v45 = v20;
      uint64_t v14 = HomeEditFavoriteAction(v44);
      v56 = v14;
      v21 = +[NSArray arrayWithObjects:&v56 count:1];
      uint64_t v16 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v21];

      [v13 addObject:v16];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100A636F0;
      v41[3] = &unk_1012E6690;
      objc_copyWeak(&v43, &location);
      id v22 = v20;
      id v42 = v22;
      v33 = HomeOpenInNewTabAction(v41);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100A63744;
      v38[3] = &unk_1012E6690;
      objc_copyWeak(&v40, &location);
      id v23 = v22;
      id v39 = v23;
      uint64_t v24 = HomeOpenInNewWindowAction(v38);
      v55[0] = v33;
      v55[1] = v24;
      v31 = (void *)v24;
      v25 = +[NSArray arrayWithObjects:v55 count:2];
      v32 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v25];

      [v13 addObject:v32];
      v26 = +[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:1];
      [v13 addObject:v26];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100A63798;
      v35[3] = &unk_1012E6690;
      objc_copyWeak(&v37, &location);
      id v36 = v23;
      v27 = HomeRemoveFromFavoritesAction(v35);
      v54 = v27;
      v28 = +[NSArray arrayWithObjects:&v54 count:1];
      v29 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v28];

      [v13 addObject:v29];
      objc_destroyWeak(&v37);

      objc_destroyWeak(&v40);
      objc_destroyWeak(&v43);
      v17 = &v45;
    }

    objc_destroyWeak(v34);
    objc_super v18 = +[UIMenu menuWithTitle:&stru_101324E70 children:v13];
    objc_destroyWeak(&location);

    goto LABEL_19;
  }
LABEL_14:
  objc_super v18 = 0;
LABEL_19:

  return v18;
}

- (void)_editEntrySnapshot:(id)a3
{
  id v26 = a3;
  unsigned int v4 = +[LibraryUIUtilities isMyPlacesEnabled];
  unsigned int v5 = [v26 viewModel];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v6 = v5;
    }
    else {
      objc_super v6 = 0;
    }
    id v7 = v6;

    id v8 = [v7 item];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v5;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    id v7 = [v10 entry];

    if (!v7) {
      goto LABEL_25;
    }
    id v11 = [(MeCardDataProvider *)self->_meCardDataProvider meCard];
    id v8 = [v11 _maps_shortcutForSuggestionsEntry:v7];
  }
  if (v8)
  {
    uint64_t v12 = [(HomeOutlineSectionController *)self delegate];
    uint64_t v13 = [v26 identifierPath];
    uint64_t v14 = [v12 sectionController:self indexPathForIdentifierPath:v13];

    if (v14)
    {
      uint64_t v15 = [(HomeOutlineSectionController *)self configuration];
      uint64_t v16 = [v15 collectionView];
      v17 = [v16 cellForItemAtIndexPath:v14];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_super v18 = v17;
      }
      else {
        objc_super v18 = 0;
      }
      id v19 = v18;

      if (v19)
      {
        id v20 = [v19 trailingAccessoryConfigurations];
        v21 = [v20 firstObject];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v22 = v21;
        }
        else {
          id v22 = 0;
        }
        id v23 = v22;

        if (v23)
        {
          uint64_t v24 = [v23 customView];
          v25 = [v23 customView];
          [v25 bounds];
          -[HomeOutlineFavoritesSectionController _startEditSessionForShortcut:sourceView:sourceRect:](self, "_startEditSessionForShortcut:sourceView:sourceRect:", v8, v24);
        }
      }
    }
  }
LABEL_25:
}

- (void)_openSnapshot:(id)a3 inNewTab:(BOOL)a4
{
  id v5 = a3;
  unsigned int v6 = +[LibraryUIUtilities isMyPlacesEnabled];
  id v7 = [v5 viewModel];

  if (v6)
  {
    id v8 = [v7 item];
    [v8 mapItemStorage];
  }
  else
  {
    id v8 = [v7 entry];
    [v8 geoMapItem];
  id v9 = };

  id v10 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.Maps.NewWindow"];
  [v10 setEligibleForHandoff:0];
  id v11 = [(HomeOutlineSectionController *)self configuration];
  uint64_t v12 = [v11 homeActionDelegate];
  uint64_t v13 = [v12 homeContaineeViewController];
  uint64_t v14 = [v13 _maps_mapsSceneDelegate];
  uint64_t v15 = [v14 mapsActivityWithFidelity:2];

  [v15 setPresentedMapItem:v9];
  uint64_t v16 = [v15 data];
  v17 = [v16 bzip2CompressedData];

  if (v17)
  {
    CFStringRef v25 = @"bs";
    id v26 = v17;
    objc_super v18 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    [v10 setUserInfo:v18];
  }
  id v19 = objc_alloc_init((Class)UISceneActivationRequestOptions);
  id v20 = [(HomeOutlineSectionController *)self configuration];
  v21 = [v20 homeActionDelegate];
  id v22 = [v21 homeContaineeViewController];
  id v23 = [v22 _maps_uiScene];
  [v19 setRequestingScene:v23];

  uint64_t v24 = +[UIApplication sharedApplication];
  [v24 requestSceneSessionActivation:0 userActivity:v10 options:v19 errorHandler:0];
}

- (id)shareItemSourceForSnapshot:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[LibraryUIUtilities isMyPlacesEnabled];
  unsigned int v6 = [v4 viewModel];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    id v9 = [v8 item];

    if (!v9) {
      goto LABEL_15;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v6;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    uint64_t v12 = [v11 entry];

    if (!v12)
    {
      id v9 = 0;
      goto LABEL_15;
    }
    uint64_t v13 = [(MeCardDataProvider *)self->_meCardDataProvider meCard];
    id v9 = [v13 _maps_shortcutForSuggestionsEntry:v12];
  }
  if (([v9 isSetupPlaceholder] & 1) == 0)
  {
    uint64_t v14 = [v9 geoMapItem];
    id v15 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v14 isPlaceHolderPlace:0];
    uint64_t v16 = [[SearchResult alloc] initWithMapItem:v15];
    v17 = [(SearchResult *)v16 unknownContact];
    objc_super v18 = +[ShareItem shareItemWithSearchResult:v16 contact:v17 includePrintActivity:1];

    goto LABEL_16;
  }
LABEL_15:
  objc_super v18 = 0;
LABEL_16:

  return v18;
}

- (BOOL)_shouldShowAddButtonForItemSnapshots:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [(HomeOutlineSectionController *)self deletions];
        id v11 = [v9 identifierPath];
        uint64_t v12 = [v10 objectForKeyedSubscript:v11];

        if (!v12)
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (void)_addFavorite
{
  unsigned int v3 = [(HomeOutlineSectionController *)self configuration];
  id v4 = [v3 actionCoordinator];
  id v5 = [(HomeOutlineSectionController *)self configuration];
  id v6 = [v5 homeActionDelegate];
  uint64_t v7 = [v6 homeContaineeViewController];
  id v8 = +[ShortcutEditSession addSession];
  [v4 viewController:v7 showAddShortcut:v8];

  +[GEOAPPortal captureUserAction:2044 target:8 value:0];
}

- (void)twoLinesOutlineCell:(id)a3 accessoryViewTapped:(id)a4 accessoryModel:(id)a5
{
  id v17 = a3;
  id v7 = a4;
  id v8 = [v17 cellModel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = [v17 cellModel];
    id v11 = [v10 entry];
    uint64_t v12 = [(MeCardDataProvider *)self->_meCardDataProvider meCard];
    BOOL v13 = [v12 _maps_shortcutForSuggestionsEntry:v11];

    if (!v13)
    {
LABEL_7:

      goto LABEL_8;
    }
    [v7 bounds];
    -[HomeOutlineFavoritesSectionController _startEditSessionForShortcut:sourceView:sourceRect:](self, "_startEditSessionForShortcut:sourceView:sourceRect:", v13, v7);
  }
  uint64_t v14 = [v17 cellModel];
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) == 0) {
    goto LABEL_9;
  }
  id v10 = [v17 cellModel];
  uint64_t v16 = [v10 item];
  if (v16)
  {
    id v11 = (void *)v16;
    [v7 bounds];
    -[HomeOutlineFavoritesSectionController _startEditSessionForShortcut:sourceView:sourceRect:](self, "_startEditSessionForShortcut:sourceView:sourceRect:", v11, v7);
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
}

- (void)sectionHeaderOutlineCell:(id)a3 accessoryTypeTapped:(int64_t)a4
{
  if (a4 == 2) {
    [(HomeOutlineFavoritesSectionController *)self _addFavorite];
  }
}

- (void)smallButtonOutlineCellTapped:(id)a3
{
}

- (void)_startEditSessionForShortcut:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  if (!self->_shortcutEditSession)
  {
    BOOL v13 = +[ShortcutEditSession editSessionWithShortcut:v11];
    shortcutEditSession = self->_shortcutEditSession;
    self->_shortcutEditSession = v13;

    objc_initWeak(&location, self);
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    id v23 = sub_100A64444;
    uint64_t v24 = &unk_1012E6708;
    objc_copyWeak(&v25, &location);
    [(ShortcutEditSession *)self->_shortcutEditSession setCompletionHandler:&v21];
    char v15 = [(HomeOutlineSectionController *)self delegate];
    [v15 sectionController:self setNeedsApplySnapshotAnimated:1];

    uint64_t v16 = [(HomeOutlineSectionController *)self configuration];
    id v17 = [v16 actionCoordinator];
    long long v18 = [(HomeOutlineSectionController *)self configuration];
    id v19 = [v18 homeActionDelegate];
    id v20 = [v19 homeContaineeViewController];
    [v17 viewController:self->_shortcutEditSession editShortcut:x, y, width, height];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

- (void)_endEditSession
{
  shortcutEditSession = self->_shortcutEditSession;
  if (shortcutEditSession)
  {
    self->_shortcutEditSession = 0;

    id v4 = [(HomeOutlineSectionController *)self delegate];
    [v4 sectionController:self setNeedsApplySnapshotAnimated:1];
  }
}

- (BOOL)_accessoryVisiblityForEntry:(id)a3
{
  id v4 = a3;
  id v5 = [(MeCardDataProvider *)self->_meCardDataProvider meCard];
  id v6 = [v5 _maps_shortcutForSuggestionsEntry:v4];

  if (self->_shortcutEditSession)
  {
    id v7 = [v6 identifier];
    id v8 = [(ShortcutEditSession *)self->_shortcutEditSession shortcut];
    id v9 = [v8 identifier];
    if (v7 == v9 || [v7 isEqual:v9])
    {
      [v4 type];
      id v10 = (id)MapsSuggestionsShortcutTypeFromEntryType();
      id v11 = [(ShortcutEditSession *)self->_shortcutEditSession shortcut];
      BOOL v12 = v10 == [v11 type];
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return !v12;
}

- (BOOL)_accessoryVisiblityForFavorite:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_shortcutEditSession)
  {
    id v6 = [v4 identifier];
    id v7 = [(ShortcutEditSession *)self->_shortcutEditSession shortcut];
    id v8 = [v7 identifier];
    if (v6 == v8 || [v6 isEqual:v8])
    {
      id v9 = [v5 type];
      id v10 = [(ShortcutEditSession *)self->_shortcutEditSession shortcut];
      BOOL v11 = v9 == [v10 type];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return !v11;
}

- (BOOL)_shouldShowAccessoryForEntry:(id)a3
{
  return MapsSuggestionsEntryIsNearbyTransit() ^ 1;
}

- (BOOL)_shouldShowAccessoryForFavorite:(id)a3
{
  id v3 = a3;
  if ([v3 type] == (id)6
    && ([v3 identifier],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 isEqualToString:@"NearbyTransit"],
        v4,
        (v5 & 1) != 0))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    unsigned int v6 = [v3 isSetupPlaceholder] ^ 1;
  }

  return v6;
}

- (BOOL)_isMoveOperationWithDropSession:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 localDragSession];
  unsigned int v6 = [v5 localContext];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [v4 items];

  id v10 = [v9 firstObject];
  BOOL v11 = [v10 localObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v12 = v11;
  }
  else {
    BOOL v12 = 0;
  }
  id v13 = v12;

  if (!v8) {
    goto LABEL_15;
  }
  uint64_t v14 = [v8 windowScene];
  char v15 = [(HomeOutlineSectionController *)self configuration];
  uint64_t v16 = [v15 collectionView];
  id v17 = [v16 window];
  long long v18 = [v17 windowScene];
  if (v14 == v18) {
    unsigned int v19 = 1;
  }
  else {
    unsigned int v19 = [v14 isEqual:v18];
  }

  LOBYTE(v14) = 0;
  if (v19 && v13)
  {
    id v20 = [v13 itemSnapshot];
    v21 = [v20 identifierPath];
    uint64_t v22 = [v21 firstIdentifier];
    id v23 = [(HomeOutlineSectionController *)self configuration];
    uint64_t v24 = [v23 sectionIdentifier];
    if (v22 == (void *)v24)
    {
    }
    else
    {
      id v25 = (void *)v24;
      unsigned __int8 v26 = [v22 isEqual:v24];

      if ((v26 & 1) == 0)
      {
LABEL_15:
        LOBYTE(v14) = 0;
        goto LABEL_30;
      }
    }
    v27 = [v13 itemSnapshot];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v28 = v27;
    }
    else {
      v28 = 0;
    }
    id v29 = v28;

    v30 = [(HomeOutlineFavoritesSectionController *)self _shortcutForNodeSnapshot:v29];

    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      if (v30 && ([v30 isSetupPlaceholder] & 1) == 0) {
        goto LABEL_28;
      }
    }
    else if (v30)
    {
      unint64_t v31 = (unint64_t)[v30 type];
      if (v31 >= 6)
      {
LABEL_28:
        LOBYTE(v14) = 1;
        goto LABEL_29;
      }
      LODWORD(v14) = (0x13u >> v31) & 1;
LABEL_29:

      goto LABEL_30;
    }
    LOBYTE(v14) = 0;
    goto LABEL_29;
  }
LABEL_30:

  return (char)v14;
}

- (int64_t)_firstValidMoveIndexForFavorites:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      id v8 = 0;
      int64_t v9 = (int64_t)v5 + v6;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v8), "isShortcutForSetup", (void)v11))
        {
          int64_t v9 = (int64_t)v8 + v6;
          goto LABEL_12;
        }
        id v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      int64_t v6 = v9;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v9 = 0;
  }
LABEL_12:

  return v9;
}

- (void)_performMoveWithDropCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [v4 items];
  int64_t v6 = [v5 firstObject];
  uint64_t v7 = [v6 dragItem];

  if (v7)
  {
    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      id v8 = [(HomeOutlineFavoritesSectionController *)self _entries];
      int64_t v9 = [(HomeOutlineFavoritesSectionController *)self _firstValidMoveIndexForFavorites:v8];
    }
    else
    {
      id v8 = [(MeCardDataProvider *)self->_meCardDataProvider meCard];
      int64_t v9 = [v8 _maps_firstValidMoveIndex];
    }
    id v10 = v9;

    long long v11 = [v4 destinationIndexPath];
    long long v12 = [v11 item];

    if ((uint64_t)v12 > [(HomeOutlineFavoritesSectionController *)self _headerNodeCount]) {
      v12 -= [(HomeOutlineFavoritesSectionController *)self _headerNodeCount];
    }
    if ((uint64_t)v12 > (uint64_t)v10) {
      id v10 = v12;
    }
    long long v13 = [v7 localObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v14 = v13;
    }
    else {
      long long v14 = 0;
    }
    id v15 = v14;

    uint64_t v16 = [v15 itemSnapshot];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;

    unsigned int v19 = [(HomeOutlineFavoritesSectionController *)self _shortcutForNodeSnapshot:v18];

    if (v19)
    {
      if (+[LibraryUIUtilities isMyPlacesEnabled])
      {
        id v20 = [(HomeOutlineFavoritesSectionController *)self _entries];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100A64E44;
        v25[3] = &unk_1012EAC50;
        v21 = v26;
        v26[0] = v19;
        v26[1] = self;
        [v26[0] moveToIndex:v10 with:v20 completion:v25];
      }
      else
      {
        shortcutManager = self->_shortcutManager;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100A64F10;
        v23[3] = &unk_1012E7D28;
        v21 = &v24;
        id v24 = v19;
        [(ShortcutManager *)shortcutManager moveShortcut:v24 toIndex:v10 completion:v23];
      }

      [(HomeOutlineFavoritesSectionController *)self _animateMoveOfShortcut:v19 toIndex:v10 dropCoordinator:v4];
    }
  }
}

- (void)_animateMoveOfShortcut:(id)a3 toIndex:(unint64_t)a4 dropCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = +[LibraryUIUtilities isMyPlacesEnabled];
  long long v11 = [v9 items];
  long long v12 = [v11 firstObject];
  long long v13 = [v12 dragItem];

  if (v10)
  {
    long long v14 = [(HomeOutlineFavoritesSectionController *)self _entries];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100A652E8;
    v35[3] = &unk_1013158E8;
    id v15 = &v36;
    id v36 = v8;
    id v16 = [v14 indexOfObjectPassingTest:v35];
    if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v17 = v16;
      v32 = &v36;
      id v18 = +[NSMutableArray arrayWithArray:v14];
      unsigned int v19 = [v14 objectAtIndexedSubscript:v17];
      [v18 removeObjectAtIndex:v17];
      [v18 insertObject:v19 atIndex:a4];
      id v20 = (objc_class *)[v18 copy];
      uint64_t v21 = 160;
LABEL_6:
      id v24 = *(Class *)((char *)&self->super.super.isa + v21);
      *(Class *)((char *)&self->super.super.isa + v21) = v20;

      id v25 = [(HomeOutlineSectionController *)self delegate];
      [v25 sectionController:self setNeedsApplySnapshotAnimated:1];

      unsigned __int8 v26 = [(HomeOutlineSectionController *)self delegate];
      [v26 applySnapshotIfNeededWithSectionController:self];

      v27 = *(Class *)((char *)&self->super.super.isa + v21);
      *(Class *)((char *)&self->super.super.isa + v21) = 0;

      v28 = (char *)[(HomeOutlineFavoritesSectionController *)self _headerNodeCount] + a4;
      id v29 = [v9 destinationIndexPath];
      v30 = +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v28, [v29 section]);

      id v31 = [v9 dropItem:v13 toItemAtIndexPath:v30];
      id v15 = v32;
    }
  }
  else
  {
    long long v14 = [(HomeOutlineFavoritesSectionController *)self _entriesLegacy];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100A6535C;
    v33[3] = &unk_101315910;
    id v15 = &v34;
    id v34 = v8;
    id v22 = [v14 indexOfObjectPassingTest:v33];
    if (v22 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v23 = v22;
      v32 = &v34;
      id v18 = +[NSMutableArray arrayWithArray:v14];
      unsigned int v19 = [v14 objectAtIndexedSubscript:v23];
      [v18 removeObjectAtIndex:v23];
      [v18 insertObject:v19 atIndex:a4];
      id v20 = (objc_class *)[v18 copy];
      uint64_t v21 = 152;
      goto LABEL_6;
    }
  }
}

- (BOOL)_isCopyOperationWithDropSession:(id)a3
{
  id v4 = [(HomeOutlineSectionController *)self mapItemForDropSession:a3];
  if (v4)
  {
    id v5 = [(MeCardDataProvider *)self->_meCardDataProvider meCard];
    unsigned __int8 v6 = [v5 _maps_canAddShortcutForMapItem:v4];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)_performCopyWithDropCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [v4 session];
  unsigned __int8 v6 = [(HomeOutlineSectionController *)self mapItemForDropSession:v5];

  if (v6)
  {
    uint64_t v7 = [(MeCardDataProvider *)self->_meCardDataProvider meCard];
    unsigned int v8 = [v7 _maps_canAddShortcutForMapItem:v6];

    if (v8)
    {
      id v9 = +[ShortcutEditSession addSessionWithType:1 mapItem:v6];
      if (v9)
      {
        objc_initWeak(&location, self);
        [(NSMutableArray *)self->_dropShortcutEditSessions addObject:v9];
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100A655D0;
        v10[3] = &unk_1012EA2C0;
        objc_copyWeak(&v13, &location);
        id v11 = v6;
        id v12 = v9;
        [v12 saveWithCompletion:v10];

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (id)_entriesLegacy
{
  entriesForMoveAnimation = self->_entriesForMoveAnimation;
  if (entriesForMoveAnimation)
  {
    id v3 = entriesForMoveAnimation;
  }
  else
  {
    id v5 = [(SuggestionsDataProvider *)self->_suggestionsDataProvider shortcuts];
    unsigned __int8 v6 = [(MeCardDataProvider *)self->_meCardDataProvider meCard];
    [v6 _maps_shortcutOrderedEntries:v5];
    id v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_entries
{
  favoritesForMoveAnimation = self->_favoritesForMoveAnimation;
  if (favoritesForMoveAnimation)
  {
    id v3 = favoritesForMoveAnimation;
  }
  else
  {
    id v3 = [(MapsFavoritesManager *)self->_favoritesDataProvider shortcutsForMapsHome];
  }

  return v3;
}

- (int64_t)_headerNodeCount
{
  return 1;
}

- (id)_shortcutForNodeSnapshot:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[LibraryUIUtilities isMyPlacesEnabled];
  unsigned __int8 v6 = [v4 viewModel];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    id v9 = [v8 item];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v10 = v6;
    }
    else {
      unsigned int v10 = 0;
    }
    id v8 = v10;

    if (v8)
    {
      id v11 = [(MeCardDataProvider *)self->_meCardDataProvider meCard];
      id v12 = [v8 entry];
      id v9 = [v11 _maps_shortcutForSuggestionsEntry:v12];
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (void)_deleteSnapshot:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(HomeOutlineSectionController *)self deletions];
  unsigned __int8 v6 = [v4 identifierPath];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v8 = [(HomeOutlineFavoritesSectionController *)self _shortcutForNodeSnapshot:v4];
    if (v8)
    {
      id v9 = [(HomeOutlineSectionController *)self deletionWithSnapshot:v4];
      unsigned int v10 = +[ShortcutEditSession editSessionWithShortcut:v8];
      [(NSMutableArray *)self->_deleteShortcutEditSessions addObject:v10];
      objc_initWeak(&location, self);
      id v20 = v9;
      id v11 = +[NSArray arrayWithObjects:&v20 count:1];
      [(HomeOutlineSectionController *)self beginDeletions:v11];

      if (+[LibraryUIUtilities isMyPlacesEnabled])
      {
        id v12 = v17;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100A65B88;
        v17[3] = &unk_1012F6B00;
        id v13 = &v18;
        objc_copyWeak(&v18, &location);
        v17[4] = v9;
        v17[5] = v10;
        [v8 deleteWithCompletionHandler:v17];
      }
      else
      {
        id v12 = v14;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100A65C54;
        v14[3] = &unk_1012EA2C0;
        id v13 = &v16;
        objc_copyWeak(&v16, &location);
        v14[4] = v9;
        id v15 = v10;
        [v15 removeFromShortcutsWithCompletion:v14];
      }

      objc_destroyWeak(v13);
      objc_destroyWeak(&location);
    }
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HomeOutlineSectionController *)self delegate];
  id v9 = [v8 sectionController:self nodeSnapshotAtIndexPath:v7];

  unsigned int v10 = [v9 viewModel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v12 = [v9 viewModel];
  id v13 = v12;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();

    id v20 = [v9 viewModel];
    id v13 = v20;
    if (v19)
    {
      long long v14 = [v20 item];
      +[HomeAnalyticsManager captureTapActionWithFavorite:v14];
      if ([v14 isShortcutForSetup])
      {
        uint64_t v21 = [v6 cellForItemAtIndexPath:v7];
        id v16 = (void *)v21;
        if (v14 && v21)
        {
          id v31 = [(HomeOutlineSectionController *)self configuration];
          id v29 = [v31 actionCoordinator];
          v30 = [(HomeOutlineSectionController *)self configuration];
          id v22 = [v30 homeActionDelegate];
          id v23 = [v22 homeContaineeViewController];
          id v24 = +[ShortcutEditSession addSessionWithShortcut:v14];
          [v29 viewController:v23 showAddShortcut:v24];
        }
        goto LABEL_7;
      }
    }
    else
    {
      objc_opt_class();
      char v25 = objc_opt_isKindOfClass();

      if ((v25 & 1) == 0)
      {
LABEL_16:
        v32.receiver = self;
        v32.super_class = (Class)HomeOutlineFavoritesSectionController;
        [(HomeOutlineSectionController *)&v32 collectionView:v6 didSelectItemAtIndexPath:v7];
        goto LABEL_17;
      }
      id v13 = [(HomeOutlineSectionController *)self configuration];
      long long v14 = [v13 actionCoordinator];
      unsigned __int8 v26 = [(HomeOutlineSectionController *)self configuration];
      v27 = [v26 homeActionDelegate];
      v28 = [v27 homeContaineeViewController];
      [v14 viewControllerShowLibraryRootView:v28];
    }
LABEL_15:

    goto LABEL_16;
  }
  long long v14 = [v12 entry];
  +[HomeAnalyticsManager captureTapActionWithEntry:v14];
  if (![v14 isShortcutForSetup]) {
    goto LABEL_15;
  }
  id v15 = [(MeCardDataProvider *)self->_meCardDataProvider meCard];
  id v16 = [v15 _maps_shortcutForSuggestionsEntry:v14];

  id v17 = [v6 cellForItemAtIndexPath:v7];
  id v18 = v17;
  if (v16 && v17)
  {
    [v17 bounds];
    -[HomeOutlineFavoritesSectionController _startEditSessionForShortcut:sourceView:sourceRect:](self, "_startEditSessionForShortcut:sourceView:sourceRect:", v16, v18);
  }

LABEL_7:
LABEL_17:
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (![(HomeOutlineFavoritesSectionController *)self _isMoveOperationWithDropSession:v7])
  {
    unsigned int v16 = [(HomeOutlineFavoritesSectionController *)self _isCopyOperationWithDropSession:v7];
    id v14 = objc_alloc((Class)UICollectionViewDropProposal);
    if (!v16)
    {
      id v21 = [v14 initWithDropOperation:0];
      goto LABEL_14;
    }
    uint64_t v15 = 2;
    goto LABEL_9;
  }
  if (!+[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v17 = [(MeCardDataProvider *)self->_meCardDataProvider meCard];
    id v18 = [v17 _maps_firstValidMoveIndex];

    char v19 = (char *)[v8 item];
    if ((uint64_t)v19 >= (uint64_t)&v18[[(HomeOutlineFavoritesSectionController *)self _headerNodeCount]])
    {
LABEL_12:
      id v14 = objc_alloc((Class)UICollectionViewDropProposal);
      uint64_t v15 = 3;
      uint64_t v20 = 1;
      goto LABEL_13;
    }
LABEL_8:
    id v14 = objc_alloc((Class)UICollectionViewDropProposal);
    uint64_t v15 = 3;
    goto LABEL_9;
  }
  id v9 = [(HomeOutlineFavoritesSectionController *)self _entries];
  int64_t v10 = [(HomeOutlineFavoritesSectionController *)self _firstValidMoveIndexForFavorites:v9];

  id v11 = [v8 item];
  id v12 = [(HomeOutlineFavoritesSectionController *)self _entries];
  id v13 = [v12 count];

  if ((uint64_t)v11 <= (uint64_t)v13)
  {
    id v22 = (char *)[v8 item];
    if ((uint64_t)v22 > (uint64_t)((char *)[(HomeOutlineFavoritesSectionController *)self _headerNodeCount]+ v10))goto LABEL_12; {
    goto LABEL_8;
    }
  }
  id v14 = objc_alloc((Class)UICollectionViewDropProposal);
  uint64_t v15 = 0;
LABEL_9:
  uint64_t v20 = 2;
LABEL_13:
  id v21 = [v14 initWithDropOperation:v15 intent:v20];
LABEL_14:
  id v23 = v21;

  return v23;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v9 = a4;
  unsigned int v5 = [v9 session];
  unsigned int v6 = [(HomeOutlineFavoritesSectionController *)self _isMoveOperationWithDropSession:v5];

  if (v6)
  {
    [(HomeOutlineFavoritesSectionController *)self _performMoveWithDropCoordinator:v9];
  }
  else
  {
    id v7 = [v9 session];
    unsigned int v8 = [(HomeOutlineFavoritesSectionController *)self _isCopyOperationWithDropSession:v7];

    if (v8) {
      [(HomeOutlineFavoritesSectionController *)self _performCopyWithDropCoordinator:v9];
    }
  }
}

- (SuggestionsDataProvider)suggestionsDataProvider
{
  return self->_suggestionsDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoritesForMoveAnimation, 0);
  objc_storeStrong((id *)&self->_entriesForMoveAnimation, 0);
  objc_storeStrong((id *)&self->_shortcutManager, 0);
  objc_storeStrong((id *)&self->_deleteShortcutEditSessions, 0);
  objc_storeStrong((id *)&self->_dropShortcutEditSessions, 0);
  objc_storeStrong((id *)&self->_shortcutEditSession, 0);
  objc_storeStrong((id *)&self->_meCardDataProvider, 0);
  objc_storeStrong((id *)&self->_libraryCountsDataProvider, 0);
  objc_storeStrong((id *)&self->_favoritesDataProvider, 0);

  objc_storeStrong((id *)&self->_suggestionsDataProvider, 0);
}

@end