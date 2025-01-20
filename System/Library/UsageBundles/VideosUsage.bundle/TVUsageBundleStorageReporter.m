@interface TVUsageBundleStorageReporter
- (BOOL)allowDeletionForCategory:(id)a3;
- (Class)usageDetailControllerClassForUsageBundleApp:(id)a3;
- (TVUsageBundleStorageReporter)init;
- (float)sizeForCategory:(id)a3;
- (id)dataSourceForCategory:(id)a3 indexPath:(id)a4;
- (id)usageBundleApps;
- (unint64_t)_sizeForCategoryIdentifier:(id)a3;
- (unint64_t)_totalSizeForAllDownloads;
- (unint64_t)totalSize;
- (void)dealloc;
- (void)usageBundleApp:(id)a3 willDisplaySpecifier:(id *)a4;
@end

@implementation TVUsageBundleStorageReporter

- (TVUsageBundleStorageReporter)init
{
  v13.receiver = self;
  v13.super_class = (Class)TVUsageBundleStorageReporter;
  v2 = [(TVUsageBundleStorageReporter *)&v13 init];
  if (v2)
  {
    +[MPMediaQuery setFilteringDisabled:1];
    v3 = +[MPMediaLibrary deviceMediaLibrary];
    v4 = [v3 libraryDataProvider];
    +[MPMediaLibrary reloadDynamicPropertiesForLibraryDataProvider:v4];

    v2->_shouldShowVideosiTunesU = PSIsBundleIDInstalled() ^ 1;
    v2->_preferencesNotifyToken = -1;
    objc_initWeak(&location, v2);
    id v5 = &_dispatch_main_q;
    v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    v9 = sub_2AD4;
    v10 = &unk_C430;
    objc_copyWeak(&v11, &location);
    LODWORD(v3) = notify_register_dispatch("com.apple.mobileipod.librarychanged", &v2->_preferencesNotifyToken, (dispatch_queue_t)&_dispatch_main_q, &v7);

    if (v3) {
      NSLog(@"Unable to register for library change notifications", v7, v8, v9, v10);
    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_preferencesNotifyToken)) {
    notify_cancel(self->_preferencesNotifyToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)TVUsageBundleStorageReporter;
  [(TVUsageBundleStorageReporter *)&v3 dealloc];
}

- (id)usageBundleApps
{
  *(float *)&double v3 = (float)[(TVUsageBundleStorageReporter *)self _totalSizeForAllDownloads];
  v4 = +[PSUsageBundleApp usageBundleAppForBundleWithIdentifier:@"com.apple.VideosUsage" withTotalSize:v3];
  id v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_usageBundleApp, v4);
  objc_sync_exit(v5);

  LODWORD(v5) = WLKIsRegulatedSKU();
  v6 = +[NSBundle bundleWithIdentifier:@"com.apple.VideosUsage"];
  v7 = v6;
  if (v5) {
    CFStringRef v8 = @"BUNDLE_NAME_VIDEOS";
  }
  else {
    CFStringRef v8 = @"BUNDLE_NAME_TV";
  }
  v9 = [v6 localizedStringForKey:v8 value:&stru_C6C8 table:@"VideosUsage"];
  [v4 setName:v9];

  v24 = +[NSBundle bundleWithIdentifier:@"com.apple.VideosUsage"];
  v23 = [v24 localizedStringForKey:@"MOVIES" value:&stru_C6C8 table:@"VideosUsage"];
  v22 = +[PSUsageBundleCategory categoryNamed:v23 withIdentifier:@"CATEGORY_MOVIES" forUsageBundleApp:v4];
  v26[0] = v22;
  v21 = +[NSBundle bundleWithIdentifier:@"com.apple.VideosUsage"];
  v10 = [v21 localizedStringForKey:@"TV_SHOWS" value:&stru_C6C8 table:@"VideosUsage"];
  id v11 = +[PSUsageBundleCategory categoryNamed:v10 withIdentifier:@"CATEGORY_TV_SHOWS" forUsageBundleApp:v4];
  v26[1] = v11;
  v12 = +[NSBundle bundleWithIdentifier:@"com.apple.VideosUsage"];
  objc_super v13 = [v12 localizedStringForKey:@"HOME_VIDEOS" value:&stru_C6C8 table:@"VideosUsage"];
  v14 = +[PSUsageBundleCategory categoryNamed:v13 withIdentifier:@"CATEGORY_HOME_VIDEOS" forUsageBundleApp:v4];
  v26[2] = v14;
  v15 = +[NSBundle bundleWithIdentifier:@"com.apple.VideosUsage"];
  v16 = [v15 localizedStringForKey:@"ITUNESU_VIDEOS" value:&stru_C6C8 table:@"VideosUsage"];
  v17 = +[PSUsageBundleCategory categoryNamed:v16 withIdentifier:@"CATEGORY_ITUNESU_VIDEOS" forUsageBundleApp:v4];
  v26[3] = v17;
  v18 = +[NSArray arrayWithObjects:v26 count:4];

  [v4 setCategories:v18];
  v25 = v4;
  v19 = +[NSArray arrayWithObjects:&v25 count:1];

  return v19;
}

- (BOOL)allowDeletionForCategory:(id)a3
{
  return 1;
}

- (Class)usageDetailControllerClassForUsageBundleApp:(id)a3
{
  return (Class)objc_opt_class();
}

- (float)sizeForCategory:(id)a3
{
  v4 = [a3 identifier];
  float v5 = (float)[(TVUsageBundleStorageReporter *)self _sizeForCategoryIdentifier:v4];

  return v5;
}

- (void)usageBundleApp:(id)a3 willDisplaySpecifier:(id *)a4
{
  float v5 = [a3 bundleIdentifier];
  unsigned int v6 = [v5 isEqualToString:@"com.apple.VideosUsage"];

  if (v6)
  {
    id v7 = *a4;
    uint64_t v8 = PSLazyIconLoading;
    id v10 = v7;
    [v10 setProperty:&__kCFBooleanTrue forKey:v8];
    if (WLKIsRegulatedSKU()) {
      CFStringRef v9 = @"com.apple.videos";
    }
    else {
      CFStringRef v9 = @"com.apple.tv";
    }
    [v10 setProperty:v9 forKey:PSLazyIconAppID];
  }
}

- (id)dataSourceForCategory:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = MPMediaItemPropertyTitle;
  uint64_t v8 = (char *)[v6 length];
  CFStringRef v9 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanTrue forProperty:MPMediaItemPropertyHasNonPurgeableAsset];
  if ([v5 isEqualToString:@"CATEGORY_MOVIES"])
  {
    uint64_t v10 = +[MPMediaQuery moviesQuery];
LABEL_3:
    id v11 = (void *)v10;
    if ((unint64_t)v8 > 1)
    {
LABEL_4:

      v12 = 0;
      uint64_t v13 = 0;
      id v11 = 0;
LABEL_31:
      char v32 = 1;
      goto LABEL_32;
    }
    v12 = 0;
    v24 = 0;
    uint64_t v13 = 0;
    goto LABEL_26;
  }
  if ([v5 isEqualToString:@"CATEGORY_TV_SHOWS"])
  {
    id v11 = +[MPMediaQuery tvShowsQuery];
    [v11 setGroupingType:8];
    v14 = (NSString *)MPMediaItemPropertySeriesName;

    if ((unint64_t)v8 < 2)
    {
      v24 = 0;
      v12 = 0;
      v19 = 0;
      uint64_t v13 = 1;
    }
    else
    {
      [v11 addFilterPredicate:v9];
      uint64_t v13 = 1;
      [v11 setIgnoreRestrictionsPredicates:1];
      id v15 = [v6 indexAtPosition:1];
      v16 = [v11 collections];
      [v16 objectAtIndex:v15];
      v17 = v35 = v9;
      v18 = [v17 representativeItem];

      v19 = v18;
      v20 = [v18 objectForKeyedSubscript:MPMediaItemPropertyArtistPersistentID];
      v21 = +[MPMediaPropertyPredicate predicateWithValue:v20 forProperty:MPMediaItemPropertyArtistPersistentID];

      id v22 = [v11 copy];
      [v22 addFilterPredicate:v21];
      [v22 setGroupingType:9];
      v23 = (NSString *)MPMediaItemPropertySeasonName;

      if (v8 == (unsigned char *)&dword_0 + 2)
      {
        v24 = 0;
        v14 = v23;
        id v11 = v22;
        v12 = &stru_C4D8;
        CFStringRef v9 = v35;
      }
      else
      {
        [v22 addFilterPredicate:v35];
        [v22 collections];
        v30 = v14 = v23;
        v31 = objc_msgSend(v30, "objectAtIndex:", objc_msgSend(v6, "indexAtPosition:", 2));
        id v11 = [v31 itemsQuery];

        [v11 addFilterPredicate:v35];
        CFStringRef v9 = v35;
        if ((unint64_t)v8 < 4)
        {
          uint64_t v13 = 0;
        }
        else
        {

          uint64_t v13 = 0;
          id v11 = 0;
        }
        v12 = &stru_C4F8;
        v24 = &stru_C538;
      }
    }

    goto LABEL_25;
  }
  if (![v5 isEqualToString:@"CATEGORY_ITUNESU_VIDEOS"])
  {
    if (![v5 isEqualToString:@"CATEGORY_HOME_VIDEOS"])
    {
      v12 = 0;
      id v11 = 0;
      uint64_t v13 = 1;
      goto LABEL_31;
    }
    uint64_t v10 = +[MPMediaQuery homeVideosQuery];
    goto LABEL_3;
  }
  id v11 = +[MPMediaQuery ITunesUQuery];
  [v11 addFilterPredicate:v9];
  uint64_t v13 = 1;
  [v11 setGroupingType:1];
  v14 = MPMediaItemPropertyAlbumTitle;

  if ((unint64_t)v8 < 2)
  {
    v12 = 0;
    v24 = 0;
LABEL_25:
    id v7 = v14;
    goto LABEL_26;
  }
  v25 = v9;
  v26 = [v11 collections];
  v27 = objc_msgSend(v26, "objectAtIndex:", objc_msgSend(v6, "indexAtPosition:", 1));
  uint64_t v28 = [v27 itemsQuery];

  v29 = v7;
  if (v8 != (unsigned char *)&dword_0 + 2)
  {
    id v11 = (void *)v28;
    CFStringRef v9 = v25;
    goto LABEL_4;
  }
  v12 = 0;
  v24 = 0;
  uint64_t v13 = 0;
  id v7 = v29;
  id v11 = (void *)v28;
  CFStringRef v9 = v25;
LABEL_26:
  if (!v11)
  {
    if (v24)
    {
      v33 = 0;
      goto LABEL_35;
    }
    goto LABEL_31;
  }
  [v11 setIgnoreSystemFilterPredicates:1];
  [v11 setIgnoreRestrictionsPredicates:1];
  [v11 addFilterPredicate:v9];
  if (v24) {
    goto LABEL_34;
  }
  char v32 = 0;
LABEL_32:
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_3B50;
  v36[3] = &unk_C458;
  v37 = v7;
  v38 = "artworkCatalog";
  id v7 = v37;
  v24 = objc_retainBlock(v36);

  if (v32)
  {
    v33 = 0;
    goto LABEL_35;
  }
LABEL_34:
  v33 = [[TVUsageDataSource alloc] initWithQuery:v11 entityType:v13 categoryIdentifier:v5 usageItemBlock:v24 usageHeaderBlock:v12];
LABEL_35:

  return v33;
}

- (unint64_t)totalSize
{
  v15[0] = @"CATEGORY_MOVIES";
  v15[1] = @"CATEGORY_TV_SHOWS";
  v15[2] = @"CATEGORY_ITUNESU_VIDEOS";
  v15[3] = @"CATEGORY_HOME_VIDEOS";
  +[NSArray arrayWithObjects:v15 count:4];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += -[TVUsageBundleStorageReporter _sizeForCategoryIdentifier:](self, "_sizeForCategoryIdentifier:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)_sizeForCategoryIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"CATEGORY_MOVIES"])
  {
    id v5 = +[MPMediaQuery moviesQuery];
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"CATEGORY_TV_SHOWS"])
  {
    id v5 = +[MPMediaQuery tvShowsQuery];
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"CATEGORY_ITUNESU_VIDEOS"])
  {
    if (self->_shouldShowVideosiTunesU)
    {
      id v5 = +[MPMediaQuery videoITunesUQuery];
      goto LABEL_10;
    }
LABEL_12:
    id v9 = 0;
    goto LABEL_13;
  }
  if (![v4 isEqualToString:@"CATEGORY_HOME_VIDEOS"]) {
    goto LABEL_12;
  }
  id v5 = +[MPMediaQuery homeVideosQuery];
LABEL_10:
  unint64_t v6 = v5;
  if (!v5) {
    goto LABEL_12;
  }
  [v5 setIgnoreSystemFilterPredicates:1];
  [v6 setIgnoreRestrictionsPredicates:1];
  uint64_t v7 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanTrue forProperty:MPMediaItemPropertyHasNonPurgeableAsset];
  [v6 addFilterPredicate:v7];
  uint64_t v8 = [v6 valueForAggregateFunction:MPMediaQueryAggregateFunctionTotal onItemsForProperty:MPMediaItemPropertyFileSize];
  id v9 = [v8 unsignedLongLongValue];

LABEL_13:
  return (unint64_t)v9;
}

- (unint64_t)_totalSizeForAllDownloads
{
  v2 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanTrue forProperty:MPMediaItemPropertyHasNonPurgeableAsset];
  uint64_t v3 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanFalse forProperty:MPMediaItemPropertyIsMusicShow];
  id v4 = +[MPMediaQuery moviesQuery];
  [v4 setIgnoreSystemFilterPredicates:1];
  [v4 setIgnoreRestrictionsPredicates:1];
  id v5 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanFalse forProperty:MPMediaItemPropertyIsITunesU];
  [v4 addFilterPredicate:v5];

  [v4 addFilterPredicate:v2];
  [v4 addFilterPredicate:v3];
  [v4 setGroupingType:0];
  uint64_t v6 = MPMediaQueryAggregateFunctionTotal;
  uint64_t v7 = MPMediaItemPropertyFileSize;
  v18 = [v4 valueForAggregateFunction:MPMediaQueryAggregateFunctionTotal onItemsForProperty:MPMediaItemPropertyFileSize];
  uint64_t v8 = (char *)[v18 unsignedLongLongValue];
  id v9 = +[MPMediaQuery tvShowsQuery];
  [v9 setIgnoreSystemFilterPredicates:1];
  [v9 setIgnoreRestrictionsPredicates:1];
  [v9 addFilterPredicate:v2];
  v19 = (void *)v3;
  [v9 addFilterPredicate:v3];
  [v9 setGroupingType:8];
  long long v10 = [v9 valueForAggregateFunction:v6 onItemsForProperty:v7];
  long long v11 = &v8[(void)[v10 unsignedLongLongValue]];
  long long v12 = +[MPMediaQuery homeVideosQuery];
  [v12 setIgnoreSystemFilterPredicates:1];
  [v12 setIgnoreRestrictionsPredicates:1];
  [v12 addFilterPredicate:v2];
  [v12 setGroupingType:0];
  long long v13 = [v12 valueForAggregateFunction:v6 onItemsForProperty:v7];
  v14 = (char *)[v13 unsignedLongLongValue] + (void)v11;
  if ((PSIsBundleIDInstalled() & 1) == 0)
  {
    id v15 = +[MPMediaQuery videoITunesUQuery];
    [v15 setIgnoreSystemFilterPredicates:1];
    [v15 setIgnoreRestrictionsPredicates:1];
    [v15 addFilterPredicate:v2];
    [v15 setGroupingType:1];
    v16 = [v15 valueForAggregateFunction:v6 onItemsForProperty:v7];
    v14 = &v14[(void)[v16 unsignedLongLongValue]];
  }
  return (unint64_t)v14;
}

- (void).cxx_destruct
{
}

@end