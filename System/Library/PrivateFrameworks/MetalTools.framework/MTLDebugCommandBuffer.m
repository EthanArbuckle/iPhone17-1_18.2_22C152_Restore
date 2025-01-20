@interface MTLDebugCommandBuffer
- (BOOL)testObjectReferenced:(id)a3 wasInternallyRetained:(BOOL *)a4;
- (MTLDebugCommandBuffer)initWithCommandBuffer:(id)a3 commandQueue:(id)a4 descriptor:(id)a5;
- (id).cxx_construct;
- (id)accelerationStructureCommandEncoder;
- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3;
- (id)blitCommandEncoder;
- (id)blitCommandEncoderWithDescriptor:(id)a3;
- (id)computeCommandEncoder;
- (id)computeCommandEncoderWithDescriptor:(id)a3;
- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3;
- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3;
- (id)renderCommandEncoderWithDescriptor:(id)a3;
- (id)resourceStateCommandEncoder;
- (id)resourceStateCommandEncoderWithDescriptor:(id)a3;
- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4;
- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)unwrapMTLRenderPassDescriptor:(id)a3;
- (void)_removeUsedRenderTargetsExcept:(id)a3;
- (void)addActiveRenderTargets:(id)a3;
- (void)addCompletedHandler:(id)a3;
- (void)addObject:(id)a3 retained:(BOOL)a4 purgeable:(BOOL)a5;
- (void)addPurgeableObject:(id)a3;
- (void)addReferencedObject:(id)a3 internallyRetained:(BOOL)a4;
- (void)addScheduledHandler:(id)a3;
- (void)addSynchronizationNotification:(id)a3;
- (void)commitWithDeadline:(unint64_t)a3;
- (void)dealloc;
- (void)debugBufferContentsWithLength:(unint64_t *)a3;
- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 value:(unint64_t)a5 forIndex:(unint64_t)a6;
- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 values:(const unint64_t *)a5 indices:(const unint64_t *)a6 count:(unint64_t)a7;
- (void)encodeDashboardTagForResourceGroup:(id)a3;
- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4;
- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4;
- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4 timeout:(unsigned int)a5;
- (void)executeSynchronizationNotifications:(int)a3;
- (void)executeSynchronizationNotifications:(int)a3 scope:(unint64_t)a4 resources:(const void *)a5 count:(unint64_t)a6;
- (void)lockPurgeableObjects;
- (void)postCompletionHandlers;
- (void)preCommit;
- (void)preCompletionHandlers;
- (void)removeAllReferencedObjects:(BOOL)a3;
- (void)unlockPurgeableObjects;
- (void)useInternalResidencySet:(id)a3;
- (void)useInternalResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)validateStoreLoadTransition:(id)a3 atIndex:(unint64_t)a4 renderTargetArrayLength:(unint64_t)a5;
- (void)waitUntilCompleted;
- (void)waitUntilScheduled;
@end

@implementation MTLDebugCommandBuffer

- (void)dealloc
{
  if ([(MTLToolsCommandBuffer *)self status] - 1 <= 2) {
    MTLReportFailure();
  }
  std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);

  uint64_t v3 = 0;
  self->_renderTargetAttachments = 0;
  memset(__src, 0, sizeof(__src));
  do
  {
    v4 = (char *)__src + v3;
    *((_OWORD *)v4 + 1) = 0uLL;
    *((_OWORD *)v4 + 2) = 0uLL;
    *(_OWORD *)v4 = 0uLL;
    *((void *)v4 + 6) = 4;
    v3 += 56;
  }
  while (v3 != 448);
  memcpy(&self->_prevAttachments, __src, sizeof(self->_prevAttachments));
  uint64_t v5 = 0;
  memset(__src, 0, sizeof(__src));
  do
  {
    v6 = (char *)__src + v5;
    *((_OWORD *)v6 + 1) = 0uLL;
    *((_OWORD *)v6 + 2) = 0uLL;
    *(_OWORD *)v6 = 0uLL;
    *((void *)v6 + 6) = 4;
    v5 += 56;
  }
  while (v5 != 448);
  memcpy(&self->_currAttachments, __src, sizeof(self->_currAttachments));

  v7.receiver = self;
  v7.super_class = (Class)MTLDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v7 dealloc];
}

- (MTLDebugCommandBuffer)initWithCommandBuffer:(id)a3 commandQueue:(id)a4 descriptor:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugCommandBuffer;
  uint64_t v5 = [(MTLToolsCommandBuffer *)&v8 initWithCommandBuffer:a3 parent:a4 descriptor:a5];
  v6 = v5;
  if (v5)
  {
    v5->_currentEncoder = 0;
    v5->_purgeableObjectsLock._os_unfair_lock_opaque = 0;
    v5->_retainedObjectsLock._os_unfair_lock_opaque = 0;
    v5->_renderTargetAttachmentLock._os_unfair_lock_opaque = 0;
    v5->_renderTargetAttachments = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    pthread_once(&initLifetimeOptions(void)::token, (void (*)(void))initLifetimeOptions(void)::$_0::__invoke);
    if (checkLifetimeOfExternallyReferencedObjects | checkLifetimeOfInternallyReferencedObjects) {
      [*(id *)&v6->MTLToolsCommandBuffer_opaque[24] addReferenceTrackingCommandBuffer:v6];
    }
  }
  return v6;
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    objc_super v8 = (MTLDevice *)[a3 device];
    if (v8 != [(MTLToolsObject *)self device]) {
      MTLReportFailure();
    }
  }
  [(MTLDebugCommandBuffer *)self addObject:a3 retained:1 purgeable:0];
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v9 encodeWaitForEvent:a3 value:a4];
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    v10 = (MTLDevice *)[a3 device];
    if (v10 != [(MTLToolsObject *)self device]) {
      MTLReportFailure();
    }
  }
  [(MTLDebugCommandBuffer *)self addObject:a3 retained:1 purgeable:0];
  v11.receiver = self;
  v11.super_class = (Class)MTLDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v11 encodeWaitForEvent:a3 value:a4 timeout:v5];
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    objc_super v8 = (MTLDevice *)[a3 device];
    if (v8 != [(MTLToolsObject *)self device]) {
      MTLReportFailure();
    }
  }
  [(MTLDebugCommandBuffer *)self addObject:a3 retained:1 purgeable:0];
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v9 encodeSignalEvent:a3 value:a4];
}

- (void)waitUntilScheduled
{
  if ((objc_msgSend(-[MTLToolsObject originalObject](self, "originalObject"), "isCommitted") & 1) == 0) {
    MTLReportFailure();
  }
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 waitUntilScheduled];
}

- (void)waitUntilCompleted
{
  if ((objc_msgSend(-[MTLToolsObject originalObject](self, "originalObject"), "isCommitted") & 1) == 0) {
    MTLReportFailure();
  }
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 waitUntilCompleted];
}

- (id)blitCommandEncoder
{
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    MTLReportFailure();
  }

  self->_currentEncoder = 0;
  v4 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "blitCommandEncoder");
  if (v5)
  {
    v6 = [[MTLDebugBlitCommandEncoder alloc] initWithBlitCommandEncoder:v5 commandBuffer:self descriptor:0];
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    uint64_t v7 = 0;
    memset(v10, 0, sizeof(v10));
    do
    {
      objc_super v8 = (char *)v10 + v7;
      *((_OWORD *)v8 + 1) = 0uLL;
      *((_OWORD *)v8 + 2) = 0uLL;
      *(_OWORD *)objc_super v8 = 0uLL;
      *((void *)v8 + 6) = 4;
      v7 += 56;
    }
    while (v7 != 448);
    memcpy(&self->_currAttachments, v10, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)[(MTLToolsObject *)v6 originalObject];
    return v6;
  }
  else
  {
    return 0;
  }
}

- (id)resourceStateCommandEncoder
{
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    MTLReportFailure();
  }

  self->_currentEncoder = 0;
  v4 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceStateCommandEncoder");
  if (v5)
  {
    v6 = [[MTLDebugResourceStateCommandEncoder alloc] initWithResourceStateCommandEncoder:v5 commandBuffer:self descriptor:0];
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    uint64_t v7 = 0;
    memset(v10, 0, sizeof(v10));
    do
    {
      objc_super v8 = (char *)v10 + v7;
      *((_OWORD *)v8 + 1) = 0uLL;
      *((_OWORD *)v8 + 2) = 0uLL;
      *(_OWORD *)objc_super v8 = 0uLL;
      *((void *)v8 + 6) = 4;
      v7 += 56;
    }
    while (v7 != 448);
    memcpy(&self->_currAttachments, v10, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)[(MTLToolsObject *)v6 originalObject];
    return v6;
  }
  else
  {
    return 0;
  }
}

- (void)addCompletedHandler:(id)a3
{
  if (!a3) {
    MTLReportFailure();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v5 addCompletedHandler:a3];
}

- (void)addScheduledHandler:(id)a3
{
  if (!a3) {
    MTLReportFailure();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v5 addScheduledHandler:a3];
}

- (id)unwrapMTLRenderPassDescriptor:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugCommandBuffer;
  id v5 = -[MTLToolsCommandBuffer unwrapMTLRenderPassDescriptor:](&v10, sel_unwrapMTLRenderPassDescriptor_);
  uint64_t v6 = 0;
  uint64_t v7 = *(void **)[a3 _descriptorPrivate];
  do
  {
    if (objc_msgSend(v7, "_descriptorAtIndex:", v6, v9)
      && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "colorAttachments"), "objectAtIndexedSubscript:", v6), "loadAction")&& -[MTLDevice loadValidationEnabled](-[MTLToolsObject device](self, "device"), "loadValidationEnabled"))
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "colorAttachments"), "objectAtIndexedSubscript:", v6), "setLoadAction:", 2);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "colorAttachments"), "objectAtIndexedSubscript:", v6), "setClearColor:", 1.0, 0.0, 1.0, 1.0);
      uint64_t v9 = v6;
      MTLReportFailure();
    }
    ++v6;
  }
  while (v6 != 8);
  if ([v7 _descriptorAtIndex:8]
    && !objc_msgSend((id)objc_msgSend(v5, "depthAttachment"), "loadAction")
    && [(MTLDevice *)[(MTLToolsObject *)self device] loadValidationEnabled])
  {
    objc_msgSend((id)objc_msgSend(v5, "depthAttachment"), "setLoadAction:", 2);
    objc_msgSend((id)objc_msgSend(v5, "depthAttachment"), "setClearDepth:", 0.5);
    MTLReportFailure();
  }
  if (objc_msgSend(v7, "_descriptorAtIndex:", 9, v9)
    && !objc_msgSend((id)objc_msgSend(v5, "stencilAttachment"), "loadAction")
    && [(MTLDevice *)[(MTLToolsObject *)self device] loadValidationEnabled])
  {
    objc_msgSend((id)objc_msgSend(v5, "stencilAttachment"), "setLoadAction:", 2);
    objc_msgSend((id)objc_msgSend(v5, "stencilAttachment"), "setClearStencil:", 2863311530);
    MTLReportFailure();
  }
  return v5;
}

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    _MTLMessageContextPush_();
  }
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  if (MTLReportFailureTypeEnabled()) {
    validateRenderPassDescriptor(a3, [(MTLToolsObject *)self device], &self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)&self->_prevAttachments, (uint64_t)&self->_currAttachments);
  }
  id v6 = [(MTLDebugCommandBuffer *)self unwrapMTLRenderPassDescriptor:a3];

  self->_currentEncoder = 0;
  uint64_t v7 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderCommandEncoderWithDescriptor:", v6);
  if (v8)
  {
    uint64_t v9 = [[MTLDebugRenderCommandEncoder alloc] initWithRenderCommandEncoder:v8 parent:self descriptor:a3];
    self->_currentEncoder = (_MTLCommandEncoder *)[(MTLToolsObject *)v9 originalObject];
    return v9;
  }
  else
  {
    return 0;
  }
}

- (id)computeCommandEncoder
{
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    MTLReportFailure();
  }

  self->_currentEncoder = 0;
  v4 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoder");
  if (v5)
  {
    id v6 = [[MTLDebugComputeCommandEncoder alloc] initWithComputeCommandEncoder:v5 commandBuffer:self descriptor:0];
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    uint64_t v7 = 0;
    memset(v10, 0, sizeof(v10));
    do
    {
      uint64_t v8 = (char *)v10 + v7;
      *((_OWORD *)v8 + 1) = 0uLL;
      *((_OWORD *)v8 + 2) = 0uLL;
      *(_OWORD *)uint64_t v8 = 0uLL;
      *((void *)v8 + 6) = 4;
      v7 += 56;
    }
    while (v7 != 448);
    memcpy(&self->_currAttachments, v10, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)[(MTLToolsObject *)v6 originalObject];
    return v6;
  }
  else
  {
    return 0;
  }
}

- (id)computeCommandEncoderWithDescriptor:(id)a3
{
  uint64_t v14 = 0;
  memset(&v13[28], 0, 48);
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    _MTLMessageContextPush_();
  }
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    _MTLMessageContextPush_();
  }
  if (MTLReportFailureTypeEnabled()) {
    validateComputePassDescriptor(a3, [(MTLToolsObject *)self device]);
  }
  _MTLMessageContextEnd();
  id v6 = [(MTLToolsCommandBuffer *)self unwrapMTLComputePassDescriptor:a3];

  self->_currentEncoder = 0;
  uint64_t v7 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoderWithDescriptor:", v6);
  if (v8)
  {
    uint64_t v9 = [[MTLDebugComputeCommandEncoder alloc] initWithComputeCommandEncoder:v8 commandBuffer:self descriptor:a3];
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    uint64_t v10 = 0;
    memset(v13, 0, 448);
    do
    {
      objc_super v11 = (char *)v13 + v10;
      *((_OWORD *)v11 + 1) = 0uLL;
      *((_OWORD *)v11 + 2) = 0uLL;
      *(_OWORD *)objc_super v11 = 0uLL;
      *((void *)v11 + 6) = 4;
      v10 += 56;
    }
    while (v10 != 448);
    memcpy(&self->_currAttachments, v13, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)[(MTLToolsObject *)v9 originalObject];
    return v9;
  }
  else
  {
    return 0;
  }
}

- (id)blitCommandEncoderWithDescriptor:(id)a3
{
  uint64_t v20 = 0;
  memset(&__src[28], 0, 48);
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    _MTLMessageContextPush_();
  }
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    _MTLMessageContextPush_();
  }
  if (MTLReportFailureTypeEnabled())
  {
    id v6 = [(MTLToolsObject *)self device];
    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "sampleBufferAttachments", v17, v18), "objectAtIndexedSubscript:", i);
      if ([v8 sampleBuffer])
      {
        if ([(MTLDevice *)v6 supportsCounterSampling:0])
        {
          uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "sampleBuffer"), "sampleCount");
          if ([v8 startOfEncoderSampleIndex] != -1
            && [v8 startOfEncoderSampleIndex] >= (unint64_t)v9)
          {
            uint64_t v17 = [v8 startOfEncoderSampleIndex];
            uint64_t v18 = v9;
            _MTLMessageContextPush_();
          }
          if (objc_msgSend(v8, "endOfEncoderSampleIndex", v17, v18) == -1
            || [v8 endOfEncoderSampleIndex] < (unint64_t)v9)
          {
            continue;
          }
          uint64_t v17 = [v8 endOfEncoderSampleIndex];
          uint64_t v18 = v9;
        }
        else
        {
          if ([v8 startOfEncoderSampleIndex] != -1) {
            _MTLMessageContextPush_();
          }
          if ([v8 endOfEncoderSampleIndex] == -1) {
            continue;
          }
        }
        _MTLMessageContextPush_();
      }
    }
  }
  _MTLMessageContextEnd();
  id v10 = [(MTLToolsCommandBuffer *)self unwrapMTLBlitPassDescriptor:a3];

  self->_currentEncoder = 0;
  objc_super v11 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "blitCommandEncoderWithDescriptor:", v10);
  if (v12)
  {
    v13 = [[MTLDebugBlitCommandEncoder alloc] initWithBlitCommandEncoder:v12 commandBuffer:self descriptor:a3];
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    uint64_t v14 = 0;
    memset(__src, 0, 448);
    do
    {
      v15 = (char *)__src + v14;
      *((_OWORD *)v15 + 1) = 0uLL;
      *((_OWORD *)v15 + 2) = 0uLL;
      *(_OWORD *)v15 = 0uLL;
      *((void *)v15 + 6) = 4;
      v14 += 56;
    }
    while (v14 != 448);
    memcpy(&self->_currAttachments, __src, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)[(MTLToolsObject *)v13 originalObject];
    return v13;
  }
  else
  {
    return 0;
  }
}

- (id)resourceStateCommandEncoderWithDescriptor:(id)a3
{
  uint64_t v20 = 0;
  memset(&__src[28], 0, 48);
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    _MTLMessageContextPush_();
  }
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    _MTLMessageContextPush_();
  }
  if (MTLReportFailureTypeEnabled())
  {
    id v6 = [(MTLToolsObject *)self device];
    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "sampleBufferAttachments", v17, v18), "objectAtIndexedSubscript:", i);
      if ([v8 sampleBuffer])
      {
        if ([(MTLDevice *)v6 supportsCounterSampling:0])
        {
          uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "sampleBuffer"), "sampleCount");
          if ([v8 startOfEncoderSampleIndex] != -1
            && [v8 startOfEncoderSampleIndex] >= (unint64_t)v9)
          {
            uint64_t v17 = [v8 startOfEncoderSampleIndex];
            uint64_t v18 = v9;
            _MTLMessageContextPush_();
          }
          if (objc_msgSend(v8, "endOfEncoderSampleIndex", v17, v18) == -1
            || [v8 endOfEncoderSampleIndex] < (unint64_t)v9)
          {
            continue;
          }
          uint64_t v17 = [v8 endOfEncoderSampleIndex];
          uint64_t v18 = v9;
        }
        else
        {
          if ([v8 startOfEncoderSampleIndex] != -1) {
            _MTLMessageContextPush_();
          }
          if ([v8 endOfEncoderSampleIndex] == -1) {
            continue;
          }
        }
        _MTLMessageContextPush_();
      }
    }
  }
  _MTLMessageContextEnd();
  id v10 = [(MTLToolsCommandBuffer *)self unwrapMTLResourceStatePassDescriptor:a3];

  self->_currentEncoder = 0;
  objc_super v11 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceStateCommandEncoderWithDescriptor:", v10);
  if (v12)
  {
    v13 = [[MTLDebugResourceStateCommandEncoder alloc] initWithResourceStateCommandEncoder:v12 commandBuffer:self descriptor:a3];
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    uint64_t v14 = 0;
    memset(__src, 0, 448);
    do
    {
      v15 = (char *)__src + v14;
      *((_OWORD *)v15 + 1) = 0uLL;
      *((_OWORD *)v15 + 2) = 0uLL;
      *(_OWORD *)v15 = 0uLL;
      *((void *)v15 + 6) = 4;
      v14 += 56;
    }
    while (v14 != 448);
    memcpy(&self->_currAttachments, __src, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)[(MTLToolsObject *)v13 originalObject];
    return v13;
  }
  else
  {
    return 0;
  }
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3
{
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    MTLReportFailure();
  }

  self->_currentEncoder = 0;
  id v6 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoderWithDispatchType:", a3);
  if (v7)
  {
    uint64_t v8 = [[MTLDebugComputeCommandEncoder alloc] initWithComputeCommandEncoder:v7 commandBuffer:self descriptor:0];
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    uint64_t v9 = 0;
    memset(v12, 0, sizeof(v12));
    do
    {
      id v10 = (char *)v12 + v9;
      *((_OWORD *)v10 + 1) = 0uLL;
      *((_OWORD *)v10 + 2) = 0uLL;
      *(_OWORD *)id v10 = 0uLL;
      *((void *)v10 + 6) = 4;
      v9 += 56;
    }
    while (v9 != 448);
    memcpy(&self->_currAttachments, v12, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)[(MTLToolsObject *)v8 originalObject];
    return v8;
  }
  else
  {
    return 0;
  }
}

- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    _MTLMessageContextPush_();
  }
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  if (MTLReportFailureTypeEnabled()) {
    validateRenderPassDescriptor(a3, [(MTLToolsObject *)self device], &self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)&self->_prevAttachments, (uint64_t)&self->_currAttachments);
  }
  id v6 = [(MTLDebugCommandBuffer *)self unwrapMTLRenderPassDescriptor:a3];

  self->_currentEncoder = 0;
  uint64_t v7 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parallelRenderCommandEncoderWithDescriptor:", v6);
  if (v8)
  {
    uint64_t v9 = [[MTLDebugParallelRenderCommandEncoder alloc] initWithBaseRenderPass:v8 commandBuffer:self descriptor:a3];
    self->_currentEncoder = (_MTLCommandEncoder *)[(MTLToolsObject *)v9 originalObject];
    return v9;
  }
  else
  {
    return 0;
  }
}

- (void)validateStoreLoadTransition:(id)a3 atIndex:(unint64_t)a4 renderTargetArrayLength:(unint64_t)a5
{
  int v6 = a4;
  uint64_t v8 = (MTLRenderPassAttachmentDescriptorPrivate *)[a3 _descriptorPrivate];
  if (v8)
  {
    validateStoreLoadTransition(v6, &self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_, v8, (uint64_t)&self->_prevAttachments, (uint64_t)&self->_currAttachments, a5);
  }
}

- (void)addPurgeableObject:(id)a3
{
  if (a3)
  {
    if ([a3 conformsToProtocol:&unk_26EF7E4F8])
    {
      id v5 = (id)[a3 heap];
      if (v5) {
        goto LABEL_11;
      }
      if ([a3 conformsToProtocol:&unk_26EF9C6F8])
      {
        id v5 = (id)[a3 buffer];
        if (!v5)
        {
          if ([a3 parentTexture])
          {
            id v5 = a3;
            do
              id v5 = (id)[v5 parentTexture];
            while ([v5 parentTexture]);
            goto LABEL_11;
          }
          goto LABEL_10;
        }
LABEL_11:
        os_unfair_lock_lock(&self->_purgeableObjectsLock);
        id v6 = v5;
        std::__hash_table<objc_object  {objcproto25MTLDebugResourcePurgeable}*,std::hash<objc_object  {objcproto25MTLDebugResourcePurgeable}>,std::equal_to<objc_object  {objcproto25MTLDebugResourcePurgeable}>,std::allocator<objc_object  {objcproto25MTLDebugResourcePurgeable}>>::__emplace_unique_key_args<objc_object  {objcproto25MTLDebugResourcePurgeable},objc_object  {objcproto25MTLDebugResourcePurgeable}>((uint64_t)&self->_referencedPurgeableObjects, &v6, &v6);
        os_unfair_lock_unlock(&self->_purgeableObjectsLock);
        return;
      }
    }
LABEL_10:
    id v5 = a3;
    goto LABEL_11;
  }
}

- (void)addObject:(id)a3 retained:(BOOL)a4 purgeable:(BOOL)a5
{
  if (a3)
  {
    BOOL v5 = a5;
    if (a4)
    {
      BOOL v8 = [(MTLToolsCommandBuffer *)self addRetainedObject:a3];
      uint64_t v9 = &checkLifetimeOfInternallyReferencedObjects;
      if (!v8) {
        uint64_t v9 = &checkLifetimeOfExternallyReferencedObjects;
      }
      char v10 = *v9;
    }
    else
    {
      BOOL v8 = 0;
      char v10 = checkLifetimeOfExternallyReferencedObjects;
    }
    if (v10) {
      [(MTLDebugCommandBuffer *)self addReferencedObject:a3 internallyRetained:v8];
    }
    if (v5)
    {
      [(MTLDebugCommandBuffer *)self addPurgeableObject:a3];
    }
  }
}

- (void)addReferencedObject:(id)a3 internallyRetained:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v9 = (atomic_uint *)a3;
  p_retainedObjectsLock = &self->_retainedObjectsLock;
  os_unfair_lock_lock(&self->_retainedObjectsLock);
  uint64_t v7 = &OBJC_IVAR___MTLDebugCommandBuffer__externallyRetainedObjects;
  if (v4) {
    uint64_t v7 = &OBJC_IVAR___MTLDebugCommandBuffer__internallyRetainedObjects;
  }
  std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::__emplace_unique_key_args<MTLToolsObject *,MTLToolsObject * const&>((uint64_t)&self->MTLToolsCommandBuffer_opaque[*v7], &v9, &v9);
  if (v8) {
    atomic_fetch_add(v9 + 8, 1u);
  }
  os_unfair_lock_unlock(p_retainedObjectsLock);
}

- (void)removeAllReferencedObjects:(BOOL)a3
{
  BOOL v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  int v10 = 1065353216;
  p_retainedObjectsLock = &self->_retainedObjectsLock;
  os_unfair_lock_lock(&self->_retainedObjectsLock);
  id v6 = &OBJC_IVAR___MTLDebugCommandBuffer__externallyRetainedObjects;
  if (v3) {
    id v6 = &OBJC_IVAR___MTLDebugCommandBuffer__internallyRetainedObjects;
  }
  std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::swap((uint64_t)&self->MTLToolsCommandBuffer_opaque[*v6], (uint64_t)&v8);
  for (uint64_t i = (void *)v9; i; uint64_t i = (void *)*i)
    atomic_fetch_add((atomic_uint *volatile)(i[2] + 32), 0xFFFFFFFF);
  os_unfair_lock_unlock(p_retainedObjectsLock);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&v8);
}

- (BOOL)testObjectReferenced:(id)a3 wasInternallyRetained:(BOOL *)a4
{
  int v10 = (MTLToolsObject *)a3;
  p_retainedObjectsLock = &self->_retainedObjectsLock;
  os_unfair_lock_lock(&self->_retainedObjectsLock);
  *a4 = std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::__erase_unique<MTLToolsObject *>(&self->_internallyRetainedObjects.__table_.__bucket_list_.__ptr_.__value_, &v10) != 0;
  if (std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::__erase_unique<MTLToolsObject *>(&self->_externallyRetainedObjects.__table_.__bucket_list_.__ptr_.__value_, &v10))
  {
    if (*a4 | checkLifetimeBeforeCommit
      || self->_referencedDeadObject == (MTLToolsObject *)3735928559)
    {
      BOOL v7 = 1;
    }
    else
    {
      BOOL v7 = 0;
      self->_referencedDeadObject = v10;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  os_unfair_lock_unlock(p_retainedObjectsLock);
  os_unfair_lock_lock(&self->_purgeableObjectsLock);
  long long v9 = v10;
  std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::__erase_unique<MTLToolsObject *>(&self->_referencedPurgeableObjects.__table_.__bucket_list_.__ptr_.__value_, &v9);
  os_unfair_lock_unlock(&self->_purgeableObjectsLock);
  [(MTLDebugCommandBuffer *)self _removeUsedRenderTargetsExcept:v10];
  return *a4 || v7;
}

- (void)preCommit
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    MTLReportFailure();
  }
  os_unfair_lock_lock(&self->_retainedObjectsLock);
  referencedDeadObject = self->_referencedDeadObject;
  if (referencedDeadObject) {
    BOOL v5 = referencedDeadObject == (MTLToolsObject *)3735928559;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v20 = self->_referencedDeadObject;
    MTLReportFailure();
  }
  self->_referencedDeadObject = (MTLToolsObject *)3735928559;
  os_unfair_lock_unlock(&self->_retainedObjectsLock);
  os_unfair_lock_lock(&self->_renderTargetAttachmentLock);
  self->_didAddRenderTargetAttachments = 1;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  renderTargetAttachments = self->_renderTargetAttachments;
  uint64_t v7 = [(NSMutableSet *)renderTargetAttachments countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(renderTargetAttachments);
        }
        objc_super v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "baseTexture", v20);
        uint64_t v13 = [v11 baseLevelOffset];
        uint64_t v14 = [v11 baseSliceRangeOffset];
        objc_msgSend(v12, "addUsedRenderTarget:slices:", v13, v14, v15);
        v16 = (void *)[v11 baseResolveTexture];
        uint64_t v17 = [v11 resolveLevelOffset];
        uint64_t v18 = [v11 resolveSliceRangeOffset];
        objc_msgSend(v16, "addUsedRenderTarget:slices:", v17, v18, v19);
      }
      uint64_t v8 = [(NSMutableSet *)renderTargetAttachments countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
  os_unfair_lock_unlock(&self->_renderTargetAttachmentLock);
  [*(id *)&self->MTLToolsCommandBuffer_opaque[8] validateDeadlineAwareness:self];
  [(MTLDebugCommandBuffer *)self lockPurgeableObjects];
  v21.receiver = self;
  v21.super_class = (Class)MTLDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v21 preCommit];
}

- (void)preCompletionHandlers
{
  [(MTLDebugCommandBuffer *)self _removeUsedRenderTargetsExcept:0];
  [(MTLDebugCommandBuffer *)self unlockPurgeableObjects];
  if (checkLifetimeOfExternallyReferencedObjects) {
    [(MTLDebugCommandBuffer *)self removeAllReferencedObjects:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v3 preCompletionHandlers];
  *(unsigned char *)gInsideCompletionHandler() = 1;
}

- (void)postCompletionHandlers
{
  *(unsigned char *)gInsideCompletionHandler() = 0;
  if (checkLifetimeOfExternallyReferencedObjects | checkLifetimeOfInternallyReferencedObjects)
  {
    [(MTLDebugCommandBuffer *)self removeAllReferencedObjects:1];
    [*(id *)&self->MTLToolsCommandBuffer_opaque[24] removeReferenceTrackingCommandBuffer:self];
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v3 postCompletionHandlers];
}

- (void)_removeUsedRenderTargetsExcept:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  p_renderTargetAttachmentLock = &self->_renderTargetAttachmentLock;
  os_unfair_lock_lock(&self->_renderTargetAttachmentLock);
  if (self->_didAddRenderTargetAttachments)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    renderTargetAttachments = self->_renderTargetAttachments;
    uint64_t v7 = [(NSMutableSet *)renderTargetAttachments countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(renderTargetAttachments);
          }
          objc_super v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v12 = (id)[v11 baseTexture];
          if (v12 != a3)
          {
            uint64_t v13 = v12;
            uint64_t v14 = [v11 baseLevelOffset];
            uint64_t v15 = [v11 baseSliceRangeOffset];
            objc_msgSend(v13, "removeUsedRenderTarget:slices:", v14, v15, v16);
          }
          id v17 = (id)[v11 baseResolveTexture];
          if (v17 != a3)
          {
            uint64_t v18 = v17;
            uint64_t v19 = [v11 resolveLevelOffset];
            uint64_t v20 = [v11 resolveSliceRangeOffset];
            objc_msgSend(v18, "removeUsedRenderTarget:slices:", v19, v20, v21);
          }
        }
        uint64_t v8 = [(NSMutableSet *)renderTargetAttachments countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }
  }
  [(NSMutableSet *)self->_renderTargetAttachments removeAllObjects];
  os_unfair_lock_unlock(p_renderTargetAttachmentLock);
}

- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    _MTLMessageContextPush_();
  }
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  if (MTLReportFailureTypeEnabled()) {
    validateRenderPassDescriptor(a3, [(MTLToolsObject *)self device], &self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)&self->_prevAttachments, (uint64_t)&self->_currAttachments);
  }
  id v10 = [(MTLDebugCommandBuffer *)self unwrapMTLRenderPassDescriptor:a3];

  self->_currentEncoder = 0;
  objc_super v11 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledRenderCommandEncoderWithDescriptor:programInfoBuffer:capacity:", v10, a4, a5);
  if (v12)
  {
    uint64_t v13 = [[MTLDebugRenderCommandEncoder alloc] initWithRenderCommandEncoder:v12 parent:self descriptor:a3];
    self->_currentEncoder = (_MTLCommandEncoder *)[(MTLToolsObject *)v13 originalObject];
    return v13;
  }
  else
  {
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    _MTLMessageContextPush_();
  }
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    _MTLMessageContextPush_();
  }
  if (MTLReportFailureTypeEnabled()) {
    validateComputePassDescriptor(a3, [(MTLToolsObject *)self device]);
  }
  _MTLMessageContextEnd();
  id v10 = [(MTLToolsCommandBuffer *)self unwrapMTLComputePassDescriptor:a3];

  self->_currentEncoder = 0;
  objc_super v11 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledComputeCommandEncoderWithDescriptor:programInfoBuffer:capacity:", v10, a4, a5);
  if (v12)
  {
    uint64_t v13 = [[MTLDebugComputeCommandEncoder alloc] initWithComputeCommandEncoder:v12 commandBuffer:self descriptor:a3];
    self->_currentEncoder = (_MTLCommandEncoder *)[(MTLToolsObject *)v13 originalObject];
    return v13;
  }
  else
  {
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    MTLReportFailure();
  }

  self->_currentEncoder = 0;
  uint64_t v8 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledComputeCommandEncoderWithProgramInfoBuffer:capacity:", a3, a4);
  if (v9)
  {
    id v10 = [[MTLDebugComputeCommandEncoder alloc] initWithComputeCommandEncoder:v9 commandBuffer:self descriptor:0];
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    uint64_t v11 = 0;
    memset(v14, 0, sizeof(v14));
    do
    {
      uint64_t v12 = (char *)v14 + v11;
      *((_OWORD *)v12 + 1) = 0uLL;
      *((_OWORD *)v12 + 2) = 0uLL;
      *(_OWORD *)uint64_t v12 = 0uLL;
      *((void *)v12 + 6) = 4;
      v11 += 56;
    }
    while (v11 != 448);
    memcpy(&self->_currAttachments, v14, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)[(MTLToolsObject *)v10 originalObject];
    return v10;
  }
  else
  {
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    MTLReportFailure();
  }

  self->_currentEncoder = 0;
  id v10 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledComputeCommandEncoderWithDispatchType:programInfoBuffer:capacity:", a3, a4, a5);
  if (v11)
  {
    uint64_t v12 = [[MTLDebugComputeCommandEncoder alloc] initWithComputeCommandEncoder:v11 commandBuffer:self descriptor:0];
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    uint64_t v13 = 0;
    memset(v16, 0, sizeof(v16));
    do
    {
      uint64_t v14 = (char *)v16 + v13;
      *((_OWORD *)v14 + 1) = 0uLL;
      *((_OWORD *)v14 + 2) = 0uLL;
      *(_OWORD *)uint64_t v14 = 0uLL;
      *((void *)v14 + 6) = 4;
      v13 += 56;
    }
    while (v13 != 448);
    memcpy(&self->_currAttachments, v16, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)[(MTLToolsObject *)v12 originalObject];
    return v12;
  }
  else
  {
    return 0;
  }
}

- (void)lockPurgeableObjects
{
  p_purgeableObjectsLock = &self->_purgeableObjectsLock;
  os_unfair_lock_lock(&self->_purgeableObjectsLock);
  for (uint64_t i = self->_referencedPurgeableObjects.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
  {
    BOOL v5 = (void *)i[2];
    objc_msgSend(v5, "lockPurgeableState", v7, v8, v9, v10);
    if (([v5 purgeableStateValidForRendering] & 1) == 0)
    {
      uint64_t v6 = [v5 label];
      uint64_t v9 = self;
      id v10 = [(MTLToolsCommandBuffer *)self label];
      uint64_t v7 = v5;
      uint64_t v8 = v6;
      MTLReportFailure();
    }
  }

  os_unfair_lock_unlock(p_purgeableObjectsLock);
}

- (void)unlockPurgeableObjects
{
  p_purgeableObjectsLock = &self->_purgeableObjectsLock;
  os_unfair_lock_lock(&self->_purgeableObjectsLock);
  for (uint64_t i = (id *)self->_referencedPurgeableObjects.__table_.__p1_.__value_.__next_; i; uint64_t i = (id *)*i)
    [i[2] unlockPurgeableState];

  os_unfair_lock_unlock(p_purgeableObjectsLock);
}

- (void)addSynchronizationNotification:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 addSynchronizationNotification:a3];
}

- (void)executeSynchronizationNotifications:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 executeSynchronizationNotifications:v3];
}

- (void)executeSynchronizationNotifications:(int)a3 scope:(unint64_t)a4 resources:(const void *)a5 count:(unint64_t)a6
{
  uint64_t v9 = *(void *)&a3;
  id v10 = [(MTLToolsObject *)self baseObject];

  [v10 executeSynchronizationNotifications:v9 scope:a4 resources:a5 count:a6];
}

- (void)debugBufferContentsWithLength:(unint64_t *)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (void *)[v4 debugBufferContentsWithLength:a3];
}

- (id)accelerationStructureCommandEncoder
{
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    MTLReportFailure();
  }

  self->_currentEncoder = 0;
  id v4 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "accelerationStructureCommandEncoder");
  if (v5)
  {
    uint64_t v6 = [(MTLToolsCommandEncoder *)[MTLDebugAccelerationStructureCommandEncoder alloc] initWithBaseObject:v5 parent:self];
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    uint64_t v7 = 0;
    memset(v10, 0, sizeof(v10));
    do
    {
      uint64_t v8 = (char *)v10 + v7;
      *((_OWORD *)v8 + 1) = 0uLL;
      *((_OWORD *)v8 + 2) = 0uLL;
      *(_OWORD *)uint64_t v8 = 0uLL;
      *((void *)v8 + 6) = 4;
      v7 += 56;
    }
    while (v7 != 448);
    memcpy(&self->_currAttachments, v10, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)[(MTLToolsObject *)v6 originalObject];
    return v6;
  }
  else
  {
    return 0;
  }
}

- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3
{
  uint64_t v20 = 0;
  memset(&__src[28], 0, 48);
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    _MTLMessageContextPush_();
  }
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && [(_MTLCommandEncoder *)currentEncoder commandBuffer]) {
    _MTLMessageContextPush_();
  }
  if (MTLReportFailureTypeEnabled())
  {
    uint64_t v6 = [(MTLToolsObject *)self device];
    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "sampleBufferAttachments", v17, v18), "objectAtIndexedSubscript:", i);
      if ([v8 sampleBuffer])
      {
        if ([(MTLDevice *)v6 supportsCounterSampling:0])
        {
          uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "sampleBuffer"), "sampleCount");
          if ([v8 startOfEncoderSampleIndex] != -1
            && [v8 startOfEncoderSampleIndex] >= (unint64_t)v9)
          {
            uint64_t v17 = [v8 startOfEncoderSampleIndex];
            uint64_t v18 = v9;
            _MTLMessageContextPush_();
          }
          if (objc_msgSend(v8, "endOfEncoderSampleIndex", v17, v18) == -1
            || [v8 endOfEncoderSampleIndex] < (unint64_t)v9)
          {
            continue;
          }
          uint64_t v17 = [v8 endOfEncoderSampleIndex];
          uint64_t v18 = v9;
        }
        else
        {
          if ([v8 startOfEncoderSampleIndex] != -1) {
            _MTLMessageContextPush_();
          }
          if ([v8 endOfEncoderSampleIndex] == -1) {
            continue;
          }
        }
        _MTLMessageContextPush_();
      }
    }
  }
  _MTLMessageContextEnd();
  id v10 = [(MTLToolsCommandBuffer *)self unwrapMTLAccelerationStructurePassDescriptor:a3];

  self->_currentEncoder = 0;
  uint64_t v11 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "accelerationStructureCommandEncoderWithDescriptor:", v10);
  if (v12)
  {
    uint64_t v13 = [(MTLToolsAccelerationStructureCommandEncoder *)[MTLDebugAccelerationStructureCommandEncoder alloc] initWithAccelerationStructureCommandEncoder:v12 parent:self descriptor:a3];
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    uint64_t v14 = 0;
    memset(__src, 0, 448);
    do
    {
      uint64_t v15 = (char *)__src + v14;
      *((_OWORD *)v15 + 1) = 0uLL;
      *((_OWORD *)v15 + 2) = 0uLL;
      *(_OWORD *)uint64_t v15 = 0uLL;
      *((void *)v15 + 6) = 4;
      v14 += 56;
    }
    while (v14 != 448);
    memcpy(&self->_currAttachments, __src, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)[(MTLToolsObject *)v13 originalObject];
    return v13;
  }
  else
  {
    return 0;
  }
}

- (void)encodeDashboardTagForResourceGroup:(id)a3
{
  uint64_t v6 = 0;
  memset(&v5[1], 0, 48);
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  [(MTLDebugCommandBuffer *)self addObject:a3 retained:1 purgeable:0];
  v5[0].receiver = self;
  v5[0].super_class = (Class)MTLDebugCommandBuffer;
  [(objc_super *)v5 encodeDashboardTagForResourceGroup:a3];
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 value:(unint64_t)a5 forIndex:(unint64_t)a6
{
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  _MTLMessageContextBegin_();
  if (!a3)
  {
    _MTLMessageContextPush_();
    if (!a4) {
      goto LABEL_3;
    }
LABEL_5:
    _MTLMessageContextPush_();
    goto LABEL_3;
  }
  if (a4) {
    goto LABEL_5;
  }
LABEL_3:
  _MTLMessageContextEnd();
  [(MTLDebugCommandBuffer *)self addObject:a3 retained:1 purgeable:0];
  v11.receiver = self;
  v11.super_class = (Class)MTLDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v11 encodeDashboardFinalizeForResourceGroup:a3 dashboard:a4 value:a5 forIndex:a6];
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 values:(const unint64_t *)a5 indices:(const unint64_t *)a6 count:(unint64_t)a7
{
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  _MTLMessageContextBegin_();
  if (!a3)
  {
    _MTLMessageContextPush_();
    if (!a4) {
      goto LABEL_3;
    }
LABEL_5:
    _MTLMessageContextPush_();
    goto LABEL_3;
  }
  if (a4) {
    goto LABEL_5;
  }
LABEL_3:
  _MTLMessageContextEnd();
  [(MTLDebugCommandBuffer *)self addObject:a3 retained:1 purgeable:0];
  v13.receiver = self;
  v13.super_class = (Class)MTLDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v13 encodeDashboardFinalizeForResourceGroup:a3 dashboard:a4 values:a5 indices:a6 count:a7];
}

- (void)addActiveRenderTargets:(id)a3
{
  p_renderTargetAttachmentLock = &self->_renderTargetAttachmentLock;
  os_unfair_lock_lock(&self->_renderTargetAttachmentLock);
  [(NSMutableSet *)self->_renderTargetAttachments unionSet:a3];

  os_unfair_lock_unlock(p_renderTargetAttachmentLock);
}

- (void)commitWithDeadline:(unint64_t)a3
{
  uint64_t v5 = [(MTLToolsCommandBuffer *)self deadlineProfile];
  if (!a3 || !v5)
  {
    uint64_t v9 = "-[MTLDebugCommandBuffer commitWithDeadline:]";
    MTLReportFailure();
  }
  [(MTLToolsCommandBuffer *)self deadlineProfile];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = [NSStringFromClass(v6) UTF8String];
    [(MTLToolsCommandBuffer *)self deadlineProfile];
    uint64_t v8 = (objc_class *)objc_opt_class();
    objc_super v11 = v7;
    long long v12 = [NSStringFromClass(v8) UTF8String];
    id v10 = "-[MTLDebugCommandBuffer commitWithDeadline:]";
    MTLReportFailure();
  }
  [(MTLDebugCommandBuffer *)self preCommit];
  v13.receiver = self;
  v13.super_class = (Class)MTLDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v13 commitWithDeadline:a3];
}

- (void)useResidencySet:(id)a3
{
  if (!a3) {
    MTLReportFailure();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v5 useResidencySet:a3];
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    for (uint64_t i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        uint64_t v8 = i;
        MTLReportFailure();
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer useResidencySets:count:](&v9, sel_useResidencySets_count_, a3, a4, v8);
}

- (void)useInternalResidencySet:(id)a3
{
  if (!a3) {
    MTLReportFailure();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v5 useInternalResidencySet:a3];
}

- (void)useInternalResidencySets:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    for (uint64_t i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        uint64_t v8 = i;
        MTLReportFailure();
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer useInternalResidencySets:count:](&v9, sel_useInternalResidencySets_count_, a3, a4, v8);
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->_internallyRetainedObjects);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->_externallyRetainedObjects);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->_referencedPurgeableObjects);

  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->_attachmentSet);
}

- (id).cxx_construct
{
  uint64_t v2 = 0;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *((_DWORD *)self + 46) = 1065353216;
  do
  {
    uint64_t v3 = (char *)self + v2 + 192;
    *((_OWORD *)v3 + 1) = 0uLL;
    *((_OWORD *)v3 + 2) = 0uLL;
    *(_OWORD *)uint64_t v3 = 0uLL;
    *((void *)v3 + 6) = 4;
    v2 += 56;
  }
  while (v2 != 448);
  for (uint64_t i = 0; i != 448; i += 56)
  {
    objc_super v5 = (char *)self + i + 640;
    *((_OWORD *)v5 + 1) = 0uLL;
    *((_OWORD *)v5 + 2) = 0uLL;
    *(_OWORD *)objc_super v5 = 0uLL;
    *((void *)v5 + 6) = 4;
  }
  *(_OWORD *)((char *)self + 1096) = 0u;
  *(_OWORD *)((char *)self + 1112) = 0u;
  *((_DWORD *)self + 282) = 1065353216;
  *(_OWORD *)((char *)self + 1144) = 0u;
  *(_OWORD *)((char *)self + 1160) = 0u;
  *((_DWORD *)self + 294) = 1065353216;
  *((_OWORD *)self + 74) = 0u;
  *((_OWORD *)self + 75) = 0u;
  *((_DWORD *)self + 304) = 1065353216;
  return self;
}

@end