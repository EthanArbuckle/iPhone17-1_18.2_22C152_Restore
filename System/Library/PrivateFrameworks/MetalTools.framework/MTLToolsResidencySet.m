@interface MTLToolsResidencySet
- (BOOL)containsAllocation:(id)a3;
- (MTLToolsResidencySet)initWithBaseObject:(id)a3 parent:(id)a4;
- (NSArray)allAllocations;
- (NSArray)allCommittedAllocations;
- (NSString)label;
- (unint64_t)allocatedSize;
- (unint64_t)allocationCount;
- (unint64_t)countForAllocation:(id)a3;
- (unint64_t)currentGeneration;
- (unint64_t)expiredGeneration;
- (unint64_t)generationForAllocation:(id)a3;
- (void)addAllocation:(id)a3;
- (void)addAllocations:(const void *)a3 count:(unint64_t)a4;
- (void)commit;
- (void)dealloc;
- (void)endResidency;
- (void)removeAllAllocations;
- (void)removeAllocation:(id)a3;
- (void)removeAllocations:(const void *)a3 count:(unint64_t)a4;
- (void)requestResidency;
- (void)setCurrentGeneration:(unint64_t)a3;
- (void)setExpiredGeneration:(unint64_t)a3;
@end

@implementation MTLToolsResidencySet

- (NSString)label
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 label];
}

- (unint64_t)allocatedSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 allocatedSize];
}

- (void)endResidency
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 endResidency];
}

- (void)requestResidency
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 requestResidency];
}

- (unint64_t)currentGeneration
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 currentGeneration];
}

- (void)setCurrentGeneration:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setCurrentGeneration:a3];
}

- (unint64_t)expiredGeneration
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 expiredGeneration];
}

- (void)setExpiredGeneration:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setExpiredGeneration:a3];
}

- (MTLToolsResidencySet)initWithBaseObject:(id)a3 parent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MTLToolsResidencySet;
  id v4 = [(MTLToolsObject *)&v6 initWithBaseObject:a3 parent:a4];
  if (v4)
  {
    v4->_allocations = (NSMutableSet *)objc_opt_new();
    v4->_committedAllocations = (NSMutableSet *)objc_opt_new();
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsResidencySet;
  [(MTLToolsObject *)&v3 dealloc];
}

- (void)addAllocations:(const void *)a3 count:(unint64_t)a4
{
  std::vector<objc_object  {objcproto13MTLAllocation}*>::vector(__p, a4);
  if (a4)
  {
    uint64_t v7 = 0;
    do
    {
      v8 = (void *)a3[v7];
      [(NSMutableSet *)self->_allocations addObject:v8];
      uint64_t v9 = [v8 baseObject];
      *((void *)__p[0] + v7++) = v9;
    }
    while (a4 != v7);
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  [v10 addAllocations:__p[0] count:a4];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)removeAllocations:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  std::vector<objc_object  {objcproto13MTLAllocation}*>::vector(__p, a4);
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v8 = [(id)a3[i] baseObject];
      *((void *)__p[0] + i) = v8;
    }
  }
  id v9 = [(MTLToolsObject *)self baseObject];
  [v9 removeAllocations:__p[0] count:v4];
  for (; v4; --v4)
    [(NSMutableSet *)self->_allocations removeObject:*a3++];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)addAllocation:(id)a3
{
  -[NSMutableSet addObject:](self->_allocations, "addObject:");
  uint64_t v5 = [a3 baseObject];
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 addAllocation:v5];
}

- (void)removeAllocation:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "removeAllocation:", objc_msgSend(a3, "baseObject"));
  allocations = self->_allocations;

  [(NSMutableSet *)allocations removeObject:a3];
}

- (unint64_t)countForAllocation:(id)a3
{
  return [(NSMutableSet *)self->_allocations containsObject:a3];
}

- (unint64_t)generationForAllocation:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  uint64_t v5 = [a3 baseObject];

  return [v4 generationForAllocation:v5];
}

- (BOOL)containsAllocation:(id)a3
{
  return [(NSMutableSet *)self->_allocations containsObject:a3];
}

- (void)removeAllAllocations
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "removeAllAllocations");
  allocations = self->_allocations;

  [(NSMutableSet *)allocations removeAllObjects];
}

- (NSArray)allAllocations
{
  return (NSArray *)[(NSMutableSet *)self->_allocations allObjects];
}

- (NSArray)allCommittedAllocations
{
  return (NSArray *)[(NSMutableSet *)self->_committedAllocations allObjects];
}

- (unint64_t)allocationCount
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 allocationCount];
}

- (void)commit
{
  self->_committedAllocations = (NSMutableSet *)[(NSMutableSet *)self->_allocations copy];
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 commit];
}

@end