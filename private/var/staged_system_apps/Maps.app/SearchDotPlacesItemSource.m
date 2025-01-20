@interface SearchDotPlacesItemSource
- (BOOL)shouldHideSearchDotPlaces;
- (NSArray)searchDotPlaces;
- (OS_dispatch_queue)lockQueue;
- (SearchDotPlacesItemSource)init;
- (id)allItems;
- (void)setLockQueue:(id)a3;
- (void)setSearchDotPlaces:(id)a3;
- (void)setShouldHideSearchDotPlaces:(BOOL)a3;
@end

@implementation SearchDotPlacesItemSource

- (SearchDotPlacesItemSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)SearchDotPlacesItemSource;
  v2 = [(SearchDotPlacesItemSource *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("SearchDotPlacesItemSource.lock", v3);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (id)allItems
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100104350;
  v10 = sub_100104A18;
  id v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100030144;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setSearchDotPlaces:(id)a3
{
  id v4 = a3;
  v5 = (NSArray *)[v4 copy];
  searchDotPlaces = self->_searchDotPlaces;
  self->_searchDotPlaces = v5;

  lockQueue = self->_lockQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B036F4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_sync(lockQueue, block);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100B0370C;
  v13[3] = &unk_101317F60;
  v13[4] = self;
  id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v4 count]];
  id v14 = v8;
  [v4 enumerateObjectsUsingBlock:v13];

  v9 = self->_lockQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100B037A4;
  v11[3] = &unk_1012E5D58;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_sync(v9, v11);
  [(PersonalizedItemSource *)self _notifyObserversItemsDidChange];
}

- (void)setShouldHideSearchDotPlaces:(BOOL)a3
{
  if (self->_shouldHideSearchDotPlaces != a3)
  {
    BOOL v3 = a3;
    self->_shouldHideSearchDotPlaces = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = [(SearchDotPlacesItemSource *)self allItems];
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) setShouldBeHiddenFromMap:v3];
        }
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(PersonalizedItemSource *)self _notifyObserversItemsDidChange];
  }
}

- (NSArray)searchDotPlaces
{
  return self->_searchDotPlaces;
}

- (BOOL)shouldHideSearchDotPlaces
{
  return self->_shouldHideSearchDotPlaces;
}

- (OS_dispatch_queue)lockQueue
{
  return self->_lockQueue;
}

- (void)setLockQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_searchDotPlaces, 0);

  objc_storeStrong((id *)&self->_allItems, 0);
}

@end