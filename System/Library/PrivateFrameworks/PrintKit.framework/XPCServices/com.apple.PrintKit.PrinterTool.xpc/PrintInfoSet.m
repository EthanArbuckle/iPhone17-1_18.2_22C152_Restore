@interface PrintInfoSet
- (PrintInfoSet)init;
- (id)uniquedBrowseInfos;
- (int)addInfo:(id)a3;
- (int)removeInfo:(id)a3;
- (int)updateInfo:(id)a3;
@end

@implementation PrintInfoSet

- (PrintInfoSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)PrintInfoSet;
  v2 = [(PrintInfoSet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    uuidToPrinters = v2->_uuidToPrinters;
    v2->_uuidToPrinters = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (int)addInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuid];
  int v6 = 65537;
  if (v5)
  {
    v7 = [(NSMutableDictionary *)self->_uuidToPrinters objectForKeyedSubscript:v5];
    if (!v7)
    {
      v7 = +[NSArray array];
    }
    if (([v7 containsObject:v4] & 1) == 0)
    {
      id v8 = [v7 mutableCopy];
      [v8 addObject:v4];
      id v9 = [v8 sortedArrayUsingSelector:"compare:"];
      [(NSMutableDictionary *)self->_uuidToPrinters setObject:v8 forKeyedSubscript:v5];
      v10 = [v8 objectAtIndexedSubscript:0];
      if ([v10 compare:v4]) {
        int v6 = 65540;
      }
      else {
        int v6 = 65538;
      }
    }
  }

  return v6;
}

- (int)removeInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuid];
  int v6 = [(NSMutableDictionary *)self->_uuidToPrinters objectForKeyedSubscript:v5];
  id v7 = [v6 indexOfObject:v4];
  int v8 = 262145;
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [v6 mutableCopy];
    [v9 removeObjectAtIndex:v7];
    [(NSMutableDictionary *)self->_uuidToPrinters setObject:v9 forKeyedSubscript:v5];
    if (v7) {
      int v8 = 262148;
    }
    else {
      int v8 = 262146;
    }
  }
  return v8;
}

- (int)updateInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuid];
  int v6 = [(NSMutableDictionary *)self->_uuidToPrinters objectForKeyedSubscript:v5];
  id v7 = [v6 indexOfObject:v4];
  int v8 = 524289;
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [v6 mutableCopy];
    [v9 setObject:v4 atIndexedSubscript:v7];
    [(NSMutableDictionary *)self->_uuidToPrinters setObject:v9 forKeyedSubscript:v5];
    if (v7) {
      int v8 = 524289;
    }
    else {
      int v8 = 524290;
    }
  }
  return v8;
}

- (id)uniquedBrowseInfos
{
  uint64_t v3 = [(NSMutableDictionary *)self->_uuidToPrinters allKeys];
  id v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToPrinters, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if ([v9 count])
        {
          v10 = [v9 firstObject];
          [v4 addObject:v10];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v11 = +[NSSet setWithArray:v4];

  return v11;
}

- (void).cxx_destruct
{
}

@end