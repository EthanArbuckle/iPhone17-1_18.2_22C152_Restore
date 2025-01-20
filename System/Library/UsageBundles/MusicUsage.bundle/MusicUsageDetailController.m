@interface MusicUsageDetailController
- (BOOL)canBeShownFromSuspendedState;
- (id)_placeholderAlbumArtistArtworkCatalog;
- (id)sizeForSpecifier:(id)a3;
- (id)specifiers;
- (id)specifiersFromUsageGroups;
- (void)addUsageGroup:(id)a3;
- (void)buildUsageGroupForCategory:(id)a3 usingStorageReporter:(id)a4;
- (void)deleteUsageItemAtIndexPath:(id)a3;
- (void)reloadSpecifiers;
- (void)removeSpecifierAtIndexPath:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateLocalSongsGroupSize;
- (void)updateUsageBundleSizeForCategoryIdentifier:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MusicUsageDetailController

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)MusicUsageDetailController;
  [(MusicUsageDetailController *)&v10 viewDidLoad];
  [(MusicUsageDetailController *)self setEditingButtonHidden:0 animated:0];
  objc_initWeak(&location, self);
  v3 = +[NSNotificationCenter defaultCenter];
  v4 = +[NSOperationQueue mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6BC0;
  v7[3] = &unk_10528;
  objc_copyWeak(&v8, &location);
  v5 = [v3 addObserverForName:UISceneWillEnterForegroundNotification object:0 queue:v4 usingBlock:v7];
  id sceneDidEnterForegroundObserver = self->sceneDidEnterForegroundObserver;
  self->id sceneDidEnterForegroundObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v23.receiver = self;
  v23.super_class = (Class)MusicUsageDetailController;
  [(MusicUsageDetailController *)&v23 viewDidAppear:a3];
  if (![(NSMutableArray *)self->_usageGroups count])
  {
    v4 = [(MusicUsageDetailController *)self navigationController];
    id v5 = [v4 popViewControllerAnimated:1];
  }
  v22 = +[NSURL URLWithString:@"prefs:root=MUSIC&path=com.apple.Music:MusicUsageLink"];
  id v6 = objc_alloc((Class)_NSLocalizedStringResource);
  v7 = +[NSLocale currentLocale];
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 bundleURL];
  id v10 = [v6 initWithKey:@"APPS" table:@"MusicSettings" locale:v7 bundleURL:v9];

  id v11 = objc_alloc((Class)_NSLocalizedStringResource);
  v12 = +[NSLocale currentLocale];
  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v14 = [v13 bundleURL];
  id v15 = [v11 initWithKey:@"MUSIC" table:@"MusicSettings" locale:v12 bundleURL:v14];

  id v16 = objc_alloc((Class)_NSLocalizedStringResource);
  v17 = +[NSLocale currentLocale];
  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  v19 = [v18 bundleURL];
  id v20 = [v16 initWithKey:@"DOWNLOADED_MUSIC" table:@"MusicSettings" locale:v17 bundleURL:v19];

  v24[0] = v10;
  v24[1] = v15;
  v21 = +[NSArray arrayWithObjects:v24 count:2];
  [(MusicUsageDetailController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.Music" title:v20 localizedNavigationComponents:v21 deepLink:v22];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSUsageBundleDetailController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [(MusicUsageDetailController *)self specifier];
    id v6 = [v5 propertyForKey:PSUsageBundleAppKey];

    v7 = [v6 usageBundleStorageReporter];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = objc_msgSend(v6, "categories", 0);
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          [v7 sizeForCategory:v13];
          if (fabsf(v14) >= 0.00000011921) {
            [(MusicUsageDetailController *)self buildUsageGroupForCategory:v13 usingStorageReporter:v7];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    uint64_t v15 = [(MusicUsageDetailController *)self specifiersFromUsageGroups];
    id v16 = *(void **)&self->PSUsageBundleDetailController_opaque[v3];
    *(void *)&self->PSUsageBundleDetailController_opaque[v3] = v15;

    v4 = *(void **)&self->PSUsageBundleDetailController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MusicUsageDetailController *)self specifierAtIndex:[(MusicUsageDetailController *)self indexForIndexPath:v7]];
  id v9 = [v8 propertyForKey:@"MusicUsageItemPropertyKey"];
  id v10 = [v9 childUsageGroup];
  id v11 = [v10 numberOfUsageItems];

  if (v11)
  {
    v12 = [(MusicUsageDetailController *)self specifier];
    uint64_t v13 = PSUsageBundleAppKey;
    float v14 = [v12 propertyForKey:PSUsageBundleAppKey];
    [v8 setProperty:v14 forKey:v13];

    uint64_t v15 = [MusicUsageArtistDetailController alloc];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_7240;
    v19[3] = &unk_10440;
    id v20 = v9;
    long long v21 = self;
    id v16 = v8;
    id v22 = v16;
    v17 = [(MusicUsageArtistDetailController *)v15 initWithFileSizeDidChangeHandler:v19];
    [(MusicUsageArtistDetailController *)v17 setParentController:self];
    [(MusicUsageArtistDetailController *)v17 setSpecifier:v16];
    long long v18 = [(MusicUsageDetailController *)self rootController];
    [(MusicUsageArtistDetailController *)v17 setRootController:v18];

    [(MusicUsageDetailController *)self showController:v17 animate:1];
  }
  else
  {
    [v6 deselectRowAtIndexPath:v7 animated:1];
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  -[MusicUsageDetailController removeSpecifierAtIndexPath:](self, "removeSpecifierAtIndexPath:", a5, a4);
  if (![(NSMutableArray *)self->_usageGroups count])
  {
    id v7 = [(MusicUsageDetailController *)self navigationController];
    id v6 = [v7 popViewControllerAnimated:1];
  }
}

- (id)sizeForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:@"MusicUsageItemPropertyKey"];
  id v6 = [v5 itemCollection];

  if (v6)
  {
    id v7 = [v5 itemCollection];
    id v8 = +[NSByteCountFormatter stringFromByteCount:MusicUsageFileSizeForMediaItemCollection(v7) countStyle:2];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MusicUsageDetailController;
    id v8 = [(MusicUsageDetailController *)&v10 sizeForSpecifier:v4];
  }

  return v8;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)reloadSpecifiers
{
  [(NSMutableArray *)self->_usageGroups removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)MusicUsageDetailController;
  [(MusicUsageDetailController *)&v3 reloadSpecifiers];
}

- (void)updateLocalSongsGroupSize
{
  [(MusicUsageGroup *)self->_localSongsGroup updateGroupSize];
  objc_super v3 = [(MusicUsageGroup *)self->_localSongsGroup groupSpecifierIdentifier];
  id v4 = [(MusicUsageDetailController *)self specifierForID:v3];

  if ([(MusicUsageGroup *)self->_localSongsGroup groupSize])
  {
    id v5 = +[NSNumber numberWithUnsignedLongLong:[(MusicUsageGroup *)self->_localSongsGroup groupSize]];
    [v4 setProperty:v5 forKey:@"SIZE"];

    id v6 = +[NSByteCountFormatter stringFromByteCount:[(MusicUsageGroup *)self->_localSongsGroup groupSize] countStyle:2];
    id v7 = [v4 propertyForKey:PSHeaderViewKey];
    [v7 setSize:v6];

    id v8 = [(MusicUsageGroup *)self->_localSongsGroup groupSpecifierIdentifier];
    [(MusicUsageDetailController *)self reloadSpecifierID:v8];
  }
  else
  {
    [(NSMutableArray *)self->_usageGroups removeObject:self->_localSongsGroup];
    id v9 = [(MusicUsageGroup *)self->_localSongsGroup usageItems];
    objc_super v10 = [v9 firstObject];
    id v11 = [v10 specifierIdentifier];
    v12 = [(MusicUsageDetailController *)self specifierForID:v11];

    v15[0] = v4;
    v15[1] = v12;
    uint64_t v13 = +[NSArray arrayWithObjects:v15 count:2];
    [(MusicUsageDetailController *)self removeContiguousSpecifiers:v13 animated:1];
  }
  float v14 = [(MusicUsageGroup *)self->_localSongsGroup categoryIdentifier];
  [(MusicUsageDetailController *)self updateUsageBundleSizeForCategoryIdentifier:v14];
}

- (void)updateUsageBundleSizeForCategoryIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MusicUsageDetailController *)self specifier];
  id v12 = [v5 propertyForKey:PSUsageBundleAppKey];

  id v6 = [v12 usageBundleStorageReporter];
  [v6 reloadSizeForCategoryIdentifier:v4];

  *(float *)&double v7 = (float)(unint64_t)[v6 totalSize];
  [v12 setTotalSize:v7];
  id v8 = [(MusicUsageDetailController *)self specifier];
  id v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 totalSize]);
  [v8 setProperty:v9 forKey:@"TOTAL_SIZE"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->PSUsageBundleDetailController_opaque[OBJC_IVAR___PSViewController__parentController]);
  id v11 = [(MusicUsageDetailController *)self specifier];
  [WeakRetained reloadSpecifier:v11];
}

- (void)removeSpecifierAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MusicUsageDetailController *)self specifierAtIndex:[(MusicUsageDetailController *)self indexForIndexPath:v4]];
  id v6 = [v5 propertyForKey:@"MusicUsageItemPropertyKey"];
  double v7 = [v6 usageGroup];
  id v8 = v7;
  if (v7 == self->_localSongsGroup)
  {
    v31 = v7;
    v32 = v5;
    id v9 = +[MPMediaLibrary defaultMediaLibrary];
    objc_super v10 = [v6 itemCollection];
    id v11 = [v10 items];
    [v9 removeItems:v11];

    id v12 = +[MPMediaQuery albumsQuery];
    [v12 setIgnoreSystemFilterPredicates:1];
    [v12 setIgnoreRestrictionsPredicates:1];
    [v12 setShouldIncludeNonLibraryEntities:1];
    uint64_t v13 = +[MPMediaPropertyPredicate predicateWithValue:&off_10D58 forProperty:MPMediaItemPropertyAlbumKeepLocal comparisonType:101];
    [v12 addFilterPredicate:v13];

    v30 = v12;
    float v14 = [v12 collections];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v15 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
    uint64_t v16 = MPMediaEntityPropertyKeepLocal;
    if (v15)
    {
      id v17 = v15;
      uint64_t v18 = *(void *)v39;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v38 + 1) + 8 * i) setValue:&off_10D58 forProperty:v16];
        }
        id v17 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v17);
    }
    id v33 = v4;
    id v20 = +[MPMediaQuery playlistsQuery];
    [v20 setIgnoreSystemFilterPredicates:1];
    [v20 setIgnoreRestrictionsPredicates:1];
    [v20 setShouldIncludeNonLibraryEntities:1];
    long long v21 = +[MPMediaPropertyPredicate predicateWithValue:&off_10D58 forProperty:v16 comparisonType:101];
    [v20 addFilterPredicate:v21];

    id v22 = [v20 collections];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v23 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v35;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * (void)j) setValue:&off_10D58 forProperty:v16];
        }
        id v24 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v24);
    }
    v27 = [(MusicUsageGroup *)self->_localSongsGroup categoryIdentifier];
    [(MusicUsageDetailController *)self updateUsageBundleSizeForCategoryIdentifier:v27];

    v28 = [(MusicUsageDetailController *)self navigationController];
    id v29 = [v28 popViewControllerAnimated:1];

    id v5 = v32;
    id v4 = v33;
    id v8 = v31;
  }
  else
  {
    [(MusicUsageDetailController *)self deleteUsageItemAtIndexPath:v4];
  }
}

- (void)deleteUsageItemAtIndexPath:(id)a3
{
  id v4 = [(MusicUsageDetailController *)self specifierAtIndex:[(MusicUsageDetailController *)self indexForIndexPath:a3]];
  id v5 = [v4 propertyForKey:@"MusicUsageItemPropertyKey"];
  id v6 = [v5 usageGroup];
  [v6 removeUsageItem:v5];
  double v7 = [v5 itemCollection];
  id v8 = [v7 items];

  if ([v8 count])
  {
    id v9 = +[MPMediaLibrary defaultMediaLibrary];
    [v9 removeItems:v8];

    if ([v6 isIncludedInLocalGroup])
    {
      [(MusicUsageDetailController *)self updateLocalSongsGroupSize];
    }
    else
    {
      objc_super v10 = [v6 categoryIdentifier];
      [(MusicUsageDetailController *)self updateUsageBundleSizeForCategoryIdentifier:v10];
    }
  }
  id v11 = [v6 groupSpecifierIdentifier];
  id v12 = [(MusicUsageDetailController *)self specifierForID:v11];

  if ([v6 numberOfUsageItems])
  {
    [(MusicUsageDetailController *)self removeSpecifier:v4 animated:1];
    [v6 updateGroupSize];
    uint64_t v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 groupSize]);
    [v12 setProperty:v13 forKey:@"SIZE"];

    float v14 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [v6 groupSize], 2);
    id v15 = [v12 propertyForKey:PSHeaderViewKey];
    [v15 setSize:v14];
  }
  else
  {
    [(NSMutableArray *)self->_usageGroups removeObject:v6];
    v17[0] = v12;
    v17[1] = v4;
    uint64_t v16 = +[NSArray arrayWithObjects:v17 count:2];
    [(MusicUsageDetailController *)self removeContiguousSpecifiers:v16 animated:1];
  }
}

- (void)addUsageGroup:(id)a3
{
  id v4 = a3;
  usageGroups = self->_usageGroups;
  id v8 = v4;
  if (!usageGroups)
  {
    id v6 = +[NSMutableArray array];
    double v7 = self->_usageGroups;
    self->_usageGroups = v6;

    id v4 = v8;
    usageGroups = self->_usageGroups;
  }
  [(NSMutableArray *)usageGroups addObject:v4];
}

- (void)buildUsageGroupForCategory:(id)a3 usingStorageReporter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v51 = v6;
  if ([v8 isEqualToString:@"MusicUsageCategoryLocalMusic"])
  {
    id v9 = objc_alloc_init(MusicUsageGroup);
    localSongsGroup = self->_localSongsGroup;
    self->_localSongsGroup = v9;

    [(MusicUsageGroup *)self->_localSongsGroup setGroupSpecifierIdentifier:@"local_songs"];
    id v11 = [v6 name];
    [(MusicUsageGroup *)self->_localSongsGroup setGroupName:v11];

    [(MusicUsageGroup *)self->_localSongsGroup setCategoryIdentifier:v8];
    [(MusicUsageGroup *)self->_localSongsGroup setShowsItemArtwork:0];
    v54 = [v7 queryForCategoryIdentifier:v8];
    v47 = (MusicUsageGroup *)[objc_alloc((Class)MPMediaItemCollection) initWithItemsQuery:v54];
    v50 = +[MusicUsageItem usageItemWithItemCollection:displayNameBlock:](MusicUsageItem, "usageItemWithItemCollection:displayNameBlock:");
    [(MusicUsageGroup *)self->_localSongsGroup addUsageItem:v50];
    [(MusicUsageGroup *)self->_localSongsGroup updateGroupSize];
    [(MusicUsageDetailController *)self addUsageGroup:self->_localSongsGroup];
    id v12 = +[MPMediaQuery albumArtistsQuery];
    [v12 setIgnoreSystemFilterPredicates:1];
    [v12 setIgnoreRestrictionsPredicates:1];
    [v12 setShouldIncludeNonLibraryEntities:1];
    uint64_t v45 = MPMediaItemPropertyHasNonPurgeableAsset;
    uint64_t v13 = +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &__kCFBooleanTrue);
    [v12 addFilterPredicate:v13];

    float v14 = [v12 collections];
    id v15 = objc_alloc_init(MusicUsageGroup);
    [(MusicUsageGroup *)v15 setGroupSpecifierIdentifier:@"artists"];
    uint64_t v16 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
    id v17 = [v16 localizedStringForKey:@"ARTISTS_HEADER" value:&stru_108A0 table:@"MusicUsage"];
    [(MusicUsageGroup *)v15 setGroupName:v17];

    [(MusicUsageGroup *)v15 setCategoryIdentifier:v8];
    [(MusicUsageGroup *)v15 setIncludedInLocalGroup:1];
    uint64_t v18 = v15;
    [(MusicUsageGroup *)v15 setShowsItemArtwork:1];
    v46 = v12;
    if ([v14 count])
    {
      long long v19 = self;
      v49 = v8;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id obj = v14;
      id v20 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v64;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v64 != v22) {
              objc_enumerationMutation(obj);
            }
            id v24 = +[MusicUsageItem usageItemWithItemCollection:*(void *)(*((void *)&v63 + 1) + 8 * i) displayNameBlock:&stru_10568];
            [v24 setSubtitlesBlock:&stru_105A8];
            v62[0] = _NSConcreteStackBlock;
            v62[1] = 3221225472;
            v62[2] = sub_8E90;
            v62[3] = &unk_105D0;
            v62[4] = v19;
            [v24 setArtworkCatalogBlock:v62];
            [v24 setArtworkWantsCircleTreatment:1];
            [(MusicUsageGroup *)v18 addUsageItem:v24];
          }
          id v21 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
        }
        while (v21);
      }

      id v8 = v49;
      self = v19;
    }
    uint64_t v25 = +[MPMediaQuery songsQuery];
    [v25 setIgnoreSystemFilterPredicates:1];
    [v25 setIgnoreRestrictionsPredicates:1];
    [v25 setShouldIncludeNonLibraryEntities:1];
    v26 = +[MPMediaPropertyPredicate predicateWithValue:&off_10D58 forProperty:MPMediaItemPropertyAlbumArtistPersistentID];
    [v25 addFilterPredicate:v26];

    v27 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanTrue forProperty:v45];
    [v25 addFilterPredicate:v27];

    v28 = v18;
    if ([v25 _countOfItems])
    {
      id v29 = +[MPMediaQuery albumArtistsQuery];
      [v29 setIgnoreSystemFilterPredicates:1];
      [v29 setIgnoreRestrictionsPredicates:1];
      [v29 setShouldIncludeNonLibraryEntities:1];
      v30 = +[MPMediaPropertyPredicate predicateWithValue:&off_10D58 forProperty:MPMediaItemPropertyAlbumArtistPersistentID];
      [v29 addFilterPredicate:v30];

      v31 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanTrue forProperty:v45];
      [v29 addFilterPredicate:v31];

      v32 = [v29 collections];
      id v33 = [v32 firstObject];

      long long v34 = +[MusicUsageItem usageItemWithItemCollection:v33 displayNameBlock:&stru_105F0];
      [v34 setSubtitlesBlock:&stru_10610];
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_9074;
      v61[3] = &unk_105D0;
      v61[4] = self;
      [v34 setArtworkCatalogBlock:v61];
      [v34 setArtworkWantsCircleTreatment:1];
      [(MusicUsageGroup *)v28 addUsageItem:v34];
    }
    [(MusicUsageGroup *)v28 updateGroupSize];
    if ([(MusicUsageGroup *)v28 numberOfUsageItems]) {
      [(MusicUsageDetailController *)self addUsageGroup:v28];
    }

    long long v35 = v47;
    long long v36 = v7;
    long long v37 = v51;
  }
  else
  {
    v48 = self;
    v54 = MPMediaItemPropertyTitle;
    long long v35 = objc_alloc_init(MusicUsageGroup);
    [(MusicUsageGroup *)v35 setGroupSpecifierIdentifier:v8];
    long long v38 = [v6 name];
    [(MusicUsageGroup *)v35 setGroupName:v38];

    [(MusicUsageGroup *)v35 setCategoryIdentifier:v8];
    [(MusicUsageGroup *)v35 setShowsItemArtwork:1];
    [v7 queryForCategoryIdentifier:v8];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v50 = long long v60 = 0u;
    id obja = [v50 collections];
    id v39 = [obja countByEnumeratingWithState:&v57 objects:v67 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v58;
      do
      {
        for (j = 0; j != v40; j = (char *)j + 1)
        {
          if (*(void *)v58 != v41) {
            objc_enumerationMutation(obja);
          }
          uint64_t v43 = *(void *)(*((void *)&v57 + 1) + 8 * (void)j);
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_907C;
          v55[3] = &unk_10638;
          v56 = v54;
          v44 = +[MusicUsageItem usageItemWithItemCollection:v43 displayNameBlock:v55];
          [v44 setArtworkCatalogBlock:&stru_10658];
          [(MusicUsageGroup *)v35 addUsageItem:v44];
        }
        id v40 = [obja countByEnumeratingWithState:&v57 objects:v67 count:16];
      }
      while (v40);
    }

    [(MusicUsageGroup *)v35 updateGroupSize];
    [(MusicUsageDetailController *)v48 addUsageGroup:v35];
    long long v36 = v7;
    long long v37 = v6;
  }
}

- (id)specifiersFromUsageGroups
{
  memset(v93, 0, sizeof(v93));
  id v68 = +[NSMutableArray array];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v73 = self;
  id obj = self->_usageGroups;
  id v56 = [(NSMutableArray *)obj countByEnumeratingWithState:&v89 objects:v97 count:16];
  if (v56)
  {
    uint64_t v54 = PSHeaderCellClassGroupKey;
    uint64_t v55 = *(void *)v90;
    uint64_t v64 = PSCellClassKey;
    uint64_t v65 = PSLazyIconLoading;
    uint64_t v63 = PSTableCellHeightKey;
    uint64_t v59 = MPMediaItemPropertyHasNonPurgeableAsset;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v90 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v58 = v3;
        id v4 = *(void **)(*((void *)&v89 + 1) + 8 * v3);
        id v5 = [v4 groupName];
        id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:0 set:0 get:0 detail:0 cell:0 edit:0];

        [v6 setProperty:@"PSUsageSizeHeader" forKey:v54];
        id v7 = [v4 groupSpecifierIdentifier];
        [v6 setIdentifier:v7];

        id v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 groupSize]);
        [v6 setProperty:v8 forKey:@"SIZE"];

        long long v57 = v6;
        [v68 addObject:v6];
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        v76 = v4;
        id v66 = [v4 usageItems];
        id v69 = [v66 countByEnumeratingWithState:&v85 objects:v96 count:16];
        if (v69)
        {
          uint64_t v67 = *(void *)v86;
          do
          {
            for (i = 0; i != v69; i = (char *)i + 1)
            {
              if (*(void *)v86 != v67) {
                objc_enumerationMutation(v66);
              }
              objc_super v10 = *(void **)(*((void *)&v85 + 1) + 8 * i);
              uint64_t v11 = [v10 title];
              id v12 = [v10 itemCollection];
              uint64_t v13 = [v76 categoryIdentifier];
              uint64_t v14 = objc_msgSend(v13, "stringByAppendingFormat:", @"-%llu-%d", objc_msgSend(v12, "persistentID"), objc_msgSend(v12, "groupingType"));

              id v15 = (void *)v14;
              uint64_t v16 = v10;
              [v10 setSpecifierIdentifier:v15];
              v74 = (void *)v11;
              id v17 = +[PSSpecifier preferenceSpecifierNamed:v11 target:v73 set:0 get:"sizeForSpecifier:" detail:0 cell:4 edit:0];
              [v17 setIdentifier:v15];
              [v17 setProperty:v16 forKey:@"MusicUsageItemPropertyKey"];
              if ([v76 showsItemArtwork])
              {
                [v17 setProperty:&__kCFBooleanTrue forKey:v65];
                v71 = v12;
                [v17 setProperty:objc_opt_class() forKey:v64];
                uint64_t v18 = [v16 artworkCatalogBlock];
                v75 = v16;
                BOOL v19 = v18 != 0;

                id v20 = [v75 subtitlesBlock];
                BOOL v21 = v20 != 0;

                v72 = i;
                [(MusicUsageDetailController *)v73 traitCollection];
                uint64_t v22 = v70 = v17;
                +[MusicUsageTableViewCell maximumRowHeightIncludingArtwork:v19 includingSubtitle:v21 traitCollection:v22 sizingCache:v93];
                double v24 = v23;

                id v17 = v70;
                uint64_t v25 = +[NSNumber numberWithDouble:v24];
                [v70 setProperty:v25 forKey:v63];

                if ([v12 groupingType] == (char *)&dword_0 + 2
                  || [v12 groupingType] == (char *)&dword_0 + 3)
                {
                  v26 = [v75 itemCollection];
                  v27 = (char *)[v26 groupingType];

                  if (v27 == (unsigned char *)&dword_0 + 3)
                  {
                    v61 = v15;
                    v28 = [v75 itemCollection];
                    id v29 = [v28 persistentID];

                    v30 = +[MPMediaQuery albumsQuery];
                    [v30 setIgnoreSystemFilterPredicates:1];
                    [v30 setIgnoreRestrictionsPredicates:1];
                    [v30 setShouldIncludeNonLibraryEntities:1];
                    v31 = +[NSNumber numberWithUnsignedLongLong:v29];
                    v32 = +[MPMediaPropertyPredicate predicateWithValue:v31 forProperty:MPMediaItemPropertyAlbumArtistPersistentID];
                    [v30 addFilterPredicate:v32];

                    id v33 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanTrue forProperty:v59];
                    [v30 addFilterPredicate:v33];

                    long long v60 = v30;
                    long long v34 = [v30 collections];
                    long long v35 = +[NSMutableArray array];
                    v62 = v34;
                    if ([v34 count])
                    {
                      long long v83 = 0u;
                      long long v84 = 0u;
                      long long v81 = 0u;
                      long long v82 = 0u;
                      id v36 = v34;
                      id v37 = [v36 countByEnumeratingWithState:&v81 objects:v95 count:16];
                      if (v37)
                      {
                        id v38 = v37;
                        uint64_t v39 = *(void *)v82;
                        do
                        {
                          for (j = 0; j != v38; j = (char *)j + 1)
                          {
                            if (*(void *)v82 != v39) {
                              objc_enumerationMutation(v36);
                            }
                            uint64_t v41 = +[MusicUsageItem usageItemWithItemCollection:*(void *)(*((void *)&v81 + 1) + 8 * (void)j) displayNameBlock:&stru_10678];
                            [v41 setSubtitlesBlock:&stru_10698];
                            [v41 setArtworkCatalogBlock:&stru_106B8];
                            [v35 addObject:v41];
                          }
                          id v38 = [v36 countByEnumeratingWithState:&v81 objects:v95 count:16];
                        }
                        while (v38);
                      }
                    }
                    v42 = [v35 sortedArrayUsingComparator:&stru_106F8];
                    uint64_t v43 = objc_alloc_init(MusicUsageGroup);
                    v44 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
                    uint64_t v45 = [v44 localizedStringForKey:@"ALBUMS_HEADER" value:&stru_108A0 table:@"MusicUsage"];
                    [(MusicUsageGroup *)v43 setGroupName:v45];

                    [(MusicUsageGroup *)v43 setGroupSpecifierIdentifier:@"albums"];
                    v46 = [v76 categoryIdentifier];
                    [(MusicUsageGroup *)v43 setCategoryIdentifier:v46];

                    [(MusicUsageGroup *)v43 setShowsItemArtwork:1];
                    long long v79 = 0u;
                    long long v80 = 0u;
                    long long v77 = 0u;
                    long long v78 = 0u;
                    id v47 = v42;
                    id v48 = [v47 countByEnumeratingWithState:&v77 objects:v94 count:16];
                    if (v48)
                    {
                      id v49 = v48;
                      uint64_t v50 = *(void *)v78;
                      do
                      {
                        for (k = 0; k != v49; k = (char *)k + 1)
                        {
                          if (*(void *)v78 != v50) {
                            objc_enumerationMutation(v47);
                          }
                          [(MusicUsageGroup *)v43 addUsageItem:*(void *)(*((void *)&v77 + 1) + 8 * (void)k)];
                        }
                        id v49 = [v47 countByEnumeratingWithState:&v77 objects:v94 count:16];
                      }
                      while (v49);
                    }

                    [(MusicUsageGroup *)v43 updateGroupSize];
                    [v75 setChildUsageGroup:v43];

                    id v12 = v71;
                    i = v72;
                    id v15 = v61;
                    id v17 = v70;
                  }
                }
              }
              [v68 addObject:v17];
            }
            id v69 = [v66 countByEnumeratingWithState:&v85 objects:v96 count:16];
          }
          while (v69);
        }

        uint64_t v3 = v58 + 1;
      }
      while ((id)(v58 + 1) != v56);
      id v56 = [(NSMutableArray *)obj countByEnumeratingWithState:&v89 objects:v97 count:16];
    }
    while (v56);
  }

  return v68;
}

- (id)_placeholderAlbumArtistArtworkCatalog
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_9D24;
  id v9 = sub_9D34;
  id v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9D3C;
  block[3] = &unk_10720;
  block[4] = &v5;
  if (qword_15E60 != -1) {
    dispatch_once(&qword_15E60, block);
  }
  v2 = +[MPArtworkCatalog staticArtworkCatalogWithImage:v6[5]];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->sceneDidEnterForegroundObserver, 0);
  objc_storeStrong((id *)&self->_localSongsGroup, 0);

  objc_storeStrong((id *)&self->_usageGroups, 0);
}

@end