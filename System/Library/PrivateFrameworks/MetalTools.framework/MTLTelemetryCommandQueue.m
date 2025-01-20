@interface MTLTelemetryCommandQueue
- (id)commandBuffer;
- (id)commandBufferWithDescriptor:(id)a3;
- (id)commandBufferWithUnretainedReferences;
@end

@implementation MTLTelemetryCommandQueue

- (id)commandBuffer
{
  v3 = [(MTLToolsObject *)self device];
  if (![(MTLDevice *)v3 enableTelemetry]) {
    return 0;
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer");
  if (result)
  {
    id v5 = result;
    v6 = *((void *)v3 + 91);
    if (v6)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __41__MTLTelemetryCommandQueue_commandBuffer__block_invoke;
      block[3] = &unk_264E13C28;
      block[4] = v3;
      dispatch_sync(v6, block);
    }
    return [[MTLTelemetryCommandBuffer alloc] initWithCommandBuffer:v5 commandQueue:self descriptor:0];
  }
  return result;
}

uint64_t __41__MTLTelemetryCommandQueue_commandBuffer__block_invoke(uint64_t result)
{
  return result;
}

- (id)commandBufferWithUnretainedReferences
{
  v3 = [(MTLToolsObject *)self device];
  if (![(MTLDevice *)v3 enableTelemetry]) {
    return 0;
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer");
  if (result)
  {
    id v5 = result;
    v6 = *((void *)v3 + 91);
    if (v6)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__MTLTelemetryCommandQueue_commandBufferWithUnretainedReferences__block_invoke;
      block[3] = &unk_264E13C28;
      block[4] = v3;
      dispatch_sync(v6, block);
    }
    return [[MTLTelemetryCommandBuffer alloc] initWithCommandBuffer:v5 commandQueue:self descriptor:0];
  }
  return result;
}

uint64_t __65__MTLTelemetryCommandQueue_commandBufferWithUnretainedReferences__block_invoke(uint64_t result)
{
  return result;
}

- (id)commandBufferWithDescriptor:(id)a3
{
  id v5 = [(MTLToolsObject *)self device];
  if (![(MTLDevice *)v5 enableTelemetry]) {
    return 0;
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithDescriptor:", -[MTLToolsDevice unwrapMTLCommandBufferDescriptor:alwaysCopy:](self->super.super._device, "unwrapMTLCommandBufferDescriptor:alwaysCopy:", a3, 0));
  if (result)
  {
    id v7 = result;
    v8 = *((void *)v5 + 91);
    if (v8)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __56__MTLTelemetryCommandQueue_commandBufferWithDescriptor___block_invoke;
      v9[3] = &unk_264E13B98;
      v9[4] = v5;
      v9[5] = a3;
      dispatch_sync(v8, v9);
    }
    return [[MTLTelemetryCommandBuffer alloc] initWithCommandBuffer:v7 commandQueue:self descriptor:a3];
  }
  return result;
}

uint64_t __56__MTLTelemetryCommandQueue_commandBufferWithDescriptor___block_invoke(uint64_t a1)
{
  ++**(_DWORD **)(*(void *)(a1 + 32) + 112);
  uint64_t result = [*(id *)(a1 + 40) retainedReferences];
  if ((result & 1) == 0) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 112) + 4);
  }
  return result;
}

@end