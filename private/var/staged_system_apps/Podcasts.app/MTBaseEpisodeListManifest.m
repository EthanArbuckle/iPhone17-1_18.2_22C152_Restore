@interface MTBaseEpisodeListManifest
+ (id)_mediaItemForEpisode:(id)a3;
+ (id)mediaItemForEpisodeWithManagedObjectID:(id)a3;
+ (id)mediaItemForEpisodeWithUUID:(id)a3;
+ (void)episodeUuidForActivity:(id)a3 completion:(id)a4;
- (BOOL)defaultToInitialIndexZero;
- (BOOL)isInitialPrepare;
- (MTBaseEpisodeListManifest)init;
- (MTBaseEpisodeListManifest)initWithInitialEpisodeUuid:(id)a3;
- (NSArray)episodeUuids;
- (NSDictionary)uuidToManagedObjectIDMap;
- (NSMutableDictionary)uuidToPlayerItemMap;
- (NSString)initialEpisodeUuid;
- (id)_predicateForFilteringExplicitEpisodes;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)postManifestDidChangeNotification;
- (void)setEpisodeUuids:(id)a3;
- (void)setInitialEpisodeUuid:(id)a3;
- (void)setIsInitialPrepare:(BOOL)a3;
- (void)setUuidToManagedObjectIDMap:(id)a3;
- (void)setUuidToPlayerItemMap:(id)a3;
@end

@implementation MTBaseEpisodeListManifest

- (MTBaseEpisodeListManifest)initWithInitialEpisodeUuid:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTBaseEpisodeListManifest;
  v5 = [(MTPlayerManifest *)&v8 init];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    [(MTBaseEpisodeListManifest *)v5 setUuidToPlayerItemMap:v6];

    [(MTBaseEpisodeListManifest *)v5 setInitialEpisodeUuid:v4];
    [(MTBaseEpisodeListManifest *)v5 setIsInitialPrepare:1];
  }

  return v5;
}

- (MTBaseEpisodeListManifest)init
{
}

- (unint64_t)count
{
  v2 = [(MTBaseEpisodeListManifest *)self episodeUuids];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if ([(MTBaseEpisodeListManifest *)self count] <= a3)
  {
    id v10 = 0;
  }
  else
  {
    v5 = [(MTBaseEpisodeListManifest *)self episodeUuids];
    id v6 = [v5 objectAtIndex:a3];

    v7 = [(MTBaseEpisodeListManifest *)self uuidToPlayerItemMap];
    objc_sync_enter(v7);
    objc_super v8 = [(MTBaseEpisodeListManifest *)self uuidToPlayerItemMap];
    v9 = [v8 objectForKey:v6];

    objc_sync_exit(v7);
    if (v9)
    {
      [v9 setManifestIndex:a3];
      id v10 = v9;
    }
    else
    {
      v11 = [(MTBaseEpisodeListManifest *)self uuidToManagedObjectIDMap];
      objc_sync_enter(v11);
      v12 = [(MTBaseEpisodeListManifest *)self uuidToManagedObjectIDMap];
      v13 = [v12 objectForKey:v6];

      objc_sync_exit(v11);
      v14 = objc_opt_class();
      if (v13) {
        [v14 mediaItemForEpisodeWithManagedObjectID:v13];
      }
      else {
      id v10 = [v14 mediaItemForEpisodeWithUUID:v6];
      }
      [v10 setManifestIndex:a3];
      [v10 setManifest:self];
      if (v10)
      {
        v15 = [(MTBaseEpisodeListManifest *)self uuidToPlayerItemMap];
        objc_sync_enter(v15);
        v16 = [(MTBaseEpisodeListManifest *)self uuidToPlayerItemMap];
        [v16 setObject:v10 forKey:v6];

        objc_sync_exit(v15);
      }
    }
  }

  return v10;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[MTDB sharedInstance];
    id v6 = [v5 mainOrPrivateContext];

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001374DC;
    v7[3] = &unk_10054E398;
    v7[4] = self;
    id v8 = v4;
    [v6 performBlockAndWait:v7];
  }
}

+ (void)episodeUuidForActivity:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 itemIdentifier];
  if ([v7 length])
  {
    id v8 = [v5 containerIdentifier];
    if ([v8 length]) {
      +[MTEpisode predicateForEpisodeGuid:v7 onFeedURL:v8];
    }
    else {
    v9 = +[MTEpisode predicateForEpisodeGuid:v7];
    }
    id v10 = +[MTDB sharedInstance];
    v11 = [v10 playbackContext];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100137698;
    v14[3] = &unk_10054FFB0;
    id v15 = v11;
    id v16 = v9;
    id v17 = v6;
    id v12 = v9;
    id v13 = v11;
    [v13 performBlock:v14];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

+ (id)mediaItemForEpisodeWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10005712C;
  v20 = sub_100057360;
  id v21 = 0;
  id v5 = +[MTDB sharedInstance];
  id v6 = [v5 mainOrPrivateContext];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100137958;
  v11[3] = &unk_100551B70;
  id v7 = v6;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  v14 = &v16;
  id v15 = a1;
  [v7 performBlockAndWait:v11];
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

+ (id)mediaItemForEpisodeWithManagedObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10005712C;
  v20 = sub_100057360;
  id v21 = 0;
  id v5 = +[MTDB sharedInstance];
  id v6 = [v5 mainOrPrivateContext];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100137B3C;
  v11[3] = &unk_100551B70;
  id v7 = v6;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  v14 = &v16;
  id v15 = a1;
  [v7 performBlockAndWait:v11];
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

- (void)postManifestDidChangeNotification
{
  uint64_t v3 = [(MTBaseEpisodeListManifest *)self currentItem];
  if (v3)
  {
    id v4 = (void *)v3;
    episodeUuids = self->_episodeUuids;
    id v6 = [(MTBaseEpisodeListManifest *)self currentItem];
    id v7 = [v6 episodeUuid];
    LOBYTE(episodeUuids) = [(NSArray *)episodeUuids containsObject:v7];

    if ((episodeUuids & 1) == 0) {
      [(MTBaseEpisodeListManifest *)self setCurrentIndex:0x7FFFFFFFFFFFFFFFLL];
    }
  }
  if ([(MTBaseEpisodeListManifest *)self count])
  {
    id v8 = [(MTBaseEpisodeListManifest *)self currentItem];
    if (v8)
    {
    }
    else if ([(MTBaseEpisodeListManifest *)self isInitialPrepare])
    {
      id v9 = [(MTBaseEpisodeListManifest *)self initialEpisodeUuid];

      if (v9)
      {
        id v10 = self->_episodeUuids;
        v11 = [(MTBaseEpisodeListManifest *)self initialEpisodeUuid];
        [(MTBaseEpisodeListManifest *)self setCurrentIndex:[(NSArray *)v10 indexOfObject:v11]];
      }
      else if ([(MTBaseEpisodeListManifest *)self defaultToInitialIndexZero])
      {
        [(MTBaseEpisodeListManifest *)self setCurrentIndex:0];
      }
      [(MTBaseEpisodeListManifest *)self setIsInitialPrepare:0];
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)MTBaseEpisodeListManifest;
  [(MTBaseEpisodeListManifest *)&v12 postManifestDidChangeNotification];
}

- (BOOL)defaultToInitialIndexZero
{
  return 1;
}

- (id)_predicateForFilteringExplicitEpisodes
{
  v2 = +[NSPredicate truePredicate];
  if ((+[PFRestrictionsController isExplicitContentAllowed] & 1) == 0)
  {
    uint64_t v3 = +[MTEpisode predicateForExplicit:0];

    v2 = (void *)v3;
  }

  return v2;
}

+ (id)_mediaItemForEpisode:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [[MTPlayerItem alloc] initWithEpisode:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSString)initialEpisodeUuid
{
  return self->_initialEpisodeUuid;
}

- (void)setInitialEpisodeUuid:(id)a3
{
}

- (NSMutableDictionary)uuidToPlayerItemMap
{
  return self->_uuidToPlayerItemMap;
}

- (void)setUuidToPlayerItemMap:(id)a3
{
}

- (BOOL)isInitialPrepare
{
  return self->_isInitialPrepare;
}

- (void)setIsInitialPrepare:(BOOL)a3
{
  self->_isInitialPrepare = a3;
}

- (NSArray)episodeUuids
{
  return self->_episodeUuids;
}

- (void)setEpisodeUuids:(id)a3
{
}

- (NSDictionary)uuidToManagedObjectIDMap
{
  return self->_uuidToManagedObjectIDMap;
}

- (void)setUuidToManagedObjectIDMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidToManagedObjectIDMap, 0);
  objc_storeStrong((id *)&self->_episodeUuids, 0);
  objc_storeStrong((id *)&self->_uuidToPlayerItemMap, 0);

  objc_storeStrong((id *)&self->_initialEpisodeUuid, 0);
}

@end