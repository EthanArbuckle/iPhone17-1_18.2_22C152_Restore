@interface ML3ImportPersistentIDGenerator
- (ML3ImportPersistentIDGenerator)initWithDatabaseConnection:(id)a3 tableName:(id)a4;
- (int64_t)nextPersistentIDForImportItem:(shared_ptr<ML3ImportItem>)a3;
- (void)addIdMapping:(id)a3 forProperty:(unsigned int)a4;
- (void)removePersistentIDFromIdMapping:(int64_t)a3;
@end

@implementation ML3ImportPersistentIDGenerator

- (void).cxx_destruct
{
}

- (void)removePersistentIDFromIdMapping:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(NSMutableDictionary *)self->_pregeneratedIdMappings allKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v21;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = [(NSMutableDictionary *)self->_pregeneratedIdMappings objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * v6)];
        v8 = [NSNumber numberWithLongLong:a3];
        v9 = [v7 allKeysForObject:v8];

        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v17;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v10);
              }
              [v7 removeObjectForKey:*(void *)(*((void *)&v16 + 1) + 8 * v13++)];
            }
            while (v11 != v13);
            uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v11);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }
}

- (int64_t)nextPersistentIDForImportItem:(shared_ptr<ML3ImportItem>)a3
{
  var0 = a3.var0;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(NSMutableDictionary *)self->_pregeneratedIdMappings allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (!v5)
  {

LABEL_13:
    long long v21 = sel_nextPersistentID;
    do
    {
      v28.receiver = self;
      v28.super_class = (Class)ML3ImportPersistentIDGenerator;
      id v6 = objc_msgSendSuper2(&v28, v21, v21);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id obja = [(NSMutableDictionary *)self->_pregeneratedIdMappings allKeys];
      uint64_t v12 = [obja countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(obja);
            }
            v15 = [(NSMutableDictionary *)self->_pregeneratedIdMappings objectForKey:*(void *)(*((void *)&v24 + 1) + 8 * i)];
            long long v16 = [NSNumber numberWithLongLong:v6];
            long long v17 = [v15 allKeysForObject:v16];
            BOOL v18 = [v17 count] == 0;

            if (!v18) {
              id v6 = 0;
            }
          }
          uint64_t v12 = [obja countByEnumeratingWithState:&v24 objects:v33 count:16];
        }
        while (v12);
      }
    }
    while (!v6);
    return (int64_t)v6;
  }
  id v6 = 0;
  SEL v20 = *(SEL *)v30;
  do
  {
    for (uint64_t j = 0; j != v5; ++j)
    {
      if (*(SEL *)v30 != v20) {
        objc_enumerationMutation(obj);
      }
      v8 = *(void **)(*((void *)&v29 + 1) + 8 * j);
      v9 = -[NSMutableDictionary objectForKey:](self->_pregeneratedIdMappings, "objectForKey:", v8, v20);
      id v10 = objc_msgSend(NSNumber, "numberWithLongLong:", (*(uint64_t (**)(void, uint64_t))(**(void **)var0 + 32))(*(void *)var0, objc_msgSend(v8, "longLongValue")));
      uint64_t v11 = [v9 objectForKey:v10];

      if (v11) {
        id v6 = (id)[v11 longLongValue];
      }
    }
    uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  }
  while (v5);

  if (!v6) {
    goto LABEL_13;
  }
  return (int64_t)v6;
}

- (void)addIdMapping:(id)a3 forProperty:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  pregeneratedIdMappings = self->_pregeneratedIdMappings;
  id v7 = (id)[a3 mutableCopy];
  id v6 = [NSNumber numberWithUnsignedInt:v4];
  [(NSMutableDictionary *)pregeneratedIdMappings setObject:v7 forKey:v6];
}

- (ML3ImportPersistentIDGenerator)initWithDatabaseConnection:(id)a3 tableName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3ImportPersistentIDGenerator;
  v8 = [(ML3PersistentIDGenerator *)&v12 initWithDatabaseConnection:v6 tableName:v7];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    pregeneratedIdMappings = v8->_pregeneratedIdMappings;
    v8->_pregeneratedIdMappings = (NSMutableDictionary *)v9;
  }
  return v8;
}

@end