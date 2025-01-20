@interface APManagedContext
+ (BOOL)supportsSecureCoding;
+ (id)createManagedContextWithContext:(id)a3 idAccount:(id)a4;
+ (id)findManagedContextByFingerprint:(id)a3;
+ (id)kind;
- (APContext)context;
- (APContextWrapper)contextWrapper;
- (APIDAccount)idAccount;
- (APManagedContext)initWithCoder:(id)a3;
- (APManagedContext)initWithIdentifier:(id)a3;
- (BOOL)removeManagedContentDataForId:(id)a3;
- (NSArray)contentDataItems;
- (id)addContentData:(id)a3;
- (id)addContentDataOnly:(id)a3;
- (id)contentDataItemForIdentifier:(id)a3;
- (id)managedContentDataEnumerator;
- (id)managedContentDataForId:(id)a3;
- (id)toJSONObject;
- (int64_t)garbageCollect;
- (void)encodeWithCoder:(id)a3;
- (void)setContentData:(id)a3 forIdentifier:(id)a4;
- (void)setContentDataItems:(id)a3;
- (void)setContextWrapper:(id)a3;
- (void)setIdAccount:(id)a3;
@end

@implementation APManagedContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)APManagedContext;
  id v4 = a3;
  [(APCacheableBaseObject *)&v8 encodeWithCoder:v4];
  v5 = [(APManagedContext *)self contentDataItems];
  v6 = [v5 allIdentifiers];
  [v4 encodeObject:v6 forKey:@"contentDataItemIds"];

  v7 = [(APManagedContext *)self idAccount];
  [v4 encodeObject:v7 forKey:@"idAccount"];
}

- (APManagedContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)APManagedContext;
  v5 = [(APCacheableSynchronizedObject *)&v30 initWithCoder:v4];
  if (v5)
  {
    v6 = [(APCacheableBaseObject *)v5 identifier];
    uint64_t v7 = +[APCacheableBaseObject proxyForIdentifier:v6];
    contextWrapper = v5->_contextWrapper;
    v5->_contextWrapper = (APContextWrapper *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idAccount"];
    [(APManagedContext *)v5 setIdAccount:v9];

    uint64_t v10 = objc_opt_class();
    v24 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:forKey:];
    uint64_t v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v11 count]);
    contentDataItems = v5->_contentDataItems;
    v5->_contentDataItems = (NSArray *)v12;

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v11;
    id v15 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v20 = +[APCacheableBaseObject proxyForIdentifier:v19];
          v21 = [(APManagedContext *)v5 contentDataItems];
          v22 = [v21 arrayByAddingObject:v20 forIdentifier:v19];
          [(APManagedContext *)v5 setContentDataItems:v22];
        }
        id v16 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v16);
    }
  }

  return v5;
}

- (APManagedContext)initWithIdentifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)APManagedContext;
  v3 = [(APCacheableSynchronizedObject *)&v7 initWithIdentifier:a3];
  if (v3)
  {
    id v4 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    contentDataItems = v3->_contentDataItems;
    v3->_contentDataItems = v4;
  }
  return v3;
}

+ (id)kind
{
  return @"b";
}

- (id)managedContentDataForId:(id)a3
{
  return [(APManagedContext *)self contentDataItemForIdentifier:a3];
}

- (id)contentDataItemForIdentifier:(id)a3
{
  id v4 = a3;
  [(APCacheableSynchronizedObject *)self lockObject];
  v5 = [(APManagedContext *)self contentDataItems];
  v6 = [v5 objectForIdentifier:v4];

  [(APCacheableSynchronizedObject *)self unlockObject];

  return v6;
}

- (void)setContentData:(id)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(APCacheableSynchronizedObject *)self lockObject];
  objc_super v8 = [(APManagedContext *)self contentDataItems];
  v9 = [v8 arrayByAddingObject:v7 forIdentifier:v6];

  [(APManagedContext *)self setContentDataItems:v9];

  [(APCacheableSynchronizedObject *)self unlockObject];
}

- (BOOL)removeManagedContentDataForId:(id)a3
{
  id v4 = a3;
  [(APCacheableSynchronizedObject *)self lockObject];
  v5 = [(APManagedContext *)self contentDataItems];
  id v6 = [v5 objectForIdentifier:v4];

  if (!v6)
  {
    uint64_t v12 = [(APCacheableBaseObject *)self identifier];
    v13 = +[NSString stringWithFormat:@"Managed content data %@ is not in %@ managed context.", v4, v12];

    id v14 = APLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
    }

    [(APCacheableSynchronizedObject *)self unlockObject];
    APSimulateCrash();

    goto LABEL_7;
  }
  id v7 = [(APManagedContext *)self contentDataItems];
  objc_super v8 = [v7 arrayByRemovingObjectForIdentifier:v4];
  [(APManagedContext *)self setContentDataItems:v8];

  [(APCacheableSynchronizedObject *)self unlockObject];
  if (sub_1001800CC(self))
  {
LABEL_7:
    BOOL v11 = 1;
    goto LABEL_8;
  }
  [(APCacheableSynchronizedObject *)self lockObject];
  v9 = [(APManagedContext *)self contentDataItems];
  uint64_t v10 = [v9 arrayByAddingObject:v6 forIdentifier:v4];
  [(APManagedContext *)self setContentDataItems:v10];

  [(APCacheableSynchronizedObject *)self unlockObject];
  BOOL v11 = 0;
LABEL_8:

  return v11;
}

- (int64_t)garbageCollect
{
  v3 = [(APManagedContext *)self contentDataItems];
  id v4 = [v3 count];

  if (v4) {
    return 0;
  }
  v5 = [(APCacheableBaseObject *)self identifier];
  unsigned __int8 v6 = sub_10017FF74((uint64_t)APContextWrapper, v5);

  if (v6) {
    return 0;
  }
  v9 = sub_10017FEA4(self);
  uint64_t v10 = [v9 createTransaction];

  sub_1001801E0(self, v10);
  BOOL v11 = [(APCacheableBaseObject *)self identifier];
  sub_100180274((uint64_t)APContextWrapper, v11, v10);

  if ([v10 commit])
  {
    int64_t v7 = (int64_t)[v10 count];
  }
  else
  {
    uint64_t v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [(APCacheableBaseObject *)self identifier];
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to remove managed context '%{public}@'.", (uint8_t *)&v14, 0xCu);
    }
    int64_t v7 = -1;
  }

  return v7;
}

+ (id)createManagedContextWithContext:(id)a3 idAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = [v5 fingerprint];
  id v8 = [v7 length];

  if (v8)
  {
    v9 = [APManagedContext alloc];
    uint64_t v10 = [v5 fingerprint];
    BOOL v11 = [(APManagedContext *)v9 initWithIdentifier:v10];

    uint64_t v12 = [APContextWrapper alloc];
    v13 = [v5 fingerprint];
    int v14 = [(APCacheableObjectWrapper *)v12 initWithObject:v5 identifier:v13];

    id v15 = [(APCacheableBaseObject *)v14 proxy];
    [v11 setContextWrapper:v15];

    [v11 setIdAccount:v6];
    id v16 = sub_10017FE74();
    uint64_t v17 = [v16 createTransaction];

    sub_10017FFFC(v14, v17);
    sub_10017FFFC(v11, v17);
    unsigned __int8 v18 = [v17 commit];
    uint64_t v19 = APLogForCategory();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v5 fingerprint];
        int v25 = 138543362;
        long long v26 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Created new managed context for fingerprint '%{public}@'.", (uint8_t *)&v25, 0xCu);
      }
      v22 = v11;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v23 = [v5 fingerprint];
        int v25 = 138543362;
        long long v26 = v23;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to create managed context for fingerprint '%{public}@'.", (uint8_t *)&v25, 0xCu);
      }
      v22 = 0;
    }
  }
  else
  {
    BOOL v11 = APLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create managed context. Fingerprint is empty.", (uint8_t *)&v25, 2u);
    }
    v22 = 0;
  }

  return v22;
}

- (id)addContentData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 content];
  id v6 = [v5 identifier];

  if ([v6 length])
  {
    int64_t v7 = sub_10017FEA4(self);
    id v8 = [v7 createTransaction];

    v9 = [[APManagedContentData alloc] initWithManagedContext:self contentData:v4 transaction:v8];
    uint64_t v10 = [(APCacheableBaseObject *)v9 proxy];
    BOOL v11 = [(APCacheableBaseObject *)v9 identifier];
    [(APManagedContext *)self setContentData:v10 forIdentifier:v11];

    sub_10017FFFC(self, v8);
    if ([v8 commit])
    {
      uint64_t v12 = APLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [(APCacheableBaseObject *)self identifier];
        int v20 = 138543618;
        v21 = v6;
        __int16 v22 = 2114;
        v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Added content data '%{public}@' to managed context '%{public}@'.", (uint8_t *)&v20, 0x16u);
      }
      int v14 = v9;
    }
    else
    {
      id v16 = [(APCacheableBaseObject *)v9 identifier];
      [(APManagedContext *)self setContentData:0 forIdentifier:v16];

      uint64_t v17 = APLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v18 = [(APCacheableBaseObject *)self identifier];
        int v20 = 138543618;
        v21 = v6;
        __int16 v22 = 2114;
        v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to add content data '%{public}@' to managed context '%{public}@'.", (uint8_t *)&v20, 0x16u);
      }
      int v14 = 0;
    }
  }
  else
  {
    id v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v15 = [(APCacheableBaseObject *)self identifier];
      int v20 = 138543362;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to add content data to managed context '%{public}@'. Content data identifier is empty.", (uint8_t *)&v20, 0xCu);
    }
    int v14 = 0;
  }

  return v14;
}

- (APContext)context
{
  v3 = [(APManagedContext *)self contextWrapper];
  id v4 = [v3 object];

  if (!v4)
  {
    id v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [(APCacheableBaseObject *)self identifier];
      int v8 = 138543362;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to load associated Context object for '%{public}@'.", (uint8_t *)&v8, 0xCu);
    }
  }

  return (APContext *)v4;
}

+ (id)findManagedContextByFingerprint:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = sub_10017FEDC((uint64_t)APManagedContext, v3);
    if (!v4) {
      goto LABEL_9;
    }
    id v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found managed context '%{public}@' in a cache.", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    id v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to find managed context. Fingerprint is empty.", (uint8_t *)&v7, 2u);
    }
    id v4 = 0;
  }

LABEL_9:

  return v4;
}

- (id)managedContentDataEnumerator
{
  [(APCacheableSynchronizedObject *)self lockObject];
  id v3 = [(APManagedContext *)self contentDataItems];
  id v4 = [v3 allIdentifiers];

  [(APCacheableSynchronizedObject *)self unlockObject];
  id v5 = [[APManagedContendDataEnumerator alloc] initWithManagedContext:self contentDataItemIds:v4];

  return v5;
}

- (APIDAccount)idAccount
{
  return self->_idAccount;
}

- (void)setIdAccount:(id)a3
{
  id v4 = a3;
  id v7 = +[APIDAccountsWeakContainer sharedInstance];
  id v5 = [v7 addIDAccount:v4];

  idAccount = self->_idAccount;
  self->_idAccount = v5;
}

- (id)toJSONObject
{
  id v4 = +[APJSONArchiver JSONObjectWithObject:self];
  id v5 = [(APManagedContext *)self context];
  id v6 = +[APJSONArchiver JSONObjectWithObject:v5];

  if (v6)
  {
    [v4 setObject:v6 forKeyedSubscript:@"context"];
  }
  else
  {
    id v7 = +[NSNull null];
    [v4 setObject:v7 forKeyedSubscript:@"context"];
  }
  id v8 = [(APManagedContext *)self contentDataItems];
  v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);

  [v4 setObject:v9 forKeyedSubscript:@"contentDataItems"];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [(APManagedContext *)self contentDataItems];
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      int v14 = 0;
      id v15 = v6;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v6 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v14) toJSONObject];

        if (v6) {
          [v9 addObject:v6];
        }
        int v14 = (char *)v14 + 1;
        id v15 = v6;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v4;
}

- (APContextWrapper)contextWrapper
{
  return self->_contextWrapper;
}

- (void)setContextWrapper:(id)a3
{
}

- (NSArray)contentDataItems
{
  return self->_contentDataItems;
}

- (void)setContentDataItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDataItems, 0);
  objc_storeStrong((id *)&self->_contextWrapper, 0);

  objc_storeStrong((id *)&self->_idAccount, 0);
}

- (id)addContentDataOnly:(id)a3
{
  id v4 = a3;
  id v5 = [[APContentDataInternal alloc] initWithContent:v4];

  id v6 = [(APManagedContext *)self addContentData:v5];

  return v6;
}

@end