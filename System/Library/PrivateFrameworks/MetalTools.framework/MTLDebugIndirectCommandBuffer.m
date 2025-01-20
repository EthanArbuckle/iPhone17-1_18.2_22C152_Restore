@interface MTLDebugIndirectCommandBuffer
- (BOOL)purgeableStateValidForRendering;
- (MTLDebugIndirectCommandBuffer)initWithIndirectCommandBuffer:(id)a3 device:(id)a4 descriptor:(id)a5 maxCommandCount:(unint64_t)a6 options:(unint64_t)a7;
- (MTLIndirectCommandBufferDescriptor)descriptor;
- (NSMutableArray)optimizedRangeList;
- (id)indirectComputeCommandAtIndex:(unint64_t)a3;
- (id)indirectRenderCommandAtIndex:(unint64_t)a3;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (void)dealloc;
- (void)lockPurgeableState;
- (void)resetWithRange:(_NSRange)a3;
- (void)unlockPurgeableState;
@end

@implementation MTLDebugIndirectCommandBuffer

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugIndirectCommandBuffer;
  [(MTLToolsResource *)&v3 dealloc];
}

- (NSMutableArray)optimizedRangeList
{
  return self->_optimizedRangeList;
}

- (MTLIndirectCommandBufferDescriptor)descriptor
{
  return self->_desc;
}

- (MTLDebugIndirectCommandBuffer)initWithIndirectCommandBuffer:(id)a3 device:(id)a4 descriptor:(id)a5 maxCommandCount:(unint64_t)a6 options:(unint64_t)a7
{
  v15.receiver = self;
  v15.super_class = (Class)MTLDebugIndirectCommandBuffer;
  v11 = [(MTLToolsResource *)&v15 initWithBaseObject:a3 parent:a4];
  if (v11)
  {
    v12 = (NSMutableArray *)[MEMORY[0x263EFF980] array];
    v11->_optimizedRangeList = v12;
    v13 = v12;
    v11->_desc = (MTLIndirectCommandBufferDescriptor *)[a5 copy];
    v11->_maxCommandCount = a6;
    v11->_iCB = (MTLIndirectCommandBuffer *)a3;
    v11->super.super._options = a7;
    atomic_store(0, (unsigned int *)&v11->_purgeableStateToken);
    v11->_purgeableStateHasBeenSet = 0;
    v11->_isRender = ([(MTLIndirectCommandBufferDescriptor *)v11->_desc commandTypes] & 0x18F) != 0;
  }
  return v11;
}

- (id)indirectRenderCommandAtIndex:(unint64_t)a3
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "storageMode") == 2) {
    _MTLMessageContextPush_();
  }
  if (!self->_isRender)
  {
    MTLIndirectCommandType v10 = [(MTLIndirectCommandBufferDescriptor *)self->_desc commandTypes];
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v10), "size") <= a3)
  {
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "size");
    _MTLMessageContextPush_();
  }
  uint64_t v5 = _MTLMessageContextEnd();
  v6 = (void *)MEMORY[0x23ECD5710](v5);
  uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "indirectRenderCommandAtIndex:", a3);
  if (v7) {
    v8 = [[MTLDebugIndirectRenderCommand alloc] initWithBaseObject:v7 descriptor:self->_desc indexCount:a3 indirectCommandBuffer:self];
  }
  else {
    v8 = 0;
  }
  return v8;
}

- (id)indirectComputeCommandAtIndex:(unint64_t)a3
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "storageMode") == 2) {
    _MTLMessageContextPush_();
  }
  if (self->_isRender)
  {
    MTLIndirectCommandType v10 = [(MTLIndirectCommandBufferDescriptor *)self->_desc commandTypes];
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v10), "size") <= a3)
  {
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "size");
    _MTLMessageContextPush_();
  }
  uint64_t v5 = _MTLMessageContextEnd();
  v6 = (void *)MEMORY[0x23ECD5710](v5);
  uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "indirectComputeCommandAtIndex:", a3);
  if (v7) {
    v8 = [[MTLDebugIndirectComputeCommand alloc] initWithBaseObject:v7 descriptor:self->_desc indexCount:a3 indirectCommandBuffer:self];
  }
  else {
    v8 = 0;
  }
  return v8;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heap")) {
    _MTLMessageContextPush_();
  }
  if (a3 != 1)
  {
    if (a3 != 2)
    {
      if (atomic_load((unsigned int *)&self->_purgeableStateToken)) {
        _MTLMessageContextPush_();
      }
    }
    self->_purgeableStateHasBeenSet = 1;
  }
  _MTLMessageContextEnd();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setPurgeableState:", a3);
}

- (void)resetWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v13.NSUInteger length = [(MTLToolsIndirectCommandBuffer *)self size];
  v12.NSUInteger location = location;
  v12.NSUInteger length = length;
  v13.NSUInteger location = 0;
  NSRange v6 = NSIntersectionRange(v12, v13);
  if (v6.location != location || v6.length != length)
  {
    NSUInteger v9 = length;
    unint64_t v10 = [(MTLToolsIndirectCommandBuffer *)self size];
    NSUInteger v8 = location;
    MTLReportFailure();
  }
  v11.receiver = self;
  v11.super_class = (Class)MTLDebugIndirectCommandBuffer;
  -[MTLToolsIndirectCommandBuffer resetWithRange:](&v11, sel_resetWithRange_, location, length, v8, v9, v10);
}

- (void)lockPurgeableState
{
}

- (void)unlockPurgeableState
{
}

- (BOOL)purgeableStateValidForRendering
{
  return !self->_purgeableStateHasBeenSet
      || [(MTLDebugIndirectCommandBuffer *)self setPurgeableState:1] == 2;
}

@end