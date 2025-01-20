@interface MTLCountersCommandBuffer
- (MTLCountersCommandBuffer)initWithCommandBuffer:(id)a3 commandQueue:(id)a4 descriptor:(id)a5;
- (MTLCountersTraceCommandBuffer)traceBuffer;
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
- (void)addPurgedHeap:(id)a3;
- (void)addPurgedResource:(id)a3;
- (void)dealloc;
- (void)presentDrawable:(id)a3;
- (void)presentDrawable:(id)a3 atTime:(double)a4;
- (void)waitUntilCompleted;
- (void)waitUntilScheduled;
@end

@implementation MTLCountersCommandBuffer

- (MTLCountersCommandBuffer)initWithCommandBuffer:(id)a3 commandQueue:(id)a4 descriptor:(id)a5
{
  {
    v13 = self;
    id v8 = a5;
    id v9 = a4;
    a4 = v9;
    a5 = v8;
    int v11 = v10;
    self = v13;
    if (v11)
    {
      v12 = getenv("MTL_XML_DUMP_EVENTS");
      if (!v12) {
        v12 = "1";
      }
      -[MTLCountersCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]::dumpEvents = strtol(v12, 0, 0) != 0;
      self = v13;
      a4 = v9;
      a5 = v8;
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)MTLCountersCommandBuffer;
  v6 = [(MTLToolsCommandBuffer *)&v14 initWithCommandBuffer:a3 parent:a4 descriptor:a5];
  if (v6)
  {
    v6->_traceBuffer = (MTLCountersTraceCommandBuffer *)-[MTLCountersTraceCommandBuffer init:]([MTLCountersTraceCommandBuffer alloc], "init:", [a3 retainedReferences]);
    if (-[MTLCountersCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]::dumpEvents) {
      [(MTLToolsCommandBuffer *)v6 setProfilingEnabled:1];
    }
  }
  return v6;
}

- (void)dealloc
{
  traceBuffer = self->_traceBuffer;
  uint64_t v4 = *(void *)&self->MTLToolsCommandBuffer_opaque[8];
  v5 = (void *)[(NSDictionary *)[(MTLToolsCommandBuffer *)self profilingResults] mutableCopy];
  v6 = NSNumber;
  [(MTLToolsCommandBuffer *)self kernelStartTime];
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v6, "numberWithUnsignedLongLong:", (unint64_t)(v7 * 1000000000.0)), @"MTLCommandBufferKernelStartTime");
  id v8 = NSNumber;
  [(MTLToolsCommandBuffer *)self kernelEndTime];
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v8, "numberWithUnsignedLongLong:", (unint64_t)(v9 * 1000000000.0)), @"MTLCommandBufferKernelEndTime");
  int v10 = NSNumber;
  [(MTLToolsCommandBuffer *)self GPUStartTime];
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v10, "numberWithUnsignedLongLong:", (unint64_t)(v11 * 1000000000.0)), @"MTLCommandBufferGPUStartTime");
  v12 = NSNumber;
  [(MTLToolsCommandBuffer *)self GPUEndTime];
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v12, "numberWithUnsignedLongLong:", (unint64_t)(v13 * 1000000000.0)), @"MTLCommandBufferGPUEndTime");
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__MTLCountersCommandBuffer_dealloc__block_invoke;
  block[3] = &unk_264E140A0;
  block[4] = traceBuffer;
  block[5] = v4;
  block[6] = v5;
  block[7] = self;
  dispatch_async(global_queue, block);

  v15.receiver = self;
  v15.super_class = (Class)MTLCountersCommandBuffer;
  [(MTLToolsCommandBuffer *)&v15 dealloc];
}

uint64_t __35__MTLCountersCommandBuffer_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveCommandBuffer:*(void *)(a1 + 56) queue:*(void *)(a1 + 40) profilingResults:*(void *)(a1 + 48)];
}

- (id)blitCommandEncoder
{
  v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "blitCommandEncoder");
  if (v4)
  {
    v5 = [[MTLCountersBlitCommandEncoder alloc] initWithBlitCommandEncoder:v4 commandBuffer:self descriptor:0];
    return v5;
  }
  else
  {
    return 0;
  }
}

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  v5 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderCommandEncoderWithDescriptor:", a3);
  if (v6)
  {
    double v7 = [[MTLCountersRenderCommandEncoder alloc] initWithRenderCommandEncoder:v6 parent:self descriptor:a3];
    return v7;
  }
  else
  {
    return 0;
  }
}

- (id)computeCommandEncoder
{
  v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoder");
  if (v4)
  {
    v5 = [[MTLCountersComputeCommandEncoder alloc] initWithComputeCommandEncoder:v4 commandBuffer:self descriptor:0];
    return v5;
  }
  else
  {
    return 0;
  }
}

- (id)computeCommandEncoderWithDescriptor:(id)a3
{
  v5 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoderWithDescriptor:", a3);
  if (v6)
  {
    double v7 = [[MTLCountersComputeCommandEncoder alloc] initWithComputeCommandEncoder:v6 commandBuffer:self descriptor:a3];
    return v7;
  }
  else
  {
    return 0;
  }
}

- (id)blitCommandEncoderWithDescriptor:(id)a3
{
  v5 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "blitCommandEncoderWithDescriptor:", a3);
  if (v6)
  {
    double v7 = [[MTLCountersBlitCommandEncoder alloc] initWithBlitCommandEncoder:v6 commandBuffer:self descriptor:a3];
    return v7;
  }
  else
  {
    return 0;
  }
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3
{
  v5 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoderWithDispatchType:", a3);
  if (v6)
  {
    double v7 = [[MTLCountersComputeCommandEncoder alloc] initWithComputeCommandEncoder:v6 commandBuffer:self descriptor:0];
    return v7;
  }
  else
  {
    return 0;
  }
}

- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3
{
  v5 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parallelRenderCommandEncoderWithDescriptor:", a3);
  if (v6)
  {
    double v7 = [[MTLCountersParallelRenderCommandEncoder alloc] initWithBaseRenderPass:v6 commandBuffer:self descriptor:a3];
    return v7;
  }
  else
  {
    return 0;
  }
}

- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  double v9 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v10 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledRenderCommandEncoderWithDescriptor:programInfoBuffer:capacity:", a3, a4, a5);
  if (v10)
  {
    double v11 = [[MTLCountersRenderCommandEncoder alloc] initWithRenderCommandEncoder:v10 parent:self descriptor:a3];
    return v11;
  }
  else
  {
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  double v7 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledComputeCommandEncoderWithProgramInfoBuffer:capacity:", a3, a4);
  if (v8)
  {
    double v9 = [[MTLCountersComputeCommandEncoder alloc] initWithComputeCommandEncoder:v8 commandBuffer:self descriptor:0];
    return v9;
  }
  else
  {
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  double v9 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v10 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledComputeCommandEncoderWithDispatchType:programInfoBuffer:capacity:", a3, a4, a5);
  if (v10)
  {
    double v11 = [[MTLCountersComputeCommandEncoder alloc] initWithComputeCommandEncoder:v10 commandBuffer:self descriptor:0];
    return v11;
  }
  else
  {
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  double v9 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v10 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledComputeCommandEncoderWithDescriptor:programInfoBuffer:capacity:", a3, a4, a5);
  if (v10)
  {
    double v11 = [[MTLCountersComputeCommandEncoder alloc] initWithComputeCommandEncoder:v10 commandBuffer:self descriptor:a3];
    return v11;
  }
  else
  {
    return 0;
  }
}

- (id)resourceStateCommandEncoderWithDescriptor:(id)a3
{
  v5 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceStateCommandEncoderWithDescriptor:", a3);
  if (v6)
  {
    double v7 = [[MTLCountersResourceStateCommandEncoder alloc] initWithResourceStateCommandEncoder:v6 commandBuffer:self descriptor:a3];
    return v7;
  }
  else
  {
    return 0;
  }
}

- (id)resourceStateCommandEncoder
{
  v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceStateCommandEncoder");
  if (v4)
  {
    v5 = [[MTLCountersResourceStateCommandEncoder alloc] initWithResourceStateCommandEncoder:v4 commandBuffer:self descriptor:0];
    return v5;
  }
  else
  {
    return 0;
  }
}

- (void)addPurgedResource:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 addPurgedResource:a3];
}

- (void)addPurgedHeap:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 addPurgedHeap:a3];
}

- (void)waitUntilScheduled
{
  [(MTLCountersTraceCommandBuffer *)self->_traceBuffer waitUntilScheduled];
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 waitUntilScheduled];
}

- (void)waitUntilCompleted
{
  [(MTLCountersTraceCommandBuffer *)self->_traceBuffer waitUntilCompleted];
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 waitUntilCompleted];
}

- (void)presentDrawable:(id)a3
{
  -[MTLCountersTraceCommandBuffer presentDrawable:](self->_traceBuffer, "presentDrawable:");
  id v5 = [(MTLToolsObject *)self baseObject];

  [v5 presentDrawable:a3];
}

- (void)presentDrawable:(id)a3 atTime:(double)a4
{
  -[MTLCountersTraceCommandBuffer presentDrawable:atTime:](self->_traceBuffer, "presentDrawable:atTime:");
  id v7 = [(MTLToolsObject *)self baseObject];

  [v7 presentDrawable:a3 atTime:a4];
}

- (MTLCountersTraceCommandBuffer)traceBuffer
{
  return self->_traceBuffer;
}

@end