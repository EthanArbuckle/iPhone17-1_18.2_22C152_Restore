@interface MTStoreManifest
+ (BOOL)storePlatformDictionaryHasChildren:(id)a3;
+ (id)_episodeStorePlatformDictionaryFromSiriAssetInfo:(id)a3 episodeAdamId:(id)a4;
+ (id)activityTypeSuffix;
+ (id)episodeCacheForStoreMediaDictionaries:(id)a3;
+ (id)playerItemsFromPodcastStorePlatformDictionary:(id)a3 oldestEpisode:(BOOL)a4 restricted:(BOOL *)a5 initiatedByAnotherUser:(BOOL)a6;
+ (id)podcastStorePlatformDictionaryFromSiriAssetInfo:(id)a3 podcastAdamId:(id)a4;
+ (id)storeMediaDictionariesToPlayerItems:(id)a3;
+ (id)storeMediaDictionariesToPlayerItems:(id)a3 initiatedByAnotherUser:(BOOL)a4;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
+ (void)fetchPlayerItemsForStoreTrackIDs:(id)a3 completion:(id)a4;
+ (void)fetchPlayerItemsForStoreTrackIDs:(id)a3 initiatedByAnotherUser:(BOOL)a4 completion:(id)a5;
- (BOOL)initiatedByAnotherUser;
- (BOOL)playerItemsNeedLoading;
- (BOOL)userActivityContainsPlayhead;
- (MTStoreManifest)initWithEpisodeAdamId:(id)a3 siriAssetInfo:(id)a4 initialIndex:(unint64_t)a5 initiatedByAnotherUser:(BOOL)a6;
- (MTStoreManifest)initWithEpisodeAdamIds:(id)a3 initialIndex:(unint64_t)a4;
- (MTStoreManifest)initWithItems:(id)a3;
- (MTStoreManifest)initWithItems:(id)a3 initialIndex:(unint64_t)a4;
- (MTStoreManifest)initWithPodcastAdamId:(id)a3 siriAssetInfo:(id)a4 oldestEpisode:(BOOL)a5 initiatedByAnotherUser:(BOOL)a6;
- (MTStoreManifest)initWithStoreMediaDictionaries:(id)a3 initialIndex:(unint64_t)a4;
- (NSArray)episodeAdamIds;
- (NSNumber)podcastAdamId;
- (double)initialPlayheadPosition;
- (id)_initWithEpisodeAdamIds:(id)a3 playheadPosition:(double)a4 initialIndex:(unint64_t)a5;
- (id)_initWithPodcastStorePlatformDictionary:(id)a3 oldestEpisode:(BOOL)a4;
- (id)activity;
- (int64_t)playbackOrder;
- (unint64_t)initialIndex;
- (unint64_t)loadStatus;
- (void)_loadItemsFromEpisodeAdamIdsWithCompletion:(id)a3;
- (void)_updateLoadStatus:(BOOL)a3;
- (void)load:(id)a3;
- (void)setEpisodeAdamIds:(id)a3;
- (void)setInitialIndex:(unint64_t)a3;
- (void)setInitialPlayheadPosition:(double)a3;
- (void)setInitiatedByAnotherUser:(BOOL)a3;
- (void)setLoadStatus:(unint64_t)a3;
- (void)setPlaybackOrder:(int64_t)a3;
- (void)setPlayerItemsNeedLoading:(BOOL)a3;
- (void)setPodcastAdamId:(id)a3;
@end

@implementation MTStoreManifest

+ (id)activityTypeSuffix
{
  return @"store";
}

- (MTStoreManifest)initWithEpisodeAdamIds:(id)a3 initialIndex:(unint64_t)a4
{
  return (MTStoreManifest *)[(MTStoreManifest *)self _initWithEpisodeAdamIds:a3 playheadPosition:a4 initialIndex:0.0];
}

- (MTStoreManifest)initWithEpisodeAdamId:(id)a3 siriAssetInfo:(id)a4 initialIndex:(unint64_t)a5 initiatedByAnotherUser:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(id)objc_opt_class() _episodeStorePlatformDictionaryFromSiriAssetInfo:v10 episodeAdamId:v9];

  if (!v11
    || ((unsigned __int8 v23 = 0,
         +[MTStorePlatformUtil storeMediaDictionaryFromStorePlatformDictionary:v11 artworkSize:&v23 restricted:kMTPreferredArtworkSize], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0)? (v13 = v23 == 0): (v13 = 0), v13))
  {
    id v24 = v9;
    v18 = +[NSArray arrayWithObjects:&v24 count:1];
    id v19 = [(MTStoreManifest *)self _initWithEpisodeAdamIds:v18 playheadPosition:a5 initialIndex:0.0];

    v20 = (MTStoreManifest *)v19;
  }
  else
  {
    v14 = (void *)v12;
    if (v12)
    {
      v15 = objc_opt_class();
      v25 = v14;
      v16 = +[NSArray arrayWithObjects:&v25 count:1];
      v17 = [v15 storeMediaDictionariesToPlayerItems:v16 initiatedByAnotherUser:[self initiatedByAnotherUser]];
    }
    else
    {
      v17 = &__NSArray0__struct;
    }
    v21 = [(MTStoreManifest *)self initWithItems:v17 initialIndex:a5];
    [(MTStoreManifest *)v21 _updateLoadStatus:v23];
    v20 = v21;
  }
  return v20;
}

- (MTStoreManifest)initWithPodcastAdamId:(id)a3 siriAssetInfo:(id)a4 oldestEpisode:(BOOL)a5 initiatedByAnotherUser:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(id)objc_opt_class() podcastStorePlatformDictionaryFromSiriAssetInfo:v11 podcastAdamId:v10];

  unsigned int v13 = [(id)objc_opt_class() storePlatformDictionaryHasChildren:v12];
  v14 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "assetInfo has children %d", buf, 8u);
  }

  if (v12) {
    uint64_t v15 = v13 ^ 1;
  }
  else {
    uint64_t v15 = 1;
  }
  if (v15)
  {
    v20.receiver = self;
    v20.super_class = (Class)MTStoreManifest;
    v16 = [(MTPlayerManifest *)&v20 init];
  }
  else
  {
    v16 = [(MTStoreManifest *)self _initWithPodcastStorePlatformDictionary:v12 oldestEpisode:v7];
  }
  v17 = v16;
  if (v16)
  {
    [(MTStoreManifest *)v16 setPlayerItemsNeedLoading:v15];
    if (v7) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 1;
    }
    [(MTStoreManifest *)v17 setPlaybackOrder:v18];
    [(MTStoreManifest *)v17 setPodcastAdamId:v10];
    [(MTStoreManifest *)v17 setInitiatedByAnotherUser:v6];
  }

  return v17;
}

- (id)_initWithEpisodeAdamIds:(id)a3 playheadPosition:(double)a4 initialIndex:(unint64_t)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTStoreManifest;
  id v9 = [(MTPlayerManifest *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    [(MTStoreManifest *)v9 setPlayerItemsNeedLoading:1];
    [(MTStoreManifest *)v10 setInitialPlayheadPosition:a4];
    [(MTStoreManifest *)v10 setInitialIndex:a5];
    [(MTStoreManifest *)v10 setEpisodeAdamIds:v8];
  }

  return v10;
}

- (id)_initWithPodcastStorePlatformDictionary:(id)a3 oldestEpisode:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned __int8 v11 = 0;
  id v6 = a3;
  BOOL v7 = [objc_opt_class() playerItemsFromPodcastStorePlatformDictionary:v6 oldestEpisode:v4 restricted:&v11 initiatedByAnotherUser:[self initiatedByAnotherUser]];

  id v8 = [(MTStoreManifest *)self initWithItems:v7];
  id v9 = v8;
  if (v8) {
    [(MTStoreManifest *)v8 _updateLoadStatus:v11];
  }

  return v9;
}

- (void)load:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if ([(MTStoreManifest *)v5 playerItemsNeedLoading])
  {
    [(MTStoreManifest *)v5 setPlayerItemsNeedLoading:0];
    id v6 = [(MTStoreManifest *)v5 episodeAdamIds];
    id v7 = [v6 count];

    if (v7)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000DDCD4;
      v28[3] = &unk_100550C88;
      v28[4] = v5;
      id v29 = v4;
      [(MTStoreManifest *)v5 _loadItemsFromEpisodeAdamIdsWithCompletion:v28];
    }
    else
    {
      id v8 = [(MTStoreManifest *)v5 podcastAdamId];
      unsigned int v9 = +[MTStoreIdentifier isNotEmptyNumber:v8];

      objc_initWeak(&location, v5);
      if (v9)
      {
        id v10 = objc_alloc((Class)IMContentLookupService);
        unsigned __int8 v11 = [(MTStoreManifest *)v5 podcastAdamId];
        objc_super v12 = [v11 stringValue];
        v30 = v12;
        unsigned int v13 = +[NSArray arrayWithObjects:&v30 count:1];
        id v14 = [v10 initWithIds:v13];

        uint64_t v15 = +[NSDate date];
        [v14 setProfile:kMTStoreLookupPodcastProductProfile];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000DDE48;
        v22[3] = &unk_100550CB0;
        id v16 = v15;
        id v23 = v16;
        objc_copyWeak(&v26, &location);
        id v24 = v5;
        id v25 = v4;
        [v14 request:v22];

        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
      }
      else
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000DE10C;
        v19[3] = &unk_100550CD8;
        objc_copyWeak(&v21, &location);
        id v20 = v4;
        v18.receiver = v5;
        v18.super_class = (Class)MTStoreManifest;
        [(MTStoreManifest *)&v18 load:v19];

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
    v17.receiver = v5;
    v17.super_class = (Class)MTStoreManifest;
    [(MTStoreManifest *)&v17 load:v4];
  }
  objc_sync_exit(v5);
}

- (MTStoreManifest)initWithStoreMediaDictionaries:(id)a3 initialIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(id)objc_opt_class() storeMediaDictionariesToPlayerItems:v6];

  id v8 = [(MTStoreManifest *)self initWithItems:v7 initialIndex:a4];
  return v8;
}

- (MTStoreManifest)initWithItems:(id)a3
{
  return [(MTStoreManifest *)self initWithItems:a3 initialIndex:0];
}

- (MTStoreManifest)initWithItems:(id)a3 initialIndex:(unint64_t)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MTStoreManifest;
  id v7 = [(MTItemListManifest *)&v27 initWithItems:v6];
  id v8 = v7;
  if (v7)
  {
    unsigned int v9 = [(MTItemListManifest *)v7 items];
    if ((unint64_t)[v9 count] <= a4) {
      unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v10 = a4;
    }
    [(MTStoreManifest *)v8 setCurrentIndex:v10];

    id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v6 count]];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_super v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ((uint64_t)objc_msgSend(v17, "episodeStoreId", (void)v23) >= 1)
          {
            objc_super v18 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v17 episodeStoreId]);
            [v11 addObject:v18];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v14);
    }

    id v19 = [v11 copy];
    [(MTStoreManifest *)v8 setEpisodeAdamIds:v19];

    id v20 = +[NSBundle mainBundle];
    id v21 = [v20 localizedStringForKey:@"Directory" value:&stru_10056A8A0 table:0];
    [(MTStoreManifest *)v8 setTitle:v21];
  }
  return v8;
}

- (void)_updateLoadStatus:(BOOL)a3
{
  unsigned int v5 = [(MTStoreManifest *)self isLoaded];
  if (v5) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 0;
  }
  if (v5 && !a3)
  {
    id v7 = [(MTItemListManifest *)self items];
    id v8 = [v7 count];

    if (v8) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 3;
    }
  }

  [(MTStoreManifest *)self setLoadStatus:v6];
}

- (void)_loadItemsFromEpisodeAdamIdsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  uint64_t v16 = 0;
  [(MTStoreManifest *)self initialPlayheadPosition];
  uint64_t v16 = v5;
  uint64_t v6 = [(MTStoreManifest *)self initialIndex];
  id v7 = objc_opt_class();
  id v8 = [(MTStoreManifest *)self episodeAdamIds];
  BOOL v9 = [(MTStoreManifest *)self initiatedByAnotherUser];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000DE620;
  v11[3] = &unk_100550D28;
  objc_copyWeak(v14, &location);
  v14[1] = v6;
  id v13 = v15;
  id v10 = v4;
  id v12 = v10;
  [v7 fetchPlayerItemsForStoreTrackIDs:v8 initiatedByAnotherUser:v9 completion:v11];

  objc_destroyWeak(v14);
  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&location);
}

- (id)activity
{
  v7.receiver = self;
  v7.super_class = (Class)MTStoreManifest;
  v3 = [(MTPlayerManifest *)&v7 activity];
  id v4 = +[NSNumber numberWithUnsignedInteger:[(MTStoreManifest *)self currentIndex]];
  [v3 setValue:v4 forKey:@"MTStoreManifestCurrentIndex"];

  uint64_t v5 = [(MTStoreManifest *)self episodeAdamIds];
  [v3 setValue:v5 forKey:@"MTStoreManifestAdamIdList"];

  return v3;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  id v15 = a3;
  uint64_t v5 = (void (**)(id, id))a4;
  uint64_t v6 = +[MTReachability sharedInstance];
  unsigned __int8 v7 = [v6 isReachable];

  if (v7)
  {
    id v8 = [v15 userInfo];
    BOOL v9 = [v8 valueForKey:@"MTStoreManifestAdamIdList"];

    if ([v9 count])
    {
      id v10 = [v15 userInfo];
      id v11 = [v10 valueForKey:@"MTStoreManifestCurrentIndex"];

      id v12 = [MTStoreManifest alloc];
      [v15 currentTime];
      id v14 = -[MTStoreManifest _initWithEpisodeAdamIds:playheadPosition:initialIndex:](v12, "_initWithEpisodeAdamIds:playheadPosition:initialIndex:", v9, [v11 unsignedIntegerValue], v13);
      v5[2](v5, v14);
    }
    else
    {
      v5[2](v5, 0);
    }
  }
  else
  {
    v5[2](v5, 0);
  }
}

- (BOOL)userActivityContainsPlayhead
{
  return 1;
}

+ (BOOL)storePlatformDictionaryHasChildren:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"childrenIds"];
  objc_opt_class();
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && [v3 count] != 0;

  return v4;
}

+ (id)playerItemsFromPodcastStorePlatformDictionary:(id)a3 oldestEpisode:(BOOL)a4 restricted:(BOOL *)a5 initiatedByAnotherUser:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = [v10 objectForKeyedSubscript:@"childrenIds"];
  id v12 = [v10 objectForKeyedSubscript:@"children"];
  if (a4) {
    [v11 lastObject];
  }
  else {
  double v13 = [v11 firstObject];
  }
  id v14 = [v13 stringValue];
  id v15 = [v12 objectForKeyedSubscript:v14];

  if (v15)
  {
    BOOL v22 = 0;
    uint64_t v16 = [v10 objectForKeyedSubscript:@"isNotSubscribeable"];
    id v17 = [v16 BOOLValue];

    objc_super v18 = +[MTStorePlatformUtil storeMediaDictionaryFromStorePlatformDictionary:v15 artworkSize:&v22 restricted:v17 isNotSubscribeable:kMTPreferredArtworkSize];
    if (+[MTStorePlatformUtil isExplicitForStorePlatformDictionary:](MTStorePlatformUtil, "isExplicitForStorePlatformDictionary:", v10)&& (+[PFRestrictionsController isExplicitContentAllowed] & 1) == 0)
    {
      BOOL v22 = 1;
    }
    if (a5) {
      *a5 = v22;
    }
    if (v18)
    {
      long long v23 = v18;
      id v19 = +[NSArray arrayWithObjects:&v23 count:1];
      id v20 = [a1 storeMediaDictionariesToPlayerItems:v19 initiatedByAnotherUser:v6];
    }
    else
    {
      id v20 = &__NSArray0__struct;
    }
  }
  else
  {
    id v20 = &__NSArray0__struct;
  }

  return v20;
}

+ (id)podcastStorePlatformDictionaryFromSiriAssetInfo:(id)a3 podcastAdamId:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    BOOL v6 = [a3 dataUsingEncoding:4];
    uint64_t v18 = 0;
    unsigned __int8 v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:&v18];
    id v8 = v7;
    id v9 = 0;
    if (!v18)
    {
      id v10 = [v7 objectForKey:@"results"];
      id v11 = [v5 stringValue];
      id v12 = [v10 objectForKey:v11];

      double v13 = [v12 objectForKey:@"firstAndLastChildrenIds"];
      id v14 = [v12 objectForKey:@"firstAndLastChildren"];
      uint64_t v15 = sub_1000DEEF8((uint64_t)v14, v12);
      if (v15 & 1) != 0 || (uint64_t v16 = sub_1000DEEF8(v15, v13), (v16) || (sub_1000DEEF8(v16, v14))
      {
        id v9 = 0;
      }
      else
      {
        id v9 = [v12 mutableCopy];
        [v9 removeObjectForKey:@"firstAndLastChildrenIds"];
        [v9 removeObjectForKey:@"firstAndLastChildren"];
        [v9 setObject:v13 forKey:@"childrenIds"];
        [v9 setObject:v14 forKey:@"children"];
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)_episodeStorePlatformDictionaryFromSiriAssetInfo:(id)a3 episodeAdamId:(id)a4
{
  id v5 = a4;
  BOOL v6 = v5;
  unsigned __int8 v7 = 0;
  if (a3 && v5)
  {
    id v8 = [a3 dataUsingEncoding:4];
    uint64_t v14 = 0;
    id v9 = +[NSJSONSerialization JSONObjectWithData:v8 options:0 error:&v14];
    id v10 = v9;
    unsigned __int8 v7 = 0;
    if (!v14)
    {
      id v11 = [v9 objectForKey:@"results"];
      id v12 = [v6 stringValue];
      unsigned __int8 v7 = [v11 objectForKey:v12];
    }
  }

  return v7;
}

+ (id)storeMediaDictionariesToPlayerItems:(id)a3
{
  return [a1 storeMediaDictionariesToPlayerItems:a3 initiatedByAnotherUser:0];
}

+ (id)episodeCacheForStoreMediaDictionaries:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSMutableDictionary dictionary];
  uint64_t v5 = kEpisodeEnclosureUrl;
  BOOL v6 = [v3 valueForKey:kEpisodeAssetURL];

  unsigned __int8 v7 = +[NSPredicate predicateWithFormat:@"%K in %@", v5, v6];

  id v8 = +[MTEpisode propertiesToFetchAssetURL];
  v24[0] = v5;
  v24[1] = kEpisodeUuid;
  id v9 = +[NSArray arrayWithObjects:v24 count:2];
  id v10 = [v8 arrayByAddingObjectsFromArray:v9];

  id v11 = +[MTDB sharedInstance];
  id v12 = [v11 mainOrPrivateContext];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000DF268;
  v19[3] = &unk_10054DFE8;
  id v20 = v12;
  id v21 = v7;
  id v22 = v10;
  id v23 = v4;
  id v13 = v4;
  id v14 = v10;
  id v15 = v7;
  id v16 = v12;
  [v16 performBlockAndWait:v19];
  id v17 = [v13 copy];

  return v17;
}

+ (id)storeMediaDictionariesToPlayerItems:(id)a3 initiatedByAnotherUser:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned __int8 v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  BOOL v61 = v4;
  if (v4)
  {
    v62 = 0;
  }
  else
  {
    v62 = [a1 episodeCacheForStoreMediaDictionaries:v6];
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v6;
  id v64 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (v64)
  {
    uint64_t v63 = *(void *)v70;
    uint64_t v8 = kEpisodeAssetURL;
    uint64_t v58 = kEpisodeUuid;
    unint64_t v55 = vcvtpd_s64_f64(kMTPreferredArtworkSize);
    uint64_t v57 = kEpisodePubDate;
    uint64_t v59 = kEpisodeAssetURL;
    v60 = v7;
    do
    {
      for (i = 0; i != v64; i = (char *)i + 1)
      {
        if (*(void *)v70 != v63) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        id v11 = [v10 objectForKey:v8];
        if ([v11 length])
        {
          id v12 = [v62 objectForKey:v11];
        }
        else
        {
          id v12 = 0;
        }
        id v13 = [v12 objectForKey:v8];
        if ([v13 length])
        {
          id v14 = v13;

          id v11 = v14;
        }
        if ([v11 length])
        {
          v66 = v13;
          id v15 = [MTPlayerItem alloc];
          id v16 = +[NSURL URLWithString:v11];
          id v17 = [(MTPlayerItem *)v15 initWithUrl:v16];

          -[NSObject setManifestIndex:](v17, "setManifestIndex:", [v7 count]);
          uint64_t v18 = [v12 objectForKey:v58];
          if ([v18 length]) {
            [v17 setEpisodeUuid:v18];
          }
          v65 = v18;
          id v19 = [v10 objectForKeyedSubscript:@"episodeId"];
          id v20 = +[MTStoreIdentifier validatedIdNumberFromStoreId:](MTStoreIdentifier, "validatedIdNumberFromStoreId:", [v19 longLongValue]);
          -[NSObject setEpisodeStoreId:](v17, "setEpisodeStoreId:", [v20 longLongValue]);

          id v21 = [v10 objectForKeyedSubscript:@"episodeGuid"];
          [v17 setEpisodeGuid:v21];

          [v17 setEnqueuedByAnotherUser:v61];
          id v22 = [v10 objectForKeyedSubscript:@"feedURL"];
          [v17 setPodcastFeedUrl:v22];

          id v23 = [v10 objectForKeyedSubscript:@"podcastId"];
          -[NSObject setPodcastStoreId:](v17, "setPodcastStoreId:", [v23 longLongValue]);

          long long v24 = [v10 objectForKeyedSubscript:@"isNotSubscribeable"];
          -[NSObject setIsNotSubscribeable:](v17, "setIsNotSubscribeable:", [v24 BOOLValue]);

          long long v25 = [v10 objectForKeyedSubscript:@"episodeTitle"];
          [v17 setTitle:v25];

          long long v26 = [v10 objectForKeyedSubscript:@"episodeDescription"];
          [v17 setItemDescription:v26];

          objc_super v27 = [v10 objectForKeyedSubscript:@"episodeShareUrl"];
          [v17 setEpisodeShareUrl:v27];

          v28 = [v10 objectForKeyedSubscript:@"podcastTitle"];
          [v17 setAuthor:v28];

          id v29 = +[MTStorePlatformUtil pubDateFromStoreMediaDictionary:v10];
          [v17 setPubDate:v29];

          v30 = [v10 objectForKeyedSubscript:v57];
          if (v30)
          {
            [v17 setAlbum:v30];
          }
          else
          {
            v31 = [v17 pubDate];
            v32 = [v31 verboseDisplayString];
            [v17 setAlbum:v32];
          }
          v33 = [v10 objectForKeyedSubscript:@"explicit"];
          -[NSObject setIsExplicit:](v17, "setIsExplicit:", [v33 BOOLValue]);

          v34 = [v10 objectForKeyedSubscript:@"duration"];
          if (objc_opt_respondsToSelector())
          {
            -[NSObject setDuration:](v17, "setDuration:", (double)(uint64_t)[v34 longLongValue]);
          }
          else
          {
            v35 = +[IMLogger sharedLogger];
            [v35 logFile:@"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/Support/MTStoreManifest.m" lineNumber:480 format:@"Store item %lld is missing a duration" -[NSObject episodeStoreId](v17, "episodeStoreId")];
          }
          v67 = v12;
          v36 = [v10 objectForKeyedSubscript:@"reportParams"];
          if (v36) {
            [v17 setStoreReportingParams:v36];
          }
          v68 = v11;
          v37 = [v10 objectForKeyedSubscript:@"artworkURL"];
          if ([v37 count])
          {
            v38 = [v37 lastObject];
            v39 = [v38 objectForKeyedSubscript:@"url"];
            v40 = +[NSURL URLWithString:v39];
            [v17 setArtworkUrl:v40];
          }
          v41 = [v17 artworkUrl];
          v42 = [v41 absoluteString];
          id v43 = [v42 length];

          if (!v43)
          {
            v44 = [v10 objectForKeyedSubscript:@"artwork"];
            v45 = [v44 objectForKeyedSubscript:@"url"];
            if ([v45 length])
            {
              v46 = +[NSString stringWithFormat:@"%lix%li", v55, v55];
              v47 = [v45 stringByReplacingOccurrencesOfString:@"{w}x{h}" withString:v46];
              v48 = [v47 stringByReplacingOccurrencesOfString:@".{f}" withString:@".jpg"];

              v49 = +[NSURL URLWithString:v48];
              [v17 setArtworkUrl:v49];
            }
          }
          id v11 = v68;
          v50 = +[NSURL URLWithString:v68];
          v51 = [v50 pathExtension];
          v52 = +[IMUTITypes UTIByExtension:v51];

          if (v52) {
            [v17 setIsVideo:+[MTUTIUtil isVideo:v52]];
          }
          unsigned __int8 v7 = v60;
          [v60 addObject:v17];

          uint64_t v8 = v59;
          id v13 = v66;
          id v12 = v67;
        }
        else
        {
          id v17 = _MTLogCategoryPlayback();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v74 = v10;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Skipping player item creation for item %@ because we couldn't play locally or stream", buf, 0xCu);
          }
        }
      }
      id v64 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
    }
    while (v64);
  }

  id v53 = [v7 copy];

  return v53;
}

+ (void)fetchPlayerItemsForStoreTrackIDs:(id)a3 completion:(id)a4
{
}

+ (void)fetchPlayerItemsForStoreTrackIDs:(id)a3 initiatedByAnotherUser:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    id v10 = [v8 mt_compactMap:&stru_100550D48];
    id v11 = [objc_alloc((Class)IMContentLookupService) initWithIds:v10];
    [v11 setProfile:kMTStoreLookupPodcastProductProfile];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    id v14[2] = sub_1000DFE5C;
    v14[3] = &unk_100550D70;
    id v15 = v10;
    id v17 = a1;
    BOOL v18 = a4;
    id v16 = v9;
    id v12 = v10;
    [v11 request:v14];
  }
  else
  {
    id v13 = _MTLogCategoryMediaRemote();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = a1;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ Found 0 store track IDs", buf, 0xCu);
    }

    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
}

- (unint64_t)loadStatus
{
  return self->_loadStatus;
}

- (void)setLoadStatus:(unint64_t)a3
{
  self->_loadStatus = a3;
}

- (int64_t)playbackOrder
{
  return self->_playbackOrder;
}

- (void)setPlaybackOrder:(int64_t)a3
{
  self->_playbackOrder = a3;
}

- (NSArray)episodeAdamIds
{
  return self->_episodeAdamIds;
}

- (void)setEpisodeAdamIds:(id)a3
{
}

- (NSNumber)podcastAdamId
{
  return self->_podcastAdamId;
}

- (void)setPodcastAdamId:(id)a3
{
}

- (double)initialPlayheadPosition
{
  return self->_initialPlayheadPosition;
}

- (void)setInitialPlayheadPosition:(double)a3
{
  self->_initialPlayheadPosition = a3;
}

- (unint64_t)initialIndex
{
  return self->_initialIndex;
}

- (void)setInitialIndex:(unint64_t)a3
{
  self->_initialIndex = a3;
}

- (BOOL)playerItemsNeedLoading
{
  return self->_playerItemsNeedLoading;
}

- (void)setPlayerItemsNeedLoading:(BOOL)a3
{
  self->_playerItemsNeedLoading = a3;
}

- (BOOL)initiatedByAnotherUser
{
  return self->_initiatedByAnotherUser;
}

- (void)setInitiatedByAnotherUser:(BOOL)a3
{
  self->_initiatedByAnotherUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podcastAdamId, 0);

  objc_storeStrong((id *)&self->_episodeAdamIds, 0);
}

@end