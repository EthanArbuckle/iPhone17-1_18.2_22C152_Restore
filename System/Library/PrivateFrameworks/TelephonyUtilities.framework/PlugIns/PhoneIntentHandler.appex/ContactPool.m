@interface ContactPool
- (ContactPool)initWithContacts:(id)a3;
- (NSArray)allContacts;
- (NSDictionary)contactByIdCache;
- (id)allContactIds;
- (id)contactWithId:(id)a3;
- (id)contactsWithIds:(id)a3;
- (unint64_t)count;
@end

@implementation ContactPool

- (ContactPool)initWithContacts:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ContactPool;
  v5 = [(ContactPool *)&v24 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    allContacts = v5->_allContacts;
    v5->_allContacts = v6;

    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "identifier", (void)v20);

          if (v15)
          {
            v16 = [v14 identifier];
            [v8 setObject:v14 forKeyedSubscript:v16];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v11);
    }

    v17 = (NSDictionary *)[v8 copy];
    contactByIdCache = v5->_contactByIdCache;
    v5->_contactByIdCache = v17;
  }
  return v5;
}

- (unint64_t)count
{
  v2 = [(ContactPool *)self allContacts];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)allContactIds
{
  v2 = [(ContactPool *)self contactByIdCache];
  id v3 = [v2 allKeys];
  id v4 = +[NSSet setWithArray:v3];

  return v4;
}

- (id)contactWithId:(id)a3
{
  id v4 = a3;
  v5 = [(ContactPool *)self contactByIdCache];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)contactsWithIds:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[ContactPool contactWithId:](self, "contactWithId:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

- (NSArray)allContacts
{
  return self->_allContacts;
}

- (NSDictionary)contactByIdCache
{
  return self->_contactByIdCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactByIdCache, 0);

  objc_storeStrong((id *)&self->_allContacts, 0);
}

@end