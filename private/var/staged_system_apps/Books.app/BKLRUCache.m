@interface BKLRUCache
- (BKLRUCache)initWithCapacity:(unint64_t)a3;
- (BKLRUCache)initWithCoder:(id)a3;
- (NSMutableArray)keys;
- (NSMutableDictionary)cache;
- (id)objectForKey:(id)a3;
- (unint64_t)capacity;
- (void)encodeWithCoder:(id)a3;
- (void)setCache:(id)a3;
- (void)setCapacity:(unint64_t)a3;
- (void)setKeys:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation BKLRUCache

- (BKLRUCache)initWithCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BKLRUCache;
  v4 = [(BKLRUCache *)&v10 init];
  if (v4)
  {
    uint64_t v5 = +[NSMutableDictionary dictionary];
    cache = v4->_cache;
    v4->_cache = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableArray array];
    keys = v4->_keys;
    v4->_keys = (NSMutableArray *)v7;

    v4->_capacity = a3;
  }
  return v4;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v19 = a4;
  id v6 = a3;
  uint64_t v7 = [(BKLRUCache *)self cache];
  v8 = [v7 objectForKey:v19];

  if (v8)
  {
    v9 = [(BKLRUCache *)self keys];
    [v9 removeObject:v19];
  }
  objc_super v10 = [(BKLRUCache *)self cache];
  [v10 setObject:v6 forKey:v19];

  v11 = [(BKLRUCache *)self keys];
  [v11 insertObject:v19 atIndex:0];

  v12 = [(BKLRUCache *)self keys];
  id v13 = [v12 count];
  unint64_t v14 = [(BKLRUCache *)self capacity];

  if ((unint64_t)v13 > v14)
  {
    v15 = [(BKLRUCache *)self keys];
    v16 = [v15 lastObject];

    v17 = [(BKLRUCache *)self cache];
    [v17 removeObjectForKey:v16];

    v18 = [(BKLRUCache *)self keys];
    [v18 removeLastObject];
  }
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKLRUCache *)self cache];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    uint64_t v7 = [(BKLRUCache *)self keys];
    [v7 removeObject:v4];

    v8 = [(BKLRUCache *)self keys];
    [v8 insertObject:v4 atIndex:0];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(BKLRUCache *)self cache];
  [v6 encodeObject:v4 forKey:@"cache"];

  uint64_t v5 = [(BKLRUCache *)self keys];
  [v6 encodeObject:v5 forKey:@"keys"];

  [v6 encodeInteger:[self capacity] forKey:@"capacity"];
}

- (BKLRUCache)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKLRUCache;
  uint64_t v5 = [(BKLRUCache *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"cache"];
    cache = v5->_cache;
    v5->_cache = (NSMutableDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"keys"];
    keys = v5->_keys;
    v5->_keys = (NSMutableArray *)v8;

    id v10 = [v4 decodeIntegerForKey:@"capacity"];
    uint64_t v11 = 2;
    if (v10) {
      uint64_t v11 = (uint64_t)v10;
    }
    v5->_capacity = v11;
  }

  return v5;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (NSMutableArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end