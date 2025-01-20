@interface BKAssetArrayController
- (BOOL)_filterAsset:(id)a3;
- (id)arrangeObjects:(id)a3;
- (id)filter;
- (void)setFilter:(id)a3;
@end

@implementation BKAssetArrayController

- (BOOL)_filterAsset:(id)a3
{
  filter = (uint64_t (**)(id, id))self->_filter;
  if (filter) {
    return filter[2](filter, a3);
  }
  else {
    return 1;
  }
}

- (id)arrangeObjects:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_filter)
  {
    id v5 = +[NSMutableArray array];
    v6 = +[BKLibraryManager defaultManager];
    v7 = [v6 uiChildContext];
    v8 = [v6 libraryAssetsWithAssetIDsContainedInList:v4 tempAssetIDs:0 inManagedObjectContext:v7];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (-[BKAssetArrayController _filterAsset:](self, "_filterAsset:", v14, (void)v17))
          {
            v15 = [v14 assetID];
            [v5 addObject:v15];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end