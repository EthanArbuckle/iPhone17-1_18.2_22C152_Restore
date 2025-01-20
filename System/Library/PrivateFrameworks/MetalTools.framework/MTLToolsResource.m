@interface MTLToolsResource
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (BOOL)isPurgeable;
- (MTLHeap)heap;
- (MTLToolsResource)initWithBaseObject:(id)a3 parent:(id)a4;
- (MTLToolsResource)initWithBaseObject:(id)a3 parent:(id)a4 heap:(id)a5;
- (NSString)label;
- (int)responsibleProcess;
- (int)setOwnerWithIdentity:(unsigned int)a3;
- (unint64_t)allocatedSize;
- (unint64_t)allocationID;
- (unint64_t)cpuCacheMode;
- (unint64_t)hazardTrackingMode;
- (unint64_t)heapOffset;
- (unint64_t)options;
- (unint64_t)protectionOptions;
- (unint64_t)resourceOptions;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)storageMode;
- (unint64_t)unfilteredResourceOptions;
- (void)dealloc;
- (void)makeAliasable;
- (void)setLabel:(id)a3;
- (void)setResponsibleProcess:(int)a3;
- (void)validateCPUReadable;
- (void)validateCPUWriteable;
- (void)waitUntilComplete;
@end

@implementation MTLToolsResource

- (NSString)label
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 label];
}

- (void)setLabel:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setLabel:a3];
}

- (unint64_t)cpuCacheMode
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 cpuCacheMode];
}

- (unint64_t)storageMode
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 storageMode];
}

- (unint64_t)hazardTrackingMode
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 hazardTrackingMode];
}

- (unint64_t)resourceOptions
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 resourceOptions];
}

- (unint64_t)unfilteredResourceOptions
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 unfilteredResourceOptions];
}

- (BOOL)isAliasable
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isAliasable];
}

- (void)makeAliasable
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 makeAliasable];
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 setPurgeableState:a3];
}

- (unint64_t)heapOffset
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 heapOffset];
}

- (BOOL)isPurgeable
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isPurgeable];
}

- (int)responsibleProcess
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 responsibleProcess];
}

- (void)setResponsibleProcess:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setResponsibleProcess:v3];
}

- (unint64_t)protectionOptions
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 protectionOptions];
}

- (unint64_t)allocationID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 allocationID];
}

- (MTLToolsResource)initWithBaseObject:(id)a3 parent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTLToolsResource;
  v5 = -[MTLToolsObject initWithBaseObject:parent:](&v7, sel_initWithBaseObject_parent_, a3);
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5->_heap = (MTLToolsHeap *)(id)[a4 heap];
    }
  }
  return v5;
}

- (MTLToolsResource)initWithBaseObject:(id)a3 parent:(id)a4 heap:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MTLToolsResource;
  v6 = [(MTLToolsObject *)&v8 initWithBaseObject:a3 parent:a4];
  if (v6) {
    v6->_heap = (MTLToolsHeap *)a5;
  }
  return v6;
}

- (void)dealloc
{
  [(MTLToolsHeap *)self->_heap notifyResourceReleasing:self];

  v3.receiver = self;
  v3.super_class = (Class)MTLToolsResource;
  [(MTLToolsObject *)&v3 dealloc];
}

- (BOOL)doesAliasResource:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  uint64_t v5 = [a3 baseObject];

  return [v4 doesAliasResource:v5];
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  v6 = (char *)v12 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    objc_super v7 = a3;
    objc_super v8 = (void *)((char *)v12 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v9 = a4;
    do
    {
      v10 = (void *)*v7++;
      *v8++ = [v10 baseObject];
      --v9;
    }
    while (v9);
  }
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "doesAliasAllResources:count:", v6, a4);
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  v6 = (char *)v12 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    objc_super v7 = a3;
    objc_super v8 = (void *)((char *)v12 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v9 = a4;
    do
    {
      v10 = (void *)*v7++;
      *v8++ = [v10 baseObject];
      --v9;
    }
    while (v9);
  }
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "doesAliasAnyResources:count:", v6, a4);
}

- (MTLHeap)heap
{
  return (MTLHeap *)self->_heap;
}

- (BOOL)isComplete
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isComplete];
}

- (void)waitUntilComplete
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 waitUntilComplete];
}

- (void)validateCPUReadable
{
  uint64_t v2 = self->_options >> 4;
  if (v2 == 2 || v2 == 3) {
    MTLReportFailure();
  }
}

- (void)validateCPUWriteable
{
  uint64_t v2 = self->_options >> 4;
  if (v2 == 2 || v2 == 3) {
    MTLReportFailure();
  }
}

- (unint64_t)allocatedSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 allocatedSize];
}

- (int)setOwnerWithIdentity:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 setOwnerWithIdentity:v3];
}

- (unint64_t)options
{
  return self->_options;
}

@end