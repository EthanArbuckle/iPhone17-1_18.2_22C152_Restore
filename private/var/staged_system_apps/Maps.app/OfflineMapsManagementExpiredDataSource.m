@interface OfflineMapsManagementExpiredDataSource
- (BOOL)_canItemIdentifierBeSelected:(id)a3;
- (BOOL)canRestoreAnyMaps;
- (BOOL)canRestoreSelectedMaps;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (GEOMapDataSubscriptionManager)subscriptionManager;
- (OfflineMapsManagementExpiredDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4;
- (OfflineMapsManagementExpiredDataSourceDelegate)offlineDelegate;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)swipeActionsConfigurationForIndexPath:(id)a3;
- (void)_deleteSelectedMapsAndPerformBlock:(id)a3;
- (void)_fetchExpiredSubscriptionsAnimated:(BOOL)a3;
- (void)_restoreSubscription:(id)a3 completionHandler:(id)a4;
- (void)_updateContentAnimated:(BOOL)a3;
- (void)clearSelectedMaps;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)commonInit;
- (void)restoreSelectedMaps;
- (void)setActive:(BOOL)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setOfflineDelegate:(id)a3;
- (void)setSubscriptionManager:(id)a3;
- (void)subscriptionInfosDidChange:(id)a3;
@end

@implementation OfflineMapsManagementExpiredDataSource

- (OfflineMapsManagementExpiredDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)OfflineMapsManagementExpiredDataSource;
  v4 = [(DataSource *)&v7 initWithCollectionView:a3 updateLocation:a4];
  v5 = v4;
  if (v4) {
    [(OfflineMapsManagementExpiredDataSource *)v4 commonInit];
  }
  return v5;
}

- (void)commonInit
{
  id v3 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
  [(OfflineMapsManagementExpiredDataSource *)self setSubscriptionManager:v3];

  v4 = [(DataSource *)self collectionView];
  [v4 setDelegate:self];

  v5 = [(DataSource *)self collectionView];
  uint64_t v6 = objc_opt_class();
  objc_super v7 = +[TwoLineCollectionViewListCell identifier];
  [v5 registerClass:v6 forCellWithReuseIdentifier:v7];

  v8 = [(DataSource *)self collectionView];
  uint64_t v9 = objc_opt_class();
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v8 registerClass:v9 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:v11];

  id v12 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v13 = [(DataSource *)self collectionView];
  v14 = sub_10001CBB8(self);
  id v15 = [v12 initWithCollectionView:v13 cellProvider:v14];
  [(OfflineMapsManagementExpiredDataSource *)self setDiffableDataSource:v15];

  v16 = sub_1005B38D0(self);
  v17 = [(OfflineMapsManagementExpiredDataSource *)self diffableDataSource];
  [v17 setSupplementaryViewProvider:v16];

  [(OfflineMapsManagementExpiredDataSource *)self _fetchExpiredSubscriptionsAnimated:0];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OfflineMapsManagementExpiredDataSource;
  -[DataSource setActive:](&v7, "setActive:");
  v5 = +[MapsOfflineUIHelper sharedHelper];
  uint64_t v6 = v5;
  if (v3) {
    [v5 addObserver:self];
  }
  else {
    [v5 removeObserver:self];
  }
}

- (void)clearSelectedMaps
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1006CFC24;
  v3[3] = &unk_1012F5350;
  objc_copyWeak(&v4, &location);
  [(OfflineMapsManagementExpiredDataSource *)self _deleteSelectedMapsAndPerformBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)restoreSelectedMaps
{
  v16 = +[NSMutableArray array];
  BOOL v3 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(DataSource *)self collectionView];
  v5 = [v4 indexPathsForSelectedItems];

  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v8);
        v10 = [(OfflineMapsManagementExpiredDataSource *)self diffableDataSource];
        v11 = [v10 itemIdentifierForIndexPath:v9];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          v13 = [v12 subscription];
          [v16 addObject:v13];

          [v3 addObject:v12];
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  objc_initWeak(&location, self);
  v14 = [(OfflineMapsManagementExpiredDataSource *)self offlineDelegate];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1006D009C;
  v17[3] = &unk_1012E5D30;
  objc_copyWeak(&v19, &location);
  id v15 = v3;
  id v18 = v15;
  [v14 didSelectRestoreExpiredSubscriptions:v16 completionHandler:v17];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (BOOL)canRestoreAnyMaps
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_expiredSubscriptions;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) subscription:v9];
        BOOL v7 = sub_1006D0280(v6);

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)canRestoreSelectedMaps
{
  id v3 = [(DataSource *)self collectionView];
  uint64_t v4 = [v3 indexPathsForSelectedItems];
  id v5 = [v4 count];

  if (!v5) {
    return 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(DataSource *)self collectionView];
  BOOL v7 = [v6 indexPathsForSelectedItems];

  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v13 = [(OfflineMapsManagementExpiredDataSource *)self diffableDataSource];
        v14 = [v13 itemIdentifierForIndexPath:v12];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = [v14 subscription];
          BOOL v16 = sub_1006D0280(v15);

          if (!v16)
          {

            BOOL v17 = 0;
            goto LABEL_14;
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 1;
LABEL_14:

  return v17;
}

- (void)_deleteSelectedMapsAndPerformBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v5 = [(OfflineMapsManagementExpiredDataSource *)self diffableDataSource];
  long long v19 = [v5 snapshot];

  long long v20 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [(DataSource *)self collectionView];
  BOOL v7 = [v6 indexPathsForSelectedItems];

  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v11);
        v13 = [(OfflineMapsManagementExpiredDataSource *)self diffableDataSource];
        v14 = [v13 itemIdentifierForIndexPath:v12];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v14;
          [v20 addObject:v15];
          v4[2](v4, v15);
        }
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  id v16 = [v20 copy];
  [v19 deleteItemsWithIdentifiers:v16];

  BOOL v17 = [(OfflineMapsManagementExpiredDataSource *)self diffableDataSource];
  [v17 applySnapshot:v19 animatingDifferences:1];

  id v18 = [(OfflineMapsManagementExpiredDataSource *)self offlineDelegate];
  [v18 dismissExpiredViewControllerIfNecessary];
}

- (id)swipeActionsConfigurationForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(OfflineMapsManagementExpiredDataSource *)self diffableDataSource];
  id v6 = [v5 itemIdentifierForIndexPath:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_initWeak(&location, self);
    id v7 = v6;
    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"RowSwipe_Clear" value:@"localized string not found" table:@"Offline"];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1006D0A50;
    v24[3] = &unk_1012F53A0;
    objc_copyWeak(&v26, &location);
    id v10 = v7;
    id v25 = v10;
    long long v11 = +[UIContextualAction contextualActionWithStyle:1 title:v9 handler:v24];

    uint64_t v12 = +[NSMutableArray arrayWithObject:v11];
    v13 = [v10 subscription];
    BOOL v14 = sub_1006D0280(v13);

    if (v14)
    {
      id v15 = +[NSBundle mainBundle];
      id v16 = [v15 localizedStringForKey:@"RowSwipe_Restore" value:@"localized string not found" table:@"Offline"];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1006D0DAC;
      v21[3] = &unk_1012F53A0;
      objc_copyWeak(&v23, &location);
      id v22 = v10;
      BOOL v17 = +[UIContextualAction contextualActionWithStyle:1 title:v16 handler:v21];

      id v18 = +[UIColor systemBlueColor];
      [v17 setBackgroundColor:v18];

      [v12 addObject:v17];
      objc_destroyWeak(&v23);
    }
    long long v19 = +[UISwipeActionsConfiguration configurationWithActions:v12];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    long long v19 = 0;
  }

  return v19;
}

- (void)_restoreSubscription:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(OfflineMapsManagementExpiredDataSource *)self offlineDelegate];
  id v9 = [v6 subscription];
  id v18 = v9;
  id v10 = +[NSArray arrayWithObjects:&v18 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1006D0FCC;
  v13[3] = &unk_1012F53C8;
  objc_copyWeak(&v16, &location);
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [v8 didSelectRestoreExpiredSubscriptions:v10 completionHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (BOOL)_canItemIdentifierBeSelected:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(DataSource *)self collectionView];
    if ([v6 isEditing])
    {
      BOOL v7 = 1;
    }
    else
    {
      id v8 = [v5 subscription];
      BOOL v7 = sub_1006D0280(v8);
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_fetchExpiredSubscriptionsAnimated:(BOOL)a3
{
  objc_initWeak(&location, self);
  id v5 = +[NSString stringWithFormat:@"%@*", @"com.apple.Maps.offline."];
  id v6 = [(OfflineMapsManagementExpiredDataSource *)self subscriptionManager];
  v13 = v5;
  BOOL v7 = +[NSArray arrayWithObjects:&v13 count:1];
  id v8 = &_dispatch_main_q;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1006D1340;
  v9[3] = &unk_1012F2F00;
  objc_copyWeak(&v10, &location);
  BOOL v11 = a3;
  [v6 fetchExpiredSubscriptionsWithIdentifiers:v7 callbackQueue:&_dispatch_main_q completionHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_updateContentAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  if ([(NSArray *)self->_expiredSubscriptions count])
  {
    CFStringRef v8 = @"kExpiredSectionIdentifier";
    id v6 = +[NSArray arrayWithObjects:&v8 count:1];
    [v5 appendSectionsWithIdentifiers:v6];

    [v5 appendItemsWithIdentifiers:self->_expiredSubscriptions intoSectionWithIdentifier:@"kExpiredSectionIdentifier"];
  }
  BOOL v7 = [(OfflineMapsManagementExpiredDataSource *)self diffableDataSource];
  [v7 applySnapshot:v5 animatingDifferences:v3];
}

- (void)subscriptionInfosDidChange:(id)a3
{
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    id v12 = +[TwoLineCollectionViewListCell identifier];
    v13 = [v8 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v9];

    id v14 = [v11 subscription];
    BOOL v15 = sub_1006D0280(v14);

    id v16 = [v11 subscription];
    BOOL v17 = +[TwoLinesContentViewModelComposer cellModelForExpiredOfflineMapSubscription:v16 isAvailable:v15 isSupportedOSVersion:GEOConfigGetBOOL() ^ 1];
    [v13 setViewModel:v17];

    id v18 = objc_alloc_init((Class)UICellAccessoryMultiselect);
    [v18 setDisplayedState:1];
    id v35 = v18;
    long long v19 = +[NSArray arrayWithObjects:&v35 count:1];
    id v20 = [v19 mutableCopy];

    if (v15)
    {
      objc_initWeak(&location, self);
      v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      v30 = sub_1006D1924;
      v31 = &unk_1012E6368;
      v27 = &v33;
      objc_copyWeak(&v33, &location);
      id v32 = v11;
      long long v21 = +[UIAction actionWithHandler:&v28];
      id v22 = +[UIButton buttonWithType:0 primaryAction:v21];

      id v23 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
      long long v24 = +[UIImage systemImageNamed:@"arrow.down.circle" withConfiguration:v23];
      [v22 setImage:v24 forState:0];

      [v22 setAccessibilityIdentifier:@"RestoreExpiredMap"];
      id v25 = [objc_alloc((Class)UICellAccessoryCustomView) initWithCustomView:v22 placement:1];
      [v25 setDisplayedState:2];
      [v20 addObject:v25];

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
    [v13 setAccessories:v20, v27, v28, v29, v30, v31];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(OfflineMapsManagementExpiredDataSource *)self diffableDataSource];
  id v12 = [v11 sectionIdentifierForIndex:[v9 section]];

  unsigned int v13 = [v10 isEqualToString:UICollectionElementKindSectionFooter];
  if (v13 && [v12 isEqual:@"kExpiredSectionIdentifier"])
  {
    if (GEOConfigGetBOOL())
    {
      id v14 = +[NSBundle mainBundle];
      BOOL v15 = v14;
      CFStringRef v16 = @"EXPIRED_OFFLINE_MAPS_FOOTER";
    }
    else
    {
      int v18 = MGGetBoolAnswer();
      id v14 = +[NSBundle mainBundle];
      BOOL v15 = v14;
      if (v18) {
        CFStringRef v16 = @"EXPIRED_OFFLINE_MAPS_FOOTER_NO_AUTOUPDATES_WLAN";
      }
      else {
        CFStringRef v16 = @"EXPIRED_OFFLINE_MAPS_FOOTER_NO_AUTOUPDATES_WIFI";
      }
    }
    long long v19 = [v14 localizedStringForKey:v16 value:@"localized string not found" table:@"Offline"];

    id v20 = [objc_alloc((Class)NSAttributedString) initWithString:v19];
    long long v21 = [[UserProfileSectionFooterViewModel alloc] initWithContentString:v20];
    id v22 = (objc_class *)objc_opt_class();
    id v23 = NSStringFromClass(v22);
    BOOL v17 = [v8 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:v23 forIndexPath:v9];

    [v17 configureWithViewModel:v21];
    [v17 setNeedsLayout];
    [v17 layoutIfNeeded];
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(OfflineMapsManagementExpiredDataSource *)self diffableDataSource];
  BOOL v7 = [v6 itemIdentifierForIndexPath:v5];

  LOBYTE(self) = [(OfflineMapsManagementExpiredDataSource *)self _canItemIdentifierBeSelected:v7];
  return (char)self;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(OfflineMapsManagementExpiredDataSource *)self diffableDataSource];
  BOOL v7 = [v6 itemIdentifierForIndexPath:v5];

  LOBYTE(self) = [(OfflineMapsManagementExpiredDataSource *)self _canItemIdentifierBeSelected:v7];
  return (char)self;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  BOOL v7 = [(OfflineMapsManagementExpiredDataSource *)self diffableDataSource];
  id v8 = [v7 itemIdentifierForIndexPath:v6];

  if (([v10 isEditing] & 1) != 0
    || ([v10 deselectItemAtIndexPath:v6 animated:1],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v9 = [(DataSource *)self delegate];
    [v9 dataSource:self itemTapped:v8];
  }
  else
  {
    [(OfflineMapsManagementExpiredDataSource *)self _restoreSubscription:v8 completionHandler:0];
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(OfflineMapsManagementExpiredDataSource *)self diffableDataSource];
  id v8 = [v6 itemIdentifierForIndexPath:v5];

  BOOL v7 = [(DataSource *)self delegate];
  [v7 dataSource:self itemTapped:v8];
}

- (OfflineMapsManagementExpiredDataSourceDelegate)offlineDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_offlineDelegate);

  return (OfflineMapsManagementExpiredDataSourceDelegate *)WeakRetained;
}

- (void)setOfflineDelegate:(id)a3
{
}

- (GEOMapDataSubscriptionManager)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_destroyWeak((id *)&self->_offlineDelegate);

  objc_storeStrong((id *)&self->_expiredSubscriptions, 0);
}

@end