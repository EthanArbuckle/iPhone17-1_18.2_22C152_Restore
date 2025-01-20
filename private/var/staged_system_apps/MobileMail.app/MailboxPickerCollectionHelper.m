@interface MailboxPickerCollectionHelper
- (BOOL)_updateSnapshot:(id)a3 forSection:(id)a4;
- (BOOL)canBeginMultiSelectAtIndexPath:(id)a3;
- (BOOL)canReorderItemAtIndexPath:(id)a3;
- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5;
- (BOOL)isAddButtonAtIndexPath:(id)a3;
- (BOOL)isCellSelectable:(id)a3 atIndexPath:(id)a4;
- (BOOL)isPerformingMultiSelect;
- (BOOL)isSplitViewCollapsed;
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (EFDebouncer)favoritesDidChangedDebouncer;
- (EMFocus)currentFocus;
- (FavoritesManager)favoritesManager;
- (MailMainScene)scene;
- (MailboxPickerCollectionHelper)initWithCollectionView:(id)a3 favoritesManager:(id)a4 focusController:(id)a5 scene:(id)a6 logClient:(id)a7;
- (MailboxPickerCollectionHelperDelegate)delegate;
- (MailboxPickerCollectionHelperModel)model;
- (NSArray)mailboxesForMessageList;
- (NSString)pinnedItemIdentifier;
- (OS_os_log)logClient;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIColor)multiSelectCheckmarkColor;
- (_UIDiffableDataSourceOutlineSectionController)sectionController;
- (double)pinnedItemOffset;
- (id)_favoritesDidChangedBlock;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (id)createMailboxesFromUids:(id)a3;
- (id)favoriteItemAtIndexPath:(id)a3;
- (id)favoriteItemForItemID:(id)a3;
- (id)favoriteItemForItemID:(id)a3 inSection:(id)a4;
- (id)indexPathForItem:(id)a3;
- (id)snapshotFromFavoriteItems:(id)a3;
- (int64_t)_applyInsertionsInSnapshot:(id)a3 differences:(id)a4 collection:(id)a5;
- (int64_t)_applyRemovalsInSnapshot:(id)a3 differences:(id)a4;
- (int64_t)sectionTypeForIndex:(int64_t)a3;
- (void)_configureAccountsCell:(id)a3 forItem:(id)a4;
- (void)_configureAddMailboxCell:(id)a3;
- (void)_configureCell:(id)a3 forItemID:(id)a4 indexPath:(id)a5;
- (void)_configureFlattenedCell:(id)a3 forItem:(id)a4;
- (void)_configureMailboxCell:(id)a3 mailbox:(id)a4 indexPath:(id)a5;
- (void)_detailsDisclosureButtonTapped:(id)a3;
- (void)_favoritesDidChange:(id)a3;
- (void)_favoritesFocusDidChange:(id)a3;
- (void)_performDataSourceUpdateAnimated:(BOOL)a3 forceReload:(BOOL)a4 update:(id)a5;
- (void)_performDataSourceUpdateAnimated:(BOOL)a3 forceReload:(BOOL)a4 update:(id)a5 toSection:(id)a6;
- (void)_reloadDataForCellsAtIndexPaths:(id)a3;
- (void)_setupDataSource;
- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3;
- (void)dealloc;
- (void)reloadDataForIndexPaths:(id)a3;
- (void)reloadDataSource;
- (void)reloadDataSourceWithReason:(int64_t)a3;
- (void)reloadFavorites;
- (void)selectAccount:(id)a3 item:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)selectCombinedInboxWithSourceType:(unint64_t)a3 item:(id)a4 animated:(BOOL)a5;
- (void)selectCombinedMailbox:(id)a3;
- (void)selectCombinedMailboxWithType:(int64_t)a3 item:(id)a4 animated:(BOOL)a5;
- (void)selectCustomViewController:(id)a3 item:(id)a4 animated:(BOOL)a5;
- (void)selectMailbox:(id)a3 item:(id)a4 andPopToMailboxController:(BOOL)a5 animated:(BOOL)a6;
- (void)selectMailbox:(id)a3 item:(id)a4 animated:(BOOL)a5;
- (void)selectVIPMailboxWithItem:(id)a3 animated:(BOOL)a4;
- (void)setCollectionView:(id)a3;
- (void)setCurrentFocus:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFavoritesDidChangedDebouncer:(id)a3;
- (void)setFavoritesManager:(id)a3;
- (void)setIsPerformingMultiSelect:(BOOL)a3;
- (void)setLogClient:(id)a3;
- (void)setModel:(id)a3;
- (void)setMultiSelectCheckmarkColor:(id)a3;
- (void)setPinnedItemIdentifier:(id)a3;
- (void)setPinnedItemOffset:(double)a3;
- (void)setScene:(id)a3;
- (void)setSectionController:(id)a3;
- (void)updateCellForSourceType:(unint64_t)a3;
- (void)updateCheckmarkColor:(id)a3;
- (void)updateMailboxSelectionAnimated:(BOOL)a3 scrollToSelected:(BOOL)a4;
- (void)updatedSelectedState:(id)a3;
@end

@implementation MailboxPickerCollectionHelper

- (BOOL)isSplitViewCollapsed
{
  v2 = self;
  v3 = [(MailboxPickerCollectionHelper *)self delegate];
  LOBYTE(v2) = [v3 mailboxCollectionHelperSplitViewControllerIsCollapsed:v2];

  return (char)v2;
}

- (void)updatedSelectedState:(id)a3
{
  id v10 = a3;
  v4 = [(MailboxPickerCollectionHelper *)self collectionView];
  unsigned int v5 = [v4 isEditing];

  if (v5)
  {
    v6 = [v10 indexPathsForSelectedItems];
    for (uint64_t i = 0; (uint64_t)[v10 numberOfItemsInSection:0] - 1 > i; ++i)
    {
      v8 = +[NSIndexPath indexPathForItem:i inSection:0];
      v9 = [(MailboxPickerCollectionHelper *)self favoriteItemAtIndexPath:v8];
      if ([v9 isSelected])
      {
        [v10 selectItemAtIndexPath:v8 animated:0 scrollPosition:0];
      }
      else if ([v6 containsObject:v8])
      {
        [v10 deselectItemAtIndexPath:v8 animated:0];
      }
    }
    [(MailboxPickerCollectionHelper *)self updateCheckmarkColor:v10];
  }
}

- (id)_favoritesDidChangedBlock
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000125B8;
  v4[3] = &unk_100607F68;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (id)createMailboxesFromUids:(id)a3
{
  id v3 = a3;
  v4 = +[UIApplication sharedApplication];
  id v5 = [v4 mailboxProvider];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000579EC;
  v9[3] = &unk_100607B28;
  id v10 = v5;
  id v6 = v5;
  v7 = [v3 ef_compactMap:v9];

  return v7;
}

- (id)snapshotFromFavoriteItems:(id)a3
{
  id v4 = a3;
  id v5 = [v4 ef_compactMap:&stru_100607F40];
  id v6 = +[NSOrderedSet orderedSetWithArray:v5];
  id v7 = [v6 count];
  if (v7 != [v4 count])
  {
    v8 = [(MailboxPickerCollectionHelper *)self logClient];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = [v5 count];
      int v13 = 134217984;
      int64_t v14 = v12 - (unsigned char *)[v6 count];
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Favorites Found %ld duplicated itemIDs. Those items will be skipped.", (uint8_t *)&v13, 0xCu);
    }
  }
  id v9 = objc_alloc_init((Class)NSDiffableDataSourceSectionSnapshot);
  id v10 = [v6 array];
  [v9 appendItems:v10];

  return v9;
}

- (id)indexPathForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxPickerCollectionHelper *)self model];
  if (_os_feature_enabled_impl()
    && ([v5 favoritesSection],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 items],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 containsObject:v4],
        v7,
        v6,
        !v8))
  {
    id v10 = [(MailboxPickerCollectionHelper *)self dataSource];
    v11 = [v4 itemID];
    id v9 = [v10 indexPathForItemIdentifier:v11];
  }
  else
  {
    id v9 = [v5 indexPathForItem:v4];
  }

  return v9;
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y = a4.y;
  CGFloat x = a4.x;
  id v7 = a3;
  unsigned int v8 = [(MailboxPickerCollectionHelper *)self pinnedItemIdentifier];

  if (v8)
  {
    id v9 = [(MailboxPickerCollectionHelper *)self dataSource];
    id v10 = [(MailboxPickerCollectionHelper *)self pinnedItemIdentifier];
    v11 = [v9 indexPathForItemIdentifier:v10];

    if (v11)
    {
      v12 = [v7 layoutAttributesForItemAtIndexPath:v11];
      int v13 = v12;
      if (v12)
      {
        [v12 frame];
        double MinY = CGRectGetMinY(v19);
        [(MailboxPickerCollectionHelper *)self pinnedItemOffset];
        double y = MinY + v15;

        CGFloat x = 0.0;
      }
    }
  }
  double v16 = x;
  double v17 = y;
  result.double y = v17;
  result.CGFloat x = v16;
  return result;
}

- (NSString)pinnedItemIdentifier
{
  return self->_pinnedItemIdentifier;
}

- (void)selectMailbox:(id)a3 item:(id)a4 andPopToMailboxController:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  int v13 = [(MailboxPickerCollectionHelper *)self logClient];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v14 = [v11 name];
    double v15 = [v12 itemID];
    *(_DWORD *)buf = 138413058;
    v28 = v14;
    __int16 v29 = 2114;
    v30 = v15;
    __int16 v31 = 1024;
    BOOL v32 = v7;
    __int16 v33 = 1024;
    BOOL v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Favorites selectMailbox mailbox:%@ item:%{public}@ popToMailboxConttoller:%{BOOL}d animated:%{BOOL}d", buf, 0x22u);
  }
  double v16 = [(MailboxPickerCollectionHelper *)self delegate];
  if ([v16 mailboxCollectionHelperMailboxPickerIsEditing:self])
  {
    [v16 mailboxCollectionHelper:self wantsToPresentMailboxEditControllerForMailbox:v11 animated:v6];
  }
  else
  {
    if (!v11)
    {
      v24 = +[NSAssertionHandler currentHandler];
      [v24 handleFailureInMethod:a2 object:self file:@"MailboxPickerCollectionHelper.m" lineNumber:1277 description:@"Unable to select a mailbox item without a valid mailbox to select"];
    }
    if ([v11 mailboxType] == (id)6) {
      +[MailAccount defaultMailAccountForDelivery];
    }
    else {
    double v17 = [v11 representedAccount];
    }
    if (!v17)
    {
      v25 = +[NSAssertionHandler currentHandler];
      [v25 handleFailureInMethod:a2 object:self file:@"MailboxPickerCollectionHelper.m" lineNumber:1286 description:@"Unable to select a mailbox item without a valid account for the mailbox selection"];
    }
    v18 = [(MailboxPickerCollectionHelper *)self scene];
    CGRect v19 = +[NSSet setWithObject:v17];
    [v18 setSelectedAccounts:v19];

    id v26 = v11;
    v20 = +[NSArray arrayWithObjects:&v26 count:1];
    v21 = [(MailboxPickerCollectionHelper *)self createMailboxesFromUids:v20];
    mailboxesForMessageList = self->_mailboxesForMessageList;
    self->_mailboxesForMessageList = v21;

    if (!v12)
    {
      if ([v11 mailboxType] == (id)7) {
        +[FavoriteItem itemForInboxWithAccount:v17 selected:0];
      }
      else {
      id v12 = +[FavoriteItem itemForMailbox:v11 selected:0];
      }
    }
    v23 = [(MailboxPickerCollectionHelper *)self favoritesManager];
    [v23 setLastSelectedItem:v12];

    [(MailboxPickerCollectionHelper *)self updateMailboxSelectionAnimated:0 scrollToSelected:1];
    [v16 mailboxCollectionHelper:self wantsToSelectMailbox:v11 account:v17 animated:v6];
  }
}

- (MailboxPickerCollectionHelper)initWithCollectionView:(id)a3 favoritesManager:(id)a4 focusController:(id)a5 scene:(id)a6 logClient:(id)a7
{
  id v32 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v36.receiver = self;
  v36.super_class = (Class)MailboxPickerCollectionHelper;
  double v17 = [(MailboxPickerCollectionHelper *)&v36 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_scene, a6);
    objc_storeStrong((id *)&v18->_collectionView, a3);
    objc_storeStrong((id *)&v18->_favoritesManager, a4);
    id v19 = objc_alloc((Class)EFDebouncer);
    v20 = +[EFScheduler mainThreadScheduler];
    v21 = [(MailboxPickerCollectionHelper *)v18 _favoritesDidChangedBlock];
    v22 = (EFDebouncer *)[v19 initWithTimeInterval:v20 scheduler:0 startAfter:v21 block:0.2];
    favoritesDidChangedDebouncer = v18->_favoritesDidChangedDebouncer;
    v18->_favoritesDidChangedDebouncer = v22;

    objc_storeStrong((id *)&v18->_logClient, a7);
    uint64_t v24 = +[UIColor mailInteractiveColor];
    multiSelectCheckmarkColor = v18->_multiSelectCheckmarkColor;
    v18->_multiSelectCheckmarkColor = (UIColor *)v24;

    id v26 = [[MailboxPickerCollectionHelperModel alloc] initWithFavoritesManager:v13];
    model = v18->_model;
    v18->_model = v26;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v18);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10000FF34;
    v33[3] = &unk_100607BB0;
    objc_copyWeak(&v34, &location);
    [v14 getCurrentFocus:v33];
    v28 = +[NSNotificationCenter defaultCenter];
    __int16 v29 = [(MailboxPickerCollectionHelper *)v18 favoritesManager];
    [v28 addObserver:v18 selector:"_favoritesDidChange:" name:@"FavoritesManagerFavoritesDidChangeNotification" object:v29];

    v30 = +[NSNotificationCenter defaultCenter];
    [v30 addObserver:v18 selector:"_favoritesFocusDidChange:" name:@"FavoritesPersistenceFocusDidChangeNotification" object:0];

    [(MailboxPickerCollectionHelper *)v18 _setupDataSource];
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v18;
}

- (void)_setupDataSource
{
  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  uint64_t v3 = objc_opt_class();
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1000F356C;
  v52[3] = &unk_100607BD8;
  objc_copyWeak(&v53, location);
  id v4 = +[UICollectionViewCellRegistration registrationWithCellClass:v3 configurationHandler:v52];
  uint64_t v5 = objc_opt_class();
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000F3620;
  v50[3] = &unk_100607BD8;
  objc_copyWeak(&v51, location);
  BOOL v6 = +[UICollectionViewCellRegistration registrationWithCellClass:v5 configurationHandler:v50];
  id v7 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  unsigned int v8 = [(MailboxPickerCollectionHelper *)self collectionView];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000F3694;
  v47[3] = &unk_100607C00;
  id v9 = v6;
  id v48 = v9;
  id v10 = v4;
  id v49 = v10;
  id v11 = [v7 initWithCollectionView:v8 cellProvider:v47];
  [(MailboxPickerCollectionHelper *)self setDataSource:v11];

  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000F379C;
  v45[3] = &unk_100607C68;
  objc_copyWeak(&v46, location);
  id v12 = [(MailboxPickerCollectionHelper *)self dataSource];
  id v13 = [v12 reorderingHandlers];
  [v13 setCanReorderItemHandler:v45];

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000F3848;
  v42[3] = &unk_100607C90;
  objc_copyWeak(&v44, location);
  v43 = &stru_100607C40;
  id v14 = [(MailboxPickerCollectionHelper *)self dataSource];
  id v15 = [v14 reorderingHandlers];
  [v15 setWillReorderHandler:v42];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000F3C60;
  v39[3] = &unk_100607C90;
  objc_copyWeak(&v41, location);
  v40 = &stru_100607C40;
  id v16 = [(MailboxPickerCollectionHelper *)self dataSource];
  double v17 = [v16 reorderingHandlers];
  [v17 setDidReorderHandler:v39];

  id v18 = objc_alloc((Class)_UIDiffableDataSourceOutlineSectionController);
  id v19 = [(MailboxPickerCollectionHelper *)self dataSource];
  id v20 = [v18 initWithDiffableDataSource:v19];
  [(MailboxPickerCollectionHelper *)self setSectionController:v20];

  id v21 = objc_alloc_init((Class)UICollectionViewDiffableDataSourceSectionSnapshotHandlers);
  __int16 v29 = v9;
  v30 = v10;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000F3D6C;
  v37[3] = &unk_100607C68;
  objc_copyWeak(&v38, location);
  [v21 setShouldExpandItemHandler:v37];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000F3DF0;
  v35[3] = &unk_100607CB8;
  objc_copyWeak(&v36, location);
  v22 = objc_retainBlock(v35);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000F3EE0;
  v33[3] = &unk_100607CB8;
  objc_copyWeak(&v34, location);
  v23 = objc_retainBlock(v33);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000F3FF4;
  v31[3] = &unk_100607CB8;
  objc_copyWeak(&v32, location);
  uint64_t v24 = objc_retainBlock(v31);
  int v25 = _os_feature_enabled_impl();
  if (v25) {
    id v26 = v23;
  }
  else {
    id v26 = v22;
  }
  [v21 setWillExpandItemHandler:v26];
  if (v25) {
    v27 = v24;
  }
  else {
    v27 = v22;
  }
  [v21 setWillCollapseItemHandler:v27];
  v28 = [(MailboxPickerCollectionHelper *)self dataSource];
  [v28 setSectionSnapshotHandlers:v21];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);

  objc_destroyWeak(&v51);
  objc_destroyWeak(&v53);
  objc_destroyWeak(location);
}

- (void)updateMailboxSelectionAnimated:(BOOL)a3 scrollToSelected:(BOOL)a4
{
  BOOL v40 = a4;
  BOOL v41 = a3;
  v43 = [(MailboxPickerCollectionHelper *)self delegate];
  uint64_t v5 = [(MailboxPickerCollectionHelper *)self favoritesManager];
  BOOL v6 = [v5 lastSelectedItem];

  if (!v6)
  {
    id v7 = [v43 displayedAccountsForMailboxCollectionHelper:self];
    id v8 = [v7 count];

    if ((unint64_t)v8 < 2)
    {
      id v9 = [(MailboxPickerCollectionHelper *)self scene];
      id v10 = [v9 selectedAccounts];
      id v11 = [v10 anyObject];

      BOOL v6 = +[FavoriteItem itemForInboxWithAccount:v11 selected:1];
    }
    else
    {
      BOOL v6 = +[FavoriteItem itemForUnifiedMailboxWithType:7 selected:1];
    }
    id v12 = [(MailboxPickerCollectionHelper *)self favoritesManager];
    [v12 setLastSelectedItem:v6];
  }
  id v13 = [(MailboxPickerCollectionHelper *)self dataSource];
  id v14 = [v13 snapshot];
  id v15 = [v14 numberOfItems];

  if (v15)
  {
    id v16 = [(MailboxPickerCollectionHelper *)self collectionView];
    v42 = [v16 indexPathsForSelectedItems];
    if ([v42 count] == (id)1
      && ([v42 firstObject],
          double v17 = objc_claimAutoreleasedReturnValue(),
          [(MailboxPickerCollectionHelper *)self favoriteItemAtIndexPath:v17],
          id v18 = objc_claimAutoreleasedReturnValue(),
          v17,
          v18,
          v18 == v6))
    {
      id v19 = 0;
      int v20 = 1;
    }
    else
    {
      id v19 = [(MailboxPickerCollectionHelper *)self indexPathForItem:v6];
      int v20 = 0;
    }
    if (((v20 | _os_feature_enabled_impl() ^ 1) & 1) == 0 && !v19)
    {
      id v21 = objc_opt_new();
      v22 = [v6 representingMailbox];
      v23 = [v22 parent];

      if (v23)
      {
        do
        {
          uint64_t v24 = [(MailboxPickerCollectionHelper *)self favoritesManager];
          int v25 = [v23 displayName];
          id v26 = [v24 itemsMatchingName:v25];

          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v27 = v26;
          id v28 = [v27 countByEnumeratingWithState:&v46 objects:v51 count:16];
          if (v28)
          {
            uint64_t v29 = *(void *)v47;
            do
            {
              for (uint64_t i = 0; i != v28; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v47 != v29) {
                  objc_enumerationMutation(v27);
                }
                __int16 v31 = *(void **)(*((void *)&v46 + 1) + 8 * i);
                if ([v31 isExpandable]
                  && ([v31 isExpanded] & 1) == 0)
                {
                  id v32 = [v31 itemID];
                  [v21 addObject:v32];
                }
              }
              id v28 = [v27 countByEnumeratingWithState:&v46 objects:v51 count:16];
            }
            while (v28);
          }

          uint64_t v33 = [v23 parent];

          v23 = (void *)v33;
        }
        while (v33);
      }
      id v34 = [(MailboxPickerCollectionHelper *)self dataSource];
      v35 = [v21 lastObject];
      if (!v35) {
        goto LABEL_27;
      }
      id v36 = [v34 snapshot];
      v37 = [v36 sectionIdentifierForSectionContainingItemIdentifier:v35];

      if (!v37) {
        goto LABEL_27;
      }
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1000F6158;
      v44[3] = &unk_100607E00;
      id v45 = v21;
      [(MailboxPickerCollectionHelper *)self _performDataSourceUpdateAnimated:1 forceReload:0 update:v44 toSection:v37];
      id v19 = [(MailboxPickerCollectionHelper *)self indexPathForItem:v6];

      if (!v19)
      {
LABEL_27:
        id v38 = [v42 firstObject];
        if (v38) {
          [v16 deselectItemAtIndexPath:v38 animated:v41];
        }

        id v19 = 0;
      }
    }
    if (v19 && [v43 mailboxCollectionHelperShouldUpdateMailboxSelection:self])
    {
      if ([v16 mf_isIndexPathValid:v19])
      {
        if (v40) {
          [v16 scrollToItemAtIndexPath:v19 atScrollPosition:0 animated:v41];
        }
        if (([v42 containsObject:v19] & 1) == 0)
        {
          [v16 selectItemAtIndexPath:v19 animated:0 scrollPosition:0];
          if ([(MailboxPickerCollectionHelper *)self isSplitViewCollapsed]) {
            [v16 deselectItemAtIndexPath:v19 animated:v41];
          }
        }
      }
      else
      {
        v39 = [(MailboxPickerCollectionHelper *)self logClient];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_10045A3B4((uint64_t)v19, (uint64_t)v16, v39);
        }
      }
    }
  }
  else
  {
    id v16 = [(MailboxPickerCollectionHelper *)self logClient];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Skip selection as data source is empty", buf, 2u);
    }
  }
}

- (FavoritesManager)favoritesManager
{
  return self->_favoritesManager;
}

- (MailboxPickerCollectionHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MailboxPickerCollectionHelperDelegate *)WeakRetained;
}

- (void)reloadDataSourceWithReason:(int64_t)a3
{
  if (pthread_main_np() != 1)
  {
    id v27 = +[NSAssertionHandler currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"MailboxPickerCollectionHelper.m" lineNumber:230 description:@"Current thread must be main"];
  }
  uint64_t v5 = [(MailboxPickerCollectionHelper *)self logClient];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Favorites Reloading data source...", buf, 2u);
  }

  id v32 = [(MailboxPickerCollectionHelper *)self collectionView];
  [v32 contentOffset];
  double v7 = v6;
  double v9 = v8;
  unsigned int v28 = [v32 isEditing];
  id v10 = [(MailboxPickerCollectionHelper *)self model];
  [v10 invalidateSections];

  id v11 = [(MailboxPickerCollectionHelper *)self model];
  __int16 v31 = [v11 sections];

  id v12 = [(MailboxPickerCollectionHelper *)self currentFocus];
  v30 = sub_100016C08(self, v12);

  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10001D080;
  v54[3] = &unk_100607D60;
  id v13 = v31;
  id v55 = v13;
  v56 = self;
  [(MailboxPickerCollectionHelper *)self _performDataSourceUpdateAnimated:0 forceReload:0 update:v54];
  v35 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v13;
  id v14 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v51 != v15) {
          objc_enumerationMutation(obj);
        }
        double v17 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10003305C;
        v46[3] = &unk_100607D88;
        id v47 = v35;
        long long v48 = v17;
        long long v49 = self;
        id v18 = [v17 sectionIdentifier];
        [(MailboxPickerCollectionHelper *)self _performDataSourceUpdateAnimated:0 forceReload:0 update:v46 toSection:v18];
      }
      id v14 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v14);
  }

  if (_os_feature_enabled_impl())
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100034004;
    v43[3] = &unk_100607DD8;
    v43[4] = self;
    id v44 = obj;
    id v45 = v35;
    [(MailboxPickerCollectionHelper *)self _performDataSourceUpdateAnimated:0 forceReload:0 update:v43];
  }
  id v19 = [(MailboxPickerCollectionHelper *)self dataSource];
  long long v42 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  id v33 = v30;
  id v20 = [v33 countByEnumeratingWithState:&v39 objects:v59 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v40;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v33);
        }
        uint64_t v23 = *(void *)(*((void *)&v39 + 1) + 8 * (void)j);
        uint64_t v24 = [v19 snapshot];
        int v25 = [v24 sectionIdentifierForSectionContainingItemIdentifier:v23];

        if (v25)
        {
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_1000F4140;
          v38[3] = &unk_100607E00;
          v38[4] = v23;
          [(MailboxPickerCollectionHelper *)self _performDataSourceUpdateAnimated:1 forceReload:0 update:v38 toSection:v25];
        }
        else
        {
          id v26 = [(MailboxPickerCollectionHelper *)self logClient];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v58 = v23;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#Favorites Did not find section identifier to collapse for itemID: %{public}@", buf, 0xCu);
          }
        }
      }
      id v20 = [v33 countByEnumeratingWithState:&v39 objects:v59 count:16];
    }
    while (v20);
  }

  if (a3 == 1)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000F4200;
    v36[3] = &unk_100607D60;
    v36[4] = self;
    id v37 = v19;
    [(MailboxPickerCollectionHelper *)self _performDataSourceUpdateAnimated:0 forceReload:0 update:v36];
  }
  [(MailboxPickerCollectionHelper *)self updatedSelectedState:v32];
  if (v28) {
    [v32 setContentOffset:0 animated:v7];
  }
  else {
    [(MailboxPickerCollectionHelper *)self updateMailboxSelectionAnimated:0 scrollToSelected:0];
  }
}

- (void)_performDataSourceUpdateAnimated:(BOOL)a3 forceReload:(BOOL)a4 update:(id)a5 toSection:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v11 = (unsigned int (**)(id, id))a5;
  id v12 = a6;
  if (pthread_main_np() != 1)
  {
    id v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"MailboxPickerCollectionHelper.m" lineNumber:403 description:@"Current thread must be main"];
  }
  id v13 = [(MailboxPickerCollectionHelper *)self sectionController];
  id v14 = v13;
  if (v7)
  {
    id v15 = objc_alloc_init((Class)NSDiffableDataSourceSectionSnapshot);
  }
  else
  {
    id v15 = [v13 snapshotForSection:v12];
  }
  id v16 = v15;
  if (v11[2](v11, v15))
  {
    double v17 = [(MailboxPickerCollectionHelper *)self logClient];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10045A32C((uint64_t)v16, (uint64_t)v12, v17);
    }

    [v14 applySnapshot:v16 toSection:v12 animatingDifferences:v8];
  }
}

- (_UIDiffableDataSourceOutlineSectionController)sectionController
{
  return self->_sectionController;
}

- (BOOL)_updateSnapshot:(id)a3 forSection:(id)a4
{
  id v52 = a3;
  id v62 = a4;
  long long v51 = [v62 items];
  v60 = [v51 ef_map:&stru_100607E70];
  if ([v62 isFavorites]) {
    [v62 prepareItemsForView];
  }
  if ([v62 isFavorites])
  {
    uint64_t v5 = [v62 collection];
    unsigned int v6 = [v5 isEditing];

    if (v6)
    {
      uint64_t v7 = [v60 arrayByAddingObject:@"kAddButtonItemIdentifier"];

      v60 = (void *)v7;
    }
  }
  v61 = +[NSOrderedSet orderedSetWithArray:v60];
  BOOL v8 = [v52 items];
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_1000F4810;
  v74[3] = &unk_100606678;
  id v59 = v52;
  id v75 = v59;
  v56 = [v8 ef_filter:v74];

  double v9 = +[NSOrderedSet orderedSetWithArray:v56];
  v57 = [v61 differenceFromOrderedSet:v9];

  int64_t v53 = [(MailboxPickerCollectionHelper *)self _applyRemovalsInSnapshot:v59 differences:v57];
  int64_t v49 = [(MailboxPickerCollectionHelper *)self _applyInsertionsInSnapshot:v59 differences:v57 collection:v61];
  BOOL v54 = (v53 | v49) != 0;
  id v10 = [v62 accountFavoriteItem];
  id v55 = v10;
  if (_os_feature_enabled_impl())
  {
    unsigned int v11 = [v62 isAccounts];
    if (v10) {
      unsigned int v12 = v11;
    }
    else {
      unsigned int v12 = 0;
    }
    if (v12 != 1) {
      goto LABEL_47;
    }
    long long v50 = [v10 itemID];
    id v13 = [v10 subItems];
    long long v48 = [v13 ef_filter:&stru_100607E90];

    id v14 = +[NSMutableDictionary dictionary];
    id v15 = +[NSMutableDictionary dictionary];
    [v15 setObject:v48 forKeyedSubscript:v50];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = v48;
    id v16 = [obj countByEnumeratingWithState:&v70 objects:v84 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v71 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          id v20 = [v19 itemUUID];
          [v14 setObject:v19 forKeyedSubscript:v20];
        }
        id v16 = [obj countByEnumeratingWithState:&v70 objects:v84 count:16];
      }
      while (v16);
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v21 = [v55 subItems];
    id v22 = [v21 countByEnumeratingWithState:&v66 objects:v83 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v67;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v67 != v23) {
            objc_enumerationMutation(v21);
          }
          int v25 = *(void **)(*((void *)&v66 + 1) + 8 * (void)j);
          id v26 = [v25 itemUUID];
          id v27 = [v14 objectForKeyedSubscript:v26];

          if (!v27)
          {
            unsigned int v28 = [v25 representingMailbox];
            uint64_t v29 = [v28 parent];
            v30 = [v29 uniqueId];

            __int16 v31 = [v15 objectForKeyedSubscript:v30];
            id v32 = [v31 mutableCopy];

            if (!v32)
            {
              id v32 = +[NSMutableArray array];
            }
            [v32 addObject:v25];
            [v15 setObject:v32 forKeyedSubscript:v30];
            id v33 = [v25 itemUUID];
            [v14 setObject:v25 forKeyedSubscript:v33];
          }
        }
        id v22 = [v21 countByEnumeratingWithState:&v66 objects:v83 count:16];
      }
      while (v22);
    }

    if ([v15 count])
    {
      sub_100054224(self, v55, v50, v59, v15);
      BOOL v54 = 1;
    }
    id v34 = [v62 collection];
    v35 = [v34 expandedItems];
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1000F4838;
    v64[3] = &unk_100606AD8;
    id v36 = v59;
    id v65 = v36;
    id v37 = [v35 ef_filter:v64];
    id v38 = [v37 ef_compactMap:&stru_100607ED0];

    if ([v55 isExpanded])
    {
      id v39 = [v38 arrayByAddingObject:v50];
    }
    else
    {
      id v39 = v38;
    }
    id v44 = v39;
    if ([v39 count])
    {
      [v36 expandItems:v44];
      BOOL v54 = 1;
    }
  }
  else
  {
    unsigned int v40 = [v62 isAccounts];
    if (v10) {
      unsigned int v41 = v40;
    }
    else {
      unsigned int v41 = 0;
    }
    if (v41 != 1) {
      goto LABEL_47;
    }
    long long v50 = [v10 itemID];
    long long v42 = [v10 subItems];
    id obj = v42;
    if ([v42 count])
    {
      v43 = [(MailboxPickerCollectionHelper *)self snapshotFromFavoriteItems:v42];
      [v59 setChildrenWithSnapshot:v43 forParent:v50];

      BOOL v54 = 1;
      id v10 = v55;
    }
    if (![v10 isExpanded]) {
      goto LABEL_46;
    }
    v82 = v50;
    id v14 = +[NSArray arrayWithObjects:&v82 count:1];
    [v59 expandItems:v14];
    BOOL v54 = 1;
  }

  long long v42 = obj;
LABEL_46:

LABEL_47:
  id v45 = [(MailboxPickerCollectionHelper *)self logClient];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    long long v46 = [v62 sectionIdentifier];
    *(_DWORD *)buf = 138412802;
    v77 = v46;
    __int16 v78 = 2048;
    int64_t v79 = v49;
    __int16 v80 = 2048;
    int64_t v81 = v53;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "#Favorites %@ - Added %ld, removed %ld favorite items", buf, 0x20u);
  }
  return v54;
}

- (OS_os_log)logClient
{
  return self->_logClient;
}

- (int64_t)_applyRemovalsInSnapshot:(id)a3 differences:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [a4 removals];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F4904;
  v11[3] = &unk_100607EF8;
  id v7 = v5;
  id v12 = v7;
  BOOL v8 = [v6 ef_compactMap:v11];

  [v7 deleteItems:v8];
  id v9 = [v8 count];

  return (int64_t)v9;
}

- (void)_performDataSourceUpdateAnimated:(BOOL)a3 forceReload:(BOOL)a4 update:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v9 = (unsigned int (**)(id, id))a5;
  if (pthread_main_np() == 1)
  {
    if (v5)
    {
LABEL_3:
      id v10 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
      goto LABEL_6;
    }
  }
  else
  {
    unsigned int v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MailboxPickerCollectionHelper.m" lineNumber:389 description:@"Current thread must be main"];

    if (v5) {
      goto LABEL_3;
    }
  }
  id v12 = [(MailboxPickerCollectionHelper *)self dataSource];
  id v10 = [v12 snapshot];

LABEL_6:
  if (v9[2](v9, v10))
  {
    id v13 = [(MailboxPickerCollectionHelper *)self logClient];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10045A2B4((uint64_t)v10, v13);
    }

    id v14 = [(MailboxPickerCollectionHelper *)self dataSource];
    [v14 applySnapshot:v10 animatingDifferences:v6];
  }
}

- (int64_t)_applyInsertionsInSnapshot:(id)a3 differences:(id)a4 collection:(id)a5
{
  id v7 = a3;
  [a4 mf_groupedInsertionsForCollection:a5];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (void)v17) == (id)2)
        {
          id v13 = [v12 insertions];
          id v14 = [v12 associatedObject];
          [v7 insertItems:v13 beforeItem:v14];
LABEL_10:

          goto LABEL_12;
        }
        if ([v12 type] == (id)1)
        {
          id v13 = [v12 insertions];
          id v14 = [v12 associatedObject];
          [v7 insertItems:v13 afterItem:v14];
          goto LABEL_10;
        }
        id v13 = [v12 insertions];
        [v7 appendItems:v13];
LABEL_12:
      }
      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  id v15 = [v8 count];
  return (int64_t)v15;
}

- (id)favoriteItemForItemID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MailboxPickerCollectionHelper *)self dataSource];
  BOOL v6 = [v5 indexPathForItemIdentifier:v4];

  if (_os_feature_enabled_impl())
  {
    id v7 = [(MailboxPickerCollectionHelper *)self model];
    id v8 = [v7 sections];
    id v9 = [v8 objectAtIndexedSubscript:[v6 section]];

    uint64_t v10 = [(MailboxPickerCollectionHelper *)self favoriteItemForItemID:v4 inSection:v9];
  }
  else
  {
    uint64_t v10 = [(MailboxPickerCollectionHelper *)self favoriteItemAtIndexPath:v6];
  }

  return v10;
}

- (int64_t)sectionTypeForIndex:(int64_t)a3
{
  id v4 = [(MailboxPickerCollectionHelper *)self model];
  BOOL v5 = [v4 sections];

  if ((unint64_t)[v5 count] <= a3)
  {
    int64_t v7 = 3;
  }
  else
  {
    BOOL v6 = [v5 objectAtIndexedSubscript:a3];
    int64_t v7 = (int64_t)[v6 type];
  }
  return v7;
}

- (MailboxPickerCollectionHelperModel)model
{
  return self->_model;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (id)favoriteItemForItemID:(id)a3 inSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MailboxPickerCollectionHelper *)self model];
  id v9 = [v8 favoriteItemForItemID:v6 inSection:v7];

  return v9;
}

- (void)_favoritesDidChange:(id)a3
{
  id v7 = a3;
  if (pthread_main_np() != 1)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MailboxPickerCollectionHelper.m" lineNumber:777 description:@"Current thread must be main"];
  }
  BOOL v5 = [(MailboxPickerCollectionHelper *)self favoritesDidChangedDebouncer];
  [v5 debounceResult:v7];
}

- (EFDebouncer)favoritesDidChangedDebouncer
{
  return self->_favoritesDidChangedDebouncer;
}

- (void)setSectionController:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (void)setCurrentFocus:(id)a3
{
}

- (void)selectMailbox:(id)a3 item:(id)a4 animated:(BOOL)a5
{
}

- (MailMainScene)scene
{
  return self->_scene;
}

- (void)reloadDataSource
{
}

- (NSArray)mailboxesForMessageList
{
  return self->_mailboxesForMessageList;
}

- (EMFocus)currentFocus
{
  return self->_currentFocus;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(MailboxPickerCollectionHelper *)self favoritesDidChangedDebouncer];
  [v4 cancel];

  v5.receiver = self;
  v5.super_class = (Class)MailboxPickerCollectionHelper;
  [(MailboxPickerCollectionHelper *)&v5 dealloc];
}

- (void)reloadFavorites
{
  id v4 = [(MailboxPickerCollectionHelper *)self model];
  objc_super v5 = [v4 sections];
  id v6 = [v5 firstObject];

  if (([v6 isFavorites] & 1) == 0)
  {
    uint64_t v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MailboxPickerCollectionHelper.m" lineNumber:354 description:@"First section is not favorites"];
  }
  id v7 = v6;
  id v12 = v7;
  id v8 = [v7 sectionIdentifier:_NSConcreteStackBlock 3221225472 sub_1000F451C &unk_100607E50 self];
  [(MailboxPickerCollectionHelper *)self _performDataSourceUpdateAnimated:0 forceReload:0 update:&v11 toSection:v8];

  id v9 = [(MailboxPickerCollectionHelper *)self collectionView];
  [(MailboxPickerCollectionHelper *)self updatedSelectedState:v9];
}

- (void)reloadDataForIndexPaths:(id)a3
{
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    id v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MailboxPickerCollectionHelper.m" lineNumber:364 description:@"Current thread must be main"];
  }
  id v6 = [(MailboxPickerCollectionHelper *)self collectionView];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        if ((objc_msgSend(v6, "mf_isIndexPathValid:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15) & 1) == 0)
        {
          uint64_t v11 = [(MailboxPickerCollectionHelper *)self logClient];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Favorites reloadItemsAtIndexPaths skipped because the data is out of sync with UI", buf, 2u);
          }

          goto LABEL_15;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  if ([v7 count])
  {
    id v12 = [(MailboxPickerCollectionHelper *)self logClient];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Favorites reloadItemsAtIndexPaths %@", buf, 0xCu);
    }

    [(MailboxPickerCollectionHelper *)self _reloadDataForCellsAtIndexPaths:v7];
    [(MailboxPickerCollectionHelper *)self updateMailboxSelectionAnimated:0 scrollToSelected:0];
  }
  else
  {
    id v13 = [(MailboxPickerCollectionHelper *)self logClient];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Favorites reloadItemsAtIndexPaths reloadingCollectionViewData indexPaths:%@", buf, 0xCu);
    }

    [(MailboxPickerCollectionHelper *)self reloadDataSource];
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v10 = v7;
  if (([v10 isHidden] & 1) == 0)
  {
    uint64_t v9 = [(MailboxPickerCollectionHelper *)self favoriteItemAtIndexPath:v8];
    [v10 associateViewWithEntityFromFavoriteItem:v9];
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MailboxPickerCollectionHelper *)self isPerformingMultiSelect]
    && ![(MailboxPickerCollectionHelper *)self canBeginMultiSelectAtIndexPath:v7])
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = [(MailboxPickerCollectionHelper *)self isCellSelectable:v6 atIndexPath:v7];
  }

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if ([(MailboxPickerCollectionHelper *)self isAddButtonAtIndexPath:v6])
  {
    id v7 = [(MailboxPickerCollectionHelper *)self delegate];
    BOOL v8 = [v14 cellForItemAtIndexPath:v6];
    [v7 mailboxCollectionHelperWantsToShowAddFavoritesController:self sourceView:v8];

    [v14 deselectItemAtIndexPath:v6 animated:1];
  }
  else
  {
    uint64_t v9 = [(MailboxPickerCollectionHelper *)self favoriteItemAtIndexPath:v6];
    id v10 = [(MailboxPickerCollectionHelper *)self model];
    uint64_t v11 = [v10 sectionForIndexPath:v6];

    id v12 = [(MailboxPickerCollectionHelper *)self collectionView];
    unsigned int v13 = [v12 isEditing];

    if (v13)
    {
      if ([v11 isFavorites])
      {
        [v9 setSelected:1 fromUI:1];
        [(MailboxPickerCollectionHelper *)self updateCheckmarkColor:v14];
      }
      else if ([v11 isAccounts])
      {
        [v9 wasSelected:self indexPath:v6 accessoryTapped:0 animated:1];
        [v14 deselectItemAtIndexPath:v6 animated:1];
      }
    }
    else
    {
      sub_1000F4CD0((uint64_t)self, v9, v11);
      [v9 wasSelected:self indexPath:v6 accessoryTapped:0 animated:1];
    }
  }
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MailboxPickerCollectionHelper *)self collectionView];
  if (![v8 isEditing])
  {

    goto LABEL_10;
  }
  id v9 = [v7 section];

  if (v9)
  {
LABEL_10:
    BOOL v14 = 1;
    goto LABEL_11;
  }
  uint64_t v10 = (uint64_t)[v6 numberOfItemsInSection:0];
  uint64_t v11 = v10;
  if (v10 < 2)
  {
    BOOL v14 = 0;
  }
  else
  {
    uint64_t v12 = v10 - 1;
    uint64_t v13 = 1;
    BOOL v14 = 1;
    do
    {
      if ((id)(v13 - 1) != [v7 item])
      {
        uint64_t v15 = +[NSIndexPath indexPathForItem:v13 - 1 inSection:0];
        long long v16 = [(MailboxPickerCollectionHelper *)self favoriteItemAtIndexPath:v15];

        LOBYTE(v15) = [v16 isSelected];
        if (v15) {
          break;
        }
      }
      BOOL v14 = v13++ < v12;
    }
    while (v11 != v13);
  }
LABEL_11:

  return v14;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(MailboxPickerCollectionHelper *)self collectionView];
  unsigned int v8 = [v7 isEditing];

  if (v8)
  {
    id v9 = [(MailboxPickerCollectionHelper *)self favoriteItemAtIndexPath:v6];
    [v9 setSelected:0 fromUI:1];
    [(MailboxPickerCollectionHelper *)self updateCheckmarkColor:v10];
  }
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v5 = [(MailboxPickerCollectionHelper *)self favoriteItemAtIndexPath:a4];
  unsigned __int8 v6 = [v5 isExpandable];

  return v6;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MailboxPickerCollectionHelper *)self isCellSelectable:v6 atIndexPath:v7]) {
    LOBYTE(v8) = 1;
  }
  else {
    int v8 = _os_feature_enabled_impl() ^ 1;
  }

  return v8;
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
}

- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3
{
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MailboxPickerCollectionHelper *)self collectionView];
  unsigned __int8 v7 = [v6 isEditing];

  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    id v9 = [(MailboxPickerCollectionHelper *)self favoriteItemAtIndexPath:v5];
    if ([v9 sourceType] == (id)1)
    {
      id v10 = +[VIPManager defaultInstance];
      uint64_t v11 = [v10 allVIPs];
      BOOL v8 = [v11 count] != 0;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  return v8;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if (![(MailboxPickerCollectionHelper *)self isAddButtonAtIndexPath:v10])
  {
    id v15 = [v10 section];
    if (v15 == [v9 section])
    {
      BOOL v12 = 0;
      BOOL v13 = 0;
      id v11 = v10;
      goto LABEL_15;
    }
    long long v16 = [(MailboxPickerCollectionHelper *)self model];
    BOOL v14 = [v16 sections];

    long long v17 = [v14 objectAtIndexedSubscript:[v9 section]];
    if ([v17 isAccounts])
    {
      int64_t v18 = +[MailboxPickerCollectionHelperModel indexOfFirstAccountSection:v14];
      int64_t v19 = +[MailboxPickerCollectionHelperModel indexOfLastAccountSection:v14];
      id v20 = (char *)[v10 section];
      if ((uint64_t)v20 <= (uint64_t)((char *)[v9 section] - 2))
      {
        BOOL v12 = 1;
      }
      else
      {
        uint64_t v21 = (char *)[v10 section];
        BOOL v12 = (uint64_t)v21 >= (uint64_t)((char *)[v9 section] + 2);
      }
      if ((uint64_t)[v10 section] >= v18 - 1)
      {
        id v25 = [v10 section];
        BOOL v13 = (uint64_t)v25 <= v19 + 1;
        if ((uint64_t)v25 <= v19 + 1 && v12)
        {
          +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, [v10 section]);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v12 = 1;
          BOOL v13 = 1;
          goto LABEL_13;
        }
LABEL_12:
        id v11 = v9;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
    BOOL v13 = 0;
    goto LABEL_12;
  }
  id v11 = v9;
  BOOL v12 = 0;
  BOOL v13 = 0;
  BOOL v14 = v10;
LABEL_14:

LABEL_15:
  id v22 = [(MailboxPickerCollectionHelper *)self logClient];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = NSStringFromSelector(a2);
    int v27 = 138413570;
    unsigned int v28 = v23;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v10;
    __int16 v33 = 2112;
    id v34 = v11;
    __int16 v35 = 1024;
    BOOL v36 = v12;
    __int16 v37 = 1024;
    BOOL v38 = v13;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "#Favorites %@  - \torgPath:%@ \tpropPath:%@, \tdestPath:%@ invalR:%d accR:%d", (uint8_t *)&v27, 0x36u);
  }

  return v11;
}

- (id)favoriteItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (-[MailboxPickerCollectionHelper sectionTypeForIndex:](self, "sectionTypeForIndex:", [v4 section])
    && (_os_feature_enabled_impl() & 1) != 0)
  {
    id v5 = [(MailboxPickerCollectionHelper *)self dataSource];
    id v6 = [v5 itemIdentifierForIndexPath:v4];

    uint64_t v7 = [(MailboxPickerCollectionHelper *)self favoriteItemForItemID:v6];
  }
  else
  {
    id v6 = [(MailboxPickerCollectionHelper *)self model];
    uint64_t v7 = [v6 favoriteItemAtIndexPath:v4];
  }
  BOOL v8 = (void *)v7;

  return v8;
}

- (void)_favoritesFocusDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxPickerCollectionHelper *)self logClient];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Favorites _favoritesFocusDidChange", buf, 2u);
  }

  id v6 = v4;
  id v9 = v6;
  id v10 = self;
  uint64_t v7 = +[EFScheduler mainThreadScheduler];
  [v7 performBlock:&v8];
}

- (BOOL)isAddButtonAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxPickerCollectionHelper *)self dataSource];
  id v6 = [v5 indexPathForItemIdentifier:@"kAddButtonItemIdentifier"];

  if (v6) {
    unsigned __int8 v7 = [v4 isEqual:v6];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)isCellSelectable:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MailboxPickerCollectionHelper *)self isAddButtonAtIndexPath:v7])
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    id v9 = [v6 cellForItemAtIndexPath:v7];
    unsigned __int8 v8 = [v9 isCellEnabled];
  }
  return v8;
}

- (BOOL)canBeginMultiSelectAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxPickerCollectionHelper *)self model];
  id v6 = [v5 sectionForIndexPath:v4];
  if ([v6 isFavorites]) {
    unsigned int v7 = ![(MailboxPickerCollectionHelper *)self isAddButtonAtIndexPath:v4];
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)canReorderItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(MailboxPickerCollectionHelper *)self isAddButtonAtIndexPath:v4])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    id v6 = [(MailboxPickerCollectionHelper *)self favoriteItemAtIndexPath:v4];
    unsigned int v7 = [(MailboxPickerCollectionHelper *)self model];
    unsigned __int8 v8 = [v7 sectionForIndexPath:v4];
    unsigned int v9 = [v8 isAccounts];

    if (v9)
    {
      if ([v6 type] == (id)1) {
        unsigned int v5 = [v6 isExpanded] ^ 1;
      }
      else {
        LOBYTE(v5) = 0;
      }
    }
    else
    {
      LOBYTE(v5) = [v6 isMovable];
    }
  }
  return v5;
}

- (void)updateCellForSourceType:(unint64_t)a3
{
  if (pthread_main_np() != 1)
  {
    BOOL v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MailboxPickerCollectionHelper.m" lineNumber:870 description:@"Current thread must be main"];
  }
  id v6 = [(MailboxPickerCollectionHelper *)self collectionView];
  unsigned __int8 v7 = [v6 isEditing];

  if ((v7 & 1) == 0)
  {
    unsigned __int8 v8 = +[FavoriteItem itemForSharedMailboxWithType:a3 selected:0];
    unsigned int v9 = [(MailboxPickerCollectionHelper *)self indexPathForItem:v8];
    if (v9)
    {
      id v10 = [(MailboxPickerCollectionHelper *)self logClient];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        BOOL v12 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543874;
        long long v16 = v12;
        __int16 v17 = 2048;
        unint64_t v18 = a3;
        __int16 v19 = 2114;
        id v20 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@ %lu, indexPath: %{public}@", buf, 0x20u);
      }
      BOOL v14 = v9;
      id v11 = +[NSArray arrayWithObjects:&v14 count:1];
      [(MailboxPickerCollectionHelper *)self reloadDataForIndexPaths:v11];
    }
  }
}

- (void)updateCheckmarkColor:(id)a3
{
  id v4 = [(MailboxPickerCollectionHelper *)self collectionView];
  unsigned int v5 = [v4 isEditing];

  if (v5)
  {
    id v6 = [(MailboxPickerCollectionHelper *)self favoritesManager];
    unsigned __int8 v7 = [v6 mailboxesCollection];
    unsigned __int8 v8 = [v7 visibleItems];

    if (objc_msgSend(v8, "ef_countObjectsPassingTest:", &stru_100607F88) == (id)1)
    {
      unsigned int v9 = +[UIColor lightGrayColor];
    }
    else
    {
      unsigned int v9 = 0;
    }
    id v10 = [(MailboxPickerCollectionHelper *)self multiSelectCheckmarkColor];

    if (v9 != v10)
    {
      [(MailboxPickerCollectionHelper *)self setMultiSelectCheckmarkColor:v9];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v11 = [(MailboxPickerCollectionHelper *)self collectionView];
      BOOL v12 = [v11 visibleCells];

      id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v12);
            }
            long long v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            [v16 setMultiselectCheckmarkColor:v9];
            [v16 setNeedsUpdateConfiguration];
          }
          id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v13);
      }
    }
  }
}

- (void)_configureCell:(id)a3 forItemID:(id)a4 indexPath:(id)a5
{
  id v22 = a3;
  id v7 = a5;
  unsigned __int8 v8 = [(MailboxPickerCollectionHelper *)self model];
  unsigned int v9 = [v8 sections];
  id v10 = [v9 objectAtIndexedSubscript:[v7 section]];

  id v11 = [(MailboxPickerCollectionHelper *)self favoriteItemAtIndexPath:v7];
  [v11 configureOutlineCell:v22];
  BOOL v12 = [v11 representingMailbox];
  if ([v10 isAccounts])
  {
    if ([v11 type] == (id)1) {
      [(MailboxPickerCollectionHelper *)self _configureAccountsCell:v22 forItem:v11];
    }
    else {
      [(MailboxPickerCollectionHelper *)self _configureMailboxCell:v22 mailbox:v12 indexPath:v7];
    }
  }
  else
  {
    if ([v10 isFavorites])
    {
      if ([v12 type] != (id)7)
      {
        id v13 = [(MailboxPickerCollectionHelper *)self collectionView];
        unsigned int v14 = [v13 isEditing];

        if (v14)
        {
          id v15 = [(MailboxPickerCollectionHelper *)self delegate];
          id v16 = [v15 mailboxCollectionHelper:self shouldDisableForEditingCellForMailbox:v12];

          [v22 setDisabledForEditing:v16];
        }
      }
    }
    if (!v12 && [v11 type] == (id)2)
    {
      long long v17 = [v11 displayName];
      [v22 setTitle:v17];
    }
    long long v18 = [(MailboxPickerCollectionHelper *)self currentFocus];
    if (v12 && ([v11 type] == (id)2 || objc_msgSend(v11, "type") == (id)3))
    {
      if (v18)
      {
        long long v19 = [v12 account];
        long long v20 = [v19 identifier];
        unsigned __int8 v21 = [v18 isFocusedIdentifier:v20];

        if ((v21 & 1) == 0)
        {
          [v22 setShowFocusIcon:1];
          [v22 setShouldShowBadgeCountIfNecessary:0];
        }
      }
    }
    [(MailboxPickerCollectionHelper *)self _configureFlattenedCell:v22 forItem:v11];
  }
  [v22 setNeedsUpdateConfiguration];
}

- (void)_configureAddMailboxCell:(id)a3
{
  id v7 = a3;
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"ADD_MAILBOX_BUTTON" value:&stru_100619928 table:@"Main"];
  [v7 setTitle:v4];

  [v7 setUseTintColor:1];
  unsigned int v5 = +[UIColor clearColor];
  id v6 = +[UIImage mf_imageWithColor:size:](UIImage, "mf_imageWithColor:size:", v5, 1.0, 1.0);
  [v7 setIcon:v6];

  [v7 setBadgeCount:0];
  [v7 setNeedsUpdateConfiguration];
}

- (void)_configureMailboxCell:(id)a3 mailbox:(id)a4 indexPath:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  [v18 setSubtitle:0];
  objc_msgSend(v18, "setDisabledForEditing:", objc_msgSend(v8, "mv_isEditable") ^ 1);
  id v10 = [v8 children];
  id v11 = [v10 count];

  if (v11)
  {
    if (_os_feature_enabled_impl()) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  [v18 setDisclosureType:v12];
  id v13 = [v18 traitCollection];
  unsigned __int8 v14 = [v13 mf_useSplitViewStyling];

  if ((v14 & 1) == 0)
  {
    id v15 = [v9 mui_nextIndexPath];
    id v16 = [(MailboxPickerCollectionHelper *)self favoriteItemAtIndexPath:v15];

    if (v16) {
      BOOL v17 = [v16 type] == (id)1;
    }
    else {
      BOOL v17 = 0;
    }
    [v18 setForceZeroSeparatorInset:v17];
  }
}

- (void)_configureFlattenedCell:(id)a3 forItem:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [v7 setFlattenHierarchy:1];
  [v7 setHideBadgeCountForEditing:1];
  [v7 setCanMoveItem:[v6 isMovable]];
  [v7 setShowsSelectionCheckmarkForEditing:1];
  [v7 setDisclosureType:0];
  if ([v6 wantsDisclosureButton])
  {
    [v7 setShowsDetailDisclosureButton:1];
    [v7 addTargetForDetailDisclosure:self action:"_detailsDisclosureButtonTapped:"];
  }
  else
  {
    [v7 setShowsDetailDisclosureButton:0];
  }
}

- (void)_configureAccountsCell:(id)a3 forItem:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(MailboxPickerCollectionHelper *)self currentFocus];
  if (v7)
  {
    id v8 = [v6 account];
    id v9 = [v8 identifier];
    unsigned __int8 v10 = [v7 isFocusedIdentifier:v9];

    if ((v10 & 1) == 0) {
      [v15 setShowFocusIcon:1];
    }
  }
  if ([v6 isExpandable])
  {
    [v15 setExpandable:1];
    [v15 setExpanded:[v6 isExpanded]];
    [v15 setHideBadgeCountForEditing:1];
    [v15 setDisclosureType:1];
    id v11 = [(MailboxPickerCollectionHelper *)self collectionView];
    uint64_t v12 = [v11 backgroundColor];
    [v15 setBackgroundColor:v12];

    [v15 setCanMoveItem:[v6 isMovable]];
    id v13 = [v15 traitCollection];
    unsigned __int8 v14 = [v13 mf_useSplitViewStyling];

    if ((v14 & 1) == 0) {
      [v15 setForceZeroSeparatorInset:1];
    }
  }
  else
  {
    [(MailboxPickerCollectionHelper *)self _configureFlattenedCell:v15 forItem:v6];
  }
}

- (void)_detailsDisclosureButtonTapped:(id)a3
{
  id v5 = a3;
  id v4 = [(MailboxPickerCollectionHelper *)self delegate];
  [v4 mailboxCollectionHelperDidTapDetailsDisclosure:self sender:v5];
}

- (void)_reloadDataForCellsAtIndexPaths:(id)a3
{
  id v16 = a3;
  id v4 = [(MailboxPickerCollectionHelper *)self collectionView];
  id v5 = [v4 indexPathsForVisibleItems];
  id v6 = +[NSSet setWithArray:v5];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v16;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if ([v6 containsObject:v11])
        {
          uint64_t v12 = [(MailboxPickerCollectionHelper *)self collectionView];
          id v13 = [v12 cellForItemAtIndexPath:v11];

          unsigned __int8 v14 = [(MailboxPickerCollectionHelper *)self dataSource];
          id v15 = [v14 itemIdentifierForIndexPath:v11];

          [(MailboxPickerCollectionHelper *)self _configureCell:v13 forItemID:v15 indexPath:v11];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(MailboxPickerCollectionHelper *)self favoritesManager];
  id v8 = [v7 mailboxesCollection];

  uint64_t v9 = [(MailboxPickerCollectionHelper *)self favoritesManager];
  unsigned __int8 v10 = [v9 accountsCollection];

  uint64_t v11 = [(MailboxPickerCollectionHelper *)self collectionView];
  [v8 setEditing:v5];
  __int16 v31 = [v8 visibleItems];
  id v32 = [v11 mui_sortedIndexPathsForVisibleItems];
  [v11 visibleBounds];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000F717C;
  v36[3] = &unk_100607FB0;
  v36[4] = self;
  id v20 = v10;
  id v37 = v20;
  id v21 = v31;
  id v38 = v21;
  id v22 = v11;
  id v39 = v22;
  uint64_t v40 = v13;
  uint64_t v41 = v15;
  uint64_t v42 = v17;
  uint64_t v43 = v19;
  [v32 enumerateObjectsUsingBlock:v36];
  [v20 setEditing:v5];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000F72F8;
  v33[3] = &unk_100607FD8;
  id v23 = v21;
  id v34 = v23;
  BOOL v35 = v5;
  uint64_t v24 = [v8 uniqueId];
  [(MailboxPickerCollectionHelper *)self _performDataSourceUpdateAnimated:v4 forceReload:1 update:v33 toSection:v24];

  [v22 setEditing:v5];
  if (v5)
  {
    id v25 = +[UIColor mailInteractiveColor];
    [(MailboxPickerCollectionHelper *)self setMultiSelectCheckmarkColor:v25];

    [(MailboxPickerCollectionHelper *)self updatedSelectedState:v22];
  }
  else
  {
    id v45 = v23;
    id v26 = +[NSArray arrayWithObjects:&v45 count:1];
    int v27 = [(MailboxPickerCollectionHelper *)self favoritesManager];
    id v44 = v8;
    unsigned int v28 = +[NSArray arrayWithObjects:&v44 count:1];
    [v27 updateCollections:v28 withItems:v26];

    __int16 v29 = [(MailboxPickerCollectionHelper *)self model];
    id v30 = [v29 favoritesSection];
    [v30 prepareItemsForView];

    [(MailboxPickerCollectionHelper *)self updateMailboxSelectionAnimated:v4 scrollToSelected:0];
  }
  [(MailboxPickerCollectionHelper *)self setPinnedItemIdentifier:0];
  [(MailboxPickerCollectionHelper *)self setPinnedItemOffset:0.0];
}

- (void)selectAccount:(id)a3 item:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10 && [v10 isExpandable])
  {
    objc_msgSend(v10, "setExpanded:", objc_msgSend(v10, "isExpanded") ^ 1);
    uint64_t v12 = [(MailboxPickerCollectionHelper *)self favoritesManager];
    [v12 refreshCollectionForItemExpansion:v10];

    uint64_t v13 = [(MailboxPickerCollectionHelper *)self collectionView];
    [v13 deselectItemAtIndexPath:v11 animated:0];

    uint64_t v14 = [(MailboxPickerCollectionHelper *)self logClient];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [(MailboxPickerCollectionHelper *)self favoritesManager];
      uint64_t v15 = [v22 accountsCollection];
      uint64_t v16 = [v15 uniqueId];
      uint64_t v17 = [v10 itemID];
      unsigned int v18 = [v10 isExpanded];
      uint64_t v19 = [v10 subItems];
      *(_DWORD *)buf = 138413058;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      id v26 = v17;
      __int16 v27 = 1024;
      unsigned int v28 = v18;
      __int16 v29 = 2048;
      id v30 = [v19 count];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Favorites selectAccount section:%@ account:%@ expand:%{BOOL}d, subItems:%ld", buf, 0x26u);
    }
  }
  if (v9)
  {
    id v20 = [(MailboxPickerCollectionHelper *)self scene];
    id v21 = +[NSSet setWithObject:v9];
    [v20 setSelectedAccounts:v21];
  }
}

- (void)selectCombinedInboxWithSourceType:(unint64_t)a3 item:(id)a4 animated:(BOOL)a5
{
}

- (void)selectCombinedMailboxWithType:(int64_t)a3 item:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [(MailboxPickerCollectionHelper *)self logClient];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = +[NSNumber numberWithInteger:a3];
    id v11 = [v8 itemID];
    *(_DWORD *)buf = 138412802;
    __int16 v25 = v10;
    __int16 v26 = 2114;
    __int16 v27 = v11;
    __int16 v28 = 1024;
    BOOL v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Favorites selectCombinedMailboxWith type:%@ item:%{public}@ animated:%{BOOL}d", buf, 0x1Cu);
  }
  uint64_t v12 = [(MailboxPickerCollectionHelper *)self delegate];
  uint64_t v13 = [v12 displayedAccountsForMailboxCollectionHelper:self];
  uint64_t v14 = [(MailboxPickerCollectionHelper *)self scene];
  [v14 setSelectedAccounts:v13];

  if (!v8)
  {
    id v8 = +[FavoriteItem itemForUnifiedMailboxWithType:a3 selected:0];
  }
  uint64_t v15 = [(MailboxPickerCollectionHelper *)self favoritesManager];
  uint64_t v16 = [v15 lastSelectedItem];
  if (([v16 isEqual:v8] & 1) == 0)
  {

LABEL_9:
    uint64_t v19 = [v8 smartMailbox];
    id v23 = v19;
    id v20 = +[NSArray arrayWithObjects:&v23 count:1];
    mailboxesForMessageList = self->_mailboxesForMessageList;
    self->_mailboxesForMessageList = v20;

    id v22 = [(MailboxPickerCollectionHelper *)self favoritesManager];
    [v22 setLastSelectedItem:v8];

    [(MailboxPickerCollectionHelper *)self updateMailboxSelectionAnimated:0 scrollToSelected:1];
    goto LABEL_10;
  }
  uint64_t v17 = [(MailboxPickerCollectionHelper *)self mailboxesForMessageList];
  BOOL v18 = v17 == 0;

  if (v18) {
    goto LABEL_9;
  }
LABEL_10:
  [v12 mailboxCollectionHelper:self wantsToPopToMailboxPicker:1 andPushMessageListViewControllerIfNecessaryAnimated:v5];
}

- (void)selectCombinedMailbox:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MailboxPickerCollectionHelper *)self logClient];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Favorites selectCombinedMailbox %{public}@", (uint8_t *)&v11, 0xCu);
  }

  id v6 = v4;
  if ([v6 isEqual:MFCombinedMailboxAllInbox])
  {
    uint64_t v7 = 7;
LABEL_15:

    [(MailboxPickerCollectionHelper *)self selectCombinedMailboxWithType:v7 item:0 animated:0];
    goto LABEL_16;
  }
  if ([v6 isEqual:MFCombinedMailboxAllDrafts])
  {
    uint64_t v7 = 5;
    goto LABEL_15;
  }
  if ([v6 isEqual:MFCombinedMailboxAllSent])
  {
    uint64_t v7 = 4;
    goto LABEL_15;
  }
  if ([v6 isEqual:MFCombinedMailboxAllArchive])
  {
    uint64_t v7 = 102;
    goto LABEL_15;
  }
  if ([v6 isEqual:MFCombinedMailboxAllTrash])
  {
    uint64_t v7 = 103;
    goto LABEL_15;
  }
  if ([v6 isEqual:MFCombinedMailboxAllJunk])
  {
    uint64_t v7 = 101;
    goto LABEL_15;
  }

  id v8 = v6;
  if ([v8 isEqual:MFCombinedMailboxFlagged])
  {
    uint64_t v9 = 2;
  }
  else if ([v8 isEqual:MFCombinedMailboxUnread])
  {
    uint64_t v9 = 3;
  }
  else if ([v8 isEqual:MFCombinedMailboxToday])
  {
    uint64_t v9 = 7;
  }
  else if ([v8 isEqual:MFCombinedMailboxToCC])
  {
    uint64_t v9 = 4;
  }
  else if ([v8 isEqual:MFCombinedMailboxAttachments])
  {
    uint64_t v9 = 5;
  }
  else if ([v8 isEqual:MFCombinedMailboxThreadNotifications])
  {
    uint64_t v9 = 6;
  }
  else if ([v8 isEqual:MFCombinedMailboxMutedThreads])
  {
    uint64_t v9 = 8;
  }
  else
  {
    uint64_t v9 = [v8 isEqual:MFCombinedMailboxVIP];
  }

  id v10 = +[FavoriteItem itemForSharedMailboxWithType:v9 selected:0];
  [(MailboxPickerCollectionHelper *)self selectCombinedInboxWithSourceType:v9 item:v10 animated:0];

LABEL_16:
}

- (void)selectCustomViewController:(id)a3 item:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MailboxPickerCollectionHelper *)self delegate];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000F7EBC;
  v12[3] = &unk_100608000;
  v12[4] = self;
  id v11 = v9;
  id v13 = v11;
  [v10 mailboxCollectionHelper:self wantsToShowCustomViewController:v8 animated:v5 sourceViewBlock:v12];
}

- (void)selectVIPMailboxWithItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(MailboxPickerCollectionHelper *)self logClient];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 itemID];
    *(_DWORD *)buf = 138543618;
    id v20 = v8;
    __int16 v21 = 1024;
    BOOL v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#Favorites selectVIPMailbox item:%{public}@ animated:%{BOOL}d", buf, 0x12u);
  }
  id v9 = [(MailboxPickerCollectionHelper *)self delegate];
  id v10 = [v9 displayedAccountsForMailboxCollectionHelper:self];
  id v11 = [(MailboxPickerCollectionHelper *)self scene];
  [v11 setSelectedAccounts:v10];

  id v12 = [v6 additionalPredicate];
  id v13 = [v6 displayName];
  uint64_t v14 = +[EMSmartMailbox vipMailboxWithName:v13 additionalPredicate:v12];

  BOOL v18 = v14;
  uint64_t v15 = +[NSArray arrayWithObjects:&v18 count:1];
  mailboxesForMessageList = self->_mailboxesForMessageList;
  self->_mailboxesForMessageList = v15;

  uint64_t v17 = [(MailboxPickerCollectionHelper *)self favoritesManager];
  [v17 setLastSelectedItem:v6];

  [v9 mailboxCollectionHelper:self wantsToPopToMailboxPicker:1 andPushMessageListViewControllerIfNecessaryAnimated:v4];
}

- (void)setScene:(id)a3
{
}

- (void)setCollectionView:(id)a3
{
}

- (void)setFavoritesManager:(id)a3
{
}

- (void)setFavoritesDidChangedDebouncer:(id)a3
{
}

- (void)setModel:(id)a3
{
}

- (void)setLogClient:(id)a3
{
}

- (BOOL)isPerformingMultiSelect
{
  return self->_isPerformingMultiSelect;
}

- (void)setIsPerformingMultiSelect:(BOOL)a3
{
  self->_isPerformingMultiSelect = a3;
}

- (UIColor)multiSelectCheckmarkColor
{
  return self->_multiSelectCheckmarkColor;
}

- (void)setMultiSelectCheckmarkColor:(id)a3
{
}

- (void)setPinnedItemIdentifier:(id)a3
{
}

- (double)pinnedItemOffset
{
  return self->_pinnedItemOffset;
}

- (void)setPinnedItemOffset:(double)a3
{
  self->_pinnedItemOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedItemIdentifier, 0);
  objc_storeStrong((id *)&self->_multiSelectCheckmarkColor, 0);
  objc_storeStrong((id *)&self->_currentFocus, 0);
  objc_storeStrong((id *)&self->_logClient, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_favoritesDidChangedDebouncer, 0);
  objc_storeStrong((id *)&self->_favoritesManager, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_mailboxesForMessageList, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end