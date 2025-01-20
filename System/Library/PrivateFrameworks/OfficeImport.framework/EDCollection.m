@interface EDCollection
+ (EDCollection)collectionWithObject:(id)a3;
+ (id)collection;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCollection:(id)a3;
- (EDCollection)init;
- (EDCollection)initWithObject:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)addObject:(id)a3;
- (unint64_t)addOrEquivalentObject:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (unint64_t)indexOfObject:(id)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeAllObjects;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
@end

@implementation EDCollection

- (EDCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)EDCollection;
  v2 = [(EDCollection *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mObjects = v2->mObjects;
    v2->mObjects = v3;
  }
  return v2;
}

- (unint64_t)addObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMutableArray *)self->mObjects addObject:v4];
    if ([v4 conformsToProtocol:&unk_26ECBC0F0]) {
      [v4 setDoNotModify:1];
    }
    unint64_t v5 = [(NSMutableArray *)self->mObjects count] - 1;
  }
  else
  {
    unint64_t v5 = -1;
  }

  return v5;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->mObjects count];
}

- (unint64_t)addOrEquivalentObject:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(EDCollection *)self indexOfObject:v4];
  if (v5 == -1) {
    unint64_t v5 = [(EDCollection *)self addObject:v4];
  }

  return v5;
}

- (unint64_t)indexOfObject:(id)a3
{
  unint64_t result = [(NSMutableArray *)self->mObjects indexOfObject:a3];
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    return -1;
  }
  return result;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->mObjects count] <= a3)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(NSMutableArray *)self->mObjects objectAtIndex:a3];
  }
  return v5;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([(NSMutableArray *)self->mObjects count] >= a4) {
    [(NSMutableArray *)self->mObjects insertObject:v6 atIndex:a4];
  }
}

+ (id)collection
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EDCollection *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(EDCollection *)self isEqualToCollection:v5];

  return v6;
}

- (BOOL)isEqualToCollection:(id)a3
{
  return [(NSMutableArray *)self->mObjects isEqualToArray:*((void *)a3 + 1)];
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->mObjects count];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5
    && (uint64_t v6 = [(NSMutableArray *)self->mObjects mutableCopyWithZone:a3],
        v7 = (void *)v5[1],
        v5[1] = v6,
        v7,
        v5[1]))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (EDCollection)initWithObject:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(EDCollection *)self init];
  uint64_t v6 = v5;
  if (v5) {
    [(NSMutableArray *)v5->mObjects addObject:v4];
  }

  return v6;
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->mObjects count] > a3)
  {
    mObjects = self->mObjects;
    [(NSMutableArray *)mObjects removeObjectAtIndex:a3];
  }
}

+ (EDCollection)collectionWithObject:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithObject:v3];

  return (EDCollection *)v4;
}

- (void)removeAllObjects
{
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  if ([(NSMutableArray *)self->mObjects count] >= a3) {
    [(NSMutableArray *)self->mObjects replaceObjectAtIndex:a3 withObject:v6];
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDCollection;
  id v2 = [(EDCollection *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end