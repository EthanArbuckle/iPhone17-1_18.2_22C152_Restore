@interface WLKSortedKeyDictionary
- (NSDictionary)underlyingDictionary;
- (WLKSortedKeyDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)setUnderlyingDictionary:(id)a3;
@end

@implementation WLKSortedKeyDictionary

- (void).cxx_destruct
{
}

- (WLKSortedKeyDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)WLKSortedKeyDictionary;
  v8 = [(WLKSortedKeyDictionary *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:a3 forKeys:a4 count:a5];
    underlyingDictionary = v8->_underlyingDictionary;
    v8->_underlyingDictionary = (NSDictionary *)v9;
  }
  return v8;
}

- (id)keyEnumerator
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[WLKSortedKeyDictionary count](self, "count"));
  v4 = [(WLKSortedKeyDictionary *)self underlyingDictionary];
  v5 = [v4 keyEnumerator];

  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      [v3 addObject:v7];
      uint64_t v8 = [v5 nextObject];

      v7 = (void *)v8;
    }
    while (v8);
  }
  [v3 sortUsingSelector:sel_compare_];
  uint64_t v9 = [v3 objectEnumerator];

  return v9;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(WLKSortedKeyDictionary *)self underlyingDictionary];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (unint64_t)count
{
  v2 = [(WLKSortedKeyDictionary *)self underlyingDictionary];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSDictionary)underlyingDictionary
{
  return self->_underlyingDictionary;
}

- (void)setUnderlyingDictionary:(id)a3
{
}

@end