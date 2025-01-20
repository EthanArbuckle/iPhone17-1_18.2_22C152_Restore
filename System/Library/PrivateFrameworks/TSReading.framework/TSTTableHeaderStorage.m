@interface TSTTableHeaderStorage
- (TSTTableHeaderStorage)initWithOwner:(id)a3;
- (id)headerForKey:(unsigned int)a3 willModify:(BOOL)a4;
- (id)headerForKey:(unsigned int)a3 willModify:(BOOL)a4 createIfNotThere:(BOOL)a5;
- (int64_t)count;
- (unsigned)lowerBound:(unsigned int)a3;
- (unsigned)maxKey;
- (unsigned)minKey;
- (unsigned)upperBound:(unsigned int)a3;
- (void)applyFunction:(void *)a3 withState:(void *)a4 willModify:(BOOL)a5;
- (void)dealloc;
- (void)makeHeadersPerformSelector:(SEL)a3 willModify:(BOOL)a4;
- (void)removeAllHeaders;
- (void)removeHeaderForKey:(unsigned int)a3;
- (void)setHeader:(id)a3 forKey:(unsigned int)a4;
- (void)shiftKeysAtIndex:(unsigned int)a3 amount:(int)a4;
@end

@implementation TSTTableHeaderStorage

- (TSTTableHeaderStorage)initWithOwner:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSTTableHeaderStorage;
  v4 = -[TSPContainedObject initWithOwner:](&v6, sel_initWithOwner_);
  if (v4) {
    v4->mBuckets[0] = -[TSTTableHeaderStorageBucket initWithContext:]([TSTTableHeaderStorageBucket alloc], "initWithContext:", [a3 context]);
  }
  return v4;
}

- (void)dealloc
{
  self->mBuckets[0] = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTTableHeaderStorage;
  [(TSTTableHeaderStorage *)&v3 dealloc];
}

- (id)headerForKey:(unsigned int)a3 willModify:(BOOL)a4
{
  return [(TSTTableHeaderStorageBucket *)self->mBuckets[0] headerForKey:*(void *)&a3 willModify:a4];
}

- (id)headerForKey:(unsigned int)a3 willModify:(BOOL)a4 createIfNotThere:(BOOL)a5
{
  return [(TSTTableHeaderStorageBucket *)self->mBuckets[0] headerForKey:*(void *)&a3 willModify:a4 createIfNotThere:a5];
}

- (void)setHeader:(id)a3 forKey:(unsigned int)a4
{
}

- (void)removeHeaderForKey:(unsigned int)a3
{
}

- (void)removeAllHeaders
{
}

- (void)makeHeadersPerformSelector:(SEL)a3 willModify:(BOOL)a4
{
}

- (void)applyFunction:(void *)a3 withState:(void *)a4 willModify:(BOOL)a5
{
}

- (void)shiftKeysAtIndex:(unsigned int)a3 amount:(int)a4
{
}

- (int64_t)count
{
  return [(TSTTableHeaderStorageBucket *)self->mBuckets[0] count];
}

- (unsigned)minKey
{
  return [(TSTTableHeaderStorageBucket *)self->mBuckets[0] minKey];
}

- (unsigned)maxKey
{
  return [(TSTTableHeaderStorageBucket *)self->mBuckets[0] maxKey];
}

- (unsigned)upperBound:(unsigned int)a3
{
  return [(TSTTableHeaderStorageBucket *)self->mBuckets[0] upperBound:*(void *)&a3];
}

- (unsigned)lowerBound:(unsigned int)a3
{
  return [(TSTTableHeaderStorageBucket *)self->mBuckets[0] lowerBound:*(void *)&a3];
}

@end