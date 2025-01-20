@interface MTEpisodeUpdaterCache
+ (id)defaultPropertiesToFetch;
+ (id)episodeCacheWithPredicate:(id)a3 inCtx:(id)a4;
+ (id)episodeCacheWithPredicate:(id)a3 inCtx:(id)a4 extraProperties:(id)a5;
- (MTEpisodeUpdaterCache)initWithPredicate:(id)a3 inCtx:(id)a4 extraProperties:(id)a5;
- (MTManagedObjectContext)ctx;
- (NSArray)propertiesToFetch;
- (NSCache)managedObjectCache;
- (NSDictionary)lookupDict;
- (NSMutableSet)unvisitedUUIDs;
- (id)episodeForAssetUrl:(id)a3;
- (id)episodeForEnclosure:(id)a3;
- (id)episodeForGuid:(id)a3;
- (id)episodeForPersistentID:(id)a3;
- (id)episodeForTitle:(id)a3 pubDate:(double)a4;
- (id)episodeForUUID:(id)a3;
- (id)episodeWithValue:(id)a3 forPropertyKey:(id)a4;
- (id)searchCacheForEpisodeMatchingFeedItem:(id)a3 enclosureUrl:(id)a4;
- (id)searchCacheForEpisodeMatchingMediaItem:(id)a3;
- (id)unvisitedEpisodes;
- (void)setCtx:(id)a3;
- (void)setLookupDict:(id)a3;
- (void)setManagedObjectCache:(id)a3;
- (void)setPropertiesToFetch:(id)a3;
- (void)setUnvisitedUUIDs:(id)a3;
@end

@implementation MTEpisodeUpdaterCache

+ (id)defaultPropertiesToFetch
{
  v4[0] = kEpisodeEnclosureUrl;
  v4[1] = kEpisodePodcastUuid;
  v4[2] = kEpisodeTitle;
  v4[3] = kEpisodeUuid;
  v4[4] = kEpisodeGuid;
  v4[5] = kEpisodePubDate;
  v4[6] = kEpisodeByteSize;
  v4[7] = kEpisodeAssetURL;
  v4[8] = kEpisodePersistentID;
  v4[9] = kEpisodeStoreTrackId;
  v2 = +[NSArray arrayWithObjects:v4 count:10];

  return v2;
}

+ (id)episodeCacheWithPredicate:(id)a3 inCtx:(id)a4
{
  return _[a1 episodeCacheWithPredicate:a3 inCtx:a4 extraProperties:0];
}

+ (id)episodeCacheWithPredicate:(id)a3 inCtx:(id)a4 extraProperties:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithPredicate:v10 inCtx:v9 extraProperties:v8];

  return v11;
}

- (MTEpisodeUpdaterCache)initWithPredicate:(id)a3 inCtx:(id)a4 extraProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v56.receiver = self;
  v56.super_class = (Class)MTEpisodeUpdaterCache;
  id v11 = [(MTEpisodeUpdaterCache *)&v56 init];
  if (v11)
  {
    v43 = v8;
    v12 = &__NSArray0__struct;
    if (v10) {
      v12 = v10;
    }
    id v13 = v12;

    v14 = [(id)objc_opt_class() defaultPropertiesToFetch];
    v15 = [v14 arrayByAddingObjectsFromArray:v13];

    objc_storeStrong((id *)&v11->_propertiesToFetch, v15);
    objc_storeStrong((id *)&v11->_ctx, a4);
    v16 = v9;
    if ([(MTManagedObjectContext *)v11->_ctx isResetable]) {
      id v40 = 0;
    }
    else {
      id v40 = objc_alloc_init((Class)NSCache);
    }
    v37 = +[NSMutableDictionary dictionary];
    v39 = +[NSMutableDictionary dictionary];
    v17 = +[NSMutableDictionary dictionary];
    v18 = +[NSMutableDictionary dictionary];
    v19 = +[NSMutableDictionary dictionary];
    v20 = +[NSMutableDictionary dictionary];
    v21 = +[NSMutableSet set];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10016D554;
    v44[3] = &unk_1005537E0;
    v42 = v16;
    id v45 = v16;
    id v46 = v43;
    id v10 = v15;
    id v47 = v10;
    id v48 = v37;
    id v49 = v17;
    id v50 = v18;
    id v51 = v39;
    id v52 = v19;
    v22 = (NSCache *)v40;
    v53 = v22;
    id v54 = v20;
    v23 = v21;
    v55 = v23;
    id v24 = v20;
    id v38 = v19;
    id v25 = v39;
    id v26 = v18;
    id v27 = v17;
    id v28 = v37;
    [v45 performBlockAndWait:v44];
    unvisitedUUIDs = v11->_unvisitedUUIDs;
    v11->_unvisitedUUIDs = v23;
    v41 = v23;

    v57[0] = kEpisodeTitle;
    v57[1] = kEpisodeEnclosureUrl;
    v58[0] = v28;
    v58[1] = v27;
    v57[2] = kEpisodeGuid;
    v57[3] = kEpisodePersistentID;
    v58[2] = v26;
    v58[3] = v25;
    v30 = v25;
    v57[4] = kEpisodeAssetURL;
    v57[5] = kEpisodeUuid;
    v58[4] = v38;
    v58[5] = v24;
    uint64_t v31 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:6];
    lookupDict = v11->_lookupDict;
    v11->_lookupDict = (NSDictionary *)v31;

    managedObjectCache = v11->_managedObjectCache;
    v11->_managedObjectCache = v22;
    v34 = v22;

    id v8 = v43;
    v35 = v11;

    id v9 = v42;
  }

  return v11;
}

- (id)searchCacheForEpisodeMatchingMediaItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 persistentId];
  v6 = [(MTEpisodeUpdaterCache *)self episodeForPersistentID:v5];

  if (!v6)
  {
    v7 = [v4 assetUrl];
    v6 = [(MTEpisodeUpdaterCache *)self episodeForAssetUrl:v7];

    if (!v6)
    {
      id v8 = [v4 guid];
      v6 = [(MTEpisodeUpdaterCache *)self episodeForGuid:v8];

      if (!v6)
      {
        id v9 = [v4 title];
        id v10 = [v9 stringByStrippingHTML];
        id v11 = [v4 pubDate];
        [v11 timeIntervalSinceReferenceDate];
        v6 = -[MTEpisodeUpdaterCache episodeForTitle:pubDate:](self, "episodeForTitle:pubDate:", v10);
      }
    }
  }
  v12 = [v6 uuid];

  if (v12)
  {
    unvisitedUUIDs = self->_unvisitedUUIDs;
    v14 = [v6 uuid];
    [(NSMutableSet *)unvisitedUUIDs removeObject:v14];
  }
  else if (v6)
  {
    v15 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [v6 title];
      int v18 = 138412290;
      v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "MTEpisodeUpdaterCache encountered episode without UUID %@", (uint8_t *)&v18, 0xCu);
    }
  }

  return v6;
}

- (id)searchCacheForEpisodeMatchingFeedItem:(id)a3 enclosureUrl:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 guid];

  if (!v8
    || ([v6 guid],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [(MTEpisodeUpdaterCache *)self episodeForGuid:v9],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    id v10 = [(MTEpisodeUpdaterCache *)self episodeForEnclosure:v7];
    if (!v10)
    {
      id v11 = [v6 title];
      v12 = [v11 stringByStrippingHTML];
      id v13 = [v6 pubDate];
      [v13 timeIntervalSinceReferenceDate];
      id v10 = -[MTEpisodeUpdaterCache episodeForTitle:pubDate:](self, "episodeForTitle:pubDate:", v12);
    }
  }
  v14 = [v10 uuid];

  if (v14)
  {
    unvisitedUUIDs = self->_unvisitedUUIDs;
    v16 = [v10 uuid];
    [(NSMutableSet *)unvisitedUUIDs removeObject:v16];
  }
  else if (v10)
  {
    v17 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = [v10 title];
      int v20 = 138412290;
      v21 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "MTEpisodeUpdaterCache encountered episode without UUID %@", (uint8_t *)&v20, 0xCu);
    }
  }

  return v10;
}

- (id)unvisitedEpisodes
{
  v3 = +[NSMutableArray arrayWithCapacity:[(NSMutableSet *)self->_unvisitedUUIDs count]];
  id v4 = +[NSMutableSet setWithSet:self->_unvisitedUUIDs];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_unvisitedUUIDs;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    uint64_t v9 = kEpisodeUuid;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v12 = -[MTEpisodeUpdaterCache episodeWithValue:forPropertyKey:](self, "episodeWithValue:forPropertyKey:", v11, v9, (void)v19);
        if (v12)
        {
          [v3 addObject:v12];
          [v4 removeObject:v11];
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    ctx = self->_ctx;
    uint64_t v14 = kMTEpisodeEntityName;
    v15 = +[MTEpisode predicateForEpisodeUuids:v4];
    v16 = [(MTManagedObjectContext *)ctx objectsInEntity:v14 predicate:v15 propertiesToFetch:self->_propertiesToFetch batchSize:0];

    [v3 addObjectsFromArray:v16];
  }
  id v17 = [v3 copy:v19];

  return v17;
}

- (id)episodeForUUID:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    id v7 = 0;
    goto LABEL_9;
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_1000571E8;
  int v18 = sub_1000573B0;
  id v19 = 0;
  if ([(MTManagedObjectContext *)self->_ctx isResetable])
  {
    ctx = self->_ctx;
    id v6 = v13;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10016E148;
    v13[3] = &unk_10054E280;
    v13[6] = &v14;
    v13[4] = self;
    v13[5] = v4;
    [(MTManagedObjectContext *)ctx performBlockAndWait:v13];
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v8 = [(NSCache *)self->_managedObjectCache objectForKey:v4];
  uint64_t v9 = (void *)v15[5];
  v15[5] = v8;

  if (!v15[5])
  {
    id v10 = self->_ctx;
    id v6 = v12;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10016E1A4;
    v12[3] = &unk_10054E280;
    v12[6] = &v14;
    v12[4] = self;
    v12[5] = v4;
    [(MTManagedObjectContext *)v10 performBlockAndWait:v12];
    goto LABEL_7;
  }
LABEL_8:
  id v7 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

LABEL_9:

  return v7;
}

- (id)episodeWithValue:(id)a3 forPropertyKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7 && ([v7 isEqualToString:kEpisodeTitle] & 1) == 0)
  {
    id v10 = [(NSDictionary *)self->_lookupDict objectForKey:v8];
    uint64_t v11 = v10;
    if (v10)
    {
      v12 = [v10 objectForKey:v6];
      if (v12)
      {
        uint64_t v9 = [(MTEpisodeUpdaterCache *)self episodeForUUID:v12];
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)episodeForGuid:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(MTEpisodeUpdaterCache *)self episodeWithValue:v4 forPropertyKey:kEpisodeGuid];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)episodeForEnclosure:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(MTEpisodeUpdaterCache *)self episodeWithValue:v4 forPropertyKey:kEpisodeEnclosureUrl];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)episodeForAssetUrl:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(MTEpisodeUpdaterCache *)self episodeWithValue:v4 forPropertyKey:kEpisodeAssetURL];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)episodeForPersistentID:(id)a3
{
  if (a3)
  {
    id v4 = [(MTEpisodeUpdaterCache *)self episodeWithValue:a3 forPropertyKey:kEpisodePersistentID];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)episodeForTitle:(id)a3 pubDate:(double)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = [(MTEpisodeUpdaterCache *)self lookupDict];
    uint64_t v8 = [v7 objectForKey:kEpisodeTitle];
    uint64_t v9 = [v8 objectForKey:v6];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      id v13 = 0;
      uint64_t v14 = *(void *)v25;
      double v15 = 1.79769313e308;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v10);
        }
        id v17 = -[MTEpisodeUpdaterCache episodeForUUID:](self, "episodeForUUID:", *(void *)(*((void *)&v24 + 1) + 8 * v16), (void)v24);
        if (!v17) {
          break;
        }
        int v18 = v17;
        [v17 pubDate];
        double v20 = vabdd_f64(v19, a4);
        if (v20 < v15)
        {
          id v21 = v18;

          id v13 = v21;
          double v15 = v20;
        }

        if (v12 == (id)++v16)
        {
          id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v12) {
            goto LABEL_4;
          }

          if (v15 < 604800.0)
          {
            id v13 = v13;
            long long v22 = v13;
            goto LABEL_18;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
      id v13 = 0;
    }

LABEL_17:
    long long v22 = 0;
LABEL_18:
  }
  else
  {
    long long v22 = 0;
  }

  return v22;
}

- (NSDictionary)lookupDict
{
  return self->_lookupDict;
}

- (void)setLookupDict:(id)a3
{
}

- (NSCache)managedObjectCache
{
  return self->_managedObjectCache;
}

- (void)setManagedObjectCache:(id)a3
{
}

- (MTManagedObjectContext)ctx
{
  return self->_ctx;
}

- (void)setCtx:(id)a3
{
}

- (NSArray)propertiesToFetch
{
  return self->_propertiesToFetch;
}

- (void)setPropertiesToFetch:(id)a3
{
}

- (NSMutableSet)unvisitedUUIDs
{
  return self->_unvisitedUUIDs;
}

- (void)setUnvisitedUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unvisitedUUIDs, 0);
  objc_storeStrong((id *)&self->_propertiesToFetch, 0);
  objc_storeStrong((id *)&self->_ctx, 0);
  objc_storeStrong((id *)&self->_managedObjectCache, 0);

  objc_storeStrong((id *)&self->_lookupDict, 0);
}

@end