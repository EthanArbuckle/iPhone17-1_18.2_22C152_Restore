@interface RouteStartEndItemSource
- (NSArray)allKeysetsForEndLocations;
- (NSArray)endLocations;
- (NSSet)keysForStartLocation;
- (RouteStartEndItemSource)init;
- (SearchResult)startLocation;
- (id)allItems;
- (id)itemMatchingLocation:(id)a3;
- (unint64_t)visibilityMask;
- (void)_updateItemVisibility;
- (void)clearStartAndEndLocations;
- (void)setStartLocation:(id)a3 endLocation:(id)a4;
- (void)setStartLocation:(id)a3 endLocations:(id)a4;
- (void)setVisibilityMask:(unint64_t)a3;
@end

@implementation RouteStartEndItemSource

- (RouteStartEndItemSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)RouteStartEndItemSource;
  v2 = [(RouteStartEndItemSource *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("RouteStartEndItemSource.lock", v3);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (id)allItems
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100103C0C;
  v11 = sub_100104690;
  id v12 = +[NSMutableArray arrayWithCapacity:2];
  lockQueue = self->_lockQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10010527C;
  v6[3] = &unk_1012E67C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(lockQueue, v6);
  id v4 = [(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)clearStartAndEndLocations
{
  v3 = self->_startLocation;
  id v4 = self->_endLocations;
  startLocation = self->_startLocation;
  self->_startLocation = 0;

  endLocations = self->_endLocations;
  self->_endLocations = 0;

  lockQueue = self->_lockQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100451DA0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_sync(lockQueue, block);
  if (v3 || [(NSArray *)v4 count]) {
    [(PersonalizedItemSource *)self _notifyObserversItemsDidChange];
  }
}

- (void)_updateItemVisibility
{
  [(RouteStartEndItem *)self->_startItem setShouldBeHiddenFromMap:([(RouteStartEndItemSource *)self visibilityMask] & 1) == 0];
  endItems = self->_endItems;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100451E9C;
  v4[3] = &unk_1012EAA58;
  v4[4] = self;
  [(NSArray *)endItems enumerateObjectsUsingBlock:v4];
}

- (void)setVisibilityMask:(unint64_t)a3
{
  if (self->_visibilityMask != a3)
  {
    self->_visibilityMask = a3;
    [(RouteStartEndItemSource *)self _updateItemVisibility];
    [(PersonalizedItemSource *)self _notifyObserversItemsDidChange];
  }
}

- (void)setStartLocation:(id)a3 endLocation:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = v6;
    id v8 = a3;
    id v9 = +[NSArray arrayWithObjects:&v10 count:1];
    -[RouteStartEndItemSource setStartLocation:endLocations:](self, "setStartLocation:endLocations:", v8, v9, v10);
  }
  else
  {
    id v9 = a3;
    [(RouteStartEndItemSource *)self setStartLocation:v9 endLocations:0];
  }
}

- (void)setStartLocation:(id)a3 endLocations:(id)a4
{
  uint64_t v7 = (SearchResult *)a3;
  id v8 = a4;
  id v9 = v8;
  p_startLocation = &self->_startLocation;
  if (self->_startLocation != v7
    || (endLocations = self->_endLocations,
        unint64_t v13 = (unint64_t)v8,
        id v14 = endLocations,
        v13 | (unint64_t)v14)
    && (v15 = v14,
        unsigned __int8 v16 = [(id)v13 isEqual:v14],
        v15,
        (id)v13,
        (v16 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_startLocation, a3);
    objc_storeStrong((id *)&self->_endLocations, a4);
    if (*p_startLocation && ![(SearchResult *)*p_startLocation isDynamicCurrentLocation]) {
      v11 = [[RouteStartEndItem alloc] initWithSearchResult:*p_startLocation routeFeatureType:1];
    }
    else {
      v11 = 0;
    }
    v17 = sub_100099700(self->_endLocations, &stru_1012EAA98);
    lockQueue = self->_lockQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100452284;
    block[3] = &unk_1012E66E0;
    block[4] = self;
    v22 = v11;
    id v23 = v17;
    id v19 = v17;
    v20 = v11;
    dispatch_sync(lockQueue, block);
    [(PersonalizedItemSource *)self _notifyObserversItemsDidChange];
  }
}

- (NSSet)keysForStartLocation
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100103C0C;
  id v10 = sub_100104690;
  id v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004523DC;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (NSArray)allKeysetsForEndLocations
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  lockQueue = self->_lockQueue;
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100452514;
  id v11 = &unk_1012E5D58;
  id v12 = self;
  id v13 = v3;
  id v5 = v3;
  dispatch_sync(lockQueue, &v8);
  id v6 = [v5 copy:v8, v9, v10, v11, v12];

  return (NSArray *)v6;
}

- (id)itemMatchingLocation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 isEqualToSearchResult:self->_startLocation forPurpose:5])
    {
      id v6 = self->_startItem;
    }
    else
    {
      uint64_t v13 = 0;
      id v14 = &v13;
      uint64_t v15 = 0x3032000000;
      unsigned __int8 v16 = sub_100103C0C;
      v17 = sub_100104690;
      id v18 = 0;
      endLocations = self->_endLocations;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1004527C0;
      v9[3] = &unk_1012EAAC0;
      id v11 = self;
      id v12 = &v13;
      id v10 = v5;
      [(NSArray *)endLocations enumerateObjectsUsingBlock:v9];
      id v6 = (RouteStartEndItem *)(id)v14[5];

      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (SearchResult)startLocation
{
  return self->_startLocation;
}

- (NSArray)endLocations
{
  return self->_endLocations;
}

- (unint64_t)visibilityMask
{
  return self->_visibilityMask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endLocations, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_endItems, 0);

  objc_storeStrong((id *)&self->_startItem, 0);
}

@end