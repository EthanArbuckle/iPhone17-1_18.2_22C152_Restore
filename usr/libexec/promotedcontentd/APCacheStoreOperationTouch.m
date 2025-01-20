@interface APCacheStoreOperationTouch
- (APCacheStore)cacheStore;
- (APCacheStoreOperationTouch)initWithCacheStore:(id)a3 key:(id)a4 timestamp:(id)a5;
- (BOOL)execute;
- (NSDate)timestamp;
- (NSString)key;
@end

@implementation APCacheStoreOperationTouch

- (APCacheStoreOperationTouch)initWithCacheStore:(id)a3 key:(id)a4 timestamp:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(APCacheStoreOperationTouch *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_cacheStore, v8);
    objc_storeStrong((id *)&v12->_key, a4);
    objc_storeStrong((id *)&v12->_timestamp, a5);
  }

  return v12;
}

- (BOOL)execute
{
  v3 = [(APCacheStoreOperationTouch *)self cacheStore];
  v4 = [v3 memoryCache];
  v5 = [(APCacheStoreOperationTouch *)self key];
  id v6 = [v4 objectForKey:v5];

  v7 = [(APCacheStoreOperationTouch *)self cacheStore];
  id v8 = [v7 fileStorage];
  id v9 = [(APCacheStoreOperationTouch *)self timestamp];
  id v10 = [(APCacheStoreOperationTouch *)self key];
  id v17 = 0;
  unsigned __int8 v11 = [v8 setLastModifiedDate:v9 toFile:v10 error:&v17];
  id v12 = v17;

  if (v12) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v11;
  }
  if (!v13)
  {
    v14 = APLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = [(APCacheStoreOperationTouch *)self key];
      *(_DWORD *)buf = 138543619;
      v19 = v15;
      __int16 v20 = 2113;
      id v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable set last modified date to file %{public}@. Error: %{private}@", buf, 0x16u);
    }
  }

  return v13;
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

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_destroyWeak((id *)&self->_cacheStore);
}

@end