@interface HomeResultCache
- (HomeResultCache)init;
- (id)resultForKey:(id)a3;
- (void)setResult:(id)a3 forKey:(id)a4;
@end

@implementation HomeResultCache

- (HomeResultCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)HomeResultCache;
  v2 = [(HomeResultCache *)&v9 init];
  if (v2)
  {
    uint64_t UInteger = GEOConfigGetUInteger();
    v2->_capacity = UInteger;
    uint64_t v4 = +[NSMutableArray arrayWithCapacity:UInteger];
    keys = v2->_keys;
    v2->_keys = (NSMutableArray *)v4;

    uint64_t v6 = +[NSMutableArray arrayWithCapacity:v2->_capacity];
    values = v2->_values;
    v2->_values = (NSMutableArray *)v6;
  }
  return v2;
}

- (id)resultForKey:(id)a3
{
  id v4 = a3;
  keys = self->_keys;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100105894;
  v12[3] = &unk_1012F1188;
  id v6 = v4;
  id v13 = v6;
  id v7 = [(NSMutableArray *)keys indexOfObjectPassingTest:v12];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    id v9 = v7;
    v8 = [(NSMutableArray *)self->_values objectAtIndexedSubscript:v7];
    if (v9)
    {
      v10 = [(NSMutableArray *)self->_keys objectAtIndexedSubscript:v9];
      [(NSMutableArray *)self->_keys removeObjectAtIndex:v9];
      [(NSMutableArray *)self->_values removeObjectAtIndex:v9];
      [(NSMutableArray *)self->_keys insertObject:v10 atIndex:0];
      [(NSMutableArray *)self->_values insertObject:v8 atIndex:0];
    }
  }

  return v8;
}

- (void)setResult:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  if (v6 && a4)
  {
    [(NSMutableArray *)self->_keys insertObject:a4 atIndex:0];
    [(NSMutableArray *)self->_values insertObject:v6 atIndex:0];
    while ((unint64_t)[(NSMutableArray *)self->_keys count] > self->_capacity)
    {
      [(NSMutableArray *)self->_keys removeLastObject];
      [(NSMutableArray *)self->_values removeLastObject];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_keys, 0);
}

@end