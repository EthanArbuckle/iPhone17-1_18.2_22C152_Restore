@interface MTPodcast(DB_App)
+ (id)allPossibleEpisodeListSortOrderProperties;
+ (id)podcastUuidForFeedUrl:()DB_App ctx:;
+ (id)podcastUuidForFeedUrlString:()DB_App ctx:;
+ (id)sortDescriptorsForNewestOnTop;
+ (id)sortDescriptorsForOldestOnTop;
- (BOOL)hasMultipleSeasons;
- (id)_fetchRequestForDistinctSeasons;
- (id)bestDescription;
- (id)seasonNumbers;
- (id)seasonTrailerInSeason:()DB_App;
- (id)smartPlayEpisode;
- (id)sortDescriptorsForPlayOrder;
- (id)sortDescriptorsForSortOrder;
- (uint64_t)applyShowTypeSetting:()DB_App;
- (uint64_t)hasAtLeastOneSeason;
- (uint64_t)isValidShowTypeSetting:()DB_App;
- (uint64_t)seasonSortDescriptorsForSortOrder;
- (uint64_t)setDeletePlayedEpisodes:()DB_App;
- (uint64_t)setFeedChangedDate:()DB_App;
- (uint64_t)setLastImplicitlyFollowedDate:()DB_App;
- (uint64_t)setModifiedDate:()DB_App;
- (uint64_t)setUpdateAvg:()DB_App;
- (uint64_t)setUpdateStdDev:()DB_App;
- (uint64_t)sortDescriptorsForPlayOrderByEpisodeNumber;
- (uint64_t)sortDescriptorsForPlayOrderByPubDate;
- (uint64_t)updateCursorPosition:()DB_App;
- (unint64_t)sortAscending;
- (void)markPlaylistsForUpdate;
- (void)setAuthor:()DB_App;
- (void)setImageURL:()DB_App;
- (void)setItemDescription:()DB_App;
- (void)setPlaybackNewestToOldest:()DB_App;
- (void)setShowTypeInFeed:()DB_App;
- (void)setShowTypeSetting:()DB_App;
- (void)setSortAscending:()DB_App;
- (void)setWebpageURL:()DB_App;
@end

@implementation MTPodcast(DB_App)

- (void)markPlaylistsForUpdate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(a1, "playlistSettings", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        [v6 setNeedsUpdate:1];
        v7 = [v6 playlist];
        [v7 setNeedsUpdate:1];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (uint64_t)setDeletePlayedEpisodes:()DB_App
{
  uint64_t v5 = *MEMORY[0x263F5EC68];
  [a1 willChangeValueForKey:*MEMORY[0x263F5EC68]];
  v6 = [NSNumber numberWithLongLong:a3];
  [a1 setPrimitiveValue:v6 forKey:v5];

  [a1 didChangeValueForKey:v5];
  return [a1 markPlaylistsForUpdate];
}

- (uint64_t)setLastImplicitlyFollowedDate:()DB_App
{
  uint64_t result = [a1 lastImplicitlyFollowedDate];
  if (v5 < a2)
  {
    uint64_t v6 = *MEMORY[0x263F5ECC0];
    [a1 willChangeValueForKey:*MEMORY[0x263F5ECC0]];
    v7 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:a2];
    [a1 setPrimitiveValue:v7 forKey:v6];

    return [a1 didChangeValueForKey:v6];
  }
  return result;
}

- (uint64_t)setModifiedDate:()DB_App
{
  uint64_t v4 = [MEMORY[0x263F5EA40] lenientSharedInstance];
  [v4 timestampBoundByNow:a2];
  double v6 = v5;

  uint64_t v7 = *MEMORY[0x263F5ECD0];
  [a1 willChangeValueForKey:*MEMORY[0x263F5ECD0]];
  long long v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v6];
  [a1 setPrimitiveValue:v8 forKey:v7];

  return [a1 didChangeValueForKey:v7];
}

- (void)setAuthor:()DB_App
{
  unint64_t v9 = a3;
  uint64_t v4 = [a1 author];
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    double v6 = [a1 author];
    char v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = *MEMORY[0x263F5EC50];
      [a1 willChangeValueForKey:*MEMORY[0x263F5EC50]];
      [a1 setPrimitiveValue:v9 forKey:v8];
      [a1 didChangeValueForKey:v8];
    }
  }
}

- (void)setItemDescription:()DB_App
{
  unint64_t v9 = a3;
  uint64_t v4 = [a1 itemDescription];
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    double v6 = [a1 itemDescription];
    char v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = *MEMORY[0x263F5EC70];
      [a1 willChangeValueForKey:*MEMORY[0x263F5EC70]];
      [a1 setPrimitiveValue:v9 forKey:v8];
      [a1 didChangeValueForKey:v8];
    }
  }
}

- (uint64_t)setFeedChangedDate:()DB_App
{
  uint64_t result = [a1 feedChangedDate];
  if (vabdd_f64(v5, a2) > 2.22044605e-16)
  {
    uint64_t v6 = *MEMORY[0x263F5EC90];
    [a1 willChangeValueForKey:*MEMORY[0x263F5EC90]];
    char v7 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:a2];
    [a1 setPrimitiveValue:v7 forKey:v6];

    return [a1 didChangeValueForKey:v6];
  }
  return result;
}

- (uint64_t)setUpdateStdDev:()DB_App
{
  uint64_t result = [a1 updateStdDev];
  if (vabdd_f64(v5, a2) > 2.22044605e-16)
  {
    uint64_t v6 = *MEMORY[0x263F5ED20];
    [a1 willChangeValueForKey:*MEMORY[0x263F5ED20]];
    char v7 = [NSNumber numberWithDouble:a2];
    [a1 setPrimitiveValue:v7 forKey:v6];

    return [a1 didChangeValueForKey:v6];
  }
  return result;
}

- (uint64_t)setUpdateAvg:()DB_App
{
  uint64_t result = [a1 updateAvg];
  if (vabdd_f64(v5, a2) > 2.22044605e-16)
  {
    uint64_t v6 = *MEMORY[0x263F5ED18];
    [a1 willChangeValueForKey:*MEMORY[0x263F5ED18]];
    char v7 = [NSNumber numberWithDouble:a2];
    [a1 setPrimitiveValue:v7 forKey:v6];

    return [a1 didChangeValueForKey:v6];
  }
  return result;
}

- (void)setImageURL:()DB_App
{
  unint64_t v9 = a3;
  uint64_t v4 = [a1 imageURL];
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    uint64_t v6 = [a1 imageURL];
    char v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = *MEMORY[0x263F5ECB0];
      [a1 willChangeValueForKey:*MEMORY[0x263F5ECB0]];
      [a1 setPrimitiveValue:v9 forKey:v8];
      [a1 didChangeValueForKey:v8];
    }
  }
}

- (void)setShowTypeInFeed:()DB_App
{
  unint64_t v9 = a3;
  uint64_t v4 = [a1 showTypeInFeed];
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    uint64_t v6 = [a1 showTypeInFeed];
    char v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = *MEMORY[0x263F5ECE8];
      [a1 willChangeValueForKey:*MEMORY[0x263F5ECE8]];
      [a1 setPrimitiveValue:v9 forKey:v8];
      [a1 didChangeValueForKey:v8];
    }
  }
}

- (void)setWebpageURL:()DB_App
{
  unint64_t v9 = a3;
  uint64_t v4 = [a1 webpageURL];
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    uint64_t v6 = [a1 webpageURL];
    char v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = *MEMORY[0x263F5ED40];
      [a1 willChangeValueForKey:*MEMORY[0x263F5ED40]];
      [a1 setPrimitiveValue:v9 forKey:v8];
      [a1 didChangeValueForKey:v8];
    }
  }
}

- (uint64_t)isValidShowTypeSetting:()DB_App
{
  return (a3 < 5) & (0x16u >> a3);
}

- (void)setShowTypeSetting:()DB_App
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([a1 showTypeSetting] != a3)
  {
    char v5 = [a1 isValidShowTypeSetting:a3];
    uint64_t v6 = _MTLogCategoryDatabase();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        uint64_t v8 = [a1 title];
        unint64_t v9 = [a1 feedURL];
        uint64_t v10 = [a1 storeCollectionId];
        long long v11 = [a1 uuid];
        int v14 = 134350083;
        uint64_t v15 = a3;
        __int16 v16 = 2113;
        v17 = v8;
        __int16 v18 = 2113;
        v19 = v9;
        __int16 v20 = 2049;
        uint64_t v21 = v10;
        __int16 v22 = 2114;
        v23 = v11;
        _os_log_impl(&dword_23F08F000, v6, OS_LOG_TYPE_DEFAULT, "Switching show type setting to %{public}lld, show \"%{private}@\", %{private}@, %{private}lld, %{public}@", (uint8_t *)&v14, 0x34u);
      }
      uint64_t v12 = *MEMORY[0x263F5ECF0];
      [a1 willChangeValueForKey:*MEMORY[0x263F5ECF0]];
      uint64_t v13 = [NSNumber numberWithLongLong:a3];
      [a1 setPrimitiveValue:v13 forKey:v12];

      [a1 didChangeValueForKey:v12];
      [a1 applyShowTypeSetting:a3];
    }
    else
    {
      if (v7)
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_23F08F000, v6, OS_LOG_TYPE_DEFAULT, "WARNING: Ignoring attempt to set an invalid show type", (uint8_t *)&v14, 2u);
      }
    }
  }
}

- (uint64_t)applyShowTypeSetting:()DB_App
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263F5EA08], "sortOrderAscForShowType:");
  int v3 = v2;
  [a1 setSortAscending:v2];
  return [a1 setPlaybackNewestToOldest:v3 ^ 1u];
}

- (void)setSortAscending:()DB_App
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  char v5 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3) {
      uint64_t v6 = @"true";
    }
    else {
      uint64_t v6 = @"false";
    }
    BOOL v7 = [a1 title];
    uint64_t v8 = [a1 feedURL];
    uint64_t v9 = [a1 storeCollectionId];
    uint64_t v10 = [a1 uuid];
    int v14 = 138544387;
    uint64_t v15 = v6;
    __int16 v16 = 2113;
    v17 = v7;
    __int16 v18 = 2113;
    v19 = v8;
    __int16 v20 = 2049;
    uint64_t v21 = v9;
    __int16 v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_23F08F000, v5, OS_LOG_TYPE_DEFAULT, "Switching SortAscendingFlag to %{public}@, show \"%{private}@\", %{private}@, %{private}lld, %{public}@", (uint8_t *)&v14, 0x34u);
  }
  uint64_t v11 = [a1 flags];
  if (((((v11 & 2) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v12 = 2;
    if (!a3) {
      uint64_t v12 = 0;
    }
    [a1 setFlags:v11 & 0xFFFFFFFFFFFFFFFDLL | v12];
    [a1 markPlaylistsForUpdate];
    uint64_t v13 = [MEMORY[0x263F5EA48] shared];
    objc_msgSend(v13, "markSubscriptionSyncDirty:for:", 1, objc_msgSend(a1, "syncType"));
  }
}

- (unint64_t)sortAscending
{
  return ((unint64_t)[a1 flags] >> 1) & 1;
}

+ (id)allPossibleEpisodeListSortOrderProperties
{
  v22[4] = *MEMORY[0x263EF8340];
  id v18 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v20 = *MEMORY[0x263F5EB48];
  v0 = objc_msgSend(MEMORY[0x263F08B30], "sortDescriptorWithKey:ascending:");
  v22[0] = v0;
  uint64_t v1 = *MEMORY[0x263F5EAC0];
  uint64_t v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EAC0] ascending:1];
  v22[1] = v2;
  uint64_t v3 = *MEMORY[0x263F5EB00];
  uint64_t v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB00] ascending:0];
  v22[2] = v4;
  uint64_t v5 = *MEMORY[0x263F5EB60];
  uint64_t v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB60] ascending:1 selector:sel_localizedStandardCompare_];
  v22[3] = v6;
  BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v19 = (void *)[v18 initWithArray:v7];

  uint64_t v8 = [MEMORY[0x263F08B30] sortDescriptorWithKey:v20 ascending:0];
  v21[0] = v8;
  uint64_t v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:v1 ascending:0];
  v21[1] = v9;
  uint64_t v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:v3 ascending:1];
  v21[2] = v10;
  uint64_t v11 = [MEMORY[0x263F08B30] sortDescriptorWithKey:v5 ascending:1 selector:sel_localizedStandardCompare_];
  v21[3] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
  [v19 addObjectsFromArray:v12];

  uint64_t v13 = (void *)MEMORY[0x263EFFA08];
  int v14 = objc_msgSend(v19, "mt_compactMap:", &__block_literal_global_4);
  uint64_t v15 = [v13 setWithArray:v14];
  __int16 v16 = [v15 allObjects];

  return v16;
}

- (id)sortDescriptorsForSortOrder
{
  v15[4] = *MEMORY[0x263EF8340];
  if ([a1 isSerialShowTypeInFeed])
  {
    uint64_t v2 = [a1 seasonSortDescriptorsForSortOrder];
  }
  else
  {
    char v3 = [a1 sortAscending];
    id v4 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v5 = *MEMORY[0x263F5EB48];
    if (v3)
    {
      uint64_t v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:v5 ascending:1];
      v15[0] = v6;
      BOOL v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EAC0] ascending:1];
      v15[1] = v7;
      uint64_t v8 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB00] ascending:0];
      v15[2] = v8;
      uint64_t v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB60] ascending:1 selector:sel_localizedStandardCompare_];
      v15[3] = v9;
      uint64_t v10 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v11 = v15;
    }
    else
    {
      uint64_t v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:v5 ascending:0];
      v14[0] = v6;
      BOOL v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EAC0] ascending:0];
      v14[1] = v7;
      uint64_t v8 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB00] ascending:1];
      v14[2] = v8;
      uint64_t v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB60] ascending:1 selector:sel_localizedStandardCompare_];
      v14[3] = v9;
      uint64_t v10 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v11 = v14;
    }
    uint64_t v12 = [v10 arrayWithObjects:v11 count:4];
    uint64_t v2 = (void *)[v4 initWithArray:v12];
  }
  return v2;
}

- (uint64_t)seasonSortDescriptorsForSortOrder
{
  uint64_t v1 = (void *)MEMORY[0x263F5E9E0];
  uint64_t v2 = [a1 showTypeSetting];
  return [v1 seasonSortDescriptors:v2];
}

+ (id)sortDescriptorsForOldestOnTop
{
  v6[4] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB48] ascending:1];
  v6[0] = v0;
  uint64_t v1 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EAC0] ascending:1];
  v6[1] = v1;
  uint64_t v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB00] ascending:0];
  v6[2] = v2;
  char v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB60] ascending:1 selector:sel_localizedStandardCompare_];
  v6[3] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];

  return v4;
}

+ (id)sortDescriptorsForNewestOnTop
{
  v6[4] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB48] ascending:0];
  v6[0] = v0;
  uint64_t v1 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EAC0] ascending:0];
  v6[1] = v1;
  uint64_t v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB00] ascending:1];
  v6[2] = v2;
  char v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB60] ascending:1 selector:sel_localizedStandardCompare_];
  v6[3] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];

  return v4;
}

- (id)sortDescriptorsForPlayOrder
{
  if ([a1 isSerialShowTypeInFeed]) {
    [a1 sortDescriptorsForPlayOrderByEpisodeNumber];
  }
  else {
  uint64_t v2 = [a1 sortDescriptorsForPlayOrderByPubDate];
  }
  return v2;
}

- (uint64_t)sortDescriptorsForPlayOrderByPubDate
{
  uint64_t v1 = [a1 playbackNewestToOldest];
  uint64_t v2 = objc_opt_class();
  return [v2 sortDescriptorsForNewestToOldest:v1];
}

- (uint64_t)sortDescriptorsForPlayOrderByEpisodeNumber
{
  uint64_t v1 = (void *)MEMORY[0x263F5E9E0];
  uint64_t v2 = [a1 showTypeSetting];
  return [v1 seasonSortDescriptors:v2];
}

- (void)setPlaybackNewestToOldest:()DB_App
{
  int v5 = [a1 playbackNewestToOldest];
  uint64_t v6 = [a1 flags];
  if (((((v6 & 8) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v7 = 8;
    if (!a3) {
      uint64_t v7 = 0;
    }
    [a1 setFlags:v6 & 0xFFFFFFFFFFFFFFF7 | v7];
    [a1 markPlaylistsForUpdate];
    uint64_t v8 = [MEMORY[0x263F5EA48] shared];
    objc_msgSend(v8, "markSubscriptionSyncDirty:for:", 1, objc_msgSend(a1, "syncType"));

    if (v5 != a3)
    {
      [a1 updateCursorPosition:0];
    }
  }
}

- (uint64_t)updateCursorPosition:()DB_App
{
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  int v5 = [a1 managedObjectContext];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__MTPodcast_DB_App__updateCursorPosition___block_invoke;
  v9[3] = &unk_265055BB0;
  v9[4] = a1;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = &v13;
  char v12 = a3;
  [v6 performBlockAndWait:v9];
  uint64_t v7 = *((unsigned __int8 *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (id)podcastUuidForFeedUrlString:()DB_App ctx:
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    uint64_t v13 = 0;
    int v14 = &v13;
    uint64_t v15 = 0x3032000000;
    char v16 = __Block_byref_object_copy__3;
    v17 = __Block_byref_object_dispose__3;
    id v18 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__MTPodcast_DB_App__podcastUuidForFeedUrlString_ctx___block_invoke;
    v9[3] = &unk_265055788;
    id v10 = v6;
    id v11 = v5;
    char v12 = &v13;
    [v10 performBlockAndWait:v9];
    id v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)podcastUuidForFeedUrl:()DB_App ctx:
{
  id v6 = a4;
  id v7 = [a3 absoluteString];
  uint64_t v8 = [a1 podcastUuidForFeedUrlString:v7 ctx:v6];

  return v8;
}

- (id)smartPlayEpisode
{
  if (([a1 subscribed] & 1) != 0
    || ![a1 isSerialShowTypeInFeed]
    || [a1 latestSeasonNumber] < 1
    || ([a1 lastDatePlayed], v2 != 0.0)
    || (objc_msgSend(a1, "seasonTrailerInSeason:", objc_msgSend(a1, "latestSeasonNumber")),
        (char v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = [a1 nextEpisodeUuid];

    if (!v4) {
      goto LABEL_8;
    }
    id v5 = [a1 managedObjectContext];
    id v6 = [a1 nextEpisodeUuid];
    char v3 = [v5 episodeForUuid:v6];

    if (!v3)
    {
LABEL_8:
      id v7 = objc_opt_new();
      [v7 setExcludeUnentitled:1];
      char v3 = [a1 newestEpisodeWithFilter:v7];
    }
  }
  return v3;
}

- (id)_fetchRequestForDistinctSeasons
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = (void *)MEMORY[0x263F5E9E0];
  double v2 = [a1 uuid];
  char v3 = [v1 predicateForEpisodesWithSeasonNumbersOnPodcastUuid:v2];

  uint64_t v4 = *MEMORY[0x263F5EB50];
  id v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB50] ascending:1];
  id v6 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:*MEMORY[0x263F5EBA0]];
  [v6 setResultType:2];
  v11[0] = v4;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  [v6 setPropertiesToFetch:v7];

  [v6 setReturnsDistinctResults:1];
  [v6 setPredicate:v3];
  id v10 = v5;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  [v6 setSortDescriptors:v8];

  return v6;
}

- (uint64_t)hasAtLeastOneSeason
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  double v2 = [a1 managedObjectContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__MTPodcast_DB_App__hasAtLeastOneSeason__block_invoke;
  v6[3] = &unk_265055BD8;
  v6[4] = a1;
  uint64_t v8 = &v9;
  id v3 = v2;
  id v7 = v3;
  [v3 performBlockAndWait:v6];
  uint64_t v4 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (BOOL)hasMultipleSeasons
{
  uint64_t v1 = [a1 seasonNumbers];
  BOOL v2 = (unint64_t)[v1 count] > 1;

  return v2;
}

- (id)seasonNumbers
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  char v12 = __Block_byref_object_copy__3;
  uint64_t v13 = __Block_byref_object_dispose__3;
  id v14 = [MEMORY[0x263EFF8C0] array];
  BOOL v2 = [a1 managedObjectContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__MTPodcast_DB_App__seasonNumbers__block_invoke;
  v6[3] = &unk_265055788;
  v6[4] = a1;
  id v3 = v2;
  id v7 = v3;
  uint64_t v8 = &v9;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)seasonTrailerInSeason:()DB_App
{
  id v5 = objc_opt_new();
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__3;
  __int16 v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  id v6 = [a1 managedObjectContext];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __43__MTPodcast_DB_App__seasonTrailerInSeason___block_invoke;
  v12[3] = &unk_265055C00;
  id v7 = v5;
  id v13 = v7;
  id v14 = a1;
  char v16 = &v18;
  uint64_t v17 = a3;
  id v8 = v6;
  id v15 = v8;
  [v8 performBlockAndWait:v12];
  uint64_t v9 = (void *)v19[5];
  if (v9)
  {
    id v10 = [v9 firstObject];
  }
  else
  {
    id v10 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (id)bestDescription
{
  uint64_t v1 = [a1 itemDescription];
  if ([v1 hasHTML])
  {
    uint64_t v2 = [v1 stringBySmartlyStrippingHTML];

    uint64_t v1 = (void *)v2;
  }
  return v1;
}

@end