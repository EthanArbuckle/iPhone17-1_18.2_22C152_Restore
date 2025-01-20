@interface BrowseManagerContentCache
- (BOOL)_needsRefreshWithTraits:(id)a3;
- (BOOL)_traitsAreValid:(id)a3;
- (BOOL)needsRefresh;
- (BOOL)writesToDisk;
- (BrowseManagerContentCache)init;
- (GEOMapServiceTraits)latestTraits;
- (NSArray)categories;
- (NSArray)geoCategories;
- (NSMapTable)categoryResultsCache;
- (NSString)diskCachingKey;
- (id)_diskCachedCategories;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)readCategoriesFromDiskIfNeeded;
- (void)setCategories:(id)a3;
- (void)setCategoryResultsCache:(id)a3;
- (void)setDiskCachingKey:(id)a3;
- (void)setGeoCategories:(id)a3;
- (void)setLatestTraits:(id)a3;
- (void)setNeedsRefresh:(BOOL)a3;
- (void)setWritesToDisk:(BOOL)a3;
- (void)updateCacheWithBlock:(id)a3;
- (void)writeCategories;
@end

@implementation BrowseManagerContentCache

- (BrowseManagerContentCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)BrowseManagerContentCache;
  v2 = [(BrowseManagerContentCache *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_writesToDisk = 257;
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"didReceiveMemoryWarning" name:UIApplicationDidReceiveMemoryWarningNotification object:0];
  }
  return v3;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->_needsRefresh = a3;
}

- (void)setDiskCachingKey:(id)a3
{
}

- (GEOMapServiceTraits)latestTraits
{
  return self->_latestTraits;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BrowseManagerContentCache;
  [(BrowseManagerContentCache *)&v4 dealloc];
}

- (NSMapTable)categoryResultsCache
{
  categoryResultsCache = self->_categoryResultsCache;
  if (!categoryResultsCache)
  {
    objc_super v4 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:0];
    v5 = self->_categoryResultsCache;
    self->_categoryResultsCache = v4;

    categoryResultsCache = self->_categoryResultsCache;
  }

  return categoryResultsCache;
}

- (void)setGeoCategories:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008F7CBC;
  v4[3] = &unk_1013002A0;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(BrowseManagerContentCache *)v5 updateCacheWithBlock:v4];
}

- (void)setLatestTraits:(id)a3
{
  id v7 = a3;
  if (-[BrowseManagerContentCache _traitsAreValid:](self, "_traitsAreValid:"))
  {
    id v4 = v7;
  }
  else
  {

    id v4 = 0;
  }
  id v8 = v4;
  [(BrowseManagerContentCache *)self setNeedsRefresh:[(BrowseManagerContentCache *)self _needsRefreshWithTraits:v4]];
  v5 = (GEOMapServiceTraits *)[v8 copy];
  latestTraits = self->_latestTraits;
  self->_latestTraits = v5;

  [(GEOMapServiceTraits *)self->_latestTraits setPhotosCount:1];
}

- (BOOL)_traitsAreValid:(id)a3
{
  id v3 = a3;
  if ([v3 hasDeviceLocation]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 hasMapRegion];
  }

  return v4;
}

- (BOOL)_needsRefreshWithTraits:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 navigating])
    {
      id v6 = sub_1008F8168();
      BOOL v7 = 1;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        __int16 v33 = 0;
        id v8 = "Refresh categories. Reason: navigating";
        v9 = (uint8_t *)&v33;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v8, v9, 2u);
      }
    }
    else
    {
      unsigned int v10 = [(GEOMapServiceTraits *)self->_latestTraits mode];
      if (v10 == [v5 mode])
      {
        v11 = [(GEOMapServiceTraits *)self->_latestTraits mapRegion];
        GEOMapRectForMapRegion();
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;

        v20 = [v5 mapRegion];
        GEOMapRectForMapRegion();
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;

        if (self->_latestTraits && v22 == v13 && v24 == v15 && v26 == v17 && v28 == v19)
        {
          id v6 = sub_1008F8168();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v30 = 0;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Did not refresh categories", v30, 2u);
          }
          BOOL v7 = 0;
        }
        else
        {
          id v6 = sub_1008F8168();
          BOOL v7 = 1;
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            id v8 = "Refresh categories. Reason: region is different";
            v9 = buf;
            goto LABEL_20;
          }
        }
      }
      else
      {
        id v6 = sub_1008F8168();
        BOOL v7 = 1;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          __int16 v32 = 0;
          id v8 = "Refresh categories. Reason: traits.mode has changed";
          v9 = (uint8_t *)&v32;
          goto LABEL_20;
        }
      }
    }
  }
  else
  {
    id v6 = sub_1008F8168();
    BOOL v7 = 1;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      __int16 v34 = 0;
      id v8 = "Refresh categories. Reason: nil traits";
      v9 = (uint8_t *)&v34;
      goto LABEL_20;
    }
  }

  return v7;
}

- (void)updateCacheWithBlock:(id)a3
{
  id v4 = (void (**)(id, BrowseManagerContentCache *))a3;
  if (v4)
  {
    id v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    v6[2](v6, v5);
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)didReceiveMemoryWarning
{
  id v2 = [(BrowseManagerContentCache *)self categoryResultsCache];
  [v2 removeAllObjects];
}

- (void)writeCategories
{
  if ([(BrowseManagerContentCache *)self writesToDisk])
  {
    id v3 = [(NSArray *)self->_geoCategories copy];
    id v4 = dispatch_get_global_queue(-32768, 0);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1008F8348;
    v6[3] = &unk_1012E5D58;
    id v7 = v3;
    id v8 = self;
    id v5 = v3;
    dispatch_async(v4, v6);
  }
}

- (id)_diskCachedCategories
{
  id v2 = [(BrowseManagerContentCache *)self diskCachingKey];
  id v3 = sub_1008F84E4(v2);

  if (v3
    && (+[NSFileManager defaultManager],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v3 path],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v4 fileExistsAtPath:v5],
        v5,
        v4,
        v6))
  {
    id v7 = +[NSArray arrayWithContentsOfURL:v3];
    id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v15 = objc_alloc((Class)GEOSearchCategoryStorage);
          id v16 = [v15 initWithData:v14];
          id v17 = [objc_alloc((Class)GEOSearchCategory) initWithStorage:v16];
          [v8 addObject:v17];
        }
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }
  id v18 = [v8 copy:v20];

  return v18;
}

- (void)readCategoriesFromDiskIfNeeded
{
  id v3 = [(BrowseManagerContentCache *)self geoCategories];

  if (!v3)
  {
    id v4 = [(BrowseManagerContentCache *)self _diskCachedCategories];
    [(BrowseManagerContentCache *)self setGeoCategories:v4];
  }
}

- (void)setWritesToDisk:(BOOL)a3
{
  if (self->_writesToDisk != a3)
  {
    self->_writesToDisk = a3;
    if (!a3)
    {
      id v8 = +[NSFileManager defaultManager];
      id v4 = [(BrowseManagerContentCache *)self diskCachingKey];
      id v5 = sub_1008F84E4(v4);

      unsigned int v6 = [v5 path];
      unsigned int v7 = [v8 fileExistsAtPath:v6];

      if (v7) {
        [v8 removeItemAtURL:v5 error:0];
      }
    }
  }
}

- (BOOL)writesToDisk
{
  return self->_writesToDisk;
}

- (NSString)diskCachingKey
{
  return self->_diskCachingKey;
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (NSArray)geoCategories
{
  return self->_geoCategories;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (void)setCategoryResultsCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryResultsCache, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_geoCategories, 0);
  objc_storeStrong((id *)&self->_diskCachingKey, 0);

  objc_storeStrong((id *)&self->_latestTraits, 0);
}

@end