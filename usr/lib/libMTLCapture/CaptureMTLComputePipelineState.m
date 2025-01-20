@interface CaptureMTLComputePipelineState
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)newFunctionHandle:(id *)a3 associatedWithBaseFunctionHandle:(id)a4 captureFunction:(id)a5;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)supportIndirectCommandBuffers;
- (CaptureMTLComputePipelineState)initWithBaseObject:(id)a3 captureComputePipelineState:(id)a4 additionalBinaryFunctions:(id)a5;
- (CaptureMTLComputePipelineState)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (CaptureMTLComputePipelineState)initWithBaseObject:(id)a3 capturePipelineLibrary:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLComputePipelineDescriptor)descriptor;
- (MTLComputePipelineReflection)reflection;
- (MTLComputePipelineState)baseObject;
- (MTLDevice)device;
- (MTLFunction)function;
- (MTLResourceID)gpuResourceID;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)functionHandleMap;
- (id)functionHandleWithFunction:(id)a3;
- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3;
- (id)originalObject;
- (int64_t)shaderValidation;
- (int64_t)shaderValidationState;
- (int64_t)textureWriteRoundingMode;
- (unint64_t)allocatedSize;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3;
- (unint64_t)maxTotalThreadsPerThreadgroup;
- (unint64_t)resourceIndex;
- (unint64_t)staticThreadgroupMemoryLength;
- (unint64_t)streamReference;
- (unint64_t)threadExecutionWidth;
- (unint64_t)uniqueIdentifier;
- (unsigned)getComputeKernelTelemetryID;
- (void)commonInit:(id)a3 captureDevice:(id)a4;
- (void)dealloc;
- (void)setDescriptor:(id)a3;
- (void)setFunction:(id)a3;
- (void)setReflection:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLComputePipelineState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reflection, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_function, 0);
  objc_storeStrong((id *)&self->_retainedPipelineLibrary, 0);
  objc_storeStrong((id *)&self->_functionHandleMap, 0);
  objc_storeStrong((id *)&self->_functions, 0);
  objc_storeStrong((id *)&self->_captureComputePipelineState, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)setReflection:(id)a3
{
}

- (MTLComputePipelineReflection)reflection
{
  return self->_reflection;
}

- (void)setDescriptor:(id)a3
{
}

- (MTLComputePipelineDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setFunction:(id)a3
{
}

- (MTLFunction)function
{
  return self->_function;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  *(void *)&long long v28 = v8;
  BYTE8(v28) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  baseObject = self->_baseObject;
  id v11 = [v5 copy];
  id v12 = [(MTLComputePipelineStateSPI *)baseObject newVisibleFunctionTableWithDescriptor:v11];

  v13 = [(CaptureMTLDevice *)self->_captureDevice dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:v12 withDescriptor:v5];

  if (v12) {
    v14 = [[CaptureMTLVisibleFunctionTable alloc] initWithBaseObject:v12 captureComputePipelineState:self descriptor:v13];
  }
  else {
    v14 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLVisibleFunctionTable *)v14 traceStream]);
  uint64_t v15 = v27;
  *(_DWORD *)(v27 + 8) = -15578;
  char v16 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v19 = BYTE10(v28);
    ++BYTE10(v28);
    v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v27 + 1), v19 | 0x1800000000) + 16;
    char v16 = v19;
  }
  else
  {
    v17 = (char *)(v15 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v15 + 13) = v16;
  SaveMTLVisibleFunctionTableInfo((uint64_t)&v26, v12);
  v20 = [(CaptureMTLComputePipelineState *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v22 = [(CaptureMTLVisibleFunctionTable *)v14 traceStream];
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0;
  }
  char v24 = SaveMTLVisibleFunctionTableDescriptor((uint64_t)&v26, v13);
  *(void *)v17 = var0;
  *((void *)v17 + 1) = v23;
  v17[16] = v24;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  uint64_t *v7 = v28;
  *((unsigned char *)v7 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;

  return v14;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  *(void *)&long long v28 = v8;
  BYTE8(v28) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  baseObject = self->_baseObject;
  id v11 = [v5 copy];
  id v12 = [(MTLComputePipelineStateSPI *)baseObject newIntersectionFunctionTableWithDescriptor:v11];

  v13 = [(CaptureMTLDevice *)self->_captureDevice dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:v12 withDescriptor:v5];

  if (v12) {
    v14 = [[CaptureMTLIntersectionFunctionTable alloc] initWithBaseObject:v12 captureComputePipelineState:self descriptor:v13];
  }
  else {
    v14 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLIntersectionFunctionTable *)v14 traceStream]);
  uint64_t v15 = v27;
  *(_DWORD *)(v27 + 8) = -15540;
  char v16 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v19 = BYTE10(v28);
    ++BYTE10(v28);
    v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v27 + 1), v19 | 0x1800000000) + 16;
    char v16 = v19;
  }
  else
  {
    v17 = (char *)(v15 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v15 + 13) = v16;
  SaveMTLIntersectionFunctionTableInfo((uint64_t)&v26, v12);
  v20 = [(CaptureMTLComputePipelineState *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v22 = [(CaptureMTLIntersectionFunctionTable *)v14 traceStream];
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0;
  }
  char v24 = SaveMTLIntersectionFunctionTableDescriptor((uint64_t)&v26, v13);
  *(void *)v17 = var0;
  *((void *)v17 + 1) = v23;
  v17[16] = v24;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  uint64_t *v7 = v28;
  *((unsigned char *)v7 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;

  return v14;
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = *a3;
  return (unint64_t)[(MTLComputePipelineStateSPI *)baseObject imageblockMemoryLengthForDimensions:&v5];
}

- (unsigned)getComputeKernelTelemetryID
{
  return [(MTLComputePipelineStateSPI *)self->_baseObject getComputeKernelTelemetryID];
}

- (id)functionHandleWithFunction:(id)a3
{
  id v4 = a3;
  baseObject = self->_baseObject;
  v6 = [v4 baseObject];
  v7 = [(MTLComputePipelineStateSPI *)baseObject functionHandleWithFunction:v6];

  id v30 = 0;
  if (!v7)
  {
    id v9 = 0;
    goto LABEL_5;
  }
  unsigned __int8 v8 = [(CaptureMTLComputePipelineState *)self newFunctionHandle:&v30 associatedWithBaseFunctionHandle:v7 captureFunction:v4];
  id v9 = v30;
  if (v8)
  {
LABEL_5:
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    traceContext = self->_traceContext;
    [v9 traceStream];
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v27);
    uint64_t v12 = v28;
    *(_DWORD *)(v28 + 8) = -15620;
    char v13 = BYTE9(v29);
    if (BYTE9(v29) > 0x28uLL)
    {
      uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 24);
      uint64_t v16 = BYTE10(v29);
      ++BYTE10(v29);
      v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v28 + 1), v16 | 0x1800000000) + 16;
      char v13 = v16;
    }
    else
    {
      v14 = (char *)(v12 + BYTE9(v29));
      BYTE9(v29) += 24;
    }
    *(unsigned char *)(v12 + 13) = v13;
    v17 = [(CaptureMTLComputePipelineState *)self traceStream];
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    uint64_t v19 = (uint64_t *)[v30 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0;
    }
    v21 = (uint64_t *)[v4 traceStream];
    if (v21) {
      uint64_t v22 = *v21;
    }
    else {
      uint64_t v22 = 0;
    }
    *(void *)v14 = var0;
    *((void *)v14 + 1) = v20;
    *((void *)v14 + 2) = v22;
    s();
    *(void *)uint64_t v23 = v24;
    *(unsigned char *)(v23 + 8) = BYTE8(v29);
    *(unsigned char *)(v28 + 15) |= 8u;
    id v10 = v30;
    goto LABEL_18;
  }
  id v10 = v30;
LABEL_18:
  v25 = v10;

  return v25;
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16321;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  unsigned __int8 v8 = [(CaptureMTLComputePipelineState *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)$F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLComputePipelineState;
  [(CaptureMTLComputePipelineState *)&v12 dealloc];
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)[(MTLComputePipelineStateSPI *)self->_baseObject uniqueIdentifier];
}

- (unint64_t)threadExecutionWidth
{
  return (unint64_t)[(MTLComputePipelineStateSPI *)self->_baseObject threadExecutionWidth];
}

- (int64_t)textureWriteRoundingMode
{
  return (int64_t)[(MTLComputePipelineStateSPI *)self->_baseObject textureWriteRoundingMode];
}

- (BOOL)supportIndirectCommandBuffers
{
  return [(MTLComputePipelineStateSPI *)self->_baseObject supportIndirectCommandBuffers];
}

- (unint64_t)staticThreadgroupMemoryLength
{
  return (unint64_t)[(MTLComputePipelineStateSPI *)self->_baseObject staticThreadgroupMemoryLength];
}

- (int64_t)shaderValidationState
{
  return (int64_t)[(MTLComputePipelineStateSPI *)self->_baseObject shaderValidationState];
}

- (int64_t)shaderValidation
{
  return (int64_t)[(MTLComputePipelineStateSPI *)self->_baseObject shaderValidation];
}

- (unint64_t)resourceIndex
{
  return (unint64_t)[(MTLComputePipelineStateSPI *)self->_baseObject resourceIndex];
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return (unint64_t)[(MTLComputePipelineStateSPI *)self->_baseObject maxTotalThreadsPerThreadgroup];
}

- (NSString)label
{
  return (NSString *)[(MTLComputePipelineStateSPI *)self->_baseObject label];
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)[(MTLComputePipelineStateSPI *)self->_baseObject gpuResourceID];
}

- (unint64_t)gpuHandle
{
  return (unint64_t)[(MTLComputePipelineStateSPI *)self->_baseObject gpuHandle];
}

- (unint64_t)gpuAddress
{
  return (unint64_t)[(MTLComputePipelineStateSPI *)self->_baseObject gpuAddress];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (unint64_t)allocatedSize
{
  return (unint64_t)[(MTLComputePipelineStateSPI *)self->_baseObject allocatedSize];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLComputePipelineStateSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLComputePipelineState;
  uint64_t v3 = [(CaptureMTLComputePipelineState *)&v7 description];
  char v4 = [(MTLComputePipelineStateSPI *)self->_baseObject description];
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

- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  traceContext = self->_traceContext;
  long long v32 = (unint64_t)traceContext;
  *(void *)&long long v33 = 0;
  *((void *)&v33 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *unsigned __int8 v8 = v11;
  *(void *)&long long v34 = v10;
  BYTE8(v34) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v34 + 9) = 16400;
  *(_DWORD *)((char *)&v34 + 11) = 0;
  HIBYTE(v34) = 0;
  baseObject = self->_baseObject;
  long long v13 = unwrapNSArray(v6);
  id v14 = [(MTLComputePipelineStateSPI *)baseObject newComputePipelineStateWithAdditionalBinaryFunctions:v13 error:a4];

  if (v14)
  {
    long long v15 = [CaptureMTLComputePipelineState alloc];
    id v16 = [v6 copy];
    v17 = [(CaptureMTLComputePipelineState *)v15 initWithBaseObject:v14 captureComputePipelineState:self additionalBinaryFunctions:v16];
  }
  else
  {
    v17 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v32, (uint64_t)[(CaptureMTLComputePipelineState *)v17 traceStream]);
  [(CaptureMTLComputePipelineState *)v17 setFunction:self->_function];
  [(CaptureMTLComputePipelineState *)v17 setDescriptor:self->_descriptor];
  [(CaptureMTLComputePipelineState *)v17 setReflection:self->_reflection];
  uint64_t v18 = v33;
  *(_DWORD *)(v33 + 8) = -15541;
  char v19 = BYTE9(v34);
  if (BYTE9(v34) > 0x20uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 24);
    uint64_t v22 = BYTE10(v34);
    ++BYTE10(v34);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v33 + 1), v22 | 0x2000000000) + 16;
    char v19 = v22;
  }
  else
  {
    uint64_t v20 = (char *)(v18 + BYTE9(v34));
    BYTE9(v34) += 32;
  }
  *(unsigned char *)(v18 + 13) = v19;
  reflection = self->_reflection;
  uint64_t v24 = unwrapMTLComputePipelineDescriptor(self->_descriptor);
  v25 = [(MTLFunction *)self->_function baseObject];
  SaveMTLComputePipelineReflection((uint64_t)&v32, v14, reflection, v24, v25);

  long long v26 = [(CaptureMTLComputePipelineState *)self traceStream];
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v28 = [(CaptureMTLComputePipelineState *)v17 traceStream];
  if (!v28)
  {
    unint64_t v29 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v29 = v28->var0;
  if (a4) {
LABEL_12:
  }
    a4 = (id *)*a4;
LABEL_13:
  char v30 = StreamMTLNameArray((uint64_t)&v32, v6);
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v29;
  *((void *)v20 + 2) = a4;
  v20[24] = v30;
  *(_DWORD *)(v20 + 25) = 0;
  *((_DWORD *)v20 + 7) = 0;
  *id v9 = v34;
  *((unsigned char *)v9 + 8) = BYTE8(v34);
  *(unsigned char *)(v33 + 15) |= 8u;

  return v17;
}

- (MTLComputePipelineState)baseObject
{
  return self->_baseObject;
}

- (BOOL)newFunctionHandle:(id *)a3 associatedWithBaseFunctionHandle:(id)a4 captureFunction:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(CaptureMTLComputePipelineState *)self functionHandleMap];
  uint64_t v11 = [v10 objectForKey:v8];
  id v12 = *a3;
  *a3 = v11;

  id v13 = *a3;
  if (!*a3)
  {
    id v14 = [[CaptureMTLFunctionHandle alloc] initWithBaseObject:v8 captureComputePipelineState:self captureFunction:v9];
    id v15 = *a3;
    *a3 = v14;

    id v16 = [(CaptureMTLComputePipelineState *)self functionHandleMap];
    [v16 setObject:*a3 forKey:v8];
  }
  return v13 == 0;
}

- (id)functionHandleMap
{
  functionHandleMap = self->_functionHandleMap;
  if (!functionHandleMap)
  {
    unint64_t v4 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:2 valueOptions:0 capacity:8];
    unint64_t v5 = self->_functionHandleMap;
    self->_functionHandleMap = v4;

    functionHandleMap = self->_functionHandleMap;
  }

  return functionHandleMap;
}

- (CaptureMTLComputePipelineState)initWithBaseObject:(id)a3 capturePipelineLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CaptureMTLComputePipelineState;
  id v8 = [(CaptureMTLComputePipelineState *)&v11 init];
  if (v8)
  {
    id v9 = [v7 device];
    [(CaptureMTLComputePipelineState *)v8 commonInit:v6 captureDevice:v9];

    objc_storeStrong((id *)&v8->_retainedPipelineLibrary, a4);
  }

  return v8;
}

- (CaptureMTLComputePipelineState)initWithBaseObject:(id)a3 captureComputePipelineState:(id)a4 additionalBinaryFunctions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLComputePipelineState;
  objc_super v11 = [(CaptureMTLComputePipelineState *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    [(CaptureMTLComputePipelineState *)v11 commonInit:v8 captureDevice:v9[2]];
    objc_storeStrong((id *)&v12->_captureComputePipelineState, a4);
    objc_storeStrong((id *)&v12->_functions, a5);
  }

  return v12;
}

- (CaptureMTLComputePipelineState)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CaptureMTLComputePipelineState;
  id v8 = [(CaptureMTLComputePipelineState *)&v11 init];
  id v9 = v8;
  if (v8) {
    [(CaptureMTLComputePipelineState *)v8 commonInit:v6 captureDevice:v7];
  }

  return v9;
}

- (void)commonInit:(id)a3 captureDevice:(id)a4
{
  id v6 = (MTLComputePipelineStateSPI *)a3;
  id v7 = (CaptureMTLDevice *)a4;
  baseObject = self->_baseObject;
  self->_baseObject = v6;
  v17 = v6;

  captureDevice = self->_captureDevice;
  self->_captureDevice = v7;
  id v10 = v7;

  captureComputePipelineState = self->_captureComputePipelineState;
  self->_captureComputePipelineState = 0;

  functions = self->_functions;
  self->_functions = 0;

  id v13 = [(CaptureMTLDevice *)v10 traceContext];
  self->_traceContext = v13;
  objc_super v14 = DEVICEOBJECT(v17);
  self->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v13, (unint64_t)v14, (unint64_t)self);

  functionHandleMap = self->_functionHandleMap;
  self->_functionHandleMap = 0;

  retainedPipelineLibrary = self->_retainedPipelineLibrary;
  self->_retainedPipelineLibrary = 0;
}

@end