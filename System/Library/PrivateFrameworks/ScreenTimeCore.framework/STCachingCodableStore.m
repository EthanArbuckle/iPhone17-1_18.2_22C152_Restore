@interface STCachingCodableStore
- (Class)valueClass;
- (NSCache)keyValueCache;
- (STCachingCodableStore)initWithKeyValueStore:(id)a3 cacheSize:(id)a4 valueClass:(Class)a5;
- (STKeyValueStore)backingStore;
- (id)description;
- (id)purge;
- (id)readValueForKey:(id)a3;
- (void)enumerateKeysAndValuesUsingBlock:(id)a3;
- (void)persistValue:(id)a3 forKey:(id)a4;
- (void)removeValueForKey:(id)a3;
@end

@implementation STCachingCodableStore

- (STCachingCodableStore)initWithKeyValueStore:(id)a3 cacheSize:(id)a4 valueClass:(Class)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)STCachingCodableStore;
  v11 = [(STCachingCodableStore *)&v15 init];
  objc_storeStrong((id *)&v11->_backingStore, a3);
  objc_storeStrong((id *)&v11->_valueClass, a5);
  uint64_t v12 = objc_opt_new();
  keyValueCache = v11->_keyValueCache;
  v11->_keyValueCache = (NSCache *)v12;

  if (v10) {
    -[NSCache setCountLimit:](v11->_keyValueCache, "setCountLimit:", [v10 unsignedIntegerValue]);
  }

  return v11;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = NSStringFromClass([(STCachingCodableStore *)self valueClass]);
  v5 = [(STCachingCodableStore *)self keyValueCache];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ { ValueType: %@, CacheSizeLimit: %lu }>", v3, v4, [v5 countLimit]);

  return v6;
}

- (void)persistValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(STCachingCodableStore *)self keyValueCache];
  id v9 = [v7 copy];
  [v8 setObject:v9 forKey:v6];

  id v13 = 0;
  id v10 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v13];

  id v11 = v13;
  if (v10)
  {
    uint64_t v12 = [(STCachingCodableStore *)self backingStore];
    [v12 persistValue:v10 forKey:v6];
  }
  else
  {
    uint64_t v12 = +[STLog cachingCodableStore];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10025B6A4((uint64_t)v11, v12);
    }
  }
}

- (void)removeValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(STCachingCodableStore *)self keyValueCache];
  [v5 removeObjectForKey:v4];

  id v6 = [(STCachingCodableStore *)self backingStore];
  [v6 removeValueForKey:v4];
}

- (id)readValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(STCachingCodableStore *)self keyValueCache];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v7 = [(STCachingCodableStore *)self backingStore];
    v8 = [v7 readValueForKey:v4];

    if (v8)
    {
      id v14 = 0;
      id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:[(STCachingCodableStore *)self valueClass] fromData:v8 error:&v14];
      id v9 = v14;
      if (v6)
      {
        id v10 = [(STCachingCodableStore *)self keyValueCache];
        id v11 = [v6 copy];
        [v10 setObject:v11 forKey:v4];

        uint64_t v12 = v8;
        v8 = v9;
      }
      else
      {
        id v10 = +[STLog cachingCodableStore];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10025B71C(self, (uint64_t)v9, v10);
        }
        id v6 = 0;
        uint64_t v12 = v9;
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

- (void)enumerateKeysAndValuesUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(STCachingCodableStore *)self backingStore];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000109EC;
  v7[3] = &unk_1002FB670;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndValuesUsingBlock:v7];
}

- (id)purge
{
  v2 = [(STCachingCodableStore *)self backingStore];
  uint64_t v3 = [v2 purge];

  return v3;
}

- (STKeyValueStore)backingStore
{
  return (STKeyValueStore *)objc_getProperty(self, a2, 8, 1);
}

- (NSCache)keyValueCache
{
  return (NSCache *)objc_getProperty(self, a2, 16, 1);
}

- (Class)valueClass
{
  return (Class)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueClass, 0);
  objc_storeStrong((id *)&self->_keyValueCache, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

@end