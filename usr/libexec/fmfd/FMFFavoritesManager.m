@interface FMFFavoritesManager
- (FMFFavoritesManager)init;
- (NSArray)favoriteHandles;
- (NSArray)favorites;
- (NSArray)favoritesData;
- (OS_dispatch_queue)favoritesHandlesUpdateQueue;
- (id)favoritesDataFromHandles:(id)a3;
- (id)favoritesHandlesInHandles:(id)a3;
- (id)handles:(id)a3 minusHandle:(id)a4;
- (void)addFavorite:(id)a3;
- (void)removeFavorite:(id)a3;
- (void)reset;
- (void)setFavoriteHandles:(id)a3;
- (void)setFavoritesData:(id)a3;
- (void)setFavoritesHandlesUpdateQueue:(id)a3;
- (void)updateHandles:(id)a3 withFavoriteArray:(id)a4;
- (void)updateHandlesWithFavorites:(id)a3;
- (void)updateWithCachedHandles:(id)a3;
@end

@implementation FMFFavoritesManager

- (FMFFavoritesManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)FMFFavoritesManager;
  v2 = [(FMFFavoritesManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    favoritesData = v2->_favoritesData;
    v2->_favoritesData = (NSArray *)v3;

    uint64_t v5 = objc_opt_new();
    favoriteHandles = v2->_favoriteHandles;
    v2->_favoriteHandles = (NSArray *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.icloud.fmfd.favoritemanager.favoriteshandlesupdatequeue", 0);
    favoritesHandlesUpdateQueue = v2->_favoritesHandlesUpdateQueue;
    v2->_favoritesHandlesUpdateQueue = (OS_dispatch_queue *)v7;

    v9 = sub_100005560();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMFFavoritesManager: initialized", v11, 2u);
    }
  }
  return v2;
}

- (void)reset
{
  uint64_t v3 = [(FMFFavoritesManager *)self favoritesHandlesUpdateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051458;
  block[3] = &unk_1000A14E8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)addFavorite:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFFavoritesManager: addFavoriteHandle: %@", buf, 0xCu);
  }

  v6 = [(FMFFavoritesManager *)self favoritesHandlesUpdateQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000515E0;
  v8[3] = &unk_1000A1468;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)removeFavorite:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFFavoritesManager: removeFavoriteHandle: %@", buf, 0xCu);
  }

  v6 = [(FMFFavoritesManager *)self favoritesHandlesUpdateQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100051880;
  v8[3] = &unk_1000A1468;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)updateHandles:(id)a3 withFavoriteArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100005560();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 allKeys];
    *(_DWORD *)buf = 134218240;
    id v17 = [v9 count];
    __int16 v18 = 2048;
    id v19 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMFFavoritesManager: updateHandles: (%ld) withFavorites: (%ld)", buf, 0x16u);
  }
  v10 = [(FMFFavoritesManager *)self favoritesHandlesUpdateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051BDC;
  block[3] = &unk_1000A28B8;
  block[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v10, block);
}

- (void)updateHandlesWithFavorites:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v12 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFFavoritesManager updateHandlesWithFavorites: (%ld)", buf, 0xCu);
  }

  id v6 = [(FMFFavoritesManager *)self favoritesHandlesUpdateQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100051D54;
  v8[3] = &unk_1000A1468;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)updateWithCachedHandles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v4;
    __int16 v12 = 2048;
    id v13 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFFavoritesSequencer updateWithCachedHandles: %@ (%ld)", buf, 0x16u);
  }

  id v6 = [(FMFFavoritesManager *)self favoritesHandlesUpdateQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100052110;
  v8[3] = &unk_1000A1468;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (NSArray)favorites
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100007678;
  id v11 = sub_100007600;
  id v12 = 0;
  uint64_t v3 = [(FMFFavoritesManager *)self favoritesHandlesUpdateQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100052328;
  v6[3] = &unk_1000A1F78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (id)favoritesHandlesInHandles:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithFormat:@"favoriteOrder != nil"];
  uint64_t v5 = [v3 filteredSetUsingPredicate:v4];

  id v6 = +[NSSortDescriptor sortDescriptorWithKey:@"favoriteOrder" ascending:1];
  uint64_t v7 = +[NSArray arrayWithObject:v6];
  v8 = [v5 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (id)favoritesDataFromHandles:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v9 serverId];
        id v11 = [v9 favoriteOrder];
        id v12 = +[NSDictionary dictionaryWithObjectsAndKeys:v10, @"id", v11, @"order", 0];

        [v4 addObject:v12];
      }
      id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)handles:(id)a3 minusHandle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = [v13 serverId:v18];
        long long v15 = [v6 serverId];
        unsigned __int8 v16 = [v14 isEqualToString:v15];

        if ((v16 & 1) == 0) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

- (NSArray)favoritesData
{
  return self->_favoritesData;
}

- (void)setFavoritesData:(id)a3
{
}

- (NSArray)favoriteHandles
{
  return self->_favoriteHandles;
}

- (void)setFavoriteHandles:(id)a3
{
}

- (OS_dispatch_queue)favoritesHandlesUpdateQueue
{
  return self->_favoritesHandlesUpdateQueue;
}

- (void)setFavoritesHandlesUpdateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoritesHandlesUpdateQueue, 0);
  objc_storeStrong((id *)&self->_favoriteHandles, 0);

  objc_storeStrong((id *)&self->_favoritesData, 0);
}

@end