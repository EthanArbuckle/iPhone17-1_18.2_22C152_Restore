@interface MZKeyValueStoreSerializer
- (BOOL)_isGetAllSinceDomainVersionRequest;
- (BOOL)_isRemoveAllSinceDomainVersion;
- (MZKeyValueStoreDataVerionPair)objectVersionPairForKey:(id)a3;
- (MZKeyValueStoreSerializer)initWithTransaction:(id)a3;
- (MZKeyValueStoreTransaction)transaction;
- (id)baseDictionary;
- (id)dataWithNodes:(id)a3;
- (id)keys;
- (id)payload;
- (id)sinceDomainVersion;
- (void)setTransaction:(id)a3;
@end

@implementation MZKeyValueStoreSerializer

- (MZKeyValueStoreSerializer)initWithTransaction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MZKeyValueStoreSerializer;
  v6 = [(MZKeyValueStoreSerializer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transaction, a3);
  }

  return v7;
}

- (id)payload
{
  v21 = +[NSMutableArray array];
  v2 = [(MZKeyValueStoreSerializer *)self keys];
  v3 = [(MZKeyValueStoreSerializer *)self transaction];
  unsigned int v4 = [v3 type];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v2;
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v10 = [(MZKeyValueStoreSerializer *)self objectVersionPairForKey:v8];
        v12 = v11;
        v13 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v8, @"key", v11, @"base-version", 0];
        if (v10) {
          BOOL v14 = v4 == 2;
        }
        else {
          BOOL v14 = 0;
        }
        int v15 = v14;
        if (v4 == 3 || v15)
        {
          id v16 = v10;
          v17 = [v16 MZDataByDeflatingWithGZip];

          if (v17) {
            [v13 setValue:v17 forKey:@"value"];
          }
          [v21 addObject:v13];
        }
        else if (v4 == 1)
        {
          [v21 addObject:v13];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }

  v18 = [(MZKeyValueStoreSerializer *)self dataWithNodes:v21];

  return v18;
}

- (id)sinceDomainVersion
{
  v3 = [(MZKeyValueStoreSerializer *)self transaction];
  unsigned int v4 = [v3 sinceDomainVersion];

  id v5 = [(MZKeyValueStoreSerializer *)self transaction];
  uint64_t v6 = [v5 processor];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(MZKeyValueStoreSerializer *)self transaction];
    objc_super v9 = [v8 processor];
    id v10 = [(MZKeyValueStoreSerializer *)self transaction];
    uint64_t v11 = [v9 sinceDomainVersionForTransaction:v10];

    unsigned int v4 = (void *)v11;
  }

  return v4;
}

- (BOOL)_isGetAllSinceDomainVersionRequest
{
  v3 = [(MZKeyValueStoreSerializer *)self transaction];
  if ([v3 type] == 1)
  {
    unsigned int v4 = [(MZKeyValueStoreSerializer *)self sinceDomainVersion];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isRemoveAllSinceDomainVersion
{
  v3 = [(MZKeyValueStoreSerializer *)self transaction];
  if ([v3 type] == 3)
  {
    unsigned int v4 = [(MZKeyValueStoreSerializer *)self sinceDomainVersion];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)baseDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = [(MZKeyValueStoreSerializer *)self transaction];
  BOOL v5 = [v4 domain];
  [v3 setObject:v5 forKey:@"domain"];

  if ([(MZKeyValueStoreSerializer *)self _isGetAllSinceDomainVersionRequest]
    || [(MZKeyValueStoreSerializer *)self _isRemoveAllSinceDomainVersion])
  {
    uint64_t v6 = [(MZKeyValueStoreSerializer *)self sinceDomainVersion];
    if ([(__CFString *)v6 isEqualToString:@"0"])
    {

      uint64_t v6 = @"0";
    }
    [v3 setObject:v6 forKey:@"since-domain-version"];
  }

  return v3;
}

- (id)dataWithNodes:(id)a3
{
  id v4 = a3;
  if ([v4 count]
    || [(MZKeyValueStoreSerializer *)self _isGetAllSinceDomainVersionRequest]
    || [(MZKeyValueStoreSerializer *)self _isRemoveAllSinceDomainVersion])
  {
    BOOL v5 = [(MZKeyValueStoreSerializer *)self baseDictionary];
    if (!v4)
    {
      id v4 = +[NSArray array];
    }
    [v5 setValue:v4 forKey:@"keys"];
    if (v5)
    {
      uint64_t v6 = +[NSPropertyListSerialization dataWithPropertyList:v5 format:kMZKeyValueStorePlistFormatNetworkData options:0 error:0];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)keys
{
  id v3 = [(MZKeyValueStoreSerializer *)self transaction];
  id v4 = [v3 keys];

  BOOL v5 = [(MZKeyValueStoreSerializer *)self transaction];
  uint64_t v6 = [v5 processor];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(MZKeyValueStoreSerializer *)self transaction];
    objc_super v9 = [v8 processor];
    id v10 = [(MZKeyValueStoreSerializer *)self transaction];
    uint64_t v11 = [v9 keysForTransaction:v10];

    id v4 = (void *)v11;
  }

  return v4;
}

- (MZKeyValueStoreDataVerionPair)objectVersionPairForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MZKeyValueStoreSerializer *)self transaction];
  unsigned int v6 = [v5 type];

  if (v6 == 1)
  {
    char v7 = [(MZKeyValueStoreSerializer *)self transaction];
    uint64_t v8 = [v7 processor];
    objc_super v9 = [(MZKeyValueStoreSerializer *)self transaction];
    uint64_t v10 = [v8 versionForGetTransaction:v9 key:v4];

    uint64_t v11 = 0;
    if (v10) {
      CFStringRef v12 = (const __CFString *)v10;
    }
    else {
      CFStringRef v12 = @"0";
    }
  }
  else if ((v6 & 0xFFFFFFFE) == 2)
  {
    v13 = [(MZKeyValueStoreSerializer *)self transaction];
    BOOL v14 = [v13 processor];
    int v15 = [(MZKeyValueStoreSerializer *)self transaction];
    id v19 = 0;
    uint64_t v11 = [v14 dataForSetTransaction:v15 key:v4 version:&v19];
    CFStringRef v16 = (const __CFString *)v19;

    if (v16) {
      CFStringRef v12 = v16;
    }
    else {
      CFStringRef v12 = @"1";
    }
  }
  else
  {
    CFStringRef v12 = 0;
    uint64_t v11 = 0;
  }

  v17 = (void *)v11;
  v18 = (__CFString *)v12;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (MZKeyValueStoreTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end