@interface APCacheStoreOperationSet
- (APCacheStore)cacheStore;
- (APCacheStoreOperationSet)initWithCacheStore:(id)a3 key:(id)a4 object:(id)a5;
- (APCacheableBaseObject)object;
- (BOOL)_setObject:(id)a3 objectSerializedData:(id)a4 forKey:(id)a5;
- (BOOL)execute;
- (NSString)key;
@end

@implementation APCacheStoreOperationSet

- (APCacheStoreOperationSet)initWithCacheStore:(id)a3 key:(id)a4 object:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(APCacheStoreOperationSet *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_cacheStore, v8);
    objc_storeStrong((id *)&v12->_key, a4);
    objc_storeStrong((id *)&v12->_object, a5);
  }

  return v12;
}

- (BOOL)execute
{
  v3 = [(APCacheStoreOperationSet *)self object];
  v4 = [v3 serialize];

  if ([v4 length])
  {
    v5 = [(APCacheStoreOperationSet *)self object];
    v6 = [(APCacheStoreOperationSet *)self key];
    BOOL v7 = [(APCacheStoreOperationSet *)self _setObject:v5 objectSerializedData:v4 forKey:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_setObject:(id)a3 objectSerializedData:(id)a4 forKey:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [(APCacheStoreOperationSet *)self cacheStore];
  v12 = [v11 fileStorage];
  id v22 = 0;
  unsigned __int8 v13 = [v12 writeData:v10 toFile:v9 error:&v22];

  id v14 = v22;
  if (v14) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = v13;
  }
  v16 = APLogForCategory();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Updated file %{public}@.", buf, 0xCu);
    }

    v18 = [(APCacheStoreOperationSet *)self cacheStore];
    v19 = [v18 liveObjectsTracker];
    [v19 setObject:v8 forKey:v9];

    v17 = [(APCacheStoreOperationSet *)self cacheStore];
    v20 = [v17 memoryCache];
    [v20 setObject:v8 forKey:v9 cost:objc_msgSend(v8, "objectSize")];
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543619;
    id v24 = v9;
    __int16 v25 = 2113;
    id v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unable to update file %{public}@. Error: %{private}@", buf, 0x16u);
  }

  return v15;
}

- (APCacheStore)cacheStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cacheStore);

  return (APCacheStore *)WeakRetained;
}

- (NSString)key
{
  return self->_key;
}

- (APCacheableBaseObject)object
{
  return self->_object;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_destroyWeak((id *)&self->_cacheStore);
}

@end