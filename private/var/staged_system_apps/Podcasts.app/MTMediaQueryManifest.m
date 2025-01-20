@interface MTMediaQueryManifest
- (MPMediaQuery)query;
- (MTMediaQueryManifest)initWithMediaQuery:(id)a3 initialItem:(id)a4;
- (NSArray)persistentIds;
- (NSMutableDictionary)pidToUuidMapping;
- (void)_processResults:(id)a3;
- (void)_updateSortOrder;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)setPersistentIds:(id)a3;
- (void)setPidToUuidMapping:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation MTMediaQueryManifest

- (MTMediaQueryManifest)initWithMediaQuery:(id)a3 initialItem:(id)a4
{
  id v25 = a3;
  id v23 = a4;
  v5 = +[MTMLMediaItem itemWithMPMediaItem:](MTMLMediaItem, "itemWithMPMediaItem:");
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_100056F3C;
  v39 = sub_100057268;
  id v40 = 0;
  v6 = +[MTDB sharedInstance];
  v7 = [v6 mainOrPrivateContext];

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000A1A34;
  v31[3] = &unk_10054DA00;
  id v8 = v7;
  id v32 = v8;
  id v9 = v5;
  id v33 = v9;
  v34 = &v35;
  [v8 performBlockAndWait:v31];
  v10 = [v25 items];
  id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = +[MTMLMediaItem itemWithMPMediaItem:*(void *)(*((void *)&v27 + 1) + 8 * (void)v15)];
        v17 = [v16 persistentId];
        [v11 addObject:v17];

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v27 objects:v41 count:16];
    }
    while (v13);
  }

  v18 = +[NSPredicate predicateWithFormat:@"%K IN %@", kEpisodePersistentID, v11];
  uint64_t v19 = v36[5];
  v26.receiver = self;
  v26.super_class = (Class)MTMediaQueryManifest;
  v20 = [(MTPredicateManifest *)&v26 initWithInitialEpisodeUuid:v19 predicateToTrack:v18 sortDescriptors:0];
  v21 = v20;
  if (v20)
  {
    [(MTMediaQueryManifest *)v20 setQuery:v25];
    [(MTMediaQueryManifest *)v21 setPersistentIds:v11];
  }

  _Block_object_dispose(&v35, 8);
  return v21;
}

- (void)_processResults:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [(MTMediaQueryManifest *)self setPidToUuidMapping:v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v10);
        id v12 = [(MTMediaQueryManifest *)self pidToUuidMapping];
        id v13 = [v11 uuid];
        uint64_t v14 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 persistentID]);
        [v12 setObject:v13 forKey:v14];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [(MTMediaQueryManifest *)self _updateSortOrder];
}

- (void)_updateSortOrder
{
  id v3 = objc_alloc((Class)NSMutableArray);
  id v4 = [(MTMediaQueryManifest *)self persistentIds];
  id v5 = [v3 initWithCapacity:[v4 count]];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(MTMediaQueryManifest *)self persistentIds];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v10);
        id v12 = [(MTMediaQueryManifest *)self pidToUuidMapping];
        id v13 = [v12 objectForKey:v11];

        if (v13) {
          [v5 addObject:v13];
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(MTPredicateManifest *)self setExplicitSortOrder:v5];
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (a6 == 2)
  {
    long long v15 = [(MTMediaQueryManifest *)self pidToUuidMapping];
    long long v16 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 persistentID]);
    [v15 removeObjectForKey:v16];
  }
  else
  {
    if (a6 != 1) {
      goto LABEL_6;
    }
    long long v15 = [(MTMediaQueryManifest *)self pidToUuidMapping];
    long long v16 = [v12 uuid];
    long long v17 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 persistentID]);
    long long v18 = [v17 stringValue];
    [v15 setValue:v16 forKey:v18];
  }
LABEL_6:
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  [(MTMediaQueryManifest *)self _updateSortOrder];
  v5.receiver = self;
  v5.super_class = (Class)MTMediaQueryManifest;
  [(MTPredicateManifest *)&v5 controllerDidChangeContent:v4];
}

- (MPMediaQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSArray)persistentIds
{
  return self->_persistentIds;
}

- (void)setPersistentIds:(id)a3
{
}

- (NSMutableDictionary)pidToUuidMapping
{
  return self->_pidToUuidMapping;
}

- (void)setPidToUuidMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pidToUuidMapping, 0);
  objc_storeStrong((id *)&self->_persistentIds, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end