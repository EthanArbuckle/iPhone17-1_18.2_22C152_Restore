@interface APManagedContentData
+ (BOOL)supportsSecureCoding;
+ (id)findById:(id)a3;
+ (id)kind;
- (APContentData)contentData;
- (APContentDataPrivate)contentDataPrivate;
- (APContentDataPrivateWrapper)contentDataPrivateWrapper;
- (APContentDataTransient)contentDataTransient;
- (APContentDataTransientWrapper)contentDataTransientWrapper;
- (APContentDataWrapper)contentDataWrapper;
- (APManagedContentData)initWithCoder:(id)a3;
- (APManagedContentData)initWithManagedContext:(id)a3 contentData:(id)a4 transaction:(id)a5;
- (BOOL)_update;
- (BOOL)_updatePrivateData;
- (BOOL)_updateTransientData;
- (BOOL)isAvailable;
- (NSArray)placementTypes;
- (NSDate)expirationDate;
- (NSString)clientId;
- (NSString)contextIdentifier;
- (id)_heavyContentKeyNames;
- (id)allPlacementTypesForContentData:(id)a3;
- (id)toJSONObject;
- (int64_t)garbageCollect;
- (int64_t)state;
- (void)_unloadHeavyContentFromContentData;
- (void)close;
- (void)encodeWithCoder:(id)a3;
- (void)markInUseByClientWithId:(id)a3;
- (void)markUsed;
- (void)privateDataDidChange;
- (void)setClientId:(id)a3;
- (void)setContentDataPrivateWrapper:(id)a3;
- (void)setContentDataTransientWrapper:(id)a3;
- (void)setContentDataWrapper:(id)a3;
- (void)setContextIdentifier:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setPlacementTypes:(id)a3;
- (void)setState:(int64_t)a3;
- (void)transientDataDidChange;
@end

@implementation APManagedContentData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)APManagedContentData;
  id v4 = a3;
  [(APCacheableBaseObject *)&v9 encodeWithCoder:v4];
  v5 = [(APManagedContentData *)self contextIdentifier];
  [v4 encodeObject:v5 forKey:@"contextId"];

  v6 = [(APManagedContentData *)self placementTypes];
  [v4 encodeObject:v6 forKey:@"placementTypes"];

  v7 = [(APManagedContentData *)self clientId];
  [v4 encodeObject:v7 forKey:@"clientId"];

  [v4 encodeInteger:-[APManagedContentData state](self, "state") forKey:@"state"];
  v8 = [(APManagedContentData *)self expirationDate];
  [v4 encodeObject:v8 forKey:@"lastModified"];
}

- (APManagedContentData)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)APManagedContentData;
  v5 = [(APCacheableSynchronizedObject *)&v30 initWithCoder:v4];
  if (v5)
  {
    objc_initWeak(&location, v5);
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextId"];
    contextIdentifier = v5->_contextIdentifier;
    v5->_contextIdentifier = (NSString *)v7;

    uint64_t v9 = objc_opt_class();
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"placementTypes"];
    placementTypes = v5->_placementTypes;
    v5->_placementTypes = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientId"];
    clientId = v5->_clientId;
    v5->_clientId = (NSString *)v13;

    v5->_state = (int64_t)[v4 decodeIntegerForKey:@"state"];
    v15 = [(APCacheableBaseObject *)v5 identifier];
    uint64_t v16 = +[APCacheableBaseObject proxyForIdentifier:v15];
    contentDataWrapper = v5->_contentDataWrapper;
    v5->_contentDataWrapper = (APContentDataWrapper *)v16;

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1001856B4;
    v27[3] = &unk_100238CC0;
    objc_copyWeak(&v28, &location);
    [(APContentDataWrapper *)v5->_contentDataWrapper setProvideIgnorableKeyNamesBlock:v27];
    v18 = [(APCacheableBaseObject *)v5 identifier];
    uint64_t v19 = +[APCacheableBaseObject proxyForIdentifier:v18];
    contentDataPrivateWrapper = v5->_contentDataPrivateWrapper;
    v5->_contentDataPrivateWrapper = (APContentDataPrivateWrapper *)v19;

    v21 = [(APCacheableBaseObject *)v5 identifier];
    uint64_t v22 = +[APCacheableBaseObject proxyForIdentifier:v21];
    contentDataTransientWrapper = v5->_contentDataTransientWrapper;
    v5->_contentDataTransientWrapper = (APContentDataTransientWrapper *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModified"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v24;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v5;
}

+ (id)kind
{
  return @"a";
}

- (BOOL)_update
{
  v2 = self;
  v3 = sub_10017FEA4(self);
  id v4 = [v3 createTransaction];

  sub_10017FFFC(v2, v4);
  LOBYTE(v2) = [v4 commit];

  return (char)v2;
}

- (BOOL)_updateTransientData
{
  v3 = [(APManagedContentData *)self contentDataTransient];
  if (v3)
  {
    id v4 = sub_10017FEA4(self);
    v5 = [v4 createTransaction];

    sub_1001803A0(self, v5);
    v6 = [(APManagedContentData *)self contentDataTransientWrapper];
    sub_10017FFFC(v6, v5);

    unsigned __int8 v7 = [v5 commit];
  }
  else
  {
    v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [(APCacheableBaseObject *)self identifier];
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Trying to update non-existing transient data for id %{public}@.", (uint8_t *)&v11, 0xCu);
    }
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)_updatePrivateData
{
  v3 = [(APManagedContentData *)self contentDataPrivate];
  if (v3)
  {
    id v4 = sub_10017FEA4(self);
    v5 = [v4 createTransaction];

    sub_1001803A0(self, v5);
    v6 = [(APManagedContentData *)self contentDataPrivateWrapper];
    sub_10017FFFC(v6, v5);

    unsigned __int8 v7 = [v5 commit];
  }
  else
  {
    v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [(APCacheableBaseObject *)self identifier];
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Trying to update non-existing private data for id %{public}@.", (uint8_t *)&v11, 0xCu);
    }
    unsigned __int8 v7 = 0;
  }

  return v7;
}

+ (id)findById:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = sub_10017FEDC((uint64_t)APManagedContentData, v3);
    if (!v4) {
      goto LABEL_9;
    }
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found managed content data '%{public}@' in a cache.", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to find managed content data. Content data identifier is empty.", (uint8_t *)&v7, 2u);
    }
    id v4 = 0;
  }

LABEL_9:

  return v4;
}

- (APManagedContentData)initWithManagedContext:(id)a3 contentData:(id)a4 transaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v9 content];
  v12 = [v11 identifier];

  v38.receiver = self;
  v38.super_class = (Class)APManagedContentData;
  uint64_t v13 = [(APCacheableSynchronizedObject *)&v38 initWithIdentifier:v12];
  if (v13)
  {
    uint64_t v14 = [v8 identifier];
    contextIdentifier = v13->_contextIdentifier;
    v13->_contextIdentifier = (NSString *)v14;

    uint64_t v16 = [APContentDataWrapper alloc];
    v17 = [v9 content];
    v18 = [(APCacheableObjectWrapper *)v16 initWithObject:v17 identifier:v12];

    uint64_t v19 = [(APCacheableBaseObject *)v18 proxy];
    contentDataWrapper = v13->_contentDataWrapper;
    v13->_contentDataWrapper = (APContentDataWrapper *)v19;

    v21 = [APContentDataPrivateWrapper alloc];
    uint64_t v22 = [v9 privateContent];
    v23 = [(APCacheableObjectWrapper *)v21 initWithObject:v22 identifier:v12];

    uint64_t v24 = [(APCacheableBaseObject *)v23 proxy];
    contentDataPrivateWrapper = v13->_contentDataPrivateWrapper;
    v13->_contentDataPrivateWrapper = (APContentDataPrivateWrapper *)v24;

    v26 = [APContentDataTransientWrapper alloc];
    v27 = [v9 transientContent];
    id v28 = [(APCacheableObjectWrapper *)v26 initWithObject:v27 identifier:v12];

    uint64_t v29 = [(APCacheableBaseObject *)v28 proxy];
    contentDataTransientWrapper = v13->_contentDataTransientWrapper;
    v13->_contentDataTransientWrapper = (APContentDataTransientWrapper *)v29;

    v13->_state = 1;
    v31 = [v9 content];
    uint64_t v32 = [(APManagedContentData *)v13 allPlacementTypesForContentData:v31];
    placementTypes = v13->_placementTypes;
    v13->_placementTypes = (NSArray *)v32;

    v34 = [v9 content];
    uint64_t v35 = [v34 expirationDate];
    expirationDate = v13->_expirationDate;
    v13->_expirationDate = (NSDate *)v35;

    sub_10017FFFC(v18, v10);
    sub_10017FFFC(v23, v10);
    sub_10017FFFC(v28, v10);
    sub_10017FFFC(v13, v10);
  }
  return v13;
}

- (id)allPlacementTypesForContentData:(id)a3
{
  id v3 = a3;
  id v4 = [v3 representations];
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);

  v6 = [v3 representations];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100185ECC;
  v10[3] = &unk_100238CE8;
  id v11 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v10];

  id v8 = [v7 copy];

  return v8;
}

- (APContentData)contentData
{
  id v3 = [(APManagedContentData *)self contentDataWrapper];
  id v4 = [v3 object];

  if (!v4)
  {
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(APCacheableBaseObject *)self identifier];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to load associated Content Data object for '%{public}@'.", (uint8_t *)&v8, 0xCu);
    }
  }

  return (APContentData *)v4;
}

- (APContentDataPrivate)contentDataPrivate
{
  id v3 = [(APManagedContentData *)self contentDataPrivateWrapper];
  id v4 = [v3 object];

  if (!v4)
  {
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(APCacheableBaseObject *)self identifier];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to load associated Content Data Private object for '%{public}@'.", (uint8_t *)&v8, 0xCu);
    }
  }
  [v4 setDelegate:self];

  return (APContentDataPrivate *)v4;
}

- (APContentDataTransient)contentDataTransient
{
  id v3 = [(APManagedContentData *)self contentDataTransientWrapper];
  id v4 = [v3 object];

  if (!v4)
  {
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(APCacheableBaseObject *)self identifier];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to load associated Content Data Transient object for '%{public}@'.", (uint8_t *)&v8, 0xCu);
    }
  }
  [v4 setDelegate:self];

  return (APContentDataTransient *)v4;
}

- (BOOL)isAvailable
{
  return (id)[(APManagedContentData *)self state] == (id)1;
}

- (void)markInUseByClientWithId:(id)a3
{
  id v4 = a3;
  [(APCacheableSynchronizedObject *)self lockObject];
  if ((id)[(APManagedContentData *)self state] == (id)1)
  {
    [(APManagedContentData *)self setState:2];
    [(APManagedContentData *)self setClientId:v4];
    [(APCacheableSynchronizedObject *)self unlockObject];
    [(APManagedContentData *)self _update];
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [(APCacheableBaseObject *)self identifier];
      int v9 = 138543874;
      id v10 = v6;
      __int16 v11 = 2048;
      int64_t v12 = 1;
      __int16 v13 = 2048;
      uint64_t v14 = 2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Changed managed contend data '%{public}@' state from %ld to %ld.", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    id v7 = APLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = [(APCacheableBaseObject *)self identifier];
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2048;
      int64_t v12 = [(APManagedContentData *)self state];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to mark managed contend data %{public}@ as in use. Current state: %ld", (uint8_t *)&v9, 0x16u);
    }
    [(APCacheableSynchronizedObject *)self unlockObject];
  }
}

- (void)markUsed
{
  [(APCacheableSynchronizedObject *)self lockObject];
  if ((id)[(APManagedContentData *)self state] == (id)2)
  {
    id v3 = [(APManagedContentData *)self contentDataWrapper];
    unsigned int v4 = +[APCacheableObjectProxy objectIsLoaded:v3];

    if (v4) {
      [(APManagedContentData *)self _unloadHeavyContentFromContentData];
    }
    [(APManagedContentData *)self setState:3];
    [(APManagedContentData *)self setClientId:0];
    [(APCacheableSynchronizedObject *)self unlockObject];
    [(APManagedContentData *)self _update];
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [(APCacheableBaseObject *)self identifier];
      int v9 = 138543874;
      id v10 = v6;
      __int16 v11 = 2048;
      int64_t v12 = 2;
      __int16 v13 = 2048;
      uint64_t v14 = 3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Changed managed contend data '%{public}@' state from %ld to %ld.", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    id v7 = APLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = [(APCacheableBaseObject *)self identifier];
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2048;
      int64_t v12 = [(APManagedContentData *)self state];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to mark managed contend data %{public}@ as used. Current state: %ld", (uint8_t *)&v9, 0x16u);
    }
    [(APCacheableSynchronizedObject *)self unlockObject];
  }
}

- (void)close
{
  [(APCacheableSynchronizedObject *)self lockObject];
  if ((id)[(APManagedContentData *)self state] == (id)2)
  {
    [(APManagedContentData *)self setState:1];
    [(APManagedContentData *)self setClientId:0];
    [(APCacheableSynchronizedObject *)self unlockObject];
    [(APManagedContentData *)self _update];
    id v3 = APLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      unsigned int v4 = [(APCacheableBaseObject *)self identifier];
      int v7 = 138543874;
      int v8 = v4;
      __int16 v9 = 2048;
      int64_t v10 = 2;
      __int16 v11 = 2048;
      uint64_t v12 = 1;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Changed managed contend data '%{public}@' state from %ld to %ld.", (uint8_t *)&v7, 0x20u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ((id)[(APManagedContentData *)self state] == (id)3)
  {
    [(APManagedContentData *)self setState:4];
    [(APManagedContentData *)self setClientId:0];
    [(APCacheableSynchronizedObject *)self unlockObject];
    [(APManagedContentData *)self _update];
    id v3 = APLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      unsigned int v4 = [(APCacheableBaseObject *)self identifier];
      int v7 = 138543874;
      int v8 = v4;
      __int16 v9 = 2048;
      int64_t v10 = 3;
      __int16 v11 = 2048;
      uint64_t v12 = 4;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = [(APCacheableBaseObject *)self identifier];
    int v7 = 138543618;
    int v8 = v6;
    __int16 v9 = 2048;
    int64_t v10 = [(APManagedContentData *)self state];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to close managed contend data %{public}@. Current state: %ld", (uint8_t *)&v7, 0x16u);
  }
  [(APCacheableSynchronizedObject *)self unlockObject];
}

- (int64_t)garbageCollect
{
  id v3 = [(APCacheableBaseObject *)self identifier];
  unsigned __int8 v4 = sub_10017FF74((uint64_t)APContentDataWrapper, v3);

  if ((v4 & 1) == 0)
  {
    v5 = [(APCacheableBaseObject *)self identifier];
    unsigned __int8 v6 = sub_10017FF74((uint64_t)APContentDataPrivateWrapper, v5);

    if ((v6 & 1) == 0)
    {
      int v7 = [(APCacheableBaseObject *)self identifier];
      unsigned __int8 v8 = sub_10017FF74((uint64_t)APContentDataTransientWrapper, v7);

      if ((v8 & 1) == 0)
      {
        __int16 v11 = [(APManagedContentData *)self contextIdentifier];
        uint64_t v12 = +[APManagedContext findManagedContextByFingerprint:v11];

        if (v12)
        {
          __int16 v13 = [(APCacheableBaseObject *)self identifier];
          unsigned __int8 v14 = [v12 removeManagedContentDataForId:v13];

          if ((v14 & 1) == 0)
          {
            v15 = APLogForCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              uint64_t v16 = [(APCacheableBaseObject *)self identifier];
              v17 = [(APManagedContentData *)self contextIdentifier];
              int v27 = 138543618;
              id v28 = v16;
              __int16 v29 = 2114;
              objc_super v30 = v17;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to remove content data '%{public}@' reference from '%{public}@' context.", (uint8_t *)&v27, 0x16u);
            }
            int64_t v9 = 0;
LABEL_19:

            return v9;
          }
        }
        else
        {
          v18 = APLogForCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = [(APManagedContentData *)self contextIdentifier];
            v20 = [(APCacheableBaseObject *)self identifier];
            int v27 = 138543618;
            id v28 = v19;
            __int16 v29 = 2114;
            objc_super v30 = v20;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to find context '%{public}@' for content data '%{public}@'.", (uint8_t *)&v27, 0x16u);
          }
        }
        v21 = sub_10017FEA4(self);
        v15 = [v21 createTransaction];

        sub_1001801E0(self, v15);
        uint64_t v22 = [(APCacheableBaseObject *)self identifier];
        sub_100180274((uint64_t)APContentDataWrapper, v22, v15);

        v23 = [(APCacheableBaseObject *)self identifier];
        sub_100180274((uint64_t)APContentDataPrivateWrapper, v23, v15);

        uint64_t v24 = [(APCacheableBaseObject *)self identifier];
        sub_100180274((uint64_t)APContentDataTransientWrapper, v24, v15);

        if ([v15 commit])
        {
          int64_t v9 = (int64_t)[v15 count];
        }
        else
        {
          v25 = APLogForCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v26 = [(APCacheableBaseObject *)self identifier];
            int v27 = 138543362;
            id v28 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to remove managed content data '%{public}@'.", (uint8_t *)&v27, 0xCu);
          }
          int64_t v9 = -1;
        }
        goto LABEL_19;
      }
    }
  }
  return 0;
}

- (id)_heavyContentKeyNames
{
  if ((id)[(APManagedContentData *)self state] == (id)3
    || (id)[(APManagedContentData *)self state] == (id)4)
  {
    return &off_10024B658;
  }
  else
  {
    return 0;
  }
}

- (void)_unloadHeavyContentFromContentData
{
  v2 = [(APManagedContentData *)self contentData];
  [v2 setDisclosureRendererPayload:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [v2 representations];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      int v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) setAdTag:0];
        int v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v5);
  }

  unsigned __int8 v8 = APLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int64_t v9 = [v2 identifier];
    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Removing heavy content from ContentData %{public}@", buf, 0xCu);
  }
}

- (void)transientDataDidChange
{
}

- (void)privateDataDidChange
{
}

- (id)toJSONObject
{
  id v4 = +[APJSONArchiver JSONObjectWithObject:self];
  id v5 = [(APManagedContentData *)self contentData];
  uint64_t v6 = +[APJSONArchiver JSONObjectWithObject:v5];

  if (v6)
  {
    [v4 setObject:v6 forKeyedSubscript:@"contentData"];
  }
  else
  {
    int v7 = +[NSNull null];
    [v4 setObject:v7 forKeyedSubscript:@"contentData"];
  }
  unsigned __int8 v8 = [(APManagedContentData *)self contentDataPrivate];
  int64_t v9 = +[APJSONArchiver JSONObjectWithObject:v8];

  if (v9)
  {
    [v4 setObject:v9 forKeyedSubscript:@"contentDataPrivate"];
  }
  else
  {
    long long v10 = +[NSNull null];
    [v4 setObject:v10 forKeyedSubscript:@"contentDataPrivate"];
  }
  long long v11 = [(APManagedContentData *)self contentDataTransient];
  long long v12 = +[APJSONArchiver JSONObjectWithObject:v11];

  if (v12)
  {
    [v4 setObject:v12 forKeyedSubscript:@"contentDataTransient"];
  }
  else
  {
    long long v13 = +[NSNull null];
    [v4 setObject:v13 forKeyedSubscript:@"contentDataTransient"];
  }

  return v4;
}

- (NSArray)placementTypes
{
  return self->_placementTypes;
}

- (void)setPlacementTypes:(id)a3
{
}

- (NSString)clientId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setClientId:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
}

- (APContentDataWrapper)contentDataWrapper
{
  return self->_contentDataWrapper;
}

- (void)setContentDataWrapper:(id)a3
{
}

- (APContentDataPrivateWrapper)contentDataPrivateWrapper
{
  return self->_contentDataPrivateWrapper;
}

- (void)setContentDataPrivateWrapper:(id)a3
{
}

- (APContentDataTransientWrapper)contentDataTransientWrapper
{
  return self->_contentDataTransientWrapper;
}

- (void)setContentDataTransientWrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDataTransientWrapper, 0);
  objc_storeStrong((id *)&self->_contentDataPrivateWrapper, 0);
  objc_storeStrong((id *)&self->_contentDataWrapper, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_clientId, 0);

  objc_storeStrong((id *)&self->_placementTypes, 0);
}

@end