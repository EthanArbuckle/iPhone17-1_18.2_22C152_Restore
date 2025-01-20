@interface FREditorialItemEntryManager
- (FCKeyValueStore)localStore;
- (FREditorialItemEntryManager)initWithLocalStore:(id)a3;
- (NSArray)orderedEditorialItemIDs;
- (NSMutableDictionary)editorialItemsByID;
- (id)_editorialEntryIDForIdentifier:(id)a3;
- (id)cachedArticleIDs;
- (void)addEditorialItem:(id)a3;
- (void)addOrderedEditorialItemIDs:(id)a3;
- (void)loadLocalCachesFromStore;
- (void)removeItemWithIdentifier:(id)a3;
- (void)setEditorialItemsByID:(id)a3;
- (void)setOrderedEditorialItemIDs:(id)a3;
@end

@implementation FREditorialItemEntryManager

- (FREditorialItemEntryManager)initWithLocalStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FREditorialItemEntryManager;
  v6 = [(FREditorialItemEntryManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_localStore, a3);
  }

  return v7;
}

- (void)loadLocalCachesFromStore
{
  v3 = +[NSMutableDictionary dictionary];
  [(FREditorialItemEntryManager *)self setEditorialItemsByID:v3];

  v4 = +[NSMutableArray array];
  [(FREditorialItemEntryManager *)self setOrderedEditorialItemIDs:v4];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(FREditorialItemEntryManager *)self localStore];
  v6 = [v5 allKeys];

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        v12 = [(FREditorialItemEntryManager *)self localStore];
        v13 = [v12 objectForKey:v11];
        v14 = FCDynamicCast();

        if (!v14)
        {
          objc_opt_class();
          v18 = [(FREditorialItemEntryManager *)self localStore];
          v19 = [v18 objectForKey:v11];
          FCDynamicCast();
          v15 = (FREditorialItemEntry *)objc_claimAutoreleasedReturnValue();

          if (!v15 || ![v11 isEqualToString:@"editorialOrderedItems"]) {
            goto LABEL_14;
          }
          id v16 = [(FREditorialItemEntry *)v15 copy];
          [(FREditorialItemEntryManager *)self setOrderedEditorialItemIDs:v16];
          goto LABEL_13;
        }
        if (![v11 hasPrefix:@"ed-"]) {
          goto LABEL_15;
        }
        v15 = [[FREditorialItemEntry alloc] initWithEntryID:v11 dictionaryRepresentation:v14];
        if (v15)
        {
          id v16 = [(FREditorialItemEntryManager *)self editorialItemsByID];
          v17 = [(FREditorialItemEntry *)v15 editorialItemID];
          [v16 setObject:v15 forKey:v17];

LABEL_13:
        }
LABEL_14:

LABEL_15:
      }
      id v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
}

- (FCKeyValueStore)localStore
{
  return self->_localStore;
}

- (void)setOrderedEditorialItemIDs:(id)a3
{
}

- (void)setEditorialItemsByID:(id)a3
{
}

- (NSMutableDictionary)editorialItemsByID
{
  return self->_editorialItemsByID;
}

- (void)addEditorialItem:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  id v5 = [(FREditorialItemEntryManager *)self editorialItemsByID];
  v6 = [v4 editorialItemID];
  [v5 setObject:v4 forKey:v6];

  id v9 = [(FREditorialItemEntryManager *)self localStore];
  id v7 = [v4 dictionaryRepresentation];
  id v8 = [v4 entryID];

  [v9 setObject:v7 forKey:v8];
}

- (void)removeItemWithIdentifier:(id)a3
{
  id v7 = a3;
  +[NSThread isMainThread];
  if (v7)
  {
    id v4 = [(FREditorialItemEntryManager *)self editorialItemsByID];
    [v4 removeObjectForKey:v7];

    id v5 = [(FREditorialItemEntryManager *)self localStore];
    v6 = [(FREditorialItemEntryManager *)self _editorialEntryIDForIdentifier:v7];
    [v5 removeObjectForKey:v6];
  }
}

- (void)addOrderedEditorialItemIDs:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  id v5 = [v4 copy];
  [(FREditorialItemEntryManager *)self setOrderedEditorialItemIDs:v5];

  id v6 = [(FREditorialItemEntryManager *)self localStore];
  [v6 setObject:v4 forKey:@"editorialOrderedItems"];
}

- (id)_editorialEntryIDForIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"%@%@", @"ed-", a3];
}

- (id)cachedArticleIDs
{
  +[NSThread isMainThread];
  v3 = +[NSMutableArray array];
  id v4 = [(FREditorialItemEntryManager *)self editorialItemsByID];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006B140;
  v7[3] = &unk_1000C8110;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (NSArray)orderedEditorialItemIDs
{
  return self->_orderedEditorialItemIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_orderedEditorialItemIDs, 0);

  objc_storeStrong((id *)&self->_editorialItemsByID, 0);
}

@end