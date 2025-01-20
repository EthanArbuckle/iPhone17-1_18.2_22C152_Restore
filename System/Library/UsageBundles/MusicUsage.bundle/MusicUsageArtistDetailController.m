@interface MusicUsageArtistDetailController
- (MusicUsageArtistDetailController)initWithFileSizeDidChangeHandler:(id)a3;
- (id)_specifiersFromUsageItem;
- (id)sizeForSpecifier:(id)a3;
- (id)specifiers;
- (void)_removeSpecifierAtIndexPath:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MusicUsageArtistDetailController

- (MusicUsageArtistDetailController)initWithFileSizeDidChangeHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicUsageArtistDetailController;
  v5 = [(MusicUsageArtistDetailController *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id fileSizeDidChangeHandler = v5->_fileSizeDidChangeHandler;
    v5->_id fileSizeDidChangeHandler = v6;
  }
  return v5;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)MusicUsageArtistDetailController;
  [(MusicUsageArtistDetailController *)&v6 viewDidLoad];
  [(MusicUsageArtistDetailController *)self setEditingButtonHidden:0 animated:0];
  v3 = [(MusicUsageArtistDetailController *)self specifier];
  id v4 = [v3 propertyForKey:@"MusicUsageItemPropertyKey"];

  v5 = [v4 title];
  [(MusicUsageArtistDetailController *)self setTitle:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MusicUsageArtistDetailController;
  [(MusicUsageArtistDetailController *)&v9 viewDidAppear:a3];
  id v4 = [(MusicUsageArtistDetailController *)self specifier];
  v5 = [v4 propertyForKey:@"MusicUsageItemPropertyKey"];

  objc_super v6 = [v5 childUsageGroup];
  if (![v6 numberOfUsageItems])
  {
    v7 = [(MusicUsageArtistDetailController *)self navigationController];
    id v8 = [v7 popViewControllerAnimated:1];
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSUsageBundleDetailController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(MusicUsageArtistDetailController *)self _specifiersFromUsageItem];
    objc_super v6 = *(void **)&self->PSUsageBundleDetailController_opaque[v3];
    *(void *)&self->PSUsageBundleDetailController_opaque[v3] = v5;

    id v4 = *(void **)&self->PSUsageBundleDetailController_opaque[v3];
  }

  return v4;
}

- (id)sizeForSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 propertyForKey:@"MusicUsageItemPropertyKey"];
  objc_super v6 = [v5 childUsageGroup];

  if (v6)
  {
    v7 = [v5 childUsageGroup];
    id v8 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [v7 groupSize], 2);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MusicUsageArtistDetailController;
    id v8 = [(MusicUsageArtistDetailController *)&v10 sizeForSpecifier:v4];
  }

  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  -[MusicUsageArtistDetailController _removeSpecifierAtIndexPath:](self, "_removeSpecifierAtIndexPath:", a5, a4);
  objc_super v6 = [(MusicUsageArtistDetailController *)self specifier];
  id v11 = [v6 propertyForKey:@"MusicUsageItemPropertyKey"];

  v7 = [v11 childUsageGroup];
  id v8 = [v7 numberOfUsageItems];

  if (!v8)
  {
    objc_super v9 = [(MusicUsageArtistDetailController *)self navigationController];
    id v10 = [v9 popViewControllerAnimated:1];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MusicUsageArtistDetailController *)self specifierAtIndex:[(MusicUsageArtistDetailController *)self indexForIndexPath:v7]];
  objc_super v9 = [v8 propertyForKey:@"MusicUsageItemPropertyKey"];
  id v10 = [v9 childUsageGroup];
  id v11 = [v10 numberOfUsageItems];

  if (v11)
  {
    v12 = [(MusicUsageArtistDetailController *)self specifier];
    uint64_t v13 = PSUsageBundleAppKey;
    v14 = [v12 propertyForKey:PSUsageBundleAppKey];
    [v8 setProperty:v14 forKey:v13];

    v15 = [MusicUsageAlbumDetailController alloc];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_4C4C;
    v19[3] = &unk_10440;
    id v20 = v9;
    v21 = self;
    id v16 = v8;
    id v22 = v16;
    v17 = [(MusicUsageAlbumDetailController *)v15 initWithFileSizeDidChangeHandler:v19];
    [(MusicUsageAlbumDetailController *)v17 setSpecifier:v16];
    v18 = [(MusicUsageArtistDetailController *)self rootController];
    [(MusicUsageAlbumDetailController *)v17 setRootController:v18];

    [(MusicUsageAlbumDetailController *)v17 setParentController:self];
    [(MusicUsageArtistDetailController *)self showController:v17 animate:1];
  }
  else
  {
    [v6 deselectRowAtIndexPath:v7 animated:1];
  }
}

- (void)_removeSpecifierAtIndexPath:(id)a3
{
  id v4 = [(MusicUsageArtistDetailController *)self specifierAtIndex:[(MusicUsageArtistDetailController *)self indexForIndexPath:a3]];
  uint64_t v5 = [v4 propertyForKey:@"MusicUsageItemPropertyKey"];
  id v6 = [(MusicUsageArtistDetailController *)self specifier];
  id v7 = [v6 propertyForKey:@"MusicUsageItemPropertyKey"];

  id v8 = [v7 childUsageGroup];
  objc_super v9 = [v8 groupSpecifierIdentifier];
  id v10 = [(MusicUsageArtistDetailController *)self specifierForID:v9];

  id v11 = [v5 itemCollection];
  v12 = [v11 items];

  uint64_t v13 = [v7 childUsageGroup];
  [v13 removeUsageItem:v5];

  if ([v12 count])
  {
    v14 = +[MPMediaLibrary defaultMediaLibrary];
    [v14 removeItems:v12];
  }
  v15 = [v7 childUsageGroup];
  [v15 updateGroupSize];

  id fileSizeDidChangeHandler = (void (**)(void))self->_fileSizeDidChangeHandler;
  if (fileSizeDidChangeHandler) {
    fileSizeDidChangeHandler[2]();
  }
  v17 = [v7 childUsageGroup];
  id v18 = [v17 numberOfUsageItems];

  if (v18)
  {
    [(MusicUsageArtistDetailController *)self removeSpecifier:v4 animated:1];
    v19 = [v7 childUsageGroup];
    id v20 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v19 groupSize]);
    [v10 setProperty:v20 forKey:@"SIZE"];

    v21 = [v7 childUsageGroup];
    id v22 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [v21 groupSize], 2);

    v23 = [v10 propertyForKey:PSHeaderViewKey];
    [v23 setSize:v22];
  }
  else
  {
    v25[0] = v10;
    v25[1] = v4;
    v24 = +[NSArray arrayWithObjects:v25 count:2];
    [(MusicUsageArtistDetailController *)self removeContiguousSpecifiers:v24 animated:1];
  }
}

- (id)_specifiersFromUsageItem
{
  id v55 = +[NSMutableArray array];
  memset(v73, 0, sizeof(v73));
  v57 = self;
  uint64_t v3 = [(MusicUsageArtistDetailController *)self specifier];
  id v4 = objc_msgSend(v3, "propertyForKey:");

  uint64_t v5 = [v4 childUsageGroup];
  id v6 = v5;
  if (v5)
  {
    v47 = v4;
    id v7 = [v5 groupName];
    id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v8 setProperty:@"PSUsageSizeHeader" forKey:PSHeaderCellClassGroupKey];
    objc_super v9 = [v6 groupSpecifierIdentifier];
    [v8 setIdentifier:v9];

    id v10 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 groupSize]);
    [v8 setProperty:v10 forKey:@"SIZE"];

    [v55 addObject:v8];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id obj = [v6 usageItems];
    id v56 = [obj countByEnumeratingWithState:&v69 objects:v76 count:16];
    if (v56)
    {
      uint64_t v50 = PSLazyIconLoading;
      uint64_t v49 = PSCellClassKey;
      uint64_t v48 = PSTableCellHeightKey;
      uint64_t v53 = *(void *)v70;
      uint64_t v52 = MPMediaItemPropertyHasNonPurgeableAsset;
      v54 = v6;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v70 != v53) {
            objc_enumerationMutation(obj);
          }
          uint64_t v63 = v11;
          v12 = *(void **)(*((void *)&v69 + 1) + 8 * v11);
          uint64_t v13 = [v12 title];
          v14 = [v12 itemCollection];
          v15 = [v6 categoryIdentifier];
          v61 = v14;
          uint64_t v16 = objc_msgSend(v15, "stringByAppendingFormat:", @"-%llu-%d", objc_msgSend(v14, "persistentID"), objc_msgSend(v14, "groupingType"));

          [v12 setSpecifierIdentifier:v16];
          [v12 setArtworkCatalogBlock:&stru_10480];
          v62 = (void *)v13;
          v17 = +[PSSpecifier preferenceSpecifierNamed:v13 target:v57 set:0 get:"sizeForSpecifier:" detail:0 cell:4 edit:0];
          v59 = (void *)v16;
          [v17 setIdentifier:v16];
          v64 = v17;
          [v17 setProperty:v12 forKey:@"MusicUsageItemPropertyKey"];
          if ([v6 showsItemArtwork])
          {
            [v17 setProperty:&__kCFBooleanTrue forKey:v50];
            [v17 setProperty:objc_opt_class() forKey:v49];
            id v18 = [v12 artworkCatalogBlock];
            BOOL v19 = v18 != 0;

            id v20 = [v12 subtitlesBlock];
            BOOL v21 = v20 != 0;

            id v22 = [(MusicUsageArtistDetailController *)v57 traitCollection];
            +[MusicUsageTableViewCell maximumRowHeightIncludingArtwork:v19 includingSubtitle:v21 traitCollection:v22 sizingCache:v73];
            double v24 = v23;

            v25 = +[NSNumber numberWithDouble:v24];
            [v17 setProperty:v25 forKey:v48];
          }
          v26 = objc_alloc_init(MusicUsageGroup);
          v60 = v12;
          v27 = [v12 itemCollection];
          id v28 = [v27 persistentID];

          v29 = +[MPMediaQuery songsQuery];
          [v29 setIgnoreSystemFilterPredicates:1];
          [v29 setIgnoreRestrictionsPredicates:1];
          [v29 setShouldIncludeNonLibraryEntities:1];
          v30 = +[NSNumber numberWithUnsignedLongLong:v28];
          v31 = +[MPMediaPropertyPredicate predicateWithValue:v30 forProperty:MPMediaItemPropertyAlbumPersistentID];
          [v29 addFilterPredicate:v31];

          v32 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanTrue forProperty:v52];
          [v29 addFilterPredicate:v32];

          v58 = v29;
          v33 = [v29 items];
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          id v34 = [v33 countByEnumeratingWithState:&v65 objects:v75 count:16];
          if (v34)
          {
            id v35 = v34;
            uint64_t v36 = *(void *)v66;
            do
            {
              for (i = 0; i != v35; i = (char *)i + 1)
              {
                if (*(void *)v66 != v36) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v38 = *(void *)(*((void *)&v65 + 1) + 8 * i);
                id v39 = objc_alloc((Class)MPMediaItemCollection);
                uint64_t v74 = v38;
                v40 = +[NSArray arrayWithObjects:&v74 count:1];
                id v41 = [v39 initWithItems:v40];

                v42 = +[MusicUsageItem usageItemWithItemCollection:v41 displayNameBlock:&stru_104C0];
                [(MusicUsageGroup *)v26 addUsageItem:v42];
              }
              id v35 = [v33 countByEnumeratingWithState:&v65 objects:v75 count:16];
            }
            while (v35);
          }
          v43 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
          v44 = [v43 localizedStringForKey:@"SONGS_HEADER" value:&stru_108A0 table:@"MusicUsage"];
          [(MusicUsageGroup *)v26 setGroupName:v44];

          [(MusicUsageGroup *)v26 setGroupSpecifierIdentifier:@"songs"];
          id v6 = v54;
          v45 = [v54 categoryIdentifier];
          [(MusicUsageGroup *)v26 setCategoryIdentifier:v45];

          [(MusicUsageGroup *)v26 setShowsItemArtwork:0];
          [(MusicUsageGroup *)v26 updateGroupSize];
          [v60 setChildUsageGroup:v26];
          [v55 addObject:v64];

          uint64_t v11 = v63 + 1;
        }
        while ((id)(v63 + 1) != v56);
        id v56 = [obj countByEnumeratingWithState:&v69 objects:v76 count:16];
      }
      while (v56);
    }

    id v4 = v47;
  }

  return v55;
}

- (void).cxx_destruct
{
}

@end