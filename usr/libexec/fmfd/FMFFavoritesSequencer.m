@interface FMFFavoritesSequencer
- (FMFFavoritesManager)favoritesManager;
- (FMFFavoritesSequencer)init;
- (FMFSaveFavoritesOperations)currentOperation;
- (NSArray)favorites;
- (NSMutableArray)saveFavoritesOperation;
- (OS_dispatch_queue)saveFavoritesOperationExecutionQueue;
- (OS_dispatch_queue)saveFavoritesOperationUpdateQueue;
- (void)addFavorite:(id)a3 clientSession:(id)a4 completion:(id)a5;
- (void)executeNextOperation;
- (void)removeFavorite:(id)a3 clientSession:(id)a4 completion:(id)a5;
- (void)reset;
- (void)setCurrentOperation:(id)a3;
- (void)setFavoritesManager:(id)a3;
- (void)setSaveFavoritesOperation:(id)a3;
- (void)setSaveFavoritesOperationExecutionQueue:(id)a3;
- (void)setSaveFavoritesOperationUpdateQueue:(id)a3;
- (void)updateHandles:(id)a3 withFavoriteArray:(id)a4;
- (void)updateHandlesWithFavorites:(id)a3;
- (void)updateWithCachedHandles:(id)a3;
@end

@implementation FMFFavoritesSequencer

- (FMFFavoritesSequencer)init
{
  v14.receiver = self;
  v14.super_class = (Class)FMFFavoritesSequencer;
  v2 = [(FMFFavoritesSequencer *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    favoritesManager = v2->_favoritesManager;
    v2->_favoritesManager = (FMFFavoritesManager *)v3;

    uint64_t v5 = objc_opt_new();
    saveFavoritesOperation = v2->_saveFavoritesOperation;
    v2->_saveFavoritesOperation = (NSMutableArray *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.icloud.fmfd.favoritesequencer.favoriteOperationUpdateQueue", 0);
    saveFavoritesOperationUpdateQueue = v2->_saveFavoritesOperationUpdateQueue;
    v2->_saveFavoritesOperationUpdateQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.icloud.fmfd.favoritesequencer.favoriteOperationExecutionQueue", 0);
    saveFavoritesOperationExecutionQueue = v2->_saveFavoritesOperationExecutionQueue;
    v2->_saveFavoritesOperationExecutionQueue = (OS_dispatch_queue *)v9;

    v11 = sub_100005560();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMFFavoritesSequencer: initialized", v13, 2u);
    }
  }
  return v2;
}

- (void)reset
{
  uint64_t v3 = [(FMFFavoritesSequencer *)self saveFavoritesOperationUpdateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000352A0;
  block[3] = &unk_1000A14E8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)addFavorite:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_100005560();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMFFavoritesSequencer: addFavoriteHandle: %@", buf, 0xCu);
  }

  v12 = [(FMFFavoritesSequencer *)self saveFavoritesOperationUpdateQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003548C;
  v16[3] = &unk_1000A27D0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)removeFavorite:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_100005560();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMFFavoritesSequencer: removeFavoriteHandle: %@", buf, 0xCu);
  }

  v12 = [(FMFFavoritesSequencer *)self saveFavoritesOperationUpdateQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000356D4;
  v16[3] = &unk_1000A27D0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)executeNextOperation
{
  uint64_t v3 = [(FMFFavoritesSequencer *)self saveFavoritesOperationExecutionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035828;
  block[3] = &unk_1000A14E8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)updateHandles:(id)a3 withFavoriteArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100005560();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 allKeys];
    int v12 = 134218240;
    id v13 = [v9 count];
    __int16 v14 = 2048;
    id v15 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMFFavoritesSequencer: updateHandles: (%ld) withFavorites: (%ld)", (uint8_t *)&v12, 0x16u);
  }
  id v10 = [(FMFFavoritesSequencer *)self currentOperation];

  if (v10)
  {
    v11 = sub_100005560();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMFFavoritesSequencer: skipping unmarshaller updates because an operation is in flight", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    v11 = [(FMFFavoritesSequencer *)self favoritesManager];
    [v11 updateHandles:v6 withFavoriteArray:v7];
  }
}

- (void)updateHandlesWithFavorites:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFFavoritesSequencer *)self favoritesManager];
  [v5 updateHandlesWithFavorites:v4];
}

- (void)updateWithCachedHandles:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFFavoritesSequencer *)self favoritesManager];
  [v5 updateWithCachedHandles:v4];
}

- (NSArray)favorites
{
  v2 = [(FMFFavoritesSequencer *)self favoritesManager];
  uint64_t v3 = [v2 favorites];

  return (NSArray *)v3;
}

- (FMFFavoritesManager)favoritesManager
{
  return self->_favoritesManager;
}

- (void)setFavoritesManager:(id)a3
{
}

- (FMFSaveFavoritesOperations)currentOperation
{
  return self->_currentOperation;
}

- (void)setCurrentOperation:(id)a3
{
}

- (NSMutableArray)saveFavoritesOperation
{
  return self->_saveFavoritesOperation;
}

- (void)setSaveFavoritesOperation:(id)a3
{
}

- (OS_dispatch_queue)saveFavoritesOperationUpdateQueue
{
  return self->_saveFavoritesOperationUpdateQueue;
}

- (void)setSaveFavoritesOperationUpdateQueue:(id)a3
{
}

- (OS_dispatch_queue)saveFavoritesOperationExecutionQueue
{
  return self->_saveFavoritesOperationExecutionQueue;
}

- (void)setSaveFavoritesOperationExecutionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveFavoritesOperationExecutionQueue, 0);
  objc_storeStrong((id *)&self->_saveFavoritesOperationUpdateQueue, 0);
  objc_storeStrong((id *)&self->_saveFavoritesOperation, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);

  objc_storeStrong((id *)&self->_favoritesManager, 0);
}

@end