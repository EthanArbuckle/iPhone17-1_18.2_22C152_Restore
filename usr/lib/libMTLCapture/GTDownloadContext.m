@interface GTDownloadContext
- (GTDownloadContext)initWithQueue:(id)a3 forRequest:(apr_array_header_t *)a4;
- (NSArray)captureAccelerationStructures;
- (NSMutableArray)objects;
- (apr_array_header_t)requests;
- (id)accelerationStructureCommandEncoder;
- (id)blitCommandEncoder;
- (id)computeCommandEncoder;
- (id)newCommandBuffer;
- (unint64_t)usedGPUMemory;
- (void)dealloc;
- (void)flush;
- (void)flushWithCallback:(id)a3;
- (void)retainMTLResource:(id)a3;
- (void)setObjects:(id)a3;
- (void)setRequests:(apr_array_header_t *)a3;
- (void)setUsedGPUMemory:(unint64_t)a3;
@end

@implementation GTDownloadContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_captureAccelerationStructures, 0);
  objc_storeStrong((id *)&self->_originalMTLResources, 0);
  objc_storeStrong((id *)&self->_MTLResources, 0);
  objc_storeStrong((id *)&self->_accelerationStructureCommandEncoder, 0);
  objc_storeStrong((id *)&self->_computeCommandEncoder, 0);
  objc_storeStrong((id *)&self->_blit, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_commandBufferDescriptor, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSArray)captureAccelerationStructures
{
  return self->_captureAccelerationStructures;
}

- (void)setUsedGPUMemory:(unint64_t)a3
{
  self->_usedGPUMemory = a3;
}

- (unint64_t)usedGPUMemory
{
  return self->_usedGPUMemory;
}

- (void)setObjects:(id)a3
{
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (void)setRequests:(apr_array_header_t *)a3
{
  self->_requests = a3;
}

- (apr_array_header_t)requests
{
  return self->_requests;
}

- (void)flush
{
}

void __26__GTDownloadContext_flush__block_invoke(id a1, NSArray *a2)
{
  v2 = a2;
  uint64_t v24 = _sharedCaptureManager;
  NSUInteger v3 = [(NSArray *)v2 count];
  mach_absolute_time();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, v2);
  v5 = g_signpostLog;
  v6 = v5;
  unint64_t v23 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&def_CFBEC, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Capture-DumpFiles", (const char *)&unk_21C232, buf, 2u);
  }
  os_signpost_id_t spid = v4;

  uint64_t v7 = 0;
  if (v3)
  {
    unint64_t v8 = 0;
    do
    {
      v9 = [(NSArray *)v2 objectAtIndex:v8];
      unint64_t v10 = v8 + 2;
      v11 = [(NSArray *)v2 objectAtIndex:v8 + 1];
      if (([v11 conformsToProtocol:&OBJC_PROTOCOL___MTLIndirectCommandBuffer] & 1) != 0
        || NSClassFromString(@"MTLIOAccelIndirectCommandBuffer")
        && (NSClassFromString(@"MTLIOAccelIndirectCommandBuffer"), (objc_opt_isKindOfClass() & 1) != 0))
      {
        unint64_t v12 = v8 + 3;
        id v13 = v11;
        v14 = [(NSArray *)v2 objectAtIndex:v8 + 2];
        GTMTLDecodeIndirectCommandBuffer(v13, v14);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        id v16 = [v13 allocatedSize];

        atomic_fetch_add((atomic_ullong *volatile)&g_GPUDataDownloaded, (unint64_t)v16);
        unint64_t v10 = v12;
      }
      else
      {
        id v15 = v11;
        atomic_fetch_add((atomic_ullong *volatile)&g_GPUDataDownloaded, (unint64_t)[v15 length]);
      }
      id v17 = v9;
      v18 = (char *)[v17 UTF8String];
      id v19 = v15;
      GTMTLCaptureState_storePointer(v24, v18, (uint64_t *)[v19 bytes], [v19 length]);
      v7 += (uint64_t)[v19 length];
      atomic_fetch_add((atomic_ullong *volatile)&g_resourceDownloaded, 1uLL);

      unint64_t v8 = v10;
    }
    while (v10 < v3);
  }
  v20 = g_signpostLog;
  v21 = v20;
  if (v23 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled((os_log_t)v20))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = v7;
    _os_signpost_emit_with_name_impl(&def_CFBEC, v21, OS_SIGNPOST_INTERVAL_END, spid, "Capture-DumpFiles", "Total bytes: %lu", buf, 0xCu);
  }

  if (!dword_250044) {
    mach_timebase_info((mach_timebase_info_t)&DumpFiles_timebaseInfo);
  }
  mach_absolute_time();
}

- (void)flushWithCallback:(id)a3
{
  accelerationStructureCommandEncoder = self->_accelerationStructureCommandEncoder;
  v5 = (void (**)(id, NSMutableArray *))a3;
  [(MTLAccelerationStructureCommandEncoderSPI *)accelerationStructureCommandEncoder endEncoding];
  [(MTLBlitCommandEncoder *)self->_blit endEncoding];
  [(MTLCommandBuffer *)self->_command commit];
  [(MTLCommandBuffer *)self->_command waitUntilCompleted];
  v5[2](v5, self->_objects);

  v6 = g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    objects = self->_objects;
    unint64_t v8 = v6;
    id v9 = [(NSMutableArray *)objects count];
    id v10 = [(NSMutableArray *)self->_MTLResources count];
    int v15 = 134218240;
    id v16 = v9;
    __int16 v17 = 2048;
    id v18 = v10;
    _os_signpost_emit_with_name_impl(&def_CFBEC, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Capture-flushCleanup", "Objects: %lu, resources: %lu", (uint8_t *)&v15, 0x16u);
  }
  command = self->_command;
  self->_command = 0;

  blit = self->_blit;
  self->_blit = 0;

  id v13 = self->_accelerationStructureCommandEncoder;
  self->_accelerationStructureCommandEncoder = 0;

  self->_usedGPUMemory = 0;
  [(NSMutableArray *)self->_objects removeAllObjects];
  [(NSMutableArray *)self->_MTLResources removeAllObjects];
  v14 = g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&def_CFBEC, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Capture-flushCleanup", (const char *)&unk_21C232, (uint8_t *)&v15, 2u);
  }
}

- (id)accelerationStructureCommandEncoder
{
  if ((qword_2501C8 & 0x200000) != 0)
  {
    [(MTLBlitCommandEncoder *)self->_blit endEncoding];
    blit = self->_blit;
    self->_blit = 0;

    [(MTLComputeCommandEncoder *)self->_computeCommandEncoder endEncoding];
    computeCommandEncoder = self->_computeCommandEncoder;
    self->_computeCommandEncoder = 0;

    [(MTLAccelerationStructureCommandEncoderSPI *)self->_accelerationStructureCommandEncoder endEncoding];
    accelerationStructureCommandEncoder = self->_accelerationStructureCommandEncoder;
    self->_accelerationStructureCommandEncoder = 0;
  }
  if (!self->_command)
  {
    v6 = [(MTLCommandQueue *)self->_queue commandBufferWithDescriptor:self->_commandBufferDescriptor];
    command = self->_command;
    self->_command = v6;
  }
  [(MTLBlitCommandEncoder *)self->_blit endEncoding];
  unint64_t v8 = self->_blit;
  self->_blit = 0;

  [(MTLComputeCommandEncoder *)self->_computeCommandEncoder endEncoding];
  id v9 = self->_computeCommandEncoder;
  self->_computeCommandEncoder = 0;

  id v10 = self->_accelerationStructureCommandEncoder;
  if (!v10)
  {
    v11 = [(MTLCommandBuffer *)self->_command accelerationStructureCommandEncoder];
    unint64_t v12 = self->_accelerationStructureCommandEncoder;
    self->_accelerationStructureCommandEncoder = v11;

    id v10 = self->_accelerationStructureCommandEncoder;
  }

  return v10;
}

- (id)computeCommandEncoder
{
  if ((qword_2501C8 & 0x200000) != 0)
  {
    [(MTLBlitCommandEncoder *)self->_blit endEncoding];
    blit = self->_blit;
    self->_blit = 0;

    [(MTLComputeCommandEncoder *)self->_computeCommandEncoder endEncoding];
    computeCommandEncoder = self->_computeCommandEncoder;
    self->_computeCommandEncoder = 0;

    [(MTLAccelerationStructureCommandEncoderSPI *)self->_accelerationStructureCommandEncoder endEncoding];
    accelerationStructureCommandEncoder = self->_accelerationStructureCommandEncoder;
    self->_accelerationStructureCommandEncoder = 0;
  }
  if (!self->_command)
  {
    v6 = [(MTLCommandQueue *)self->_queue commandBufferWithDescriptor:self->_commandBufferDescriptor];
    command = self->_command;
    self->_command = v6;
  }
  [(MTLBlitCommandEncoder *)self->_blit endEncoding];
  unint64_t v8 = self->_blit;
  self->_blit = 0;

  [(MTLAccelerationStructureCommandEncoderSPI *)self->_accelerationStructureCommandEncoder endEncoding];
  id v9 = self->_accelerationStructureCommandEncoder;
  self->_accelerationStructureCommandEncoder = 0;

  id v10 = self->_computeCommandEncoder;
  if (!v10)
  {
    v11 = [(MTLCommandBuffer *)self->_command computeCommandEncoder];
    unint64_t v12 = self->_computeCommandEncoder;
    self->_computeCommandEncoder = v11;

    id v10 = self->_computeCommandEncoder;
  }

  return v10;
}

- (id)blitCommandEncoder
{
  if ((qword_2501C8 & 0x200000) != 0)
  {
    [(MTLBlitCommandEncoder *)self->_blit endEncoding];
    blit = self->_blit;
    self->_blit = 0;

    [(MTLComputeCommandEncoder *)self->_computeCommandEncoder endEncoding];
    computeCommandEncoder = self->_computeCommandEncoder;
    self->_computeCommandEncoder = 0;

    [(MTLAccelerationStructureCommandEncoderSPI *)self->_accelerationStructureCommandEncoder endEncoding];
    accelerationStructureCommandEncoder = self->_accelerationStructureCommandEncoder;
    self->_accelerationStructureCommandEncoder = 0;
  }
  if (!self->_command)
  {
    v6 = [(MTLCommandQueue *)self->_queue commandBufferWithDescriptor:self->_commandBufferDescriptor];
    command = self->_command;
    self->_command = v6;
  }
  [(MTLComputeCommandEncoder *)self->_computeCommandEncoder endEncoding];
  unint64_t v8 = self->_computeCommandEncoder;
  self->_computeCommandEncoder = 0;

  [(MTLAccelerationStructureCommandEncoderSPI *)self->_accelerationStructureCommandEncoder endEncoding];
  id v9 = self->_accelerationStructureCommandEncoder;
  self->_accelerationStructureCommandEncoder = 0;

  id v10 = self->_blit;
  if (v10)
  {
    unint64_t v11 = self->_blitRequestCount + 1;
    self->_blitRequestCount = v11;
    if (v11 == 1000)
    {
      [(MTLBlitCommandEncoder *)v10 endEncoding];
      unint64_t v12 = [(MTLCommandBuffer *)self->_command blitCommandEncoder];
      id v13 = self->_blit;
      self->_blit = v12;

      self->_blitRequestCount = 1;
      id v10 = self->_blit;
    }
  }
  else
  {
    v14 = [(MTLCommandBuffer *)self->_command blitCommandEncoder];
    int v15 = self->_blit;
    self->_blit = v14;

    id v10 = self->_blit;
    self->_blitRequestCount = 1;
  }

  return v10;
}

- (id)newCommandBuffer
{
  v2 = [(MTLCommandQueue *)self->_queue commandBufferWithDescriptor:self->_commandBufferDescriptor];
  [v2 addCompletedHandler:&__block_literal_global_258];
  return v2;
}

- (void)retainMTLResource:(id)a3
{
}

- (void)dealloc
{
  apr_pool_destroy(self->_pool);
  v3.receiver = self;
  v3.super_class = (Class)GTDownloadContext;
  [(GTDownloadContext *)&v3 dealloc];
}

- (GTDownloadContext)initWithQueue:(id)a3 forRequest:(apr_array_header_t *)a4
{
  id v7 = a3;
  v28.receiver = self;
  v28.super_class = (Class)GTDownloadContext;
  unint64_t v8 = [(GTDownloadContext *)&v28 init];
  id v9 = v8;
  if (v8)
  {
    apr_pool_create_ex(&v8->_pool, 0, 0, 0);
    objc_storeStrong((id *)&v9->_queue, a3);
    id v10 = (MTLCommandBufferDescriptor *)objc_alloc_init((Class)MTLCommandBufferDescriptor);
    commandBufferDescriptor = v9->_commandBufferDescriptor;
    v9->_commandBufferDescriptor = v10;

    if ((qword_2501C8 & 0x100000) != 0) {
      [(MTLCommandBufferDescriptor *)v9->_commandBufferDescriptor setErrorOptions:[(MTLCommandBufferDescriptor *)v9->_commandBufferDescriptor errorOptions] | 1];
    }
    uint64_t v12 = [(MTLCommandQueue *)v9->_queue commandBufferWithDescriptor:v9->_commandBufferDescriptor];
    command = v9->_command;
    v9->_command = (MTLCommandBuffer *)v12;

    v14 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:2 * a4->nelts];
    objects = v9->_objects;
    v9->_objects = v14;

    v9->_requests = apr_array_copy(v9->_pool, a4);
    id v16 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:a4->nelts];
    MTLResources = v9->_MTLResources;
    v9->_MTLResources = v16;

    id v18 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:a4->nelts];
    originalMTLResources = v9->_originalMTLResources;
    v9->_originalMTLResources = v18;

    requests = v9->_requests;
    if (requests->nelts >= 1)
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      char v23 = 0;
      do
      {
        uint64_t v24 = &requests->elts[v21];
        [(NSMutableArray *)v9->_originalMTLResources addObject:*(void *)v24];
        v23 |= v24[46] == 16;
        ++v22;
        requests = v9->_requests;
        v21 += 88;
      }
      while (v22 < requests->nelts);
      if (v23)
      {
        uint64_t v25 = CaptureAccelerationStructures();
        captureAccelerationStructures = v9->_captureAccelerationStructures;
        v9->_captureAccelerationStructures = (NSArray *)v25;
      }
    }
  }

  return v9;
}

@end