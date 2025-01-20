@interface HTOrderedNSDict
- (HTOrderedNSDict)init;
- (HTOrderedNSDict)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)print:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation HTOrderedNSDict

- (HTOrderedNSDict)init
{
  v8.receiver = self;
  v8.super_class = (Class)HTOrderedNSDict;
  v2 = [(HTOrderedNSDict *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    values = v2->_values;
    v2->_values = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    keys = v2->_keys;
    v2->_keys = (NSMutableArray *)v5;
  }
  return v2;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_keys count];
}

- (id)keyEnumerator
{
  return [(NSMutableArray *)self->_keys objectEnumerator];
}

- (id)objectForKey:(id)a3
{
  id v4 = [(NSMutableArray *)self->_keys indexOfObject:a3];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_values objectAtIndexedSubscript:v4];
  }

  return v5;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(NSMutableArray *)self->_keys indexOfObject:v6];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_keys addObject:v6];
    [(NSMutableArray *)self->_values addObject:v8];
  }
  else
  {
    [(NSMutableArray *)self->_values setObject:v8 atIndexedSubscript:v7];
  }
}

- (void)print:(id)a3
{
  keys = self->_keys;
  id v5 = a3;
  id v6 = [(NSMutableArray *)self->_values objectAtIndexedSubscript:[(NSMutableArray *)keys indexOfObject:v5]];
  NSLog(@" key = %@, value  = %@", v5, v6);
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = [(NSMutableArray *)self->_keys indexOfObject:a3];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v4;
    [(NSMutableArray *)self->_values removeObjectAtIndex:v4];
    keys = self->_keys;
    [(NSMutableArray *)keys removeObjectAtIndex:v5];
  }
}

- (HTOrderedNSDict)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v19.receiver = self;
  v19.super_class = (Class)HTOrderedNSDict;
  id v8 = [(HTOrderedNSDict *)&v19 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    values = v8->_values;
    v8->_values = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    keys = v8->_keys;
    v8->_keys = (NSMutableArray *)v11;
  }
  for (; a5; --a5)
  {
    v13 = (id)*a4;
    v14 = (id)*a3;
    if (v13) {
      BOOL v15 = v14 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15) {
      objc_exception_throw(NSInvalidArgumentException);
    }
    v16 = v14;
    id v17 = [(NSMutableArray *)v8->_keys indexOfObject:v13];
    if (v17 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableArray *)v8->_keys addObject:v13];
      [(NSMutableArray *)v8->_values addObject:v16];
    }
    else
    {
      [(NSMutableArray *)v8->_values setObject:v16 atIndexedSubscript:v17];
    }

    ++a3;
    ++a4;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[HTOrderedNSDict allocWithZone:a3];
  values = self->_values;
  keys = self->_keys;

  return [(HTOrderedNSDict *)v4 initWithObjects:values forKeys:keys];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return [(HTOrderedNSDict *)self copyWithZone:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);

  objc_storeStrong((id *)&self->_values, 0);
}

@end