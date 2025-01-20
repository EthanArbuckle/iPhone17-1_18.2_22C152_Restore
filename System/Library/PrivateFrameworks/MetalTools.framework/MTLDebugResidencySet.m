@interface MTLDebugResidencySet
- (BOOL)containsAllocation:(id)a3;
- (MTLDebugResidencySet)initWithResidencySet:(id)a3 device:(id)a4;
- (id)allAllocations;
- (id)allCommittedAllocations;
- (unint64_t)allocatedSize;
- (unint64_t)allocationCount;
- (unint64_t)currentGeneration;
- (unint64_t)expiredGeneration;
- (unint64_t)generationForAllocation:(id)a3;
- (void)addAllocation:(id)a3;
- (void)addAllocations:(const void *)a3 count:(unint64_t)a4;
- (void)clearWriteBit;
- (void)commit;
- (void)endResidency;
- (void)removeAllAllocations;
- (void)removeAllocation:(id)a3;
- (void)removeAllocations:(const void *)a3 count:(unint64_t)a4;
- (void)requestResidency;
- (void)setCurrentGeneration:(unint64_t)a3;
- (void)setExpiredGeneration:(unint64_t)a3;
- (void)setWriteBit;
- (void)validateAllocation:(id)a3;
- (void)validateHeap:(id)a3;
- (void)validateResource:(id)a3;
@end

@implementation MTLDebugResidencySet

- (MTLDebugResidencySet)initWithResidencySet:(id)a3 device:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugResidencySet;
  result = [(MTLToolsResidencySet *)&v5 initWithBaseObject:a3 parent:a4];
  if (result) {
    atomic_store(0, &result->_accessStatus.__a_.__a_value);
  }
  return result;
}

- (void)validateHeap:(id)a3
{
  if (a3 && [a3 type] == 2)
  {
    MTLReportFailure();
  }
}

- (void)validateResource:(id)a3
{
  if (a3)
  {
    if ([a3 storageMode] == 3) {
      MTLReportFailure();
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && [a3 isSparse])
    {
      MTLReportFailure();
    }
  }
}

- (void)validateAllocation:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    [(MTLDebugResidencySet *)self validateResource:a3];
  }
  else
  {
    [(MTLDebugResidencySet *)self validateHeap:a3];
  }
}

- (unint64_t)allocatedSize
{
  if ((atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 1u) & 0x80000000) != 0) {
    MTLReportFailure();
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLDebugResidencySet;
  unint64_t result = [(MTLToolsResidencySet *)&v4 allocatedSize];
  atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 0xFFFFFFFF);
  return result;
}

- (void)endResidency
{
  if (atomic_fetch_or((atomic_uint *volatile)&self->_accessStatus, 0x80000000)) {
    MTLReportFailure();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugResidencySet;
  [(MTLToolsResidencySet *)&v3 endResidency];
  atomic_fetch_and((atomic_uint *volatile)&self->_accessStatus, 0x7FFFFFFFu);
}

- (void)commit
{
  if (atomic_fetch_or((atomic_uint *volatile)&self->_accessStatus, 0x80000000)) {
    MTLReportFailure();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugResidencySet;
  [(MTLToolsResidencySet *)&v3 commit];
  atomic_fetch_and((atomic_uint *volatile)&self->_accessStatus, 0x7FFFFFFFu);
}

- (void)requestResidency
{
  if (atomic_fetch_or((atomic_uint *volatile)&self->_accessStatus, 0x80000000)) {
    MTLReportFailure();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugResidencySet;
  [(MTLToolsResidencySet *)&v3 requestResidency];
  atomic_fetch_and((atomic_uint *volatile)&self->_accessStatus, 0x7FFFFFFFu);
}

- (void)addAllocations:(const void *)a3 count:(unint64_t)a4
{
  if (atomic_fetch_or((atomic_uint *volatile)&self->_accessStatus, 0x80000000)) {
    MTLReportFailure();
  }
  if (a4)
  {
    uint64_t v7 = 0;
    do
    {
      if (!a3[v7])
      {
        uint64_t v8 = v7;
        MTLReportFailure();
      }
      [(MTLDebugResidencySet *)self validateAllocation:v8];
      ++v7;
    }
    while (a4 != v7);
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugResidencySet;
  [(MTLToolsResidencySet *)&v9 addAllocations:a3 count:a4];
  atomic_fetch_and((atomic_uint *volatile)&self->_accessStatus, 0x7FFFFFFFu);
}

- (void)removeAllocations:(const void *)a3 count:(unint64_t)a4
{
  if (atomic_fetch_or((atomic_uint *volatile)&self->_accessStatus, 0x80000000)) {
    MTLReportFailure();
  }
  if (a4)
  {
    uint64_t v7 = 0;
    do
    {
      if (!a3[v7])
      {
        uint64_t v8 = v7;
        MTLReportFailure();
      }
      ++v7;
    }
    while (a4 != v7);
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugResidencySet;
  -[MTLToolsResidencySet removeAllocations:count:](&v9, sel_removeAllocations_count_, a3, a4, v8);
  atomic_fetch_and((atomic_uint *volatile)&self->_accessStatus, 0x7FFFFFFFu);
}

- (void)addAllocation:(id)a3
{
  if (atomic_fetch_or((atomic_uint *volatile)&self->_accessStatus, 0x80000000)) {
    MTLReportFailure();
  }
  if (!a3) {
    MTLReportFailure();
  }
  [(MTLDebugResidencySet *)self validateAllocation:a3];
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugResidencySet;
  [(MTLToolsResidencySet *)&v5 addAllocation:a3];
  atomic_fetch_and((atomic_uint *volatile)&self->_accessStatus, 0x7FFFFFFFu);
}

- (void)removeAllocation:(id)a3
{
  if (atomic_fetch_or((atomic_uint *volatile)&self->_accessStatus, 0x80000000)) {
    MTLReportFailure();
  }
  if (!a3) {
    MTLReportFailure();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugResidencySet;
  [(MTLToolsResidencySet *)&v5 removeAllocation:a3];
  atomic_fetch_and((atomic_uint *volatile)&self->_accessStatus, 0x7FFFFFFFu);
}

- (void)removeAllAllocations
{
  if (atomic_fetch_or((atomic_uint *volatile)&self->_accessStatus, 0x80000000)) {
    MTLReportFailure();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugResidencySet;
  [(MTLToolsResidencySet *)&v3 removeAllAllocations];
  atomic_fetch_and((atomic_uint *volatile)&self->_accessStatus, 0x7FFFFFFFu);
}

- (unint64_t)allocationCount
{
  if ((atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 1u) & 0x80000000) != 0) {
    MTLReportFailure();
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLDebugResidencySet;
  unint64_t result = [(MTLToolsResidencySet *)&v4 allocationCount];
  atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 0xFFFFFFFF);
  return result;
}

- (BOOL)containsAllocation:(id)a3
{
  if ((atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 1u) & 0x80000000) != 0) {
    MTLReportFailure();
  }
  v6.receiver = self;
  v6.super_class = (Class)MTLDebugResidencySet;
  BOOL result = [(MTLToolsResidencySet *)&v6 containsAllocation:a3];
  atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 0xFFFFFFFF);
  return result;
}

- (id)allAllocations
{
  if ((atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 1u) & 0x80000000) != 0) {
    MTLReportFailure();
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLDebugResidencySet;
  id result = [(MTLToolsResidencySet *)&v4 allAllocations];
  atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 0xFFFFFFFF);
  return result;
}

- (id)allCommittedAllocations
{
  if ((atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 1u) & 0x80000000) != 0) {
    MTLReportFailure();
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLDebugResidencySet;
  id result = [(MTLToolsResidencySet *)&v4 allCommittedAllocations];
  atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 0xFFFFFFFF);
  return result;
}

- (unint64_t)generationForAllocation:(id)a3
{
  if ((atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 1u) & 0x80000000) != 0) {
    MTLReportFailure();
  }
  v6.receiver = self;
  v6.super_class = (Class)MTLDebugResidencySet;
  unint64_t result = [(MTLToolsResidencySet *)&v6 generationForAllocation:a3];
  atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 0xFFFFFFFF);
  return result;
}

- (unint64_t)currentGeneration
{
  if ((atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 1u) & 0x80000000) != 0) {
    MTLReportFailure();
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLDebugResidencySet;
  unint64_t result = [(MTLToolsResidencySet *)&v4 currentGeneration];
  atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 0xFFFFFFFF);
  return result;
}

- (void)setCurrentGeneration:(unint64_t)a3
{
  if (atomic_fetch_or((atomic_uint *volatile)&self->_accessStatus, 0x80000000)) {
    MTLReportFailure();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugResidencySet;
  [(MTLToolsResidencySet *)&v5 setCurrentGeneration:a3];
  atomic_fetch_and((atomic_uint *volatile)&self->_accessStatus, 0x7FFFFFFFu);
}

- (unint64_t)expiredGeneration
{
  if ((atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 1u) & 0x80000000) != 0) {
    MTLReportFailure();
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLDebugResidencySet;
  unint64_t result = [(MTLToolsResidencySet *)&v4 expiredGeneration];
  atomic_fetch_add((atomic_uint *volatile)&self->_accessStatus, 0xFFFFFFFF);
  return result;
}

- (void)setExpiredGeneration:(unint64_t)a3
{
  if (atomic_fetch_or((atomic_uint *volatile)&self->_accessStatus, 0x80000000)) {
    MTLReportFailure();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugResidencySet;
  [(MTLToolsResidencySet *)&v5 setExpiredGeneration:a3];
  atomic_fetch_and((atomic_uint *volatile)&self->_accessStatus, 0x7FFFFFFFu);
}

- (void)setWriteBit
{
}

- (void)clearWriteBit
{
}

@end