@interface CaptureMTLHeap
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLHeap)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLBuffer)backbuffer;
- (MTLDevice)device;
- (MTLHeap)baseObject;
- (NSString)description;
- (NSString)label;
- (id)formattedDescription:(unint64_t)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newAccelerationStructureWithDescriptor:(id)a3;
- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 offset:(unint64_t)a5;
- (id)newTextureWithDescriptor:(id)a3;
- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4;
- (id)originalObject;
- (int64_t)type;
- (unint64_t)allocatedSize;
- (unint64_t)cpuCacheMode;
- (unint64_t)currentAllocatedSize;
- (unint64_t)gpuAddress;
- (unint64_t)hazardTrackingMode;
- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3;
- (unint64_t)memoryPoolId;
- (unint64_t)protectionOptions;
- (unint64_t)resourceOptions;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)size;
- (unint64_t)storageMode;
- (unint64_t)streamReference;
- (unint64_t)unfilteredResourceOptions;
- (unint64_t)usedSize;
- (void)dealloc;
- (void)setLabel:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLHeap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureDevice, 0);
  objc_storeStrong((id *)&self->_backbuffer, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  id v5 = [(MTLHeapSPI *)self->_baseObject setPurgeableState:a3];
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -16115;
  char v7 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v10 = BYTE10(v18);
    ++BYTE10(v18);
    v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v17 + 1), v10 | 0x1800000000) + 16;
    char v7 = v10;
  }
  else
  {
    v8 = (char *)(v6 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v6 + 13) = v7;
  v11 = [(CaptureMTLHeap *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v8 = var0;
  *((void *)v8 + 1) = v5;
  *((void *)v8 + 2) = a3;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
  return (unint64_t)v5;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  id v6 = a3;
  char v7 = v6;
  if ((qword_2501C8 & 0x4000) != 0)
  {
    captureDevice = self->_captureDevice;
    goto LABEL_5;
  }
  if (qword_2501C0)
  {
    captureDevice = self;
LABEL_5:
    uint64_t v9 = (CaptureMTLTexture *)[captureDevice newTextureWithDescriptor:v7];
    goto LABEL_6;
  }
  if ((qword_2501C8 & 0x200) != 0)
  {
    id v11 = [v6 copy];

    [v11 setCompressionType:0];
    [v11 setCompressionMode:2];
    char v7 = v11;
  }
  v12 = v7;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  traceContext = self->_traceContext;
  long long v29 = (unint64_t)traceContext;
  *(void *)&long long v30 = 0;
  *((void *)&v30 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  v15 = v14;
  uint64_t v16 = *v14;
  *uint64_t v14 = v17;
  *(void *)&long long v31 = v16;
  BYTE8(v31) = *((unsigned char *)v14 + 8);
  *(_WORD *)((char *)&v31 + 9) = 16400;
  *(_DWORD *)((char *)&v31 + 11) = 0;
  HIBYTE(v31) = 0;
  id v18 = [(MTLHeapSPI *)self->_baseObject newTextureWithDescriptor:v7 offset:a4];
  char v7 = [(CaptureMTLDevice *)self->_captureDevice dummyEncodeTextureIntoArgumentBufferForResourceIndex:v18 withDescriptor:v7];

  if (v18) {
    uint64_t v9 = [[CaptureMTLTexture alloc] initWithBaseObject:v18 captureHeap:self];
  }
  else {
    uint64_t v9 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v29, (uint64_t)[(CaptureMTLTexture *)v9 traceStream]);
  uint64_t v19 = v30;
  *(_DWORD *)(v30 + 8) = -15777;
  char v20 = BYTE9(v31);
  if (BYTE9(v31) > 0x20uLL)
  {
    uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 24);
    uint64_t v23 = BYTE10(v31);
    ++BYTE10(v31);
    v21 = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v30 + 1), v23 | 0x2000000000) + 16;
    char v20 = v23;
  }
  else
  {
    v21 = (char *)(v19 + BYTE9(v31));
    BYTE9(v31) += 32;
  }
  *(unsigned char *)(v19 + 13) = v20;
  SaveMTLTextureInfo((uint64_t)&v29, v18);
  v24 = [(CaptureMTLHeap *)self traceStream];
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v26 = [(CaptureMTLTexture *)v9 traceStream];
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0;
  }
  char v28 = SaveMTLTextureDescriptor((uint64_t)&v29, v7);
  *(void *)v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = a4;
  v21[24] = v28;
  *(_DWORD *)(v21 + 25) = 0;
  *((_DWORD *)v21 + 7) = 0;
  uint64_t *v15 = v31;
  *((unsigned char *)v15 + 8) = BYTE8(v31);
  *(unsigned char *)(v30 + 15) |= 8u;

LABEL_6:
  return v9;
}

- (id)newTextureWithDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((qword_2501C8 & 0x4000) != 0)
  {
    uint64_t v14 = [(CaptureMTLDevice *)self->_captureDevice newTextureWithDescriptor:v4];
  }
  else
  {
    if ((qword_2501C8 & 0x200) != 0)
    {
      id v6 = [v4 copy];

      [v6 setCompressionType:0];
      [v6 setCompressionMode:2];
      id v5 = v6;
    }
    char v7 = v5;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
    traceContext = self->_traceContext;
    long long v26 = (unint64_t)traceContext;
    *(void *)&long long v27 = 0;
    *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
    s();
    uint64_t v10 = v9;
    uint64_t v11 = *v9;
    *uint64_t v9 = v12;
    *(void *)&long long v28 = v11;
    BYTE8(v28) = *((unsigned char *)v9 + 8);
    *(_WORD *)((char *)&v28 + 9) = 16400;
    *(_DWORD *)((char *)&v28 + 11) = 0;
    HIBYTE(v28) = 0;
    id v13 = [(MTLHeapSPI *)self->_baseObject newTextureWithDescriptor:v5];
    id v5 = [(CaptureMTLDevice *)self->_captureDevice dummyEncodeTextureIntoArgumentBufferForResourceIndex:v13 withDescriptor:v5];

    if (v13) {
      uint64_t v14 = [[CaptureMTLTexture alloc] initWithBaseObject:v13 captureHeap:self];
    }
    else {
      uint64_t v14 = 0;
    }
    GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLTexture *)v14 traceStream]);
    uint64_t v15 = v27;
    *(_DWORD *)(v27 + 8) = -16116;
    char v16 = BYTE9(v28);
    if (BYTE9(v28) > 0x28uLL)
    {
      uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 24);
      uint64_t v19 = BYTE10(v28);
      ++BYTE10(v28);
      uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v27 + 1), v19 | 0x1800000000) + 16;
      char v16 = v19;
    }
    else
    {
      uint64_t v17 = (char *)(v15 + BYTE9(v28));
      BYTE9(v28) += 24;
    }
    *(unsigned char *)(v15 + 13) = v16;
    SaveMTLTextureInfo((uint64_t)&v26, v13);
    char v20 = [(CaptureMTLHeap *)self traceStream];
    if (v20) {
      unint64_t var0 = v20->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    uint64_t v22 = [(CaptureMTLTexture *)v14 traceStream];
    if (v22) {
      unint64_t v23 = v22->var0;
    }
    else {
      unint64_t v23 = 0;
    }
    char v24 = SaveMTLTextureDescriptor((uint64_t)&v26, v5);
    *(void *)uint64_t v17 = var0;
    *((void *)v17 + 1) = v23;
    v17[16] = v24;
    *(_DWORD *)(v17 + 17) = 0;
    *((_DWORD *)v17 + 5) = 0;
    *uint64_t v10 = v28;
    *((unsigned char *)v10 + 8) = BYTE8(v28);
    *(unsigned char *)(v27 + 15) |= 8u;
  }
  return v14;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 offset:(unint64_t)a5
{
  char v7 = self;
  if ((qword_2501C8 & 0x4000) != 0)
  {
    self = (CaptureMTLHeap *)self->_captureDevice;
LABEL_5:
    return -[CaptureMTLHeap newBufferWithLength:options:](self, "newBufferWithLength:options:", a3, a4, a5);
  }
  if (qword_2501C0) {
    goto LABEL_5;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v12 = v11;
  uint64_t v13 = *v11;
  uint64_t *v11 = v14;
  *(void *)&long long v28 = v13;
  BYTE8(v28) = *((unsigned char *)v11 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  id v15 = -[MTLHeapSPI newBufferWithLength:options:offset:](v7->_baseObject, "newBufferWithLength:options:offset:", a3, a4);
  if (v15) {
    char v16 = [[CaptureMTLBuffer alloc] initWithBaseObject:v15 captureHeap:v7];
  }
  else {
    char v16 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLBuffer *)v16 traceStream]);
  uint64_t v17 = v27;
  *(_DWORD *)(v27 + 8) = -15778;
  char v18 = BYTE9(v28);
  if (BYTE9(v28) > 0x18uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v21 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v27 + 1), v21 | 0x2800000000) + 16;
    char v18 = v21;
  }
  else
  {
    uint64_t v19 = (char *)(v17 + BYTE9(v28));
    BYTE9(v28) += 40;
  }
  *(unsigned char *)(v17 + 13) = v18;
  SaveMTLBufferInfo((uint64_t)&v26, v15);
  uint64_t v22 = [(CaptureMTLHeap *)v7 traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v24 = [(CaptureMTLBuffer *)v16 traceStream];
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0;
  }
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a3;
  *((void *)v19 + 3) = a4;
  *((void *)v19 + 4) = a5;
  uint64_t *v12 = v28;
  *((unsigned char *)v12 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;

  return v16;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  if ((qword_2501C8 & 0x4000) != 0)
  {
    captureDevice = self->_captureDevice;
    return -[CaptureMTLDevice newBufferWithLength:options:](captureDevice, "newBufferWithLength:options:");
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    traceContext = self->_traceContext;
    long long v25 = (unint64_t)traceContext;
    *(void *)&long long v26 = 0;
    *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
    s();
    uint64_t v9 = v8;
    uint64_t v10 = *v8;
    uint64_t *v8 = v11;
    *(void *)&long long v27 = v10;
    BYTE8(v27) = *((unsigned char *)v8 + 8);
    *(_WORD *)((char *)&v27 + 9) = 16400;
    *(_DWORD *)((char *)&v27 + 11) = 0;
    HIBYTE(v27) = 0;
    id v12 = [(MTLHeapSPI *)self->_baseObject newBufferWithLength:a3 options:a4];
    if (v12) {
      uint64_t v13 = [[CaptureMTLBuffer alloc] initWithBaseObject:v12 captureHeap:self];
    }
    else {
      uint64_t v13 = 0;
    }
    GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLBuffer *)v13 traceStream]);
    uint64_t v16 = v26;
    *(_DWORD *)(v26 + 8) = -16117;
    char v17 = BYTE9(v27);
    if (BYTE9(v27) > 0x20uLL)
    {
      uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 24);
      uint64_t v20 = BYTE10(v27);
      ++BYTE10(v27);
      char v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v26 + 1), v20 | 0x2000000000) + 16;
      char v17 = v20;
    }
    else
    {
      char v18 = (char *)(v16 + BYTE9(v27));
      BYTE9(v27) += 32;
    }
    *(unsigned char *)(v16 + 13) = v17;
    SaveMTLBufferInfo((uint64_t)&v25, v12);
    uint64_t v21 = [(CaptureMTLHeap *)self traceStream];
    if (v21) {
      unint64_t var0 = v21->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    unint64_t v23 = [(CaptureMTLBuffer *)v13 traceStream];
    if (v23) {
      unint64_t v24 = v23->var0;
    }
    else {
      unint64_t v24 = 0;
    }
    *(void *)char v18 = var0;
    *((void *)v18 + 1) = v24;
    *((void *)v18 + 2) = a3;
    *((void *)v18 + 3) = a4;
    *uint64_t v9 = v27;
    *((unsigned char *)v9 + 8) = BYTE8(v27);
    *(unsigned char *)(v26 + 15) |= 8u;

    return v13;
  }
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  if ((qword_2501C8 & 0x4000) != 0)
  {
    captureDevice = self->_captureDevice;
    return -[CaptureMTLDevice newAccelerationStructureWithSize:resourceIndex:](captureDevice, "newAccelerationStructureWithSize:resourceIndex:");
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    traceContext = self->_traceContext;
    long long v25 = (unint64_t)traceContext;
    *(void *)&long long v26 = 0;
    *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
    s();
    uint64_t v9 = v8;
    uint64_t v10 = *v8;
    uint64_t *v8 = v11;
    *(void *)&long long v27 = v10;
    BYTE8(v27) = *((unsigned char *)v8 + 8);
    *(_WORD *)((char *)&v27 + 9) = 16400;
    *(_DWORD *)((char *)&v27 + 11) = 0;
    HIBYTE(v27) = 0;
    id v12 = [(MTLHeapSPI *)self->_baseObject newAccelerationStructureWithSize:a3 resourceIndex:a4];
    if (v12) {
      uint64_t v13 = [[CaptureMTLAccelerationStructure alloc] initWithBaseObject:v12 captureHeap:self];
    }
    else {
      uint64_t v13 = 0;
    }
    GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLAccelerationStructure *)v13 traceStream]);
    uint64_t v16 = v26;
    *(_DWORD *)(v26 + 8) = -15351;
    char v17 = BYTE9(v27);
    if (BYTE9(v27) > 0x20uLL)
    {
      uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 24);
      uint64_t v20 = BYTE10(v27);
      ++BYTE10(v27);
      char v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v26 + 1), v20 | 0x2000000000) + 16;
      char v17 = v20;
    }
    else
    {
      char v18 = (char *)(v16 + BYTE9(v27));
      BYTE9(v27) += 32;
    }
    *(unsigned char *)(v16 + 13) = v17;
    SaveMTLAccelerationStructureInfo((uint64_t)&v25, v12);
    uint64_t v21 = [(CaptureMTLHeap *)self traceStream];
    if (v21) {
      unint64_t var0 = v21->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    unint64_t v23 = [(CaptureMTLAccelerationStructure *)v13 traceStream];
    if (v23) {
      unint64_t v24 = v23->var0;
    }
    else {
      unint64_t v24 = 0;
    }
    *(void *)char v18 = var0;
    *((void *)v18 + 1) = v24;
    *((void *)v18 + 2) = a3;
    *((void *)v18 + 3) = a4;
    *uint64_t v9 = v27;
    *((unsigned char *)v9 + 8) = BYTE8(v27);
    *(unsigned char *)(v26 + 15) |= 8u;

    return v13;
  }
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  char v7 = self;
  if ((qword_2501C8 & 0x4000) != 0)
  {
    self = (CaptureMTLHeap *)self->_captureDevice;
LABEL_5:
    return [(CaptureMTLHeap *)self newAccelerationStructureWithSize:a3 resourceIndex:a5];
  }
  if (qword_2501C0) {
    goto LABEL_5;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v12 = v11;
  uint64_t v13 = *v11;
  uint64_t *v11 = v14;
  *(void *)&long long v28 = v13;
  BYTE8(v28) = *((unsigned char *)v11 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  id v15 = -[MTLHeapSPI newAccelerationStructureWithSize:offset:resourceIndex:](v7->_baseObject, "newAccelerationStructureWithSize:offset:resourceIndex:", a3);
  if (v15) {
    uint64_t v16 = [[CaptureMTLAccelerationStructure alloc] initWithBaseObject:v15 captureHeap:v7];
  }
  else {
    uint64_t v16 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLAccelerationStructure *)v16 traceStream]);
  uint64_t v17 = v27;
  *(_DWORD *)(v27 + 8) = -15352;
  char v18 = BYTE9(v28);
  if (BYTE9(v28) > 0x18uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v21 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v27 + 1), v21 | 0x2800000000) + 16;
    char v18 = v21;
  }
  else
  {
    uint64_t v19 = (char *)(v17 + BYTE9(v28));
    BYTE9(v28) += 40;
  }
  *(unsigned char *)(v17 + 13) = v18;
  SaveMTLAccelerationStructureInfo((uint64_t)&v26, v15);
  uint64_t v22 = [(CaptureMTLHeap *)v7 traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v24 = [(CaptureMTLAccelerationStructure *)v16 traceStream];
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0;
  }
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a3;
  *((void *)v19 + 3) = a4;
  *((void *)v19 + 4) = a5;
  uint64_t *v12 = v28;
  *((unsigned char *)v12 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;

  return v16;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  id v5 = self;
  if ((qword_2501C8 & 0x4000) != 0)
  {
    self = (CaptureMTLHeap *)self->_captureDevice;
LABEL_5:
    return -[CaptureMTLHeap newAccelerationStructureWithSize:](self, "newAccelerationStructureWithSize:", a3, a4);
  }
  if (qword_2501C0) {
    goto LABEL_5;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  traceContext = self->_traceContext;
  long long v24 = (unint64_t)traceContext;
  *(void *)&long long v25 = 0;
  *((void *)&v25 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v10 = v9;
  uint64_t v11 = *v9;
  *uint64_t v9 = v12;
  *(void *)&long long v26 = v11;
  BYTE8(v26) = *((unsigned char *)v9 + 8);
  *(_WORD *)((char *)&v26 + 9) = 16400;
  *(_DWORD *)((char *)&v26 + 11) = 0;
  HIBYTE(v26) = 0;
  id v13 = -[MTLHeapSPI newAccelerationStructureWithSize:offset:](v5->_baseObject, "newAccelerationStructureWithSize:offset:", a3);
  if (v13) {
    uint64_t v14 = [[CaptureMTLAccelerationStructure alloc] initWithBaseObject:v13 captureHeap:v5];
  }
  else {
    uint64_t v14 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)[(CaptureMTLAccelerationStructure *)v14 traceStream]);
  uint64_t v15 = v25;
  *(_DWORD *)(v25 + 8) = -15353;
  char v16 = BYTE9(v26);
  if (BYTE9(v26) > 0x20uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v19 = BYTE10(v26);
    ++BYTE10(v26);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v25 + 1), v19 | 0x2000000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v26));
    BYTE9(v26) += 32;
  }
  *(unsigned char *)(v15 + 13) = v16;
  SaveMTLAccelerationStructureInfo((uint64_t)&v24, v13);
  uint64_t v20 = [(CaptureMTLHeap *)v5 traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v22 = [(CaptureMTLAccelerationStructure *)v14 traceStream];
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0;
  }
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = a3;
  *((void *)v17 + 3) = a4;
  *uint64_t v10 = v26;
  *((unsigned char *)v10 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v14;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  if ((qword_2501C8 & 0x4000) != 0)
  {
    captureDevice = self->_captureDevice;
    return -[CaptureMTLDevice newAccelerationStructureWithSize:](captureDevice, "newAccelerationStructureWithSize:");
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
    traceContext = self->_traceContext;
    long long v23 = (unint64_t)traceContext;
    *(void *)&long long v24 = 0;
    *((void *)&v24 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
    s();
    char v7 = v6;
    uint64_t v8 = *v6;
    *id v6 = v9;
    *(void *)&long long v25 = v8;
    BYTE8(v25) = *((unsigned char *)v6 + 8);
    *(_WORD *)((char *)&v25 + 9) = 16400;
    *(_DWORD *)((char *)&v25 + 11) = 0;
    HIBYTE(v25) = 0;
    id v10 = [(MTLHeapSPI *)self->_baseObject newAccelerationStructureWithSize:a3];
    if (v10) {
      uint64_t v11 = [[CaptureMTLAccelerationStructure alloc] initWithBaseObject:v10 captureHeap:self];
    }
    else {
      uint64_t v11 = 0;
    }
    GTTraceEncoder_setStream((uint64_t *)&v23, (uint64_t)[(CaptureMTLAccelerationStructure *)v11 traceStream]);
    uint64_t v14 = v24;
    *(_DWORD *)(v24 + 8) = -15354;
    char v15 = BYTE9(v25);
    if (BYTE9(v25) > 0x28uLL)
    {
      uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 24);
      uint64_t v18 = BYTE10(v25);
      ++BYTE10(v25);
      char v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v24 + 1), v18 | 0x1800000000) + 16;
      char v15 = v18;
    }
    else
    {
      char v16 = (char *)(v14 + BYTE9(v25));
      BYTE9(v25) += 24;
    }
    *(unsigned char *)(v14 + 13) = v15;
    SaveMTLAccelerationStructureInfo((uint64_t)&v23, v10);
    uint64_t v19 = [(CaptureMTLHeap *)self traceStream];
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    uint64_t v21 = [(CaptureMTLAccelerationStructure *)v11 traceStream];
    if (v21) {
      unint64_t v22 = v21->var0;
    }
    else {
      unint64_t v22 = 0;
    }
    *(void *)char v16 = var0;
    *((void *)v16 + 1) = v22;
    *((void *)v16 + 2) = a3;
    *char v7 = v25;
    *((unsigned char *)v7 + 8) = BYTE8(v25);
    *(unsigned char *)(v24 + 15) |= 8u;

    return v11;
  }
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  id v6 = a3;
  if ((qword_2501C8 & 0x4000) != 0)
  {
    captureDevice = self->_captureDevice;
    goto LABEL_5;
  }
  if (qword_2501C0)
  {
    captureDevice = self;
LABEL_5:
    uint64_t v8 = (CaptureMTLAccelerationStructure *)[captureDevice newAccelerationStructureWithDescriptor:v6];
    goto LABEL_6;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  traceContext = self->_traceContext;
  long long v28 = (unint64_t)traceContext;
  *(void *)&long long v29 = 0;
  *((void *)&v29 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v12 = v11;
  uint64_t v13 = *v11;
  uint64_t *v11 = v14;
  *(void *)&long long v30 = v13;
  BYTE8(v30) = *((unsigned char *)v11 + 8);
  *(_WORD *)((char *)&v30 + 9) = 16400;
  *(_DWORD *)((char *)&v30 + 11) = 0;
  HIBYTE(v30) = 0;
  baseObject = self->_baseObject;
  char v16 = unwrapMTLAccelerationStructureDescriptor(v6);
  id v17 = [(MTLHeapSPI *)baseObject newAccelerationStructureWithDescriptor:v16 offset:a4];

  if (v17) {
    uint64_t v8 = [[CaptureMTLAccelerationStructure alloc] initWithBaseObject:v17 captureHeap:self];
  }
  else {
    uint64_t v8 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)[(CaptureMTLAccelerationStructure *)v8 traceStream]);
  uint64_t v18 = v29;
  *(_DWORD *)(v29 + 8) = -15355;
  char v19 = BYTE9(v30);
  if (BYTE9(v30) > 0x20uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v22 = BYTE10(v30);
    ++BYTE10(v30);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v29 + 1), v22 | 0x2000000000) + 16;
    char v19 = v22;
  }
  else
  {
    uint64_t v20 = (char *)(v18 + BYTE9(v30));
    BYTE9(v30) += 32;
  }
  *(unsigned char *)(v18 + 13) = v19;
  SaveMTLAccelerationStructureInfo((uint64_t)&v28, v17);
  long long v23 = [(CaptureMTLHeap *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v25 = [(CaptureMTLAccelerationStructure *)v8 traceStream];
  if (v25) {
    unint64_t v26 = v25->var0;
  }
  else {
    unint64_t v26 = 0;
  }
  char v27 = SaveMTLAccelerationStructureDescriptor((uint64_t)&v28, v6);
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = a4;
  v20[24] = v27;
  *(_DWORD *)(v20 + 25) = 0;
  *((_DWORD *)v20 + 7) = 0;
  uint64_t *v12 = v30;
  *((unsigned char *)v12 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;

LABEL_6:
  return v8;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  id v4 = a3;
  if ((qword_2501C8 & 0x4000) != 0)
  {
    uint64_t v13 = [(CaptureMTLDevice *)self->_captureDevice newAccelerationStructureWithDescriptor:v4];
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    traceContext = self->_traceContext;
    long long v25 = (unint64_t)traceContext;
    *(void *)&long long v26 = 0;
    *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
    s();
    char v7 = v6;
    uint64_t v8 = *v6;
    *id v6 = v9;
    *(void *)&long long v27 = v8;
    BYTE8(v27) = *((unsigned char *)v6 + 8);
    *(_WORD *)((char *)&v27 + 9) = 16400;
    *(_DWORD *)((char *)&v27 + 11) = 0;
    HIBYTE(v27) = 0;
    baseObject = self->_baseObject;
    uint64_t v11 = unwrapMTLAccelerationStructureDescriptor(v4);
    id v12 = [(MTLHeapSPI *)baseObject newAccelerationStructureWithDescriptor:v11];

    if (v12) {
      uint64_t v13 = [[CaptureMTLAccelerationStructure alloc] initWithBaseObject:v12 captureHeap:self];
    }
    else {
      uint64_t v13 = 0;
    }
    GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLAccelerationStructure *)v13 traceStream]);
    uint64_t v14 = v26;
    *(_DWORD *)(v26 + 8) = -15356;
    char v15 = BYTE9(v27);
    if (BYTE9(v27) > 0x28uLL)
    {
      uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
      uint64_t v18 = BYTE10(v27);
      ++BYTE10(v27);
      char v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x1800000000) + 16;
      char v15 = v18;
    }
    else
    {
      char v16 = (char *)(v14 + BYTE9(v27));
      BYTE9(v27) += 24;
    }
    *(unsigned char *)(v14 + 13) = v15;
    SaveMTLAccelerationStructureInfo((uint64_t)&v25, v12);
    char v19 = [(CaptureMTLHeap *)self traceStream];
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    uint64_t v21 = [(CaptureMTLAccelerationStructure *)v13 traceStream];
    if (v21) {
      unint64_t v22 = v21->var0;
    }
    else {
      unint64_t v22 = 0;
    }
    char v23 = SaveMTLAccelerationStructureDescriptor((uint64_t)&v25, v4);
    *(void *)char v16 = var0;
    *((void *)v16 + 1) = v22;
    v16[16] = v23;
    *(_DWORD *)(v16 + 17) = 0;
    *((_DWORD *)v16 + 5) = 0;
    *char v7 = v27;
    *((unsigned char *)v7 + 8) = BYTE8(v27);
    *(unsigned char *)(v26 + 15) |= 8u;
  }
  return v13;
}

- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  id v5 = [(MTLHeapSPI *)self->_baseObject maxAvailableSizeWithAlignment:a3];
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -16105;
  char v7 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v10 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v17 + 1), v10 | 0x1800000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v6 + 13) = v7;
  uint64_t v11 = [(CaptureMTLHeap *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = v5;
  *((void *)v8 + 2) = a3;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
  return (unint64_t)v5;
}

- (id)formattedDescription:(unint64_t)a3
{
  return [(MTLHeapSPI *)self->_baseObject formattedDescription:a3];
}

- (unint64_t)unfilteredResourceOptions
{
  return (unint64_t)[(MTLHeapSPI *)self->_baseObject unfilteredResourceOptions];
}

- (int64_t)type
{
  return (int64_t)[(MTLHeapSPI *)self->_baseObject type];
}

- (unint64_t)storageMode
{
  return (unint64_t)[(MTLHeapSPI *)self->_baseObject storageMode];
}

- (unint64_t)size
{
  return (unint64_t)[(MTLHeapSPI *)self->_baseObject size];
}

- (unint64_t)resourceOptions
{
  return (unint64_t)[(MTLHeapSPI *)self->_baseObject resourceOptions];
}

- (unint64_t)protectionOptions
{
  return (unint64_t)[(MTLHeapSPI *)self->_baseObject protectionOptions];
}

- (unint64_t)memoryPoolId
{
  return (unint64_t)[(MTLHeapSPI *)self->_baseObject memoryPoolId];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLHeapSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16119;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    char v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    char v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLHeap *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)&v19, v15, v16 + 1);
  }
  *(void *)char v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (NSString)label
{
  return (NSString *)[(MTLHeapSPI *)self->_baseObject label];
}

- (unint64_t)hazardTrackingMode
{
  return (unint64_t)[(MTLHeapSPI *)self->_baseObject hazardTrackingMode];
}

- (unint64_t)gpuAddress
{
  return (unint64_t)[(MTLHeapSPI *)self->_baseObject gpuAddress];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (unint64_t)cpuCacheMode
{
  return (unint64_t)[(MTLHeapSPI *)self->_baseObject cpuCacheMode];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLHeapSPI *)baseObject conformsToProtocol:v4];

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return CaptureRespondsToSelector((uint64_t)self->_baseObject, a3);
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)CaptureMTLHeap;
  v3 = [(CaptureMTLHeap *)&v7 description];
  id v4 = [(MTLHeapSPI *)self->_baseObject description];
  unsigned __int8 v5 = +[NSString stringWithFormat:@"%@ -> %@", v3, v4];

  return (NSString *)v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_baseObject;
}

- (unint64_t)streamReference
{
  traceStream = self->_traceStream;
  if (traceStream) {
    return traceStream->var0;
  }
  else {
    return 0;
  }
}

- (GTTraceStream)traceStream
{
  return self->_traceStream;
}

- (GTTraceContext)traceContext
{
  return self->_traceContext;
}

- (void)touch
{
  traceStream = self->_traceStream;
  uint64_t v3 = mach_absolute_time();
  if (traceStream)
  {
    unint64_t v4 = atomic_load(&traceStream[1].var1);
    unint64_t v5 = v4;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)&traceStream[1].var1, &v5, v4 & 0x1F | v3 & 0xFFFFFFFFFFFFFFE0);
      BOOL v6 = v5 == v4;
      unint64_t v4 = v5;
    }
    while (!v6);
  }
}

- (id)originalObject
{
  return DEVICEOBJECT(self->_baseObject);
}

- (void)dealloc
{
  [(CaptureMTLDevice *)self->_captureDevice deallocateResource:self];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16118;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    unint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    unint64_t v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLHeap *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)unint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLHeap;
  [(CaptureMTLHeap *)&v12 dealloc];
}

- (unint64_t)allocatedSize
{
  return (unint64_t)[(MTLHeapSPI *)self->_baseObject allocatedSize];
}

- (unint64_t)currentAllocatedSize
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  id v3 = [(MTLHeapSPI *)self->_baseObject currentAllocatedSize];
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -10207;
  char v5 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v8 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v6 = GTTraceMemPool_allocateBytes(v7, *((uint64_t *)&v15 + 1), v8 | 0x1000000000) + 16;
    char v5 = v8;
  }
  else
  {
    uint64_t v6 = (char *)(v4 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v4 + 13) = v5;
  uint64_t v9 = [(CaptureMTLHeap *)self traceStream];
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v6 = var0;
  *((void *)v6 + 1) = v3;
  s();
  *(void *)uint64_t v11 = v12;
  *(unsigned char *)(v11 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  return (unint64_t)v3;
}

- (unint64_t)usedSize
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  id v3 = [(MTLHeapSPI *)self->_baseObject usedSize];
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -10208;
  char v5 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v8 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v6 = GTTraceMemPool_allocateBytes(v7, *((uint64_t *)&v15 + 1), v8 | 0x1000000000) + 16;
    char v5 = v8;
  }
  else
  {
    uint64_t v6 = (char *)(v4 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v4 + 13) = v5;
  uint64_t v9 = [(CaptureMTLHeap *)self traceStream];
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v6 = var0;
  *((void *)v6 + 1) = v3;
  s();
  *(void *)uint64_t v11 = v12;
  *(unsigned char *)(v11 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  return (unint64_t)v3;
}

- (MTLBuffer)backbuffer
{
  return self->_backbuffer;
}

- (MTLHeap)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLHeap)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CaptureMTLHeap;
  uint64_t v9 = [(CaptureMTLHeap *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    uint64_t v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);

    if ((qword_2501C8 & 0x400000) != 0)
    {
      uint64_t v13 = MTLHeap_backbuffer(v10->_baseObject);
      backbuffer = v10->_backbuffer;
      v10->_backbuffer = (MTLBuffer *)v13;
    }
  }

  return v10;
}

@end