@interface APCacheableMasterObject
+ (BOOL)isMasterObject;
+ (BOOL)supportsSecureCoding;
- (APCacheableMasterObject)initWithCoder:(id)a3;
- (APCacheableMasterObject)initWithIdentifier:(id)a3 inPersistentStore:(id)a4;
- (BOOL)addAssociatedObject:(id)a3;
- (NSMutableDictionary)associatedObjects;
- (id)findAssociatedObjectOfKind:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)remove;
- (void)removeAssociatedObject:(id)a3;
- (void)save;
- (void)setAssociatedObjects:(id)a3;
- (void)touch;
@end

@implementation APCacheableMasterObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)APCacheableMasterObject;
  id v4 = a3;
  [(APCacheableBaseObject *)&v6 encodeWithCoder:v4];
  v5 = [(APCacheableMasterObject *)self associatedObjects];
  [v4 encodeObject:v5 forKey:@"_associated_objects"];
}

- (APCacheableMasterObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)APCacheableMasterObject;
  v5 = [(APCacheableSynchronizedObject *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_associated_objects"];
    associatedObjects = v5->_associatedObjects;
    v5->_associatedObjects = (NSMutableDictionary *)v9;
  }
  return v5;
}

- (APCacheableMasterObject)initWithIdentifier:(id)a3 inPersistentStore:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)APCacheableMasterObject;
  id v4 = [(APCacheableObject *)&v8 initWithIdentifier:a3 inPersistentStore:a4];
  if (v4)
  {
    uint64_t v5 = +[NSMutableDictionary dictionary];
    associatedObjects = v4->_associatedObjects;
    v4->_associatedObjects = (NSMutableDictionary *)v5;
  }
  return v4;
}

+ (BOOL)isMasterObject
{
  return 1;
}

- (id)findAssociatedObjectOfKind:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = +[NSString stringWithFormat:@"%@ kind cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  [(APCacheableSynchronizedObject *)self lockObject];
  uint64_t v6 = [(APCacheableMasterObject *)self associatedObjects];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  [(APCacheableSynchronizedObject *)self unlockObject];
  if ([v7 length])
  {
    objc_super v8 = [(APCacheableObject *)self persistentStore];
    uint64_t v9 = +[APCacheableObject findCacheableObjectForId:v7 inPersistentStore:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)addAssociatedObject:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = +[NSString stringWithFormat:@"%@ childObject cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  uint64_t v6 = [(id)objc_opt_class() kind];
  if ([v6 length])
  {
    [(APCacheableSynchronizedObject *)self lockObject];
    uint64_t v7 = [(APCacheableMasterObject *)self associatedObjects];
    objc_super v8 = [v7 objectForKeyedSubscript:v6];

    if (!v8)
    {
      v13 = [v4 identifier];
      [(NSMutableDictionary *)self->_associatedObjects setObject:v13 forKeyedSubscript:v6];

      [(APCacheableSynchronizedObject *)self unlockObject];
      BOOL v12 = 1;
      goto LABEL_13;
    }
    uint64_t v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Master object already contains object of kind '%{private}@'", buf, 0xCu);
    }

    [(APCacheableSynchronizedObject *)self unlockObject];
  }
  else
  {
    v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v16 = (id)objc_opt_class();
      id v11 = v16;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Associated object '%{private}@' kind is empty.", buf, 0xCu);
    }
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (void)removeAssociatedObject:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = +[NSString stringWithFormat:@"%@ associatedObject cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  uint64_t v6 = [(id)objc_opt_class() kind];
  if ([v6 length])
  {
    [(APCacheableSynchronizedObject *)self lockObject];
    [(NSMutableDictionary *)self->_associatedObjects removeObjectForKey:v6];
    [(APCacheableSynchronizedObject *)self unlockObject];
  }
  else
  {
    uint64_t v7 = APLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v10 = (id)objc_opt_class();
      id v8 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Associated object '%{private}@' kind is empty.", buf, 0xCu);
    }
  }
}

- (void)touch
{
  id v4 = [(APCacheableObject *)self persistentStore];
  v3 = [(APCacheableObject *)self fileName];
  [v4 touchObjectForKey:v3];
}

- (void)save
{
  id v4 = [(APCacheableObject *)self persistentStore];
  v3 = [(APCacheableObject *)self fileName];
  [v4 setObject:self forKey:v3];
}

- (void)remove
{
  [(APCacheableSynchronizedObject *)self lockObject];
  v3 = [(APCacheableMasterObject *)self associatedObjects];
  id v4 = [v3 allValues];

  [(NSMutableDictionary *)self->_associatedObjects removeAllObjects];
  [(APCacheableSynchronizedObject *)self unlockObject];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[APCacheableObject associatedObjectFileNameForIdentifier:](APCacheableObject, "associatedObjectFileNameForIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v9), (void)v14);
        id v11 = [(APCacheableObject *)self persistentStore];
        [v11 removeObjectForKey:v10];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  BOOL v12 = [(APCacheableObject *)self persistentStore];
  v13 = [(APCacheableObject *)self fileName];
  [v12 removeObjectForKey:v13];
}

- (NSMutableDictionary)associatedObjects
{
  return self->_associatedObjects;
}

- (void)setAssociatedObjects:(id)a3
{
}

- (void).cxx_destruct
{
}

@end