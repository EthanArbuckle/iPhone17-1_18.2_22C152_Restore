@interface MTLGPUDebugCommandBuffer
- (MTLGPUDebugCommandBuffer)initWithCommandBuffer:(id)a3 commandQueue:(id)a4 descriptor:(id)a5;
- (ReportBufferEntry)_allocReportEntryStorageForType:(SEL)a3;
- (id).cxx_construct;
- (id)_newReportBuffer;
- (id)accelerationStructureCommandEncoder;
- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3;
- (id)blitCommandEncoder;
- (id)blitCommandEncoderWithDescriptor:(id)a3;
- (id)computeCommandEncoder;
- (id)computeCommandEncoderWithDescriptor:(id)a3;
- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3;
- (id)encodeBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5 resultOffset:(unint64_t *)a6;
- (id)encoderIdentifierForEncoderIndex:(unsigned int)a3;
- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3;
- (id)renderCommandEncoderWithDescriptor:(id)a3;
- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4;
- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)temporaryBufferWithBytes:(const void *)a3 length:(unint64_t)a4;
- (id)temporaryBufferWithLength:(unint64_t)a3;
- (int)resourceUsageForBuffer:(id)a3 stage:(unint64_t)a4;
- (int)resourceUsageForTexture:(id)a3 stage:(unint64_t)a4;
- (pair<id<MTLBuffer>,)_temporaryBufferWithLength:(unint64_t)a3;
- (unint64_t)resourceTypeForTexture:(id)a3 stage:(unint64_t)a4;
- (void)_checkReportBuffers;
- (void)_encodeReportBuffer:(id)a3 type:(unint64_t)a4;
- (void)_lateInit;
- (void)addResidencySetGPUDebug:(id)a3 fromEncoder:(id)a4;
- (void)beginUseOfMeshShadersInEncoder:(id)a3;
- (void)beginingEncoder:(id)a3 type:(unint64_t)a4;
- (void)dealloc;
- (void)encodeResourceTableBuffers:(id)a3 type:(unint64_t)a4;
- (void)endingEncoder:(id)a3 type:(unint64_t)a4;
- (void)markBuffer:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5;
- (void)markHeap:(id)a3 stages:(unint64_t)a4;
- (void)markHeap:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5;
- (void)markTexture:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5;
- (void)preCommit;
- (void)preCompletionHandlers;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
@end

@implementation MTLGPUDebugCommandBuffer

- (MTLGPUDebugCommandBuffer)initWithCommandBuffer:(id)a3 commandQueue:(id)a4 descriptor:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)MTLGPUDebugCommandBuffer;
  v5 = [(MTLToolsCommandBuffer *)&v11 initWithCommandBuffer:a3 parent:a4 descriptor:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(MTLToolsObject *)v5 device];
    *((void *)v6 + 19) = (char *)v7 + 264;
    *((void *)v6 + 20) = (char *)v7 + 292;
    int v8 = [(MTLDevice *)v7 areWritableHeapsEnabled];
    uint64_t v9 = 3;
    if (!v8) {
      uint64_t v9 = 1;
    }
    *((void *)v6 + 63) = v9;
    *((unsigned char *)v6 + 404) = [*((id *)v6 + 3) supportsTileShaders];
    *((unsigned char *)v6 + 405) = [*((id *)v6 + 3) supportsMeshShaders];
    *((_DWORD *)v6 + 64) = 0;
    *((_DWORD *)v6 + 65) = 0;
    *((_DWORD *)v6 + 100) = 0;
  }
  return v6;
}

- (void)_lateInit
{
  if (!*((unsigned char *)self + 149))
  {
    *((unsigned char *)self + 149) = 1;
    uint64_t v3 = *(void *)(*((void *)self + 19) + 20);
    if ((v3 & 0x810000) == 0x10000)
    {
      *((void *)self + 21) = [*((id *)self + 3) newStageBufferArgumentEncoder];
      uint64_t v3 = *(void *)(*((void *)self + 19) + 20);
    }
    if ((v3 & 2) != 0)
    {
      *((void *)self + 22) = [(MTLGPUDebugCommandBuffer *)self _newReportBuffer];
      *((void *)self + 23) = 0;
      *((void *)self + 24) = [(MTLGPUDebugCommandBuffer *)self _newReportBuffer];
      *((void *)self + 25) = 0;
    }
    v4 = (_OWORD *)((char *)self + 232);
    *((void *)self + 29) = MetalBufferHeap::allocBuffer((std::mutex *)(*((void *)self + 3) + 112));
    *((_DWORD *)self + 60) = v5;
    v6 = (char **)((char *)self + 208);
    v7 = (_OWORD *)*((void *)self + 27);
    unint64_t v8 = *((void *)self + 28);
    if ((unint64_t)v7 >= v8)
    {
      uint64_t v10 = ((char *)v7 - *v6) >> 4;
      unint64_t v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 60) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v12 = v8 - (void)*v6;
      if (v12 >> 3 > v11) {
        unint64_t v11 = v12 >> 3;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v13) {
        v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<NSData *,unsigned long>>>((uint64_t)self + 224, v13);
      }
      else {
        v14 = 0;
      }
      v15 = &v14[16 * v10];
      v16 = &v14[16 * v13];
      *(_OWORD *)v15 = *v4;
      uint64_t v9 = v15 + 16;
      v18 = *v6;
      v17 = (char *)*((void *)self + 27);
      if (v17 != *v6)
      {
        do
        {
          uint64_t v19 = *((void *)v17 - 2);
          v17 -= 16;
          int v20 = *((_DWORD *)v17 + 2);
          *((void *)v15 - 2) = v19;
          v15 -= 16;
          *((_DWORD *)v15 + 2) = v20;
        }
        while (v17 != v18);
        v17 = *v6;
      }
      MTLGPUDebugCommandBuffer *v6 = v15;
      *((void *)self + 27) = v9;
      *((void *)self + 28) = v16;
      if (v17) {
        operator delete(v17);
      }
    }
    else
    {
      _OWORD *v7 = *v4;
      uint64_t v9 = v7 + 1;
    }
    *((void *)self + 27) = v9;
    if ((*(void *)(*((void *)self + 19) + 20) & 0x200000001) != 0)
    {
      for (uint64_t i = 0; i != 32; i += 8)
      {
        v22 = (void *)[*((id *)self + 3) newInternalBufferWithLength:0x40000 options:0];
        *(void *)((char *)self + i + 408) = v22;
        v23 = (unsigned char *)[v22 contents];
        *v23 |= 3u;
      }
      for (uint64_t j = 0; j != 32; j += 8)
        *(void *)((char *)self + j + 440) = [*((id *)self + 3) newInternalBufferWithLength:(*(_DWORD *)(*((void *)self + 19) + 16) << 18) options:0];
      for (uint64_t k = 0; k != 32; k += 8)
        *(void *)((char *)self + k + 472) = [*((id *)self + 3) newInternalBufferWithLength:(*(_DWORD *)(*((void *)self + 19) + 16) << 19) options:0];
    }
  }
}

- (int)resourceUsageForBuffer:(id)a3 stage:(unint64_t)a4
{
  switch(a4)
  {
    case 1uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 2uLL:
    case 4uLL:
      int v5 = (id *)((char *)self + 416);
      break;
    case 8uLL:
      int v5 = (id *)((char *)self + 424);
      break;
    default:
      if (a4 == 16) {
        int v5 = (id *)((char *)self + 432);
      }
      else {
LABEL_5:
      }
        int v5 = (id *)((char *)self + 408);
      break;
  }
  uint64_t v6 = [*v5 contents];
  unsigned int v7 = [a3 bufferIndex];
  return (*(unsigned __int8 *)(v6 + (v7 >> 2)) >> (2 * (v7 & 3))) & 3;
}

- (int)resourceUsageForTexture:(id)a3 stage:(unint64_t)a4
{
  switch(a4)
  {
    case 1uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 2uLL:
    case 4uLL:
      int v5 = (id *)((char *)self + 448);
      break;
    case 8uLL:
      int v5 = (id *)((char *)self + 456);
      break;
    default:
      if (a4 == 16) {
        int v5 = (id *)((char *)self + 464);
      }
      else {
LABEL_5:
      }
        int v5 = (id *)((char *)self + 440);
      break;
  }
  uint64_t v6 = [*v5 contents];
  unsigned int v7 = [a3 gpuIdentifier];
  return (*(unsigned __int8 *)(v6 + (v7 >> 2)) >> (2 * (v7 & 3))) & 3;
}

- (unint64_t)resourceTypeForTexture:(id)a3 stage:(unint64_t)a4
{
  switch(a4)
  {
    case 1uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 2uLL:
    case 4uLL:
      int v5 = (id *)((char *)self + 480);
      break;
    case 8uLL:
      int v5 = (id *)((char *)self + 488);
      break;
    default:
      if (a4 == 16) {
        int v5 = (id *)((char *)self + 496);
      }
      else {
LABEL_5:
      }
        int v5 = (id *)((char *)self + 472);
      break;
  }
  uint64_t v6 = [*v5 contents];
  unsigned int v7 = [a3 gpuIdentifier];
  return (*(unsigned __int8 *)(v6 + (v7 >> 1)) >> (4 * (v7 & 1))) & 0xF;
}

- (pair<id<MTLBuffer>,)_temporaryBufferWithLength:(unint64_t)a3
{
  int v5 = (std::mutex *)((char *)self + 336);
  std::mutex::lock((std::mutex *)((char *)self + 336));
  uint64_t v6 = (std::mutex **)((char *)self + 232);
  MTLBuffer = (void *)MetalBuffer::getMTLBuffer((MetalBuffer *)((char *)self + 232));
  uint64_t v8 = *((void *)self + 31);
  unint64_t v9 = (a3 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (v8 + v9 > [MTLBuffer length])
  {
    MTLGPUDebugCommandBuffer *v6 = MetalBufferHeap::allocBuffer((std::mutex *)([(MTLToolsObject *)self device] + 112));
    *((_DWORD *)self + 60) = v10;
    *((void *)self + 31) = 0;
    MTLBuffer = (void *)MetalBuffer::getMTLBuffer((MetalBuffer *)((char *)self + 232));
    unint64_t v11 = (char **)((char *)self + 208);
    uint64_t v12 = (_OWORD *)*((void *)self + 27);
    unint64_t v13 = *((void *)self + 28);
    if ((unint64_t)v12 >= v13)
    {
      uint64_t v15 = ((char *)v12 - *v11) >> 4;
      unint64_t v16 = v15 + 1;
      if ((unint64_t)(v15 + 1) >> 60) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v17 = v13 - (void)*v11;
      if (v17 >> 3 > v16) {
        unint64_t v16 = v17 >> 3;
      }
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v18 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v18 = v16;
      }
      if (v18) {
        uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<NSData *,unsigned long>>>((uint64_t)self + 224, v18);
      }
      else {
        uint64_t v19 = 0;
      }
      int v20 = &v19[16 * v15];
      v21 = &v19[16 * v18];
      *(_OWORD *)int v20 = *(_OWORD *)v6;
      v14 = v20 + 16;
      v23 = *v11;
      v22 = (char *)*((void *)self + 27);
      if (v22 != *v11)
      {
        do
        {
          uint64_t v24 = *((void *)v22 - 2);
          v22 -= 16;
          int v25 = *((_DWORD *)v22 + 2);
          *((void *)v20 - 2) = v24;
          v20 -= 16;
          *((_DWORD *)v20 + 2) = v25;
        }
        while (v22 != v23);
        v22 = *v11;
      }
      *unint64_t v11 = v20;
      *((void *)self + 27) = v14;
      *((void *)self + 28) = v21;
      if (v22) {
        operator delete(v22);
      }
    }
    else
    {
      *uint64_t v12 = *(_OWORD *)v6;
      v14 = v12 + 1;
    }
    *((void *)self + 27) = v14;
  }
  unint64_t v26 = *((void *)self + 31);
  *((void *)self + 31) = v26 + v9;
  std::mutex::unlock(v5);
  v27 = MTLBuffer;
  unint64_t v28 = v26;
  result.var1 = v28;
  result.var0 = v27;
  return result;
}

- (id)temporaryBufferWithLength:(unint64_t)a3
{
  BOOL v5 = [(MTLToolsCommandBuffer *)self useRetainedObjectsLock];
  if (v5) {
    uint64_t v6 = (os_unfair_lock_s *)((char *)self + 400);
  }
  else {
    uint64_t v6 = 0;
  }
  if (v5) {
    os_unfair_lock_lock((os_unfair_lock_t)self + 100);
  }
  uint64_t v7 = [(MTLGPUDebugCommandBuffer *)self _temporaryBufferWithLength:a3];
  unint64_t v9 = [[MTLGPUDebugBuffer alloc] initWithBuffer:v7 device:*((void *)self + 3) offset:v8 length:a3];
  [(MTLToolsCommandBuffer *)self addRetainedObject:v9];

  if (v6) {
    os_unfair_lock_unlock(v6);
  }
  return v9;
}

- (id)temporaryBufferWithBytes:(const void *)a3 length:(unint64_t)a4
{
  id v6 = [(MTLGPUDebugCommandBuffer *)self temporaryBufferWithLength:a4];
  memcpy((void *)[v6 contents], a3, a4);
  return v6;
}

- (void)markBuffer:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  char v5 = a5;
  char v6 = a4;
  int v9 = *((unsigned __int8 *)self + 44);
  int v10 = (os_unfair_lock_s *)((char *)self + 40);
  if (v9) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = 0;
  }
  if (v9) {
    os_unfair_lock_lock(v10);
  }
  char v12 = v6 & 7;
  if (v5) {
  if ((v5 & 6) != 0)
  }
  if ((v5 & 8) != 0) {
  if ((v5 & 0x10) != 0)
  }
  if (v11)
  {
    os_unfair_lock_unlock(v11);
  }
}

- (void)markTexture:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  char v5 = a5;
  char v6 = a4;
  int v9 = *((unsigned __int8 *)self + 44);
  int v10 = (os_unfair_lock_s *)((char *)self + 40);
  if (v9) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = 0;
  }
  if (v9) {
    os_unfair_lock_lock(v10);
  }
  char v12 = v6 & 7;
  if (v5)
  {
  }
  if ((v5 & 6) != 0)
  {
  }
  if ((v5 & 8) != 0)
  {
  }
  if ((v5 & 0x10) != 0)
  {
  }
  if (v11)
  {
    os_unfair_lock_unlock(v11);
  }
}

- (void)markHeap:(id)a3 stages:(unint64_t)a4
{
}

- (void)markHeap:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  uint64_t v7 = (void *)((char *)self + 504);
  uint64_t v8 = (char *)*((void *)self + 64);
  int v9 = (char *)*((void *)self + 65);
  int v10 = v8;
  if (v8 != v9)
  {
    int v10 = (char *)*((void *)self + 64);
    while (*(id *)v10 != a3)
    {
      v10 += 24;
      if (v10 == v9) {
        goto LABEL_8;
      }
    }
  }
  if (v10 == v9)
  {
LABEL_8:
    unint64_t v12 = *v7 | a4;
    unint64_t v13 = *((void *)self + 66);
    if ((unint64_t)v9 >= v13)
    {
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v8) >> 3) + 1;
      if (v15 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v13 - (void)v8) >> 3);
      if (2 * v16 > v15) {
        unint64_t v15 = 2 * v16;
      }
      if (v16 >= 0x555555555555555) {
        unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v17 = v15;
      }
      if (v17)
      {
        if (v17 > 0xAAAAAAAAAAAAAAALL) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        unint64_t v18 = (char *)operator new(24 * v17);
      }
      else
      {
        unint64_t v18 = 0;
      }
      uint64_t v19 = (id *)&v18[8 * ((v9 - v8) >> 3)];
      *uint64_t v19 = a3;
      v19[1] = (id)a5;
      v19[2] = (id)v12;
      v14 = v19 + 3;
      if (v8 != v9)
      {
        do
        {
          long long v20 = *(_OWORD *)(v9 - 24);
          *(v19 - 1) = (id)*((void *)v9 - 1);
          *(_OWORD *)(v19 - 3) = v20;
          v19 -= 3;
          v9 -= 24;
        }
        while (v9 != v8);
        uint64_t v8 = (char *)v7[1];
      }
      v7[1] = v19;
      v7[2] = v14;
      v7[3] = &v18[24 * v17];
      if (v8) {
        operator delete(v8);
      }
    }
    else
    {
      *(void *)int v9 = a3;
      *((void *)v9 + 1) = a5;
      v14 = v9 + 24;
      *((void *)v9 + 2) = v12;
    }
    v7[2] = v14;
  }
  else
  {
    unint64_t v11 = *((void *)v10 + 2) | a4;
    *((void *)v10 + 1) |= a5;
    *((void *)v10 + 2) = v11;
  }
}

- (id)encoderIdentifierForEncoderIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = *((void *)self + 39);
  if (a3 >= (unint64_t)((*((void *)self + 40) - v4) >> 3))
  {
    id result = (id)objc_msgSend(NSString, "stringWithFormat:", @"%u", *(void *)&a3);
    if (result) {
      return result;
    }
  }
  else
  {
    id result = *(id *)(v4 + 8 * a3);
    if (result) {
      return result;
    }
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%u", v3);
}

- (void)_checkReportBuffers
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)self + 36);
  uint64_t v14 = *((void *)self + 37);
  if (v2 != v14)
  {
    uint64_t v4 = (FILE **)MEMORY[0x263EF8348];
    do
    {
      char v5 = (void *)MEMORY[0x23ECD5710]();
      MTLGPUDebugReadReportBuffer(self, (unsigned int *)([*(id *)(v2 + 8) contents] + *(void *)(v2 + 16)), *(void *)v2);
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      char v6 = [(MTLToolsCommandBuffer *)self logs];
      uint64_t v7 = [(MTLLogContainer *)v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        unint64_t v15 = v5;
        char v9 = 0;
        uint64_t v10 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v6);
            }
            unint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (![v12 type])
            {
              if ((**((unsigned char **)self + 20) & 8) != 0)
              {
                fputs((const char *)objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String"), *v4);
              }
              else
              {
                unint64_t v13 = MTLGPUDebugLog();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
                  [(MTLLegacySVCommandBuffer *)v20 _checkReportBuffers];
                }
              }
              char v9 = 1;
            }
          }
          uint64_t v8 = [(MTLLogContainer *)v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
        }
        while (v8);
        char v5 = v15;
        if ((*(_DWORD *)&v9 & ((**((unsigned char **)self + 20) & 4) >> 2)) == 1) {
          abort();
        }
      }
      v2 += 24;
    }
    while (v2 != v14);
  }
}

- (void)beginingEncoder:(id)a3 type:(unint64_t)a4
{
  uint64_t v7 = *(void *)(*((void *)self + 19) + 20);
  if ((v7 & 2) != 0)
  {
    std::mutex::lock((std::mutex *)((char *)self + 336));
    [(MTLGPUDebugCommandBuffer *)self _encodeReportBuffer:a3 type:a4];
    std::mutex::unlock((std::mutex *)((char *)self + 336));
    uint64_t v7 = *(void *)(*((void *)self + 19) + 20);
  }
  if ((v7 & 0x200000001) != 0)
  {
    [(MTLGPUDebugCommandBuffer *)self encodeResourceTableBuffers:a3 type:a4];
  }
}

- (void)endingEncoder:(id)a3 type:(unint64_t)a4
{
  uint64_t v7 = (std::mutex *)((char *)self + 336);
  std::mutex::lock((std::mutex *)((char *)self + 336));
  if ((*(unsigned char *)(*((void *)self + 19) + 20) & 2) != 0)
  {
    unsigned int v8 = [a3 encoderID];
    uint64_t v9 = v8;
    if (v8 >= (unint64_t)((uint64_t)(*((void *)self + 40) - *((void *)self + 39)) >> 3)) {
      std::vector<objc_object  {objcproto9MTLBuffer}*>::resize((uint64_t)self + 312, (unint64_t)((float)(v8 + 1) * 1.5));
    }
    id v10 = (id)[a3 label];
    if (a4 == 3)
    {
      uint64_t v11 = [*((id *)a3 + 1) label];
      if (v11)
      {

        id v10 = (id)[[NSString alloc] initWithFormat:@"%@:%@", v11, v10];
      }
    }
    *(void *)(*((void *)self + 39) + 8 * v9) = v10;
  }
  ++*((_DWORD *)self + 64);

  std::mutex::unlock(v7);
}

- (void)beginUseOfMeshShadersInEncoder:(id)a3
{
  if ((*(unsigned char *)(*((void *)self + 19) + 20) & 2) != 0)
  {
    char v5 = (std::mutex *)((char *)self + 336);
    std::mutex::lock((std::mutex *)((char *)self + 336));
    if (*((unsigned char *)self + 406))
    {
      *((unsigned char *)self + 406) = 0;
      [(MTLGPUDebugCommandBuffer *)self _allocReportEntryStorageForType:8];
      -[MTLGPUDebugCommandBuffer _allocReportEntryStorageForType:](self, "_allocReportEntryStorageForType:", 7, 0);
      [a3 setObjectReportBuffer:0 offset:0];
      [a3 setMeshReportBuffer:0 offset:0];
    }
    std::mutex::unlock(v5);
  }
}

- (id)encodeBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5 resultOffset:(unint64_t *)a6
{
  NSUInteger length = a5.length;
  uint64_t v10 = -[MTLGPUDebugCommandBuffer _temporaryBufferWithLength:](self, "_temporaryBufferWithLength:", objc_msgSend(*((id *)self + 21), "encodedLength", a3, a4, a5.location));
  unint64_t v12 = v11;
  std::mutex::lock((std::mutex *)((char *)self + 336));
  long long v19 = (void *)v10;
  [*((id *)self + 21) setArgumentBuffer:v10 offset:v12];
  if (length)
  {
    for (uint64_t i = 0; length != i; ++i)
    {
      uint64_t v14 = (void *)a3[i];
      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v15 = (void *)*((void *)self + 21);
          uint64_t v16 = [v14 baseObject];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend(*((id *)self + 21), "setVisibleFunctionTable:atIndex:", objc_msgSend(v14, "baseObject"), i);
            continue;
          }
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          unint64_t v15 = (void *)*((void *)self + 21);
          if (isKindOfClass)
          {
            objc_msgSend(v15, "setIntersectionFunctionTable:atIndex:", objc_msgSend(v14, "baseObject"), i);
            continue;
          }
          uint64_t v16 = [v14 baseObject];
        }
        [v15 setBuffer:v16 offset:a4[i] atIndex:i];
      }
    }
  }
  *a6 = v12;
  std::mutex::unlock((std::mutex *)((char *)self + 336));
  return v19;
}

- (id)_newReportBuffer
{
  uint64_t v3 = (void *)[*((id *)self + 3) newInternalBufferWithLength:7360 options:0];
  uint64_t v4 = -[MTLGPUDebugBuffer initWithBuffer:device:offset:length:track:]([MTLGPUDebugBuffer alloc], "initWithBuffer:device:offset:length:track:", v3, *((void *)self + 3), 0, [v3 length], 0);

  return v4;
}

- (ReportBufferEntry)_allocReportEntryStorageForType:(SEL)a3
{
  uint64_t v7 = &OBJC_IVAR___MTLGPUDebugCommandBuffer__vertexComputeReportBuffer;
  if (a4 == 2) {
    uint64_t v7 = &OBJC_IVAR___MTLGPUDebugCommandBuffer__fragmentReportBuffer;
  }
  uint64_t v8 = *v7;
  uint64_t v9 = &OBJC_IVAR___MTLGPUDebugCommandBuffer__vertexComputeReportOffset;
  if (a4 == 2) {
    uint64_t v9 = &OBJC_IVAR___MTLGPUDebugCommandBuffer__fragmentReportOffset;
  }
  uint64_t v10 = *v9;
  unint64_t v11 = *(void *)((char *)self + v10) + 736;
  id result = (ReportBufferEntry *)[*(id *)((char *)self + v8) length];
  if (v11 <= (unint64_t)result)
  {
    unint64_t v17 = *(void *)((char *)self + v10);
  }
  else
  {
    unint64_t v13 = (void **)((char *)self + 264);
    uint64_t v14 = (void *)*((void *)self + 34);
    unint64_t v15 = *((void *)self + 35);
    if ((unint64_t)v14 >= v15)
    {
      uint64_t v18 = ((char *)v14 - (unsigned char *)*v13) >> 3;
      if ((unint64_t)(v18 + 1) >> 61) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v19 = v15 - (void)*v13;
      uint64_t v20 = v19 >> 2;
      if (v19 >> 2 <= (unint64_t)(v18 + 1)) {
        uint64_t v20 = v18 + 1;
      }
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v21 = v20;
      }
      if (v21) {
        v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)self + 280, v21);
      }
      else {
        v22 = 0;
      }
      uint64_t v23 = &v22[8 * v18];
      uint64_t v24 = &v22[8 * v21];
      *(void *)uint64_t v23 = *(void *)((char *)self + v8);
      uint64_t v16 = v23 + 8;
      unint64_t v26 = (char *)*v13;
      int v25 = (char *)*((void *)self + 34);
      if (v25 != *v13)
      {
        do
        {
          uint64_t v27 = *((void *)v25 - 1);
          v25 -= 8;
          *((void *)v23 - 1) = v27;
          v23 -= 8;
        }
        while (v25 != v26);
        int v25 = (char *)*v13;
      }
      *unint64_t v13 = v23;
      *((void *)self + 34) = v16;
      *((void *)self + 35) = v24;
      if (v25) {
        operator delete(v25);
      }
    }
    else
    {
      void *v14 = *(void *)((char *)self + v8);
      uint64_t v16 = v14 + 1;
    }
    *((void *)self + 34) = v16;
    id result = [(MTLGPUDebugCommandBuffer *)self _newReportBuffer];
    unint64_t v17 = 0;
    *(void *)((char *)self + v8) = result;
    *(void *)((char *)self + v10) = 0;
  }
  retstr->var1 = *(id *)((char *)self + v8);
  retstr->var2 = v17;
  retstr->var0 = a4;
  *(void *)((char *)self + v10) = v17 + 736;
  unint64_t v28 = (ReportBufferEntry **)((char *)self + 288);
  v30 = (ReportBufferEntry *)*((void *)self + 37);
  unint64_t v29 = (unint64_t)v28[2];
  if ((unint64_t)v30 >= v29)
  {
    v32 = *v28;
    unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * (((char *)v30 - (char *)*v28) >> 3);
    unint64_t v34 = v33 + 1;
    if (v33 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v35 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v29 - (void)v32) >> 3);
    if (2 * v35 > v34) {
      unint64_t v34 = 2 * v35;
    }
    if (v35 >= 0x555555555555555) {
      unint64_t v36 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v36 = v34;
    }
    if (v36)
    {
      if (v36 > 0xAAAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      id result = (ReportBufferEntry *)operator new(24 * v36);
    }
    else
    {
      id result = 0;
    }
    v37 = result + v33;
    *(_OWORD *)&v37->var0 = *(_OWORD *)&retstr->var0;
    v37->var2 = retstr->var2;
    v31 = v37 + 1;
    if (v30 != v32)
    {
      do
      {
        long long v38 = *(_OWORD *)&v30[-1].var0;
        v37[-1].var2 = v30[-1].var2;
        *(_OWORD *)&v37[-1].var0 = v38;
        --v37;
        --v30;
      }
      while (v30 != v32);
      v30 = *v28;
    }
    *unint64_t v28 = v37;
    v28[1] = v31;
    v28[2] = &result[v36];
    if (v30) {
      operator delete(v30);
    }
  }
  else
  {
    *(_OWORD *)&v30->var0 = *(_OWORD *)&retstr->var0;
    v30->var2 = retstr->var2;
    v31 = v30 + 1;
  }
  v28[1] = v31;
  return result;
}

- (void)encodeResourceTableBuffers:(id)a3 type:(unint64_t)a4
{
  if (a4 == 3)
  {
LABEL_4:
    char v5 = (void *)((char *)self + 408);
    char v6 = (void *)((char *)self + 440);
    uint64_t v7 = (void *)((char *)self + 472);
    [a3 setBufferUsageTable:*((void *)self + 51) textureUsageTable:*((void *)self + 55) textureTypeTable:*((void *)self + 59) forStage:1];
    [a3 setBufferUsageTable:v5[1] textureUsageTable:v6[1] textureTypeTable:v7[1] forStage:2];
    [a3 setBufferUsageTable:v5[2] textureUsageTable:v6[2] textureTypeTable:v7[2] forStage:8];
    uint64_t v8 = v5[3];
    uint64_t v9 = v6[3];
    uint64_t v10 = v7[3];
    [a3 setBufferUsageTable:v8 textureUsageTable:v9 textureTypeTable:v10 forStage:16];
    return;
  }
  if (a4 != 1)
  {
    if (a4) {
      return;
    }
    goto LABEL_4;
  }
  uint64_t v11 = *((void *)self + 51);
  uint64_t v12 = *((void *)self + 55);
  uint64_t v13 = *((void *)self + 59);

  [a3 setBufferUsageTable:v11 textureUsageTable:v12 textureTypeTable:v13];
}

- (void)_encodeReportBuffer:(id)a3 type:(unint64_t)a4
{
  if (a4 == 3)
  {
LABEL_4:
    if (self)
    {
      [(MTLGPUDebugCommandBuffer *)self _allocReportEntryStorageForType:1];
      [(MTLGPUDebugCommandBuffer *)self _allocReportEntryStorageForType:2];
    }
    [a3 setVertexReportBuffer:0 offset:0];
    [a3 setFragmentReportBuffer:0 offset:0];
    if (*((unsigned char *)self + 404))
    {
      [(MTLGPUDebugCommandBuffer *)self _allocReportEntryStorageForType:2];
      [a3 setTileReportBuffer:0 offset:0];
    }
    if (*((unsigned char *)self + 405)) {
      *((unsigned char *)self + 406) = 1;
    }
    return;
  }
  if (a4 != 1)
  {
    if (a4) {
      return;
    }
    goto LABEL_4;
  }
  if (self) {
    [(MTLGPUDebugCommandBuffer *)self _allocReportEntryStorageForType:3];
  }
  [a3 setKernelReportBuffer:0 offset:0];
}

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  [(MTLGPUDebugCommandBuffer *)self _lateInit];
  char v5 = -[MTLGPUDebugRenderCommandEncoder initWithRenderCommandEncoder:commandBuffer:descriptor:encoderID:]([MTLGPUDebugRenderCommandEncoder alloc], "initWithRenderCommandEncoder:commandBuffer:descriptor:encoderID:", objc_msgSend(*((id *)self + 2), "renderCommandEncoderWithDescriptor:", -[MTLToolsCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:", a3)), self, a3, *((unsigned int *)self + 64));
  [(MTLGPUDebugCommandBuffer *)self beginingEncoder:v5 type:0];

  return v5;
}

- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  [(MTLGPUDebugCommandBuffer *)self _lateInit];
  uint64_t v9 = -[MTLGPUDebugRenderCommandEncoder initWithRenderCommandEncoder:commandBuffer:descriptor:encoderID:]([MTLGPUDebugRenderCommandEncoder alloc], "initWithRenderCommandEncoder:commandBuffer:descriptor:encoderID:", objc_msgSend(*((id *)self + 2), "sampledRenderCommandEncoderWithDescriptor:programInfoBuffer:capacity:", -[MTLToolsCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:", a3), a4, a5), self, a3, *((unsigned int *)self + 64));
  [(MTLGPUDebugCommandBuffer *)self beginingEncoder:v9 type:0];

  return v9;
}

- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3
{
  [(MTLGPUDebugCommandBuffer *)self _lateInit];
  char v5 = -[MTLGPUDebugParallelRenderCommandEncoder initWithParallelRenderCommandEncoder:parent:descriptor:encoderID:]([MTLGPUDebugParallelRenderCommandEncoder alloc], "initWithParallelRenderCommandEncoder:parent:descriptor:encoderID:", objc_msgSend(*((id *)self + 2), "parallelRenderCommandEncoderWithDescriptor:", -[MTLToolsCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:", a3)), self, a3, *((unsigned int *)self + 64));

  return v5;
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3
{
  [(MTLGPUDebugCommandBuffer *)self _lateInit];
  char v5 = -[MTLGPUDebugComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:]([MTLGPUDebugComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:", [*((id *)self + 2) computeCommandEncoderWithDispatchType:a3], self, 0, *((unsigned int *)self + 64));
  [(MTLGPUDebugCommandBuffer *)self beginingEncoder:v5 type:1];

  return v5;
}

- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  [(MTLGPUDebugCommandBuffer *)self _lateInit];
  uint64_t v9 = -[MTLGPUDebugComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:]([MTLGPUDebugComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:", [*((id *)self + 2) sampledComputeCommandEncoderWithDispatchType:a3 programInfoBuffer:a4 capacity:a5], self, 0, *((unsigned int *)self + 64));
  [(MTLGPUDebugCommandBuffer *)self beginingEncoder:v9 type:1];

  return v9;
}

- (id)computeCommandEncoderWithDescriptor:(id)a3
{
  [(MTLGPUDebugCommandBuffer *)self _lateInit];
  char v5 = -[MTLGPUDebugComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:]([MTLGPUDebugComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:", objc_msgSend(*((id *)self + 2), "computeCommandEncoderWithDescriptor:", -[MTLToolsCommandBuffer unwrapMTLComputePassDescriptor:](self, "unwrapMTLComputePassDescriptor:", a3)), self, a3, *((unsigned int *)self + 64));
  [(MTLGPUDebugCommandBuffer *)self beginingEncoder:v5 type:1];

  return v5;
}

- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  [(MTLGPUDebugCommandBuffer *)self _lateInit];
  uint64_t v9 = -[MTLGPUDebugComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:]([MTLGPUDebugComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:encoderID:", objc_msgSend(*((id *)self + 2), "sampledComputeCommandEncoderWithDescriptor:programInfoBuffer:capacity:", -[MTLToolsCommandBuffer unwrapMTLComputePassDescriptor:](self, "unwrapMTLComputePassDescriptor:", a3), a4, a5), self, a3, *((unsigned int *)self + 64));
  [(MTLGPUDebugCommandBuffer *)self beginingEncoder:v9 type:1];

  return v9;
}

- (id)computeCommandEncoder
{
  return [(MTLGPUDebugCommandBuffer *)self computeCommandEncoderWithDispatchType:0];
}

- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  return [(MTLGPUDebugCommandBuffer *)self sampledComputeCommandEncoderWithDispatchType:0 programInfoBuffer:a3 capacity:a4];
}

- (id)blitCommandEncoder
{
  [(MTLGPUDebugCommandBuffer *)self _lateInit];
  uint64_t v3 = -[MTLGPUDebugBlitCommandEncoder initWithBlitCommandEncoder:parent:descriptor:encoderID:]([MTLGPUDebugBlitCommandEncoder alloc], "initWithBlitCommandEncoder:parent:descriptor:encoderID:", [*((id *)self + 2) blitCommandEncoder], self, 0, *((unsigned int *)self + 64));
  [(MTLGPUDebugCommandBuffer *)self beginingEncoder:v3 type:2];

  return v3;
}

- (id)blitCommandEncoderWithDescriptor:(id)a3
{
  [(MTLGPUDebugCommandBuffer *)self _lateInit];
  char v5 = -[MTLGPUDebugBlitCommandEncoder initWithBlitCommandEncoder:parent:descriptor:encoderID:]([MTLGPUDebugBlitCommandEncoder alloc], "initWithBlitCommandEncoder:parent:descriptor:encoderID:", objc_msgSend(*((id *)self + 2), "blitCommandEncoderWithDescriptor:", -[MTLToolsCommandBuffer unwrapMTLBlitPassDescriptor:](self, "unwrapMTLBlitPassDescriptor:", a3)), self, a3, *((unsigned int *)self + 64));
  [(MTLGPUDebugCommandBuffer *)self beginingEncoder:v5 type:2];

  return v5;
}

- (id)accelerationStructureCommandEncoder
{
  id result = (id)[*((id *)self + 2) accelerationStructureCommandEncoder];
  if (result)
  {
    uint64_t v4 = [[MTLGPUDebugAccelerationStructureCommandEncoder alloc] initWithAccelerationStructureCommandEncoder:result parent:self accelerationStructurePassDescriptor:0];
    return v4;
  }
  return result;
}

- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3
{
  [(MTLGPUDebugCommandBuffer *)self _lateInit];
  id result = (id)objc_msgSend(*((id *)self + 2), "accelerationStructureCommandEncoderWithDescriptor:", -[MTLToolsCommandBuffer unwrapMTLAccelerationStructurePassDescriptor:](self, "unwrapMTLAccelerationStructurePassDescriptor:", a3));
  if (result)
  {
    char v6 = [[MTLGPUDebugAccelerationStructureCommandEncoder alloc] initWithAccelerationStructureCommandEncoder:result parent:self accelerationStructurePassDescriptor:a3];
    return v6;
  }
  return result;
}

- (void)addResidencySetGPUDebug:(id)a3 fromEncoder:(id)a4
{
  id v54 = a3;
  char v6 = (char *)self + 576;
  unint64_t v7 = [a4 hash];
  int8x8_t v8 = *(int8x8_t *)(v6 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8(v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v10 = v7;
      if (v7 >= *(void *)&v8) {
        unint64_t v10 = v7 % *(void *)&v8;
      }
    }
    else
    {
      unint64_t v10 = (*(void *)&v8 - 1) & v7;
    }
    uint64_t v11 = *(void **)(*(void *)v6 + 8 * v10);
    if (v11)
    {
      for (uint64_t i = (void *)*v11; i; uint64_t i = (void *)*i)
      {
        unint64_t v13 = i[1];
        if (v7 == v13)
        {
          if (i[2] == v7) {
            goto LABEL_90;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v13 >= *(void *)&v8) {
              v13 %= *(void *)&v8;
            }
          }
          else
          {
            v13 &= *(void *)&v8 - 1;
          }
          if (v13 != v10) {
            break;
          }
        }
      }
    }
  }
  unint64_t v14 = [a4 hash];
  unint64_t v15 = v14;
  long long v51 = 0u;
  long long v52 = 0u;
  LODWORD(v53) = 1065353216;
  unint64_t v16 = *((void *)v6 + 1);
  if (v16)
  {
    uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] > 1uLL)
    {
      unint64_t v4 = v14;
      if (v14 >= v16) {
        unint64_t v4 = v14 % v16;
      }
    }
    else
    {
      unint64_t v4 = (v16 - 1) & v14;
    }
    uint64_t v18 = *(void **)(*(void *)v6 + 8 * v4);
    if (v18)
    {
      for (uint64_t j = (void *)*v18; j; uint64_t j = (void *)*j)
      {
        unint64_t v20 = j[1];
        if (v20 == v14)
        {
          if (j[2] == v14) {
            goto LABEL_89;
          }
        }
        else
        {
          if (v17.u32[0] > 1uLL)
          {
            if (v20 >= v16) {
              v20 %= v16;
            }
          }
          else
          {
            v20 &= v16 - 1;
          }
          if (v20 != v4) {
            break;
          }
        }
      }
    }
  }
  unint64_t v21 = operator new(0x40uLL);
  v22 = v6 + 16;
  v55[0] = v21;
  v55[1] = v6 + 16;
  void *v21 = 0;
  v21[1] = v15;
  v21[2] = v15;
  std::__hash_table<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>>>::__hash_table((uint64_t)(v21 + 3), (uint64_t *)&v51);
  char v56 = 1;
  float v23 = (float)(unint64_t)(*((void *)v6 + 3) + 1);
  float v24 = *((float *)v6 + 8);
  if (v16 && (float)(v24 * (float)v16) >= v23) {
    goto LABEL_80;
  }
  BOOL v25 = (v16 & (v16 - 1)) == 0;
  if (v16 < 3) {
    BOOL v25 = 0;
  }
  unint64_t v26 = (2 * v16) | !v25;
  unint64_t v27 = vcvtps_u32_f32(v23 / v24);
  if (v26 <= v27) {
    int8x8_t prime = (int8x8_t)v27;
  }
  else {
    int8x8_t prime = (int8x8_t)v26;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
  }
  unint64_t v16 = *((void *)v6 + 1);
  if (*(void *)&prime > v16) {
    goto LABEL_46;
  }
  if (*(void *)&prime < v16)
  {
    unint64_t v35 = vcvtps_u32_f32((float)*((unint64_t *)v6 + 3) / *((float *)v6 + 8));
    if (v16 < 3 || (uint8x8_t v36 = (uint8x8_t)vcnt_s8((int8x8_t)v16), v36.i16[0] = vaddlv_u8(v36), v36.u32[0] > 1uLL))
    {
      unint64_t v35 = std::__next_prime(v35);
    }
    else
    {
      uint64_t v37 = 1 << -(char)__clz(v35 - 1);
      if (v35 >= 2) {
        unint64_t v35 = v37;
      }
    }
    if (*(void *)&prime <= v35) {
      int8x8_t prime = (int8x8_t)v35;
    }
    if (*(void *)&prime >= v16)
    {
      unint64_t v16 = *((void *)v6 + 1);
    }
    else
    {
      if (prime)
      {
LABEL_46:
        if (*(void *)&prime >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        unint64_t v29 = operator new(8 * *(void *)&prime);
        v30 = *(void **)v6;
        *(void *)char v6 = v29;
        if (v30) {
          operator delete(v30);
        }
        uint64_t v31 = 0;
        *((int8x8_t *)v6 + 1) = prime;
        do
          *(void *)(*(void *)v6 + 8 * v31++) = 0;
        while (*(void *)&prime != v31);
        v32 = (void *)*v22;
        if (*v22)
        {
          unint64_t v33 = v32[1];
          uint8x8_t v34 = (uint8x8_t)vcnt_s8(prime);
          v34.i16[0] = vaddlv_u8(v34);
          if (v34.u32[0] > 1uLL)
          {
            if (v33 >= *(void *)&prime) {
              v33 %= *(void *)&prime;
            }
          }
          else
          {
            v33 &= *(void *)&prime - 1;
          }
          *(void *)(*(void *)v6 + 8 * v33) = v22;
          long long v38 = (void *)*v32;
          if (*v32)
          {
            do
            {
              unint64_t v39 = v38[1];
              if (v34.u32[0] > 1uLL)
              {
                if (v39 >= *(void *)&prime) {
                  v39 %= *(void *)&prime;
                }
              }
              else
              {
                v39 &= *(void *)&prime - 1;
              }
              if (v39 != v33)
              {
                if (!*(void *)(*(void *)v6 + 8 * v39))
                {
                  *(void *)(*(void *)v6 + 8 * v39) = v32;
                  goto LABEL_71;
                }
                void *v32 = *v38;
                *long long v38 = **(void **)(*(void *)v6 + 8 * v39);
                **(void **)(*(void *)v6 + 8 * v39) = v38;
                long long v38 = v32;
              }
              unint64_t v39 = v33;
LABEL_71:
              v32 = v38;
              long long v38 = (void *)*v38;
              unint64_t v33 = v39;
            }
            while (v38);
          }
        }
        unint64_t v16 = (unint64_t)prime;
        goto LABEL_75;
      }
      v50 = *(void **)v6;
      *(void *)char v6 = 0;
      if (v50) {
        operator delete(v50);
      }
      unint64_t v16 = 0;
      *((void *)v6 + 1) = 0;
    }
  }
LABEL_75:
  if ((v16 & (v16 - 1)) != 0)
  {
    if (v15 >= v16) {
      unint64_t v4 = v15 % v16;
    }
    else {
      unint64_t v4 = v15;
    }
  }
  else
  {
    unint64_t v4 = (v16 - 1) & v15;
  }
LABEL_80:
  v40 = *(void **)(*(void *)v6 + 8 * v4);
  if (v40)
  {
    *(void *)v55[0] = *v40;
    void *v40 = v55[0];
  }
  else
  {
    *(void *)v55[0] = *((void *)v6 + 2);
    *((void *)v6 + 2) = v55[0];
    *(void *)(*(void *)v6 + 8 * v4) = v22;
    if (*(void *)v55[0])
    {
      unint64_t v41 = *(void *)(*(void *)v55[0] + 8);
      if ((v16 & (v16 - 1)) != 0)
      {
        if (v41 >= v16) {
          v41 %= v16;
        }
      }
      else
      {
        v41 &= v16 - 1;
      }
      *(void *)(*(void *)v6 + 8 * v41) = v55[0];
    }
  }
  v55[0] = 0;
  ++*((void *)v6 + 3);
LABEL_89:
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&v51);
LABEL_90:
  unint64_t v42 = objc_msgSend(a4, "hash", v51, v52, v53);
  int8x8_t v43 = *(int8x8_t *)(v6 + 8);
  if (!*(void *)&v43) {
    goto LABEL_106;
  }
  uint8x8_t v44 = (uint8x8_t)vcnt_s8(v43);
  v44.i16[0] = vaddlv_u8(v44);
  if (v44.u32[0] > 1uLL)
  {
    unint64_t v45 = v42;
    if (v42 >= *(void *)&v43) {
      unint64_t v45 = v42 % *(void *)&v43;
    }
  }
  else
  {
    unint64_t v45 = (*(void *)&v43 - 1) & v42;
  }
  v46 = *(void **)(*(void *)v6 + 8 * v45);
  if (!v46 || (v47 = (void *)*v46) == 0) {
LABEL_106:
  }
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  while (1)
  {
    unint64_t v48 = v47[1];
    if (v48 == v42) {
      break;
    }
    if (v44.u32[0] > 1uLL)
    {
      if (v48 >= *(void *)&v43) {
        v48 %= *(void *)&v43;
      }
    }
    else
    {
      v48 &= *(void *)&v43 - 1;
    }
    if (v48 != v45) {
      goto LABEL_106;
    }
LABEL_105:
    v47 = (void *)*v47;
    if (!v47) {
      goto LABEL_106;
    }
  }
  if (v47[2] != v42) {
    goto LABEL_105;
  }
  v49 = v47 + 3;
  *(void *)&long long v51 = [v54 hash];
  if (!std::__hash_table<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>>>::find<unsigned long long>(v49, (unint64_t *)&v51))
  {
    *(void *)&long long v51 = [v54 hash];
    std::__hash_table<std::__hash_value_type<unsigned long long,MTLGPUDebugResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLGPUDebugResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLGPUDebugResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLGPUDebugResidencySet *>>>::__emplace_unique_impl<unsigned long,MTLGPUDebugResidencySet *&>(v49, (uint64_t *)&v51, (uint64_t *)&v54);
  }
}

- (void)useResidencySet:(id)a3
{
  if ((*(void *)(*((void *)self + 19) + 20) & 0x200000001) != 0)
  {
    uint64_t v7 = [a3 hash];
    if (!std::__hash_table<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>>>::find<unsigned long long>((void *)self + 67, (unint64_t *)&v7))
    {
      id v6 = a3;
      uint64_t v7 = [a3 hash];
      std::__hash_table<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>>>::__emplace_unique_key_args<unsigned long,unsigned long,MTLGPUDebugResidencySet *>((uint64_t)self + 536, (unint64_t *)&v7, &v7, (uint64_t *)&v6);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLGPUDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v5 useResidencySet:a3];
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  if ((*(void *)(*((void *)self + 19) + 20) & 0x200000001) != 0 && a4 != 0)
  {
    int8x8_t v8 = a3;
    unint64_t v9 = a4;
    do
    {
      id v12 = (id)*v8;
      uint64_t v11 = [v12 hash];
      if (!std::__hash_table<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>>>::find<unsigned long long>((void *)self + 67, (unint64_t *)&v11))
      {
        uint64_t v11 = [v12 hash];
        std::__hash_table<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>>>::__emplace_unique_key_args<unsigned long,unsigned long,MTLGPUDebugResidencySet *&>((uint64_t)self + 536, (unint64_t *)&v11, &v11, (uint64_t *)&v12);
      }
      ++v8;
      --v9;
    }
    while (v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)MTLGPUDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v10 useResidencySets:a3 count:a4];
}

- (void)preCommit
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  if ((*(void *)(*((void *)self + 19) + 20) & 0x200000001) != 0)
  {
    long long v66 = 0u;
    long long v67 = 0u;
    LODWORD(v68) = 1065353216;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v3 = (void *)[(MTLCommandQueue *)[(MTLToolsCommandBuffer *)self commandQueue] residencySetsArray];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v44 objects:v74 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v45 != v5) {
            objc_enumerationMutation(v3);
          }
          *(void *)&long long v59 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          *(void *)&long long v52 = [(id)v59 hash];
          if (!std::__hash_table<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>>>::find<unsigned long long>(&v66, (unint64_t *)&v52))
          {
            *(void *)&long long v52 = [(id)v59 hash];
            std::__hash_table<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>>>::__emplace_unique_key_args<unsigned long,unsigned long,MTLGPUDebugResidencySet *&>((uint64_t)&v66, (unint64_t *)&v52, &v52, (uint64_t *)&v59);
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v44 objects:v74 count:16];
      }
      while (v4);
    }
    for (uint64_t j = (void *)*((void *)self + 69); j; uint64_t j = (void *)*j)
    {
      *(void *)&long long v59 = j[3];
      *(void *)&long long v52 = [(id)v59 hash];
      if (!std::__hash_table<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>>>::find<unsigned long long>(&v66, (unint64_t *)&v52))
      {
        *(void *)&long long v52 = [(id)v59 hash];
        std::__hash_table<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>>>::__emplace_unique_key_args<unsigned long,unsigned long,MTLGPUDebugResidencySet *&>((uint64_t)&v66, (unint64_t *)&v52, &v52, (uint64_t *)&v59);
      }
    }
    for (uint64_t k = (void *)*((void *)self + 74); k; uint64_t k = (void *)*k)
    {
      for (m = (void *)k[5]; m; m = (void *)*m)
      {
        *(void *)&long long v59 = m[3];
        *(void *)&long long v52 = [(id)v59 hash];
        if (!std::__hash_table<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,MTLLegacySVResidencySet *>>>::find<unsigned long long>(&v66, (unint64_t *)&v52))
        {
          *(void *)&long long v52 = [(id)v59 hash];
          std::__hash_table<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLGPUDebugResidencySet *>>>::__emplace_unique_key_args<unsigned long,unsigned long,MTLGPUDebugResidencySet *&>((uint64_t)&v66, (unint64_t *)&v52, &v52, (uint64_t *)&v59);
        }
      }
    }
    long long v59 = 0u;
    long long v60 = 0u;
    LODWORD(v61) = 1065353216;
    long long v52 = 0u;
    long long v53 = 0u;
    LODWORD(v54) = 1065353216;
    objc_super v10 = (void *)v67;
    if ((void)v67)
    {
      do
      {
        uint64_t v11 = (void *)v10[3];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v12 = (void *)[v11 allCommittedAllocations];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v73 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v41;
          do
          {
            for (uint64_t n = 0; n != v13; ++n)
            {
              if (*(void *)v41 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8 * n);
              if (objc_opt_respondsToSelector())
              {
                v48[0] = v16;
                std::__hash_table<_MTLResource *,std::hash<_MTLResource *>,std::equal_to<_MTLResource *>,std::allocator<_MTLResource *>>::__emplace_unique_key_args<_MTLResource *,_MTLResource *>((uint64_t)&v59, v48, v48);
              }
              else
              {
                v48[0] = v16;
                std::__hash_table<_MTLHeap *,std::hash<_MTLHeap *>,std::equal_to<_MTLHeap *>,std::allocator<_MTLHeap *>>::__emplace_unique_key_args<_MTLHeap *,_MTLHeap *>((uint64_t)&v52, v48, v48);
              }
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v73 count:16];
          }
          while (v13);
        }
        objc_super v10 = (void *)*v10;
      }
      while (v10);
      for (iuint64_t i = (void *)v60; ii; iuint64_t i = (void *)*ii)
      {
        uint64_t v18 = ii[2];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(MTLGPUDebugCommandBuffer *)self markBuffer:v18 usage:3 stages:31];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(MTLGPUDebugCommandBuffer *)self markTexture:v18 usage:3 stages:31];
          }
        }
      }
    }
    for (juint64_t j = (void *)v53; jj; juint64_t j = (void *)*jj)
      [(MTLGPUDebugCommandBuffer *)self markHeap:jj[2] usage:3 stages:31];
    std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&v52);
    std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&v59);
    std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&v66);
    if ((*(void *)(*((void *)self + 19) + 20) & 0x200000001) != 0)
    {
      uint64_t v20 = *((void *)self + 64);
      uint64_t v21 = *((void *)self + 65);
      if (v20 != v21)
      {
        long long v38 = (char *)self + 464;
        uint64_t v37 = (char *)self + 496;
        uint8x8_t v36 = v49;
        uint64_t v22 = MEMORY[0x263EF8330];
        do
        {
          uint64_t v23 = *(void *)(v20 + 8);
          if (v23)
          {
            float v24 = *(void **)v20;
            v72[0] = MEMORY[0x263EF8330];
            v72[1] = 3221225472;
            v72[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke;
            v72[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v72[4] = (char *)self + 408;
            v72[5] = v20;
            [v24 enumerateBufferIndices:v72];
            BOOL v25 = *(void **)v20;
            v71[0] = v22;
            v71[1] = 3221225472;
            v71[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_2;
            v71[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v71[4] = (char *)self + 408;
            v71[5] = v20;
            [v25 enumerateAccelerationStructureIndices:v71];
            unint64_t v26 = *(void **)v20;
            *(void *)&long long v66 = v22;
            *((void *)&v66 + 1) = 3221225472;
            *(void *)&long long v67 = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_3;
            *((void *)&v67 + 1) = &__block_descriptor_56_e12_v20__0_v8I16l;
            v68 = (char *)self + 440;
            uint64_t v69 = v20;
            v70 = (char *)self + 472;
            [v26 enumerateTextureIndicesAndTypes:&v66];
            uint64_t v23 = *(void *)(v20 + 8);
          }
          if ((v23 & 6) != 0)
          {
            unint64_t v27 = *(void **)v20;
            v65[0] = MEMORY[0x263EF8330];
            v65[1] = 3221225472;
            v65[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_4;
            v65[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v65[4] = (char *)self + 416;
            v65[5] = v20;
            [v27 enumerateBufferIndices:v65];
            unint64_t v28 = *(void **)v20;
            v64[0] = v22;
            v64[1] = 3221225472;
            v64[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_5;
            v64[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v64[4] = (char *)self + 416;
            v64[5] = v20;
            [v28 enumerateAccelerationStructureIndices:v64];
            unint64_t v29 = *(void **)v20;
            *(void *)&long long v59 = v22;
            *((void *)&v59 + 1) = 3221225472;
            *(void *)&long long v60 = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_6;
            *((void *)&v60 + 1) = &__block_descriptor_56_e12_v20__0_v8I16l;
            v61 = (char *)self + 448;
            uint64_t v62 = v20;
            v63 = (char *)self + 480;
            [v29 enumerateTextureIndicesAndTypes:&v59];
            uint64_t v23 = *(void *)(v20 + 8);
          }
          if ((v23 & 8) != 0)
          {
            v30 = *(void **)v20;
            v58[0] = MEMORY[0x263EF8330];
            v58[1] = 3221225472;
            v58[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_7;
            v58[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v58[4] = (char *)self + 424;
            v58[5] = v20;
            [v30 enumerateBufferIndices:v58];
            uint64_t v31 = *(void **)v20;
            v57[0] = v22;
            v57[1] = 3221225472;
            v57[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_8;
            v57[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v57[4] = (char *)self + 424;
            v57[5] = v20;
            [v31 enumerateAccelerationStructureIndices:v57];
            v32 = *(void **)v20;
            *(void *)&long long v52 = v22;
            *((void *)&v52 + 1) = 3221225472;
            *(void *)&long long v53 = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_9;
            *((void *)&v53 + 1) = &__block_descriptor_56_e12_v20__0_v8I16l;
            id v54 = (char *)self + 456;
            uint64_t v55 = v20;
            char v56 = (char *)self + 488;
            [v32 enumerateTextureIndicesAndTypes:&v52];
            uint64_t v23 = *(void *)(v20 + 8);
          }
          if ((v23 & 0x10) != 0)
          {
            unint64_t v33 = *(void **)v20;
            v51[0] = MEMORY[0x263EF8330];
            v51[1] = 3221225472;
            v51[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_10;
            v51[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v51[4] = (char *)self + 432;
            v51[5] = v20;
            [v33 enumerateBufferIndices:v51];
            uint8x8_t v34 = *(void **)v20;
            v50[0] = v22;
            v50[1] = 3221225472;
            v50[2] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_11;
            v50[3] = &__block_descriptor_48_e12_v20__0_I8I16l;
            v50[4] = (char *)self + 432;
            v50[5] = v20;
            [v34 enumerateAccelerationStructureIndices:v50];
            unint64_t v35 = *(void **)v20;
            v48[0] = v22;
            v48[1] = 3221225472;
            v49[0] = ___ZN12_GLOBAL__N_114HeapUsageTable5applyERNS_16BufferUsageTableES2_S2_S2_RNS_17TextureUsageTableES4_S4_S4_RNS_16TextureTypeTableES6_S6_S6__block_invoke_12;
            v49[1] = &__block_descriptor_56_e12_v20__0_v8I16l;
            v49[2] = (char *)self + 464;
            v49[3] = v20;
            v49[4] = (char *)self + 496;
            [v35 enumerateTextureIndicesAndTypes:v48];
          }
          v20 += 24;
        }
        while (v20 != v21);
      }
    }
  }
  v39.receiver = self;
  v39.super_class = (Class)MTLGPUDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v39 preCommit];
}

- (void)preCompletionHandlers
{
  if ((*(unsigned char *)(*((void *)self + 19) + 20) & 2) != 0) {
    [(MTLGPUDebugCommandBuffer *)self _checkReportBuffers];
  }
  uint64_t v3 = 0;
  uint64_t v4 = (char *)self + 408;
  do
  {

    *(void *)&v4[v3] = 0;
    v3 += 8;
  }
  while (v3 != 32);
  uint64_t v5 = 0;
  id v6 = (char *)self + 440;
  do
  {

    *(void *)&v6[v5] = 0;
    v5 += 8;
  }
  while (v5 != 32);
  uint64_t v7 = (MetalBuffer *)*((void *)self + 26);
  int8x8_t v8 = (MetalBuffer *)*((void *)self + 27);
  if (v7 != v8)
  {
    do
      MetalBuffer::free(v7++);
    while (v7 != v8);
    uint64_t v7 = (MetalBuffer *)*((void *)self + 26);
  }
  *((void *)self + 27) = v7;
  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v9 preCompletionHandlers];
}

- (void)dealloc
{
  uint64_t v3 = (void **)*((void *)self + 33);
  uint64_t v4 = (void **)*((void *)self + 34);
  while (v3 != v4)
  {
    uint64_t v5 = *v3++;
  }
  id v6 = (void **)*((void *)self + 39);
  uint64_t v7 = (void **)*((void *)self + 40);
  while (v6 != v7)
  {
    int8x8_t v8 = *v6++;
  }
  objc_super v9 = (MetalBuffer *)*((void *)self + 26);
  objc_super v10 = (MetalBuffer *)*((void *)self + 27);
  if (v9 != v10)
  {
    do
      MetalBuffer::free(v9++);
    while (v9 != v10);
    objc_super v9 = (MetalBuffer *)*((void *)self + 26);
  }
  *((void *)self + 27) = v9;
  *((void *)self + 37) = *((void *)self + 36);
  v11.receiver = self;
  v11.super_class = (Class)MTLGPUDebugCommandBuffer;
  [(MTLToolsCommandBuffer *)&v11 dealloc];
}

- (void).cxx_destruct
{
  uint64_t v3 = (void **)((char *)self + 576);
  uint64_t v4 = (void *)*((void *)self + 74);
  if (v4)
  {
    do
    {
      uint64_t v5 = (void *)*v4;
      std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)(v4 + 3));
      operator delete(v4);
      uint64_t v4 = v5;
    }
    while (v5);
  }
  id v6 = *v3;
  *uint64_t v3 = 0;
  if (v6) {
    operator delete(v6);
  }
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)self + 536);
  uint64_t v7 = (void *)*((void *)self + 64);
  if (v7)
  {
    *((void *)self + 65) = v7;
    operator delete(v7);
  }
  for (uint64_t i = 24; i != -8; i -= 8)
  for (uint64_t j = 24; j != -8; j -= 8)
  for (uint64_t k = 24; k != -8; k -= 8)
  std::mutex::~mutex((std::mutex *)((char *)self + 336));
  objc_super v11 = (void *)*((void *)self + 39);
  if (v11)
  {
    *((void *)self + 40) = v11;
    operator delete(v11);
  }
  id v12 = (void *)*((void *)self + 36);
  if (v12)
  {
    *((void *)self + 37) = v12;
    operator delete(v12);
  }
  uint64_t v13 = (void *)*((void *)self + 33);
  if (v13)
  {
    *((void *)self + 34) = v13;
    operator delete(v13);
  }
  uint64_t v14 = (void *)*((void *)self + 26);
  if (v14)
  {
    *((void *)self + 27) = v14;
    operator delete(v14);
  }
}

- (id).cxx_construct
{
  *((void *)self + 27) = 0;
  *((void *)self + 28) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 29) = 0;
  *((_DWORD *)self + 60) = 0;
  *((void *)self + 34) = 0;
  *((void *)self + 35) = 0;
  *((void *)self + 33) = 0;
  *((void *)self + 37) = 0;
  *((void *)self + 38) = 0;
  *((void *)self + 36) = 0;
  *((void *)self + 40) = 0;
  *((void *)self + 41) = 0;
  *((void *)self + 39) = 0;
  *((void *)self + 42) = 850045863;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *((void *)self + 49) = 0;
  *((void *)self + 65) = 0;
  *((void *)self + 66) = 0;
  *((void *)self + 64) = 0;
  *(_OWORD *)((char *)self + 536) = 0u;
  *(_OWORD *)((char *)self + 552) = 0u;
  *((_DWORD *)self + 142) = 1065353216;
  *((_OWORD *)self + 36) = 0u;
  *((_OWORD *)self + 37) = 0u;
  *((_DWORD *)self + 152) = 1065353216;
  return self;
}

@end