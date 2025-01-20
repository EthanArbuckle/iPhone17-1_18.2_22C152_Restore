@interface CaptureMTLFunction
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLFunction)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (CaptureMTLFunction)initWithBaseObject:(id)a3 captureLibrary:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLFunction)baseObject;
- (MTLFunctionHandle)functionHandle;
- (MTLLibrary)captureLibrary;
- (MTLType)returnType;
- (NSArray)arguments;
- (NSArray)importedLibraries;
- (NSArray)importedSymbols;
- (NSArray)relocations;
- (NSArray)stageInputAttributes;
- (NSArray)vertexAttributes;
- (NSDictionary)functionConstantsDictionary;
- (NSString)description;
- (NSString)filePath;
- (NSString)label;
- (NSString)name;
- (NSString)unpackedFilePath;
- (const)bitCodeHash;
- (id)bitcodeData;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5;
- (id)newFunctionWithPluginData:(id)a3 bitcodeType:(unsigned __int8)a4;
- (id)originalObject;
- (id)reflectionWithOptions:(unint64_t)a3;
- (id)reflectionWithOptions:(unint64_t)a3 binaryArchives:(id)a4;
- (id)reflectionWithOptions:(unint64_t)a3 pipelineLibrary:(id)a4;
- (int64_t)lineNumber;
- (int64_t)patchControlPointCount;
- (unint64_t)functionType;
- (unint64_t)options;
- (unint64_t)patchType;
- (unint64_t)renderTargetArrayIndexType;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)setLabel:(id)a3;
- (void)setRelocations:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLFunction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureLibrary, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (MTLLibrary)captureLibrary
{
  return (MTLLibrary *)objc_getProperty(self, a2, 24, 1);
}

- (id)reflectionWithOptions:(unint64_t)a3 pipelineLibrary:(id)a4
{
  baseObject = self->_baseObject;
  v6 = [a4 baseObject];
  v7 = [(MTLFunctionSPI *)baseObject reflectionWithOptions:a3 pipelineLibrary:v6];

  return v7;
}

- (id)reflectionWithOptions:(unint64_t)a3
{
  return [(MTLFunctionSPI *)self->_baseObject reflectionWithOptions:a3];
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4
{
  id v6 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  traceContext = self->_traceContext;
  long long v30 = (unint64_t)traceContext;
  *(void *)&long long v31 = 0;
  *((void *)&v31 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  *(void *)&long long v32 = v10;
  BYTE8(v32) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v32 + 9) = 16400;
  *(_DWORD *)((char *)&v32 + 11) = 0;
  HIBYTE(v32) = 0;
  baseObject = self->_baseObject;
  v13 = [v6 baseObject];
  id v14 = [(MTLFunctionSPI *)baseObject newArgumentEncoderWithBufferIndex:a3 pipelineLibrary:v13];

  if (v14)
  {
    v15 = [CaptureMTLArgumentEncoder alloc];
    v16 = [(CaptureMTLFunction *)self device];
    v17 = [(CaptureMTLArgumentEncoder *)v15 initWithBaseObject:v14 captureDevice:v16];
  }
  else
  {
    v17 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v30, (uint64_t)[(CaptureMTLArgumentEncoder *)v17 traceStream]);
  uint64_t v18 = v31;
  *(_DWORD *)(v31 + 8) = -15715;
  char v19 = BYTE9(v32);
  if (BYTE9(v32) > 0x20uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 24);
    uint64_t v22 = BYTE10(v32);
    ++BYTE10(v32);
    v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v31 + 1), v22 | 0x2000000000) + 16;
    char v19 = v22;
  }
  else
  {
    v20 = (char *)(v18 + BYTE9(v32));
    BYTE9(v32) += 32;
  }
  *(unsigned char *)(v18 + 13) = v19;
  v23 = [(CaptureMTLFunction *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v25 = [(CaptureMTLArgumentEncoder *)v17 traceStream];
  if (v25) {
    unint64_t v26 = v25->var0;
  }
  else {
    unint64_t v26 = 0;
  }
  v27 = (uint64_t *)[v6 traceStream];
  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0;
  }
  *(void *)v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = a3;
  *((void *)v20 + 3) = v28;
  uint64_t *v9 = v32;
  *((unsigned char *)v9 + 8) = BYTE8(v32);
  *(unsigned char *)(v31 + 15) |= 8u;

  return v17;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  traceContext = self->_traceContext;
  long long v24 = (unint64_t)traceContext;
  *(void *)&long long v25 = 0;
  *((void *)&v25 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  *(void *)&long long v26 = v8;
  BYTE8(v26) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v26 + 9) = 16400;
  *(_DWORD *)((char *)&v26 + 11) = 0;
  HIBYTE(v26) = 0;
  id v10 = -[MTLFunctionSPI newArgumentEncoderWithBufferIndex:](self->_baseObject, "newArgumentEncoderWithBufferIndex:");
  if (v10)
  {
    uint64_t v11 = [CaptureMTLArgumentEncoder alloc];
    v12 = [(CaptureMTLFunction *)self device];
    v13 = [(CaptureMTLArgumentEncoder *)v11 initWithBaseObject:v10 captureDevice:v12];
  }
  else
  {
    v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)[(CaptureMTLArgumentEncoder *)v13 traceStream]);
  uint64_t v14 = v25;
  *(_DWORD *)(v25 + 8) = -16052;
  char v15 = BYTE9(v26);
  if (BYTE9(v26) > 0x28uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v18 = BYTE10(v26);
    ++BYTE10(v26);
    v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v25 + 1), v18 | 0x1800000000) + 16;
    char v15 = v18;
  }
  else
  {
    v16 = (char *)(v14 + BYTE9(v26));
    BYTE9(v26) += 24;
  }
  *(unsigned char *)(v14 + 13) = v15;
  char v19 = [(CaptureMTLFunction *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v21 = [(CaptureMTLArgumentEncoder *)v13 traceStream];
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0;
  }
  *(void *)v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a3;
  uint64_t *v7 = v26;
  *((unsigned char *)v7 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v13;
}

- (id)bitcodeData
{
  return [(MTLFunctionSPI *)self->_baseObject bitcodeData];
}

- (const)bitCodeHash
{
  return (const $2772B1D07D29A72E8557B2574C0AE5C1 *)[(MTLFunctionSPI *)self->_baseObject bitCodeHash];
}

- (NSArray)vertexAttributes
{
  return (NSArray *)[(MTLFunctionSPI *)self->_baseObject vertexAttributes];
}

- (NSString)unpackedFilePath
{
  return (NSString *)[(MTLFunctionSPI *)self->_baseObject unpackedFilePath];
}

- (NSArray)stageInputAttributes
{
  return (NSArray *)[(MTLFunctionSPI *)self->_baseObject stageInputAttributes];
}

- (MTLType)returnType
{
  return (MTLType *)[(MTLFunctionSPI *)self->_baseObject returnType];
}

- (unint64_t)renderTargetArrayIndexType
{
  return (unint64_t)[(MTLFunctionSPI *)self->_baseObject renderTargetArrayIndexType];
}

- (void)setRelocations:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLFunction_setRelocations", (uint64_t)"Relocations", 0, 0);
  [(MTLFunctionSPI *)self->_baseObject setRelocations:v4];
}

- (NSArray)relocations
{
  return (NSArray *)[(MTLFunctionSPI *)self->_baseObject relocations];
}

- (unint64_t)patchType
{
  return (unint64_t)[(MTLFunctionSPI *)self->_baseObject patchType];
}

- (int64_t)patchControlPointCount
{
  return (int64_t)[(MTLFunctionSPI *)self->_baseObject patchControlPointCount];
}

- (unint64_t)options
{
  return (unint64_t)[(MTLFunctionSPI *)self->_baseObject options];
}

- (NSString)name
{
  return (NSString *)[(MTLFunctionSPI *)self->_baseObject name];
}

- (int64_t)lineNumber
{
  return (int64_t)[(MTLFunctionSPI *)self->_baseObject lineNumber];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLFunctionSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16123;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  id v10 = [(CaptureMTLFunction *)self traceStream];
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
  *(void *)v7 = var0;
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
  return (NSString *)[(MTLFunctionSPI *)self->_baseObject label];
}

- (NSArray)importedSymbols
{
  return (NSArray *)[(MTLFunctionSPI *)self->_baseObject importedSymbols];
}

- (NSArray)importedLibraries
{
  return (NSArray *)[(MTLFunctionSPI *)self->_baseObject importedLibraries];
}

- (unint64_t)functionType
{
  return (unint64_t)[(MTLFunctionSPI *)self->_baseObject functionType];
}

- (MTLFunctionHandle)functionHandle
{
  return (MTLFunctionHandle *)[(MTLFunctionSPI *)self->_baseObject functionHandle];
}

- (NSDictionary)functionConstantsDictionary
{
  return (NSDictionary *)[(MTLFunctionSPI *)self->_baseObject functionConstantsDictionary];
}

- (NSString)filePath
{
  return (NSString *)[(MTLFunctionSPI *)self->_baseObject filePath];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (NSArray)arguments
{
  return (NSArray *)[(MTLFunctionSPI *)self->_baseObject arguments];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLFunctionSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLFunction;
  v3 = [(CaptureMTLFunction *)&v7 description];
  id v4 = [(MTLFunctionSPI *)self->_baseObject description];
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

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5
{
  id v8 = a5;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLFunction_newArgumentEncoderWithBufferIndex_reflection_binaryArchives", (uint64_t)"Binary Linking", 0, 0);
  baseObject = self->_baseObject;
  id v10 = unwrapNSArray(v8);

  id v11 = [(MTLFunctionSPI *)baseObject newArgumentEncoderWithBufferIndex:a3 reflection:a4 binaryArchives:v10];
  if (v11)
  {
    id v12 = [CaptureMTLArgumentEncoder alloc];
    id v13 = [(CaptureMTLFunction *)self device];
    id v14 = [(CaptureMTLArgumentEncoder *)v12 initWithBaseObject:v11 captureDevice:v13];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)reflectionWithOptions:(unint64_t)a3 binaryArchives:(id)a4
{
  id v6 = a4;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLFunction_reflectionWithOptions_binaryArchives", (uint64_t)"Binary Linking", 0, 0);
  baseObject = self->_baseObject;
  id v8 = unwrapNSArray(v6);

  uint64_t v9 = [(MTLFunctionSPI *)baseObject reflectionWithOptions:a3 binaryArchives:v8];

  return v9;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5
{
  baseObject = self->_baseObject;
  id v9 = a5;
  id v10 = [v9 baseObject];
  id v11 = [(MTLFunctionSPI *)baseObject newArgumentEncoderWithBufferIndex:a3 reflection:a4 pipelineLibrary:v10];

  if (v11)
  {
    id v12 = [CaptureMTLArgumentEncoder alloc];
    id v13 = [(CaptureMTLFunction *)self device];
    id v14 = [(CaptureMTLArgumentEncoder *)v12 initWithBaseObject:v11 captureDevice:v13];
  }
  else
  {
    id v14 = 0;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  traceContext = self->_traceContext;
  long long v32 = (unint64_t)traceContext;
  *(void *)&long long v33 = 0;
  *((void *)&v33 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v17 = v16;
  uint64_t v18 = *v16;
  uint64_t *v16 = v19;
  *(void *)&long long v34 = v18;
  BYTE8(v34) = *((unsigned char *)v16 + 8);
  *(_WORD *)((char *)&v34 + 9) = 16400;
  *(_DWORD *)((char *)&v34 + 11) = 0;
  HIBYTE(v34) = 0;
  GTTraceEncoder_setStream((uint64_t *)&v32, (uint64_t)[(CaptureMTLArgumentEncoder *)v14 traceStream]);
  uint64_t v20 = v33;
  *(_DWORD *)(v33 + 8) = -15714;
  char v21 = BYTE9(v34);
  if (BYTE9(v34) > 0x18uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 24);
    uint64_t v24 = BYTE10(v34);
    ++BYTE10(v34);
    unint64_t v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v33 + 1), v24 | 0x2800000000) + 16;
    char v21 = v24;
  }
  else
  {
    unint64_t v22 = (char *)(v20 + BYTE9(v34));
    BYTE9(v34) += 40;
  }
  *(unsigned char *)(v20 + 13) = v21;
  long long v25 = [(CaptureMTLFunction *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v27 = [(CaptureMTLArgumentEncoder *)v14 traceStream];
  if (v27) {
    unint64_t v28 = v27->var0;
  }
  else {
    unint64_t v28 = 0;
  }
  v29 = (uint64_t *)[v9 traceStream];

  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0;
  }
  *(void *)unint64_t v22 = var0;
  *((void *)v22 + 1) = v28;
  *((void *)v22 + 2) = a3;
  *((void *)v22 + 3) = v30;
  *((void *)v22 + 4) = 0;
  uint64_t *v17 = v34;
  *((unsigned char *)v17 + 8) = BYTE8(v34);
  *(unsigned char *)(v33 + 15) |= 8u;

  return v14;
}

- (id)newFunctionWithPluginData:(id)a3 bitcodeType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(MTLFunctionSPI *)self->_baseObject newFunctionWithPluginData:v6 bitcodeType:v4];
  if (v7)
  {
    id v8 = [[CaptureMTLFunction alloc] initWithBaseObject:v7 captureDevice:self->_captureDevice];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
    traceContext = self->_traceContext;
    [(CaptureMTLFunction *)v8 traceStream];
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v23);
    uint64_t v10 = v24;
    *(_DWORD *)(v24 + 8) = -15830;
    char v11 = BYTE9(v25);
    if (BYTE9(v25) > 0x28uLL)
    {
      uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 24);
      uint64_t v14 = BYTE10(v25);
      ++BYTE10(v25);
      id v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v24 + 1), v14 | 0x1800000000) + 16;
      char v11 = v14;
    }
    else
    {
      id v12 = (char *)(v10 + BYTE9(v25));
      BYTE9(v25) += 24;
    }
    *(unsigned char *)(v10 + 13) = v11;
    SaveMTLFunctionInfo((uint64_t)&v23, v7, 0);
    id v15 = [(CaptureMTLFunction *)self traceStream];
    if (v15) {
      unint64_t var0 = v15->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    uint64_t v17 = [(CaptureMTLFunction *)v8 traceStream];
    if (v17) {
      unint64_t v18 = v17->var0;
    }
    else {
      unint64_t v18 = 0;
    }
    char v19 = SaveNSData((uint64_t)&v23, v6);
    *(void *)id v12 = var0;
    *((void *)v12 + 1) = v18;
    v12[16] = v19;
    v12[17] = v4;
    *((_WORD *)v12 + 9) = 0;
    *((_DWORD *)v12 + 5) = 0;
    s();
    *(void *)uint64_t v20 = v21;
    *(unsigned char *)(v20 + 8) = BYTE8(v25);
    *(unsigned char *)(v24 + 15) |= 8u;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  long long v23 = (unint64_t)traceContext;
  *(void *)&long long v24 = 0;
  *((void *)&v24 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v8 = v7;
  uint64_t v9 = *v7;
  uint64_t *v7 = v10;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = *((unsigned char *)v7 + 8);
  *(_WORD *)((char *)&v25 + 9) = 16400;
  *(_DWORD *)((char *)&v25 + 11) = 0;
  HIBYTE(v25) = 0;
  id v11 = -[MTLFunctionSPI newArgumentEncoderWithBufferIndex:reflection:](self->_baseObject, "newArgumentEncoderWithBufferIndex:reflection:");
  if (v11) {
    id v12 = [[CaptureMTLArgumentEncoder alloc] initWithBaseObject:v11 captureDevice:self->_captureDevice];
  }
  else {
    id v12 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v23, (uint64_t)[(CaptureMTLArgumentEncoder *)v12 traceStream]);
  uint64_t v13 = v24;
  *(_DWORD *)(v24 + 8) = -16052;
  char v14 = BYTE9(v25);
  if (BYTE9(v25) > 0x28uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v17 = BYTE10(v25);
    ++BYTE10(v25);
    id v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v24 + 1), v17 | 0x1800000000) + 16;
    char v14 = v17;
  }
  else
  {
    id v15 = (char *)(v13 + BYTE9(v25));
    BYTE9(v25) += 24;
  }
  *(unsigned char *)(v13 + 13) = v14;
  unint64_t v18 = [(CaptureMTLFunction *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v20 = [(CaptureMTLArgumentEncoder *)v12 traceStream];
  if (v20) {
    unint64_t v21 = v20->var0;
  }
  else {
    unint64_t v21 = 0;
  }
  *(void *)id v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = a3;
  uint64_t *v8 = v25;
  *((unsigned char *)v8 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;

  return v12;
}

- (MTLFunction)baseObject
{
  return self->_baseObject;
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16293;
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
  id v8 = [(CaptureMTLFunction *)self traceStream];
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
  v12.super_class = (Class)CaptureMTLFunction;
  [(CaptureMTLFunction *)&v12 dealloc];
}

- (CaptureMTLFunction)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLFunction;
  uint64_t v9 = [(CaptureMTLFunction *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    objc_super v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);
  }
  return v10;
}

- (CaptureMTLFunction)initWithBaseObject:(id)a3 captureLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CaptureMTLFunction;
  uint64_t v9 = [(CaptureMTLFunction *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureLibrary, a4);
    uint64_t v11 = [v8 device];
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (CaptureMTLDevice *)v11;

    long long v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    objc_super v14 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v13, (unint64_t)v14, (unint64_t)v10);
  }
  return v10;
}

@end