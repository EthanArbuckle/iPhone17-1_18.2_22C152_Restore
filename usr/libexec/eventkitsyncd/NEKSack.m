@interface NEKSack
- (NEKSack)init;
- (NSMutableDictionary)dict;
- (int64_t)addObject:(id)a3;
- (int64_t)removeObject:(id)a3;
- (void)forEachUnique:(id)a3;
- (void)setDict:(id)a3;
@end

@implementation NEKSack

- (NEKSack)init
{
  v6.receiver = self;
  v6.super_class = (Class)NEKSack;
  v2 = [(NEKSack *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:32];
    dict = v2->_dict;
    v2->_dict = v3;
  }
  return v2;
}

- (int64_t)addObject:(id)a3
{
  id v4 = a3;
  v5 = [(NEKSack *)self dict];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6) {
    v7 = (_UNKNOWN **)v6;
  }
  else {
    v7 = &off_1000AF1E8;
  }
  v8 = (char *)[v7 integerValue] + 1;
  v9 = [(NEKSack *)self dict];
  v10 = +[NSNumber numberWithInteger:v8];
  [v9 setObject:v10 forKey:v4];

  return (int64_t)v8;
}

- (int64_t)removeObject:(id)a3
{
  id v4 = a3;
  v5 = [(NEKSack *)self dict];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6)
  {
    if ([v6 isEqualToNumber:&off_1000AF200])
    {
      v7 = [(NEKSack *)self dict];
      [v7 removeObjectForKey:v4];

      int64_t v8 = 1;
    }
    else
    {
      v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v6 integerValue] - 1);
      v10 = [(NEKSack *)self dict];
      [v10 setObject:v9 forKey:v4];

      int64_t v8 = (int64_t)[v6 integerValue];
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)forEachUnique:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(NEKSack *)self dict];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v9);
        v11 = [(NEKSack *)self dict];
        v12 = [v11 objectForKeyedSubscript:v10];
        v4[2](v4, v10, [v12 integerValue]);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (NSMutableDictionary)dict
{
  return self->_dict;
}

- (void)setDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end