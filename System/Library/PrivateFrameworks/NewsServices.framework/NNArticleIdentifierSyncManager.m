@interface NNArticleIdentifierSyncManager
+ (id)savedManager;
+ (id)seenManager;
- (NNArticleIdentifierSyncManager)init;
- (NNArticleIdentifierSyncManager)initWithReadonlyResetKey:(id)a3 readwriteResetKey:(id)a4 readonlyKey:(id)a5 readwriteKey:(id)a6;
- (NSSet)articleIdentifiers;
- (NSSet)readonlyArticleIdentifiers;
- (NSSet)synchronizedKeys;
- (NSString)readonlyKey;
- (NSString)readonlyResetKey;
- (NSString)readwriteKey;
- (NSString)readwriteResetKey;
- (id)_lookupIdentifiersForKey:(id)a3;
- (id)_readonlyArticleStateLookup;
- (id)_readonlyResetDate;
- (id)_readwriteArticleStateLookup;
- (id)_readwriteResetDate;
- (void)_makeIdentifier:(id)a3 active:(BOOL)a4;
- (void)addIdentifier:(id)a3;
- (void)clearAllIdentifiers;
- (void)removeIdentifier:(id)a3;
- (void)synchronize;
@end

@implementation NNArticleIdentifierSyncManager

+ (id)savedManager
{
  if (qword_1000175F0 != -1) {
    dispatch_once(&qword_1000175F0, &stru_100010530);
  }
  v2 = (void *)qword_1000175E8;
  return v2;
}

+ (id)seenManager
{
  if (qword_100017600 != -1) {
    dispatch_once(&qword_100017600, &stru_100010550);
  }
  v2 = (void *)qword_1000175F8;
  return v2;
}

- (NNArticleIdentifierSyncManager)initWithReadonlyResetKey:(id)a3 readwriteResetKey:(id)a4 readonlyKey:(id)a5 readwriteKey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)NNArticleIdentifierSyncManager;
  v14 = [(NNArticleIdentifierSyncManager *)&v28 init];
  if (v14)
  {
    v15 = (NSString *)[v10 copy];
    readonlyResetKey = v14->_readonlyResetKey;
    v14->_readonlyResetKey = v15;

    v17 = (NSString *)[v11 copy];
    readwriteResetKey = v14->_readwriteResetKey;
    v14->_readwriteResetKey = v17;

    v19 = (NSString *)[v12 copy];
    readonlyKey = v14->_readonlyKey;
    v14->_readonlyKey = v19;

    v21 = (NSString *)[v13 copy];
    readwriteKey = v14->_readwriteKey;
    v14->_readwriteKey = v21;

    v23 = +[NSMutableSet set];
    v24 = v23;
    if (v14->_readwriteKey) {
      objc_msgSend(v23, "addObject:");
    }
    if (v14->_readwriteResetKey) {
      objc_msgSend(v24, "addObject:");
    }
    v25 = (NSSet *)[v24 copy];
    synchronizedKeys = v14->_synchronizedKeys;
    v14->_synchronizedKeys = v25;
  }
  NSLog(@"Created manager with RO Reset: %@, RW Reset: %@, RO Key: %@, RW Key: %@", v14->_readonlyResetKey, v14->_readwriteResetKey, v14->_readonlyKey, v14->_readwriteKey);

  return v14;
}

- (NNArticleIdentifierSyncManager)init
{
  return [(NNArticleIdentifierSyncManager *)self initWithReadonlyResetKey:&stru_100010850 readwriteResetKey:&stru_100010850 readonlyKey:&stru_100010850 readwriteKey:&stru_100010850];
}

- (void)clearAllIdentifiers
{
  v3 = [(NNArticleIdentifierSyncManager *)self readwriteResetKey];
  id v4 = [v3 length];

  if (v4)
  {
    id v8 = +[NSDate date];
    v5 = +[NSUserDefaults nanoNewsSyncDefaults];
    v6 = [(NNArticleIdentifierSyncManager *)self readwriteResetKey];
    [v5 setObject:v8 forKey:v6];

    v7 = [(NNArticleIdentifierSyncManager *)self readwriteKey];
    [v5 setObject:&__NSDictionary0__struct forKey:v7];

    [(NNArticleIdentifierSyncManager *)self synchronize];
  }
}

- (void)synchronize
{
  id v4 = +[NSUserDefaults nanoNewsSyncDefaults];
  [v4 synchronize];
  v3 = [(NNArticleIdentifierSyncManager *)self synchronizedKeys];
  objc_msgSend(v4, "nn_synchronizeKeys:", v3);
}

- (void)addIdentifier:(id)a3
{
}

- (void)removeIdentifier:(id)a3
{
}

- (NSSet)articleIdentifiers
{
  v3 = +[NSMutableSet set];
  id v4 = [(NNArticleIdentifierSyncManager *)self _readonlyArticleStateLookup];
  v5 = [(NNArticleIdentifierSyncManager *)self _readonlyResetDate];
  v6 = [(NNArticleIdentifierSyncManager *)self _readwriteResetDate];
  v42 = v5;
  [v5 timeIntervalSinceReferenceDate];
  double v8 = v7;
  v41 = v6;
  [v6 timeIntervalSinceReferenceDate];
  if (v8 >= v9) {
    double v10 = v8;
  }
  else {
    double v10 = v9;
  }
  id v11 = [(NNArticleIdentifierSyncManager *)self _readwriteArticleStateLookup];
  id v12 = [v4 allKeys];
  id v13 = [v11 allKeys];
  v14 = [v12 arrayByAddingObjectsFromArray:v13];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v14;
  id v15 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v47;
    v43 = v11;
    v44 = v4;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v47 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v46 + 1) + 8 * (void)v18);
        v20 = [v4 objectForKeyedSubscript:v19];
        v21 = [v11 objectForKeyedSubscript:v19];
        v22 = objc_msgSend(v20, "nn_date");
        [v22 timeIntervalSinceReferenceDate];
        double v24 = v23;

        if (v24 < v10)
        {

          v20 = 0;
        }
        v25 = objc_msgSend(v21, "nn_date");
        [v25 timeIntervalSinceReferenceDate];
        double v27 = v26;

        if (v27 < v10)
        {

          v21 = 0;
LABEL_18:
          if ((objc_msgSend(v20, "nn_active") & 1) == 0)
          {
            v29 = v21;
LABEL_26:
            if (!objc_msgSend(v29, "nn_active")) {
              goto LABEL_28;
            }
          }
          [v3 addObject:v19];
          goto LABEL_28;
        }
        if (v20) {
          BOOL v28 = v21 == 0;
        }
        else {
          BOOL v28 = 1;
        }
        if (v28) {
          goto LABEL_18;
        }
        unsigned int v30 = objc_msgSend(v20, "nn_active");
        unsigned int v31 = objc_msgSend(v21, "nn_active");
        if (v30 == v31)
        {
          v29 = v20;
          goto LABEL_26;
        }
        v32 = v3;
        v33 = objc_msgSend(v21, "nn_date");
        v34 = objc_msgSend(v20, "nn_date");
        id v35 = [v33 compare:v34];

        v36 = v20;
        if ((unint64_t)v35 + 1 >= 2)
        {
          if (v35 != (id)1)
          {
            id v37 = 0;
            goto LABEL_31;
          }
          v36 = v21;
        }
        id v37 = v36;
LABEL_31:
        v3 = v32;
        id v4 = v44;
        if (objc_msgSend(v37, "nn_active")) {
          [v32 addObject:v19];
        }

        id v11 = v43;
LABEL_28:

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v38 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      id v16 = v38;
    }
    while (v38);
  }

  id v39 = [v3 copy];
  return (NSSet *)v39;
}

- (NSSet)readonlyArticleIdentifiers
{
  v29 = +[NSMutableSet set];
  v3 = [(NNArticleIdentifierSyncManager *)self _readonlyArticleStateLookup];
  id v4 = [(NNArticleIdentifierSyncManager *)self _readwriteArticleStateLookup];
  v5 = [v3 allKeys];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v31;
    uint64_t v27 = *(void *)v31;
    BOOL v28 = v5;
    double v26 = v4;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v11 = objc_msgSend(v3, "objectForKeyedSubscript:", v10, v26, v27, v28);
        uint64_t v12 = [v4 objectForKeyedSubscript:v10];
        id v13 = (void *)v12;
        if (v11) {
          BOOL v14 = v12 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (v14)
        {
          if ((objc_msgSend(v11, "nn_active") & 1) == 0)
          {
            id v15 = v13;
LABEL_19:
            if (!objc_msgSend(v15, "nn_active")) {
              goto LABEL_25;
            }
          }
          [v29 addObject:v10];
          goto LABEL_25;
        }
        unsigned int v16 = objc_msgSend(v11, "nn_active");
        unsigned int v17 = objc_msgSend(v13, "nn_active");
        if (v16 == v17)
        {
          id v15 = v11;
          goto LABEL_19;
        }
        v18 = v3;
        uint64_t v19 = objc_msgSend(v13, "nn_date");
        v20 = objc_msgSend(v11, "nn_date");
        id v21 = [v19 compare:v20];

        v22 = v11;
        if ((unint64_t)v21 + 1 >= 2)
        {
          if (v21 != (id)1)
          {
            id v23 = 0;
            goto LABEL_22;
          }
          v22 = v13;
        }
        id v23 = v22;
LABEL_22:
        v3 = v18;
        if (objc_msgSend(v23, "nn_active")) {
          [v29 addObject:v10];
        }

        id v4 = v26;
        uint64_t v8 = v27;
        v5 = v28;
LABEL_25:
      }
      id v7 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }
  id v24 = [v29 copy];

  return (NSSet *)v24;
}

- (void)_makeIdentifier:(id)a3 active:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if ([v11 length])
  {
    id v6 = [(NNArticleIdentifierSyncManager *)self _readwriteArticleStateLookup];
    id v7 = [v6 mutableCopy];

    uint64_t v8 = +[NSDictionary nn_activeSyncStateWithIdentifier:v11 active:v4];
    [v7 setObject:v8 forKeyedSubscript:v11];
    double v9 = +[NSUserDefaults nanoNewsSyncDefaults];
    uint64_t v10 = [(NNArticleIdentifierSyncManager *)self readwriteKey];
    [v9 setObject:v7 forKey:v10];

    [v9 synchronize];
  }
}

- (id)_readonlyArticleStateLookup
{
  v3 = [(NNArticleIdentifierSyncManager *)self readonlyKey];
  BOOL v4 = [(NNArticleIdentifierSyncManager *)self _lookupIdentifiersForKey:v3];

  return v4;
}

- (id)_readwriteArticleStateLookup
{
  v3 = [(NNArticleIdentifierSyncManager *)self readwriteKey];
  BOOL v4 = [(NNArticleIdentifierSyncManager *)self _lookupIdentifiersForKey:v3];

  return v4;
}

- (id)_lookupIdentifiersForKey:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    BOOL v4 = +[NSUserDefaults nanoNewsSyncDefaults];
    [v4 synchronize];
    id v5 = v3;
    id v6 = [v4 dictionaryForKey:v3];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = +[NSDictionary dictionary];
    }
    uint64_t v10 = v8;

    id v11 = +[NSMutableArray array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v10;
    id v12 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v9);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          unsigned int v17 = [v9 objectForKeyedSubscript:v16];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            NSLog(@"Unknown value %@ for key %@ in lookup %@", v17, v16, v5);
            [v11 addObject:v16];
          }
        }
        id v13 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    if ([v11 count])
    {
      id v18 = [v9 mutableCopy];
      [v18 removeObjectsForKeys:v11];
      id v19 = [v18 copy];

      id v9 = v19;
    }
    id v3 = v5;
  }
  else
  {
    id v9 = +[NSDictionary dictionary];
  }

  return v9;
}

- (id)_readonlyResetDate
{
  id v3 = [(NNArticleIdentifierSyncManager *)self readonlyResetKey];
  NSLog(@"_readonlyResetDate for %@", v3);

  BOOL v4 = +[NSUserDefaults nanoNewsSyncDefaults];
  [v4 synchronize];
  id v5 = [(NNArticleIdentifierSyncManager *)self readonlyResetKey];
  id v6 = [v4 objectForKey:v5];

  return v6;
}

- (id)_readwriteResetDate
{
  id v3 = [(NNArticleIdentifierSyncManager *)self readwriteResetKey];
  NSLog(@"_readwriteResetDate for %@", v3);

  BOOL v4 = +[NSUserDefaults nanoNewsSyncDefaults];
  [v4 synchronize];
  id v5 = [(NNArticleIdentifierSyncManager *)self readwriteResetKey];
  id v6 = [v4 objectForKey:v5];

  return v6;
}

- (NSSet)synchronizedKeys
{
  return self->_synchronizedKeys;
}

- (NSString)readonlyResetKey
{
  return self->_readonlyResetKey;
}

- (NSString)readonlyKey
{
  return self->_readonlyKey;
}

- (NSString)readwriteResetKey
{
  return self->_readwriteResetKey;
}

- (NSString)readwriteKey
{
  return self->_readwriteKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readwriteKey, 0);
  objc_storeStrong((id *)&self->_readwriteResetKey, 0);
  objc_storeStrong((id *)&self->_readonlyKey, 0);
  objc_storeStrong((id *)&self->_readonlyResetKey, 0);
  objc_storeStrong((id *)&self->_synchronizedKeys, 0);
}

@end