@interface OfflineMapsManagementDataSource
- (BOOL)_canItemIdentifierBeSelected:(id)a3;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (GEOMapDataSubscriptionManager)subscriptionManager;
- (NSArray)sections;
- (NSArray)subscriptionInfos;
- (NSArray)suggestedRegions;
- (OfflineMapsManagementDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4;
- (OfflineMapsManagementDataSourceDelegate)offlineDelegate;
- (OfflineMapsSuggestionsDataProvider)suggestionsProvider;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (id)_automaticUpdatesModel;
- (id)_createAutomaticUpdatesModel:(BOOL)a3;
- (id)_createForceOfflineModel:(BOOL)a3;
- (id)_createSyncToWatchModel:(BOOL)a3;
- (id)_disabledAutomaticUpdatesModel;
- (id)_disabledForceOfflineModel;
- (id)_disabledSyncToWatchModel;
- (id)_disabledUpdateAllModel;
- (id)_downloadNewMapModel;
- (id)_downloadSettingsModel;
- (id)_expiredMapsModel;
- (id)_forceOfflineModel;
- (id)_optimizeStorageModel;
- (id)_syncToWatchModel;
- (id)_updateAllModel;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)sectionForSectionIndex:(unint64_t)a3;
- (id)swipeActionsConfigurationForIndexPath:(id)a3;
- (void)_fetchExpiredSubscriptionsAnimated:(BOOL)a3;
- (void)_fetchLastUpdatedDateAnimated:(BOOL)a3;
- (void)_showPairedDeviceDiskSpaceDialogIfNeeded;
- (void)_updateAutoUpdateRowSubtitle;
- (void)_updateContentAnimated:(BOOL)a3;
- (void)_updateSyncToWatchModel;
- (void)_updateUpdateAllModels;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)commonInit;
- (void)dealloc;
- (void)hasFullyLoadedSubscriptionsDidChange:(BOOL)a3;
- (void)pairedSubscriptionInfosDidChange:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setOfflineDelegate:(id)a3;
- (void)setSections:(id)a3;
- (void)setSubscriptionInfos:(id)a3;
- (void)setSubscriptionManager:(id)a3;
- (void)setSuggestedRegions:(id)a3;
- (void)setSuggestionsProvider:(id)a3;
- (void)subscriptionInfosDidChange:(id)a3;
- (void)subscriptionsBeingUpdatedDidChange:(BOOL)a3;
- (void)subscriptionsNeedUpdatingDidChange:(BOOL)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation OfflineMapsManagementDataSource

- (OfflineMapsManagementDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)OfflineMapsManagementDataSource;
  v4 = [(DataSource *)&v7 initWithCollectionView:a3 updateLocation:a4];
  v5 = v4;
  if (v4) {
    [(OfflineMapsManagementDataSource *)v4 commonInit];
  }
  return v5;
}

- (void)commonInit
{
  id v3 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
  [(OfflineMapsManagementDataSource *)self setSubscriptionManager:v3];

  v4 = [[OfflineMapsSuggestionsDataProvider alloc] initWithClientType:2 callbackQueue:&_dispatch_main_q];
  [(OfflineMapsManagementDataSource *)self setSuggestionsProvider:v4];

  v5 = [(DataSource *)self collectionView];
  [v5 setDelegate:self];

  v6 = [(DataSource *)self collectionView];
  +[MapsDebugTableRow registerCellsInCollectionView:v6];

  objc_super v7 = [(DataSource *)self collectionView];
  uint64_t v8 = objc_opt_class();
  v9 = +[TwoLineCollectionViewListCell identifier];
  [v7 registerClass:v8 forCellWithReuseIdentifier:v9];

  v10 = [(DataSource *)self collectionView];
  uint64_t v11 = objc_opt_class();
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  [v10 registerClass:v11 forCellWithReuseIdentifier:v13];

  v14 = [(DataSource *)self collectionView];
  uint64_t v15 = objc_opt_class();
  v16 = +[SectionHeaderCollectionReusableView reuseIdentifier];
  [v14 registerClass:v15 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v16];

  v17 = [(DataSource *)self collectionView];
  uint64_t v18 = objc_opt_class();
  v19 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v19);
  [v17 registerClass:v18 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:v20];

  id v21 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v22 = [(DataSource *)self collectionView];
  v23 = sub_10001CBB8(self);
  id v24 = [v21 initWithCollectionView:v22 cellProvider:v23];
  [(OfflineMapsManagementDataSource *)self setDiffableDataSource:v24];

  v25 = sub_1005B38D0(self);
  v26 = [(OfflineMapsManagementDataSource *)self diffableDataSource];
  [v26 setSupplementaryViewProvider:v25];

  v27 = +[MapsOfflineUIHelper sharedHelper];
  self->_hasSubscriptionsNeedingUpdate = [v27 hasSubscriptionsNeedingUpdate];

  v28 = +[MapsOfflineUIHelper sharedHelper];
  self->_hasInProgressUpdate = [v28 hasSubscriptionsBeingUpdated];

  objc_initWeak(&location, self);
  v29 = +[MapsOfflineUIHelper sharedHelper];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10064B8F8;
  v37[3] = &unk_1012E6E78;
  objc_copyWeak(&v38, &location);
  [v29 fetchAllSubscriptionInfosWithCompletion:v37];

  [(OfflineMapsManagementDataSource *)self _fetchExpiredSubscriptionsAnimated:0];
  [(OfflineMapsManagementDataSource *)self _fetchLastUpdatedDateAnimated:0];
  v30 = [(OfflineMapsManagementDataSource *)self suggestionsProvider];
  v31 = [(DataSource *)self currentLocation];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10064B980;
  v35[3] = &unk_1012E9BD0;
  objc_copyWeak(&v36, &location);
  [v30 offlineSuggestionsForLocation:v31 completion:v35];

  objc_copyWeak(&v34, &location);
  v32 = _GEOConfigAddBlockListenerForKey();
  id autoupdateFrequencyBucketsListener = self->_autoupdateFrequencyBucketsListener;
  self->_id autoupdateFrequencyBucketsListener = v32;

  _GEOConfigAddDelegateListenerForKey();
  _GEOConfigAddDelegateListenerForKey();

  _GEOConfigAddDelegateListenerForKey();
  _GEOConfigAddDelegateListenerForKey();

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  GEOConfigRemoveBlockListener();
  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)OfflineMapsManagementDataSource;
  [(OfflineMapsManagementDataSource *)&v3 dealloc];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OfflineMapsManagementDataSource;
  -[DataSource setActive:](&v7, "setActive:");
  v5 = +[MapsOfflineUIHelper sharedHelper];
  v6 = v5;
  if (v3) {
    [v5 addObserver:self];
  }
  else {
    [v5 removeObserver:self];
  }
}

- (id)sectionForSectionIndex:(unint64_t)a3
{
  v5 = [(OfflineMapsManagementDataSource *)self sections];
  id v6 = [v5 count];

  if ((unint64_t)v6 >= a3)
  {
    uint64_t v8 = [(OfflineMapsManagementDataSource *)self sections];
    objc_super v7 = [v8 objectAtIndex:a3];
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (id)swipeActionsConfigurationForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(OfflineMapsManagementDataSource *)self diffableDataSource];
  id v6 = [v5 itemIdentifierForIndexPath:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_initWeak(&location, self);
    id v7 = v6;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10064BE1C;
    v21[3] = &unk_1012F2E50;
    objc_copyWeak(&v23, &location);
    id v8 = v7;
    id v22 = v8;
    v9 = sub_100B7E834(v21);
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_10064C0D4;
    uint64_t v18 = &unk_1012F2E50;
    objc_copyWeak(&v20, &location);
    id v10 = v8;
    id v19 = v10;
    uint64_t v11 = sub_100B7EBDC(&v15);
    v25[0] = v9;
    v25[1] = v11;
    v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2, v15, v16, v17, v18);
    v13 = +[UISwipeActionsConfiguration configurationWithActions:v12];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&location);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_updateContentAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = GEOSupportsOfflineMaps();
  int BOOL = GEOConfigGetBOOL();
  id v7 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  if (v5)
  {
    id v8 = [(OfflineMapsManagementDataSource *)self subscriptionInfos];
    BOOL v9 = [v8 count] != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  NSUInteger v10 = [(NSArray *)self->_expiredSubscriptions count];
  if (MapsFeature_IsEnabled_StandaloneWatchOffline()
    && (((v5 | BOOL) ^ 1 | v9) & 1) == 0
    && self->_hasFetchedInitialSubscriptions)
  {
    uint64_t v11 = [[OfflineMapsManagementSection alloc] initWithSectionType:0];
    v99 = v11;
    v12 = +[NSArray arrayWithObjects:&v99 count:1];
    [v7 appendSectionsWithIdentifiers:v12];

    CFStringRef v98 = @"EmptyState";
    v13 = +[NSArray arrayWithObjects:&v98 count:1];
    [v7 appendItemsWithIdentifiers:v13 intoSectionWithIdentifier:v11];
  }
  if (v10) {
    int v14 = 1;
  }
  else {
    int v14 = v9;
  }
  if (v14 == 1)
  {
    if (v9)
    {
      uint64_t v15 = [[OfflineMapsManagementSection alloc] initWithSectionType:1];
      v97 = v15;
      uint64_t v16 = +[NSArray arrayWithObjects:&v97 count:1];
      [v7 appendSectionsWithIdentifiers:v16];

      v17 = [(OfflineMapsManagementDataSource *)self subscriptionInfos];
      [v7 appendItemsWithIdentifiers:v17 intoSectionWithIdentifier:v15];

      objc_storeStrong((id *)&self->_downloadedAndExpiredSection, v15);
      if (!v10)
      {
LABEL_20:

        goto LABEL_21;
      }
      if (v15)
      {
LABEL_18:
        id v20 = [(OfflineMapsManagementDataSource *)self _expiredMapsModel];
        v95 = v20;
        id v21 = +[NSArray arrayWithObjects:&v95 count:1];
        [v7 appendItemsWithIdentifiers:v21 intoSectionWithIdentifier:v15];

        v94 = v20;
        id v22 = +[NSArray arrayWithObjects:&v94 count:1];
        [v7 reconfigureItemsWithIdentifiers:v22];

        goto LABEL_20;
      }
    }
    else
    {
      downloadedAndExpiredSection = self->_downloadedAndExpiredSection;
      self->_downloadedAndExpiredSection = 0;

      if (!v10)
      {
        uint64_t v15 = 0;
        goto LABEL_20;
      }
    }
    uint64_t v15 = [[OfflineMapsManagementSection alloc] initWithSectionType:2];
    v96 = v15;
    id v19 = +[NSArray arrayWithObjects:&v96 count:1];
    [v7 appendSectionsWithIdentifiers:v19];

    goto LABEL_18;
  }
LABEL_21:
  if (v9 || (MapsFeature_IsEnabled_StandaloneWatchOffline() & 1) == 0)
  {
    if (!v5)
    {
      if (GEOConfigGetBOOL())
      {
        v30 = [[OfflineMapsManagementSection alloc] initWithSectionType:3];
        actionButtonsSection = self->_actionButtonsSection;
        self->_actionButtonsSection = v30;

        v88 = self->_actionButtonsSection;
        v32 = +[NSArray arrayWithObjects:&v88 count:1];
        [v7 appendSectionsWithIdentifiers:v32];

        v33 = [(OfflineMapsManagementDataSource *)self _downloadNewMapModel];
        v87 = v33;
        id v34 = +[NSArray arrayWithObjects:&v87 count:1];
        [v7 appendItemsWithIdentifiers:v34 intoSectionWithIdentifier:self->_actionButtonsSection];
      }
      goto LABEL_46;
    }
    id v23 = [[OfflineMapsManagementSection alloc] initWithSectionType:3];
    id v24 = self->_actionButtonsSection;
    self->_actionButtonsSection = v23;

    v93 = self->_actionButtonsSection;
    v25 = +[NSArray arrayWithObjects:&v93 count:1];
    [v7 appendSectionsWithIdentifiers:v25];

    v26 = [(OfflineMapsManagementDataSource *)self _downloadNewMapModel];
    v92 = v26;
    v27 = +[NSArray arrayWithObjects:&v92 count:1];
    [v7 appendItemsWithIdentifiers:v27 intoSectionWithIdentifier:self->_actionButtonsSection];

    if (self->_hasSubscriptionsNeedingUpdate)
    {
      if (self->_hasInProgressUpdate)
      {
        v28 = [(OfflineMapsManagementDataSource *)self _disabledUpdateAllModel];
        v91 = v28;
        v29 = &v91;
      }
      else
      {
        v28 = [(OfflineMapsManagementDataSource *)self _updateAllModel];
        v90 = v28;
        v29 = &v90;
      }
    }
    else
    {
      v35 = [(OfflineMapsManagementDataSource *)self subscriptionInfos];
      id v36 = [v35 count];

      if (!v36) {
        goto LABEL_35;
      }
      v28 = [(OfflineMapsManagementDataSource *)self _disabledUpdateAllModel];
      v89 = v28;
      v29 = &v89;
    }
    v37 = +[NSArray arrayWithObjects:v29 count:1];
    [v7 appendItemsWithIdentifiers:v37 intoSectionWithIdentifier:self->_actionButtonsSection];
  }
  else if ((v5 & 1) == 0)
  {
LABEL_46:
    settingsSection = self->_settingsSection;
    self->_settingsSection = 0;

    forceOfflineSection = self->_forceOfflineSection;
    self->_forceOfflineSection = 0;
    goto LABEL_59;
  }
LABEL_35:
  id v38 = [(OfflineMapsManagementDataSource *)self suggestedRegions];
  id v39 = [v38 count];

  if (v39)
  {
    v40 = [(OfflineMapsManagementDataSource *)self suggestedRegions];
    v41 = [v40 _geo_filtered:&stru_1012F2EB0];

    if ([v41 count])
    {
      unint64_t UInteger = GEOConfigGetUInteger();
      if ((unint64_t)[v41 count] > UInteger)
      {
        uint64_t v43 = [v41 subarrayWithRange:0, UInteger];

        v41 = (void *)v43;
      }
      v44 = [[OfflineMapsManagementSection alloc] initWithSectionType:4];
      v86 = v44;
      v45 = +[NSArray arrayWithObjects:&v86 count:1];
      [v7 appendSectionsWithIdentifiers:v45];

      [v7 appendItemsWithIdentifiers:v41 intoSectionWithIdentifier:v44];
      v46 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v41 count]);
      v47 = [v46 stringValue];
      +[GEOAPPortal captureUserAction:397 target:88 value:v47];
    }
  }
  v48 = [(OfflineMapsManagementDataSource *)self subscriptionInfos];
  id v49 = [v48 count];

  if (!v49) {
    goto LABEL_46;
  }
  v50 = [[OfflineMapsManagementSection alloc] initWithSectionType:5];
  v51 = self->_settingsSection;
  self->_settingsSection = v50;

  v85 = self->_settingsSection;
  v52 = +[NSArray arrayWithObjects:&v85 count:1];
  [v7 appendSectionsWithIdentifiers:v52];

  uint64_t v53 = [(OfflineMapsManagementDataSource *)self _downloadSettingsModel];
  forceOfflineSection = (OfflineMapsManagementSection *)v53;
  if (v53)
  {
    uint64_t v84 = v53;
    v55 = +[NSArray arrayWithObjects:&v84 count:1];
    [v7 appendItemsWithIdentifiers:v55 intoSectionWithIdentifier:self->_settingsSection];
  }
  v56 = +[MapsOfflineUIHelper sharedHelper];
  id v57 = [v56 totalOfflineDataSize];
  unint64_t updated = GEOMaximumAutomaticUpdateOfflineDataSize();

  if ((unint64_t)v57 <= updated) {
    [(OfflineMapsManagementDataSource *)self _automaticUpdatesModel];
  }
  else {
  v60 = [(OfflineMapsManagementDataSource *)self _disabledAutomaticUpdatesModel];
  }
  v83[0] = v60;
  v61 = [(OfflineMapsManagementDataSource *)self _optimizeStorageModel];
  v83[1] = v61;
  v62 = +[NSArray arrayWithObjects:v83 count:2];
  [v7 appendItemsWithIdentifiers:v62 intoSectionWithIdentifier:self->_settingsSection];

  if (MapsFeature_IsEnabled_StandaloneWatchOffline())
  {
    v63 = +[NRPairedDeviceRegistry sharedInstance];
    v64 = [v63 getActivePairedDeviceExcludingAltAccount];

    if (v64)
    {
      id v65 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"3B512C1E-F8D5-4FE7-B109-1AD8EF7F924D"];
      unsigned int v66 = [v64 supportsCapability:v65];

      if (v66)
      {
        v67 = [(OfflineMapsManagementDataSource *)self _syncToWatchModel];
        v82 = v67;
        v68 = &v82;
      }
      else
      {
        v67 = [(OfflineMapsManagementDataSource *)self _disabledSyncToWatchModel];
        v81 = v67;
        v68 = &v81;
      }
      v69 = +[NSArray arrayWithObjects:v68 count:1];
      [v7 appendItemsWithIdentifiers:v69 intoSectionWithIdentifier:self->_settingsSection];
    }
  }
  v70 = [[OfflineMapsManagementSection alloc] initWithSectionType:6];
  v71 = self->_forceOfflineSection;
  self->_forceOfflineSection = v70;

  v80 = self->_forceOfflineSection;
  v72 = +[NSArray arrayWithObjects:&v80 count:1];
  [v7 appendSectionsWithIdentifiers:v72];

  v73 = +[MapsOfflineUIHelper sharedHelper];
  if ([v73 hasFullyLoadedSubscriptions]) {
    [(OfflineMapsManagementDataSource *)self _forceOfflineModel];
  }
  else {
  v74 = [(OfflineMapsManagementDataSource *)self _disabledForceOfflineModel];
  }
  v79 = v74;
  v75 = +[NSArray arrayWithObjects:&v79 count:1];
  [v7 appendItemsWithIdentifiers:v75 intoSectionWithIdentifier:self->_forceOfflineSection];

LABEL_59:
  v76 = [v7 sectionIdentifiers];
  [(OfflineMapsManagementDataSource *)self setSections:v76];

  v77 = [(OfflineMapsManagementDataSource *)self diffableDataSource];
  [v77 applySnapshot:v7 animatingDifferences:v3];

  v78 = [(DataSource *)self delegate];
  [v78 dataSourceUpdated:self];
}

- (void)_fetchLastUpdatedDateAnimated:(BOOL)a3
{
  objc_initWeak(&location, self);
  int v5 = [(OfflineMapsManagementDataSource *)self subscriptionManager];
  id v6 = &_dispatch_main_q;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10064CD18;
  v7[3] = &unk_1012F2ED8;
  objc_copyWeak(&v8, &location);
  BOOL v9 = a3;
  [v5 fetchLastUpdatedDateForOfflineSubscriptionsWithQueue:&_dispatch_main_q completionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_fetchExpiredSubscriptionsAnimated:(BOOL)a3
{
  objc_initWeak(&location, self);
  int v5 = +[NSString stringWithFormat:@"%@*", @"com.apple.Maps.offline."];
  id v6 = [(OfflineMapsManagementDataSource *)self subscriptionManager];
  v13 = v5;
  id v7 = +[NSArray arrayWithObjects:&v13 count:1];
  id v8 = &_dispatch_main_q;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10064CFC8;
  v9[3] = &unk_1012F2F00;
  objc_copyWeak(&v10, &location);
  BOOL v11 = a3;
  [v6 fetchExpiredSubscriptionsWithIdentifiers:v7 callbackQueue:&_dispatch_main_q completionHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)_canItemIdentifierBeSelected:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 tableRow];
    int v5 = [v4 selectionAction];
    BOOL v6 = v5 != 0;
  }
  else
  {
    objc_opt_class();
    BOOL v6 = 0;
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v3 state];
      id v8 = [v7 loadState];

      if (v8) {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)_showPairedDeviceDiskSpaceDialogIfNeeded
{
  if (GEOConfigGetBOOL())
  {
    val = self;
    id v3 = +[NRPairedDeviceRegistry sharedInstance];
    uint64_t v26 = [v3 getActivePairedDeviceExcludingAltAccount];

    if (v26)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v4 = +[MapsOfflineUIHelper sharedHelper];
      int v5 = [v4 subscriptionInfos];

      id v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v6)
      {
        uint64_t v7 = 0;
        char v8 = 0;
        uint64_t v9 = *(void *)v31;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v31 != v9) {
              objc_enumerationMutation(v5);
            }
            BOOL v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            v12 = [v11 pairedDeviceState];
            if (v12)
            {
              v13 = [v11 pairedDeviceState];
              BOOL v14 = [v13 downloadState] == 0;

              if (!v14)
              {
                uint64_t v15 = [v11 state];
                id v16 = [v15 downloadedDataSize];

                v7 += (uint64_t)v16;
              }
            }
            v17 = [v11 state];
            BOOL v18 = [v17 downloadState] == (id)2;

            v8 |= v18;
          }
          id v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v6);

        if (v8)
        {
          GEOConfigGetDouble();
          double v20 = v19;
          objc_initWeak(location, val);
          id v21 = +[MapsOfflineUIHelper sharedHelper];
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10064D558;
          v27[3] = &unk_1012F2F28;
          objc_copyWeak(v28, location);
          v28[1] = (id)(v7 + (uint64_t)(v20 * (double)v7));
          [v21 getAvailableDiskSpaceForPairedDeviceWithCompletionHandler:v27];

          objc_destroyWeak(v28);
          objc_destroyWeak(location);
LABEL_24:
          id v22 = v26;
          goto LABEL_25;
        }
      }
      else
      {
      }
      id v24 = sub_1000493C0();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "No map is currently downloading, will not calculate paired device low disk space alert", (uint8_t *)location, 2u);
      }

      goto LABEL_24;
    }
    id v23 = sub_1000493C0();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "No paired device, will not show disk space alert.", (uint8_t *)location, 2u);
    }

    id v22 = 0;
  }
  else
  {
    id v22 = sub_1000493C0();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Maps config has disabled the disk space alert, will not attempt to display.", (uint8_t *)location, 2u);
    }
  }
LABEL_25:
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  BOOL v4 = a3.var0 == MapsConfig_OfflineMapDownloadsAllowCellular && a3.var1 == off_1015F0E48;
  if (v4
    || (a3.var0 == GeoOfflineConfig_AutomaticUpdatesEnabled
      ? (BOOL v5 = a3.var1 == (void *)*((void *)&GeoOfflineConfig_AutomaticUpdatesEnabled + 1))
      : (BOOL v5 = 0),
        v5
     || (a3.var0 == GeoOfflineConfig_OptimizeStorageEnabled
       ? (BOOL v6 = a3.var1 == (void *)*((void *)&GeoOfflineConfig_OptimizeStorageEnabled + 1))
       : (BOOL v6 = 0),
         v6
      || (a3.var0 == GeoOfflineConfig_SyncToWatchEnabled
        ? (BOOL v7 = a3.var1 == (void *)*((void *)&GeoOfflineConfig_SyncToWatchEnabled + 1))
        : (BOOL v7 = 0),
          v7 || (a3.var0 == MapsConfig_OfflineOnlyData ? (BOOL v8 = a3.var1 == off_1015F0B08) : (BOOL v8 = 0), v8)))))
  {
    if (self->_settingsSection && self->_forceOfflineSection)
    {
      uint64_t v9 = [(OfflineMapsManagementDataSource *)self diffableDataSource];
      id v14 = [v9 snapshot];

      id v10 = [v14 itemIdentifiersInSectionWithIdentifier:self->_settingsSection];
      BOOL v11 = +[NSMutableArray arrayWithArray:v10];

      v12 = [v14 itemIdentifiersInSectionWithIdentifier:self->_forceOfflineSection];
      [v11 addObjectsFromArray:v12];

      [v14 reconfigureItemsWithIdentifiers:v11];
      v13 = [(OfflineMapsManagementDataSource *)self diffableDataSource];
      [v13 applySnapshot:v14 animatingDifferences:0];
    }
  }
}

- (void)subscriptionInfosDidChange:(id)a3
{
  [(OfflineMapsManagementDataSource *)self setSubscriptionInfos:a3];
  [(OfflineMapsManagementDataSource *)self _updateUpdateAllModels];
  [(OfflineMapsManagementDataSource *)self _updateContentAnimated:1];

  [(OfflineMapsManagementDataSource *)self _fetchExpiredSubscriptionsAnimated:1];
}

- (void)pairedSubscriptionInfosDidChange:(id)a3
{
}

- (void)subscriptionsNeedUpdatingDidChange:(BOOL)a3
{
  self->_hasSubscriptionsNeedingUpdate = a3;
  [(OfflineMapsManagementDataSource *)self _updateContentAnimated:1];

  [(OfflineMapsManagementDataSource *)self _fetchLastUpdatedDateAnimated:1];
}

- (void)subscriptionsBeingUpdatedDidChange:(BOOL)a3
{
  self->_hasInProgressUpdate = a3;
  [(OfflineMapsManagementDataSource *)self _updateUpdateAllModels];

  [(OfflineMapsManagementDataSource *)self _updateContentAnimated:1];
}

- (void)hasFullyLoadedSubscriptionsDidChange:(BOOL)a3
{
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    v12 = +[TwoLineCollectionViewListCell identifier];
    v13 = [v8 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v9];

    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_10064E0D0;
    v55[3] = &unk_1012E5D08;
    id v14 = v11;
    id v56 = v14;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10064E128;
    v52[3] = &unk_1012E6690;
    objc_copyWeak(&v54, &location);
    id v15 = v14;
    id v53 = v15;
    id v16 = +[TwoLinesContentViewModelComposer cellModelForOfflineMapSubscriptionInfo:v15 cancelDownloadBlock:v55 resumeDownloadBlock:v52];
    [v13 setViewModel:v16];

    objc_destroyWeak(&v54);
LABEL_7:

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v10;
    BOOL v18 = +[TwoLineCollectionViewListCell identifier];
    v13 = [v8 dequeueReusableCellWithReuseIdentifier:v18 forIndexPath:v9];

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10064E18C;
    v48[3] = &unk_1012E9340;
    objc_copyWeak(&v51, &location);
    id v49 = v9;
    id v15 = v17;
    id v50 = v15;
    double v19 = +[TwoLinesContentViewModelComposer cellModelForOfflineMapSuggestion:v15 downloadBlock:v48];
    [v13 setViewModel:v19];

    objc_destroyWeak(&v51);
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v10;
    double v20 = [v15 tableRow];
    v13 = [v20 cellForCollectionView:v8 forIndexPath:v9];

    [v13 setAccessibilityIdentifier:@"OfflineMapSettingsCell"];
    id v21 = [v15 tableRow];
    id v22 = [v21 title];
    [v13 setAccessibilityLabel:v22];

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 isEqualToString:@"EmptyState"])
  {
    id v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    v13 = [v8 dequeueReusableCellWithReuseIdentifier:v25 forIndexPath:v9];

    uint64_t v26 = +[NSBundle mainBundle];
    v27 = [v26 localizedStringForKey:@"OFFLINE_MANAGEMENT_EMPTY_TITLE" value:@"localized string not found" table:@"Offline"];
    v28 = [v13 emptyStateView];
    [v28 setTitle:v27];

    v29 = +[NSBundle mainBundle];
    long long v30 = [v29 localizedStringForKey:@"OFFLINE_MANAGEMENT_EMPTY_MESSAGE" value:@"localized string not found" table:@"Offline"];
    long long v31 = [v13 emptyStateView];
    [v31 setSubtitle:v30];

    long long v32 = +[UIImage systemImageNamed:@"icloud.slash"];
    long long v33 = [v13 emptyStateView];
    [v33 setImage:v32];

    id v15 = +[UIButtonConfiguration _maps_pillButtonConfigurationWithImage:1];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10064E250;
    v46[3] = &unk_1012E8CD0;
    objc_copyWeak(&v47, &location);
    id v34 = +[UIAction actionWithHandler:v46];
    v35 = +[UIButton buttonWithConfiguration:v15 primaryAction:v34];

    id v36 = +[UIImage systemImageNamed:@"plus"];
    [v35 setImage:v36 forState:0];

    v37 = +[NSBundle mainBundle];
    id v38 = [v37 localizedStringForKey:@"OFFLINE_MANAGEMENT_EMPTY_BUTTON" value:@"localized string not found" table:0];
    [v35 setTitle:v38 forState:0];

    [v35 setAccessibilityIdentifier:@"DownloadMap"];
    v45 = [v35 heightAnchor];
    LODWORD(v39) = 1144766464;
    v40 = [v45 constraintEqualToConstant:32.0 priority:v39];
    v58[0] = v40;
    v41 = [v35 heightAnchor];
    v42 = [v41 constraintGreaterThanOrEqualToConstant:32.0];
    v58[1] = v42;
    uint64_t v43 = +[NSArray arrayWithObjects:v58 count:2];
    +[NSLayoutConstraint activateConstraints:v43];

    v44 = [v13 emptyStateView];
    [v44 setButton:v35];

    objc_destroyWeak(&v47);
    goto LABEL_7;
  }
  v13 = 0;
LABEL_8:
  objc_destroyWeak(&location);

  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = -[OfflineMapsManagementDataSource sectionForSectionIndex:](self, "sectionForSectionIndex:", [v10 section]);
  if ([v9 isEqualToString:UICollectionElementKindSectionHeader])
  {
    id v12 = [v11 headerText];
    if ([v12 length])
    {
      v13 = +[SectionHeaderCollectionReusableView reuseIdentifier];
      id v14 = [v8 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v13 forIndexPath:v10];

      [v14 setTitle:v12];
      [v14 setShowsBottomHairline:0];
      objc_msgSend(v14, "setFirstNonEmptySection:", objc_msgSend(v10, "section") == objc_msgSend(v8, "_maps_indexOfFirstNonEmptySection"));
      goto LABEL_11;
    }
  }
  if (![v9 isEqualToString:UICollectionElementKindSectionFooter])
  {
    id v14 = 0;
    goto LABEL_12;
  }
  id v15 = [v11 footerText];
  id v16 = [v15 length];

  if (v16)
  {
    id v17 = objc_alloc((Class)NSAttributedString);
    BOOL v18 = [v11 footerText];
    id v12 = [v17 initWithString:v18];
  }
  else
  {
    id v12 = 0;
  }
  double v19 = [[UserProfileSectionFooterViewModel alloc] initWithContentString:v12];
  double v20 = (objc_class *)objc_opt_class();
  id v21 = NSStringFromClass(v20);
  id v14 = [v8 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:v21 forIndexPath:v10];

  [v14 configureWithViewModel:v19];
LABEL_11:

LABEL_12:

  return v14;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(OfflineMapsManagementDataSource *)self diffableDataSource];
  BOOL v7 = [v6 itemIdentifierForIndexPath:v5];

  LOBYTE(self) = [(OfflineMapsManagementDataSource *)self _canItemIdentifierBeSelected:v7];
  return (char)self;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(OfflineMapsManagementDataSource *)self diffableDataSource];
  BOOL v7 = [v6 itemIdentifierForIndexPath:v5];

  LOBYTE(self) = [(OfflineMapsManagementDataSource *)self _canItemIdentifierBeSelected:v7];
  return (char)self;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectItemAtIndexPath:v6 animated:1];
  BOOL v7 = [(OfflineMapsManagementDataSource *)self diffableDataSource];
  id v9 = [v7 itemIdentifierForIndexPath:v6];

  id v8 = [(DataSource *)self delegate];
  [v8 dataSource:self itemTapped:v9];
}

- (id)_expiredMapsModel
{
  if (!self->_expiredMapsModel)
  {
    objc_initWeak(&location, self);
    id v3 = objc_alloc_init(MapsDebugNavigationTableRow);
    BOOL v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"Expired Maps [row title]" value:@"localized string not found" table:@"Offline"];
    [(MapsDebugTableRow *)v3 setTitle:v5];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10064E884;
    v13[3] = &unk_1012E6708;
    objc_copyWeak(&v14, &location);
    [(MapsDebugTableRow *)v3 setSelectionAction:v13];
    id v6 = [(MapsDebugTableRow *)v3 title];
    [(MapsDebugNavigationTableRow *)v3 setAccessibilityLabel:v6];

    [(MapsDebugTableRow *)v3 setConfigureCollectionViewCellBlock:&stru_1012F2F68];
    BOOL v7 = objc_alloc_init(OfflineMapsManagementCellModel);
    expiredMapsModel = self->_expiredMapsModel;
    self->_expiredMapsModel = v7;

    [(OfflineMapsManagementCellModel *)self->_expiredMapsModel setCellType:7];
    [(OfflineMapsManagementCellModel *)self->_expiredMapsModel setTableRow:v3];
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }
  id v9 = +[NSString localizedStringWithFormat:@"%ld", [(NSArray *)self->_expiredSubscriptions count]];
  id v10 = [(OfflineMapsManagementCellModel *)self->_expiredMapsModel tableRow];
  [v10 setSubtitle:v9];

  id v11 = self->_expiredMapsModel;

  return v11;
}

- (id)_downloadNewMapModel
{
  downloadNewMapModel = self->_downloadNewMapModel;
  if (!downloadNewMapModel)
  {
    objc_initWeak(&location, self);
    BOOL v4 = objc_alloc_init(MapsDebugActionTableRow);
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"Download New Map [button title]" value:@"localized string not found" table:@"Offline"];
    [(MapsDebugTableRow *)v4 setTitle:v6];

    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_10064EB1C;
    id v14 = &unk_1012E6708;
    objc_copyWeak(&v15, &location);
    [(MapsDebugActionTableRow *)v4 setSelectionAction:&v11];
    -[MapsDebugTableRow setConfigureCollectionViewCellBlock:](v4, "setConfigureCollectionViewCellBlock:", &stru_1012F2F88, v11, v12, v13, v14);
    BOOL v7 = [(MapsDebugTableRow *)v4 title];
    [(MapsDebugActionTableRow *)v4 setAccessibilityLabel:v7];

    id v8 = objc_alloc_init(OfflineMapsManagementCellModel);
    id v9 = self->_downloadNewMapModel;
    self->_downloadNewMapModel = v8;

    [(OfflineMapsManagementCellModel *)self->_downloadNewMapModel setCellType:0];
    [(OfflineMapsManagementCellModel *)self->_downloadNewMapModel setTableRow:v4];
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
    downloadNewMapModel = self->_downloadNewMapModel;
  }

  return downloadNewMapModel;
}

- (id)_updateAllModel
{
  updateAllModel = self->_updateAllModel;
  if (!updateAllModel)
  {
    objc_initWeak(&location, self);
    BOOL v4 = objc_alloc_init(MapsDebugActionTableRow);
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"Update All [button title]" value:@"localized string not found" table:@"Offline"];
    [(MapsDebugTableRow *)v4 setTitle:v6];

    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    uint64_t v12 = sub_10064ED9C;
    v13 = &unk_1012E6708;
    objc_copyWeak(&v14, &location);
    [(MapsDebugActionTableRow *)v4 setSelectionAction:&v10];
    -[MapsDebugTableRow setConfigureCollectionViewCellBlock:](v4, "setConfigureCollectionViewCellBlock:", &stru_1012F2FA8, v10, v11, v12, v13);
    BOOL v7 = objc_alloc_init(OfflineMapsManagementCellModel);
    id v8 = self->_updateAllModel;
    self->_updateAllModel = v7;

    [(OfflineMapsManagementCellModel *)self->_updateAllModel setCellType:1];
    [(OfflineMapsManagementCellModel *)self->_updateAllModel setTableRow:v4];
    [(OfflineMapsManagementDataSource *)self _updateUpdateAllModels];
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
    updateAllModel = self->_updateAllModel;
  }

  return updateAllModel;
}

- (id)_disabledUpdateAllModel
{
  disabledUpdateAllModel = self->_disabledUpdateAllModel;
  if (!disabledUpdateAllModel)
  {
    BOOL v4 = objc_alloc_init(MapsDebugActionTableRow);
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"Update All [button title]" value:@"localized string not found" table:@"Offline"];
    [(MapsDebugTableRow *)v4 setTitle:v6];

    [(MapsDebugTableRow *)v4 setConfigureCollectionViewCellBlock:&stru_1012F2FC8];
    BOOL v7 = objc_alloc_init(OfflineMapsManagementCellModel);
    id v8 = self->_disabledUpdateAllModel;
    self->_disabledUpdateAllModel = v7;

    [(OfflineMapsManagementCellModel *)self->_disabledUpdateAllModel setCellType:1];
    [(OfflineMapsManagementCellModel *)self->_disabledUpdateAllModel setTableRow:v4];
    [(OfflineMapsManagementCellModel *)self->_disabledUpdateAllModel setEnabled:0];
    [(OfflineMapsManagementDataSource *)self _updateUpdateAllModels];

    disabledUpdateAllModel = self->_disabledUpdateAllModel;
  }

  return disabledUpdateAllModel;
}

- (void)_updateUpdateAllModels
{
  BOOL v4 = &OBJC_IVAR___RouteUpdatingNavigationServiceTask__handler;
  if (!self->_updateAllModel && !self->_disabledUpdateAllModel) {
    return;
  }
  if (self->_hasInProgressUpdate)
  {
    id v5 = +[NSBundle mainBundle];
    id v43 = [v5 localizedStringForKey:@"Updating footer text" value:@"localized string not found" table:@"Offline"];
  }
  else
  {
    id v5 = [(OfflineMapsManagementDataSource *)self subscriptionInfos];
    if ([v5 count])
    {
      uint64_t v2 = 128;
      lastUpdatedDate = self->_lastUpdatedDate;

      if (!lastUpdatedDate)
      {
        id v43 = 0;
        goto LABEL_6;
      }
      id v15 = +[NSBundle mainBundle];
      id v5 = [v15 localizedStringForKey:@"Last updated footer text" value:@"localized string not found" table:@"Offline"];

      id v16 = +[NSDate now];
      [v16 timeIntervalSinceDate:self->_lastUpdatedDate];
      double v18 = v17;

      if (v18 >= 0.0 && v18 < 60.0)
      {
        uint64_t v26 = +[NSBundle mainBundle];
        uint64_t v27 = [v26 localizedStringForKey:@"OFFLINE_LAST_UPDATED_JUST_NOW" value:@"localized string not found" table:@"Offline"];
      }
      else
      {
        dateFormatter = self->_dateFormatter;
        if (!dateFormatter)
        {
          id v21 = (NSRelativeDateTimeFormatter *)objc_alloc_init((Class)NSRelativeDateTimeFormatter);
          id v22 = self->_dateFormatter;
          self->_dateFormatter = v21;

          id v23 = +[NSLocale autoupdatingCurrentLocale];
          [(NSRelativeDateTimeFormatter *)self->_dateFormatter setLocale:v23];

          [(NSRelativeDateTimeFormatter *)self->_dateFormatter setDateTimeStyle:1];
          [(NSRelativeDateTimeFormatter *)self->_dateFormatter setFormattingContext:1];
          dateFormatter = self->_dateFormatter;
        }
        id v24 = [(NSRelativeDateTimeFormatter *)dateFormatter calendar];
        v25 = +[NSDate now];
        uint64_t v26 = [v24 components:4124 fromDate:v25 toDate:self->_lastUpdatedDate options:0];

        uint64_t v27 = [(NSRelativeDateTimeFormatter *)self->_dateFormatter localizedStringFromDateComponents:v26];
      }
      v40 = (void *)v27;

      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v40);
      id v43 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v43 = 0;
    }
  }

LABEL_6:
  updateAllModel = self->_updateAllModel;
  if (!updateAllModel
    || ([(OfflineMapsManagementCellModel *)self->_updateAllModel tableRow],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        [(id)v2 subtitle],
        id v7 = (id)objc_claimAutoreleasedReturnValue(),
        v43 == v7))
  {
    int v13 = 0;
    p_disabledUpdateAllModel = &self->_disabledUpdateAllModel;
    disabledUpdateAllModel = self->_disabledUpdateAllModel;
    if (!disabledUpdateAllModel)
    {
      id v7 = v43;
      unsigned int v33 = 0;
      goto LABEL_29;
    }
    id v7 = v43;
LABEL_22:
    v28 = [(OfflineMapsManagementCellModel *)disabledUpdateAllModel tableRow];
    uint64_t v29 = [v28 subtitle];
    if (v43 == (id)v29)
    {

      unsigned int v33 = 0;
      if (!v13) {
        goto LABEL_29;
      }
    }
    else
    {
      long long v30 = (void *)v29;
      long long v31 = [(OfflineMapsManagementCellModel *)*p_disabledUpdateAllModel tableRow];
      long long v32 = [v31 subtitle];
      unsigned int v33 = [v43 isEqualToString:v32] ^ 1;

      BOOL v4 = &OBJC_IVAR___RouteUpdatingNavigationServiceTask__handler;
      if ((v13 & 1) == 0)
      {
LABEL_29:
        if (!updateAllModel) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
    }

    goto LABEL_29;
  }
  id v8 = [(OfflineMapsManagementCellModel *)self->_updateAllModel tableRow];
  id v9 = [v8 subtitle];
  unsigned int v10 = [v43 isEqualToString:v9];
  if (v10)
  {
    p_disabledUpdateAllModel = &self->_disabledUpdateAllModel;
    disabledUpdateAllModel = self->_disabledUpdateAllModel;
    if (disabledUpdateAllModel)
    {
      v41 = v9;
      v42 = v8;
      int v13 = 1;
      goto LABEL_22;
    }
  }
  unsigned int v33 = v10 ^ 1;

LABEL_30:
LABEL_31:
  id v34 = [(OfflineMapsManagementCellModel *)self->_updateAllModel tableRow];
  [v34 setSubtitle:v43];

  v35 = [*(id *)((char *)&self->super.super.isa + v4[717]) tableRow];
  [v35 setSubtitle:v43];

  if (v33 && self->_actionButtonsSection)
  {
    id v36 = [(OfflineMapsManagementDataSource *)self diffableDataSource];
    v37 = [v36 snapshot];

    if ([v37 indexOfSectionIdentifier:self->_actionButtonsSection] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v38 = [v37 itemIdentifiersInSectionWithIdentifier:self->_actionButtonsSection];
      [v37 reconfigureItemsWithIdentifiers:v38];
      double v39 = [(OfflineMapsManagementDataSource *)self diffableDataSource];
      [v39 applySnapshot:v37 animatingDifferences:1];
    }
  }
}

- (id)_downloadSettingsModel
{
  id v3 = &OBJC_IVAR___RouteUpdatingNavigationServiceTask__handler;
  if (!self->_hasCreatedDownloadSettingsModel)
  {
    unint64_t v4 = +[CellularReachability cellularStatus];
    if (!v4)
    {
LABEL_13:
      self->_hasCreatedDownloadSettingsModel = 1;
      goto LABEL_14;
    }
    unint64_t v5 = v4;
    int v6 = MGGetBoolAnswer();
    id v7 = +[NSBundle mainBundle];
    id v8 = v7;
    if (v6)
    {
      id v9 = [v7 localizedStringForKey:@"WLAN Only [menu option]" value:@"localized string not found" table:@"Offline"];

      unsigned int v10 = +[NSBundle mainBundle];
      uint64_t v11 = v10;
      CFStringRef v12 = @"WLAN + Cellular [menu option]";
    }
    else
    {
      id v9 = [v7 localizedStringForKey:@"Wi-Fi Only [menu option]" value:@"localized string not found" table:@"Offline"];

      unsigned int v10 = +[NSBundle mainBundle];
      uint64_t v11 = v10;
      CFStringRef v12 = @"Wi-Fi + Cellular [menu option]";
    }
    int v13 = [v10 localizedStringForKey:v12 value:@"localized string not found" table:@"Offline"];

    id v14 = +[UIAction actionWithTitle:v9 image:0 identifier:0 handler:&stru_1012F2FE8];
    [v14 setAccessibilityIdentifier:@"WifiOnlyAction"];
    [v14 setAccessibilityLabel:v9];
    id v15 = +[UIAction actionWithTitle:v13 image:0 identifier:0 handler:&stru_1012F3008];
    [v15 setAccessibilityIdentifier:@"WifiAndCellularAction"];
    [v15 setAccessibilityLabel:v13];
    int BOOL = GEOConfigGetBOOL();
    if (v5 == 3 && BOOL)
    {
      [v15 setState:1];
      uint64_t v17 = 0;
    }
    else
    {
      [v14 setState:1];
      if (v5 > 3)
      {
LABEL_12:
        v28[0] = v14;
        v28[1] = v15;
        double v18 = +[NSArray arrayWithObjects:v28 count:2];
        double v19 = +[UIMenu menuWithChildren:v18];

        double v20 = objc_alloc_init(MapsDebugMenuRow);
        id v21 = +[NSBundle mainBundle];
        id v22 = [v21 localizedStringForKey:@"Downloads [cell title]" value:@"localized string not found" table:@"Offline"];
        [(MapsDebugTableRow *)v20 setTitle:v22];

        [(MapsDebugMenuRow *)v20 setMenu:v19];
        id v23 = [(MapsDebugTableRow *)v20 title];
        [(MapsDebugMenuRow *)v20 setAccessibilityLabel:v23];

        [(MapsDebugTableRow *)v20 setSelectionAction:0];
        [(MapsDebugTableRow *)v20 setConfigureCollectionViewCellBlock:&stru_1012F3028];
        id v24 = objc_alloc_init(OfflineMapsManagementCellModel);
        id v3 = &OBJC_IVAR___RouteUpdatingNavigationServiceTask__handler;
        downloadSettingsModel = self->_downloadSettingsModel;
        self->_downloadSettingsModel = v24;

        [(OfflineMapsManagementCellModel *)self->_downloadSettingsModel setCellType:2];
        [(OfflineMapsManagementCellModel *)self->_downloadSettingsModel setTableRow:v20];

        goto LABEL_13;
      }
      uint64_t v17 = qword_100F701A8[v5 - 1];
    }
    [v15 setAttributes:v17];
    goto LABEL_12;
  }
LABEL_14:
  uint64_t v26 = *(Class *)((char *)&self->super.super.isa + v3[720]);

  return v26;
}

- (id)_createAutomaticUpdatesModel:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = objc_alloc_init(MapsDebugSwitchTableRow);
  unint64_t v5 = +[NSBundle mainBundle];
  int v6 = [v5 localizedStringForKey:@"Automatic Updates [cell title]" value:@"localized string not found" table:@"Offline"];
  [(MapsDebugTableRow *)v4 setTitle:v6];

  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"Automatic Updates [cell subtitle]" value:@"localized string not found" table:@"Offline"];
  [(MapsDebugTableRow *)v4 setSubtitle:v8];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10064FC80;
  v14[3] = &unk_1012F3048;
  BOOL v15 = v3;
  [(MapsDebugSwitchTableRow *)v4 setGet:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10064FCA0;
  v12[3] = &unk_1012F3068;
  BOOL v13 = v3;
  [(MapsDebugSwitchTableRow *)v4 setSet:v12];
  id v9 = [(MapsDebugTableRow *)v4 title];
  [(MapsDebugSwitchTableRow *)v4 setAccessibilityLabel:v9];

  [(MapsDebugSwitchTableRow *)v4 setEnabled:v3];
  [(MapsDebugTableRow *)v4 setSelectionAction:0];
  [(MapsDebugTableRow *)v4 setConfigureCollectionViewCellBlock:&stru_1012F3088];
  unsigned int v10 = objc_alloc_init(OfflineMapsManagementCellModel);
  [(OfflineMapsManagementCellModel *)v10 setCellType:3];
  [(OfflineMapsManagementCellModel *)v10 setTableRow:v4];

  return v10;
}

- (id)_automaticUpdatesModel
{
  automaticUpdatesModel = self->_automaticUpdatesModel;
  if (!automaticUpdatesModel)
  {
    unint64_t v4 = [(OfflineMapsManagementDataSource *)self _createAutomaticUpdatesModel:1];
    unint64_t v5 = self->_automaticUpdatesModel;
    self->_automaticUpdatesModel = v4;

    automaticUpdatesModel = self->_automaticUpdatesModel;
  }

  return automaticUpdatesModel;
}

- (id)_disabledAutomaticUpdatesModel
{
  disabledAutomaticUpdatesModel = self->_disabledAutomaticUpdatesModel;
  if (!disabledAutomaticUpdatesModel)
  {
    unint64_t v4 = [(OfflineMapsManagementDataSource *)self _createAutomaticUpdatesModel:0];
    unint64_t v5 = self->_disabledAutomaticUpdatesModel;
    self->_disabledAutomaticUpdatesModel = v4;

    [(OfflineMapsManagementDataSource *)self _updateAutoUpdateRowSubtitle];
    disabledAutomaticUpdatesModel = self->_disabledAutomaticUpdatesModel;
  }

  return disabledAutomaticUpdatesModel;
}

- (void)_updateAutoUpdateRowSubtitle
{
  if (self->_disabledAutomaticUpdatesModel)
  {
    id v8 = objc_alloc_init((Class)NSByteCountFormatter);
    BOOL v3 = [v8 stringFromByteCount:GEOMaximumAutomaticUpdateOfflineDataSize()];
    unint64_t v4 = +[NSBundle mainBundle];
    unint64_t v5 = [v4 localizedStringForKey:@"Automatic Updates [disabled cell subtitle]" value:@"localized string not found" table:@"Offline"];
    int v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v3);
    id v7 = [(OfflineMapsManagementCellModel *)self->_disabledAutomaticUpdatesModel tableRow];
    [v7 setSubtitle:v6];
  }
}

- (id)_optimizeStorageModel
{
  optimizeStorageModel = self->_optimizeStorageModel;
  if (!optimizeStorageModel)
  {
    unint64_t v4 = objc_alloc_init(MapsDebugSwitchTableRow);
    unint64_t v5 = +[NSBundle mainBundle];
    int v6 = [v5 localizedStringForKey:@"Optimize Storage [cell title]" value:@"localized string not found" table:@"Offline"];
    [(MapsDebugTableRow *)v4 setTitle:v6];

    [(MapsDebugSwitchTableRow *)v4 setGet:&stru_1012F30A8];
    [(MapsDebugSwitchTableRow *)v4 setSet:&stru_1012F30C8];
    id v7 = [(MapsDebugTableRow *)v4 title];
    [(MapsDebugSwitchTableRow *)v4 setAccessibilityLabel:v7];

    [(MapsDebugTableRow *)v4 setSelectionAction:0];
    [(MapsDebugTableRow *)v4 setConfigureCollectionViewCellBlock:&stru_1012F30E8];
    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"Optimize Storage [cell subtitle]" value:@"localized string not found" table:@"Offline"];
    [(MapsDebugTableRow *)v4 setSubtitle:v9];

    unsigned int v10 = objc_alloc_init(OfflineMapsManagementCellModel);
    uint64_t v11 = self->_optimizeStorageModel;
    self->_optimizeStorageModel = v10;

    [(OfflineMapsManagementCellModel *)self->_optimizeStorageModel setCellType:4];
    [(OfflineMapsManagementCellModel *)self->_optimizeStorageModel setTableRow:v4];

    optimizeStorageModel = self->_optimizeStorageModel;
  }

  return optimizeStorageModel;
}

- (id)_createSyncToWatchModel:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = objc_alloc_init(OfflineMapsManagementCellModel);
  [(OfflineMapsManagementCellModel *)v5 setCellType:5];
  int v6 = objc_alloc_init(MapsDebugSwitchTableRow);
  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"Sync with Watch [cell title]" value:@"localized string not found" table:@"Offline"];
  [(MapsDebugTableRow *)v6 setTitle:v8];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100650590;
  v20[3] = &unk_1012F3048;
  BOOL v21 = v3;
  [(MapsDebugSwitchTableRow *)v6 setGet:v20];
  objc_initWeak(&location, v5);
  objc_initWeak(&from, self);
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  BOOL v13 = sub_1006505B0;
  id v14 = &unk_1012F3110;
  BOOL v17 = v3;
  objc_copyWeak(&v15, &from);
  objc_copyWeak(&v16, &location);
  [(MapsDebugSwitchTableRow *)v6 setSet:&v11];
  id v9 = [(MapsDebugTableRow *)v6 title];
  [(MapsDebugSwitchTableRow *)v6 setAccessibilityLabel:v9];

  [(MapsDebugSwitchTableRow *)v6 setEnabled:v3];
  [(MapsDebugTableRow *)v6 setSelectionAction:0];
  [(MapsDebugTableRow *)v6 setConfigureCollectionViewCellBlock:&stru_1012F3130];
  [(OfflineMapsManagementCellModel *)v5 setTableRow:v6];
  [(OfflineMapsManagementCellModel *)v5 setEnabled:v3];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v5;
}

- (id)_syncToWatchModel
{
  syncToWatchModel = self->_syncToWatchModel;
  if (!syncToWatchModel)
  {
    unint64_t v4 = [(OfflineMapsManagementDataSource *)self _createSyncToWatchModel:1];
    unint64_t v5 = self->_syncToWatchModel;
    self->_syncToWatchModel = v4;

    [(OfflineMapsManagementDataSource *)self _updateSyncToWatchModel];
    syncToWatchModel = self->_syncToWatchModel;
  }

  return syncToWatchModel;
}

- (id)_disabledSyncToWatchModel
{
  disabledSyncToWatchModel = self->_disabledSyncToWatchModel;
  if (!disabledSyncToWatchModel)
  {
    unint64_t v4 = [(OfflineMapsManagementDataSource *)self _createSyncToWatchModel:0];
    unint64_t v5 = self->_disabledSyncToWatchModel;
    self->_disabledSyncToWatchModel = v4;

    disabledSyncToWatchModel = self->_disabledSyncToWatchModel;
  }

  return disabledSyncToWatchModel;
}

- (void)_updateSyncToWatchModel
{
  BOOL v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v9 = [v3 getActivePairedDeviceExcludingAltAccount];

  if (v9)
  {
    unint64_t v4 = [v9 valueForProperty:NRDevicePropertyName];
    unint64_t v5 = +[NSBundle mainBundle];
    int v6 = [v5 localizedStringForKey:@"Sync with Watch [cell subtitle]" value:@"localized string not found" table:@"Offline"];
    id v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v4);
    id v8 = [(OfflineMapsManagementCellModel *)self->_syncToWatchModel tableRow];
    [v8 setSubtitle:v7];
  }
  else
  {
    unint64_t v4 = [(OfflineMapsManagementCellModel *)self->_syncToWatchModel tableRow];
    [v4 setSubtitle:0];
  }
}

- (id)_createForceOfflineModel:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = objc_alloc_init(MapsDebugSwitchTableRow);
  unint64_t v5 = +[NSBundle mainBundle];
  int v6 = [v5 localizedStringForKey:@"Only Use Offline Maps [cell title]" value:@"localized string not found" table:@"Offline"];
  [(MapsDebugTableRow *)v4 setTitle:v6];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100650D28;
  v14[3] = &unk_1012F3048;
  BOOL v15 = v3;
  [(MapsDebugSwitchTableRow *)v4 setGet:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100650D48;
  v12[3] = &unk_1012F3068;
  BOOL v13 = v3;
  [(MapsDebugSwitchTableRow *)v4 setSet:v12];
  id v7 = [(MapsDebugTableRow *)v4 title];
  [(MapsDebugSwitchTableRow *)v4 setAccessibilityLabel:v7];

  [(MapsDebugSwitchTableRow *)v4 setEnabled:v3];
  [(MapsDebugTableRow *)v4 setSelectionAction:0];
  [(MapsDebugTableRow *)v4 setConfigureCollectionViewCellBlock:&stru_1012F3150];
  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"Force offline footer text" value:@"localized string not found" table:@"Offline"];
  [(MapsDebugTableRow *)v4 setSubtitle:v9];

  unsigned int v10 = objc_alloc_init(OfflineMapsManagementCellModel);
  [(OfflineMapsManagementCellModel *)v10 setCellType:6];
  [(OfflineMapsManagementCellModel *)v10 setTableRow:v4];
  [(OfflineMapsManagementCellModel *)v10 setEnabled:v3];

  return v10;
}

- (id)_forceOfflineModel
{
  forceOfflineModel = self->_forceOfflineModel;
  if (!forceOfflineModel)
  {
    unint64_t v4 = [(OfflineMapsManagementDataSource *)self _createForceOfflineModel:1];
    unint64_t v5 = self->_forceOfflineModel;
    self->_forceOfflineModel = v4;

    forceOfflineModel = self->_forceOfflineModel;
  }

  return forceOfflineModel;
}

- (id)_disabledForceOfflineModel
{
  disabledForceOfflineModel = self->_disabledForceOfflineModel;
  if (!disabledForceOfflineModel)
  {
    unint64_t v4 = [(OfflineMapsManagementDataSource *)self _createForceOfflineModel:0];
    unint64_t v5 = self->_disabledForceOfflineModel;
    self->_disabledForceOfflineModel = v4;

    disabledForceOfflineModel = self->_disabledForceOfflineModel;
  }

  return disabledForceOfflineModel;
}

- (OfflineMapsManagementDataSourceDelegate)offlineDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_offlineDelegate);

  return (OfflineMapsManagementDataSourceDelegate *)WeakRetained;
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

- (OfflineMapsSuggestionsDataProvider)suggestionsProvider
{
  return self->_suggestionsProvider;
}

- (void)setSuggestionsProvider:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (NSArray)subscriptionInfos
{
  return self->_subscriptionInfos;
}

- (void)setSubscriptionInfos:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NSArray)suggestedRegions
{
  return self->_suggestedRegions;
}

- (void)setSuggestedRegions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedRegions, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_subscriptionInfos, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_suggestionsProvider, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_destroyWeak((id *)&self->_offlineDelegate);
  objc_storeStrong(&self->_autoupdateFrequencyBucketsListener, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_disabledForceOfflineModel, 0);
  objc_storeStrong((id *)&self->_forceOfflineModel, 0);
  objc_storeStrong((id *)&self->_disabledSyncToWatchModel, 0);
  objc_storeStrong((id *)&self->_syncToWatchModel, 0);
  objc_storeStrong((id *)&self->_optimizeStorageModel, 0);
  objc_storeStrong((id *)&self->_disabledAutomaticUpdatesModel, 0);
  objc_storeStrong((id *)&self->_automaticUpdatesModel, 0);
  objc_storeStrong((id *)&self->_downloadSettingsModel, 0);
  objc_storeStrong((id *)&self->_disabledUpdateAllModel, 0);
  objc_storeStrong((id *)&self->_updateAllModel, 0);
  objc_storeStrong((id *)&self->_downloadNewMapModel, 0);
  objc_storeStrong((id *)&self->_expiredMapsModel, 0);
  objc_storeStrong((id *)&self->_forceOfflineSection, 0);
  objc_storeStrong((id *)&self->_settingsSection, 0);
  objc_storeStrong((id *)&self->_actionButtonsSection, 0);
  objc_storeStrong((id *)&self->_downloadedAndExpiredSection, 0);
  objc_storeStrong((id *)&self->_expiredSubscriptions, 0);

  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
}

@end