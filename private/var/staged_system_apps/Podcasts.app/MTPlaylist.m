@interface MTPlaylist
+ (id)artworkForStationUUID:(id)a3 podcastsUUIDs:(id)a4 size:(CGSize)a5;
+ (id)containerOrderOptionArray:(BOOL)a3;
+ (id)containerOrderOptionValues;
+ (id)insertNewPlaylistInManagedObjectContext:(id)a3;
+ (id)insertNewPlaylistInManagedObjectContext:(id)a3 uuid:(id)a4 defaultSettings:(id)a5;
+ (id)predicateForFlag:(int)a3 isTrue:(BOOL)a4;
+ (id)predicateForMediaLibraryId:(int64_t)a3;
+ (id)predicateForVisiblePlaylistWithUUID:(id)a3;
+ (id)stringForContainerOrder:(int)a3 short:(BOOL)a4;
+ (id)topLevelPlaylistsExcludingFoldersPredicate;
+ (int64_t)getITunesPlaylistsCount;
- (BOOL)hasBeenSynced;
- (BOOL)includesAllPodcasts;
- (BOOL)isBuiltIn;
- (BOOL)isEditable;
- (BOOL)isFolder;
- (BOOL)isItunesPlaylist;
- (BOOL)isItunesSmartPlaylist;
- (BOOL)isUngroupedList;
- (BOOL)updateUnplayedCount;
- (MTEpisode)nextEpisode;
- (double)totalDuration;
- (id)artworkWithSize:(CGSize)a3;
- (id)imageWithSize:(CGSize)a3 forEpisode:(id)a4;
- (id)metricsAdditionalData;
- (id)metricsContentIdentifier;
- (id)podcasts;
- (int64_t)getFolderSubPlaylistsCount;
- (void)forceUpdate;
- (void)recalculateEpisodeCounts;
- (void)removeEpisode:(id)a3;
- (void)removeEpisode:(id)a3 inBulkTransaction:(BOOL)a4;
- (void)removeEpisodes:(id)a3;
- (void)removePodcast:(id)a3;
- (void)removePodcastEpisodes:(id)a3 shouldSave:(BOOL)a4;
- (void)setEpisodes:(id)a3;
- (void)setHasBeenSynced:(BOOL)a3;
- (void)setIncludesAllPodcasts:(BOOL)a3;
- (void)setIsBuiltIn:(BOOL)a3;
- (void)setIsFolder:(BOOL)a3;
- (void)setIsItunesPlaylist:(BOOL)a3;
- (void)setIsItunesSmartPlaylist:(BOOL)a3;
- (void)setIsUngroupedList:(BOOL)a3;
- (void)setPodcasts:(id)a3;
@end

@implementation MTPlaylist

+ (id)predicateForFlag:(int)a3 isTrue:(BOOL)a4
{
  uint64_t v4 = (1 << a3);
  if (a4) {
    CFStringRef v5 = @"%K != NULL && (%K & %d) != 0";
  }
  else {
    CFStringRef v5 = @"%K == NULL || (%K & %d) == 0";
  }
  v6 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v5, kPlaylistFlags, kPlaylistFlags, v4);

  return v6;
}

+ (id)topLevelPlaylistsExcludingFoldersPredicate
{
  v3 = [a1 topLevelPlaylistsPredicate];
  uint64_t v4 = [a1 predicateForFlag:0 isTrue:0];
  CFStringRef v5 = [v3 AND:v4];

  return v5;
}

- (BOOL)includesAllPodcasts
{
  return ((unint64_t)[(MTPlaylist *)self flags] >> 4) & 1;
}

- (BOOL)isUngroupedList
{
  return ((unint64_t)[(MTPlaylist *)self flags] >> 8) & 1;
}

- (BOOL)isItunesPlaylist
{
  return ((unint64_t)[(MTPlaylist *)self flags] >> 1) & 1;
}

- (id)imageWithSize:(CGSize)a3 forEpisode:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  v7 = +[MTImageStore defaultStore];
  v8 = [v6 podcast];

  if (!v8) {
    goto LABEL_3;
  }
  v9 = [v8 uuid];
  v10 = [v7 imageForKey:v9 size:width, height];

  v11 = [v10 scaleToSize:1 addBorder:width height];

  if (!v11)
  {
LABEL_3:
    uint64_t v12 = kMTLibraryDefaultPlaylistImage;
    if ([v7 hasItemForKey:kMTLibraryDefaultPlaylistImage])
    {
      v11 = [v7 imageForKey:v12];
    }
    else
    {
      v13 = +[UIImage imageNamed:@"Stations-Placeholder"];
      v11 = [v13 scaleToSize:1 addBorder:width, height];
      v14 = +[MTImageStore defaultStore];
      [v14 addImage:v11 forKey:v12];
    }
  }
  id v15 = v11;

  return v15;
}

- (id)artworkWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100056FAC;
  v20 = sub_1000572A0;
  id v21 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_100056FAC;
  v14 = sub_1000572A0;
  id v15 = 0;
  id v6 = [(MTPlaylist *)self managedObjectContext];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000CAF18;
  v9[3] = &unk_10054E438;
  v9[4] = self;
  v9[5] = &v16;
  v9[6] = &v10;
  [v6 performBlockAndWait:v9];

  v7 = [objc_opt_class() artworkForStationUUID:v17[5] podcastsUUIDs:v11[5] size:CGSizeMake(width, height)];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

+ (id)artworkForStationUUID:(id)a3 podcastsUUIDs:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[MTImageStore defaultStore];
  v11 = [v10 imageForKey:v8];
  if (!v11)
  {
    if ([v9 count] == (id)1)
    {
      v13 = [v9 firstObject];
      v14 = [v10 imageForKey:v13 size:width, height];
      id v15 = [v14 scaleToSize:1 addBorder:width height];

      if (v15)
      {
        id v16 = v15;

        goto LABEL_30;
      }

      goto LABEL_27;
    }
    if ((unint64_t)[v9 count] < 2)
    {
LABEL_27:
      v17 = [v10 imageForKey:kMTLibraryDefaultImageKey size:width, height];
      v33 = [v17 scaleToSize:1 addBorder:width height];
      goto LABEL_28;
    }
    v17 = +[NSMutableArray arrayWithCapacity:4];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v18 = v9;
    id v19 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v36;
LABEL_9:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [v10 imageForKey:*((void *)(*((void *)&v35 + 1) + 8 * v22)) size:width, height];
        if (v23) {
          [v17 addObject:v23];
        }
        id v24 = [v17 count];

        if (v24 == (id)4) {
          break;
        }
        if (v20 == (id)++v22)
        {
          id v20 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v20) {
            goto LABEL_9;
          }
          break;
        }
      }
    }

    if ([v17 count] == (id)2)
    {
      v25 = [v17 objectAtIndexedSubscript:1];
      [v17 addObject:v25];
    }
    else if ([v17 count] != (id)3)
    {
LABEL_22:
      if ([v17 count] == (id)4)
      {
        v27 = [v17 objectAtIndexedSubscript:2];
        v28 = [v17 objectAtIndexedSubscript:3];
        v29 = [v17 objectAtIndexedSubscript:0];
        v30 = [v17 objectAtIndexedSubscript:1];
        uint64_t v31 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v27, v28, v29, v30, 0, (void)v35);

        v17 = (void *)v31;
      }
      uint64_t v32 = +[UIImage combineImages:rowCount:size:border:](UIImage, "combineImages:rowCount:size:border:", v17, 2, 1, width, height);
      if (v32)
      {
        v33 = (void *)v32;
        [v10 removeItemsWithPrefx:v8];
        [v10 addImage:v33 forKey:v8 persist:0];
LABEL_28:

        id v12 = v33;
        goto LABEL_29;
      }

      goto LABEL_27;
    }
    v26 = [v17 objectAtIndexedSubscript:0];
    [v17 addObject:v26];

    goto LABEL_22;
  }
  id v12 = v11;
LABEL_29:
  id v16 = v12;
LABEL_30:

  return v16;
}

+ (id)insertNewPlaylistInManagedObjectContext:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[MTPodcastPlaylistSettings insertNewSettingsInManagedObjectContext:v4];
  id v6 = +[NSString UUID];
  v7 = [a1 insertNewPlaylistInManagedObjectContext:v4 uuid:v6 defaultSettings:v5];

  return v7;
}

+ (id)insertNewPlaylistInManagedObjectContext:(id)a3 uuid:(id)a4 defaultSettings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[NSEntityDescription insertNewObjectForEntityForName:kMTPlaylistEntityName inManagedObjectContext:v8];
  if (!v10)
  {
    id v10 = +[MTPodcastPlaylistSettings insertNewSettingsInManagedObjectContext:v8];
  }
  [v11 setUuid:v9];
  [v11 setDefaultSettings:v10];
  [v11 setNeedsUpdate:1];
  [v11 setIsUngroupedList:1];
  uint64_t v12 = kPlaylistSortOrder;
  v13 = +[NSPredicate truePredicate];
  v14 = [a1 aggregateOperation:@"max:" attribute:v12 predicate:v13 managedObjectContext:v8];

  [v11 setSortOrder:((char *)[v14 integerValue]) + 1];
  [a1 prepareForPlatform:v11];

  return v11;
}

- (void)setPodcasts:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(MTPlaylist *)self settings];
  id v6 = [v5 valueForKey:kPlaylistSettingPodcast];

  if (([v6 isEqualToOrderedSet:v4] & 1) == 0)
  {
    id v18 = [v4 mutableCopy];
    [v18 minusOrderedSet:v6];
    id v19 = v6;
    id v7 = [v6 mutableCopy];
    id v20 = v4;
    [v7 minusOrderedSet:v4];
    id v8 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = [(MTPlaylist *)self settings];
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v15 = [v14 podcast];
          unsigned int v16 = [v7 containsObject:v15];

          if (v16) {
            [v8 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000FF560;
    v23[3] = &unk_100551728;
    v23[4] = self;
    [v8 enumerateObjectsUsingBlock:v23];
    [(MTPlaylist *)self defaultSettings];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000FF5C0;
    v21[3] = &unk_100551750;
    v21[4] = self;
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = v22;
    [v18 enumerateObjectsUsingBlock:v21];

    id v6 = v19;
    id v4 = v20;
  }
}

- (void)setEpisodes:(id)a3
{
  id v7 = a3;
  id v4 = [(MTPlaylist *)self episodes];
  unsigned __int8 v5 = [v7 isEqualToOrderedSet:v4];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = kPlaylistEpisodes;
    [(MTPlaylist *)self willChangeValueForKey:kPlaylistEpisodes];
    [(MTPlaylist *)self setPrimitiveValue:v7 forKey:v6];
    [(MTPlaylist *)self didChangeValueForKey:v6];
  }
}

- (id)podcasts
{
  v2 = [(MTPlaylist *)self settings];
  v3 = [v2 valueForKey:kPlaylistSettingPodcast];

  return v3;
}

- (void)setIsFolder:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)[(MTPlaylist *)self flags];
  if (((((v5 & 1) == 0) ^ v3) & 1) == 0)
  {
    [(MTPlaylist *)self setFlags:v5 & 0xFFFFFFFFFFFFFFFELL | v3];
  }
}

- (BOOL)isFolder
{
  return [(MTPlaylist *)self flags] & 1;
}

- (void)setIsItunesPlaylist:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)[(MTPlaylist *)self flags];
  if (((((v5 & 2) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 2;
    if (!v3) {
      uint64_t v6 = 0;
    }
    [(MTPlaylist *)self setFlags:v5 & 0xFFFFFFFFFFFFFFFDLL | v6];
  }
}

- (void)setIsBuiltIn:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)[(MTPlaylist *)self flags];
  if (((((v5 & 8) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 8;
    if (!v3) {
      uint64_t v6 = 0;
    }
    [(MTPlaylist *)self setFlags:v5 & 0xFFFFFFFFFFFFFFF7 | v6];
  }
}

- (BOOL)isBuiltIn
{
  return ((unint64_t)[(MTPlaylist *)self flags] >> 3) & 1;
}

- (void)setIncludesAllPodcasts:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)[(MTPlaylist *)self flags];
  if (((((v5 & 0x10) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 16;
    if (!v3) {
      uint64_t v6 = 0;
    }
    [(MTPlaylist *)self setFlags:v5 & 0xFFFFFFFFFFFFFFEFLL | v6];
  }
}

- (BOOL)isItunesSmartPlaylist
{
  return ((unint64_t)[(MTPlaylist *)self flags] >> 7) & 1;
}

- (void)setIsItunesSmartPlaylist:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)[(MTPlaylist *)self flags];
  if (((((v5 & 0x80) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 128;
    if (!v3) {
      uint64_t v6 = 0;
    }
    [(MTPlaylist *)self setFlags:v5 & 0xFFFFFFFFFFFFFF7FLL | v6];
  }
}

- (void)setIsUngroupedList:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)[(MTPlaylist *)self flags];
  if (((((v5 & 0x100) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 256;
    if (!v3) {
      uint64_t v6 = 0;
    }
    [(MTPlaylist *)self setFlags:v5 & 0xFFFFFFFFFFFFFEFFLL | v6];
  }
}

- (void)forceUpdate
{
}

- (BOOL)isEditable
{
  v2 = [(MTPlaylist *)self uuid];
  char v3 = [v2 isEqualToString:kPlaylistITunesPlaylistUuid] ^ 1;

  return v3;
}

- (BOOL)updateUnplayedCount
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v3 = [(MTPlaylist *)self episodes];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v6 += [v10 isPlayed] ^ 1;
        if ([v10 persistentID]) {
          ++v7;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
    id v7 = 0;
  }

  id v11 = (char *)[(MTPlaylist *)self unplayedCount];
  BOOL v12 = v11 != v6;
  if (v11 != v6) {
    [(MTPlaylist *)self setUnplayedCount:v6];
  }
  if ([(MTPlaylist *)self downloadedCount] != v7)
  {
    [(MTPlaylist *)self setDownloadedCount:v7];
    return 1;
  }
  return v12;
}

- (void)setHasBeenSynced:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)[(MTPlaylist *)self flags];
  if (((((v5 & 0x40) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 64;
    if (!v3) {
      uint64_t v6 = 0;
    }
    [(MTPlaylist *)self setFlags:v5 & 0xFFFFFFFFFFFFFFBFLL | v6];
  }
}

- (BOOL)hasBeenSynced
{
  return ((unint64_t)[(MTPlaylist *)self flags] >> 6) & 1;
}

- (void)recalculateEpisodeCounts
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(MTPlaylist *)self episodes];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v9 + 1) + 8 * i) isPlayed] ^ 1;
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  [(MTPlaylist *)self setUnplayedCount:v6];
}

- (void)removePodcast:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPlaylist *)self managedObjectContext];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10005705C;
  uint64_t v21 = sub_1000572F8;
  id v22 = 0;
  uint64_t v6 = [(MTPlaylist *)self settings];
  long long v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_1000FFFA8;
  long long v14 = &unk_10054D450;
  id v7 = v4;
  id v15 = v7;
  long long v16 = &v17;
  [v6 enumerateObjectsUsingBlock:&v11];

  if (v18[5]) {
    [v5 deleteObject:v11, v12, v13, v14];
  }
  uint64_t v8 = -[MTPlaylist mutableSetValueForKey:](self, "mutableSetValueForKey:", kPlaylistDeletedEpisodes, v11, v12, v13, v14);
  long long v9 = [v7 episodes];
  [v8 minusSet:v9];

  long long v10 = [(MTPlaylist *)self mutableOrderedSetValueForKey:kPlaylistPodcasts];
  [v10 removeObject:v7];

  [(MTPlaylist *)self setNeedsUpdate:1];
  _Block_object_dispose(&v17, 8);
}

- (void)removePodcastEpisodes:(id)a3 shouldSave:(BOOL)a4
{
  id v6 = a3;
  [(MTPlaylist *)self managedObjectContext];
  long long v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  uint64_t v12 = sub_10010012C;
  v13 = &unk_10054EAB0;
  long long v14 = self;
  id v15 = v6;
  BOOL v17 = a4;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v16;
  id v8 = v6;
  [v7 performBlockAndWait:&v10];
  long long v9 = +[SyncKeysRepository shared];
  [v9 setIsPlaylistSyncDirty:1];
}

- (void)removeEpisodes:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MTPlaylist *)self removeEpisode:*(void *)(*((void *)&v13 + 1) + 8 * (void)v8) inBulkTransaction:1];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  [(MTPlaylist *)self managedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001004E0;
  v11[3] = &unk_10054D570;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v12;
  [v9 performBlockAndWait:v11];
  long long v10 = +[SyncKeysRepository shared];
  [v10 setIsPlaylistSyncDirty:1];
}

- (void)removeEpisode:(id)a3
{
}

- (void)removeEpisode:(id)a3 inBulkTransaction:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(MTPlaylist *)self managedObjectContext];
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  long long v13 = sub_1001005E4;
  long long v14 = &unk_10054EAB0;
  long long v15 = self;
  id v8 = v6;
  id v16 = v8;
  BOOL v18 = a4;
  id v9 = v7;
  id v17 = v9;
  [v9 performBlockAndWait:&v11];
  if (!a4)
  {
    long long v10 = +[SyncKeysRepository shared];
    [v10 setIsPlaylistSyncDirty:1];
  }
}

- (double)totalDuration
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(MTPlaylist *)self episodes];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) duration];
        double v6 = v6 + v8;
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (MTEpisode)nextEpisode
{
  if ([(MTPlaylist *)self isFolder])
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [(MTPlaylist *)self episodes];
    id v3 = [v4 firstObject];
  }

  return (MTEpisode *)v3;
}

- (int64_t)getFolderSubPlaylistsCount
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v3 = +[MTDB sharedInstance];
  id v4 = [v3 mainOrPrivateContext];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001008EC;
  v8[3] = &unk_10054DA00;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  long long v10 = &v11;
  [v5 performBlockAndWait:v8];
  int64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

+ (int64_t)getITunesPlaylistsCount
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v2 = +[MTDB sharedInstance];
  id v3 = [v2 mainOrPrivateContext];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100100AD4;
  v7[3] = &unk_10054DF08;
  id v4 = v3;
  id v8 = v4;
  id v9 = &v10;
  [v4 performBlockAndWait:v7];
  int64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

+ (id)stringForContainerOrder:(int)a3 short:(BOOL)a4
{
  switch(a3)
  {
    case 0:
      id v4 = +[NSBundle mainBundle];
      int64_t v5 = v4;
      if (a4) {
        CFStringRef v6 = @"MY_PODCASTS_ORDER_SHORT";
      }
      else {
        CFStringRef v6 = @"My Podcasts Order";
      }
      goto LABEL_9;
    case 1:
      id v4 = +[NSBundle mainBundle];
      int64_t v5 = v4;
      CFStringRef v6 = @"Newest To Oldest";
      goto LABEL_9;
    case 2:
      id v4 = +[NSBundle mainBundle];
      int64_t v5 = v4;
      CFStringRef v6 = @"Manual";
      goto LABEL_9;
    case 3:
      id v4 = +[NSBundle mainBundle];
      int64_t v5 = v4;
      CFStringRef v6 = @"Oldest To Newest";
      goto LABEL_9;
    case 4:
    case 5:
      id v4 = +[NSBundle mainBundle];
      int64_t v5 = v4;
      CFStringRef v6 = @"STATION_SORT_BY_SHOW_TITLE";
LABEL_9:
      uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_10056A8A0 table:0];

      break;
    default:
      uint64_t v7 = 0;
      break;
  }

  return v7;
}

+ (id)containerOrderOptionArray:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [a1 stringForContainerOrder:0 short:a3];
  CFStringRef v6 = [a1 stringForContainerOrder:1 short:v3, v5];
  v12[1] = v6;
  uint64_t v7 = [a1 stringForContainerOrder:3 short:v3];
  v12[2] = v7;
  id v8 = [a1 stringForContainerOrder:2 short:v3];
  v12[3] = v8;
  id v9 = [a1 stringForContainerOrder:4 short:v3];
  v12[4] = v9;
  uint64_t v10 = +[NSArray arrayWithObjects:v12 count:5];

  return v10;
}

+ (id)containerOrderOptionValues
{
  return +[NSOrderedSet orderedSetWithArray:&off_10057AE40];
}

+ (id)predicateForVisiblePlaylistWithUUID:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K == %@ && %K == 0", kPlaylistUuid, a3, kPlaylistHidden];
}

+ (id)predicateForMediaLibraryId:(int64_t)a3
{
  uint64_t v3 = kPlaylistMediaLibraryId;
  id v4 = +[NSNumber numberWithLongLong:a3];
  int64_t v5 = +[NSPredicate predicateWithFormat:@"%K = %@", v3, v4];

  return v5;
}

- (id)metricsContentIdentifier
{
  if ([(MTPlaylist *)self isBuiltIn]) {
    [(MTPlaylist *)self uuid];
  }
  else {
  uint64_t v3 = [(MTPlaylist *)self title];
  }

  return v3;
}

- (id)metricsAdditionalData
{
  v22[0] = kPlaylistMediaLibraryId;
  v22[1] = kPlaylistIsFolder;
  v22[2] = kPlaylistUngroupedList;
  v22[3] = kPlaylistIncludesAllPodcasts;
  v22[4] = kPlaylistContainerOrder;
  id v17 = +[NSArray arrayWithObjects:v22 count:5];
  uint64_t v3 = [(MTPlaylist *)self dictionaryWithValuesForKeys:v17];
  id v4 = [v3 mutableCopy];

  int64_t v5 = [(MTPlaylist *)self defaultSettings];
  CFStringRef v6 = [v5 metricsKeys];
  id v16 = [v5 dictionaryWithValuesForKeys:v6];

  [v4 addEntriesFromDictionary:v16];
  v20[0] = @"settings";
  v20[1] = @"counts";
  v21[0] = v4;
  v18[0] = @"episodes";
  uint64_t v7 = [(MTPlaylist *)self episodes];
  id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 count]);
  v19[0] = v8;
  v18[1] = @"podcasts";
  id v9 = [(MTPlaylist *)self podcasts];
  uint64_t v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 count]);
  v19[1] = v10;
  v18[2] = @"deletedEpisodes";
  uint64_t v11 = [(MTPlaylist *)self deletedEpisodes];
  uint64_t v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 count]);
  v19[2] = v12;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  v21[1] = v13;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v14;
}

@end