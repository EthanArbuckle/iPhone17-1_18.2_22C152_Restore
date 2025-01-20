@interface BICMemoryDataStore
- (BICDataStoringDelegate)delegate;
- (BICMemoryDataStore)initWithCachePath:(id)a3;
- (BOOL)canStoreDescribedImage:(id)a3;
- (NSMutableDictionary)imageSetStorage;
- (NSString)identifier;
- (id)_imageSetIDFromImageEntryLocation:(id)a3;
- (id)imageForEntryLocation:(id)a3;
- (int64_t)costFor:(signed __int16)a3;
- (int64_t)totalStoredCost;
- (signed)storingMedium;
- (void)_clean:(id)a3;
- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5;
- (void)afterAllStoreOperationsCompletedPerformBlock:(id)a3;
- (void)deleteImageForEntryLocation:(id)a3;
- (void)deleteRemovedEntries:(id)a3 deletingCompletedHandler:(id)a4;
- (void)fetchImagesForEntry:(id)a3 forRequest:(id)a4 completion:(id)a5;
- (void)markAsOldImageForEntryLocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageSetStorage:(id)a3;
- (void)setTotalStoredCost:(int64_t)a3;
- (void)storeAddedEntries:(id)a3 forRequest:(id)a4 storingCompletedHandler:(id)a5;
- (void)storeImage:(id)a3 forRequest:(id)a4 forEntryLocation:(id)a5;
@end

@implementation BICMemoryDataStore

- (BICMemoryDataStore)initWithCachePath:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BICMemoryDataStore;
  v3 = [(BICMemoryDataStore *)&v7 init];
  v4 = v3;
  if (v3)
  {
    v3->_accessLock._os_unfair_lock_opaque = 0;
    v5 = +[NSMutableDictionary dictionary];
    [(BICMemoryDataStore *)v4 setImageSetStorage:v5];
  }
  return v4;
}

- (signed)storingMedium
{
  return 0;
}

- (BOOL)canStoreDescribedImage:(id)a3
{
  v3 = [a3 image];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)storeImage:(id)a3 forRequest:(id)a4 forEntryLocation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  p_accessLock = &self->_accessLock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v16 = sub_4864C;
  v17 = &unk_2C5658;
  v18 = self;
  id v12 = v8;
  id v19 = v12;
  id v13 = v10;
  id v20 = v13;
  v21 = v22;
  v14 = v15;
  os_unfair_lock_lock(p_accessLock);
  v16((uint64_t)v14);
  os_unfair_lock_unlock(p_accessLock);

  _Block_object_dispose(v22, 8);
}

- (void)deleteImageForEntryLocation:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_48884;
  v5[3] = &unk_2C3AF8;
  p_accessLock = &self->_accessLock;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  os_unfair_lock_lock(p_accessLock);
  sub_48884((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);
}

- (void)markAsOldImageForEntryLocation:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_48AC0;
  v5[3] = &unk_2C3AF8;
  p_accessLock = &self->_accessLock;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  os_unfair_lock_lock(p_accessLock);
  sub_48AC0((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);
}

- (void)storeAddedEntries:(id)a3 forRequest:(id)a4 storingCompletedHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v21 = (void (**)(id, id, void *))a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v15 = [v14 entryLocation];
        if (v15)
        {
          v16 = (void *)v15;
          v17 = [v14 imageDescription];
          v18 = [v17 image];

          if (v18)
          {
            id v19 = [v14 imageDescription];
            id v20 = [v14 entryLocation];
            [(BICMemoryDataStore *)self storeImage:v19 forRequest:v9 forEntryLocation:v20];
          }
        }
      }
      id v11 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
  v21[2](v21, v8, &__NSArray0__struct);
}

- (void)deleteRemovedEntries:(id)a3 deletingCompletedHandler:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(id, id))a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [v12 entryLocation];

        if (v13)
        {
          v14 = [v12 entryLocation];
          [(BICMemoryDataStore *)self deleteImageForEntryLocation:v14];
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  v7[2](v7, v6);
}

- (id)imageForEntryLocation:(id)a3
{
  id v4 = a3;
  v5 = [v4 componentsSeparatedByString:@"|"];
  [v5 firstObject];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = sub_490C0;
  long long v23 = sub_490D0;
  id v24 = 0;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_490D8;
  v14 = &unk_2C5680;
  long long v15 = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v6;
  long long v18 = &v19;
  id v7 = v4;
  id v17 = v7;
  id v8 = &v11;
  os_unfair_lock_lock(&self->_accessLock);
  v13((uint64_t)v8);
  os_unfair_lock_unlock(&self->_accessLock);

  if (v20[5]) {
    +[BICCacheStats incrementCounter:](BICCacheStats, "incrementCounter:", kBICCacheStatsCounterL1Hit[0], v11, v12);
  }
  else {
    -[BICMemoryDataStore deleteImageForEntryLocation:](self, "deleteImageForEntryLocation:", v7, v11, v12);
  }
  id v9 = [(id)v20[5] copy];

  _Block_object_dispose(&v19, 8);

  return v9;
}

- (void)afterAllStoreOperationsCompletedPerformBlock:(id)a3
{
  v3 = (void (**)(void))objc_retainBlock(a3);
  if (v3)
  {
    id v4 = v3;
    v3[2]();
    v3 = v4;
  }
}

- (void)fetchImagesForEntry:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [v8 entryLocation];
  uint64_t v10 = [(BICMemoryDataStore *)self imageForEntryLocation:v9];

  id v11 = [v8 quality];
  [v10 setQuality:v11];
  +[BICCacheStats logDescribedImage:v10 withComment:@"MemoryDataStoreLoadImage"];
  uint64_t v12 = (void (**)(id, void *))objc_retainBlock(v7);

  if (v12)
  {
    if (v10)
    {
      v14 = v10;
      id v13 = +[NSArray arrayWithObjects:&v14 count:1];
      v12[2](v12, v13);
    }
    else
    {
      v12[2](v12, 0);
    }
  }
}

- (int64_t)costFor:(signed __int16)a3
{
  int64_t v3 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  if (!a3)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    id v8 = sub_49408;
    id v9 = &unk_2C39F0;
    p_accessLock = &self->_accessLock;
    uint64_t v10 = self;
    id v11 = &v12;
    v5 = v7;
    os_unfair_lock_lock(p_accessLock);
    v8((uint64_t)v5);
    os_unfair_lock_unlock(p_accessLock);

    int64_t v3 = v13[3];
  }
  _Block_object_dispose(&v12, 8);
  return v3;
}

- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v22 = a3;
  id v21 = a5;
  id v7 = +[NSMutableArray array];
  +[NSMutableArray array];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_496AC;
  v27[3] = &unk_2C3AF8;
  v27[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v28 = v8;
  os_unfair_lock_lock(&self->_accessLock);
  sub_496AC((uint64_t)v27);
  os_unfair_lock_unlock(&self->_accessLock);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [(BICMemoryDataStore *)self imageForEntryLocation:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        uint64_t v15 = [v14 identifier];
        id v16 = [v15 length];

        if (v16)
        {
          if (v5)
          {
            id v17 = [v14 identifier];
            long long v18 = +[NSString stringWithFormat:@"%@-Level:%d", v17, v22];
            [v14 setIdentifier:v18];
          }
          [v7 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v11);
  }

  id v19 = objc_retainBlock(v21);
  id v20 = v19;
  if (v19) {
    (*((void (**)(id, void *))v19 + 2))(v19, v7);
  }
}

- (void)_clean:(id)a3
{
  p_accessLock = &self->_accessLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_4989C;
  v6[3] = &unk_2C3C50;
  v6[4] = self;
  id v4 = a3;
  os_unfair_lock_lock(p_accessLock);
  sub_4989C((uint64_t)v6);
  os_unfair_lock_unlock(p_accessLock);
  BOOL v5 = (void (**)(void))objc_retainBlock(v4);

  if (v5) {
    v5[2](v5);
  }
}

- (id)_imageSetIDFromImageEntryLocation:(id)a3
{
  int64_t v3 = [a3 componentsSeparatedByString:@"|"];
  id v4 = [v3 firstObject];

  return v4;
}

- (BICDataStoringDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)totalStoredCost
{
  return self->_totalStoredCost;
}

- (void)setTotalStoredCost:(int64_t)a3
{
  self->_totalStoredCost = a3;
}

- (NSMutableDictionary)imageSetStorage
{
  return self->_imageSetStorage;
}

- (void)setImageSetStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSetStorage, 0);
  objc_storeStrong((id *)&self->identifier, 0);

  objc_storeStrong((id *)&self->delegate, 0);
}

@end