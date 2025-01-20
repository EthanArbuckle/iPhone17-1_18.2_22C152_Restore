@interface CaptureMTLBinaryArchive
- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addFunctionWithDescriptor:(id)a3 library:(id)a4 error:(id *)a5;
- (BOOL)addLibraryWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)enumerateArchivesFromBackingFile:(id)a3;
- (BOOL)enumerateArchivesFromPipelineCollection:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)storeComputePipelineDescriptor:(id)a3;
- (BOOL)storeMeshRenderPipelineDescriptor:(id)a3;
- (BOOL)storeRenderPipelineDescriptor:(id)a3;
- (BOOL)storeTileRenderPipelineDescriptor:(id)a3;
- (CaptureMTLBinaryArchive)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLBinaryArchive)baseObject;
- (MTLDevice)device;
- (MTLPipelineCollection)pipelineCollection;
- (NSArray)keys;
- (NSString)description;
- (NSString)label;
- (id)formattedDescription:(unint64_t)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)options;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)setLabel:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLBinaryArchive

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (BOOL)storeTileRenderPipelineDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLBinaryArchive_storeTileRenderPipelineDescriptor", (uint64_t)"Binary Linking", 0, 0);
  baseObject = self->_baseObject;
  v6 = unwrapMTLTileRenderPipelineDescriptor(v4);

  LOBYTE(baseObject) = [(MTLBinaryArchiveSPI *)baseObject storeTileRenderPipelineDescriptor:v6];
  return (char)baseObject;
}

- (BOOL)storeRenderPipelineDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLBinaryArchive_storeRenderPipelineDescriptor", (uint64_t)"Binary Linking", 0, 0);
  baseObject = self->_baseObject;
  v6 = unwrapMTLRenderPipelineDescriptor(v4);

  LOBYTE(baseObject) = [(MTLBinaryArchiveSPI *)baseObject storeRenderPipelineDescriptor:v6];
  return (char)baseObject;
}

- (BOOL)storeMeshRenderPipelineDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLBinaryArchive_storeMeshRenderPipelineDescriptor", (uint64_t)"Mesh Shaders with Binary Archives", 0, 0);
  baseObject = self->_baseObject;
  v6 = unwrapMTLMeshRenderPipelineDescriptor(v4);

  LOBYTE(baseObject) = [(MTLBinaryArchiveSPI *)baseObject storeMeshRenderPipelineDescriptor:v6];
  return (char)baseObject;
}

- (BOOL)storeComputePipelineDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLBinaryArchive_storeComputePipelineDescriptor", (uint64_t)"Binary Linking", 0, 0);
  baseObject = self->_baseObject;
  v6 = unwrapMTLComputePipelineDescriptor(v4);

  LOBYTE(baseObject) = [(MTLBinaryArchiveSPI *)baseObject storeComputePipelineDescriptor:v6];
  return (char)baseObject;
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLBinaryArchive_serializeToURL_options_error", (uint64_t)"Binary Archives SPI", 0, 0);
  LOBYTE(a5) = [(MTLBinaryArchiveSPI *)self->_baseObject serializeToURL:v8 options:a4 error:a5];

  return (char)a5;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  return [(MTLBinaryArchiveSPI *)self->_baseObject serializeToURL:a3 error:a4];
}

- (MTLPipelineCollection)pipelineCollection
{
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLBinaryArchive_pipelineCollection", (uint64_t)"Binary Linking", 0, 0);
  baseObject = self->_baseObject;

  return (MTLPipelineCollection *)[(MTLBinaryArchiveSPI *)baseObject pipelineCollection];
}

- (id)formattedDescription:(unint64_t)a3
{
  return [(MTLBinaryArchiveSPI *)self->_baseObject formattedDescription:a3];
}

- (BOOL)enumerateArchivesFromPipelineCollection:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLBinaryArchive_enumerateArchivesFromPipelineCollection", (uint64_t)"Binary Linking", 0, 0);
  LOBYTE(self) = [(MTLBinaryArchiveSPI *)self->_baseObject enumerateArchivesFromPipelineCollection:v4];

  return (char)self;
}

- (BOOL)enumerateArchivesFromBackingFile:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLBinaryArchive_enumerateArchivesFromBackingFile", (uint64_t)"Binary Linking", 0, 0);
  LOBYTE(self) = [(MTLBinaryArchiveSPI *)self->_baseObject enumerateArchivesFromBackingFile:v4];

  return (char)self;
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -15685;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  id v8 = [(CaptureMTLBinaryArchive *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLBinaryArchive;
  [(CaptureMTLBinaryArchive *)&v12 dealloc];
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLBinaryArchive_addTileRenderPipelineFunctionsWithDescriptor_options_error", (uint64_t)"Binary Archives SPI", 0, 0);
  baseObject = self->_baseObject;
  uint64_t v10 = unwrapMTLTileRenderPipelineDescriptor(v8);

  LOBYTE(a5) = [(MTLBinaryArchiveSPI *)baseObject addTileRenderPipelineFunctionsWithDescriptor:v10 options:a4 error:a5];
  return (char)a5;
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  id v7 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  v9 = unwrapMTLTileRenderPipelineDescriptor(v7);
  unsigned int v10 = -[MTLBinaryArchiveSPI addTileRenderPipelineFunctionsWithDescriptor:error:](baseObject, "addTileRenderPipelineFunctionsWithDescriptor:error:", v9, a4, (void)v23);

  uint64_t v11 = v24;
  *(_DWORD *)(v24 + 8) = -15664;
  char v12 = BYTE9(v25);
  if (BYTE9(v25) > 0x28uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v15 = BYTE10(v25);
    ++BYTE10(v25);
    long long v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v24 + 1), v15 | 0x1800000000) + 16;
    char v12 = v15;
  }
  else
  {
    long long v13 = (char *)(v11 + BYTE9(v25));
    BYTE9(v25) += 24;
  }
  *(unsigned char *)(v11 + 13) = v12;
  v16 = [(CaptureMTLBinaryArchive *)self traceStream];
  if (!v16)
  {
    unint64_t var0 = 0;
    if (a4) {
      goto LABEL_6;
    }
LABEL_8:
    id v18 = 0;
    goto LABEL_9;
  }
  unint64_t var0 = v16->var0;
  if (!a4) {
    goto LABEL_8;
  }
LABEL_6:
  id v18 = *a4;
LABEL_9:
  char v19 = SaveMTLTileRenderPipelineDescriptor((uint64_t)&v23, v7);

  *(void *)long long v13 = var0;
  *((void *)v13 + 1) = v18;
  *((_DWORD *)v13 + 4) = v10;
  v13[20] = v19;
  *(_WORD *)(v13 + 21) = 0;
  v13[23] = 0;
  s();
  *(void *)uint64_t v20 = v21;
  *(unsigned char *)(v20 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
  return v10;
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLBinaryArchive_addRenderPipelineFunctionsWithDescriptor_options_error", (uint64_t)"Binary Archives SPI", 0, 0);
  baseObject = self->_baseObject;
  unsigned int v10 = unwrapMTLRenderPipelineDescriptor(v8);

  LOBYTE(a5) = [(MTLBinaryArchiveSPI *)baseObject addRenderPipelineFunctionsWithDescriptor:v10 options:a4 error:a5];
  return (char)a5;
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  id v7 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  v9 = unwrapMTLRenderPipelineDescriptor(v7);
  unsigned int v10 = -[MTLBinaryArchiveSPI addRenderPipelineFunctionsWithDescriptor:error:](baseObject, "addRenderPipelineFunctionsWithDescriptor:error:", v9, a4, (void)v23);

  uint64_t v11 = v24;
  *(_DWORD *)(v24 + 8) = -15665;
  char v12 = BYTE9(v25);
  if (BYTE9(v25) > 0x28uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v15 = BYTE10(v25);
    ++BYTE10(v25);
    long long v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v24 + 1), v15 | 0x1800000000) + 16;
    char v12 = v15;
  }
  else
  {
    long long v13 = (char *)(v11 + BYTE9(v25));
    BYTE9(v25) += 24;
  }
  *(unsigned char *)(v11 + 13) = v12;
  v16 = [(CaptureMTLBinaryArchive *)self traceStream];
  if (!v16)
  {
    unint64_t var0 = 0;
    if (a4) {
      goto LABEL_6;
    }
LABEL_8:
    id v18 = 0;
    goto LABEL_9;
  }
  unint64_t var0 = v16->var0;
  if (!a4) {
    goto LABEL_8;
  }
LABEL_6:
  id v18 = *a4;
LABEL_9:
  char v19 = SaveMTLRenderPipelineDescriptor((uint64_t)&v23, v7);

  *(void *)long long v13 = var0;
  *((void *)v13 + 1) = v18;
  *((_DWORD *)v13 + 4) = v10;
  v13[20] = v19;
  *(_WORD *)(v13 + 21) = 0;
  v13[23] = 0;
  s();
  *(void *)uint64_t v20 = v21;
  *(unsigned char *)(v20 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
  return v10;
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLBinaryArchive_addMeshRenderPipelineFunctionsWithDescriptor_options_error", (uint64_t)"Mesh Shaders with Binary Archives", 0, 0);
  baseObject = self->_baseObject;
  unsigned int v10 = unwrapMTLMeshRenderPipelineDescriptor(v8);

  LOBYTE(a5) = [(MTLBinaryArchiveSPI *)baseObject addMeshRenderPipelineFunctionsWithDescriptor:v10 options:a4 error:a5];
  return (char)a5;
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLBinaryArchive_addMeshRenderPipelineFunctionsWithDescriptor_error", (uint64_t)"Mesh Shaders with Binary Archives", 0, 0);
  baseObject = self->_baseObject;
  id v8 = unwrapMTLMeshRenderPipelineDescriptor(v6);

  LOBYTE(a4) = [(MTLBinaryArchiveSPI *)baseObject addMeshRenderPipelineFunctionsWithDescriptor:v8 error:a4];
  return (char)a4;
}

- (BOOL)addLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  id v7 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  v9 = unwrapMTLStitchedLibraryDescriptor(v7);
  unsigned int v10 = -[MTLBinaryArchiveSPI addLibraryWithDescriptor:error:](baseObject, "addLibraryWithDescriptor:error:", v9, a4, (void)v23);

  uint64_t v11 = v24;
  *(_DWORD *)(v24 + 8) = -15426;
  char v12 = BYTE9(v25);
  if (BYTE9(v25) > 0x28uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v15 = BYTE10(v25);
    ++BYTE10(v25);
    long long v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v24 + 1), v15 | 0x1800000000) + 16;
    char v12 = v15;
  }
  else
  {
    long long v13 = (char *)(v11 + BYTE9(v25));
    BYTE9(v25) += 24;
  }
  *(unsigned char *)(v11 + 13) = v12;
  v16 = [(CaptureMTLBinaryArchive *)self traceStream];
  if (!v16)
  {
    unint64_t var0 = 0;
    if (a4) {
      goto LABEL_6;
    }
LABEL_8:
    id v18 = 0;
    goto LABEL_9;
  }
  unint64_t var0 = v16->var0;
  if (!a4) {
    goto LABEL_8;
  }
LABEL_6:
  id v18 = *a4;
LABEL_9:
  char v19 = SaveMTLStitchedLibraryDescriptor((uint64_t)&v23, v7);

  *(void *)long long v13 = var0;
  *((void *)v13 + 1) = v18;
  *((_DWORD *)v13 + 4) = v10;
  v13[20] = v19;
  *(_WORD *)(v13 + 21) = 0;
  v13[23] = 0;
  s();
  *(void *)uint64_t v20 = v21;
  *(unsigned char *)(v20 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
  return v10;
}

- (BOOL)addFunctionWithDescriptor:(id)a3 library:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLBinaryArchive_addFunctionWithDescriptor_library_error", (uint64_t)"Binary Linking", 0, 0);
  baseObject = self->_baseObject;
  uint64_t v11 = unwrapMTLFunctionDescriptor(v9);

  char v12 = [v8 baseObject];

  LOBYTE(a5) = [(MTLBinaryArchiveSPI *)baseObject addFunctionWithDescriptor:v11 library:v12 error:a5];
  return (char)a5;
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLBinaryArchive_addComputePipelineFunctionsWithDescriptor_options_error", (uint64_t)"Binary Archives SPI", 0, 0);
  baseObject = self->_baseObject;
  unsigned int v10 = unwrapMTLComputePipelineDescriptor(v8);

  LOBYTE(a5) = [(MTLBinaryArchiveSPI *)baseObject addComputePipelineFunctionsWithDescriptor:v10 options:a4 error:a5];
  return (char)a5;
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  id v7 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  id v9 = unwrapMTLComputePipelineDescriptor(v7);
  unsigned int v10 = -[MTLBinaryArchiveSPI addComputePipelineFunctionsWithDescriptor:error:](baseObject, "addComputePipelineFunctionsWithDescriptor:error:", v9, a4, (void)v23);

  uint64_t v11 = v24;
  *(_DWORD *)(v24 + 8) = -15666;
  char v12 = BYTE9(v25);
  if (BYTE9(v25) > 0x28uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v15 = BYTE10(v25);
    ++BYTE10(v25);
    long long v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v24 + 1), v15 | 0x1800000000) + 16;
    char v12 = v15;
  }
  else
  {
    long long v13 = (char *)(v11 + BYTE9(v25));
    BYTE9(v25) += 24;
  }
  *(unsigned char *)(v11 + 13) = v12;
  v16 = [(CaptureMTLBinaryArchive *)self traceStream];
  if (!v16)
  {
    unint64_t var0 = 0;
    if (a4) {
      goto LABEL_6;
    }
LABEL_8:
    id v18 = 0;
    goto LABEL_9;
  }
  unint64_t var0 = v16->var0;
  if (!a4) {
    goto LABEL_8;
  }
LABEL_6:
  id v18 = *a4;
LABEL_9:
  char v19 = SaveMTLComputePipelineDescriptor((uint64_t)&v23, v7);

  *(void *)long long v13 = var0;
  *((void *)v13 + 1) = v18;
  *((_DWORD *)v13 + 4) = v10;
  v13[20] = v19;
  *(_WORD *)(v13 + 21) = 0;
  v13[23] = 0;
  s();
  *(void *)uint64_t v20 = v21;
  *(unsigned char *)(v20 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
  return v10;
}

- (unint64_t)options
{
  return (unint64_t)[(MTLBinaryArchiveSPI *)self->_baseObject options];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLBinaryArchiveSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15668;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    id v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    id v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  unsigned int v10 = [(CaptureMTLBinaryArchive *)self traceStream];
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
  *(void *)id v7 = var0;
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
  return (NSString *)[(MTLBinaryArchiveSPI *)self->_baseObject label];
}

- (NSArray)keys
{
  return (NSArray *)[(MTLBinaryArchiveSPI *)self->_baseObject keys];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLBinaryArchiveSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLBinaryArchive;
  uint64_t v3 = [(CaptureMTLBinaryArchive *)&v7 description];
  id v4 = [(MTLBinaryArchiveSPI *)self->_baseObject description];
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

- (MTLBinaryArchive)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLBinaryArchive)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLBinaryArchive;
  uint64_t v9 = [(CaptureMTLBinaryArchive *)&v14 init];
  unsigned int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    id v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);
  }
  return v10;
}

@end