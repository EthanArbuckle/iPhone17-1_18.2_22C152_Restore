@interface EDKeyedCollection
- (BOOL)isObjectInMap:(id)a3;
- (BOOL)isOverwritingKeyOK;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectWithKey:(int64_t)a3;
- (unint64_t)addObject:(id)a3;
- (void)insertIntoMap:(id)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeAllObjects;
- (void)removeFromMap:(id)a3;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
@end

@implementation EDKeyedCollection

- (unint64_t)addObject:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EDKeyedCollection;
  id v5 = [(EDCollection *)&v7 addObject:v4];
  if (v5 != (id)-1) {
    [(EDKeyedCollection *)self insertIntoMap:v4];
  }

  return (unint64_t)v5;
}

- (void)insertIntoMap:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!self->mMap)
  {
    id v5 = objc_alloc_init(OITSUIntegerKeyDictionary);
    mMap = self->mMap;
    self->mMap = v5;

    id v4 = v7;
  }
  -[OITSUIntegerKeyDictionary setObject:forKey:](self->mMap, "setObject:forKey:", v7, [v4 key]);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([(EDCollection *)self count] >= a4)
  {
    v7.receiver = self;
    v7.super_class = (Class)EDKeyedCollection;
    [(EDCollection *)&v7 insertObject:v6 atIndex:a4];
    [(EDKeyedCollection *)self insertIntoMap:v6];
  }
}

- (id)objectWithKey:(int64_t)a3
{
  return [(OITSUIntegerKeyDictionary *)self->mMap objectForKey:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EDKeyedCollection;
  id v4 = [(EDCollection *)&v9 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(OITSUIntegerKeyDictionary *)self->mMap mutableCopy];
    id v6 = (void *)v4[2];
    v4[2] = v5;

    objc_super v7 = v4;
  }

  return v4;
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  if ([(EDCollection *)self count] > a3)
  {
    uint64_t v5 = [(EDCollection *)self objectAtIndex:a3];
    [(EDKeyedCollection *)self removeFromMap:v5];

    v6.receiver = self;
    v6.super_class = (Class)EDKeyedCollection;
    [(EDCollection *)&v6 removeObjectAtIndex:a3];
  }
}

- (void)removeFromMap:(id)a3
{
  id v4 = a3;
  -[OITSUIntegerKeyDictionary removeObjectForKey:](self->mMap, "removeObjectForKey:", [v4 key]);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  if ([(EDCollection *)self count] >= a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)EDKeyedCollection;
    [(EDCollection *)&v7 replaceObjectAtIndex:a3 withObject:v6];
    [(EDKeyedCollection *)self insertIntoMap:v6];
  }
}

- (void)removeAllObjects
{
  mMap = self->mMap;
  self->mMap = 0;

  v4.receiver = self;
  v4.super_class = (Class)EDKeyedCollection;
  [(EDCollection *)&v4 removeAllObjects];
}

- (void).cxx_destruct
{
}

- (BOOL)isObjectInMap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[EDKeyedCollection objectWithKey:](self, "objectWithKey:", [v4 key]);
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (BOOL)isOverwritingKeyOK
{
  return 0;
}

@end